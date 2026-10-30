import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/id_status.dart';

/// Why [BeneficiaryIdAllocator.resolve] kept or changed an identifier.
enum BeneficiaryIdOutcome {
  /// The requested pool ID is still free and owned by this user: kept.
  kept,

  /// The requested pool ID was stale (already used, owned by another user, or
  /// already taken earlier in the same save) and was replaced by a free one.
  reallocated,

  /// The identifier was DEFAULT (a device UUID) and a free pool ID existed,
  /// so the pool ID replaced it.
  upgradedFromDefault,

  /// The requested pool ID was stale and no free pool ID was left, so a DEFAULT
  /// UUID replaced it. A lost pool ID is preferred over a duplicate one.
  downgradedToDefault,

  /// The identifier is not backed by the local pool (no row for it), or it is
  /// a DEFAULT identifier and the pool is empty. Left unchanged.
  untouched,
}

/// The decision for one identifier.
class BeneficiaryIdDecision {
  const BeneficiaryIdDecision({
    required this.identifier,
    required this.outcome,
    this.poolRow,
    this.previousId,
  });

  /// The identifier to save. Same instance as the input when [outcome] is
  /// [BeneficiaryIdOutcome.kept] or [BeneficiaryIdOutcome.untouched].
  final IdentifierModel identifier;

  final BeneficiaryIdOutcome outcome;

  /// The pool row now owned by [identifier], to be marked ASSIGNED; null when
  /// no pool row is involved.
  final UniqueIdPoolModel? poolRow;

  /// The identifier value before the decision, for logging.
  final String? previousId;

  bool get changed =>
      outcome == BeneficiaryIdOutcome.reallocated ||
      outcome == BeneficiaryIdOutcome.upgradedFromDefault ||
      outcome == BeneficiaryIdOutcome.downgradedToDefault;
}

/// Gives a beneficiary its pool ID at save time, from the database.
///
/// The search screen reads the "next free ID" from per-screen state when the
/// user taps Register. That value can be stale: the screen is reused after a
/// registration (the same ID is offered twice), a newer screen instance can
/// lend its ID to an older one, and a re-download can mark used IDs free again.
/// This class re-checks the requested ID against the local pool when the
/// record is saved and replaces it when it is no longer safe to use.
///
/// One instance covers one save: IDs it hands out are remembered so that two
/// individuals saved together never get the same ID.
class BeneficiaryIdAllocator {
  BeneficiaryIdAllocator({
    required this.repository,
    required this.userUuid,
    required this.newDefaultId,
    this.uniqueIdType = 'UNIQUE_BENEFICIARY_ID',
    this.defaultIdType = 'DEFAULT',
    this.upgradeDefault = true,
  });

  final LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel> repository;

  /// The logged-in user. Pool IDs are only handed out from this user's rows.
  /// When null or empty, ownership cannot be checked and no new pool ID is
  /// handed out (a requested free ID is still accepted).
  final String? userUuid;

  /// Produces a fresh DEFAULT identifier value (a v1 UUID in the app).
  final String Function() newDefaultId;

  final String uniqueIdType;
  final String defaultIdType;

  /// When true, a DEFAULT identifier is replaced by a free pool ID if one
  /// exists for this user.
  final bool upgradeDefault;

  final Set<String> _claimed = <String>{};

  static final String _unAssigned = IdStatus.unAssigned.toValue();

  bool get _hasUser => userUuid != null && userUuid!.isNotEmpty;

  /// Decides which identifier [identifier] should be saved with.
  Future<BeneficiaryIdDecision> resolve(IdentifierModel identifier) async {
    final type = identifier.identifierType;
    final requestedId = identifier.identifierId;

    if (type == uniqueIdType &&
        requestedId != null &&
        requestedId.isNotEmpty) {
      final row = await _rowById(requestedId);
      if (row == null) {
        return BeneficiaryIdDecision(
          identifier: identifier,
          outcome: BeneficiaryIdOutcome.untouched,
          previousId: requestedId,
        );
      }

      if (_isUsable(row)) {
        _claimed.add(row.id);
        return BeneficiaryIdDecision(
          identifier: identifier,
          outcome: BeneficiaryIdOutcome.kept,
          poolRow: row,
          previousId: requestedId,
        );
      }

      final free = await _nextFree();
      if (free != null) {
        _claimed.add(free.id);
        return BeneficiaryIdDecision(
          identifier: identifier.copyWith(identifierId: free.id),
          outcome: BeneficiaryIdOutcome.reallocated,
          poolRow: free,
          previousId: requestedId,
        );
      }

      return BeneficiaryIdDecision(
        identifier: identifier.copyWith(
          identifierType: defaultIdType,
          identifierId: newDefaultId(),
        ),
        outcome: BeneficiaryIdOutcome.downgradedToDefault,
        previousId: requestedId,
      );
    }

    if (upgradeDefault && type == defaultIdType) {
      final free = await _nextFree();
      if (free != null) {
        _claimed.add(free.id);
        return BeneficiaryIdDecision(
          identifier: identifier.copyWith(
            identifierType: uniqueIdType,
            identifierId: free.id,
          ),
          outcome: BeneficiaryIdOutcome.upgradedFromDefault,
          poolRow: free,
          previousId: requestedId,
        );
      }
    }

    return BeneficiaryIdDecision(
      identifier: identifier,
      outcome: BeneficiaryIdOutcome.untouched,
      previousId: requestedId,
    );
  }

  bool _isUsable(UniqueIdPoolModel row) {
    if (row.status != _unAssigned) return false;
    if (_claimed.contains(row.id)) return false;
    if (_hasUser && row.userUuid != null && row.userUuid != userUuid) {
      return false;
    }
    return true;
  }

  Future<UniqueIdPoolModel?> _rowById(String id) async {
    final rows = await repository.search(UniqueIdPoolSearchModel(id: id));
    return rows.isEmpty ? null : rows.first;
  }

  /// The oldest free row of this user that is not yet claimed in this save.
  /// Same order as the search screen's loader (oldest created first).
  Future<UniqueIdPoolModel?> _nextFree() async {
    if (!_hasUser) return null;
    final rows = await repository.search(UniqueIdPoolSearchModel(
      status: _unAssigned,
      userUuid: userUuid,
    ));
    final candidates = rows.where((r) => !_claimed.contains(r.id)).toList()
      ..sort((a, b) {
        final byTime = (a.auditDetails?.createdTime ?? 0)
            .compareTo(b.auditDetails?.createdTime ?? 0);
        return byTime != 0 ? byTime : a.id.compareTo(b.id);
      });
    return candidates.isEmpty ? null : candidates.first;
  }
}

/// Keeps rows that are already ASSIGNED on this device ASSIGNED when a
/// re-download returns them as free.
///
/// The server only learns that an ID is used once the record carrying it
/// syncs. A re-download before that returns the used ID as DISPATCHED, which
/// the remote repository maps to UN_ASSIGNED; written with insert-or-replace,
/// it would make the used ID free again on this device.
List<UniqueIdPoolModel> keepLocallyAssigned(
  List<UniqueIdPoolModel> downloaded,
  Set<String> locallyAssignedIds,
) {
  if (locallyAssignedIds.isEmpty) return downloaded;
  final assigned = IdStatus.assigned.toValue();
  return downloaded
      .map((row) => locallyAssignedIds.contains(row.id) && row.status != assigned
          ? row.copyWith(status: assigned)
          : row)
      .toList();
}

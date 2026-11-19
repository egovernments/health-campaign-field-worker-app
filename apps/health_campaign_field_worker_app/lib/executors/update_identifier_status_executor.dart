import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/id_status.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/action_handler/executors/action_executor.dart';
import 'package:digit_flow_builder/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/beneficiary_id_allocator.dart';

/// UPDATE_IDENTIFIER_STATUS runs between FETCH_TRANSFORMER_CONFIG and
/// CREATE_EVENT when a beneficiary is registered.
///
/// It decides the beneficiary ID at save time from the local pool, not from
/// the value the search screen held when Register was tapped:
/// - a requested pool ID is kept only if it is still UN_ASSIGNED, owned by the
///   logged-in user and not already given to another individual in this save;
/// - otherwise the oldest free pool ID of this user replaces it, or a DEFAULT
///   UUID when the pool is empty (never a duplicate);
/// - a DEFAULT identifier is replaced by a free pool ID when one exists
///   (disable with `"upgradeDefault": false`).
///
/// With `"mode": "edit"` (in the edit branches, before UPDATE_EVENT) an ID
/// that is already ASSIGNED and owned by this user is kept, because the
/// beneficiary being edited already carries it; a DEFAULT identifier is still
/// upgraded, so an edit can give a pool ID to a person registered without one.
///
/// The pool rows it hands out are marked ASSIGNED, and the corrected
/// individuals replace the originals in `contextData['entities']`, so the
/// following CREATE_EVENT saves the identifier that was actually allocated.
class UpdateIdentifierStatusExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'UPDATE_IDENTIFIER_STATUS';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final identifierType = action.properties['identifierType'] as String? ??
        'UNIQUE_BENEFICIARY_ID';
    final upgradeDefault = action.properties['upgradeDefault'] as bool? ?? true;
    final isEdit = action.properties['mode'] == 'edit';

    final entities = contextData['entities'] as List<dynamic>?;
    if (entities == null || entities.isEmpty) {
      debugPrint('UPDATE_IDENTIFIER_STATUS: no entities in contextData');
      return contextData;
    }
    if (!entities.any((e) => e is IndividualModel)) {
      debugPrint('UPDATE_IDENTIFIER_STATUS: no IndividualModel entities');
      return contextData;
    }

    final LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel>
        repository;
    try {
      repository = context
          .read<LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel>>();
    } catch (e) {
      debugPrint('UPDATE_IDENTIFIER_STATUS: pool repository unavailable: $e');
      return contextData;
    }

    final currentUserUuid = FlowBuilderSingleton().loggedInUserUuid;

    // Resolve and mark ASSIGNED as one step, so a concurrent save can't be
    // handed the same free row in between.
    return BeneficiaryIdAllocator.runExclusive(() => _allocate(
          entities: entities,
          contextData: contextData,
          repository: repository,
          currentUserUuid: currentUserUuid,
          identifierType: identifierType,
          upgradeDefault: upgradeDefault,
          isEdit: isEdit,
        ));
  }

  Future<Map<String, dynamic>> _allocate({
    required List<dynamic> entities,
    required Map<String, dynamic> contextData,
    required LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel>
        repository,
    required String? currentUserUuid,
    required String identifierType,
    required bool upgradeDefault,
    required bool isEdit,
  }) async {
    final allocator = BeneficiaryIdAllocator(
      repository: repository,
      userUuid: currentUserUuid,
      newDefaultId: () => IdGen.instance.identifier,
      uniqueIdType: identifierType,
      upgradeDefault: upgradeDefault,
      keepOwnAssigned: isEdit,
    );

    final rowsToAssign = <UniqueIdPoolModel>[];
    final updatedEntities = <dynamic>[];
    var anyChanged = false;

    for (final entity in entities) {
      if (entity is! IndividualModel ||
          entity.identifiers == null ||
          entity.identifiers!.isEmpty) {
        updatedEntities.add(entity);
        continue;
      }

      final newIdentifiers = <IdentifierModel>[];
      var individualChanged = false;
      for (final identifier in entity.identifiers!) {
        final BeneficiaryIdDecision decision;
        try {
          decision = await allocator.resolve(identifier);
        } catch (e) {
          debugPrint('UPDATE_IDENTIFIER_STATUS: could not check '
              '${identifier.identifierId}: $e');
          newIdentifiers.add(identifier);
          continue;
        }

        if (decision.poolRow != null) rowsToAssign.add(decision.poolRow!);
        if (decision.changed) {
          individualChanged = true;
          debugPrint('UPDATE_IDENTIFIER_STATUS: ${decision.outcome.name} '
              'individual=${entity.clientReferenceId} '
              '${decision.previousId} -> ${decision.identifier.identifierId}');
        }
        newIdentifiers.add(decision.identifier);
      }

      if (individualChanged) {
        anyChanged = true;
        updatedEntities.add(entity.copyWith(identifiers: newIdentifiers));
      } else {
        updatedEntities.add(entity);
      }
    }

    if (rowsToAssign.isNotEmpty) {
      final unmarked =
          await _markAssigned(repository, rowsToAssign, currentUserUuid ?? '');
      // A row that could not be marked ASSIGNED stays free in the pool and
      // would be handed out again. Don't save it on this individual: a lost
      // pool ID is preferred over a duplicate one.
      if (unmarked.isNotEmpty) {
        for (var i = 0; i < updatedEntities.length; i++) {
          final entity = updatedEntities[i];
          if (entity is! IndividualModel) continue;
          final identifiers = entity.identifiers ?? const <IdentifierModel>[];
          if (!identifiers.any((id) => _usesRow(id, identifierType, unmarked))) {
            continue;
          }
          anyChanged = true;
          updatedEntities[i] = entity.copyWith(
            identifiers: identifiers.map((id) {
              if (!_usesRow(id, identifierType, unmarked)) return id;
              final replacement = id.copyWith(
                identifierType: 'DEFAULT',
                identifierId: IdGen.instance.identifier,
              );
              debugPrint('UPDATE_IDENTIFIER_STATUS: downgradedToDefault '
                  'individual=${entity.clientReferenceId} '
                  '${id.identifierId} -> ${replacement.identifierId} '
                  '(pool row not marked ASSIGNED)');
              return replacement;
            }).toList(),
          );
        }
      }
    }

    if (!anyChanged) return contextData;
    return {...contextData, 'entities': updatedEntities};
  }

  static bool _usesRow(
    IdentifierModel identifier,
    String identifierType,
    Set<String> rowIds,
  ) =>
      identifier.identifierType == identifierType &&
      rowIds.contains(identifier.identifierId);

  /// Marks [rows] ASSIGNED and returns the ids of the rows that failed.
  Future<Set<String>> _markAssigned(
    LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel> repository,
    List<UniqueIdPoolModel> rows,
    String currentUserUuid,
  ) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final failed = <String>{};
    for (final row in rows) {
      final clientAudit = row.clientAuditDetails != null
          ? row.clientAuditDetails!.copyWith(
              lastModifiedBy: currentUserUuid,
              lastModifiedTime: now,
            )
          : ClientAuditDetails(
              createdBy: row.auditDetails?.createdBy ?? currentUserUuid,
              createdTime: row.auditDetails?.createdTime ?? now,
              lastModifiedBy: currentUserUuid,
              lastModifiedTime: now,
            );
      try {
        await repository.update(row.copyWith(
          status: IdStatus.assigned.toValue(),
          clientAuditDetails: clientAudit,
        ));
      } catch (e) {
        debugPrint('UPDATE_IDENTIFIER_STATUS: could not mark ${row.id} '
            'ASSIGNED: $e');
        failed.add(row.id);
      }
    }
    return failed;
  }
}

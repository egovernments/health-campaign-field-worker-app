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
      await _markAssigned(repository, rowsToAssign, currentUserUuid ?? '');
    }

    if (!anyChanged) return contextData;
    return {...contextData, 'entities': updatedEntities};
  }

  Future<void> _markAssigned(
    LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel> repository,
    List<UniqueIdPoolModel> rows,
    String currentUserUuid,
  ) async {
    final now = DateTime.now().millisecondsSinceEpoch;
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
      }
    }
  }
}

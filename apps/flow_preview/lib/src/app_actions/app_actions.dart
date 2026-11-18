// Action types the field worker app registers itself (apps/
// health_campaign_field_worker_app/lib/app.dart and pages/home.dart), so
// flows that use them behave the same way in the preview.
//
// - LOAD_UNIQUE_ID_POOL / UPDATE_IDENTIFIER_STATUS: same logic as the app's
//   executors (lib/executors/), against the real UniqueIdPool repository,
//   which the preview fills with invented IDs (seedUniqueIdPool).
// - CHECK_ELIGIBILITY_AND_NAVIGATE: the app's executor, copied unchanged.
// - UPDATE_STOCK_BALANCE: skipped. The app's version keeps a running stock
//   balance through transit_post; stock records themselves are still saved
//   by CREATE_EVENT.
// - NAVIGATE_TO_BENEFICIARY_ID_DOWN_SYNC: shows a note; downloading IDs
//   from a server is not part of the preview.
import 'package:digit_data_model/data/repositories/package_repository/local/unique_id_pool.dart';
import 'package:digit_data_model/data/repositories/package_repository/oplog/oplog.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/id_status.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/action_handler/action_executor_registry.dart';
import 'package:digit_flow_builder/action_handler/executors/action_executor.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:digit_flow_builder/utils/utils.dart';
import 'package:digit_flow_builder/widget_registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

import '../session.dart';
import 'eligibility_navigation_executor.dart';

/// Registers the stand-ins. Call once at start-up.
void registerAppActions() {
  final registry = ActionExecutorRegistry();
  registry.register('LOAD_UNIQUE_ID_POOL', _LoadUniqueIdPoolExecutor());
  registry.register(
      'UPDATE_IDENTIFIER_STATUS', _UpdateIdentifierStatusExecutor());
  registry.register(
      'CHECK_ELIGIBILITY_AND_NAVIGATE', EligibilityNavigationExecutor());
  registry.register('UPDATE_STOCK_BALANCE',
      _NoteExecutor('UPDATE_STOCK_BALANCE', null));
  registry.register(
      'NAVIGATE_TO_BENEFICIARY_ID_DOWN_SYNC',
      _NoteExecutor('NAVIGATE_TO_BENEFICIARY_ID_DOWN_SYNC',
          'Downloading beneficiary IDs is not part of the preview; it already has sample IDs.'));
}

/// Invented IDs for the "Unique beneficiary id" option. Clearly fake.
const previewIdPoolSize = 25;

/// Gives [userUuid] (default: the sample user) invented IDs. Called again
/// after a real sign-in, because the app only offers the user's own IDs.
/// The prefix keeps IDs unique when several users get a pool.
Future<void> seedUniqueIdPool(
  LocalSqlDataStore sql, {
  String userUuid = PreviewSession.userUuid,
  String tenantId = PreviewSession.tenantId,
  String prefix = 'PREVIEW',
}) async {
  final repo = _idPoolRepository(sql);
  final existing = await repo.search(UniqueIdPoolSearchModel(userUuid: userUuid));
  if (existing.isNotEmpty) return;
  final now = DateTime.now().millisecondsSinceEpoch;
  for (var i = 1; i <= previewIdPoolSize; i++) {
    await repo.create(
      UniqueIdPoolModel(
        id: '$prefix-${i.toString().padLeft(6, '0')}',
        status: IdStatus.unAssigned.toValue(),
        deviceUuid: 'preview-device',
        userUuid: userUuid,
        tenantId: tenantId,
        // Oldest first: the app offers the earliest-created ID.
        auditDetails: AuditDetails(createdBy: userUuid, createdTime: now + i),
        clientAuditDetails:
            ClientAuditDetails(createdBy: userUuid, createdTime: now + i),
      ),
      createOpLog: false,
    );
  }
}

/// The repository the app provides for the ID pool; also provided to the
/// widget tree by PreviewRepositories.
LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel> idPoolRepository(
        LocalSqlDataStore sql, Isar isar) =>
    UniqueIdPoolLocalRepository(sql, UniqueIdOpLogManager(isar));

LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel> _idPoolRepository(
        LocalSqlDataStore sql) =>
    idPoolRepository(sql, _NoIsar());

class _NoIsar implements Isar {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnsupportedError('Isar is not available in the browser preview.');
}

/// Same as the app's LoadUniqueIdPoolExecutor: count unassigned IDs for the
/// user and expose the oldest as latestBeneficiaryId(Model).
class _LoadUniqueIdPoolExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'LOAD_UNIQUE_ID_POOL';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final compositeKey = CrudItemContext.of(context)?.compositeKey ??
        getEffectiveCompositeKey(context, contextData);
    if (compositeKey == null) return contextData;
    try {
      final repository = context
          .read<LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel>>();
      final available = List<UniqueIdPoolModel>.from(await repository.search(
        UniqueIdPoolSearchModel(
          status: IdStatus.unAssigned.toValue(),
          userUuid: FlowBuilderSingleton().loggedInUserUuid,
        ),
      ))
        ..sort((a, b) => (a.auditDetails?.createdTime ?? 0)
            .compareTo(b.auditDetails?.createdTime ?? 0));
      final latest = available.isEmpty ? null : available.first;

      final state = FlowCrudStateRegistry().get(compositeKey);
      final widgetData = Map<String, dynamic>.from(state?.widgetData ?? {})
        ..['uniqueIdPoolCount'] = available.length
        ..['latestBeneficiaryIdModel'] = latest
        ..['latestBeneficiaryId'] = latest?.id;
      FlowCrudStateRegistry().update(
        compositeKey,
        state != null
            ? state.copyWith(widgetData: widgetData)
            : FlowCrudState(widgetData: widgetData),
      );
      return {
        ...contextData,
        'uniqueIdPoolCount': available.length,
        'latestBeneficiaryId': latest?.id,
        'latestBeneficiaryIdModel': latest,
      };
    } catch (e) {
      debugPrint('LOAD_UNIQUE_ID_POOL (preview): $e');
      return contextData;
    }
  }
}

/// Same as the app's UpdateIdentifierStatusExecutor: mark the pool IDs used
/// by the individuals just saved as ASSIGNED.
class _UpdateIdentifierStatusExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'UPDATE_IDENTIFIER_STATUS';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final identifierType =
        action.properties['identifierType'] as String? ?? 'UNIQUE_BENEFICIARY_ID';
    final entities = contextData['entities'];
    if (entities is! List) return contextData;
    final ids = [
      for (final individual in entities.whereType<IndividualModel>())
        for (final id in individual.identifiers ?? <IdentifierModel>[])
          if (id.identifierType == identifierType &&
              (id.identifierId ?? '').isNotEmpty)
            id.identifierId!,
    ];
    if (ids.isEmpty) return contextData;
    try {
      final repository = context
          .read<LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel>>();
      final now = DateTime.now().millisecondsSinceEpoch;
      final user = FlowBuilderSingleton().loggedInUserUuid ?? '';
      for (final id in ids) {
        final found = await repository.search(UniqueIdPoolSearchModel(id: id));
        if (found.isEmpty) continue;
        final model = found.first;
        await repository.update(model.copyWith(
          status: IdStatus.assigned.toValue(),
          clientAuditDetails: (model.clientAuditDetails ??
                  ClientAuditDetails(createdBy: user, createdTime: now))
              .copyWith(lastModifiedBy: user, lastModifiedTime: now),
        ));
      }
    } catch (e) {
      debugPrint('UPDATE_IDENTIFIER_STATUS (preview): $e');
    }
    return contextData;
  }
}

/// Skips an action that only makes sense in the field worker app, optionally
/// telling the user why.
class _NoteExecutor extends ActionExecutor {
  final String type;
  final String? message;

  _NoteExecutor(this.type, this.message);

  @override
  bool canHandle(String actionType) => actionType == type;

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    debugPrint('$type: skipped in the preview');
    final note = message;
    if (note != null && context.mounted) {
      ScaffoldMessenger.maybeOf(context)
          ?.showSnackBar(SnackBar(content: Text(note)));
    }
    return contextData;
  }
}

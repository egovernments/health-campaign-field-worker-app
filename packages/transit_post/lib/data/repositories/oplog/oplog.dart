import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:isar_community/isar.dart';
import 'package:collection/collection.dart';

class UserActionOpLogManager extends OpLogManager<UserActionModel> {
  UserActionOpLogManager(super.isar);

  @override
  UserActionModel applyServerGeneratedIdToEntity(
    UserActionModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      entity.copyWith(
        id: serverGeneratedId,
        rowVersion: rowVersion,
      );

  @override
  String getClientReferenceId(UserActionModel entity) {
    return entity.clientReferenceId;
  }

  @override
  String? getServerGeneratedId(UserActionModel entity) {
    return entity.id;
  }

  @override
  int? getRowVersion(UserActionModel entity) => entity.rowVersion;

  @override
  bool? getNonRecoverableError(UserActionModel entity) =>
      entity.nonRecoverableError;

  @override
  Future<List<OpLogEntry<UserActionModel>>> getPendingUpSync(
    DataModelType type, {
    required String createdBy,
  }) async {
    final createOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.create)
        .serverGeneratedIdIsNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAllSync();

    final singleCreateOpLogs = isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.singleCreate)
        .serverGeneratedIdIsNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAllSync();

    final singleUpdateOpLogs = isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.singleUpdate)
        .serverGeneratedIdIsNotNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAllSync();

    // Handle update operations with null serverGeneratedId by copying from create record
    final updateOpLogsWithNullServerId = isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.update)
        .serverGeneratedIdIsNull()
        .nonRecoverableErrorEqualTo(false)
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAllSync();

    final opLogsToUpdate = <OpLog>[];
    for (final updateOpLog in updateOpLogsWithNullServerId) {
      final createOpLog = isar.opLogs
          .filter()
          .clientReferenceIdEqualTo(updateOpLog.clientReferenceId)
          .operationEqualTo(DataOperation.create)
          .serverGeneratedIdIsNotNull()
          .findFirstSync();

      if (createOpLog != null && createOpLog.serverGeneratedId != null) {
        final entry = OpLogEntry.fromOpLog<UserActionModel>(updateOpLog);
        final updatedEntry = entry.copyWith(
          serverGeneratedId: createOpLog.serverGeneratedId,
          rowVersion: createOpLog.rowVersion,
        );
        opLogsToUpdate.add(updatedEntry.oplog);
      }
    }
    if (opLogsToUpdate.isNotEmpty) {
      isar.writeTxnSync(() {
        isar.opLogs.putAllSync(opLogsToUpdate);
      });
    }

    final updateOpLogs = isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.update)
        .serverGeneratedIdIsNotNull()
        .nonRecoverableErrorEqualTo(false)
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAllSync();

    final errorOpLogs = isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .syncedDownEqualTo(false)
        .nonRecoverableErrorEqualTo(true)
        .createdByEqualTo(createdBy)
        .findAllSync();

    final deleteOpLogs = isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.delete)
        .serverGeneratedIdIsNotNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAllSync();

    final nonRecoverableOpLogs = isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .syncedUpEqualTo(true)
        .syncedDownEqualTo(false)
        .nonRecoverableErrorEqualTo(false)
        .syncDownRetryCountGreaterThan(
          DigitDataModelSingleton().syncDownRetryCount - 1,
        )
        .createdByEqualTo(createdBy)
        .findAllSync();

    var entries = [
      createOpLogs,
      updateOpLogs,
      deleteOpLogs,
      singleCreateOpLogs,
      singleUpdateOpLogs,
      errorOpLogs,
      nonRecoverableOpLogs,
    ].expand((element) => element);

    entries = entries.sortedBy((element) => element.createdAt);

    final groupedEntries = entries.groupListsBy(
      (element) => element.clientReferenceId,
    );

    // Entries are sorted by createdAt ascending above, so .last is the most
    // recently written op for a given clientReferenceId. STOCK_BALANCE rows
    // reuse a stable balance-key clientReferenceId across corrections —
    // keeping .first would ship the oldest (stale) balance every sync until
    // the server acked it, dropping every newer correction in between.
    final entriesForUpSync = groupedEntries.entries
        .map<OpLog?>((entry) {
          if (entry.key == null) return null;
          if (entry.value.isEmpty) return null;

          return entry.value.last;
        })
        .whereNotNull()
        .toList();

    return entriesForUpSync
        .map((e) => OpLogEntry.fromOpLog<UserActionModel>(e))
        .toList();
  }
}

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:isar/isar.dart';

import '../../../data_model.dart';
import '../../../utils/app_exception.dart';

abstract class OpLogManager<T extends EntityModel> {
  final Isar isar;

  const OpLogManager(this.isar);

  Future<List<OpLogEntry<T>>> getPendingUpSync(
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
        .findAll();

    final singleCreateOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.singleCreate)
        .serverGeneratedIdIsNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAll();

    final updateOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.update)
        .serverGeneratedIdIsNotNull()
        .nonRecoverableErrorEqualTo(false)
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAll();

    final errorOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .syncedDownEqualTo(false)
        .nonRecoverableErrorEqualTo(true)
        .createdByEqualTo(createdBy)
        .findAll();

    final deleteOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .operationEqualTo(DataOperation.delete)
        .serverGeneratedIdIsNotNull()
        .syncedUpEqualTo(false)
        .syncedDownEqualTo(false)
        .createdByEqualTo(createdBy)
        .findAll();

    final nonRecoverableOpLogs = await isar.opLogs
        .filter()
        .entityTypeEqualTo(type)
        .syncedUpEqualTo(true)
        .syncedDownEqualTo(false)
        .nonRecoverableErrorEqualTo(false)
        .syncDownRetryCountGreaterThan(
          5 - 1,
        )
        .createdByEqualTo(createdBy)
        .findAll();

    var entries = [
      createOpLogs,
      updateOpLogs,
      deleteOpLogs,
      singleCreateOpLogs,
      errorOpLogs,
      nonRecoverableOpLogs,
    ].expand((element) => element);

    entries = entries.sortedBy((element) => element.createdAt);

    final groupedEntries = entries.groupListsBy(
      (element) => element.clientReferenceId,
    );

    final entriesForUpSync = groupedEntries.entries
        .map<OpLog?>((entry) {
          if (entry.key == null) return null;
          if (entry.value.isEmpty) return null;

          return entry.value.first;
        })
        .whereNotNull()
        .toList();

    return entriesForUpSync.map((e) => OpLogEntry.fromOpLog<T>(e)).toList();
  }

  Future<List<OpLogEntry<T>>> getPendingDownSync(
    DataModelType type, {
    required String createdBy,
  }) async {
    var oplogs = await isar.opLogs
        .filter()
        .syncedUpEqualTo(true)
        .syncDownRetryCountLessThan(5)
        .syncedDownEqualTo(false)
        .entityTypeEqualTo(type)
        .findAll();

    oplogs = oplogs
        .sortedBy((element) => element.createdAt)
        .where(
          (element) => element.entityType != DataModelType.service,
          // Added service so that we don't get the response from the server
        )
        .toList();

    return oplogs.map((e) => OpLogEntry.fromOpLog<T>(e)).toList();
  }

  Future<void> put(OpLogEntry<dynamic> entry) async {
    await isar.writeTxn(() async {
      await isar.opLogs.put(entry
          .copyWith(
            clientReferenceId: getClientReferenceId(entry.entity),
            serverGeneratedId: getServerGeneratedId(entry.entity),
            rowVersion: getRowVersion(entry.entity),
            nonRecoverableError: getNonRecoverableError(entry.entity),
          )
          .oplog);
    });

    return;
  }

  Future<void> markSyncUp({
    OpLogEntry<T>? entry,
    int? id,
    String? clientReferenceId,
    bool? nonRecoverableError,
  }) async {
    if (nonRecoverableError == true && id != null && entry != null) {
      final oplog = await isar.opLogs.filter().idEqualTo(id).findFirst();
      if (oplog == null) return;
      final OpLogEntry<T> fetchedEntry = OpLogEntry.fromOpLog<T>(oplog);
      await isar.writeTxn(() async {
        await isar.opLogs.put(fetchedEntry
            .copyWith(
              syncedUp: true,
              syncedDown: true,
              syncedDownOn: DateTime.now(),
              syncedUpOn: DateTime.now(),
            )
            .oplog);
      });
    } else if (entry != null) {
      await put(
        entry.copyWith(syncedUp: true, syncedUpOn: DateTime.now()),
      );
    } else if (id != null) {
      OpLog? oplog;

      oplog = await isar.opLogs.get(id);
      if (oplog == null) return;
      final OpLogEntry<T> fetchedEntry = OpLogEntry.fromOpLog<T>(oplog);

      await put(
        fetchedEntry.copyWith(
          syncedUp: true,
          syncedUpOn: DateTime.now(),
        ) as OpLogEntry<T>,
      );
    } else if (clientReferenceId != null) {
      final oplog = await isar.opLogs
          .filter()
          .clientReferenceIdEqualTo(clientReferenceId)
          .findFirst();

      if (oplog == null) return;

      final fetchedEntry = OpLogEntry.fromOpLog<T>(oplog);

      await put(
        fetchedEntry.copyWith(
          syncedUp: true,
          syncedUpOn: DateTime.now(),
        ) as OpLogEntry<T>,
      );
    } else {
      throw AppException('Invalid arguments');
    }

    return;
  }

  Future<void> updateServerGeneratedIds({
    required UpdateServerGeneratedIdModel model,
  }) async {
    final opLogs = await isar.opLogs
        .filter()
        .clientReferenceIdEqualTo(model.clientReferenceId)
        .findAll();

    for (final oplog in opLogs
        .where(
          (element) => element.entityType.name != DataModelType.service.name,
        )
        .toList()) {
      final entry = OpLogEntry.fromOpLog<T>(oplog);

      OpLogEntry updatedEntry = entry.copyWith(
        serverGeneratedId: model.serverGeneratedId,
        additionalIds: model.additionalIds,
        rowVersion: model.rowVersion,
        nonRecoverableError: model.nonRecoverableError,
      );

      if (entry.syncedUp) {
        updatedEntry = updatedEntry.copyWith(
          syncedDown: true,
          syncedDownOn: DateTime.now(),
        );
      }

      final updatedOplog = updatedEntry.oplog;

      await isar.writeTxn(() async {
        await isar.opLogs.put(updatedOplog);
      });
    }

    return;
  }

  Future<List<OpLogEntry<T>>> getEntries(
    String clientReferenceId,
    DataOperation operation,
  ) async {
    final oplog = await isar.opLogs
        .filter()
        .operationEqualTo(operation)
        .clientReferenceIdEqualTo(clientReferenceId)
        .findAll();

    if (oplog.isEmpty) {
      throw AppException('OpLog not found for id: $clientReferenceId');
    }

    return oplog.map((e) => OpLogEntry.fromOpLog<T>(e)).toList();
  }

  Future<List<OpLog>> getSyncDownRetryList(
    String clientReferenceId,
  ) async {
    final oplogs = await isar.opLogs
        .filter()
        .clientReferenceIdEqualTo(clientReferenceId)
        .findAll();

    return oplogs;
  }

  Future<bool> updateSyncDownRetry(
    String clientReferenceId,
  ) async {
    final oplogs = await isar.opLogs
        .filter()
        .clientReferenceIdEqualTo(clientReferenceId)
        .findAll();

    if (oplogs.isEmpty) {
      throw AppException('OpLog not found for id: $clientReferenceId');
    }
    bool markAsNonRecoverable = false;
    for (final oplog in oplogs) {
      final entry = OpLogEntry.fromOpLog<T>(oplog);
      final syncDownRetryCount =
          entry.syncDownRetryCount < 0 ? 0 : entry.syncDownRetryCount;
      OpLogEntry updatedEntry = entry.copyWith(
        syncDownRetryCount: syncDownRetryCount + 1,
      );
      if (updatedEntry.syncDownRetryCount >= 5) {
        markAsNonRecoverable = true;
        updatedEntry = updatedEntry.copyWith(nonRecoverableError: true);
      }

      await isar.writeTxn(() async {
        await isar.opLogs.put(updatedEntry.oplog);
      });
    }

    // [TODO] need to cross check only first records is failing

    if (oplogs.first.syncDownRetryCount == 1) {
      await Future.delayed(const Duration(seconds: 1));
    } else {
      await Future.delayed(Duration(
        seconds: 5 * oplogs.first.syncDownRetryCount,
      ));
    }

    return markAsNonRecoverable;
  }

  String? getServerGeneratedId(T entity);

  int? getRowVersion(T entity);

  String getClientReferenceId(T entity);

  bool? getNonRecoverableError(T entity);
  T applyServerGeneratedIdToEntity(
    T entity,
    String serverGeneratedId,
    int rowVersion,
  );
}

class UpdateServerGeneratedIdModel {
  final String clientReferenceId;
  final String serverGeneratedId;
  final DataOperation dataOperation;
  final List<AdditionalId>? additionalIds;
  final OpLogEntry? entry;
  final int? rowVersion;
  final bool? nonRecoverableError;

  const UpdateServerGeneratedIdModel({
    required this.clientReferenceId,
    required this.serverGeneratedId,
    required this.dataOperation,
    this.additionalIds,
    this.entry,
    this.rowVersion,
    this.nonRecoverableError,
  });
}

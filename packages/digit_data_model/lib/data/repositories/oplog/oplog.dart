import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
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
    final createOpLogs = isar.opLogs
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
    var oplogs = isar.opLogs
        .filter()
        .syncedUpEqualTo(true)
        .syncDownRetryCountLessThan(
            DigitDataModelSingleton().syncDownRetryCount)
        .syncedDownEqualTo(false)
        .entityTypeEqualTo(type)
        .findAllSync();

    var updateOplogs = isar.opLogs
        .filter()
        .syncedUpEqualTo(false)
        .operationEqualTo(DataOperation.update)
        .serverGeneratedIdIsNull()
        .syncDownRetryCountLessThan(
            DigitDataModelSingleton().syncDownRetryCount)
        .syncedDownEqualTo(false)
        .entityTypeEqualTo(type)
        .findAllSync();

    List<OpLog> retryOplog = [];

    if (updateOplogs.isNotEmpty) {
      for (OpLog updateLog in updateOplogs) {
        var clientRefId = updateLog.clientReferenceId;
        var createOplog = oplogs
            .where((element) =>
                element.clientReferenceId == clientRefId &&
                element.serverGeneratedId != null)
            .firstOrNull;
        if (createOplog != null) {
          retryOplog.add(updateLog);
        }
      }
    }

    oplogs.addAll(retryOplog);

    oplogs = oplogs
        .sortedBy((element) => element.createdAt)
        .where(
          (element) =>
              element.entityType != DataModelType.service &&
              element.entityType != DataModelType.userLocation &&
              element.entityType != DataModelType.complaints,
          // Added service so that we don't get the response from the server
        )
        .toList();

    return oplogs.map((e) => OpLogEntry.fromOpLog<T>(e)).toList();
  }

  Future<void> put(OpLogEntry<dynamic> entry) async {
    try {
      isar.writeTxnSync(() {
        isar.opLogs.putSync(entry
            .copyWith(
              clientReferenceId: getClientReferenceId(entry.entity),
              serverGeneratedId: getServerGeneratedId(entry.entity),
              rowVersion: getRowVersion(entry.entity),
              nonRecoverableError: getNonRecoverableError(entry.entity),
            )
            .oplog);
      });
    } catch (e) {
      if (kDebugMode) {
        print('error in isar $e');
      }
      rethrow;
    }

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
      isar.writeTxnSync(() {
        isar.opLogs.putSync(fetchedEntry
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
    final opLogs = isar.opLogs
        .filter()
        .clientReferenceIdEqualTo(model.clientReferenceId)
        .findAllSync();

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

      isar.writeTxnSync(() {
        isar.opLogs.putSync(updatedOplog);
      });
    }

    return;
  }

  Future<List<OpLogEntry<T>>> getEntries(
    String clientReferenceId,
    DataOperation operation,
  ) async {
    final oplog = isar.opLogs
        .filter()
        .operationEqualTo(operation)
        .clientReferenceIdEqualTo(clientReferenceId)
        .findAllSync();

    if (oplog.isEmpty) {
      throw AppException('OpLog not found for id: $clientReferenceId');
    }

    return oplog.map((e) => OpLogEntry.fromOpLog<T>(e)).toList();
  }

  Future<List<OpLog>> getSyncDownRetryList(
    String clientReferenceId,
  ) async {
    final oplogs = isar.opLogs
        .filter()
        .clientReferenceIdEqualTo(clientReferenceId)
        .findAllSync();

    return oplogs;
  }

  Future<bool> updateSyncDownRetry(
    String clientReferenceId,
  ) async {
    final oplogs = isar.opLogs
        .filter()
        .clientReferenceIdEqualTo(clientReferenceId)
        .findAllSync();

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
      if (updatedEntry.syncDownRetryCount >=
          DigitDataModelSingleton().syncDownRetryCount) {
        markAsNonRecoverable = true;
        updatedEntry = updatedEntry.copyWith(nonRecoverableError: true);
      }

      isar.writeTxnSync(() {
        isar.opLogs.putSync(updatedEntry.oplog);
      });
    }

    // [TODO] need to cross check only first records is failing

    if (oplogs.first.syncDownRetryCount == 1) {
      await Future.delayed(const Duration(seconds: 1));
    } else {
      await Future.delayed(Duration(
        seconds: DigitDataModelSingleton().retryTimeInterval *
            oplogs.first.syncDownRetryCount,
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

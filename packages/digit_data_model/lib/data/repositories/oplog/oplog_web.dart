// Web version of oplog.dart, used by browser builds such as the flow preview.
//
// Same public API as the native OpLogManager, but entries are kept in memory
// for the page session instead of in Isar (which cannot run in the browser).
// There is no server sync on the web, so the sync queries return nothing and
// the sync bookkeeping methods only update the in-memory entries.
// Selected by oplog_manager.dart. Keep the public API in sync with oplog.dart.
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

import '../../../data_model.dart';
import '../../../utils/app_exception.dart';

/// In-memory oplog store shared by every manager on the page.
final Map<int, OpLog> _webOpLogs = {};
int _nextWebOpLogId = 1;

abstract class OpLogManager<T extends EntityModel> {
  /// Kept for API compatibility with the native manager; not used on the web.
  final Isar isar;

  const OpLogManager(this.isar);

  /// Every entry written this session (newest last). Useful for previews that
  /// show what a flow would save.
  static List<OpLog> get webEntries =>
      _webOpLogs.values.toList(growable: false);

  /// Clears the in-memory oplog.
  static void clearWebEntries() => _webOpLogs.clear();

  Iterable<OpLog> _where(bool Function(OpLog) test) =>
      _webOpLogs.values.where(test);

  /// No server sync on the web.
  Future<List<OpLogEntry<T>>> getPendingUpSync(
    DataModelType type, {
    required String createdBy,
  }) async =>
      [];

  /// No server sync on the web.
  Future<List<OpLogEntry<T>>> getPendingDownSync(
    DataModelType type, {
    required String createdBy,
  }) async =>
      [];

  Future<void> put(OpLogEntry<dynamic> entry) async {
    final oplog = entry
        .copyWith(
          clientReferenceId: getClientReferenceId(entry.entity),
          serverGeneratedId: getServerGeneratedId(entry.entity),
          rowVersion: getRowVersion(entry.entity),
          nonRecoverableError: getNonRecoverableError(entry.entity),
        )
        .oplog;
    if (oplog.id == Isar.autoIncrement || oplog.id <= 0) {
      oplog.id = _nextWebOpLogId++;
    }
    _webOpLogs[oplog.id] = oplog;
    if (kDebugMode) {
      debugPrint('[oplog:web] ${oplog.operation.name} ${oplog.entityType.name} '
          '${oplog.clientReferenceId}');
    }
  }

  Future<void> markSyncUp({
    OpLogEntry<T>? entry,
    int? id,
    String? clientReferenceId,
    bool? nonRecoverableError,
  }) async {
    final now = DateTime.now();
    OpLog? oplog;
    if (entry?.id != null) {
      oplog = _webOpLogs[entry!.id!];
    } else if (id != null) {
      oplog = _webOpLogs[id];
    } else if (clientReferenceId != null) {
      oplog = _where((e) => e.clientReferenceId == clientReferenceId).firstOrNull;
    } else {
      throw AppException('Invalid arguments');
    }
    if (oplog == null) return;
    oplog
      ..syncedUp = true
      ..syncedUpOn = now;
    if (nonRecoverableError == true) {
      oplog
        ..syncedDown = true
        ..syncedDownOn = now;
    }
  }

  Future<void> updateServerGeneratedIds({
    required UpdateServerGeneratedIdModel model,
  }) async {
    for (final oplog
        in _where((e) => e.clientReferenceId == model.clientReferenceId)
            .toList()) {
      final entry = OpLogEntry.fromOpLog<T>(oplog);
      var updated = entry.copyWith(
        serverGeneratedId: model.serverGeneratedId,
        additionalIds: model.additionalIds,
        rowVersion: model.rowVersion,
        nonRecoverableError: model.nonRecoverableError,
      );
      if (entry.syncedUp) {
        updated = updated.copyWith(
          syncedDown: true,
          syncedDownOn: DateTime.now(),
        );
      }
      final next = updated.oplog;
      _webOpLogs[next.id] = next;
    }
  }

  Future<List<OpLogEntry<T>>> getEntries(
    String clientReferenceId,
    DataOperation operation,
  ) async {
    final oplogs = _where((e) =>
            e.operation == operation &&
            e.clientReferenceId == clientReferenceId)
        .toList();
    if (oplogs.isEmpty) {
      throw AppException('OpLog not found for id: $clientReferenceId');
    }
    return oplogs.map((e) => OpLogEntry.fromOpLog<T>(e)).toList();
  }

  Future<List<OpLog>> getSyncDownRetryList(
    String clientReferenceId,
  ) async =>
      _where((e) => e.clientReferenceId == clientReferenceId).toList();

  /// No server sync on the web, so nothing is ever retried.
  Future<bool> updateSyncDownRetry(
    String clientReferenceId,
  ) async =>
      false;

  /// Same contract as the native manager; always empty on the web.
  @protected
  Future<List<OpLog>> pendingCreateOpLogs(
    DataModelType type, {
    required String createdBy,
  }) async =>
      [];

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

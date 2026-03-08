import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sync_service/data/repositories/sync/sync_down.dart';
import 'package:sync_service/data/repositories/sync/sync_up.dart';
import 'package:sync_service/utils/utils.dart';

import '../models/bandwidth/bandwidth_model.dart';

/// Cross-isolate lock to prevent concurrent sync operations.
///
/// Uses [FlutterSecureStorage] with a timestamp so that stale locks
/// (e.g. from a killed process) auto-expire after [_staleDuration].
class SyncLock {
  static const _key = 'syncLockTimestamp';
  static const _staleDuration = Duration(minutes: 10);
  static const _storage = FlutterSecureStorage();

  /// Tries to acquire the lock.
  /// Returns `true` if the lock was acquired, `false` if another sync is
  /// already in progress.
  ///
  /// Uses a read-check-write pattern. The TOCTOU window is minimal (~ms)
  /// and acceptable given FlutterSecureStorage limitations.
  static Future<bool> tryAcquire() async {
    final existing = await _storage.read(key: _key);
    if (existing != null) {
      final lockTime = DateTime.tryParse(existing);
      if (lockTime != null &&
          DateTime.now().difference(lockTime).abs() < _staleDuration) {
        return false;
      }
    }
    await _storage.write(
      key: _key,
      value: DateTime.now().toIso8601String(),
    );
    return true;
  }

  /// Returns `true` when a non-stale lock is held.
  static Future<bool> isLocked() async {
    final existing = await _storage.read(key: _key);
    if (existing == null) return false;
    final lockTime = DateTime.tryParse(existing);
    if (lockTime == null) return false;
    return DateTime.now().difference(lockTime).abs() < _staleDuration;
  }

  /// Refreshes the lock timestamp to prevent stale expiry during long syncs.
  static Future<void> refresh() async {
    await _storage.write(
      key: _key,
      value: DateTime.now().toIso8601String(),
    );
  }

  /// Releases the lock.
  static Future<void> release() async {
    await _storage.delete(key: _key);
  }
}

/// The `SyncService` class provides methods to perform sync operations.
class SyncService {
  /// Public entry point that acquires [SyncLock] before syncing.
  ///
  /// Returns `false` immediately if another sync is already running.
  FutureOr<bool> performSync({
    required List<LocalRepository> localRepositories,
    required List<RemoteRepository> remoteRepositories,
    required BandwidthModel bandwidthModel,
    ServiceInstance? service,
  }) async {
    if (!await SyncLock.tryAcquire()) {
      return false;
    }

    try {
      return await _performSyncInternal(
        localRepositories: localRepositories,
        remoteRepositories: remoteRepositories,
        bandwidthModel: bandwidthModel,
        service: service,
      );
    } finally {
      await SyncLock.release();
    }
  }

  /// Internal implementation called by [performSync].
  /// Loops until all pending entries are synced. Does NOT re-acquire the lock.
  FutureOr<bool> _performSyncInternal({
    required List<LocalRepository> localRepositories,
    required List<RemoteRepository> remoteRepositories,
    required BandwidthModel bandwidthModel,
    ServiceInstance? service,
  }) async {
    final configuration = SyncServiceSingleton().persistenceConfiguration;

    if (configuration == PersistenceConfiguration.onlineOnly) {
      throw Exception('Sync up is not valid for online only configuration');
    }

    while (true) {
      final futuresSyncDown = await Future.wait(
        localRepositories
            .map((e) => e.getItemsToBeSyncedDown(bandwidthModel.userId)),
      );
      final pendingSyncDownEntries =
          futuresSyncDown.expand((e) => e).toList();

      final futuresSyncUp = await Future.wait(
        localRepositories
            .map((e) => e.getItemsToBeSyncedUp(bandwidthModel.userId)),
      );
      final pendingSyncUpEntries =
          futuresSyncUp.expand((e) => e).toList();

      if (pendingSyncUpEntries.isEmpty && pendingSyncDownEntries.isEmpty) {
        return true;
      }

      SyncError? syncError;

      // Perform the sync Down Operation
      if (pendingSyncDownEntries.isNotEmpty) {
        SyncServiceSingleton().reportProgress(const SyncProgress(
          entityType: 'Downloading from server...',
          operation: 'syncDown',
        ));
        try {
          await PerformSyncDown.syncDown(
            bandwidthModel: bandwidthModel,
            localRepositories: localRepositories.toSet().toList(),
            remoteRepositories: remoteRepositories.toSet().toList(),
            configuration: configuration!,
          );
        } catch (e) {
          syncError = SyncDownError(e);
        }
      }

      // Perform the sync up Operation
      if (pendingSyncUpEntries.isNotEmpty) {
        SyncServiceSingleton().reportProgress(const SyncProgress(
          entityType: 'Uploading to server...',
          operation: 'syncUp',
        ));
        try {
          await PerformSyncUp.syncUp(
            bandwidthModel: bandwidthModel,
            localRepositories: localRepositories.toSet().toList(),
            remoteRepositories: remoteRepositories.toSet().toList(),
          );
        } catch (e) {
          syncError ??= SyncUpError(e);
        }
      }

      if (syncError != null) {
        service?.invoke('stopService');
        throw syncError;
      }

      await Future.delayed(const Duration(seconds: 3));
      await SyncLock.refresh();
    }
  }

  /// Writes the given response to the entity database.
  ///
  /// This method accepts a `Map<String, dynamic>` response and a list of `LocalRepository` objects as parameters.
  /// It is a `FutureOr<void>` function.
  FutureOr<void> writeToEntityDB(
    Map<String, dynamic> response,
    List<LocalRepository> localRepositories,
  ) async {
    SyncServiceSingleton().entityMapper?.writeToEntityDB(
          response,
          localRepositories,
        );
  }

  /// Returns the count of pending sync records for the given user.
  ///
  /// This method accepts a list of `LocalRepository` objects and a `String` user ID as parameters.
  /// It returns a `FutureOr<int>` that resolves to the count of pending sync records.
  FutureOr<int> getPendingSyncRecordsCount(
    List<LocalRepository> localRepositories,
    String userId,
  ) async {
    final results = await Future.wait([
      ...localRepositories.map((e) => e.getItemsToBeSyncedUp(userId)),
      ...localRepositories.map((e) => e.getItemsToBeSyncedDown(userId)),
    ]);
    return results.expand((element) => element).length;
  }
}

/// This function filters the entities by the given bandwidth.
///
/// It accepts an integer `batchSize` and a list of `EntityModel` objects as parameters.
/// It returns a `FutureOr<List<EntityModel>>` that resolves to a list of filtered `EntityModel` objects.
FutureOr<List<EntityModel>> filterEntityByBandwidth(
  int batchSize,
  List<EntityModel> entities,
) async {
  final List<EntityModel> items = [];
  final int size = batchSize < entities.length ? batchSize : entities.length;

  for (var i = 0; i < size; i++) {
    items.add(entities[i]);
  }

  return items;
}

/// This function filters the operation log entries by the given bandwidth.
///
/// It accepts an integer `batchSize` and a list of `OpLogEntry<EntityModel>` objects as parameters.
/// It returns a `Future<List<OpLogEntry<EntityModel>>>` that resolves to a list of filtered `OpLogEntry<EntityModel>` objects.
Future<List<OpLogEntry<EntityModel>>> filterOpLogByBandwidth(
  int batchSize,
  List<OpLogEntry<EntityModel>> entities,
) async {
  final List<OpLogEntry<EntityModel>> items = [];
  final int size = batchSize < entities.length ? batchSize : entities.length;

  for (var i = 0; i < size; i++) {
    items.add(entities[i]);
  }

  return items;
}

/// The `SyncError` class is an abstract class that represents a sync error.
/// It extends the `Exception` class and includes a dynamic `error` property.
abstract class SyncError implements Exception {
  final dynamic error;

  const SyncError([this.error]);

  @override
  String toString() {
    // runtimeType gives "SyncUpError" or "SyncDownError"
    return '$runtimeType: $error';
  }
}

/// The `SyncUpError` class represents a sync up error.
class SyncUpError extends SyncError {
  const SyncUpError([super.error]);
}

/// The `SyncDownError` class represents a sync down error.
class SyncDownError extends SyncError {
  const SyncDownError([super.error]);
}

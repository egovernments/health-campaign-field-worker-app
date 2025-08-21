import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sync_service/data/repositories/sync/sync_down.dart';
import 'package:sync_service/data/repositories/sync/sync_up.dart';
import 'package:sync_service/utils/utils.dart';

import '../models/bandwidth/bandwidth_model.dart';

/// The `SyncService` class provides methods to perform sync operations.
class SyncService {
  /// This function reads the params and gets the records which are not synced
  /// and pushes to the sync-up and sync-down methods.
  ///
  /// It accepts a list of `LocalRepository` objects, a list of `RemoteRepository` objects,
  /// a `BandwidthModel`, and an optional `ServiceInstance` as parameters.
  /// It returns a `Future` that resolves to a `bool` indicating whether the sync operation is completed.
  FutureOr<bool> performSync({
    required List<LocalRepository> localRepositories,
    required List<RemoteRepository> remoteRepositories,
    required BandwidthModel bandwidthModel,
    ServiceInstance? service,
  }) async {
    final configuration = SyncServiceSingleton().persistenceConfiguration;

    if (configuration == PersistenceConfiguration.onlineOnly) {
      throw Exception('Sync up is not valid for online only configuration');
    }
    bool isSyncCompleted = false;

    final futuresSyncDown = await Future.wait(
      localRepositories
          .map((e) => e.getItemsToBeSyncedDown(bandwidthModel.userId)),
    );
    final pendingSyncDownEntries = futuresSyncDown.expand((e) => e).toList();

    final futuresSyncUp = await Future.wait(
      localRepositories
          .map((e) => e.getItemsToBeSyncedUp(bandwidthModel.userId)),
    );
    final pendingSyncUpEntries = futuresSyncUp.expand((e) => e).toList();

    SyncError? syncError;

// Perform the sync Down Operation

    try {
      await PerformSyncDown.syncDown(
        bandwidthModel: bandwidthModel,
        localRepositories: localRepositories.toSet().toList(),
        remoteRepositories: remoteRepositories.toSet().toList(),
        configuration: configuration!,
      );
    } catch (e) {
      syncError = SyncDownError(e);
      service?.stopSelf();
    }

// Perform the sync up Operation

    try {
      await PerformSyncUp.syncUp(
        bandwidthModel: bandwidthModel,
        localRepositories: localRepositories.toSet().toList(),
        remoteRepositories: remoteRepositories.toSet().toList(),
      );
    } catch (e) {
      syncError ??= SyncUpError(e);
      service?.stopSelf();
    }

    if (syncError != null) throw syncError;

    // Recursive function which will call the Perform Sync

    if (pendingSyncUpEntries.isNotEmpty || pendingSyncDownEntries.isNotEmpty) {
      await Future.delayed(const Duration(seconds: 3));
      isSyncCompleted = await performSync(
        bandwidthModel: bandwidthModel,
        localRepositories: localRepositories,
        remoteRepositories: remoteRepositories,
      );
    } else if (pendingSyncUpEntries.isEmpty && pendingSyncDownEntries.isEmpty) {
      await const FlutterSecureStorage()
          .write(key: 'manualSyncKey', value: false.toString());
      isSyncCompleted = true;
    }

    return isSyncCompleted;
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
  ) async =>
      (await Future.wait(localRepositories.map((e) {
        return e.getItemsToBeSyncedUp(userId);
      })))
          .expand((element) => element)
          .length;
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

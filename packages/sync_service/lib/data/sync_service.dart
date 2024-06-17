import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sync_service/data/repositories/sync/sync_down.dart';
import 'package:sync_service/data/repositories/sync/sync_up.dart';
import 'package:sync_service/utils/utils.dart';

import '../models/bandwidth/bandwidth_model.dart';

class SyncService {
/* This function will read the params and get the records which are not synced
 and pushes to the sync-up and sync-down methods */

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

  FutureOr<void> writeToEntityDB(
    Map<String, dynamic> response,
    List<LocalRepository> localRepositories,
  ) async {
    SyncServiceSingleton().entityMapper?.writeToEntityDB(
          response,
          localRepositories,
        );
  }

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

abstract class SyncError implements Exception {
  final dynamic error;

  const SyncError([this.error]);
}

class SyncUpError extends SyncError {
  const SyncUpError([super.error]);
}

class SyncDownError extends SyncError {
  const SyncDownError([super.error]);
}

import 'dart:async';
import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';
import 'package:registration_delivery/models/entities/referral.dart';
import 'package:registration_delivery/models/entities/side_effect.dart';
import 'package:registration_delivery/models/entities/task.dart';

import 'repositories/sync/remote_type.dart';
import 'package:provider/provider.dart';

import '../models/bandwidth/bandwidth_model.dart';
import 'local_store/secure_store/secure_store.dart';
import 'repositories/sync/sync_down.dart';
import 'repositories/sync/sync_up.dart';

class NetworkManager {
  final NetworkManagerConfiguration configuration;

  const NetworkManager({required this.configuration});

  DataRepository<D, R>
      repository<D extends EntityModel, R extends EntitySearchModel>(
    BuildContext context,
  ) {
    switch (configuration.persistenceConfig) {
      case PersistenceConfiguration.offlineFirst:
        return context.read<LocalRepository<D, R>>();
      case PersistenceConfiguration.onlineOnly:
        return context.read<RemoteRepository<D, R>>();
    }
  }

/* This function will read the params and get the records which are not synced
 and pushes to the sync-up and sync-down methods */

  FutureOr<bool> performSync({
    required List<LocalRepository> localRepositories,
    required List<RemoteRepository> remoteRepositories,
    required BandwidthModel bandwidthModel,
    ServiceInstance? service,
  }) async {
    if (configuration.persistenceConfig ==
        PersistenceConfiguration.onlineOnly) {
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
        configuration: configuration,
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

    // Recursive function which will call the Perfom Sync

    if (pendingSyncUpEntries.isNotEmpty || pendingSyncDownEntries.isNotEmpty) {
      await Future.delayed(const Duration(seconds: 3));
      isSyncCompleted = await performSync(
        bandwidthModel: bandwidthModel,
        localRepositories: localRepositories,
        remoteRepositories: remoteRepositories,
      );
    } else if (pendingSyncUpEntries.isEmpty && pendingSyncDownEntries.isEmpty) {
      await LocalSecureStore.instance.setManualSyncTrigger(false);
      isSyncCompleted = true;
    }

    return isSyncCompleted;
  }

  //
  FutureOr<void> writeToEntityDB(
    Map<String, dynamic> response,
    List<LocalRepository> localRepositories,
  ) async {
    try {
      for (int i = 0; i <= response.keys.length - 1; i++) {
        if (response.keys.elementAt(i) != 'DownsyncCriteria') {
          final local = RepositoryType.getLocalForType(
            DataModels.getDataModelForEntityName(response.keys.elementAt(i)),
            localRepositories,
          );
          final List<dynamic> entityResponse =
              response[response.keys.elementAt(i)] ?? [];

          final entityList =
              entityResponse.whereType<Map<String, dynamic>>().toList();

          switch (response.keys.elementAt(i)) {
            case "Individuals":
              final entity = entityList
                  .map((e) => IndividualModelMapper.fromJson(jsonEncode(e)))
                  .toList();
              await local.bulkCreate(entity);
            case "Households":
              final entity = entityList
                  .map((e) => HouseholdModelMapper.fromJson(jsonEncode(e)))
                  .toList();
              await local.bulkCreate(entity);
            case "HouseholdMembers":
              final entity = entityList
                  .map(
                    (e) => HouseholdMemberModelMapper.fromJson(
                      jsonEncode(e),
                    ),
                  )
                  .toList();
              await local.bulkCreate(entity);
            case "ProjectBeneficiaries":
              final entity = entityList
                  .map((e) =>
                      ProjectBeneficiaryModelMapper.fromJson(jsonEncode(e)))
                  .toList();
              await local.bulkCreate(entity);
            case "Tasks":
              final entity = entityList
                  .map((e) => TaskModelMapper.fromJson(jsonEncode(e)))
                  .toList();
              await local.bulkCreate(entity);
            case "SideEffects":
              final entity = entityList
                  .map((e) => SideEffectModelMapper.fromJson(jsonEncode(e)))
                  .toList();
              await local.bulkCreate(entity);
            case "Referrals":
              final entity = entityList
                  .map((e) => ReferralModelMapper.fromJson(jsonEncode(e)))
                  .toList();
              await local.bulkCreate(entity);
            default:
              final entity = entityList
                  .map((e) => EntityModelMapper.fromJson(jsonEncode(e)))
                  .toList();
              await local.bulkCreate(entity);
          }
        }
      }
    } catch (e) {
      rethrow;
    }
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

FutureOr<List<EntityModel>> filterEntitybyBandwidth(
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

class NetworkManagerConfiguration {
  final PersistenceConfiguration persistenceConfig;

  const NetworkManagerConfiguration({
    this.persistenceConfig = PersistenceConfiguration.offlineFirst,
  });
}

abstract class SyncError implements Exception {
  final dynamic error;

  const SyncError([this.error]);
}

class SyncUpError extends SyncError {
  const SyncUpError([dynamic error]) : super(error);
}

class SyncDownError extends SyncError {
  const SyncDownError([dynamic error]) : super(error);
}

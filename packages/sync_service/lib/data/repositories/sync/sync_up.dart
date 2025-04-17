import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sync_service/utils/utils.dart';

import '../../../models/bandwidth/bandwidth_model.dart';
import 'remote_type.dart';

/// The `PerformSyncUp` class provides a method to perform a sync up operation.
class PerformSyncUp {
  /// Performs a sync up operation.
  ///
  /// This method accepts a `BandwidthModel`, a list of `LocalRepository` objects, and a list of `RemoteRepository` objects as parameters.
  /// It gets the items to be synced up from each local repository and groups them by type and operation.
  /// It then gets the remote and local repositories for each type and applies the server generated ID to each entity.
  /// Finally, it updates each entity in the local repository.
  static FutureOr<void> syncUp({
    required BandwidthModel bandwidthModel,
    required List<LocalRepository> localRepositories,
    required List<RemoteRepository> remoteRepositories,
  }) async {
    // Helper function to get the entity model from a list of operation log entries
    List<EntityModel> getEntityModel(
      List<OpLogEntry<EntityModel>> opLogList,
      LocalRepository<EntityModel, EntitySearchModel> local,
    ) {
      return opLogList
          .map((e) {
            final oplogEntryEntity = e.entity;

            final serverGeneratedId = e.serverGeneratedId;
            final rowVersion = e.rowVersion;
            if (serverGeneratedId != null) {
              EntityModel? updatedEntity =
                  local.opLogManager.applyServerGeneratedIdToEntity(
                oplogEntryEntity,
                serverGeneratedId,
                rowVersion,
              );

              updatedEntity = SyncServiceSingleton()
                  .entityMapper
                  ?.updatedEntity(updatedEntity, e, serverGeneratedId);

              return updatedEntity;
            }

            return oplogEntryEntity;
          })
          .whereNotNull()
          .toList();
    }

    // Get the items to be synced up from each local repository
    final futures = await Future.wait(
      localRepositories
          .map((e) => e.getItemsToBeSyncedUp(bandwidthModel.userId)),
    );

    // Group the items by type and operation
    final pendingSyncEntries = futures.expand((e) => e).toList();
    pendingSyncEntries.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    final groupedEntries = pendingSyncEntries.groupListsBy(
      (element) => element.type,
    );

    // Sort the entries by DataModelType enum
    final entries = groupedEntries.entries.toList();
    entries.sort((a, b) => DataModelType.values
        .indexOf(a.key)
        .compareTo(DataModelType.values.indexOf(b.key)));

    // For each type and operation, get the remote and local repositories and apply the server generated ID to each entity
    for (final typeGroupedEntity in entries) {
      final groupedOperations = typeGroupedEntity.value.groupListsBy(
        (element) => element.operation,
      );

      final remote = RepositoryType.getRemoteForType(
        typeGroupedEntity.key,
        remoteRepositories,
      );

      final local = RepositoryType.getLocalForType(
        typeGroupedEntity.key,
        localRepositories,
      );

      // For each operation, update each entity in the local repository
      for (final operationGroupedEntity in groupedOperations.entries) {
        // [returns list of oplogs whose nonRecoverableError is false and syncedup is false]
        final opLogList = operationGroupedEntity.value
            .where(
              (element) => !element.nonRecoverableError && !element.syncedUp,
            )
            .toList();
        // [returns list of oplogs whose nonRecoverableError is true]
        final opLogErrorList = operationGroupedEntity.value
            .where((element) => element.nonRecoverableError)
            .toList();

        // [returns list of opLogs whose nonRecoverableError is false and retry count is equal to configured value]
        final nonRecoverableErrorList = operationGroupedEntity.value
            .where((element) =>
                !element.nonRecoverableError &&
                element.syncDownRetryCount >=
                    SyncServiceSingleton().syncDownRetryCount)
            .toList();

        final List<List<OpLogEntry<EntityModel>>> listOfBatchedOpLogList =
            opLogList.slices(bandwidthModel.batchSize).toList();

        final List<List<OpLogEntry<EntityModel>>> listOfBatchedOpLogErrorList =
            opLogErrorList.slices(bandwidthModel.batchSize).toList();

        final List<List<OpLogEntry<EntityModel>>>
            listOfBatchedNonRecoverableErrorList =
            nonRecoverableErrorList.slices(bandwidthModel.batchSize).toList();

        final registry = SyncServiceSingleton()
            .registries
            ?.getSyncRegistries(typeGroupedEntity.key, remote);
        if (registry == null) {
          if (kDebugMode) {
            print('no custom sync registry found for ${typeGroupedEntity.key}');
          }
        }

        // Handle non-recoverable errors
        if (listOfBatchedNonRecoverableErrorList.isNotEmpty) {
          for (final sublist in listOfBatchedNonRecoverableErrorList) {
            final nonRecoverableErrorEntities = getEntityModel(sublist, local);
            await remote.dumpError(
              nonRecoverableErrorEntities,
              operationGroupedEntity.key,
            );
            if (registry != null) {
              await registry.localMarkSyncUp(sublist, local);
            } else {
              for (final syncedEntity in sublist) {
                await local.markSyncedUp(
                  entry: syncedEntity,
                  nonRecoverableError: syncedEntity.nonRecoverableError,
                  clientReferenceId: syncedEntity.clientReferenceId,
                  id: syncedEntity.id,
                );
              }
            }
          }
        }

        // Handle errors
        if (listOfBatchedOpLogErrorList.isNotEmpty) {
          for (final sublist in listOfBatchedOpLogErrorList) {
            final errorEntities = getEntityModel(sublist, local);
            await remote.dumpError(
              errorEntities,
              operationGroupedEntity.key,
            );
            for (final syncedEntity in sublist) {
              await local.markSyncedUp(
                entry: syncedEntity,
                nonRecoverableError: syncedEntity.nonRecoverableError,
                clientReferenceId: syncedEntity.clientReferenceId,
                id: syncedEntity.id,
              );
            }
          }
        }

        // Handle successful operations
        if (listOfBatchedOpLogList.isNotEmpty) {
          final registry = SyncServiceSingleton()
              .registries
              ?.getSyncRegistries(typeGroupedEntity.key, remote);
          if (registry == null) {
            if (kDebugMode) {
              print(
                  'no custom sync registry found for ${typeGroupedEntity.key}');
            }
          }
          for (final sublist in listOfBatchedOpLogList) {
            final entities = getEntityModel(sublist, local);
            if (operationGroupedEntity.key == DataOperation.create) {
              if (registry != null) {
                await registry.create(
                    entities: entities,
                    entry: sublist,
                    local: local,
                    operationGroupedEntity: operationGroupedEntity,
                    typeGroupedEntity: typeGroupedEntity);
              } else {
                await remote.bulkCreate(entities);
              }
            } else if (operationGroupedEntity.key == DataOperation.update) {
              await Future.delayed(const Duration(seconds: 1));
              if (registry != null) {
                await registry.update(entities, local);
              } else {
                await remote.bulkUpdate(entities);
              }
            } else if (operationGroupedEntity.key == DataOperation.delete) {
              await Future.delayed(const Duration(seconds: 1));
              if (registry != null) {
                await registry.delete(entities, local);
              } else {
                await remote.bulkDelete(entities);
              }
            }
            if (operationGroupedEntity.key == DataOperation.singleCreate) {
              for (var element in entities) {
                if (registry != null) {
                  await registry.singleCreate(element, local);
                } else {
                  await remote.singleCreate(element);
                }
              }
            }
            if (registry != null) {
              await registry.localMarkSyncUp(sublist, local);
            } else {
              for (final syncedEntity in sublist) {
                await local.markSyncedUp(
                  entry: syncedEntity,
                  id: syncedEntity.id,
                  nonRecoverableError: syncedEntity.nonRecoverableError,
                  clientReferenceId: syncedEntity.clientReferenceId,
                );
              }
            }
          }
        }
      }
    }
  }
}

abstract class SyncUpOperation {
  Future<void> create(
      {required List<OpLogEntry<EntityModel>> entry,
      required List<EntityModel> entities,
      required LocalRepository local,
      required MapEntry<DataOperation, List<OpLogEntry<EntityModel>>>
          operationGroupedEntity,
      required MapEntry<DataModelType, List<OpLogEntry<EntityModel>>>
          typeGroupedEntity});

  Future<void> update(List<EntityModel> entities, LocalRepository local);

  Future<void> delete(List<EntityModel> entities, LocalRepository local);

  Future<void> singleCreate(EntityModel entity, LocalRepository local);

  Future<void> localMarkSyncUp(
      List<OpLogEntry<EntityModel>> entity, LocalRepository local);
}

class SyncServiceRegistry {
  // Singleton instance
  static final SyncServiceRegistry _instance = SyncServiceRegistry._internal();

  // Private constructor for singleton pattern
  SyncServiceRegistry._internal();

  // Factory constructor to return the singleton instance
  factory SyncServiceRegistry() {
    return _instance;
  }

  // Private map to store registries
  static final Map<DataModelType, SyncUpOperation Function(RemoteRepository)>
      _registries = {};

  /// Registers a sync registry for a given [DataModelType].
  void registerSyncRegistries(
    Map<DataModelType, SyncUpOperation Function(RemoteRepository)> registries,
  ) {
    registries.forEach((type, strategyList) {
      _registries[type] = strategyList; // Create a new list
    });
  }

  /// Retrieves a sync registry for the given [DataModelType].
  SyncUpOperation? getSyncRegistries(
      DataModelType type, RemoteRepository remote) {
    final strategyFunction = _registries[type];
    return strategyFunction != null ? strategyFunction(remote) : null;
  }

  /// Getter to access the _registries map
  Map<DataModelType, SyncUpOperation Function(RemoteRepository)>
      get registries {
    return _registries;
  }

  /// Setter to update the _registries map
  set registries(
      Map<DataModelType, SyncUpOperation Function(RemoteRepository)>
          newStrategies) {
    newStrategies.forEach((type, strategyList) {
      _registries[type] = strategyList; // Create a new list
    });
  }
}

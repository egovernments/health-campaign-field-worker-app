import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/data_model.dart';
import 'data_repository.dart';
import 'local_store/no_sql/schema/oplog.dart';

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

  Future<void> syncUp({
    required List<LocalRepository> localRepositories,
    required List<RemoteRepository> remoteRepositories,
  }) async {
    if (configuration.persistenceConfig ==
        PersistenceConfiguration.onlineOnly) {
      throw Exception('Sync up is not valid for online only configuration');
    }

    await getServerGeneratedIds(
      localRepositories: localRepositories,
      remoteRepositories: remoteRepositories,
    );

    final futures = await Future.wait(
      localRepositories.map((e) => e.getItemsToBeSynced()),
    );

    final pendingSyncEntries = futures.expand((e) => e).toList();
    pendingSyncEntries.sort((a, b) => a.dateCreated.compareTo(b.dateCreated));

    final groupedEntries = pendingSyncEntries.groupListsBy(
      (element) => element.type,
    );

    for (final typeGroupedEntity in groupedEntries.entries) {
      final groupedOperations = typeGroupedEntity.value.groupListsBy(
        (element) => element.operation,
      );

      final remote = _getRemoteForType(
        typeGroupedEntity.key,
        remoteRepositories,
      );

      final local = _getLocalForType(
        typeGroupedEntity.key,
        localRepositories,
      );

      for (final operationGroupedEntity in groupedOperations.entries) {
        final entities = operationGroupedEntity.value.map((e) {
          return e.entity;
        }).toList();

        if (operationGroupedEntity.key == DataOperation.create) {
          debugPrint('Syncing: ${entities.map((e) => e.toJson()).toString()}');
          await remote.bulkCreate(entities);
        } else if (operationGroupedEntity.key == DataOperation.update) {
          await remote.bulkUpdate(entities);
        } else if (operationGroupedEntity.key == DataOperation.delete) {
          await remote.bulkDelete(entities);
        }

        for (final syncedEntity in operationGroupedEntity.value) {
          local.markSynced(syncedEntity.copyWith(isSynced: true));
        }
      }
    }
  }

  FutureOr<void> getServerGeneratedIds({
    required List<LocalRepository> localRepositories,
    required List<RemoteRepository> remoteRepositories,
  }) async {
    if (configuration.persistenceConfig ==
        PersistenceConfiguration.onlineOnly) {
      throw Exception('Sync up is not valid for online only configuration');
    }

    final futures = await Future.wait(
      localRepositories.map((e) => e.getSyncedCreateEntities()),
    );

    final pendingSyncEntries = futures.expand((e) => e).toList();
    pendingSyncEntries.sort((a, b) => a.dateCreated.compareTo(b.dateCreated));

    final groupedEntries = pendingSyncEntries.groupListsBy(
      (element) => element.type,
    );

    for (final typeGroupedEntity in groupedEntries.entries) {
      final groupedOperations = typeGroupedEntity.value.groupListsBy(
        (element) => element.operation,
      );

      final remote = _getRemoteForType(
        typeGroupedEntity.key,
        remoteRepositories,
      );

      final local = _getLocalForType(
        typeGroupedEntity.key,
        localRepositories,
      );

      for (final operationGroupedEntity in groupedOperations.entries) {
        final entities = operationGroupedEntity.value.map((e) {
          return e.entity;
        }).toList();

        List<EntityModel> responseEntities = [];

        switch (typeGroupedEntity.key) {
          case DataModelType.household:
            responseEntities = await remote.search(HouseholdSearchModel(
              clientReferenceId: entities
                  .whereType<HouseholdModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
            ));

            final isar = local.opLogManager.isar;
            await isar.writeTxn(() async {
              for (var element in typeGroupedEntity.value) {
                final entity = element.entity as HouseholdModel;
                final responseEntity = responseEntities
                    .whereType<HouseholdModel>()
                    .firstWhereOrNull(
                      (e) => e.clientReferenceId == entity.clientReferenceId,
                    );
                final updatedEntity = entity.copyWith(id: responseEntity?.id);
                final oplog = OpLog()
                  ..id = element.id
                  ..serverGeneratedId = updatedEntity.id
                  ..operation = element.operation
                  ..isSynced = element.isSynced
                  ..entityType = element.type
                  ..createdOn = element.dateCreated
                  ..entityString = updatedEntity.toJson();

                await isar.opLogs.put(oplog);
              }
            });

            break;

          case DataModelType.individual:
            responseEntities = await remote.search(IndividualSearchModel(
              clientReferenceId: entities
                  .whereType<IndividualModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
            ));

            final isar = local.opLogManager.isar;
            await isar.writeTxn(() async {
              for (var element in typeGroupedEntity.value) {
                final entity = element.entity as IndividualModel;
                final responseEntity = responseEntities
                    .whereType<IndividualModel>()
                    .firstWhereOrNull(
                      (e) => e.clientReferenceId == entity.clientReferenceId,
                    );
                final updatedEntity = entity.copyWith(id: responseEntity?.id);
                final oplog = OpLog()
                  ..id = element.id
                  ..serverGeneratedId = updatedEntity.id
                  ..operation = element.operation
                  ..isSynced = element.isSynced
                  ..entityType = element.type
                  ..createdOn = element.dateCreated
                  ..entityString = updatedEntity.toJson();

                await isar.opLogs.put(oplog);
              }
            });
            break;
          case DataModelType.projectBeneficiary:
            responseEntities =
                await remote.search(ProjectBeneficiarySearchModel(
              clientReferenceId: entities
                  .whereType<ProjectBeneficiaryModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
            ));

            final isar = local.opLogManager.isar;
            await isar.writeTxn(() async {
              for (var element in typeGroupedEntity.value) {
                final entity = element.entity as ProjectBeneficiaryModel;
                final responseEntity = responseEntities
                    .whereType<ProjectBeneficiaryModel>()
                    .firstWhereOrNull(
                      (e) => e.clientReferenceId == entity.clientReferenceId,
                    );
                final updatedEntity = entity.copyWith(id: responseEntity?.id);
                final oplog = OpLog()
                  ..id = element.id
                  ..serverGeneratedId = updatedEntity.id
                  ..operation = element.operation
                  ..isSynced = element.isSynced
                  ..entityType = element.type
                  ..createdOn = element.dateCreated
                  ..entityString = updatedEntity.toJson();

                await isar.opLogs.put(oplog);
              }
            });
            break;
          case DataModelType.task:
            responseEntities = await remote.search(TaskSearchModel(
              clientReferenceId: entities
                  .whereType<TaskModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
            ));

            final isar = local.opLogManager.isar;
            await isar.writeTxn(() async {
              for (var element in typeGroupedEntity.value) {
                final entity = element.entity as TaskModel;
                final responseEntity =
                    responseEntities.whereType<TaskModel>().firstWhereOrNull(
                          (e) =>
                              e.clientReferenceId == entity.clientReferenceId,
                        );
                final updatedEntity = entity.copyWith(id: responseEntity?.id);
                final oplog = OpLog()
                  ..id = element.id
                  ..serverGeneratedId = updatedEntity.id
                  ..operation = element.operation
                  ..isSynced = element.isSynced
                  ..entityType = element.type
                  ..createdOn = element.dateCreated
                  ..entityString = updatedEntity.toJson();

                await isar.opLogs.put(oplog);
              }
            });
            break;
          default:
            continue;
        }

        for (var element in responseEntities) {
          await local.update(element);
        }
      }
    }
  }

  FutureOr<int> getPendingSyncRecordsCount(
    List<LocalRepository> localRepositories,
  ) async =>
      (await Future.wait(localRepositories.map((e) => e.getItemsToBeSynced())))
          .expand((element) => element)
          .length;

  Future<void> syncDown({
    required List<LocalRepository> localRepositories,
    required List<RemoteRepository> remoteRepositories,
  }) async {
    if (configuration.persistenceConfig ==
        PersistenceConfiguration.onlineOnly) {
      throw Exception('Sync down is not valid for online only configuration');
    }
  }

  RemoteRepository _getRemoteForType(
    DataModelType type,
    List<RemoteRepository> remoteRepositories,
  ) {
    final repository = remoteRepositories.firstWhereOrNull(
      (e) => e.type == type,
    );

    if (repository == null) {
      throw Exception(
        'Remote repository is not configured in the network manager',
      );
    }

    return repository;
  }

  LocalRepository _getLocalForType(
    DataModelType type,
    List<LocalRepository> localRepositories,
  ) {
    final repository = localRepositories.firstWhereOrNull(
      (e) => e.type == type,
    );

    if (repository == null) {
      throw Exception(
        'Remote repository is not configured in the network manager',
      );
    }

    return repository;
  }
}

class NetworkManagerConfiguration {
  final PersistenceConfiguration persistenceConfig;

  const NetworkManagerConfiguration({
    this.persistenceConfig = PersistenceConfiguration.offlineFirst,
  });
}

enum PersistenceConfiguration { offlineFirst, onlineOnly }

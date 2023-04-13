import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/data_model.dart';
import 'data_repository.dart';
import 'repositories/oplog/oplog.dart';

class NetworkManager {
  static const _taskResourceIdKey = 'taskResourceId';
  static const _individualIdentifierIdKey = 'individualIdentifierId';
  static const _householdAddressIdKey = 'householdAddressId';
  static const _individualAddressIdKey = 'individualAddressId';

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
    required String userId,
  }) async {
    if (configuration.persistenceConfig ==
        PersistenceConfiguration.onlineOnly) {
      throw Exception('Sync up is not valid for online only configuration');
    }

    await getServerGeneratedIds(
      createdBy: userId,
      localRepositories: localRepositories.toSet().toList(),
      remoteRepositories: remoteRepositories.toSet().toList(),
    );

    final futures = await Future.wait(
      localRepositories.map((e) => e.getItemsToBeSyncedUp(userId)),
    );

    final pendingSyncEntries = futures.expand((e) => e).toList();

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
        final entities = operationGroupedEntity.value
            .map((e) {
              final oplogEntryEntity = e.entity;

              final serverGeneratedId = e.serverGeneratedId;
              if (serverGeneratedId != null) {
                var updatedEntity =
                    local.opLogManager.applyServerGeneratedIdToEntity(
                  oplogEntryEntity,
                  serverGeneratedId,
                );

                if (updatedEntity is HouseholdModel) {
                  final addressId = e.additionalIds.firstWhereOrNull(
                    (element) {
                      return element.idType == _householdAddressIdKey;
                    },
                  )?.id;

                  updatedEntity = updatedEntity.copyWith(
                    address: updatedEntity.address?.copyWith(
                      id: addressId,
                    ),
                  );
                }

                if (updatedEntity is IndividualModel) {
                  final identifierId = e.additionalIds.firstWhereOrNull(
                    (element) {
                      return element.idType == _individualIdentifierIdKey;
                    },
                  )?.id;

                  final addressId = e.additionalIds.firstWhereOrNull(
                    (element) {
                      return element.idType == _individualAddressIdKey;
                    },
                  )?.id;

                  updatedEntity = updatedEntity.copyWith(
                    // TODO: Modify this to work with multiple identifiers
                    identifiers: updatedEntity.identifiers?.map((e) {
                      return e.copyWith(
                        id: identifierId,
                      );
                    }).toList(),

                    // TODO: Modify this to work with multiple addresses
                    address: updatedEntity.address?.map((e) {
                      return e.copyWith(
                        id: addressId,
                      );
                    }).toList(),
                  );
                }

                if (updatedEntity is TaskModel) {
                  final resourceId = e.additionalIds
                      .firstWhereOrNull(
                        (element) => element.idType == _taskResourceIdKey,
                      )
                      ?.id;

                  updatedEntity = updatedEntity.copyWith(
                    resources: updatedEntity.resources?.map((e) {
                      if (resourceId != null) {
                        return e.copyWith(
                          taskId: serverGeneratedId,
                          id: resourceId,
                        );
                      }

                      return e.copyWith(taskId: serverGeneratedId);
                    }).toList(),
                  );
                }

                return updatedEntity;
              }

              return oplogEntryEntity;
            })
            .whereNotNull()
            .toList();

        if (operationGroupedEntity.key == DataOperation.create) {
          await Future.delayed(const Duration(seconds: 1));

          switch (typeGroupedEntity.key) {
            case DataModelType.complaints:
              for (final entity in entities) {
                await remote.create(entity);
              }
              break;
            default:
              await remote.bulkCreate(entities);
          }
        } else if (operationGroupedEntity.key == DataOperation.update) {
          await remote.bulkUpdate(entities);
        } else if (operationGroupedEntity.key == DataOperation.delete) {
          await remote.bulkDelete(entities);
        }
        if (operationGroupedEntity.key == DataOperation.singleCreate) {
          for (var element in entities) {
            await remote.singleCreate(element);
          }
        }

        for (final syncedEntity in operationGroupedEntity.value) {
          local.markSyncedUp(syncedEntity);
        }
      }
    }
  }

  FutureOr<void> getServerGeneratedIds({
    required String createdBy,
    required List<LocalRepository> localRepositories,
    required List<RemoteRepository> remoteRepositories,
  }) async {
    if (configuration.persistenceConfig ==
        PersistenceConfiguration.onlineOnly) {
      throw Exception('Sync up is not valid for online only configuration');
    }

    final futures = await Future.wait(
      localRepositories.map((e) => e.getItemsToBeSyncedDown(createdBy)),
    );

    final pendingSyncEntries = futures.expand((e) => e).toList();

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

            for (var element in typeGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as HouseholdModel;
              final responseEntity =
                  responseEntities.whereType<HouseholdModel>().firstWhereOrNull(
                        (e) => e.clientReferenceId == entity.clientReferenceId,
                      );

              final serverGeneratedId = responseEntity?.id;

              if (serverGeneratedId != null) {
                final addressAdditionalId = responseEntity?.address?.id == null
                    ? null
                    : AdditionalId(
                        idType: _householdAddressIdKey,
                        id: responseEntity!.address!.id!,
                      );

                local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    additionalIds: [
                      if (addressAdditionalId != null) addressAdditionalId,
                    ],
                    dataOperation: element.operation,
                  ),
                );
              }
            }

            break;

          case DataModelType.individual:
            responseEntities = await remote.search(IndividualSearchModel(
              clientReferenceId: entities
                  .whereType<IndividualModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
            ));

            for (var element in typeGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as IndividualModel;
              final responseEntity = responseEntities
                  .whereType<IndividualModel>()
                  .firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

              final serverGeneratedId = responseEntity?.id;

              if (serverGeneratedId != null) {
                final identifierAdditionalIds = responseEntity?.identifiers
                    ?.map((e) {
                      final id = e.id;

                      if (id == null) return null;

                      return AdditionalId(
                        idType: _individualIdentifierIdKey,
                        id: id,
                      );
                    })
                    .whereNotNull()
                    .toList();

                final addressAdditionalIds = responseEntity?.address
                    ?.map((e) {
                      final id = e.id;

                      if (id == null) return null;

                      return AdditionalId(
                        idType: _individualAddressIdKey,
                        id: id,
                      );
                    })
                    .whereNotNull()
                    .toList();

                local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    additionalIds: [
                      if (identifierAdditionalIds != null)
                        ...identifierAdditionalIds,
                      if (addressAdditionalIds != null) ...addressAdditionalIds,
                    ],
                    dataOperation: element.operation,
                  ),
                );
              }
            }

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

            for (var element in typeGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as ProjectBeneficiaryModel;
              final responseEntity = responseEntities
                  .whereType<ProjectBeneficiaryModel>()
                  .firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );
              final serverGeneratedId = responseEntity?.id;

              if (serverGeneratedId != null) {
                local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    dataOperation: element.operation,
                  ),
                );
              }
            }

            break;
          case DataModelType.task:
            responseEntities = await remote.search(TaskSearchModel(
              clientReferenceId: entities
                  .whereType<TaskModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
            ));

            for (var element in typeGroupedEntity.value) {
              if (element.id == null) return;
              final taskModel = element.entity as TaskModel;
              var responseEntity =
                  responseEntities.whereType<TaskModel>().firstWhereOrNull(
                        (e) =>
                            e.clientReferenceId == taskModel.clientReferenceId,
                      );

              final serverGeneratedId = responseEntity?.id;

              if (serverGeneratedId != null) {
                local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: taskModel.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    additionalIds: responseEntity?.resources
                        ?.map((e) {
                          final id = e.id;
                          if (id == null) return null;

                          return AdditionalId(
                            idType: _taskResourceIdKey,
                            id: id,
                          );
                        })
                        .whereNotNull()
                        .toList(),
                    dataOperation: element.operation,
                  ),
                );
              }
            }

            break;

          case DataModelType.stock:
            responseEntities = await remote.search(
              StockSearchModel(
                clientReferenceId: entities
                    .whereType<StockModel>()
                    .map((e) => e.clientReferenceId)
                    .whereNotNull()
                    .toList(),
              ),
            );

            for (var element in typeGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as StockModel;
              final responseEntity =
                  responseEntities.whereType<StockModel>().firstWhereOrNull(
                        (e) => e.clientReferenceId == entity.clientReferenceId,
                      );

              final serverGeneratedId = responseEntity?.id;

              if (serverGeneratedId != null) {
                local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    dataOperation: element.operation,
                  ),
                );
              }
            }

            break;

          case DataModelType.stockReconciliation:
            responseEntities =
                await remote.search(StockReconciliationSearchModel(
              clientReferenceId: entities
                  .whereType<StockReconciliationModel>()
                  .map((e) => e.clientReferenceId)
                  .whereNotNull()
                  .toList(),
            ));

            for (var element in typeGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as StockReconciliationModel;
              final responseEntity = responseEntities
                  .whereType<StockReconciliationModel>()
                  .firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

              final serverGeneratedId = responseEntity?.id;

              if (serverGeneratedId != null) {
                local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    dataOperation: element.operation,
                  ),
                );
              }
            }

            break;

          case DataModelType.complaints:
            final futures = entities
                .whereType<PgrServiceModel>()
                .map((e) => e.serviceRequestId)
                .whereNotNull()
                .map(
              (e) {
                final future = remote.search(PgrServiceSearchModel(
                  serviceRequestId: e,
                ));

                return Future.sync(() => future);
              },
            );

            final resolvedFutures = await Future.wait(futures);

            responseEntities = resolvedFutures
                .expand((element) => element)
                .whereType<PgrServiceModel>()
                .toList();

            for (var element in typeGroupedEntity.value) {
              if (element.id == null) return;
              final entity = element.entity as PgrServiceModel;
              final responseEntity = responseEntities
                  .whereType<PgrServiceModel>()
                  .firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

              final serverGeneratedId = responseEntity?.serviceRequestId;

              if (serverGeneratedId != null) {
                local.opLogManager.updateServerGeneratedIds(
                  model: UpdateServerGeneratedIdModel(
                    clientReferenceId: entity.clientReferenceId,
                    serverGeneratedId: serverGeneratedId,
                    dataOperation: element.operation,
                  ),
                );
              }
            }

            break;

          default:
            continue;
        }

        for (var element in responseEntities) {
          await local.update(element, createOpLog: false);
        }
      }
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

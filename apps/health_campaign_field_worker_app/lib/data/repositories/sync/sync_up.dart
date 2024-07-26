import 'dart:async';

import 'package:closed_household/closed_household.dart';
import 'package:collection/collection.dart';
import 'package:digit_components/utils/app_logger.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/task.dart';

import '../../../models/bandwidth/bandwidth_model.dart';
import '../../../utils/environment_config.dart';
import 'remote_type.dart';

class PerformSyncUp {
  static FutureOr<void> syncUp({
    required BandwidthModel bandwidthModel,
    required List<LocalRepository> localRepositories,
    required List<RemoteRepository> remoteRepositories,
  }) async {
    const taskResourceIdKey = 'taskResourceId';
    const individualIdentifierIdKey = 'individualIdentifierId';
    const householdAddressIdKey = 'householdAddressId';
    const individualAddressIdKey = 'individualAddressId';

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
              var updatedEntity =
                  local.opLogManager.applyServerGeneratedIdToEntity(
                oplogEntryEntity,
                serverGeneratedId,
                rowVersion,
              );

              if (updatedEntity is HouseholdModel) {
                final addressId = e.additionalIds.firstWhereOrNull(
                  (element) {
                    return element.idType == householdAddressIdKey;
                  },
                )?.id;

                updatedEntity = updatedEntity.copyWith(
                  address: updatedEntity.address?.copyWith(
                    id: updatedEntity.address?.id ?? addressId,
                  ),
                );
              }

              if (updatedEntity is IndividualModel) {
                final identifierId = e.additionalIds.firstWhereOrNull(
                  (element) {
                    return element.idType == individualIdentifierIdKey;
                  },
                )?.id;

                final addressId = e.additionalIds.firstWhereOrNull(
                  (element) {
                    return element.idType == individualAddressIdKey;
                  },
                )?.id;

                updatedEntity = updatedEntity.copyWith(
                  identifiers: updatedEntity.identifiers?.map((e) {
                    return e.copyWith(
                      id: e.id ?? identifierId,
                    );
                  }).toList(),
                  address: updatedEntity.address?.map((e) {
                    return e.copyWith(
                      id: e.id ?? addressId,
                    );
                  }).toList(),
                );
              }

              if (updatedEntity is TaskModel) {
                final resourceId = e.additionalIds
                    .firstWhereOrNull(
                      (element) => element.idType == taskResourceIdKey,
                    )
                    ?.id;

                updatedEntity = updatedEntity.copyWith(
                  resources: updatedEntity.resources?.map((e) {
                    if (resourceId != null) {
                      return e.copyWith(
                        taskId: serverGeneratedId,
                        id: e.id ?? resourceId,
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
    }

    final futures = await Future.wait(
      localRepositories
          .map((e) => e.getItemsToBeSyncedUp(bandwidthModel.userId)),
    );

    final pendingSyncEntries = futures.expand((e) => e).toList();
    pendingSyncEntries.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    final groupedEntries = pendingSyncEntries.groupListsBy(
      (element) => element.type,
    );

// Note : Sort the entries by DataModelType enum
    final entries = groupedEntries.entries.toList();
    entries.sort((a, b) => DataModelType.values
        .indexOf(a.key)
        .compareTo(DataModelType.values.indexOf(b.key)));

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

        // [returns list of oplogs whose nonRecoverableError is false and retry count is equal to configured value]
        final nonRecoverableErrorList = operationGroupedEntity.value
            .where((element) =>
                !element.nonRecoverableError &&
                element.syncDownRetryCount >=
                    envConfig.variables.syncDownRetryCount)
            .toList();

        final List<List<OpLogEntry<EntityModel>>> listOfBatchedOpLogList =
            opLogList.slices(bandwidthModel.batchSize).toList();

        final List<List<OpLogEntry<EntityModel>>> listOfBatchedOpLogErrorList =
            opLogErrorList.slices(bandwidthModel.batchSize).toList();

        final List<List<OpLogEntry<EntityModel>>>
            listOfBatchedNonRecoverableErrorList =
            nonRecoverableErrorList.slices(bandwidthModel.batchSize).toList();

        if (listOfBatchedNonRecoverableErrorList.isNotEmpty) {
          for (final sublist in listOfBatchedNonRecoverableErrorList) {
            final nonRecoverableErrorEntities = getEntityModel(sublist, local);
            await remote.dumpError(
              nonRecoverableErrorEntities,
              operationGroupedEntity.key,
            );
            for (final syncedEntity in sublist) {
              if (syncedEntity.type == DataModelType.complaints) continue;
              await local.markSyncedUp(
                entry: syncedEntity,
                nonRecoverableError: syncedEntity.nonRecoverableError,
                clientReferenceId: syncedEntity.clientReferenceId,
                id: syncedEntity.id,
              );
            }
          }
        }

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
        if (listOfBatchedOpLogList.isNotEmpty) {
          for (final sublist in listOfBatchedOpLogList) {
            final entities = getEntityModel(sublist, local);
            if (operationGroupedEntity.key == DataOperation.create) {
              switch (typeGroupedEntity.key) {
                case DataModelType.complaints:
                  for (final entity in entities) {
                    if (remote is PgrServiceRemoteRepository &&
                        entity is PgrServiceModel) {
                      final response = await remote.create(entity);
                      final responseData = response.data;
                      if (responseData is! Map<String, dynamic>) {
                        AppLogger.instance.error(
                          title: 'NetworkManager : PgrServiceRemoteRepository',
                          message: responseData,
                          stackTrace: StackTrace.current,
                        );
                        continue;
                      }

                      PgrServiceCreateResponseModel
                          pgrServiceCreateResponseModel;
                      PgrComplaintResponseModel pgrComplaintModel;
                      try {
                        pgrServiceCreateResponseModel =
                            PgrServiceCreateResponseModelMapper.fromMap(
                          responseData,
                        );
                        pgrComplaintModel =
                            pgrServiceCreateResponseModel.serviceWrappers.first;
                      } catch (e) {
                        rethrow;
                      }

                      final service = pgrComplaintModel.service;
                      final serviceRequestId = service.serviceRequestId;

                      if (serviceRequestId == null ||
                          serviceRequestId.isEmpty) {
                        AppLogger.instance.error(
                          title: 'NetworkManager : PgrServiceRemoteRepository',
                          message: 'Service Request ID is null',
                          stackTrace: StackTrace.current,
                        );
                        continue;
                      }

                      await local.markSyncedUp(
                        entry: sublist.firstWhere((element) =>
                            element.clientReferenceId ==
                            entity.clientReferenceId),
                        clientReferenceId: entity.clientReferenceId,
                        nonRecoverableError: entity.nonRecoverableError,
                      );

                      await local.opLogManager.updateServerGeneratedIds(
                        model: UpdateServerGeneratedIdModel(
                          clientReferenceId: entity.clientReferenceId,
                          serverGeneratedId: serviceRequestId,
                          dataOperation: operationGroupedEntity.key,
                          rowVersion: entity.rowVersion,
                        ),
                      );

                      await local.update(
                        entity.copyWith(
                          serviceRequestId: serviceRequestId,
                          id: service.id,
                          applicationStatus: service.applicationStatus,
                          accountId: service.accountId,
                        ),
                        createOpLog: false,
                      );
                    }
                  }
                  break;
                default:
                  await remote.bulkCreate(entities);
              }
            } else if (operationGroupedEntity.key == DataOperation.update) {
              await Future.delayed(const Duration(seconds: 1));
              await remote.bulkUpdate(entities);
            } else if (operationGroupedEntity.key == DataOperation.delete) {
              await Future.delayed(const Duration(seconds: 1));
              await remote.bulkDelete(entities);
            }
            if (operationGroupedEntity.key == DataOperation.singleCreate) {
              for (var element in entities) {
                await remote.singleCreate(element);
              }
            }
            for (final syncedEntity in sublist) {
              if (syncedEntity.type == DataModelType.complaints) continue;
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

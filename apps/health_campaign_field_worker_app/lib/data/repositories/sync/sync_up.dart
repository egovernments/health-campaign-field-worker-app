import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_components/utils/app_logger.dart';

import '../../../models/bandwidth/bandwidth_model.dart';
import '../../../models/data_model.dart';
import '../../data_repository.dart';
import '../../network_manager.dart';
import '../oplog/oplog.dart';
import '../remote/pgr_service.dart';
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

    for (final typeGroupedEntity in groupedEntries.entries) {
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
        final entities = operationGroupedEntity.value
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

                if (updatedEntity is SideEffectModel) {
                  updatedEntity = updatedEntity.copyWith(id: serverGeneratedId);
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

                  PgrServiceCreateResponseModel pgrServiceCreateResponseModel;
                  PgrComplaintResponseModel pgrComplaintModel;
                  try {
                    pgrServiceCreateResponseModel =
                        Mapper.fromMap<PgrServiceCreateResponseModel>(
                      responseData,
                    );
                    pgrComplaintModel =
                        pgrServiceCreateResponseModel.serviceWrappers.first;
                  } catch (e) {
                    rethrow;
                  }

                  final service = pgrComplaintModel.service;
                  final serviceRequestId = service.serviceRequestId;

                  if (serviceRequestId == null || serviceRequestId.isEmpty) {
                    AppLogger.instance.error(
                      title: 'NetworkManager : PgrServiceRemoteRepository',
                      message: 'Service Request ID is null',
                      stackTrace: StackTrace.current,
                    );
                    continue;
                  }

                  await local.markSyncedUp(
                    clientReferenceId: entity.clientReferenceId,
                  );

                  await local.opLogManager.updateServerGeneratedIds(
                    model: UpdateServerGeneratedIdModel(
                      clientReferenceId: entity.clientReferenceId,
                      serverGeneratedId: serviceRequestId,
                      dataOperation: operationGroupedEntity.key,
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
              final List<EntityModel> items = await filterEntitybyBandwidth(
                bandwidthModel.batchSize,
                entities,
              );
              if (entities.isNotEmpty) {
                if (items.isNotEmpty) {
                  await remote.bulkCreate(items);
                }
              }
          }
        } else if (operationGroupedEntity.key == DataOperation.update) {
          final List<EntityModel> items = await filterEntitybyBandwidth(
            bandwidthModel.batchSize,
            entities,
          );
          if (entities.isNotEmpty) {
            if (items.isNotEmpty) {
              await remote.bulkUpdate(items);
            }
          }
        } else if (operationGroupedEntity.key == DataOperation.delete) {
          final List<EntityModel> items = await filterEntitybyBandwidth(
            bandwidthModel.batchSize,
            entities,
          );
          await remote.bulkDelete(items);
        }
        if (operationGroupedEntity.key == DataOperation.singleCreate) {
          for (var element in entities) {
            await remote.singleCreate(element);
          }
        }

        final items = await filterOpLogByBandwidth(
          bandwidthModel.batchSize,
          operationGroupedEntity.value,
        );
        for (final syncedEntity in items) {
          if (syncedEntity.type == DataModelType.complaints) continue;
          await local.markSyncedUp(entry: syncedEntity);
        }
      }
    }
  }
}

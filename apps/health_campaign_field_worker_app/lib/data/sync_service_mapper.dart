import 'dart:async';
import 'dart:convert';

import 'package:attendance_management/attendance_management.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:referral_reconciliation/referral_reconciliation.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:sync_service/data/repositories/sync/remote_type.dart';
import 'package:sync_service/data/sync_entity_mapper_listener.dart';

import '../utils/environment_config.dart';

class SyncServiceMapper extends SyncEntityMapperListener {
  @override
  FutureOr<void> writeToEntityDB(
      Map<String, dynamic> response,
      List<LocalRepository<EntityModel, EntitySearchModel>>
          localRepositories, bool isForceDownSync) async {
    try {
      for (int i = 0; i <= response.keys.length - 1; i++) {
        if (response.keys.elementAt(i) != 'DownsyncCriteria') {
          final local = RepositoryType.getLocalForType(
            DataModels.getDataModelForEntityName(response.keys.elementAt(i)),
            localRepositories,
          );
          
          final insertMode  = isForceDownSync ? InsertMode.insertOrIgnore : InsertMode.insertOrReplace;
          final List<dynamic> entityResponse =
              response[response.keys.elementAt(i)] ?? [];

          final entityList =
              entityResponse.whereType<Map<String, dynamic>>().toList();

          switch (response.keys.elementAt(i)) {
            case "Individuals":
              final entity = entityList
                  .map((e) => IndividualModelMapper.fromJson(jsonEncode(e)))
                  .toList();
              await local.bulkCreate(entity, mode: insertMode);
            case "Households":
              final entity = entityList
                  .map((e) => HouseholdModelMapper.fromJson(jsonEncode(e)))
                  .toList();
              await local.bulkCreate(entity, mode: insertMode);
            case "HouseholdMembers":
              final entity = entityList
                  .map(
                    (e) => HouseholdMemberModelMapper.fromJson(
                      jsonEncode(e),
                    ),
                  )
                  .toList();
              await local.bulkCreate(entity, mode: insertMode);
            case "ProjectBeneficiaries":
              final entity = entityList
                  .map((e) =>
                      ProjectBeneficiaryModelMapper.fromJson(jsonEncode(e)))
                  .toList();
              await local.bulkCreate(entity, mode: insertMode);
            case "Tasks":
              final entity = entityList
                  .map((e) => TaskModelMapper.fromJson(jsonEncode(e)))
                  .toList();
              await local.bulkCreate(entity, mode: insertMode);
            case "SideEffects":
              final entity = entityList
                  .map((e) => SideEffectModelMapper.fromJson(jsonEncode(e)))
                  .toList();
              await local.bulkCreate(entity, mode: insertMode);
            case "Referrals":
              final entity = entityList
                  .map((e) => ReferralModelMapper.fromJson(jsonEncode(e)))
                  .toList();
              await local.bulkCreate(entity, mode: insertMode);
            default:
              final entity = entityList
                  .map((e) => EntityModelMapper.fromJson(jsonEncode(e)))
                  .toList();
              await local.bulkCreate(entity, mode: insertMode);
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  int getSyncCount(List<OpLog> opLogs) {
    int count = opLogs.where((element) {
      if (element.syncedDown == false && element.syncedUp == true) {
        switch (element.entityType) {
          case DataModelType.household:
          case DataModelType.individual:
          case DataModelType.householdMember:
          case DataModelType.projectBeneficiary:
          case DataModelType.task:
          case DataModelType.stock:
          case DataModelType.stockReconciliation:
          case DataModelType.sideEffect:
          case DataModelType.referral:
          case DataModelType.hFReferral:
          case DataModelType.attendance:
            return true;
          default:
            return false;
        }
      } else {
        switch (element.entityType) {
          case DataModelType.household:
          case DataModelType.individual:
          case DataModelType.householdMember:
          case DataModelType.projectBeneficiary:
          case DataModelType.task:
          case DataModelType.stock:
          case DataModelType.stockReconciliation:
          case DataModelType.service:
          case DataModelType.complaints:
          case DataModelType.sideEffect:
          case DataModelType.referral:
          case DataModelType.hFReferral:
          case DataModelType.attendance:
          case DataModelType.userLocation:
            return true;
          default:
            return false;
        }
      }
    }).length;

    return count;
  }

  @override
  Future<List<EntityModel>> syncDownEntityResponse(
      MapEntry<DataModelType, List<OpLogEntry<EntityModel>>> typeGroupedEntity,
      MapEntry<DataOperation, List<OpLogEntry<EntityModel>>>
          operationGroupedEntity,
      List<EntityModel> entities,
      RemoteRepository<EntityModel, EntitySearchModel> remote,
      LocalRepository<EntityModel, EntitySearchModel> local) async {
    List<EntityModel> responseEntities = [];
    const taskResourceIdKey = 'taskResourceId';
    const individualIdentifierIdKey = 'individualIdentifierId';
    const householdAddressIdKey = 'householdAddressId';
    const individualAddressIdKey = 'individualAddressId';

    switch (typeGroupedEntity.key) {
      case DataModelType.individual:
        responseEntities = await remote.search(IndividualSearchModel(
          clientReferenceId: entities
              .whereType<IndividualModel>()
              .map((e) => e.clientReferenceId)
              .whereNotNull()
              .toList(),
          isDeleted: true,
        ));

        for (var element in operationGroupedEntity.value) {
          if (element.id == null) continue;
          final entity = element.entity as IndividualModel;
          final responseEntity =
              responseEntities.whereType<IndividualModel>().firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            final identifierAdditionalIds = responseEntity?.identifiers
                ?.map((e) {
                  final id = e.id;

                  if (id == null) return null;

                  return AdditionalId(
                    idType: individualIdentifierIdKey,
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
                    idType: individualAddressIdKey,
                    id: id,
                  );
                })
                .whereNotNull()
                .toList();

            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                nonRecoverableError: entity.nonRecoverableError,
                additionalIds: [
                  if (identifierAdditionalIds != null)
                    ...identifierAdditionalIds,
                  if (addressAdditionalIds != null) ...addressAdditionalIds,
                ],
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);

            if (markAsNonRecoverable) {
              await local.update(
                entity.copyWith(
                  nonRecoverableError: true,
                ),
                createOpLog: false,
              );
            }
          }
        }

        break;

      case DataModelType.household:
        responseEntities = await remote.search(HouseholdSearchModel(
          clientReferenceId: entities
              .whereType<HouseholdModel>()
              .map((e) => e.clientReferenceId)
              .whereNotNull()
              .toList(),
          isDeleted: true,
        ));

        for (var element in operationGroupedEntity.value) {
          if (element.id == null) continue;
          final entity = element.entity as HouseholdModel;
          final responseEntity =
              responseEntities.whereType<HouseholdModel>().firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            final addressAdditionalId = responseEntity?.address?.id == null
                ? null
                : AdditionalId(
                    idType: householdAddressIdKey,
                    id: responseEntity!.address!.id!,
                  );

            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                additionalIds: [
                  if (addressAdditionalId != null) addressAdditionalId,
                ],
                dataOperation: element.operation,
                rowVersion: rowVersion,
                nonRecoverableError: element.nonRecoverableError,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);

            if (markAsNonRecoverable) {
              await local.update(
                entity.copyWith(
                  nonRecoverableError: true,
                ),
                createOpLog: false,
              );
            }
          }
        }

        break;

      case DataModelType.householdMember:
        responseEntities = await remote.search(HouseholdMemberSearchModel(
          clientReferenceId: entities
              .whereType<HouseholdMemberModel>()
              .map((e) => e.clientReferenceId)
              .whereNotNull()
              .toList(),
          isDeleted: true,
        ));

        for (var element in operationGroupedEntity.value) {
          if (element.id == null) continue;
          final entity = element.entity as HouseholdMemberModel;
          final responseEntity = responseEntities
              .whereType<HouseholdMemberModel>()
              .firstWhereOrNull(
                (e) => e.clientReferenceId == entity.clientReferenceId,
              );
          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);

            if (markAsNonRecoverable) {
              await local.update(
                entity.copyWith(
                  nonRecoverableError: true,
                ),
                createOpLog: false,
              );
            }
          }
        }

        break;

      case DataModelType.sideEffect:
        responseEntities = await remote.search(SideEffectSearchModel(
          clientReferenceId: entities
              .whereType<SideEffectModel>()
              .map((e) => e.clientReferenceId)
              .whereNotNull()
              .toList(),
          isDeleted: true,
        ));

        for (var element in typeGroupedEntity.value) {
          if (element.id == null) continue;
          final entity = element.entity as SideEffectModel;
          var responseEntity =
              responseEntities.whereType<SideEffectModel>().firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);

            if (markAsNonRecoverable) {
              await local.update(
                entity.copyWith(
                  nonRecoverableError: true,
                ),
                createOpLog: false,
              );
            }
          }
        }

      case DataModelType.referral:
        responseEntities = await remote.search(ReferralSearchModel(
          clientReferenceId: entities
              .whereType<ReferralModel>()
              .map((e) => e.clientReferenceId)
              .whereNotNull()
              .toList(),
          isDeleted: true,
        ));

        for (var element in typeGroupedEntity.value) {
          if (element.id == null) continue;
          final entity = element.entity as ReferralModel;
          var responseEntity =
              responseEntities.whereType<ReferralModel>().firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);

            if (markAsNonRecoverable) {
              await local.update(
                entity.copyWith(
                  nonRecoverableError: true,
                ),
                createOpLog: false,
              );
            }
          }
        }

      case DataModelType.projectBeneficiary:
        responseEntities = await remote.search(ProjectBeneficiarySearchModel(
          clientReferenceId: entities
              .whereType<ProjectBeneficiaryModel>()
              .map((e) => e.clientReferenceId)
              .whereNotNull()
              .toList(),
          isDeleted: true,
        ));

        for (var element in operationGroupedEntity.value) {
          if (element.id == null) continue;
          final entity = element.entity as ProjectBeneficiaryModel;
          final responseEntity = responseEntities
              .whereType<ProjectBeneficiaryModel>()
              .firstWhereOrNull(
                (e) => e.clientReferenceId == entity.clientReferenceId,
              );
          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);

            if (markAsNonRecoverable) {
              await local.update(
                entity.copyWith(
                  nonRecoverableError: true,
                ),
                createOpLog: false,
              );
            }
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
          isDeleted: true,
        ));

        for (var element in operationGroupedEntity.value) {
          if (element.id == null) continue;
          final taskModel = element.entity as TaskModel;
          var responseEntity =
              responseEntities.whereType<TaskModel>().firstWhereOrNull(
                    (e) => e.clientReferenceId == taskModel.clientReferenceId,
                  );

          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;

          if (serverGeneratedId != null) {
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: taskModel.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                additionalIds: responseEntity?.resources
                    ?.map((e) {
                      final id = e.id;
                      if (id == null) return null;

                      return AdditionalId(
                        idType: taskResourceIdKey,
                        id: id,
                      );
                    })
                    .whereNotNull()
                    .toList(),
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(taskModel.clientReferenceId);

            if (markAsNonRecoverable) {
              await local.update(
                taskModel.copyWith(
                  nonRecoverableError: true,
                ),
                createOpLog: false,
              );
            }
          }
        }

        break;
      case DataModelType.hFReferral:
        responseEntities = await remote.search(
          HFReferralSearchModel(
            clientReferenceId: entities
                .whereType<HFReferralModel>()
                .map((e) => e.clientReferenceId)
                .whereNotNull()
                .toList(),
          ),
        );

        for (var element in operationGroupedEntity.value) {
          if (element.id == null) continue;
          final entity = element.entity as HFReferralModel;
          final responseEntity =
              responseEntities.whereType<HFReferralModel>().firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                nonRecoverableError: entity.nonRecoverableError,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);

            if (markAsNonRecoverable) {
              await local.update(
                entity.copyWith(
                  nonRecoverableError: true,
                ),
                createOpLog: false,
              );
            }
          }
        }

        break;

      case DataModelType.attendance:
        responseEntities = await remote.search(AttendanceLogSearchModel(
          clientReferenceId: entities
              .whereType<AttendanceLogModel>()
              .map((e) => e.clientReferenceId!)
              .whereNotNull()
              .toList(),
          tenantId: envConfig.variables.tenantId,
        ));

        for (var element in operationGroupedEntity.value) {
          if (element.id == null) continue;
          final entity = element.entity as AttendanceLogModel;
          final responseEntity =
              responseEntities.whereType<AttendanceLogModel>().firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId.toString(),
                serverGeneratedId: serverGeneratedId,
                nonRecoverableError: entity.nonRecoverableError,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable =
                await local.opLogManager.updateSyncDownRetry(
              entity.clientReferenceId.toString(),
            );

            if (markAsNonRecoverable) {
              await local.update(
                entity.copyWith(
                  nonRecoverableError: true,
                ),
                createOpLog: false,
              );
            }
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

        for (var element in operationGroupedEntity.value) {
          if (element.id == null) continue;
          final entity = element.entity as StockModel;
          final responseEntity =
              responseEntities.whereType<StockModel>().firstWhereOrNull(
                    (e) => e.clientReferenceId == entity.clientReferenceId,
                  );

          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;

          if (serverGeneratedId != null) {
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId!,
                serverGeneratedId: serverGeneratedId,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);

            if (markAsNonRecoverable) {
              await local.update(
                entity.copyWith(
                  nonRecoverableError: true,
                ),
                createOpLog: false,
              );
            }
          }
        }

        break;

      case DataModelType.stockReconciliation:
        responseEntities = await remote.search(StockReconciliationSearchModel(
          clientReferenceId: entities
              .whereType<StockReconciliationModel>()
              .map((e) => e.clientReferenceId)
              .whereNotNull()
              .toList(),
        ));

        for (var element in operationGroupedEntity.value) {
          if (element.id == null) continue;
          final entity = element.entity as StockReconciliationModel;
          final responseEntity = responseEntities
              .whereType<StockReconciliationModel>()
              .firstWhereOrNull(
                (e) => e.clientReferenceId == entity.clientReferenceId,
              );

          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;

          if (serverGeneratedId != null) {
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);

            if (markAsNonRecoverable) {
              await local.update(
                entity.copyWith(
                  nonRecoverableError: true,
                ),
                createOpLog: false,
              );
            }
          }
        }

        break;

      // Note: Uncomment the following code block to enable complaints sync down

      // case DataModelType.complaints:
      //   if (remote is! PgrServiceRemoteRepository) return responseEntities;
      //
      //   final futures = entities
      //       .whereType<PgrServiceModel>()
      //       .map((e) => e.serviceRequestId)
      //       .whereNotNull()
      //       .map(
      //     (e) {
      //       final future = remote.searchWithoutClientReferenceId(
      //         PgrServiceSearchModel(
      //           serviceRequestId: e,
      //         ),
      //       );
      //
      //       return Future.sync(() => future);
      //     },
      //   );
      //
      //   final resolvedFutures = await Future.wait(futures);
      //
      //   responseEntities = resolvedFutures
      //       .expand((element) => element)
      //       .whereType<PgrServiceResponseModel>()
      //       // We only need serviceRequestId and application status
      //       .map((e) => PgrServiceModel(
      //             clientReferenceId: '',
      //             tenantId: e.tenantId ?? '',
      //             serviceCode: e.serviceCode ?? '',
      //             description: e.description ?? '',
      //             serviceRequestId: e.serviceRequestId,
      //             applicationStatus: e.applicationStatus ??
      //                 PgrServiceApplicationStatus.pendingAssignment,
      //             user: PgrComplainantModel(
      //               clientReferenceId: '',
      //               tenantId: '',
      //               complaintClientReferenceId: e.serviceRequestId ?? '',
      //             ),
      //             address: PgrAddressModel(),
      //           ))
      //       .toList();
      //
      //   for (var element in operationGroupedEntity.value) {
      //     if (element.id == null) continue;
      //     final entity = element.entity as PgrServiceModel;
      //     final responseEntity =
      //         responseEntities.whereType<PgrServiceModel>().firstWhereOrNull(
      //               (e) => e.clientReferenceId == entity.clientReferenceId,
      //             );
      //
      //     final serverGeneratedId = responseEntity?.serviceRequestId;
      //     final rowVersion = responseEntity?.rowVersion;
      //
      //     if (serverGeneratedId != null) {
      //       await local.opLogManager.updateServerGeneratedIds(
      //         model: UpdateServerGeneratedIdModel(
      //           clientReferenceId: entity.clientReferenceId,
      //           serverGeneratedId: serverGeneratedId,
      //           dataOperation: element.operation,
      //           rowVersion: rowVersion,
      //         ),
      //       );
      //     }
      //   }
      //   break;

      default:
        break;
    }

    return responseEntities;
  }

  @override
  EntityModel updatedEntity(EntityModel entity, OpLogEntry<EntityModel> e,
      String? serverGeneratedId) {
    var updatedEntity = entity;

    const taskResourceIdKey = 'taskResourceId';
    const individualIdentifierIdKey = 'individualIdentifierId';
    const householdAddressIdKey = 'householdAddressId';
    const individualAddressIdKey = 'individualAddressId';

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
}

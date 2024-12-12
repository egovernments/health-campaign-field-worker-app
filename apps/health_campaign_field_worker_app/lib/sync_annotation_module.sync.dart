import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:referral_reconciliation/referral_reconciliation.dart';
import 'package:registration_delivery/registration_delivery.dart';

class SyncDownEntity {
  syncEntities(
      MapEntry<DataModelType, List<OpLogEntry<EntityModel>>> typeGroupedEntity,
      MapEntry<DataOperation, List<OpLogEntry<EntityModel>>>
          operationGroupedEntity,
      List<EntityModel> entities,
      List<EntityModel> responseEntities,
      RemoteRepository<EntityModel, EntitySearchModel> remote,
      LocalRepository<EntityModel, EntitySearchModel> local) async {
    switch (typeGroupedEntity.key.name) {
      case "individual":
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
          final responseEntity = responseEntities
              .whereType<IndividualModel>()
              .firstWhereOrNull(
                  (e) => e.clientReferenceId == entity.clientReferenceId);
          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            final additionalIds = <AdditionalId>[];
            final addressAdditionalIds = responseEntity?.address
                ?.map((e) {
                  final id = e.id;
                  if (id == null) return null;
                  return AdditionalId(
                    idType: "individualAddressId",
                    id: id,
                  );
                })
                .whereNotNull()
                .toList();
            if (addressAdditionalIds != null) {
              additionalIds.addAll(addressAdditionalIds ?? []);
            }
            final identifiersAdditionalIds = responseEntity?.identifiers
                ?.map((e) {
                  final id = e.id;
                  if (id == null) return null;
                  return AdditionalId(
                    idType: "individualIdentifierSId",
                    id: id,
                  );
                })
                .whereNotNull()
                .toList();
            if (identifiersAdditionalIds != null) {
              additionalIds.addAll(identifiersAdditionalIds ?? []);
            }
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                nonRecoverableError: entity.nonRecoverableError,
                additionalIds: additionalIds,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);
            if (markAsNonRecoverable) {
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
            }
          }
        }
        break;
      case "household":
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
          final responseEntity = responseEntities
              .whereType<HouseholdModel>()
              .firstWhereOrNull(
                  (e) => e.clientReferenceId == entity.clientReferenceId);
          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            final additionalIds = <AdditionalId>[];
            final addressAdditionalIds = responseEntity?.address!.id == null
                ? null
                : AdditionalId(
                    idType: "householdAddressId",
                    id: responseEntity!.address!.id!,
                  );
            if (addressAdditionalIds != null) {
              additionalIds.addAll([addressAdditionalIds!] ?? []);
            }
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                nonRecoverableError: entity.nonRecoverableError,
                additionalIds: additionalIds,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);
            if (markAsNonRecoverable) {
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
            }
          }
        }
        break;
      case "projectBeneficiary":
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
                  (e) => e.clientReferenceId == entity.clientReferenceId);
          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            final additionalIds = <AdditionalId>[];
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                nonRecoverableError: entity.nonRecoverableError,
                additionalIds: additionalIds,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);
            if (markAsNonRecoverable) {
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
            }
          }
        }
        break;
      case "householdMember":
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
                  (e) => e.clientReferenceId == entity.clientReferenceId);
          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            final additionalIds = <AdditionalId>[];
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                nonRecoverableError: entity.nonRecoverableError,
                additionalIds: additionalIds,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);
            if (markAsNonRecoverable) {
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
            }
          }
        }
        break;
      case "stock":
        responseEntities = await remote.search(StockSearchModel(
          clientReferenceId: entities
              .whereType<StockModel>()
              .map((e) => e.clientReferenceId)
              .whereNotNull()
              .toList(),
          isDeleted: true,
        ));
        for (var element in operationGroupedEntity.value) {
          if (element.id == null) continue;
          final entity = element.entity as StockModel;
          final responseEntity = responseEntities
              .whereType<StockModel>()
              .firstWhereOrNull(
                  (e) => e.clientReferenceId == entity.clientReferenceId);
          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            final additionalIds = <AdditionalId>[];
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                nonRecoverableError: entity.nonRecoverableError,
                additionalIds: additionalIds,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);
            if (markAsNonRecoverable) {
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
            }
          }
        }
        break;
      case "stockReconciliation":
        responseEntities = await remote.search(StockReconciliationSearchModel(
          clientReferenceId: entities
              .whereType<StockReconciliationModel>()
              .map((e) => e.clientReferenceId)
              .whereNotNull()
              .toList(),
          isDeleted: true,
        ));
        for (var element in operationGroupedEntity.value) {
          if (element.id == null) continue;
          final entity = element.entity as StockReconciliationModel;
          final responseEntity = responseEntities
              .whereType<StockReconciliationModel>()
              .firstWhereOrNull(
                  (e) => e.clientReferenceId == entity.clientReferenceId);
          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            final additionalIds = <AdditionalId>[];
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                nonRecoverableError: entity.nonRecoverableError,
                additionalIds: additionalIds,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);
            if (markAsNonRecoverable) {
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
            }
          }
        }
        break;
      case "task":
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
          final entity = element.entity as TaskModel;
          final responseEntity = responseEntities
              .whereType<TaskModel>()
              .firstWhereOrNull(
                  (e) => e.clientReferenceId == entity.clientReferenceId);
          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            final additionalIds = <AdditionalId>[];
            final resourcesAdditionalIds = responseEntity?.resources
                ?.map((e) {
                  final id = e.id;
                  if (id == null) return null;
                  return AdditionalId(
                    idType: "taskResourceSId",
                    id: id,
                  );
                })
                .whereNotNull()
                .toList();
            if (resourcesAdditionalIds != null) {
              additionalIds.addAll(resourcesAdditionalIds ?? []);
            }
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                nonRecoverableError: entity.nonRecoverableError,
                additionalIds: additionalIds,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);
            if (markAsNonRecoverable) {
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
            }
          }
        }
        break;
      case "sideEffect":
        responseEntities = await remote.search(SideEffectSearchModel(
          clientReferenceId: entities
              .whereType<SideEffectModel>()
              .map((e) => e.clientReferenceId)
              .whereNotNull()
              .toList(),
          isDeleted: true,
        ));
        for (var element in operationGroupedEntity.value) {
          if (element.id == null) continue;
          final entity = element.entity as SideEffectModel;
          final responseEntity = responseEntities
              .whereType<SideEffectModel>()
              .firstWhereOrNull(
                  (e) => e.clientReferenceId == entity.clientReferenceId);
          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            final additionalIds = <AdditionalId>[];
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                nonRecoverableError: entity.nonRecoverableError,
                additionalIds: additionalIds,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);
            if (markAsNonRecoverable) {
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
            }
          }
        }
        break;
      case "referral":
        responseEntities = await remote.search(ReferralSearchModel(
          clientReferenceId: entities
              .whereType<ReferralModel>()
              .map((e) => e.clientReferenceId)
              .whereNotNull()
              .toList(),
          isDeleted: true,
        ));
        for (var element in operationGroupedEntity.value) {
          if (element.id == null) continue;
          final entity = element.entity as ReferralModel;
          final responseEntity = responseEntities
              .whereType<ReferralModel>()
              .firstWhereOrNull(
                  (e) => e.clientReferenceId == entity.clientReferenceId);
          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            final additionalIds = <AdditionalId>[];
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                nonRecoverableError: entity.nonRecoverableError,
                additionalIds: additionalIds,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);
            if (markAsNonRecoverable) {
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
            }
          }
        }
        break;
      case "hFReferral":
        responseEntities = await remote.search(HFReferralSearchModel(
          clientReferenceId: entities
              .whereType<HFReferralModel>()
              .map((e) => e.clientReferenceId)
              .whereNotNull()
              .toList(),
          isDeleted: true,
        ));
        for (var element in operationGroupedEntity.value) {
          if (element.id == null) continue;
          final entity = element.entity as HFReferralModel;
          final responseEntity = responseEntities
              .whereType<HFReferralModel>()
              .firstWhereOrNull(
                  (e) => e.clientReferenceId == entity.clientReferenceId);
          final serverGeneratedId = responseEntity?.id;
          final rowVersion = responseEntity?.rowVersion;
          if (serverGeneratedId != null) {
            final additionalIds = <AdditionalId>[];
            await local.opLogManager.updateServerGeneratedIds(
              model: UpdateServerGeneratedIdModel(
                clientReferenceId: entity.clientReferenceId,
                serverGeneratedId: serverGeneratedId,
                nonRecoverableError: entity.nonRecoverableError,
                additionalIds: additionalIds,
                dataOperation: element.operation,
                rowVersion: rowVersion,
              ),
            );
          } else {
            final bool markAsNonRecoverable = await local.opLogManager
                .updateSyncDownRetry(entity.clientReferenceId);
            if (markAsNonRecoverable) {
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
            }
          }
        }
        break;
    }
    return responseEntities;
  }
}

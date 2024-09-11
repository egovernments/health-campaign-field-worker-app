import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart' hide DataModelType;

import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import 'package:referral_reconciliation/models/entities/hf_referral.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';
import 'package:registration_delivery/models/entities/referral.dart';
import 'package:registration_delivery/models/entities/side_effect.dart';
import 'package:registration_delivery/models/entities/task.dart';

import 'sync_annotation_module.dart';

class SyncDownEntity {
  Future<List<EntityModel>> syncEntities(
      MapEntry<DataModelType, List<OpLogEntry<EntityModel>>> typeGroupedEntity,
      MapEntry<DataOperation, List<OpLogEntry<EntityModel>>>
          operationGroupedEntity,
      List<EntityModel> entities,
      List<EntityModel> responseEntities,
      RemoteRepository<EntityModel, EntitySearchModel> remote,
      LocalRepository<EntityModel, EntitySearchModel> local) async {
    const taskResourceIdKey = "taskResourceId";
    const individualIdentifierIdKey = "individualIdentifierId";
    const householdAddressIdKey = "householdAddressId";
    const individualAddressIdKey = "individualAddressId";
    switch (typeGroupedEntity.key) {
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
                  (e) => e.clientReferenceId == entity.clientReferenceId);
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
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
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
                  (e) => e.clientReferenceId == entity.clientReferenceId);
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
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
            }
          }
        }
        break;
      case DataModelType.stock:
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
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
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
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
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
          final entity = element.entity as TaskModel;
          final responseEntity = responseEntities
              .whereType<TaskModel>()
              .firstWhereOrNull(
                  (e) => e.clientReferenceId == entity.clientReferenceId);
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
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
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
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
            }
          }
        }
        break;
      case DataModelType.referral:
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
              await local.update(entity.copyWith(nonRecoverableError: true),
                  createOpLog: false);
            }
          }
        }
        break;
      case DataModelType.hFReferral:
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

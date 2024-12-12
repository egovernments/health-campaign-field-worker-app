import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:sync_service/data/repositories/sync/remote_type.dart';
import 'package:sync_service/data/sync_entity_mapper_listener.dart';

import '../sync_annotation_module.sync.dart';

class SyncServiceMapper extends SyncEntityMapperListener {
  @override
  FutureOr<void> writeToEntityDB(
      Map<String, dynamic> response,
      List<LocalRepository<EntityModel, EntitySearchModel>>
          localRepositories) async {
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

    responseEntities = await SyncDownEntity().syncEntities(typeGroupedEntity,
        operationGroupedEntity, entities, responseEntities, remote, local);

    return responseEntities;
  }

  @override
  EntityModel updatedEntity(EntityModel entity, OpLogEntry<EntityModel> entry,
      String? serverGeneratedId) {
    var updatedEntity = entity;

    const taskResourceIdKey = 'taskResourceId';
    const individualIdentifierIdKey = 'individualIdentifierId';
    const householdAddressIdKey = 'householdAddressId';
    const individualAddressIdKey = 'individualAddressId';

    if (updatedEntity is HouseholdModel) {
      final addressId = entry.additionalIds.firstWhereOrNull(
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
      final identifierId = entry.additionalIds.firstWhereOrNull(
        (element) {
          return element.idType == individualIdentifierIdKey;
        },
      )?.id;

      final addressId = entry.additionalIds.firstWhereOrNull(
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
      final resourceId = entry.additionalIds
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

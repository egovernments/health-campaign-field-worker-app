import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:sync_service/data/repositories/sync/remote_type.dart';
import 'package:sync_service/data/sync_entity_mapper_listener.dart';

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

    return updatedEntity;
  }
}

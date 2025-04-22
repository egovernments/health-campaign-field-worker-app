import 'package:complaints/data/repositories/remote/pgr_service.dart';
import 'package:complaints/models/pgr_complaints.dart';
import 'package:complaints/models/pgr_complaints_response.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:sync_service/data/repositories/sync/sync_up.dart';

class CustomSyncRegistry implements SyncUpOperation {
  final RemoteRepository remote;

  CustomSyncRegistry(this.remote);

  @override
  Future<void> update(List<EntityModel> entities, LocalRepository local) async {
    try {
      await remote.bulkUpdate(entities);
    } catch (e) {
      debugPrint('$e');
    }
  }

  @override
  Future<void> delete(List<EntityModel> entities, LocalRepository local) async {
    try {
      await remote.bulkDelete(entities);
    } catch (e) {
      debugPrint('$e');
    }
  }

  @override
  Future<void> singleCreate(EntityModel entity, LocalRepository local) async {
    try {
      await remote.singleCreate(entity);
    } catch (e) {
      debugPrint('$e');
    }
  }


  @override
  Future<void> singleUpdate(EntityModel entity, LocalRepository local) async {
    try {
      await remote.singleUpdate(entity);
    } catch (e) {
      debugPrint('$e');
    }
  }

  @override
  Future<void> create(
      {required List<OpLogEntry<EntityModel>> entry,
      required List<EntityModel> entities,
      required LocalRepository<EntityModel, EntitySearchModel> local,
      required MapEntry<DataOperation, List<OpLogEntry<EntityModel>>>
          operationGroupedEntity,
      required MapEntry<DataModelType, List<OpLogEntry<EntityModel>>>
          typeGroupedEntity}) async {
    try {
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

              if (serviceRequestId == null || serviceRequestId.isEmpty) {
                AppLogger.instance.error(
                  title: 'NetworkManager : PgrServiceRemoteRepository',
                  message: 'Service Request ID is null',
                  stackTrace: StackTrace.current,
                );
                continue;
              }

              await local.markSyncedUp(
                entry: entry.firstWhere((element) =>
                    element.clientReferenceId == entity.clientReferenceId),
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
        default:
          await remote.bulkCreate(entities);
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  @override
  Future<void> localMarkSyncUp(List<OpLogEntry<EntityModel>> entity,
      LocalRepository<EntityModel, EntitySearchModel> local) async {
    for (final syncedEntity in entity) {
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

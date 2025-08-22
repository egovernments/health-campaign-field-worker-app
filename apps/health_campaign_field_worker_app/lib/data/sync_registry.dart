import 'package:digit_data_model/data_model.dart';
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

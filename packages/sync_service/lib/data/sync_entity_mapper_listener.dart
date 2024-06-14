import 'dart:async';

import 'package:digit_data_model/data_model.dart';

abstract class SyncEntityMapperListener {
  FutureOr<void> writeToEntityDB(
    Map<String, dynamic> response,
    List<LocalRepository> localRepositories,
  );

  int getSyncCount(List<OpLog> opLogs);

  Future<List<EntityModel>> entityResponse(
      MapEntry<DataModelType, List<OpLogEntry<EntityModel>>> typeGroupedEntity,
      MapEntry<DataOperation, List<OpLogEntry<EntityModel>>>
          operationGroupedEntity,
      List<EntityModel> entities,
      RemoteRepository<EntityModel, EntitySearchModel> remote,
      LocalRepository<EntityModel, EntitySearchModel> local);

  EntityModel updatedEntity(
      EntityModel entity, OpLogEntry<EntityModel> e, String? serverGeneratedId);
}

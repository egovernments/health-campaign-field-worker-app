import 'dart:async';

import 'package:digit_data_model/data_model.dart';

/// The `SyncEntityMapperListener` is an abstract class that defines methods for handling sync entity mapping.
///
/// This class provides methods for writing to the entity database, getting the sync count, handling entity responses, and updating entities.
abstract class SyncEntityMapperListener {
  /// Writes the given response to the entity database.
  ///
  /// This method accepts a `Map<String, dynamic>` response and a list of `LocalRepository` objects as parameters.
  /// It is expected to be overridden in a concrete implementation of `SyncEntityMapperListener`.
  FutureOr<void> writeToEntityDB(
    Map<String, dynamic> response,
    List<LocalRepository> localRepositories,
      bool isForceDownSync,
  );

  /// Returns the sync count for the given list of `OpLog` objects.
  ///
  /// This method accepts a list of `OpLog` objects as a parameter.
  /// It is expected to be overridden in a concrete implementation of `SyncEntityMapperListener`.
  int getSyncCount(List<OpLog> opLogs);

  /// Handles the entity response.
  ///
  /// This method accepts a `MapEntry` of `DataModelType` and a list of `OpLogEntry<EntityModel>` objects, another `MapEntry` of `DataOperation` and a list of `OpLogEntry<EntityModel>` objects, a list of `EntityModel` objects, a `RemoteRepository<EntityModel, EntitySearchModel>` object, and a `LocalRepository<EntityModel, EntitySearchModel>` object as parameters.
  /// It returns a `Future` that resolves to a list of `EntityModel` objects.
  /// It is expected to be overridden in a concrete implementation of `SyncEntityMapperListener`.
  Future<List<EntityModel>> syncDownEntityResponse(
      MapEntry<DataModelType, List<OpLogEntry<EntityModel>>> typeGroupedEntity,
      MapEntry<DataOperation, List<OpLogEntry<EntityModel>>>
          operationGroupedEntity,
      List<EntityModel> entities,
      RemoteRepository<EntityModel, EntitySearchModel> remote,
      LocalRepository<EntityModel, EntitySearchModel> local);

  /// Updates the given entity.
  ///
  /// This method accepts an `EntityModel` object, an `OpLogEntry<EntityModel>` object, and a `String` server generated ID as parameters.
  /// It returns an updated `EntityModel` object.
  /// It is expected to be overridden in a concrete implementation of `SyncEntityMapperListener`.
  EntityModel updatedEntity(
      EntityModel entity, OpLogEntry<EntityModel> entry, String? serverGeneratedId);
}

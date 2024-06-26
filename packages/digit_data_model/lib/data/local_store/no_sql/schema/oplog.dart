import 'package:digit_data_model/data_model.dart';
import 'package:isar/isar.dart';

part 'oplog.g.dart';

/// The `OpLog` class represents an operation log in the database.
/// It is annotated with `@Collection()` to indicate that it is a collection in the Isar database.
@Collection()
class OpLog {
  // The `id` field is an auto-incrementing identifier for each operation log.
  Id id = Isar.autoIncrement;
  // The `entityString` field stores the JSON representation of the entity associated with the operation.
  late String entityString;

  /// The `getEntity` method is used to deserialize the `entityString` into an entity object.
  /// It uses the `entityType` field to determine the type of the entity and the appropriate mapper to use for deserialization.
  getEntity<T extends EntityModel>() {
    // The switch statement checks the `entityType` and uses the appropriate mapper to deserialize the `entityString`.
    // If the `entityType` does not match any of the predefined types, it uses the `EntityModelMapper` to deserialize the `entityString`.
    // The method returns the deserialized entity.
    var entity = getEntityTypeMapper(
        entityName: entityType.name, entityString: entityString);
    return entity;
  }

  getEntityTypeMapper(
      {required String entityName, required String entityString}) {
    return DigitDataModelSingleton()
        .entityMapper
        ?.getEntityMappers(entityName, entityString);
  }

  /// The `entity` method is used to serialize an entity object into a JSON string and store it in the `entityString` field.
  void entity<T extends EntityModel>(T entity) {
    entityString = entity.toJson();
  }

  // The `entityType` field stores the type of the entity associated with the operation.
  @Enumerated(EnumType.name)
  late DataModelType entityType;

  // The `operation` field stores the type of the operation (e.g., insert, update, delete).
  @Enumerated(EnumType.name)
  late DataOperation operation;

// The `serverGeneratedId` field stores the server-generated identifier for the entity.
  String? serverGeneratedId;

  // The `clientReferenceId` field stores the client-generated reference identifier for the entity.
  String? clientReferenceId;

  // The `syncedUpOn` field stores the timestamp of the last sync-up operation.
  DateTime? syncedUpOn;

  // The `syncedDownOn` field stores the timestamp of the last sync-down operation.
  DateTime? syncedDownOn;

  // The `createdBy` field stores the identifier of the user who created the operation log.
  late String createdBy;

  // The `createdAt` field stores the timestamp of when the operation log was created.
  late DateTime createdAt;

  // The `syncedUp` field indicates whether the operation has been synced up to the server.
  late bool syncedUp;

  // The `syncedDown` field indicates whether the operation has been synced down from the server.
  late bool syncedDown;

  // The `additionalIds` field stores a list of additional identifiers for the entity.
  late List<AdditionalId> additionalIds;

  // The `rowVersion` field stores the version of the row in the database.
  late int rowVersion;

  // The `syncDownRetryCount` field stores the number of times a sync-down operation has been retried.
  late int syncDownRetryCount;

  // The `nonRecoverableError` field indicates whether a non-recoverable error has occurred.
  late bool nonRecoverableError;
}

/// The `AdditionalId` class represents an additional identifier for an entity.
/// It is annotated with `@embedded` to indicate that it is embedded in the `OpLog` class.
@embedded
class AdditionalId {
  // The `idType` field stores the type of the identifier.
  late String idType;
  // The `id` field stores the identifier.
  late String id;
}

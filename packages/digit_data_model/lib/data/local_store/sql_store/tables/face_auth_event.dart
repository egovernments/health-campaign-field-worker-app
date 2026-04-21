import 'package:drift/drift.dart';

class FaceAuthEvent extends Table {
  TextColumn get clientReferenceId => text()();

  TextColumn get individualId => text()();

  TextColumn get deviceId => text()();

  TextColumn get eventType => text()();

  TextColumn get outcome => text()();

  TextColumn get confidence => text()();

  TextColumn get latitude => text()();

  TextColumn get longitude => text()();

  TextColumn get locationAccuracy => text()();

  IntColumn get timestamp => integer()();

  IntColumn get syncTimestamp => integer().nullable()();

  TextColumn get fallbackReason => text().nullable()();

  IntColumn get failedAttemptCount => integer()();

  IntColumn get popupTime => integer().nullable()();

  IntColumn get responseTime => integer().nullable()();

  TextColumn get responseType => text().nullable()();

  TextColumn get projectId => text()();

  TextColumn get anomalyFlags => text().nullable()();

  /// Base64-encoded JPEG of the cropped face image captured during verification.
  TextColumn get faceImage => text().nullable()();

  BoolColumn get isSync => boolean().withDefault(const Constant(false))();

  TextColumn get boundaryCode => text()();

  BoolColumn get nonRecoverableError =>
      boolean().nullable().withDefault(const Constant(false))();

  TextColumn get tenantId => text().nullable()();

  IntColumn get rowVersion => integer().nullable()();

  TextColumn get id => text().nullable()();

  TextColumn get additionalFields => text().nullable()();

  IntColumn get auditCreatedTime => integer().nullable()();

  IntColumn get clientCreatedTime => integer().nullable()();

  TextColumn get clientModifiedBy => text().nullable()();

  TextColumn get clientCreatedBy => text().nullable()();

  IntColumn get clientModifiedTime => integer().nullable()();

  TextColumn get auditModifiedBy => text().nullable()();

  IntColumn get auditModifiedTime => integer().nullable()();

  TextColumn get auditCreatedBy => text().nullable()();

  BoolColumn get isDeleted =>
      boolean().nullable().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {clientReferenceId};
}

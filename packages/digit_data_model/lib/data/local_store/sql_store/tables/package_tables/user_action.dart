import 'package:drift/drift.dart';

class UserAction extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get projectId => text().nullable()();
  TextColumn get clientReferenceId => text()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  RealColumn get locationAccuracy => real().nullable()();
  TextColumn get boundaryCode => text().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get additionalFields => text().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  IntColumn get auditCreatedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  BoolColumn get nonRecoverableError =>
      boolean().nullable().withDefault(const Constant(false))();

  IntColumn get clientCreatedTime => integer().nullable()();
  TextColumn get clientCreatedBy => text().nullable()();
  TextColumn get clientModifiedBy => text().nullable()();
  IntColumn get clientModifiedTime => integer().nullable()();

  IntColumn get rowVersion => integer().nullable()();
  BoolColumn get isDeleted =>
      boolean().nullable().withDefault(const Constant(false))();

  TextColumn get action => text().nullable()();
  TextColumn get beneficiaryTags => text().nullable()();
  TextColumn get resourceTags => text().nullable()();


  @override
  Set<Column> get primaryKey => {
    auditCreatedBy,
    clientReferenceId,
  };
}

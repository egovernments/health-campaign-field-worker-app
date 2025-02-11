import 'package:drift/drift.dart';

class UserAction extends Table {
  TextColumn get latitude => text()();
  TextColumn get longitude => text()();
  TextColumn get locationAccuracy => text()();
  TextColumn get clientReferenceId => text()();
  BoolColumn get isSync => boolean().withDefault(const Constant(false))();
  IntColumn get timestamp => integer()();
  BoolColumn get nonRecoverableError =>
      boolean().nullable().withDefault(const Constant(false))();
  TextColumn get tenantId => text().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  TextColumn get projectId => text()();
  TextColumn get boundaryCode => text()();
  TextColumn get action => text()();
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

  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => {clientReferenceId};
}

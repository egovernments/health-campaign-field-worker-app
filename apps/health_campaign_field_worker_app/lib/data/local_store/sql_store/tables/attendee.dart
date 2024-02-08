import 'package:drift/drift.dart';

class Attendee extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get registerId => text()();
  TextColumn get individualId => text()();
  IntColumn get status => integer().nullable()();
  BoolColumn get nonRecoverableError =>
      boolean().nullable().withDefault(const Constant(false))();
  IntColumn get auditCreatedTime => integer().nullable()();
  IntColumn get clientCreatedTime => integer().nullable()();
  TextColumn get clientModifiedBy => text().nullable()();
  TextColumn get clientCreatedBy => text().nullable()();
  IntColumn get clientModifiedTime => integer().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  IntColumn get enrollmentDate => integer().nullable()();
  IntColumn get denrollmentDate => integer().nullable()();
  BoolColumn get isDeleted =>
      boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();
  TextColumn get additionalFields => text().nullable()();
  @override
  Set<Column> get primaryKey => {
        id,
        registerId,
      };
}

import 'package:drift/drift.dart';

class AttendanceRegister extends Table
{
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get registerNumber => text()();
  TextColumn get name => text()();
  TextColumn get referenceId => text()();
  TextColumn get serviceCode => text()();
  TextColumn get status => text()();
  IntColumn get startDate => integer().nullable()();
  IntColumn get endDate => integer().nullable()();
  TextColumn get additionalFields => text().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  BoolColumn get nonRecoverableError => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get auditCreatedTime => integer().nullable()();
  IntColumn get clientCreatedTime => integer().nullable()();
  TextColumn get clientModifiedBy => text().nullable()();
  TextColumn get clientCreatedBy => text().nullable()();
  IntColumn get clientModifiedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  BoolColumn get isDeleted => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();

  @override
  Set<Column> get primaryKey => { id, auditCreatedBy,  };
}
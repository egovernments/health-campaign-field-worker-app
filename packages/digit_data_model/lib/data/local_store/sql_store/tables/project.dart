// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Project extends Table {
  TextColumn get id => text()();
  TextColumn get projectTypeId => text().nullable()();
  TextColumn get projectNumber => text().nullable()();
  TextColumn get subProjectTypeId => text().nullable()();
  BoolColumn get isTaskEnabled => boolean().nullable()();
  TextColumn get parent => text().nullable()();
  TextColumn get name => text()();
  TextColumn get department => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get referenceId => text().nullable()();
  TextColumn get projectHierarchy => text().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  BoolColumn get nonRecoverableError => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get auditCreatedTime => integer().nullable()();
  IntColumn get clientCreatedTime => integer().nullable()();
  TextColumn get clientModifiedBy => text().nullable()();
  TextColumn get clientCreatedBy => text().nullable()();
  IntColumn get clientModifiedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();
  IntColumn get startDate => integer().nullable()();
  IntColumn get endDate => integer().nullable()();
  
  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => { id, auditCreatedBy,  };
}
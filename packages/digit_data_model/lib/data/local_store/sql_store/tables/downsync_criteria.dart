// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class DownsyncCriteria extends Table {
  TextColumn get locality => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  IntColumn get offset => integer().nullable()();
  IntColumn get limit => integer().nullable()();
  TextColumn get projectId => text().nullable()();
  IntColumn get lastSyncedTime => integer().nullable()();
  IntColumn get totalCount => integer().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  BoolColumn get nonRecoverableError => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get auditCreatedTime => integer().nullable()();
  IntColumn get clientCreatedTime => integer().nullable()();
  TextColumn get clientModifiedBy => text().nullable()();
  TextColumn get clientCreatedBy => text().nullable()();
  IntColumn get clientModifiedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  BoolColumn get isDeleted => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();
  
  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => { auditCreatedBy, clientReferenceId,  };
}
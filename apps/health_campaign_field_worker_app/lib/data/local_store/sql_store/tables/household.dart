// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

class Household extends Table {
  TextColumn get id => text().nullable()();
  IntColumn get memberCount => integer().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  IntColumn get auditCreatedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get createdBy => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {
        auditCreatedBy,
        clientReferenceId,
      };
}

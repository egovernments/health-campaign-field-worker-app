// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

class UniqueIdPool extends Table {
  TextColumn get id => text()();

  TextColumn get deviceUuid => text().nullable()();

  TextColumn get userUuid => text().nullable()();

  TextColumn get status => text().nullable()();

  IntColumn get auditCreatedTime => integer().nullable()();

  TextColumn get auditModifiedBy => text().nullable()();

  TextColumn get auditCreatedBy => text().nullable()();

  IntColumn get auditModifiedTime => integer().nullable()();

  TextColumn get tenantId => text().nullable()();

  IntColumn get rowVersion => integer().nullable()();

  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

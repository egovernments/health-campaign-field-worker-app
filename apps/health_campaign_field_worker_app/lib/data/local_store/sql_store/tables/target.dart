// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Target extends Table {
  TextColumn get id => text()();
  TextColumn get beneficiaryType => text().nullable()();
  TextColumn get baseline => text().nullable()();
  TextColumn get target => text().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  IntColumn get auditCreatedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  
  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => { id, auditCreatedBy,  };
}
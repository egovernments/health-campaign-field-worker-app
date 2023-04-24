// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Locality extends Table {
  TextColumn get relatedClientReferenceId => text().nullable()();
  TextColumn get code => text()();
  TextColumn get name => text().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  IntColumn get auditCreatedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  
  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => { relatedClientReferenceId, code, auditCreatedBy,  };
}
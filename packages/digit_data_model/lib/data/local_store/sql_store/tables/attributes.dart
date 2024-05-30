// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Attributes extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get dataType => text().nullable()();
  TextColumn get referenceId => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get code => text().nullable()();
  TextColumn get values => text().nullable()();
  TextColumn get isActive => text().nullable()();
  BoolColumn get required => boolean().nullable()();
  TextColumn get regex => text().nullable()();
  IntColumn get order => integer().nullable()();
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
  
  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => { id, auditCreatedBy,  };
}
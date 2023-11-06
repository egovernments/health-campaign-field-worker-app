// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class HouseholdMember extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get householdId => text().nullable()();
  TextColumn get householdClientReferenceId => text().nullable()();
  TextColumn get individualId => text().nullable()();
  TextColumn get individualClientReferenceId => text().nullable()();
  BoolColumn get isHeadOfHousehold => boolean()();
  TextColumn get auditCreatedBy => text().nullable()();
  BoolColumn get nonRecoverableError => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get clientCreatedTime => integer().nullable()();
  TextColumn get clientModifiedBy => text().nullable()();
  TextColumn get clientCreatedBy => text().nullable()();
  IntColumn get clientModifiedTime => integer().nullable()();
  IntColumn get auditCreatedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();
  
  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => { auditCreatedBy, clientReferenceId,  };
}
// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

class HouseholdMemberRelationShip extends Table {
  TextColumn get id => text().nullable()();

  TextColumn get selfId => text().nullable()();

  TextColumn get selfClientReferenceId => text().nullable()();

  TextColumn get relativeId => text().nullable()();

  TextColumn get relativeClientReferenceId => text().nullable()();

  TextColumn get relationshipType => text().nullable()();

  TextColumn get clientReferenceId => text()();

  TextColumn get tenantId => text().nullable()();

  TextColumn get auditCreatedBy => text().nullable()();

  BoolColumn get nonRecoverableError =>
      boolean().nullable().withDefault(const Constant(false))();

  IntColumn get auditCreatedTime => integer().nullable()();

  IntColumn get clientCreatedTime => integer().nullable()();

  TextColumn get clientModifiedBy => text().nullable()();

  TextColumn get clientCreatedBy => text().nullable()();

  IntColumn get clientModifiedTime => integer().nullable()();

  TextColumn get auditModifiedBy => text().nullable()();

  IntColumn get auditModifiedTime => integer().nullable()();

  BoolColumn get isDeleted =>
      boolean().nullable().withDefault(const Constant(false))();

  IntColumn get rowVersion => integer().nullable()();

  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => {
        id,
        clientReferenceId,
      };
}

// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

@TableIndex(name: 'sideeffect_clinetref', columns: {#clientReferenceId})
@TableIndex(name: 'sideeffect_projectid', columns: {#projectId})
@TableIndex(name: 'sideeffect_taskclientref', columns: {#taskClientReferenceId})
class SideEffect extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get projectId => text().nullable()();
  TextColumn get taskClientReferenceId => text().nullable()();
  TextColumn get projectBeneficiaryClientReferenceId => text().nullable()();
  IntColumn get reAttempts => integer().nullable()();
  TextColumn get symptoms => text().nullable()();
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
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted =>
      boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();

  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => {
        auditCreatedBy,
        clientReferenceId,
      };
}

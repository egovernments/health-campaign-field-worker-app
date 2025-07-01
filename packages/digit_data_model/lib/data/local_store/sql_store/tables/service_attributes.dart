// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

class ServiceAttributes extends Table {
  TextColumn get id => text().nullable()();

  TextColumn get attributeCode => text().nullable()();

  TextColumn get value => text().nullable()();

  TextColumn get dataType => text().nullable()();

  TextColumn get referenceId => text().nullable()();

  TextColumn get additionalDetails => text().nullable()();

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

  TextColumn get clientReferenceId => text()
      .nullable()(); // TODO: making this nullable for now as old downsync service attributes may not have it

  TextColumn get serviceClientReferenceId => text().nullable()();

  TextColumn get tenantId => text().nullable()();

  BoolColumn get isDeleted =>
      boolean().nullable().withDefault(const Constant(false))();

  IntColumn get rowVersion => integer().nullable()();

  TextColumn get additionalFields => text().nullable()();
}

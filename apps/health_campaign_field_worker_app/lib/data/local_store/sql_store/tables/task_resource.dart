// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class TaskResource extends Table {
  TextColumn get clientReferenceId => text()();
  TextColumn get taskclientReferenceId => text().nullable()();
  TextColumn get taskId => text().nullable()();
  TextColumn get id => text().nullable()();
  TextColumn get productVariantId => text().nullable()();
  TextColumn get quantity => text().nullable()();
  BoolColumn get isDelivered => boolean().nullable()();
  TextColumn get deliveryComment => text().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  BoolColumn get nonRecoverableError => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get auditCreatedTime => integer().nullable()();
  IntColumn get clientCreatedTime => integer().nullable()();
  TextColumn get clientModifiedBy => text().nullable()();
  TextColumn get clientCreatedBy => text().nullable()();
  IntColumn get clientModifiedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();
  
  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => { clientReferenceId, auditCreatedBy,  };
}
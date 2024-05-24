// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class StockReconciliation extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get facilityId => text().nullable()();
  TextColumn get productVariantId => text().nullable()();
  TextColumn get referenceId => text().nullable()();
  TextColumn get referenceIdType => text().nullable()();
  IntColumn get physicalCount => integer().nullable()();
  IntColumn get calculatedCount => integer().nullable()();
  TextColumn get commentsOnReconciliation => text().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  BoolColumn get nonRecoverableError => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get auditCreatedTime => integer().nullable()();
  IntColumn get clientCreatedTime => integer().nullable()();
  TextColumn get clientModifiedBy => text().nullable()();
  TextColumn get clientCreatedBy => text().nullable()();
  IntColumn get clientModifiedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  BoolColumn get isDeleted => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();
  IntColumn get dateOfReconciliation => integer()();
  
  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => { auditCreatedBy, clientReferenceId,  };
}
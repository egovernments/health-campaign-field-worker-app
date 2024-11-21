// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

@TableIndex(name: 'stock_clientref', columns: {#clientReferenceId})
@TableIndex(name: 'stock_productvariantid', columns: {#productVariantId})
@TableIndex(name: 'stock_facilityid', columns: {#facilityId})
class Stock extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get facilityId => text().nullable()();
  TextColumn get productVariantId => text().nullable()();
  TextColumn get referenceId => text().nullable()();
  TextColumn get referenceIdType => text().nullable()();
  TextColumn get transactingPartyId => text().nullable()();
  TextColumn get transactingPartyType => text().nullable()();
  TextColumn get quantity => text().nullable()();
  TextColumn get waybillNumber => text().nullable()();
  TextColumn get receiverId => text().nullable()();
  TextColumn get receiverType => text().nullable()();
  TextColumn get senderId => text().nullable()();
  TextColumn get senderType => text().nullable()();
  IntColumn get dateOfEntry => integer().nullable()();
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
  BoolColumn get isDeleted =>
      boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();
  TextColumn get transactionType => text().nullable()();
  TextColumn get transactionReason => text().nullable()();

  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => {
        auditCreatedBy,
        clientReferenceId,
      };
}

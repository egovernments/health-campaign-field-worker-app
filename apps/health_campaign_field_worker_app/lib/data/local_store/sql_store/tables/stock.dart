// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Stock extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get facilityId => text().nullable()();
  TextColumn get productVariantId => text().nullable()();
  TextColumn get referenceId => text().nullable()();
  TextColumn get referenceIdType => text().nullable()();
  TextColumn get transactionType => text().nullable()();
  TextColumn get transactionReason => text().nullable()();
  TextColumn get transactingPartyId => text().nullable()();
  TextColumn get transactingPartyType => text().nullable()();
  TextColumn get quantity => text().nullable()();
  TextColumn get waybillNumber => text().nullable()();
  TextColumn get clientReferenceId => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
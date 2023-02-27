// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Stock extends Table {
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
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
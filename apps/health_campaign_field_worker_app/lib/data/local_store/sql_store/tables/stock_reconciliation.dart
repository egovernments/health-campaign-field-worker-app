// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class StockReconciliation extends Table {
  TextColumn get tenantId => text().nullable()();
  TextColumn get facilityId => text().nullable()();
  TextColumn get productVariantId => text().nullable()();
  TextColumn get referenceId => text().nullable()();
  TextColumn get referenceIdType => text().nullable()();
  IntColumn get physicalCount => integer().nullable()();
  IntColumn get calculatedCount => integer().nullable()();
  TextColumn get commentsOnReconciliation => text().nullable()();
  IntColumn get dateOfReconciliation => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
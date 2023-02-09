// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class HouseholdMember extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get householdId => text().nullable()();
  TextColumn get householdClientReferenceId => text().nullable()();
  TextColumn get individualId => text().nullable()();
  TextColumn get individualClientReferenceId => text().nullable()();
  BoolColumn get isHeadOfHousehold => boolean().nullable()();
  TextColumn get tenantId => text().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
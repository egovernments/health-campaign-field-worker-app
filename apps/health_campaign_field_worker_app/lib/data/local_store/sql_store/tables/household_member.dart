// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class HouseholdMember extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get householdId => text().nullable()();
  TextColumn get householdClientReferenceId => text().nullable()();
  TextColumn get individualId => text().nullable()();
  TextColumn get individualClientReferenceId => text().nullable()();
  BoolColumn get isHeadOfHousehold => boolean()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
import 'package:drift/drift.dart';


class HouseholdMember extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get householdId => text()();
  TextColumn get householdClientReferenceId => text()();
  TextColumn get individualId => text()();
  TextColumn get individualClientReferenceId => text()();
  BoolColumn get isHeadOfHousehold => boolean()();
  TextColumn get tenantId => text()();
  IntColumn get rowVersion => integer()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
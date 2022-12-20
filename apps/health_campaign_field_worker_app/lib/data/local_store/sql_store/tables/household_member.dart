import 'package:drift/drift.dart';

class HouseholdMemberTable extends Table {
  TextColumn get id => text()();
  TextColumn get householdId => text()();
  TextColumn get householdClientReferenceId => text()();
  TextColumn get individualId => text()();
  TextColumn get individualClientReferenceId => text()();
  BoolColumn get isHeadOfHousehold => boolean()();
  TextColumn get tenantId => text()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column>? get primaryKey => {  };
}
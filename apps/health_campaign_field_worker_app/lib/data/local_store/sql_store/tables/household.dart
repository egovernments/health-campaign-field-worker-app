import 'package:drift/drift.dart';

class HouseholdTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get clientReferenceId => text()();
  IntColumn get memberCount => integer()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column>? get primaryKey => {  };
}
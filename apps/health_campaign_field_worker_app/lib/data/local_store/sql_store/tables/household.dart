import 'package:drift/drift.dart';

import 'address.dart';

class HouseholdTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get clientReferenceId => text()();
  IntColumn get memberCount => integer()();
  IntColumn get rowVersion => integer()();
  
  TextColumn get address => text().references(AddressTable, #clientReferenceId)();

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
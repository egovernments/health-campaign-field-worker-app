import 'package:drift/drift.dart';

import 'address.dart';

class FacilityTable extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  BoolColumn get isPermanent => boolean()();
  TextColumn get usage => text()();
  IntColumn get storageCapacity => integer()();
  IntColumn get rowVersion => integer()();
  TextColumn get clientReferenceId => text()();
  
  TextColumn get address => text().references(AddressTable, #clientReferenceId)();

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
import 'package:drift/drift.dart';

class FacilityTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  BoolColumn get isPermanent => boolean()();
  TextColumn get usage => text()();
  IntColumn get storageCapacity => integer()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column>? get primaryKey => {  };
}
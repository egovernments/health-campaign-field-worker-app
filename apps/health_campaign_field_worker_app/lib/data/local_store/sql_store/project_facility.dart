import 'package:drift/drift.dart';

class ProjectFacilityTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get facilityId => text()();
  TextColumn get projectId => text()();
  TextColumn get rowVersion => text()();
  

  @override
  Set<Column>? get primaryKey => {  };
}
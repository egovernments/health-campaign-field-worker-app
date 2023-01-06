import 'package:drift/drift.dart';


class ProjectFacility extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get facilityId => text()();
  TextColumn get projectId => text()();
  TextColumn get rowVersion => text()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
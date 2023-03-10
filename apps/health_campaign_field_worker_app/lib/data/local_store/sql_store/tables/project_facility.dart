// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class ProjectFacility extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get facilityId => text().nullable()();
  TextColumn get projectId => text().nullable()();
  TextColumn get rowVersion => text().nullable()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
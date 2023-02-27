// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class ProjectFacility extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get facilityId => text().nullable()();
  TextColumn get projectId => text().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
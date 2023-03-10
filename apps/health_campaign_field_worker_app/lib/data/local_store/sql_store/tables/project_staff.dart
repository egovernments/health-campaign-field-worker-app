// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class ProjectStaff extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get userId => text().nullable()();
  TextColumn get projectId => text().nullable()();
  TextColumn get channel => text().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
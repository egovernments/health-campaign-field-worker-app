// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class ProjectStaff extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get userId => text().nullable()();
  TextColumn get projectId => text().nullable()();
  TextColumn get channel => text().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
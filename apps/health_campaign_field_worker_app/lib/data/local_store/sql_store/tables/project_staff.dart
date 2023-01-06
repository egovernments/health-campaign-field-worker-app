// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class ProjectStaff extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get userId => text()();
  TextColumn get projectId => text()();
  TextColumn get channel => text()();
  IntColumn get rowVersion => integer()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
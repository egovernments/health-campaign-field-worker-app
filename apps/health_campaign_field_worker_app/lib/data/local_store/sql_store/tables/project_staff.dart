import 'package:drift/drift.dart';


class ProjectStaffTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get userId => text()();
  TextColumn get projectId => text()();
  TextColumn get channel => text()();
  IntColumn get rowVersion => integer()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
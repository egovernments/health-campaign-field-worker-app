import 'package:drift/drift.dart';

class ProjectResourceTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get projectId => text()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column>? get primaryKey => {  };
}
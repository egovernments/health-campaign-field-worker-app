import 'package:drift/drift.dart';

class ProjectTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get projectTypeId => text()();
  TextColumn get subProjectTypeId => text()();
  BoolColumn get isTaskEnabled => boolean()();
  TextColumn get parent => text()();
  TextColumn get department => text()();
  TextColumn get description => text()();
  TextColumn get referenceId => text()();
  TextColumn get projectHierarchy => text()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column>? get primaryKey => {  };
}
import 'package:drift/drift.dart';

class TaskTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get projectId => text()();
  TextColumn get projectBeneficiaryId => text()();
  TextColumn get createdBy => text()();
  IntColumn get rowVersion => integer()();
  TextColumn get status => text()();
  

  @override
  Set<Column>? get primaryKey => {  };
}
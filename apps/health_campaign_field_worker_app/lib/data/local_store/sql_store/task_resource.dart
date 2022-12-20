import 'package:drift/drift.dart';

class TaskResourceTable extends Table {
  TextColumn get clientReferenceId => text().unique()();

  @override
  Set<Column>? get primaryKey => {  };
}
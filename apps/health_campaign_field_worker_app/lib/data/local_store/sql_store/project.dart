import 'package:drift/drift.dart';

class ProjectTable extends Table {
  TextColumn get clientReferenceId => text().unique()();

  @override
  Set<Column>? get primaryKey => {  };
}
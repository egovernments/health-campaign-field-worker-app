import 'package:drift/drift.dart';

class ProjectResourceTable extends Table {
  TextColumn get clientReferenceId => text().unique()();

  @override
  Set<Column>? get primaryKey => {  };
}
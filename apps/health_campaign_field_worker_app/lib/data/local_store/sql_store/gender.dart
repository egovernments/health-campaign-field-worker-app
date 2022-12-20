import 'package:drift/drift.dart';

class GenderTable extends Table {
  TextColumn get clientReferenceId => text().unique()();

  @override
  Set<Column>? get primaryKey => {  };
}
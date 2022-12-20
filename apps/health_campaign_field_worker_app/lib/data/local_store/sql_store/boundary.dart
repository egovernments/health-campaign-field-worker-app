import 'package:drift/drift.dart';

class BoundaryTable extends Table {
  TextColumn get code => text()();
  TextColumn get name => text()();
  TextColumn get label => text()();
  TextColumn get latitude => text()();
  TextColumn get longitude => text()();
  TextColumn get materializedPath => text()();
  

  @override
  Set<Column>? get primaryKey => {  };
}
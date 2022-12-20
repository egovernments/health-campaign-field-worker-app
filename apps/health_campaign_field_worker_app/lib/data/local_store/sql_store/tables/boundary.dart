import 'package:drift/drift.dart';

class BoundaryTable extends Table {
  TextColumn get code => text()();
  TextColumn get name => text()();
  TextColumn get label => text().nullable()();
  TextColumn get latitude => text().nullable()();
  TextColumn get longitude => text().nullable()();
  TextColumn get materializedPath => text().nullable()();
  

  @override
  Set<Column>? get primaryKey => {  };
}
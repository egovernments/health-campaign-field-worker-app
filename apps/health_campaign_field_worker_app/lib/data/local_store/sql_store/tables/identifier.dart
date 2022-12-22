import 'package:drift/drift.dart';


class IdentifierTable extends Table {
  TextColumn get type => text()();
  TextColumn get id => text()();
  TextColumn get clientReferenceId => text().unique()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
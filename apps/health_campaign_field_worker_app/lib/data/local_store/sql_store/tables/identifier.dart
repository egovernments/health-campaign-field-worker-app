import 'package:drift/drift.dart';


class Identifier extends Table {
  TextColumn get type => text()();
  TextColumn get id => text()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
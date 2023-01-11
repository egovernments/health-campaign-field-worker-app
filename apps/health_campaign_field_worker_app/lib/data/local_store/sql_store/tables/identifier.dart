// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Identifier extends Table {
  TextColumn get type => text()();
  TextColumn get clientReferenceId => text()();
  TextColumn get id => text()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
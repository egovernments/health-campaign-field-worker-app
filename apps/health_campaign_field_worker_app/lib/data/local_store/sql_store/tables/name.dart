// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Name extends Table {
  TextColumn get givenName => text()();
  TextColumn get familyName => text()();
  TextColumn get otherNames => text().nullable()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Name extends Table {
  TextColumn get clientReferenceId => text()();
  TextColumn get givenName => text()();
  TextColumn get familyName => text()();
  TextColumn get otherNames => text().nullable()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
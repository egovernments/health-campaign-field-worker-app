// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Name extends Table {
  TextColumn get clientReferenceId => text().nullable()();
  TextColumn get givenName => text().nullable()();
  TextColumn get familyName => text().nullable()();
  TextColumn get otherNames => text().nullable()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
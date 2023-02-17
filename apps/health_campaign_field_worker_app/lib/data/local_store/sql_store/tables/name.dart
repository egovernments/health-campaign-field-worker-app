// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Name extends Table {
  TextColumn get givenName => text().nullable()();
  TextColumn get familyName => text().nullable()();
  TextColumn get otherNames => text().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
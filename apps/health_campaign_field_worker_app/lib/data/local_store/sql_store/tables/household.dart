// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Household extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  IntColumn get memberCount => integer().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
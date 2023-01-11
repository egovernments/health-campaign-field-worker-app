// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Household extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get clientReferenceId => text()();
  IntColumn get memberCount => integer()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
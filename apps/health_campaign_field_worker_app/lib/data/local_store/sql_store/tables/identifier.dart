// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Identifier extends Table {
  TextColumn get type => text().nullable()();
  TextColumn get id => text().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
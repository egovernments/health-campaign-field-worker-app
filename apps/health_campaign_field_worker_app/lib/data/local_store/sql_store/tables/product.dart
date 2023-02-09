// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Product extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get manufacturer => text().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
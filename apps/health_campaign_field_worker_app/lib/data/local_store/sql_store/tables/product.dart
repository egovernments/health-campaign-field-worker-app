// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Product extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get type => text()();
  TextColumn get name => text()();
  TextColumn get manufacturer => text().nullable()();
  IntColumn get rowVersion => integer()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
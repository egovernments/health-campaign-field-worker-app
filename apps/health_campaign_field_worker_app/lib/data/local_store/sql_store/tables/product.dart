// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Product extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get manufacturer => text().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
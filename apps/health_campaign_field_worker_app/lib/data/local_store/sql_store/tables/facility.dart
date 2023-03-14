// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Facility extends Table {
  TextColumn get id => text()();
  BoolColumn get isPermanent => boolean().nullable()();
  TextColumn get usage => text().nullable()();
  IntColumn get storageCapacity => integer().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get createdBy => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  IntColumn get createdAt => integer()();
  

  @override
  Set<Column> get primaryKey => { id, createdBy,  };
}
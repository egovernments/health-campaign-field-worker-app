// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Facility extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isPermanent => boolean().nullable()();
  TextColumn get usage => text().nullable()();
  IntColumn get storageCapacity => integer().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
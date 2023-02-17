// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Facility extends Table {
  TextColumn get id => text().nullable()();
  BoolColumn get isPermanent => boolean().nullable()();
  TextColumn get usage => text().nullable()();
  IntColumn get storageCapacity => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
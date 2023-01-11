// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Facility extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  BoolColumn get isPermanent => boolean()();
  TextColumn get usage => text()();
  IntColumn get storageCapacity => integer()();
  IntColumn get rowVersion => integer()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
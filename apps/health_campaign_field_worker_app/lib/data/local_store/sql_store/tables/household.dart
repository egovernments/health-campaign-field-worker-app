// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

import 'address.dart';

class Household extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get clientReferenceId => text()();
  IntColumn get memberCount => integer()();
  IntColumn get rowVersion => integer()();
  
  TextColumn get address => text().references(Address, #clientReferenceId)();

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
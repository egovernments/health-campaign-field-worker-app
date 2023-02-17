// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

import 'household.dart';
import 'address.dart';

class HouseholdAddress extends Table {
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer()();
  
  TextColumn get household => text().nullable().references(Household, #clientReferenceId)();
  TextColumn get address => text().nullable().references(Address, #clientReferenceId)();

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
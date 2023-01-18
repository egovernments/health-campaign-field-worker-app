// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

import 'household.dart';
import 'address.dart';

class HouseholdAddress extends Table {
  TextColumn get clientReferenceId => text()();
  
  TextColumn get household => text().references(Household, #clientReferenceId)();
  TextColumn get address => text().references(Address, #clientReferenceId)();

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
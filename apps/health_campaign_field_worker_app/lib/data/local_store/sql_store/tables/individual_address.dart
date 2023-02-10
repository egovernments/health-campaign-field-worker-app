// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

import 'individual.dart';
import 'address.dart';

class IndividualAddress extends Table {
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  IntColumn get rowVersion => integer()();
  
  TextColumn get individual => text().nullable().references(Individual, #clientReferenceId)();
  TextColumn get address => text().nullable().references(Address, #clientReferenceId)();

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
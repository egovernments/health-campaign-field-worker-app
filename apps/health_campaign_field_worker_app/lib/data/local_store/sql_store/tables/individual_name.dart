// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

import 'individual.dart';
import 'name.dart';

class IndividualName extends Table {
  TextColumn get clientReferenceId => text()();
  
  TextColumn get individual => text().references(Individual, #clientReferenceId)();
  TextColumn get name => text().references(Name, #clientReferenceId)();

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
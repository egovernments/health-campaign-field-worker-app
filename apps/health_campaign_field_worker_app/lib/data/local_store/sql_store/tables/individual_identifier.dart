// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

import 'individual.dart';
import 'identifier.dart';

class IndividualIdentifier extends Table {
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer()();
  
  TextColumn get individual => text().nullable().references(Individual, #clientReferenceId)();
  TextColumn get identifier => text().nullable().references(Identifier, #clientReferenceId)();

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
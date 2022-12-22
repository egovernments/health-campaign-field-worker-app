import 'package:drift/drift.dart';

import '../../../../models/gender.dart';
import 'address.dart';
import 'identifier.dart';

class IndividualTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get clientReferenceId => text()();
  TextColumn get name => text()();
  TextColumn get dateOfBirth => text()();
  IntColumn get rowVersion => integer()();
  IntColumn get gender => intEnum<Gender>()();
  
  TextColumn get address => text().references(AddressTable, #clientReferenceId)();
  TextColumn get identifiers => text().references(IdentifierTable, #clientReferenceId)();

  @override
  Set<Column>? get primaryKey => {  };
}
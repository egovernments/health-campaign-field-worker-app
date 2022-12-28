import 'package:drift/drift.dart';

import '../../../../models/blood_group.dart';
import '../../../../models/gender.dart';
import 'name.dart';
import 'address.dart';
import 'identifier.dart';

class IndividualTable extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get clientReferenceId => text()();
  TextColumn get userId => text().nullable()();
  TextColumn get dateOfBirth => text()();
  TextColumn get mobileNumber => text()();
  TextColumn get altContactNumber => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get fatherName => text().nullable()();
  TextColumn get husbandName => text().nullable()();
  TextColumn get photo => text().nullable()();
  IntColumn get rowVersion => integer()();
  IntColumn get bloodGroup => intEnum<BloodGroup>()();
  IntColumn get gender => intEnum<Gender>()();
  
  TextColumn get name => text().references(NameTable, #clientReferenceId)();
  TextColumn get address => text().references(AddressTable, #clientReferenceId)();
  TextColumn get identifiers => text().references(IdentifierTable, #clientReferenceId)();

  @override
  Set<Column>? get primaryKey => {  };
}
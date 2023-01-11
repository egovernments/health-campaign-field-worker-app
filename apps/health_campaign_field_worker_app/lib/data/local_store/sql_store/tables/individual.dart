// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

import '../../../../models/blood_group.dart';
import '../../../../models/gender.dart';
import 'name.dart';
import 'address.dart';
import 'identifier.dart';

class Individual extends Table {
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
  
  TextColumn get name => text().references(Name, #clientReferenceId)();
  TextColumn get address => text().references(Address, #clientReferenceId)();
  TextColumn get identifiers => text().references(Identifier, #clientReferenceId)();

  @override
  Set<Column>? get primaryKey => {  };
}
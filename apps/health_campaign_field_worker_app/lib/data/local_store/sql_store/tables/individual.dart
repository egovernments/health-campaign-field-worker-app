// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

import '../../../../models/entities/blood_group.dart';
import '../../../../models/entities/gender.dart';

class Individual extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get userId => text().nullable()();
  TextColumn get dateOfBirth => text().nullable()();
  TextColumn get mobileNumber => text().nullable()();
  TextColumn get altContactNumber => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get fatherName => text().nullable()();
  TextColumn get husbandName => text().nullable()();
  TextColumn get photo => text().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  IntColumn get rowVersion => integer()();
  IntColumn get bloodGroup => intEnum<BloodGroup>().nullable()();
  IntColumn get gender => intEnum<Gender>().nullable()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
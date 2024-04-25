// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

import '../../../../models/entities/blood_group.dart';
import '../../../../models/entities/gender.dart';

class Individual extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get individualId => text().nullable()();
  TextColumn get userId => text().nullable()();
  TextColumn get userUuid => text().nullable()();
  TextColumn get dateOfBirth => text().nullable()();
  TextColumn get mobileNumber => text().nullable()();
  TextColumn get altContactNumber => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get fatherName => text().nullable()();
  TextColumn get husbandName => text().nullable()();
  TextColumn get photo => text().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  BoolColumn get nonRecoverableError => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get auditCreatedTime => integer().nullable()();
  IntColumn get clientCreatedTime => integer().nullable()();
  TextColumn get clientModifiedBy => text().nullable()();
  TextColumn get clientCreatedBy => text().nullable()();
  IntColumn get clientModifiedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();
  IntColumn get bloodGroup => intEnum<BloodGroup>().nullable()();
  IntColumn get gender => intEnum<Gender>().nullable()();
  
  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => { auditCreatedBy, clientReferenceId,  };
}
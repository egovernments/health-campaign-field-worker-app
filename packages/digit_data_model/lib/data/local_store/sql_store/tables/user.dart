// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class User extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get userName => text().nullable()();
  TextColumn get salutation => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get gender => text().nullable()();
  TextColumn get mobileNumber => text().nullable()();
  TextColumn get emailId => text().nullable()();
  TextColumn get altContactNumber => text().nullable()();
  TextColumn get pan => text().nullable()();
  TextColumn get aadhaarNumber => text().nullable()();
  TextColumn get permanentAddress => text().nullable()();
  TextColumn get permanentCity => text().nullable()();
  TextColumn get permanentPinCode => text().nullable()();
  TextColumn get correspondenceAddress => text().nullable()();
  TextColumn get correspondenceCity => text().nullable()();
  TextColumn get correspondencePinCode => text().nullable()();
  TextColumn get alternatemobilenumber => text().nullable()();
  BoolColumn get active => boolean().nullable()();
  TextColumn get locale => text().nullable()();
  TextColumn get type => text().nullable()();
  BoolColumn get accountLocked => boolean().nullable()();
  IntColumn get accountLockedDate => integer().nullable()();
  TextColumn get fatherOrHusbandName => text().nullable()();
  TextColumn get relationship => text().nullable()();
  TextColumn get signature => text().nullable()();
  TextColumn get bloodGroup => text().nullable()();
  TextColumn get photo => text().nullable()();
  TextColumn get identificationMark => text().nullable()();
  IntColumn get createdBy => integer().nullable()();
  TextColumn get lastModifiedBy => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get uuid => text().nullable()();
  TextColumn get createdDate => text().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  BoolColumn get nonRecoverableError => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get auditCreatedTime => integer().nullable()();
  IntColumn get clientCreatedTime => integer().nullable()();
  TextColumn get clientModifiedBy => text().nullable()();
  TextColumn get clientCreatedBy => text().nullable()();
  IntColumn get clientModifiedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  BoolColumn get isDeleted => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();
  
  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => { uuid, auditCreatedBy,  };
}
// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

import '../../../../models/entities/address_type.dart';

class Address extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get relatedClientReferenceId => text().nullable()();
  TextColumn get doorNo => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  RealColumn get locationAccuracy => real().nullable()();
  TextColumn get addressLine1 => text().nullable()();
  TextColumn get addressLine2 => text().nullable()();
  TextColumn get landmark => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get pincode => text().nullable()();
  TextColumn get buildingName => text().nullable()();
  TextColumn get street => text().nullable()();
  TextColumn get boundaryType => text().nullable()();
  TextColumn get boundary => text().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  BoolColumn get nonRecoverableError => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get auditCreatedTime => integer().nullable()();
  IntColumn get clientCreatedTime => integer().nullable()();
  TextColumn get clientModifiedBy => text().nullable()();
  TextColumn get clientCreatedBy => text().nullable()();
  IntColumn get clientModifiedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get localityBoundaryCode => text().nullable()();
  TextColumn get localityBoundaryName => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();
  IntColumn get type => intEnum<AddressType>().nullable()();
  
  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => { relatedClientReferenceId, auditCreatedBy,  };
}
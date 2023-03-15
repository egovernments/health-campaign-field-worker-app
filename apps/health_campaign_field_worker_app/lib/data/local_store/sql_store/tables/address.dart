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
  TextColumn get auditCreatedBy => text().nullable()();
  IntColumn get auditCreatedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get createdBy => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get type => intEnum<AddressType>().nullable()();

  @override
  Set<Column> get primaryKey => {
        relatedClientReferenceId,
        auditCreatedBy,
      };
}

// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

import '../../../../models/entities/beneficiary_type.dart';

class Target extends Table {
  TextColumn get id => text()();
  TextColumn get clientReferenceId => text().nullable()();
  TextColumn get baseline => text().nullable()();
  TextColumn get target => text().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  IntColumn get auditCreatedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  IntColumn get beneficiaryType => intEnum<BeneficiaryType>().nullable()();
  
  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => { id, auditCreatedBy,  };
}
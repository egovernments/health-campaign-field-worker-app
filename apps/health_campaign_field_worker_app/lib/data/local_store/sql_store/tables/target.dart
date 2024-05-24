// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

import '../../../../models/entities/beneficiary_type.dart';

class Target extends Table {
  TextColumn get id => text()();
  TextColumn get clientReferenceId => text().nullable()();
  RealColumn get totalNo => real().nullable()();
  RealColumn get targetNo => real().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  BoolColumn get nonRecoverableError => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get auditCreatedTime => integer().nullable()();
  IntColumn get clientCreatedTime => integer().nullable()();
  TextColumn get clientModifiedBy => text().nullable()();
  TextColumn get clientCreatedBy => text().nullable()();
  IntColumn get clientModifiedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();
  IntColumn get beneficiaryType => intEnum<BeneficiaryType>().nullable()();
  
  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => { id, auditCreatedBy,  };
}
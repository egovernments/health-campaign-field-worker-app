// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

@TableIndex(name: 'referral_clinetref', columns: {
  #clientReferenceId,
})
@TableIndex(name: 'referral_projectid', columns: {
  #projectId,
})
@TableIndex(name: 'referral_projectbeneficiaryclientref', columns: {
  #projectBeneficiaryClientReferenceId,
})
class Referral extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get projectId => text().nullable()();
  TextColumn get projectBeneficiaryClientReferenceId => text().nullable()();
  TextColumn get referrerId => text().nullable()();
  TextColumn get recipientType => text().nullable()();
  TextColumn get recipientId => text().nullable()();
  TextColumn get reasons => text().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  BoolColumn get nonRecoverableError =>
      boolean().nullable().withDefault(const Constant(false))();
  IntColumn get auditCreatedTime => integer().nullable()();
  IntColumn get clientCreatedTime => integer().nullable()();
  TextColumn get clientModifiedBy => text().nullable()();
  TextColumn get clientCreatedBy => text().nullable()();
  IntColumn get clientModifiedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted =>
      boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();

  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => {
        auditCreatedBy,
        clientReferenceId,
      };
}

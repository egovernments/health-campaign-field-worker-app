import 'package:drift/drift.dart';

import '/models/entities/pgr_application_status.dart';


class PgrService extends Table {
  BoolColumn get active => boolean()();
  TextColumn get clientReferenceId => text()();
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get serviceCode => text()();
  TextColumn get description => text()();
  TextColumn get serviceRequestId => text().nullable()();
  TextColumn get accountId => text().nullable()();
  IntColumn get applicationStatus => intEnum<PgrServiceApplicationStatus>()();
  TextColumn get source => text().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  IntColumn get auditCreatedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  BoolColumn get isDeleted => boolean()();
  IntColumn get rowVersion => integer()();

  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => {
        clientReferenceId,
        auditCreatedBy,
      };
}

class PgrComplainant extends Table {
  IntColumn get id => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get complaintClientReferenceId => text()();
  TextColumn get userName => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get mobileNumber => text().nullable()();
  TextColumn get emailId => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get uuid => text().nullable()();
  BoolColumn get active => boolean()();
  TextColumn get auditCreatedBy => text().nullable()();
  IntColumn get auditCreatedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  BoolColumn get isDeleted => boolean()();
  IntColumn get rowVersion => integer()();

  @override
  Set<Column> get primaryKey => {clientReferenceId, auditCreatedBy};
}

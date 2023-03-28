// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class ProjectType extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get code => text().nullable()();
  TextColumn get group => text().nullable()();
  TextColumn get beneficiaryType => text().nullable()();
  TextColumn get eligibilityCriteria => text().nullable()();
  TextColumn get taskProcedure => text().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  IntColumn get auditCreatedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  
  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => { auditCreatedBy, clientReferenceId,  };
}
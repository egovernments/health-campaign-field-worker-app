// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

@TableIndex(name: 'task_clinetref', columns: {
  #clientReferenceId,
})
@TableIndex(name: 'task_projectid', columns: {
  #projectId,
})
@TableIndex(name: 'task_projectbeneficiaryid', columns: {
  #projectBeneficiaryId,
})
@TableIndex(name: 'task_projectbeneficiaryclientref', columns: {
  #projectBeneficiaryClientReferenceId,
})
@TableIndex(name: 'task_status', columns: {
  #status,
})
@TableIndex(name: 'task_project_status', columns: {
  #projectId,
  #status,
  #isDeleted,
})
@TableIndex(name: 'task_clientmodifiedtime', columns: {
  #clientModifiedTime,
})
@TableIndex(name: 'task_search_project_created_status', columns: {
  #projectId,
  #clientCreatedBy,
  #status,
})
@TableIndex(name: 'task_search_project_created_status_modifiedtime', columns: {
  #projectId,
  #clientCreatedBy,
  #status,
  #clientModifiedTime,
})
@TableIndex(name: 'task_search_project_created_status_plannedstart', columns: {
  #projectId,
  #clientCreatedBy,
  #status,
  #plannedStartDate,
})
class Task extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get projectId => text().nullable()();
  TextColumn get projectBeneficiaryId => text().nullable()();
  TextColumn get projectBeneficiaryClientReferenceId => text().nullable()();
  TextColumn get createdBy => text().nullable()();
  TextColumn get status => text().nullable()();
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
  IntColumn get plannedStartDate => integer().nullable()();
  IntColumn get plannedEndDate => integer().nullable()();
  IntColumn get actualStartDate => integer().nullable()();
  IntColumn get actualEndDate => integer().nullable()();
  IntColumn get createdDate => integer().nullable()();

  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => {
        auditCreatedBy,
        clientReferenceId,
      };
}

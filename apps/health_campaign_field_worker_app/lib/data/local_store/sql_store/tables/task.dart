// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Task extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get projectId => text().nullable()();
  TextColumn get projectBeneficiaryId => text().nullable()();
  TextColumn get projectBeneficiaryClientReferenceId => text().nullable()();
  TextColumn get createdBy => text().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  IntColumn get plannedStartDate => integer().nullable()();
  IntColumn get plannedEndDate => integer().nullable()();
  IntColumn get actualStartDate => integer().nullable()();
  IntColumn get actualEndDate => integer().nullable()();
  IntColumn get createdDate => integer().nullable()();
  IntColumn get createdAt => integer()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
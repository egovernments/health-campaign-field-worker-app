// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class ProjectStaff extends Table {
  TextColumn get id => text()();
  TextColumn get staffId => text().nullable()();
  TextColumn get userId => text().nullable()();
  TextColumn get projectId => text().nullable()();
  TextColumn get channel => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get createdBy => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  IntColumn get startDate => integer().nullable()();
  IntColumn get endDate => integer().nullable()();
  IntColumn get createdAt => integer()();
  

  @override
  Set<Column> get primaryKey => { id, createdBy,  };
}
// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Project extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get projectTypeId => text()();
  TextColumn get subProjectTypeId => text()();
  BoolColumn get isTaskEnabled => boolean()();
  TextColumn get parent => text().nullable()();
  TextColumn get department => text()();
  TextColumn get description => text()();
  TextColumn get referenceId => text()();
  TextColumn get projectHierarchy => text()();
  IntColumn get rowVersion => integer()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
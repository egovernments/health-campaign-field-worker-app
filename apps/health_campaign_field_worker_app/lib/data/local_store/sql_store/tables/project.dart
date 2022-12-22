import 'package:drift/drift.dart';

import 'address.dart';
import 'target.dart';
import 'document.dart';

class ProjectTable extends Table {
  TextColumn get id => text()();
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
  
  TextColumn get address => text().references(AddressTable, #clientReferenceId)();
  TextColumn get targets => text().references(TargetTable, #clientReferenceId)();
  TextColumn get documents => text().references(DocumentTable, #clientReferenceId)();

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
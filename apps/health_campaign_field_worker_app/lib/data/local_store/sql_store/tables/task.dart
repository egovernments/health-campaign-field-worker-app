// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Task extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get projectId => text()();
  TextColumn get projectBeneficiaryId => text()();
  TextColumn get createdBy => text()();
  IntColumn get rowVersion => integer()();
  TextColumn get status => text()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
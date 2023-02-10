// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Task extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get projectId => text().nullable()();
  TextColumn get projectBeneficiaryId => text().nullable()();
  TextColumn get createdBy => text().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
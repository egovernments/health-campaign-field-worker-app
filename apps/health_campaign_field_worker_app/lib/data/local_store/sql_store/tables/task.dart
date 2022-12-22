import 'package:drift/drift.dart';

import 'task_resource.dart';
import 'address.dart';

class TaskTable extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get projectId => text()();
  TextColumn get projectBeneficiaryId => text()();
  TextColumn get createdBy => text()();
  IntColumn get rowVersion => integer()();
  TextColumn get status => text()();
  TextColumn get clientReferenceId => text()();
  
  TextColumn get resources => text().references(TaskResourceTable, #clientReferenceId)();
  TextColumn get address => text().references(AddressTable, #clientReferenceId)();

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}
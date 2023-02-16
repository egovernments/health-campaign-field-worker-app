// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

import 'task.dart';
import 'address.dart';

class TaskAddress extends Table {
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  IntColumn get rowVersion => integer()();
  
  TextColumn get task => text().nullable().references(Task, #clientReferenceId)();
  TextColumn get address => text().nullable().references(Address, #clientReferenceId)();

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
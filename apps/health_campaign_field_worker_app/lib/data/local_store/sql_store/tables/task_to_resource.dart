// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

import 'task.dart';
import 'task_resource.dart';

class TaskToResource extends Table {
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  
  TextColumn get task => text().nullable().references(Task, #clientReferenceId)();
  TextColumn get taskResource => text().nullable().references(TaskResource, #clientReferenceId)();

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}
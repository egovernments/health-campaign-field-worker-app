import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:registration_delivery/data/local_store/sql_store.dart';

import '../../../models/entities/task.dart';

abstract class TaskLocalBaseRepository
    extends LocalRepository<TaskModel, TaskSearchModel> {
  final RegistrationLocalSqlDataStore registrationLocalSqlDataStore;

  const TaskLocalBaseRepository(
      super.sql, super.opLogManager, this.registrationLocalSqlDataStore);

  @override
  DataModelType get type => DataModelType.task;

  @override
  TableInfo get table => registrationLocalSqlDataStore.task;
}

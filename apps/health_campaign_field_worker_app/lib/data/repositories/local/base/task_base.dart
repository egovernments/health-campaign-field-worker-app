import 'package:drift/drift.dart';

import '../../../../models/data_model.dart';
import '../../../data_repository.dart';

abstract class TaskLocalBaseRepository
    extends LocalRepository<TaskModel, TaskSearchModel> {
  const TaskLocalBaseRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.task;

  @override
  TableInfo get table => sql.task;
}
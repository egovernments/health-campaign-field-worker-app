import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../../models/entities/task.dart';

abstract class TaskLocalBaseRepository
    extends LocalRepository<TaskModel, TaskSearchModel> {
  const TaskLocalBaseRepository(
    super.sql,
    super.opLogManager,
  );

  @override
  DataModelType get type => DataModelType.task;

  TableInfo get table => sql.task;
}

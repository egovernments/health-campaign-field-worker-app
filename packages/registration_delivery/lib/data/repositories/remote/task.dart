// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';

class TaskRemoteRepository
    extends RemoteRepository<TaskModel, TaskSearchModel> {
  TaskRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Task',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.task;
}

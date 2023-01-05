// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class TaskRepository extends RemoteRepository<TaskModel, TaskSearchModel> {
  TaskRepository(
    super.dio, {
    required super.path,
    super.entityName = 'Task',
  });
}

import '../../../models/data_model.dart';
import 'dart:async';
import '../../../utils/utils.dart';
import 'package:drift/drift.dart';
import '../../data_repository.dart';

class TaskLocalRepository extends LocalRepository<TaskModel, TaskSearchModel> {
  TaskLocalRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.task;

  @override
  FutureOr<List<TaskModel>> search(TaskSearchModel query) async {
    final selectQuery = sql.select(sql.task).join(
      [
        leftOuterJoin(
          sql.task,
          sql.task.id.equalsExp(
            sql.task.clientReferenceId,
          ),
        ),
      ],
    );
    final results = await (selectQuery
          ..where(
            buildAnd(
              [
                if (query.clientReferenceId != null)
                  sql.task.clientReferenceId.equals(
                    query.clientReferenceId,
                  ),
                if (query.id != null)
                  sql.task.id.equals(
                    query.id,
                  ),
                if (query.tenantId != null)
                  sql.task.tenantId.equals(
                    query.tenantId,
                  ),
              ],
            ),
          ))
        .get();

    return results.map((e) {
      final task = e.readTable(sql.task);

      return TaskModel(clientReferenceId: '', rowVersion: 1, tenantId: '');
    }).toList();
  }

  @override
  FutureOr<void> create(TaskModel entity) async {
    await super.create(entity);
  }

  @override
  FutureOr<void> update(TaskModel entity) async {
    await super.update(entity);
  }
}

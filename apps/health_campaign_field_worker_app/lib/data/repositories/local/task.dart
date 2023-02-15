import 'dart:async';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class TaskLocalRepository extends LocalRepository<TaskModel, TaskSearchModel> {
  TaskLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<TaskModel>> search(
    TaskSearchModel query,
  ) async {
    final selectQuery = sql.select(sql.projectBeneficiary).join([]);
    final results = await (selectQuery
          ..where(buildAnd([
            if (query.clientReferenceId != null)
              sql.task.clientReferenceId.equals(
                query.clientReferenceId,
              ),
          ])))
        .get();

    return results.map((e) {
      final task = e.readTable(sql.task);

      return TaskModel(
        clientReferenceId: task.clientReferenceId,
        rowVersion: task.rowVersion,
        tenantId: task.tenantId,
        projectId: '',
        projectBeneficiaryId: task.projectBeneficiaryId,
        createdDate: task.createdDate,
      );
    }).toList();
  }

  @override
  FutureOr<void> create(TaskModel entity) async {
    final taskCompanion = entity.companion;
    await sql.batch((batch) {
      batch.insert(sql.task, taskCompanion);
    });

    await super.create(entity);
  }

  @override
  DataModelType get type => DataModelType.task;
}

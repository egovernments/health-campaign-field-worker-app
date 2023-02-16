import 'dart:async';

import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class TaskLocalRepository extends LocalRepository<TaskModel, TaskSearchModel> {
  TaskLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<TaskModel>> search(
    TaskSearchModel query,
  ) async {
    final selectQuery = sql.select(sql.projectBeneficiary).join([
      leftOuterJoin(
        sql.task,
        sql.task.projectId.equalsExp(
          sql.task.projectId,
        ),
      ),
    ]);

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
        // TODO: Remove this hardcoded project
        projectId: '13',
        projectBeneficiaryId: task.projectBeneficiaryId,
        createdDate: task.createdDate,
      );
    }).toList();
  }

  @override
  FutureOr<void> create(TaskModel entity) async {
    final taskCompanion = entity.companion;
    final address = entity.address;
    final resources = entity.resources;
    await sql.batch((batch) async {
      batch.insert(sql.task, taskCompanion);

      if (resources != null) {
        final resourcesCompanions = resources.map((e) {
          return e.companion;
        }).toList();

        batch.insertAll(
          sql.taskResource,
          resourcesCompanions,
          mode: InsertMode.insertOrReplace,
        );

        if (address != null) {
          batch.insert(sql.address, address.companion);
        }

        await super.create(entity);
      }
    });
  }

  @override
  FutureOr<void> update(TaskModel entity) async {
    final taskCompanion = entity.companion;

    await sql.batch((batch) {
      batch.update(
        sql.task,
        taskCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
    });

    await super.update(entity);
  }

  @override
  DataModelType get type => DataModelType.task;
}

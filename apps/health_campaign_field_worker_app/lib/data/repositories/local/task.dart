import 'dart:async';

import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../models/entities/task_address.dart';
import '../../../utils/environment_config.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class TaskLocalRepository extends LocalRepository<TaskModel, TaskSearchModel> {
  TaskLocalRepository(super.sql, super.opLogManager);

  @override
  Future<List<OpLogEntry<TaskModel>>> getItemsToBeSynced() async {
    final entries = await super.getItemsToBeSynced();

    return entries;
    // .where((element) => element.entity.projectBeneficiaryId != null)
    // .toList();
  }

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
              sql.task.clientReferenceId.isIn(
                query.clientReferenceId!,
              ),
          ])))
        .get();

    return results
        .map((e) {
          final task = e.readTable(sql.task);

          return TaskModel(
            clientReferenceId: task.clientReferenceId,
            rowVersion: task.rowVersion,
            tenantId: task.tenantId,
            isDeleted: task.isDeleted,
            // TODO: Remove this hardcoded project
            projectId: '13',
            projectBeneficiaryId: task.projectBeneficiaryId,
            createdDate: task.createdDate,
          );
        })
        .where((element) => element.isDeleted != true)
        .toList();
  }

  @override
  FutureOr<void> create(
    TaskModel entity, {
    bool createOpLog = true,
  }) async {
    final taskCompanion = entity.companion;
    final addresses = entity.address;
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

        if (addresses != null) {
          final addressCompanions = addresses.companion;

          batch.insert(
            sql.address,
            addressCompanions,
            mode: InsertMode.insertOrReplace,
          );

          batch.insertAll(
            sql.taskAddress,
            [
              TaskAddressModel(
                clientReferenceId: IdGen.i.identifier,
                tenantId: envConfig.variables.tenantId,
                rowVersion: 1,
                task: entity,
                address: addresses,
              ).companion,
            ],
            mode: InsertMode.insertOrReplace,
          );
        }

        await super.create(entity);
      }
    });
  }

  @override
  FutureOr<void> update(
    TaskModel entity, {
    bool createOpLog = true,
  }) async {
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
  FutureOr<void> delete(
    TaskModel entity, {
    bool createOpLog = true,
  }) async {
    final updated = entity.copyWith(
      isDeleted: true,
      rowVersion: entity.rowVersion + 1,
    );
    await sql.batch((batch) {
      batch.update(
        sql.task,
        updated.companion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
    });

    return super.delete(updated);
  }

  @override
  DataModelType get type => DataModelType.task;
}

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';
import '../../local_store/sql_store/sql_store.dart';

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
    final selectQuery = sql.select(sql.task).join([
      leftOuterJoin(
        sql.taskResource,
        sql.taskResource.taskClientReferenceId.equalsExp(
          sql.task.clientReferenceId,
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
          final task = e.readTableOrNull(sql.task);
          final resources = e.readTableOrNull(sql.taskResource);
          if (task == null) return null;

          return TaskModel(
            clientReferenceId: task.clientReferenceId,
            rowVersion: task.rowVersion,
            tenantId: task.tenantId,
            isDeleted: task.isDeleted,
            // TODO: Remove this hardcoded project
            projectId: '13',
            projectBeneficiaryId: task.projectBeneficiaryId,
            createdDate: task.createdDate,
            status: task.status,
            resources: resources == null
                ? null
                : [
                    TaskResourceModel(
                      taskClientReferenceId: resources.taskClientReferenceId,
                      id: resources.id,
                      productVariantId: resources.productVariantId,
                      taskId: resources.taskId,
                      deliveryComment: resources.deliveryComment,
                      quantity: resources.quantity,
                    ),
                  ],
          );
        })
        .whereNotNull()
        .where((element) => element.isDeleted != true)
        .toList();
  }

  @override
  FutureOr<void> create(
    TaskModel entity, {
    bool createOpLog = true,
  }) async {
    final taskCompanion = entity.companion;
    final addresses = entity.address?.copyWith(
      relatedClientReferenceId: entity.clientReferenceId,
    );
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

    final resourcesCompanions = entity.resources?.map((e) {
          return e
              .copyWith(taskClientReferenceId: entity.clientReferenceId)
              .companion;
        }).toList() ??
        [];

    await sql.batch((batch) {
      batch.update(
        sql.task,
        taskCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );
      batch.insertAllOnConflictUpdate(sql.taskResource, resourcesCompanions);
    });

    await super.update(entity, createOpLog: createOpLog);
  }

  @override
  FutureOr<void> delete(
    TaskModel entity, {
    bool createOpLog = true,
  }) async {
    final updated = entity.copyWith(
      isDeleted: true,
      rowVersion: entity.rowVersion.increment,
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

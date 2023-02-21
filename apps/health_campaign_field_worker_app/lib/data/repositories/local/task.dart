import 'dart:async';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../models/entities/task_address.dart';
import '../../../models/entities/task_to_resource.dart';
import '../../../utils/environment_config.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';
import '../../local_store/sql_store/sql_store.dart';

class TaskLocalRepository extends LocalRepository<TaskModel, TaskSearchModel> {
  TaskLocalRepository(super.sql, super.opLogManager);

  @override
  Future<List<OpLogEntry<TaskModel>>> getItemsToBeSynced() async {
    final entries = await super.getItemsToBeSynced();

    return entries;
  }

  @override
  FutureOr<List<TaskModel>> search(
    TaskSearchModel query,
  ) async {
    final selectQuery = sql.select(sql.task).join([
      leftOuterJoin(
        sql.taskToResource,
        sql.taskToResource.task.equalsExp(
          sql.task.clientReferenceId,
        ),
      ),
      leftOuterJoin(
        sql.taskResource,
        sql.taskResource.clientReferenceId.equalsExp(
          sql.taskToResource.taskResource,
        ),
      ),
    ]);

    final results = await (selectQuery
          ..where(buildAnd([
            if (query.projectBeneficiaryClientReferenceId != null)
              sql.task.projectBeneficiaryClientReferenceId.equals(
                query.projectBeneficiaryClientReferenceId,
              ),
          ])))
        .get();

    print(results);

    return results
        .map((e) {
          final task = e.readTable(sql.task);
          final taskResource = e.readTableOrNull(sql.taskResource);

          return TaskModel(
            clientReferenceId: task.clientReferenceId,
            rowVersion: task.rowVersion,
            tenantId: task.tenantId,
            isDeleted: task.isDeleted,
            status: task.status,
            // TODO: Remove this hardcoded project
            projectId: task.projectId,
            projectBeneficiaryId: task.projectBeneficiaryId,
            createdDate: task.createdDate,
            taskResource: [
              taskResource == null
                  ? null
                  : TaskResourceModel(
                      clientReferenceId: taskResource.clientReferenceId,
                      tenantId: taskResource.tenantId,
                      rowVersion: taskResource.rowVersion,
                      productVariantId: taskResource.productVariantId,
                      quantity: taskResource.quantity,
                      deliveryComment: taskResource.deliveryComment,
                    ),
            ].whereNotNull().toList(),
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
    final resources = entity.taskResource;
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

        batch.insertAll(
          sql.taskToResource,
          resources.map((e) {
            return TaskToResourceModel(
              clientReferenceId: IdGen.i.identifier,
              tenantId: envConfig.variables.tenantId,
              isDeleted: false,
              rowVersion: 1,
              task: entity,
              taskResource: e,
            ).companion;
          }),
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

    final taskResourceCompanions = entity.taskResource?.map((e) {
          return e.companion;
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
      batch.insertAllOnConflictUpdate(sql.taskResource, taskResourceCompanions);
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

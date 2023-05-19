import 'dart:async';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import 'base/task_base.dart';

class TaskLocalRepository extends TaskLocalBaseRepository {
  TaskLocalRepository(super.sql, super.opLogManager);

  void listenToChanges({
    required TaskSearchModel query,
    required void Function(List<TaskModel> data) listener,
  }) {
    final select = sql.select(sql.task).join([
      leftOuterJoin(
        sql.taskResource,
        sql.taskResource.clientReferenceId.equalsExp(
          sql.task.clientReferenceId,
        ),
      ),
    ])
      ..where(
        buildOr([
          if (query.projectId != null)
            sql.task.projectId.equals(
              query.projectId,
            ),
        ]),
      );

    select.watch().listen((results) {
      final data = results
          .map((e) {
            final task = e.readTableOrNull(sql.task);
            final resources = e.readTableOrNull(sql.taskResource);
            if (task == null) return null;

            return TaskModel(
              id: task.id,
              createdBy: task.createdBy,
              clientReferenceId: task.clientReferenceId,
              rowVersion: task.rowVersion,
              tenantId: task.tenantId,
              isDeleted: task.isDeleted,
              projectId: task.projectId,
              projectBeneficiaryId: task.projectBeneficiaryId,
              createdDate: task.createdDate,
              status: task.status,
              resources: resources == null
                  ? null
                  : [
                      TaskResourceModel(
                        clientReferenceId: resources.clientReferenceId,
                        id: resources.id,
                        productVariantId: resources.productVariantId,
                        taskId: resources.taskId,
                        deliveryComment: resources.deliveryComment,
                        quantity: resources.quantity,
                        rowVersion: resources.rowVersion,
                      ),
                    ],
            );
          })
          .whereNotNull()
          .where((element) => element.isDeleted != true)
          .toList();

      listener(data);
    });
  }

  @override
  FutureOr<List<TaskModel>> search(
    TaskSearchModel query, [
    String? userId,
  ]) async {
    final selectQuery = sql.select(sql.task).join([
      leftOuterJoin(
        sql.address,
        sql.address.relatedClientReferenceId.equalsExp(
          sql.task.clientReferenceId,
        ),
      ),
      leftOuterJoin(
        sql.taskResource,
        sql.taskResource.clientReferenceId.equalsExp(
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
            if (query.projectBeneficiaryClientReferenceId != null)
              sql.task.projectBeneficiaryClientReferenceId.isIn(
                query.projectBeneficiaryClientReferenceId!,
              ),
            if (userId != null)
              sql.task.auditCreatedBy.equals(
                userId,
              ),
          ])))
        .get();

    return results
        .map((e) {
          final task = e.readTableOrNull(sql.task);
          final resources = e.readTableOrNull(sql.taskResource);
          final address = e.readTableOrNull(sql.address);
          if (task == null) return null;

          return TaskModel(
            id: task.id,
            createdBy: task.createdBy,
            clientReferenceId: task.clientReferenceId,
            rowVersion: task.rowVersion,
            tenantId: task.tenantId,
            isDeleted: task.isDeleted,
            projectId: task.projectId,
            projectBeneficiaryId: task.projectBeneficiaryId,
            projectBeneficiaryClientReferenceId:
                task.projectBeneficiaryClientReferenceId,
            createdDate: task.createdDate,
            address: address == null
                ? null
                : AddressModel(
                    id: address.id,
                    relatedClientReferenceId: task.clientReferenceId,
                    tenantId: address.tenantId,
                    doorNo: address.doorNo,
                    latitude: address.latitude,
                    longitude: address.longitude,
                    landmark: address.landmark,
                    locationAccuracy: address.locationAccuracy,
                    addressLine1: address.addressLine1,
                    addressLine2: address.addressLine2,
                    city: address.city,
                    pincode: address.pincode,
                    type: address.type,
                    locality: address.localityBoundaryCode != null
                        ? LocalityModel(
                            code: address.localityBoundaryCode!,
                            name: address.localityBoundaryName,
                          )
                        : null,
                    rowVersion: address.rowVersion,
                    auditDetails: AuditDetails(
                      createdBy: task.auditCreatedBy!,
                      createdTime: task.auditCreatedTime!,
                      lastModifiedBy: task.auditModifiedBy,
                      lastModifiedTime: task.auditModifiedTime,
                    ),
                  ),
            status: task.status,
            auditDetails: AuditDetails(
              createdBy: task.auditCreatedBy!,
              createdTime: task.auditCreatedTime!,
              lastModifiedBy: task.auditModifiedBy,
              lastModifiedTime: task.auditModifiedTime,
            ),
            resources: resources == null
                ? null
                : [
                    TaskResourceModel(
                      clientReferenceId: resources.clientReferenceId,
                      id: resources.id,
                      productVariantId: resources.productVariantId,
                      taskId: resources.taskId,
                      deliveryComment: resources.deliveryComment,
                      quantity: resources.quantity,
                      rowVersion: resources.rowVersion,
                      auditDetails: AuditDetails(
                        createdBy: resources.auditCreatedBy!,
                        createdTime: resources.auditCreatedTime!,
                        lastModifiedBy: resources.auditModifiedBy,
                        lastModifiedTime: resources.auditModifiedTime,
                      ),
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
    DataOperation dataOperation = DataOperation.create,
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

    final addressCompanion = entity.address
        ?.copyWith(
          relatedClientReferenceId: entity.clientReferenceId,
          auditDetails: entity.auditDetails,
        )
        .companion;

    final resourcesCompanions = entity.resources?.map((e) {
          return e
              .copyWith(clientReferenceId: entity.clientReferenceId)
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

      if (addressCompanion != null) {
        batch.update(
          sql.address,
          addressCompanion,
          where: (table) => table.relatedClientReferenceId.equals(
            addressCompanion.relatedClientReferenceId.value,
          ),
        );
      }

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
      rowVersion: entity.rowVersion,
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
}

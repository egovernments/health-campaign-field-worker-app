import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:registration_delivery/registration_delivery.dart';

class CustomTaskLocalRepository extends TaskLocalRepository {
  CustomTaskLocalRepository(
    super.sql,
    super.opLogManager,
  );

  @override
  void listenToChanges({
    required TaskSearchModel query,
    required void Function(List<TaskModel> data) listener,
  }) async {
    return retryLocalCallOperation(() async {
      final select = sql.select(sql.task)
        ..where(
          (tbl) => buildAnd([
            if (query.projectId != null)
              sql.task.projectId.equals(
                query.projectId!,
              ),
            if (query.createdBy != null)
              sql.task.clientCreatedBy.equals(
                query.createdBy!,
              ),
            if (query.status != null)
              sql.task.status.equals(
                query.status!,
              ),
            if (query.plannedEndDate != null && query.plannedStartDate != null)
              sql.task.clientModifiedTime.isBetweenValues(
                query.plannedStartDate!,
                query.plannedEndDate!,
              ),
          ]),
        );

      select.watch().listen((results) {
        final data = results
            .map((e) {
              final task = e;
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
                status: task.status,
              );
            })
            .whereNotNull()
            .where((element) => element.isDeleted != true)
            .toList();

        listener(data);
      });
    });
  }

  FutureOr<List<TaskModel>> progressBarSearch(
    TaskSearchModel query, [
    String? userId,
  ]) async {
    return retryLocalCallOperation<List<TaskModel>>(() async {
      final selectQuery = sql.select(sql.task).join([
        leftOuterJoin(
          sql.address,
          sql.address.relatedClientReferenceId.equalsExp(
            sql.task.clientReferenceId,
          ),
        ),
        leftOuterJoin(
          sql.taskResource,
          sql.taskResource.taskclientReferenceId.equalsExp(
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
              if (query.projectId != null)
                sql.task.projectId.equals(
                  query.projectId!,
                ),
              if (query.createdBy != null)
                sql.task.clientCreatedBy.equals(
                  query.createdBy!,
                ),
              if (query.status != null)
                sql.task.status.equals(
                  query.status!,
                ),
              if (query.plannedEndDate != null &&
                  query.plannedStartDate != null)
                sql.task.clientModifiedTime.isBetweenValues(
                  query.plannedStartDate!,
                  query.plannedEndDate!,
                ),
              if (query.status != null)
                sql.task.status.equals(
                  query.status!,
                ),
            ]))
            ..orderBy([
              OrderingTerm(
                expression: sql.task.clientModifiedTime,
                mode: OrderingMode.asc,
              ),
            ]))
          .get();

      final tasksMap = <String, TaskModel>{};

      for (final e in results) {
        final task = e.readTableOrNull(sql.task);
        final resources = e.readTableOrNull(sql.taskResource);
        final address = e.readTableOrNull(sql.address);

        if (task == null) continue;

        // Check if the task is already in the map
        if (tasksMap.containsKey(task.clientReferenceId)) {
          // If it is, add the resource to the existing task's resources
          tasksMap[task.clientReferenceId]!.resources?.add(
                TaskResourceModel(
                  taskclientReferenceId: task.clientReferenceId,
                  clientReferenceId: resources!.clientReferenceId,
                  id: resources.id,
                  isDelivered: resources.isDelivered,
                  productVariantId: resources.productVariantId,
                  tenantId: task.tenantId,
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
              );
        } else {
          // If it's not, create a new task and add it to the map
          tasksMap[task.clientReferenceId] = TaskModel(
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
            additionalFields: task.additionalFields == null
                ? null
                : TaskAdditionalFieldsMapper.fromJson(
                    task.additionalFields!,
                  ),
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
                    auditDetails: (task.auditCreatedBy != null &&
                            task.auditCreatedTime != null)
                        ? AuditDetails(
                            createdBy: task.auditCreatedBy!,
                            createdTime: task.auditCreatedTime!,
                            lastModifiedBy: task.auditModifiedBy,
                            lastModifiedTime: task.auditModifiedTime,
                          )
                        : null,
                    clientAuditDetails: (task.clientCreatedBy != null &&
                            task.clientCreatedTime != null)
                        ? ClientAuditDetails(
                            createdBy: task.clientCreatedBy!,
                            createdTime: task.clientCreatedTime!,
                            lastModifiedBy: task.clientModifiedBy,
                            lastModifiedTime: task.clientModifiedTime,
                          )
                        : null,
                  ),
            status: task.status,
            auditDetails:
                (task.auditCreatedBy != null && task.auditCreatedTime != null)
                    ? AuditDetails(
                        createdBy: task.auditCreatedBy!,
                        createdTime: task.auditCreatedTime!,
                        lastModifiedBy: task.auditModifiedBy,
                        lastModifiedTime: task.auditModifiedTime,
                      )
                    : null,
            clientAuditDetails:
                (task.clientCreatedBy != null && task.clientCreatedTime != null)
                    ? ClientAuditDetails(
                        createdBy: task.clientCreatedBy!,
                        createdTime: task.clientCreatedTime!,
                        lastModifiedBy: task.clientModifiedBy,
                        lastModifiedTime: task.clientModifiedTime,
                      )
                    : null,
            resources: resources == null
                ? null
                : [
                    TaskResourceModel(
                      taskclientReferenceId: task.clientReferenceId,
                      clientReferenceId: resources.clientReferenceId,
                      id: resources.id,
                      tenantId: task.tenantId,
                      isDelivered: resources.isDelivered,
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
        }
      }

      // Convert the map values to a list of tasks
      final uniqueTasks = tasksMap.values.toList();

      return uniqueTasks.where((element) => element.isDeleted != true).toList();
    });
  }

  @override
  DataModelType get type => DataModelType.task;
}

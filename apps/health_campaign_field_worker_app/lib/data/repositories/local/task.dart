import 'dart:async';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class TaskLocalRepository extends LocalRepository<TaskModel, TaskSearchModel> {
  TaskLocalRepository(super.sql, super.opLogManager);

  void listenToChanges({
    required TaskSearchModel query,
    required void Function(List<TaskModel> data) listener,
  }) {
    final select = sql.select(sql.task)
      ..where(
        (tbl) => buildAnd([
          if (query.projectId != null)
            tbl.projectId.equals(
              query.projectId!,
            ),
          if (query.createdBy != null)
            tbl.clientCreatedBy.equals(
              query.createdBy!,
            ),
          if (query.status != null)
            tbl.status.equals(
              query.status!,
            ),
          if (query.plannedEndDate != null && query.plannedStartDate != null)
            tbl.clientCreatedTime.isBetweenValues(
              query.plannedStartDate!,
              query.plannedEndDate!,
            ),
        ]),
      );

    select.watch().listen((results) {
      final data = results
          .map((task) {
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
              resources: null,
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
        sql.taskResource.taskclientReferenceId.equalsExp(
          sql.task.clientReferenceId,
        ),
      ),
    ]);

// Determine the sorting behavior based on query.sortBy
    final isAdministered =
        sql.task.status.equals(Status.administeredSuccess.toValue());

    if (query.sortBy != null) {
      if (query.sortBy == Constants.studentTasksSort[0]) {
        // TREATED_LATEST_FIRST: Administered tasks come first, latest first
        selectQuery.orderBy([
          OrderingTerm(
            expression:
                isAdministered.cast<int>(), // 1 for administered, 0 otherwise
            mode: OrderingMode.desc, // Administered (1) tasks first
          ),
          OrderingTerm(
            expression: sql.task.clientCreatedTime, // Latest first
            mode: OrderingMode.desc,
          ),
        ]);
      } else if (query.sortBy == Constants.studentTasksSort[1]) {
        // NOT_TREATED_LATEST_FIRST: Non-administered tasks come first, latest first
        selectQuery.orderBy([
          OrderingTerm(
            expression:
                isAdministered.cast<int>(), // 0 for non-administered first
            mode: OrderingMode.asc, // Non-administered (0) tasks first
          ),
          OrderingTerm(
            expression: sql.task.clientCreatedTime, // Latest first
            mode: OrderingMode.desc,
          ),
        ]);
      }
    }

    if (query.limit != null && query.offset != null) {
      selectQuery.limit(query.limit!, offset: query.offset);
    }

    final results = await (selectQuery
          ..where(buildAnd([
            if (query.clientReferenceId != null)
              sql.task.clientReferenceId.isIn(query.clientReferenceId!),
            if (query.projectBeneficiaryClientReferenceId != null)
              sql.task.projectBeneficiaryClientReferenceId.isIn(
                query.projectBeneficiaryClientReferenceId!,
              ),
            if (userId != null) sql.task.auditCreatedBy.equals(userId),
            if (query.status != null) sql.task.status.equals(query.status!),
          ])))
        .get();

    final tasksMap = <String, TaskModel>{};

    for (final e in results) {
      final task = e.readTableOrNull(sql.task);
      final resources = e.readTableOrNull(sql.taskResource);
      final address = e.readTableOrNull(sql.address);

      if (task == null) continue;

      if (tasksMap.containsKey(task.clientReferenceId)) {
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
                additionalFields: resources.additionalFields == null
                    ? null
                    : TaskResourceAdditionalFieldsMapper.fromJson(
                        resources.additionalFields!,
                      ),
              ),
            );
      } else {
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
                    additionalFields: resources.additionalFields == null
                        ? null
                        : TaskResourceAdditionalFieldsMapper.fromJson(
                            resources.additionalFields!,
                          ),
                  ),
                ],
        );
      }
    }

    var finalResults = query.sortBy != null
        ? removeDuplicateTasksByBeneficiary(tasksMap.values.toList())
        : tasksMap.values.toList();

    return finalResults;
  }

  List<TaskModel> removeDuplicateTasksByBeneficiary(List<TaskModel> tasks) {
    final Map<String, TaskModel> uniqueTasks = {};

    for (final task in tasks) {
      final beneficiaryId = task.projectBeneficiaryClientReferenceId;

      if (beneficiaryId != null) {
        // Check if a task already exists for the same beneficiaryId
        if (!uniqueTasks.containsKey(beneficiaryId) ||
            (task.clientAuditDetails != null &&
                uniqueTasks[beneficiaryId]!.clientAuditDetails != null &&
                task.clientAuditDetails!.createdTime >
                    uniqueTasks[beneficiaryId]!
                        .clientAuditDetails!
                        .createdTime)) {
          // Store the latest task based on `clientAuditDetails.createdTime`
          uniqueTasks[beneficiaryId] = task;
        }
      }
    }

    return uniqueTasks.values.toList();
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
      }

      await super.create(
        entity,
      );
    });
  }

  @override
  FutureOr<void> bulkCreate(
    List<TaskModel> entities,
  ) async {
    final taskCompanions = entities.map((e) => e.companion).toList();

    final resourcesList = entities
        .map((e) => e.resources?.map((a) {
              return a
                  .copyWith(
                    clientReferenceId: a.clientReferenceId,
                    taskclientReferenceId: e.clientReferenceId,
                    clientAuditDetails: e.clientAuditDetails,
                    auditDetails: e.auditDetails,
                  )
                  .companion;
            }).toList())
        .toList();

    final resourcesCompanions = resourcesList.expand((e) => [e?[0]]).toList();

    await sql.batch((batch) async {
      final addressCompanions = entities.map((e) {
        if (e.address != null) {
          return e.address!
              .copyWith(
                relatedClientReferenceId: e.clientReferenceId,
                clientAuditDetails: e.clientAuditDetails,
                auditDetails: e.auditDetails,
              )
              .companion;
        }
      }).toList();

      if (resourcesCompanions.isNotEmpty) {
        batch.insertAll(
          sql.taskResource,
          resourcesCompanions.whereNotNull().toList(),
          mode: InsertMode.insertOrReplace,
        );
      }

      if (addressCompanions.isNotEmpty) {
        batch.insertAll(
          sql.address,
          addressCompanions.whereNotNull().toList(),
          mode: InsertMode.insertOrReplace,
        );
      }

      batch.insertAll(
        sql.task,
        taskCompanions,
        mode: InsertMode.insertOrReplace,
      );
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
          clientAuditDetails: entity.clientAuditDetails,
        )
        .companion;

    final resourcesCompanions = entity.resources?.map((e) {
          return e
              .copyWith(
                clientReferenceId: e.clientReferenceId,
                taskclientReferenceId: entity.clientReferenceId,
              )
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
            addressCompanion.relatedClientReferenceId.value!,
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

  @override
  DataModelType get type => DataModelType.task;
}

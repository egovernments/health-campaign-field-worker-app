import 'dart:async';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';
import '../../local_store/sql_store/sql_store.dart';

class StudentsSearchRepository extends LocalRepository {
  StudentsSearchRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<EntityModel>> search(EntitySearchModel query) {
    // TODO: implement search
    throw UnimplementedError();
  }

  @override
  // TODO: implement type
  DataModelType get type => throw UnimplementedError();

  studentsSearchQuery({
    String? sortBy,
    required String houseId,
    String? nameQuery,
    required int limit,
    required int offset,
  }) async {
    var selectQuery = sql.select(sql.householdMember).join([]);
    final individualAddress = sql.address.createAlias('individualAddress');
    final taskAddress = sql.address.createAlias('taskAddress');

    selectQuery = selectQuery.join([
      leftOuterJoin(
        sql.individual,
        sql.individual.clientReferenceId.equalsExp(
          sql.householdMember.individualClientReferenceId,
        ),
      ),
      leftOuterJoin(
        individualAddress,
        individualAddress.relatedClientReferenceId.equalsExp(
          sql.individual.clientReferenceId,
        ),
      ),
      leftOuterJoin(
        sql.name,
        sql.name.individualClientReferenceId.equalsExp(
          sql.individual.clientReferenceId,
        ),
      ),
      leftOuterJoin(
        sql.identifier,
        sql.identifier.clientReferenceId.equalsExp(
          sql.individual.clientReferenceId,
        ),
      ),
      leftOuterJoin(
        sql.projectBeneficiary,
        sql.projectBeneficiary.beneficiaryClientReferenceId.equalsExp(
          sql.individual.clientReferenceId,
        ),
      ),
      leftOuterJoin(
        sql.task,
        sql.task.projectBeneficiaryClientReferenceId.isInExp(
          [sql.projectBeneficiary.clientReferenceId],
        ),
      ),
      leftOuterJoin(
        taskAddress,
        taskAddress.relatedClientReferenceId.equalsExp(
          sql.task.clientReferenceId,
        ),
      ),
      leftOuterJoin(
        sql.taskResource,
        sql.taskResource.taskclientReferenceId.equalsExp(
          sql.task.clientReferenceId,
        ),
      ),
    ])
      ..where(buildAnd([
        sql.householdMember.householdClientReferenceId.equals(houseId),
        if (nameQuery != null)
          buildOr([
            sql.name.givenName.contains(
              nameQuery,
            ),
            sql.name.familyName.contains(
              nameQuery,
            ),
            sql.name.givenName.contains(
              nameQuery,
            ),
            sql.name.familyName.contains(
              nameQuery,
            ),
            sql.name.otherNames.equals(
              nameQuery,
            ),
          ]),
      ]))
      ..orderBy([
        if (nameQuery != null)
          OrderingTerm(
            expression: sql.individual.clientReferenceId,
            mode: OrderingMode.desc,
          ),
        if (sortBy != null)
          // Prioritize tasks with 'administeredSuccess' status based on sort order
          OrderingTerm(
            expression: sql.task.status.equals(Status.administeredSuccess
                .toValue()), // Returns boolean: true/false
            mode: sortBy == Constants.studentTasksSort[0]
                ? OrderingMode.desc // 'administeredSuccess' first
                : OrderingMode.asc, // 'administeredSuccess' last
          ),
        if (sortBy != null &&
            sortBy == Constants.studentTasksSort[0]) // sort by task created
          OrderingTerm(
            expression:
                sql.task.clientCreatedTime, // Returns boolean: true/false
            mode: OrderingMode.desc, // 'administeredSuccess' last
          ),
        if (sortBy != null &&
            sortBy ==
                Constants.studentTasksSort[1]) // sort by beneficiary created
          OrderingTerm(
            expression: sql.projectBeneficiary
                .clientCreatedTime, // Returns boolean: true/false
            mode: OrderingMode.desc, // 'administeredSuccess' last
          ),
      ]);

    if (limit != null && offset != null) {
      selectQuery.limit(limit!, offset: offset);
    }

    var results = await (selectQuery).get();

    List<IndividualModel> individuals = await getIndividuals(results);
    List<ProjectBeneficiaryModel> projectBeneficiaries =
        await getProjectBeneficiaries(
      results,
    );
    var tasks = getTasks(results, taskAddress);

    return {
      'individuals': individuals,
      'projectBeneficiaries': projectBeneficiaries,
      'tasks': tasks,
    };
  }

  getIndividuals(List<TypedResult> results) {
    return results
        .map((e) {
          final individual = e.readTable(sql.individual);
          final name = e.readTableOrNull(sql.name);
          final address = e.readTableOrNull(sql.address);
          final identifier = e.readTableOrNull(sql.identifier);

          return IndividualModel(
            id: individual.id,
            tenantId: individual.tenantId,
            individualId: individual.individualId,
            clientReferenceId: individual.clientReferenceId,
            dateOfBirth: individual.dateOfBirth,
            mobileNumber: individual.mobileNumber,
            isDeleted: individual.isDeleted,
            rowVersion: individual.rowVersion,
            clientAuditDetails: (individual.clientCreatedBy != null &&
                    individual.clientCreatedTime != null)
                ? ClientAuditDetails(
                    createdBy: individual.clientCreatedBy!,
                    createdTime: individual.clientCreatedTime!,
                    lastModifiedBy: individual.clientModifiedBy,
                    lastModifiedTime: individual.clientModifiedTime,
                  )
                : null,
            auditDetails: (individual.auditCreatedBy != null &&
                    individual.auditCreatedTime != null)
                ? AuditDetails(
                    createdBy: individual.auditCreatedBy!,
                    createdTime: individual.auditCreatedTime!,
                    lastModifiedBy: individual.auditModifiedBy,
                    lastModifiedTime: individual.auditModifiedTime,
                  )
                : null,
            name: name == null
                ? null
                : NameModel(
                    id: name.id,
                    individualClientReferenceId: individual.clientReferenceId,
                    familyName: name.familyName,
                    givenName: name.givenName,
                    otherNames: name.otherNames,
                    rowVersion: name.rowVersion,
                    tenantId: name.tenantId,
                    auditDetails: (name.auditCreatedBy != null &&
                            name.auditCreatedTime != null)
                        ? AuditDetails(
                            createdBy: name.auditCreatedBy!,
                            createdTime: name.auditCreatedTime!,
                            lastModifiedBy: name.auditModifiedBy,
                            lastModifiedTime: name.auditModifiedTime,
                          )
                        : null,
                    clientAuditDetails: (name.clientCreatedBy != null &&
                            name.clientCreatedTime != null)
                        ? ClientAuditDetails(
                            createdBy: name.clientCreatedBy!,
                            createdTime: name.clientCreatedTime!,
                            lastModifiedBy: name.clientModifiedBy,
                            lastModifiedTime: name.clientModifiedTime,
                          )
                        : null,
                  ),
            bloodGroup: individual.bloodGroup,
            address: [
              address == null
                  ? null
                  : AddressModel(
                      id: address.id,
                      relatedClientReferenceId: individual.clientReferenceId,
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
                      auditDetails: (address.auditCreatedBy != null &&
                              address.auditCreatedTime != null)
                          ? AuditDetails(
                              createdBy: address.auditCreatedBy!,
                              createdTime: address.auditCreatedTime!,
                              lastModifiedBy: address.auditModifiedBy,
                              lastModifiedTime: address.auditModifiedTime,
                            )
                          : null,
                      clientAuditDetails: (address.clientCreatedBy != null &&
                              address.clientCreatedTime != null)
                          ? ClientAuditDetails(
                              createdBy: address.clientCreatedBy!,
                              createdTime: address.clientCreatedTime!,
                              lastModifiedBy: address.clientModifiedBy,
                              lastModifiedTime: address.clientModifiedTime,
                            )
                          : null,
                    ),
            ].whereNotNull().toList(),
            gender: individual.gender,
            identifiers: [
              if (identifier != null)
                IdentifierModel(
                  id: identifier.id,
                  clientReferenceId: individual.clientReferenceId,
                  identifierType: identifier.identifierType,
                  identifierId: identifier.identifierId,
                  rowVersion: identifier.rowVersion,
                  tenantId: identifier.tenantId,
                  auditDetails: AuditDetails(
                    createdBy: identifier.auditCreatedBy!,
                    createdTime: identifier.auditCreatedTime!,
                    lastModifiedBy: identifier.auditModifiedBy,
                    lastModifiedTime: identifier.auditModifiedTime,
                  ),
                ),
            ],
            additionalFields: individual.additionalFields == null
                ? null
                : IndividualAdditionalFieldsMapper.fromJson(
                    individual.additionalFields!,
                  ),
          );
        })
        .where((element) => element.isDeleted != true)
        .toList();
  }

  List<TaskModel> getTasks(
    List<TypedResult> results,
    $AddressTable taskAddress,
  ) {
    // Filter out results where the task is null
    final taskResults = results
        .map((e) => e.readTableOrNull(sql.task))
        .where((task) => task != null)
        .toList();

    if (taskResults.isEmpty) {
      return [];
    }

    // Map valid task entries to TaskModel objects
    return results.where((e) => e.readTableOrNull(sql.task) != null).map((e) {
      final task = e.readTableOrNull(sql.task)!;
      final resources = e.readTableOrNull(sql.taskResource);
      final address = e.readTableOrNull(taskAddress);

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
        additionalFields: task.additionalFields == null
            ? null
            : TaskAdditionalFieldsMapper.fromJson(task.additionalFields!),
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
                auditDetails: _buildAuditDetails(
                  task.auditCreatedBy,
                  task.auditCreatedTime,
                  task.auditModifiedBy,
                  task.auditModifiedTime,
                ),
                clientAuditDetails: _buildClientAuditDetails(
                  task.clientCreatedBy,
                  task.clientCreatedTime,
                  task.clientModifiedBy,
                  task.clientModifiedTime,
                ),
              ),
        status: task.status,
        auditDetails: _buildAuditDetails(
          task.auditCreatedBy,
          task.auditCreatedTime,
          task.auditModifiedBy,
          task.auditModifiedTime,
        ),
        clientAuditDetails: _buildClientAuditDetails(
          task.clientCreatedBy,
          task.clientCreatedTime,
          task.clientModifiedBy,
          task.clientModifiedTime,
        ),
        resources: resources == null
            ? []
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
                  auditDetails: _buildAuditDetails(
                    resources.auditCreatedBy,
                    resources.auditCreatedTime,
                    resources.auditModifiedBy,
                    resources.auditModifiedTime,
                  ),
                  additionalFields: resources.additionalFields == null
                      ? null
                      : TaskResourceAdditionalFieldsMapper.fromJson(
                          resources.additionalFields!,
                        ),
                ),
              ],
      );
    }).toList();
  }

  AuditDetails? _buildAuditDetails(
    String? createdBy,
    int? createdTime,
    String? modifiedBy,
    int? modifiedTime,
  ) {
    return (createdBy != null && createdTime != null)
        ? AuditDetails(
            createdBy: createdBy,
            createdTime: createdTime,
            lastModifiedBy: modifiedBy,
            lastModifiedTime: modifiedTime,
          )
        : null;
  }

  ClientAuditDetails? _buildClientAuditDetails(
    String? createdBy,
    int? createdTime,
    String? modifiedBy,
    int? modifiedTime,
  ) {
    return (createdBy != null && createdTime != null)
        ? ClientAuditDetails(
            createdBy: createdBy,
            createdTime: createdTime,
            lastModifiedBy: modifiedBy,
            lastModifiedTime: modifiedTime,
          )
        : null;
  }

  getProjectBeneficiaries(List<TypedResult> results) {
    return results
        .map((e) {
          final projectBeneficiary = e.readTable(sql.projectBeneficiary);

          return ProjectBeneficiaryModel(
            clientReferenceId: projectBeneficiary.clientReferenceId,
            tenantId: projectBeneficiary.tenantId,
            rowVersion: projectBeneficiary.rowVersion,
            id: projectBeneficiary.id,
            isDeleted: projectBeneficiary.isDeleted,
            beneficiaryClientReferenceId:
                projectBeneficiary.beneficiaryClientReferenceId,
            beneficiaryId: projectBeneficiary.beneficiaryId,
            dateOfRegistration: projectBeneficiary.dateOfRegistration,
            projectId: projectBeneficiary.projectId,
            tag: projectBeneficiary.tag,
            auditDetails: AuditDetails(
              createdTime: projectBeneficiary.auditCreatedTime!,
              createdBy: projectBeneficiary.auditCreatedBy!,
              lastModifiedBy: projectBeneficiary.auditModifiedBy,
              lastModifiedTime: projectBeneficiary.auditModifiedTime,
            ),
            clientAuditDetails: (projectBeneficiary.clientCreatedBy != null &&
                    projectBeneficiary.clientCreatedTime != null)
                ? ClientAuditDetails(
                    createdBy: projectBeneficiary.clientCreatedBy!,
                    createdTime: projectBeneficiary.clientCreatedTime!,
                    lastModifiedBy: projectBeneficiary.clientModifiedBy,
                    lastModifiedTime: projectBeneficiary.clientModifiedTime,
                  )
                : null,
          );
        })
        .where((element) => element.isDeleted != true)
        .toList();
  }
}

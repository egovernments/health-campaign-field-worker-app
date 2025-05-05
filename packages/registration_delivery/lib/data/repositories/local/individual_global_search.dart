import 'dart:async';
import 'dart:math' as math;

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../../../models/entities/status.dart';
import '../../../models/entities/task.dart';
import '../../../models/entities/task_resource.dart';
import '../../../utils/global_search_parameters.dart';

class IndividualGlobalSearchRepository extends LocalRepository {
  IndividualGlobalSearchRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<EntityModel>> search(EntitySearchModel query) {
    throw UnimplementedError();
  }

  @override
  DataModelType get type => throw UnimplementedError();

  individualGlobalSearch(GlobalSearchParameters params) async {
    dynamic selectQuery;
    late int? count = params.totalCount == 0 ? 0 : params.totalCount;

    // Check if the filter contains status for registered or not registered
    if (params.filter!.contains(Status.registered.name) ||
        params.filter!.contains(Status.notRegistered.name)) {
      var proximitySelectQuery =
          await proximitySearch(selectQuery, params, super.sql);

      var identifierIdSelectQuery =
          await searchByIdentifierId(proximitySelectQuery, params, super.sql);

      var nameSelectQuery =
          await nameSearch(identifierIdSelectQuery, params, super.sql);

      var filterSelectQuery = nameSelectQuery;

      if (params.filter != null && params.filter!.isNotEmpty) {
        for (var filter in params.filter!) {
          filterSelectQuery =
              await filterSearch(filterSelectQuery, params, filter, super.sql);
        }
      } else {
        filterSelectQuery = nameSelectQuery;
      }

      if (filterSelectQuery == null) {
        return [];
      }
      // Get total count if offset is zero and filters are applied
      else {
        if (params.offset == 0 &&
            params.filter != null &&
            params.filter!.isNotEmpty) {
          count = await _getTotalCount(filterSelectQuery, params, super.sql);
        }

        await filterSelectQuery.limit(params.limit ?? 50,
            offset: params.offset ?? 0);

        final results = await filterSelectQuery.get();

        return _returnIndividualModel(results, count);
      }
    } else if (params.filter!.isNotEmpty && params.filter != null) {
      var proximitySelectQuery =
          await proximitySearch(selectQuery, params, super.sql);

      var beneficiaryIdSelectQuery =
          await searchByIdentifierId(proximitySelectQuery, params, super.sql);

      var nameSelectQuery =
          await nameSearch(beneficiaryIdSelectQuery, params, super.sql);

      var filterSelectQuery = nameSelectQuery;

      // Apply filters if present
      if (params.filter != null && params.filter!.isNotEmpty) {
        for (var filter in params.filter!) {
          filterSelectQuery =
              await filterSearch(filterSelectQuery, params, filter, super.sql);
        }
      } else {
        filterSelectQuery = nameSelectQuery;
      }

      // Return empty list if no results found
      if (filterSelectQuery == null) {
        return [];
      } else {
        if (params.offset == 0 &&
            params.filter != null &&
            params.filter!.isNotEmpty) {
          count = await _getTotalCount(filterSelectQuery, params, super.sql);
        }
        await filterSelectQuery.limit(params.limit ?? 50,
            offset: params.offset ?? 0);

        final results = await filterSelectQuery.get();
        var data = results
            .map((e) {
              final task = e.readTableOrNull(sql.task);
              final resources = e.readTableOrNull(sql.taskResource);

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
                resources: resources == null
                    ? null
                    : [
                        TaskResourceModel(
                          taskclientReferenceId:
                              resources.taskclientReferenceId,
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
            .where((element) => element.isDeleted != true)
            .toList();

        return {"data": data, "total_count": count};
      }
    } else {
      var proximitySelectQuery =
          await proximitySearch(selectQuery, params, super.sql);

      var beneficiaryIdSelectQuery =
          await searchByIdentifierId(proximitySelectQuery, params, super.sql);

      var nameSelectQuery =
          await nameSearch(beneficiaryIdSelectQuery, params, super.sql);

      // Return empty list if no results found
      if (nameSelectQuery == null) {
        return [];
      } else {
        // Get total count if offset is zero and filters are applied
        if (params.offset == 0 &&
            params.filter != null &&
            params.filter!.isNotEmpty) {
          count = await _getTotalCount(nameSelectQuery, params, super.sql);
        }
        await nameSelectQuery.limit(params.limit ?? 50,
            offset: params.offset ?? 0);

        final results = await nameSelectQuery.get();

        return _returnIndividualModel(results, count);
      }
    }
  }

  proximitySearch(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) {
    if (!params.isProximityEnabled) {
      return null;
    } else if (params.isProximityEnabled) {
      selectQuery = super.sql.individual.select().join([
        joinIndividualAddress(sql),
        leftOuterJoin(sql.household,
            sql.household.householdType.equalsValue(params.householdType)),
        leftOuterJoin(
            sql.householdMember,
            sql.householdMember.individualClientReferenceId
                .equalsExp(sql.individual.clientReferenceId)),
        leftOuterJoin(
            sql.projectBeneficiary,
            sql.projectBeneficiary.beneficiaryClientReferenceId
                .equalsExp(sql.individual.clientReferenceId))
      ])
        ..where(buildAnd([
          if (params.householdType == HouseholdType.community &&
              params.householdClientReferenceId == null)
            sql.householdMember.isHeadOfHousehold.equals(true),
          sql.address.relatedClientReferenceId.isNotNull(),
          sql.individual.clientReferenceId.isNotNull(),
          if (params.latitude != null &&
              params.longitude != null &&
              params.maxRadius != null)
            CustomExpression<bool>('''
              (6371393 * acos(
                  cos(${params.latitude! * math.pi / 180.0}) * cos((address.latitude * ${math.pi / 180.0}))
                  * cos((address.longitude * ${math.pi / 180.0}) - ${params.longitude! * math.pi / 180.0})
                  + sin(${params.latitude! * math.pi / 180.0}) * sin((address.latitude * ${math.pi / 180.0}))
              )) <= ${params.maxRadius!}
            '''),
          if (params.latitude != null &&
              params.longitude != null &&
              params.maxRadius != null)
            sql.address.longitude.isNotNull(),
          sql.address.latitude.isNotNull(),
          sql.householdMember.householdClientReferenceId
              .equalsExp(sql.household.clientReferenceId),
        ]))
        ..orderBy([
          if (params.latitude != null &&
              params.longitude != null &&
              params.maxRadius != null)
            OrderingTerm(
              expression: CustomExpression<double>('''
                (6371393 * acos(
                    cos(${params.latitude! * math.pi / 180.0}) * cos((address.latitude * ${math.pi / 180.0}))
                    * cos((address.longitude * ${math.pi / 180.0}) - ${params.longitude! * math.pi / 180.0})
                    + sin(${params.latitude! * math.pi / 180.0}) * sin((address.latitude * ${math.pi / 180.0}))
                ))
              '''),
              mode: OrderingMode.asc,
            ),
        ]);
    }
    return selectQuery;
  }

  // Function to perform name search based on provided parameters
  nameSearch(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) async {
    if (params.nameSearch == null || params.nameSearch!.isEmpty) {
      return selectQuery;
    } else if (params.nameSearch != null ||
        params.nameSearch!.isNotEmpty && selectQuery == null) {
      selectQuery = super.sql.individual.select().join(
          [joinName(sql), joinIdentifier(sql), joinIndividualAddress(sql)]);

      if (params.householdClientReferenceId != null) {
        await searchByName(selectQuery, params, sql);

        selectQuery = selectQuery.join([
          leftOuterJoin(
              sql.household,
              sql.household.clientReferenceId
                  .equals(params.householdClientReferenceId ?? '')),
          leftOuterJoin(
              sql.projectBeneficiary,
              sql.projectBeneficiary.beneficiaryClientReferenceId
                  .equalsExp(sql.individual.clientReferenceId)),
        ]);
        selectQuery = selectQuery.join([
          leftOuterJoin(
              sql.householdMember,
              sql.householdMember.individualClientReferenceId
                  .equalsExp(sql.individual.clientReferenceId))
        ])
          ..where(buildAnd([
            sql.household.householdType.equalsValue(params.householdType),
            sql.householdMember.householdClientReferenceId
                .equals(params.householdClientReferenceId ?? '')
          ]));
      } else {
        if (params.householdType == HouseholdType.community) {
          await searchByBuildingName(selectQuery, params, sql);
        } else {
          await searchByName(selectQuery, params, sql);
        }

        selectQuery = selectQuery.join([
          leftOuterJoin(
              sql.householdMember,
              sql.householdMember.individualClientReferenceId
                  .equalsExp(sql.individual.clientReferenceId))
        ]);
        selectQuery.join([
          leftOuterJoin(
              sql.household,
              sql.household.clientReferenceId
                  .equalsExp(sql.householdMember.householdClientReferenceId)),
          leftOuterJoin(
              sql.projectBeneficiary,
              sql.projectBeneficiary.beneficiaryClientReferenceId
                  .equalsExp(sql.individual.clientReferenceId))
        ]).where(buildAnd([
          if (params.householdType == HouseholdType.community &&
              params.householdClientReferenceId == null)
            sql.householdMember.isHeadOfHousehold.equals(true),
          sql.household.householdType.equalsValue(params.householdType)
        ]));
      }
    } else if (params.nameSearch != null &&
        params.nameSearch!.isNotEmpty &&
        selectQuery != null) {
      if (params.householdType == HouseholdType.community &&
          params.householdClientReferenceId == null) {
        selectQuery = searchByBuildingName(selectQuery, params, sql);
      } else {
        selectQuery = selectQuery.join([joinName(sql), joinIdentifier(sql)]);
        selectQuery = searchByName(selectQuery, params, sql);
      }
    }
    return selectQuery;
  }

  searchByBuildingName(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) {
    return selectQuery.where(buildAnd([
      if (params.nameSearch != null)
        buildOr([
          sql.address.buildingName.contains(params.nameSearch!),
        ]),
    ]));
  }

  searchByName(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) {
    return selectQuery.where(buildAnd([
      if (params.nameSearch != null)
        buildOr([
          sql.name.givenName.contains(
            params.nameSearch!,
          ),
          sql.name.familyName.contains(
            params.nameSearch!,
          ),
          buildOr([
            sql.name.givenName.contains(
              params.nameSearch!,
            ),
            sql.name.familyName.contains(
              params.nameSearch!,
            ),
            sql.name.otherNames.equals(
              params.nameSearch!,
            ),
          ]),
        ]),
    ]));
  }

  //Function to get search query from beneficiary Id
  searchByIdentifierId(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) async {
    if (params.identifierId == null || params.identifierId!.isEmpty) {
      return selectQuery;
    } else if (params.identifierId != null ||
        params.identifierId!.isNotEmpty && selectQuery == null) {
      selectQuery = super.sql.individual.select().join([joinIdentifier(sql)]);
      await searchByBeneficiary(selectQuery, params, sql);
      selectQuery = selectQuery.join([
        leftOuterJoin(
            sql.householdMember,
            sql.householdMember.individualClientReferenceId
                .equalsExp(sql.individual.clientReferenceId))
      ])
        ..where(sql.householdMember.isHeadOfHousehold.equals(true));
      selectQuery.join([
        leftOuterJoin(
            sql.household,
            sql.household.clientReferenceId
                .equalsExp(sql.householdMember.householdClientReferenceId)),
        leftOuterJoin(
            sql.projectBeneficiary,
            sql.projectBeneficiary.beneficiaryClientReferenceId
                .equalsExp(sql.household.clientReferenceId))
      ]);
    } else if (params.identifierId != null &&
        params.identifierId!.isNotEmpty &&
        selectQuery != null) {
      selectQuery = selectQuery.join([
        joinIdentifier(sql),
      ]);
      selectQuery = searchByBeneficiary(selectQuery, params, sql);
    }

    return selectQuery;
  }

  searchByBeneficiary(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) {
    return selectQuery.where(buildAnd([
      if (params.identifierId != null)
        buildOr([
          sql.identifier.identifierId.contains(
            params.identifierId!,
          ),
        ]),
    ]));
  }

  filterSearch(selectQuery, GlobalSearchParameters params, String filter,
      LocalSqlDataStore sql) async {
    var sql = super.sql;
    if (selectQuery == null) {
      if (filter == Status.registered.name ||
          filter == Status.notRegistered.name) {
        selectQuery = sql.individual.select().join([
          leftOuterJoin(sql.household,
              sql.household.householdType.equalsValue(params.householdType)),
          leftOuterJoin(
              sql.householdMember,
              sql.householdMember.individualClientReferenceId
                  .equalsExp(sql.individual.clientReferenceId)),
          if (params.nameSearch == null || !params.isProximityEnabled)
            leftOuterJoin(
                sql.projectBeneficiary,
                sql.projectBeneficiary.beneficiaryClientReferenceId
                    .equalsExp(sql.individual.clientReferenceId))
        ])
          ..where(buildAnd([
            sql.householdMember.householdClientReferenceId
                .equalsExp(sql.household.clientReferenceId),
            filter == Status.registered.name
                ? sql.projectBeneficiary.beneficiaryClientReferenceId
                    .isNotNull()
                : sql.projectBeneficiary.beneficiaryClientReferenceId.isNull(),
            if (params.householdClientReferenceId != null)
              sql.householdMember.householdClientReferenceId
                  .equals(params.householdClientReferenceId ?? '')
          ]));
      } else {
        var filterSearchQuery =
            await filterTasks(selectQuery, filter, sql, params);

        selectQuery = filterSearchQuery;

        if (params.householdClientReferenceId != null) {
          selectQuery = selectQuery.join([
            leftOuterJoin(
                sql.householdMember,
                sql.householdMember.individualClientReferenceId
                    .equalsExp(sql.individual.clientReferenceId))
          ])
            ..where(sql.householdMember.householdClientReferenceId
                .equals(params.householdClientReferenceId ?? ''));
        }
      }
    } else if (selectQuery != null) {
      if (filter == Status.registered.name ||
          filter == Status.notRegistered.name) {
        selectQuery = selectQuery.join([
          if (params.nameSearch == null && !params.isProximityEnabled)
            leftOuterJoin(
                sql.projectBeneficiary,
                sql.projectBeneficiary.beneficiaryClientReferenceId
                    .equalsExp(sql.individual.clientReferenceId))
        ])
          ..where(filter == Status.registered.name
              ? sql.projectBeneficiary.beneficiaryClientReferenceId.isNotNull()
              : sql.projectBeneficiary.beneficiaryClientReferenceId.isNull());
      } else {
        var filterSearchQuery =
            await filterTasks(selectQuery, filter, sql, params);
        selectQuery = filterSearchQuery;
      }
    }
    return selectQuery;
  }

  filterTasks(selectQuery, String filter, LocalSqlDataStore sql,
      GlobalSearchParameters params) {
    final statusMap = {
      Status.delivered.name: Status.delivered,
      Status.notAdministered.name: Status.notAdministered,
      Status.visited.name: Status.visited,
      Status.notVisited.name: Status.notVisited,
      Status.beneficiaryRefused.name: Status.beneficiaryRefused,
      Status.beneficiaryReferred.name: Status.beneficiaryReferred,
      Status.administeredSuccess.name: Status.administeredSuccess,
      Status.administeredFailed.name: Status.administeredFailed,
      Status.inComplete.name: Status.inComplete,
      Status.toAdminister.name: Status.toAdminister,
      Status.closeHousehold.name: Status.closeHousehold,
    };
    var appliedFilter = statusMap[filter]!.toValue();
    if (selectQuery == null) {
      selectQuery = sql.select(sql.task).join([
        leftOuterJoin(
            sql.projectBeneficiary,
            sql.projectBeneficiary.clientReferenceId
                .equalsExp(sql.task.projectBeneficiaryClientReferenceId)),
        leftOuterJoin(
            sql.individual,
            sql.individual.clientReferenceId.equalsExp(
                sql.projectBeneficiary.beneficiaryClientReferenceId)),
      ])
        ..where(sql.task.status.equals(
          appliedFilter,
        ));
      if (!(params.filter!.contains(Status.notRegistered.name))) {
        selectQuery
            .where(sql.projectBeneficiary.projectId.equals(params.projectId!));
      }
    } else {
      selectQuery = selectQuery.join([
        leftOuterJoin(
            sql.task,
            sql.task.projectBeneficiaryClientReferenceId
                .equalsExp(sql.projectBeneficiary.clientReferenceId))
      ])
        ..where(sql.task.status.equals(statusMap[filter]!.toValue()));

      if (!(params.filter!.contains(Status.notRegistered.name))) {
        selectQuery
            .where(sql.projectBeneficiary.projectId.equals(params.projectId!));
      }
    }

    return selectQuery;
  }

  joinName(LocalSqlDataStore sql) {
    return leftOuterJoin(
      sql.name,
      sql.name.individualClientReferenceId.equalsExp(
        sql.individual.clientReferenceId,
      ),
    );
  }

  joinIdentifier(LocalSqlDataStore sql) {
    return leftOuterJoin(
      sql.identifier,
      sql.identifier.clientReferenceId.equalsExp(
        sql.individual.clientReferenceId,
      ),
    );
  }

  joinIndividualAddress(LocalSqlDataStore sql) {
    return leftOuterJoin(
      sql.address,
      sql.address.relatedClientReferenceId.equalsExp(
        sql.individual.clientReferenceId,
      ),
    );
  }

  joinProjectBeneficiary(LocalSqlDataStore sql) {
    return leftOuterJoin(sql.projectBeneficiary,
        sql.projectBeneficiary.clientReferenceId.isNotNull());
  }

  // Executing custom select query on top of filterSelectQuery to get count
  _getTotalCount(filterSelectQuery, GlobalSearchParameters params,
      LocalSqlDataStore sql) async {
    JoinedSelectStatement selectQuery = filterSelectQuery;
    var query =
        selectQuery.constructQuery().buffer.toString().replaceAll(';', '');
    var variables = selectQuery.constructQuery().introducedVariables;
    var indexesLength = selectQuery.constructQuery().variableIndices;

    dynamic totalCount;

    try {
      totalCount = await sql
          .customSelect('SELECT COUNT(*) AS total_count FROM ($query)',
              variables: indexesLength.isNotEmpty
                  ? variables.map((e) => Variable(e.value)).toList()
                  : [])
          .get();
    } catch (e) {
      debugPrint('error in total $e');
    }
    return totalCount == null ? 0 : totalCount.first.data['total_count'];
  }

  _returnIndividualModel(List results, int? count) {
    final Map<String, IndividualModel> individualsByClientRefId = {};

    for (final e in results) {
      final individualTable = e.readTableOrNull(sql.individual);
      final addressTable = e.readTableOrNull(sql.address);
      final nameTable = e.readTableOrNull(sql.name);
      final identifierTable = e.readTableOrNull(sql.identifier);

      if (individualTable == null) continue;

      final clientReferenceId = individualTable.clientReferenceId;

      final existingIndividual = individualsByClientRefId[clientReferenceId];

      // Build Identifier
      final identifierModel = identifierTable == null
          ? null
          : IdentifierModel(
              id: identifierTable.id,
              clientReferenceId: identifierTable.clientReferenceId,
              identifierType: identifierTable.identifierType,
              identifierId: identifierTable.identifierId,
              tenantId: identifierTable.tenantId,
              rowVersion: identifierTable.rowVersion,
              auditDetails: AuditDetails(
                createdBy: identifierTable.auditCreatedBy!,
                createdTime: identifierTable.auditCreatedTime!,
                lastModifiedBy: identifierTable.auditModifiedBy,
                lastModifiedTime: identifierTable.auditModifiedTime,
              ),
            );

      if (existingIndividual != null) {
        // Individual already exists, append the identifier
        if (identifierModel != null) {
          existingIndividual.identifiers?.add(identifierModel);
        }
      } else {
        // First time seeing this individual, create
        individualsByClientRefId[clientReferenceId] = IndividualModel(
          id: individualTable.id,
          tenantId: individualTable.tenantId,
          individualId: individualTable.individualId,
          clientReferenceId: individualTable.clientReferenceId,
          dateOfBirth: individualTable.dateOfBirth,
          mobileNumber: individualTable.mobileNumber,
          gender: individualTable.gender,
          isDeleted: individualTable.isDeleted,
          bloodGroup: individualTable.bloodGroup,
          rowVersion: individualTable.rowVersion,
          clientAuditDetails: (individualTable.clientCreatedBy != null &&
                  individualTable.clientCreatedTime != null)
              ? ClientAuditDetails(
                  createdBy: individualTable.clientCreatedBy!,
                  createdTime: individualTable.clientCreatedTime!,
                  lastModifiedBy: individualTable.clientModifiedBy,
                  lastModifiedTime: individualTable.clientModifiedTime,
                )
              : null,
          auditDetails: (individualTable.auditCreatedBy != null &&
                  individualTable.auditCreatedTime != null)
              ? AuditDetails(
                  createdBy: individualTable.auditCreatedBy!,
                  createdTime: individualTable.auditCreatedTime!,
                  lastModifiedBy: individualTable.auditModifiedBy,
                  lastModifiedTime: individualTable.auditModifiedTime,
                )
              : null,
          name: nameTable == null
              ? null
              : NameModel(
                  id: nameTable.id,
                  individualClientReferenceId:
                      individualTable.clientReferenceId,
                  familyName: nameTable.familyName,
                  givenName: nameTable.givenName,
                  otherNames: nameTable.otherNames,
                  rowVersion: nameTable.rowVersion,
                  tenantId: nameTable.tenantId,
                  auditDetails: (nameTable.auditCreatedBy != null &&
                          nameTable.auditCreatedTime != null)
                      ? AuditDetails(
                          createdBy: nameTable.auditCreatedBy!,
                          createdTime: nameTable.auditCreatedTime!,
                          lastModifiedBy: nameTable.auditModifiedBy,
                          lastModifiedTime: nameTable.auditModifiedTime,
                        )
                      : null,
                  clientAuditDetails: (nameTable.clientCreatedBy != null &&
                          nameTable.clientCreatedTime != null)
                      ? ClientAuditDetails(
                          createdBy: nameTable.clientCreatedBy!,
                          createdTime: nameTable.clientCreatedTime!,
                          lastModifiedBy: nameTable.clientModifiedBy,
                          lastModifiedTime: nameTable.clientModifiedTime,
                        )
                      : null,
                ),
          address: [
            if (addressTable != null)
              AddressModel(
                id: addressTable.id,
                relatedClientReferenceId: individualTable.clientReferenceId,
                tenantId: addressTable.tenantId,
                doorNo: addressTable.doorNo,
                latitude: addressTable.latitude,
                longitude: addressTable.longitude,
                landmark: addressTable.landmark,
                locationAccuracy: addressTable.locationAccuracy,
                addressLine1: addressTable.addressLine1,
                addressLine2: addressTable.addressLine2,
                city: addressTable.city,
                pincode: addressTable.pincode,
                type: addressTable.type,
                locality: addressTable.localityBoundaryCode != null
                    ? LocalityModel(
                        code: addressTable.localityBoundaryCode!,
                        name: addressTable.localityBoundaryName,
                      )
                    : null,
                rowVersion: addressTable.rowVersion,
                auditDetails: (addressTable.auditCreatedBy != null &&
                        addressTable.auditCreatedTime != null)
                    ? AuditDetails(
                        createdBy: addressTable.auditCreatedBy!,
                        createdTime: addressTable.auditCreatedTime!,
                        lastModifiedBy: addressTable.auditModifiedBy,
                        lastModifiedTime: addressTable.auditModifiedTime,
                      )
                    : null,
                clientAuditDetails: (addressTable.clientCreatedBy != null &&
                        addressTable.clientCreatedTime != null)
                    ? ClientAuditDetails(
                        createdBy: addressTable.clientCreatedBy!,
                        createdTime: addressTable.clientCreatedTime!,
                        lastModifiedBy: addressTable.clientModifiedBy,
                        lastModifiedTime: addressTable.clientModifiedTime,
                      )
                    : null,
              )
          ],
          identifiers: identifierModel != null ? [identifierModel] : [],
          additionalFields: individualTable.additionalFields == null
              ? null
              : IndividualAdditionalFieldsMapper.fromJson(
                  individualTable.additionalFields!,
                ),
        );
      }
    }

    return {
      'total_count': count,
      'data': individualsByClientRefId.values.toList(),
    };
  }
}

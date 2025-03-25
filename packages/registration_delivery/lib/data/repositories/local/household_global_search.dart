import 'dart:async';
import 'dart:math' as math;

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:registration_delivery/models/entities/task.dart';

import '../../../models/entities/household.dart';
import '../../../models/entities/status.dart';
import '../../../models/entities/task_resource.dart';
import '../../../utils/global_search_parameters.dart';

class HouseHoldGlobalSearchRepository extends LocalRepository {
  HouseHoldGlobalSearchRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<EntityModel>> search(EntitySearchModel query) {
    throw UnimplementedError();
  }

  @override
  DataModelType get type => throw UnimplementedError();

  // Function to perform global search for households
  houseHoldGlobalSearch(GlobalSearchParameters params) async {
    dynamic selectQuery;
    late int? count = params.totalCount == 0 ? 0 : params.totalCount;

    // Check if the filter contains status for registered or not registered
    if (params.filter!.contains(Status.registered.name) ||
        params.filter!.contains(Status.notRegistered.name)) {
      var proximitySelectQuery =
          await proximitySearch(selectQuery, params, super.sql);

      var nameSelectQuery =
          await nameSearch(proximitySelectQuery, params, super.sql);

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
        // Get total count if offset is zero and filters are applied
        if (params.offset == 0 &&
            params.filter != null &&
            params.filter!.isNotEmpty) {
          count = await _getTotalCount(filterSelectQuery, params, super.sql);
        }

        await filterSelectQuery.limit(params.limit ?? 50,
            offset: params.offset ?? 0);

        final results = await filterSelectQuery.get();

        return _returnHouseHoldModel(results, count);
      }
    } else if (params.filter!.isNotEmpty && params.filter != null) {
      var proximitySelectQuery =
          await proximitySearch(selectQuery, params, super.sql);

      var nameSelectQuery =
          await nameSearch(proximitySelectQuery, params, super.sql);

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

      var nameSelectQuery =
          await nameSearch(proximitySelectQuery, params, super.sql);

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

        return _returnHouseHoldModel(results, count);
      }
    }
  }

  // Function to perform proximity search based on provided parameters
  proximitySearch(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) {
    if (!params.isProximityEnabled) {
      return null;
    } else if (params.isProximityEnabled) {
      selectQuery = super.sql.address.select().join([
        joinHouseHoldAddress(sql),
        leftOuterJoin(
            sql.projectBeneficiary,
            sql.projectBeneficiary.beneficiaryClientReferenceId
                .equalsExp(sql.household.clientReferenceId))
      ])
        ..where(buildAnd([
          sql.address.relatedClientReferenceId.isNotNull(),
          sql.household.clientReferenceId.isNotNull(),
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
          sql.household.householdType.equalsValue(params.householdType)
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
      selectQuery = super
          .sql
          .individual
          .select()
          .join([joinName(sql), joinIndividualAddress(sql)]);
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
                .equalsExp(sql.household.clientReferenceId))
      ]).where(sql.household.householdType.equalsValue(params.householdType));
    } else if (params.nameSearch != null &&
        params.nameSearch!.isNotEmpty &&
        selectQuery != null) {
      if (params.householdType == HouseholdType.community) {
        selectQuery = searchByBuildingName(selectQuery, params, sql);
      } else {
        selectQuery = selectQuery.join([
          joinName(sql),
        ]);
        selectQuery = searchByName(selectQuery, params, sql);
      }
    }
    return selectQuery;
  }

  // Function to search by name based on provided parameters
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

  filterSearch(selectQuery, GlobalSearchParameters params, String filter,
      LocalSqlDataStore sql) async {
    var sql = super.sql;
    if (selectQuery == null) {
      if (filter == Status.registered.name ||
          filter == Status.notRegistered.name) {
        selectQuery = sql.household.select().join([
          if (params.nameSearch == null || !params.isProximityEnabled)
            leftOuterJoin(
                sql.projectBeneficiary,
                sql.projectBeneficiary.beneficiaryClientReferenceId
                    .equalsExp(sql.household.clientReferenceId))
        ])
          ..where(buildAnd([
            sql.household.householdType.equalsValue(params.householdType),
            filter == Status.registered.name
                ? sql.projectBeneficiary.beneficiaryClientReferenceId
                    .isNotNull()
                : sql.projectBeneficiary.beneficiaryClientReferenceId.isNull()
          ]));
      } else {
        var filterSearchQuery =
            await filterTasks(selectQuery, filter, sql, params);

        selectQuery = filterSearchQuery;
      }
    } else if (selectQuery != null) {
      if (filter == Status.registered.name ||
          filter == Status.notRegistered.name) {
        selectQuery = selectQuery.join([
          if (params.nameSearch == null && !params.isProximityEnabled)
            leftOuterJoin(
                sql.projectBeneficiary,
                sql.projectBeneficiary.beneficiaryClientReferenceId
                    .equalsExp(sql.household.clientReferenceId))
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
    var applyFilter = filter;
    if (selectQuery == null) {
      selectQuery = sql.select(sql.task).join([
        leftOuterJoin(
            sql.projectBeneficiary,
            sql.projectBeneficiary.clientReferenceId
                .equalsExp(sql.task.projectBeneficiaryClientReferenceId)),
        leftOuterJoin(
            sql.household,
            sql.household.clientReferenceId
                .equalsExp(sql.projectBeneficiary.beneficiaryClientReferenceId))
      ])
        ..where(buildAnd([
          sql.household.householdType.equalsValue(params.householdType),
          sql.task.status.equals(
            statusMap[applyFilter]!.toValue(),
          )
        ]));
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

  searchByBuildingName(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) {
    return selectQuery.where(buildAnd([
      if (params.nameSearch != null)
        sql.address.buildingName.contains(params.nameSearch!),
    ]));
  }

  joinHouseHoldAddress(LocalSqlDataStore sql) {
    return leftOuterJoin(
      sql.household,
      sql.household.clientReferenceId.equalsExp(
        sql.address.relatedClientReferenceId,
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

  joinIndividual(LocalSqlDataStore sql) {
    return leftOuterJoin(
      sql.individual,
      sql.individual.clientReferenceId.equalsExp(
        sql.name.individualClientReferenceId,
      ),
    );
  }

  _returnHouseHoldModel(results, totalCount) {
    var data = results
        .map((e) {
          final household = e.readTableOrNull(sql.household);
          final address = e.readTableOrNull(sql.address);

          return HouseholdModel(
            householdType: household.householdType,
            id: household.id,
            tenantId: household.tenantId,
            clientReferenceId: household.clientReferenceId,
            memberCount: household.memberCount,
            rowVersion: household.rowVersion,
            isDeleted: household.isDeleted,
            additionalFields: household.additionalFields != null &&
                    household.additionalFields.toString().isNotEmpty
                ? HouseholdAdditionalFieldsMapper.fromJson(
                    household.additionalFields.toString())
                : null,
            auditDetails: (household.auditCreatedBy != null &&
                    household.auditCreatedTime != null)
                ? AuditDetails(
                    createdBy: household.auditCreatedBy!,
                    createdTime: household.auditCreatedTime!,
                    lastModifiedBy: household.auditModifiedBy,
                    lastModifiedTime: household.auditModifiedTime,
                  )
                : null,
            clientAuditDetails: (household.clientCreatedBy != null &&
                    household.clientCreatedTime != null)
                ? ClientAuditDetails(
                    createdBy: household.clientCreatedBy!,
                    createdTime: household.clientCreatedTime!,
                    lastModifiedBy: household.clientModifiedBy,
                    lastModifiedTime: household.clientModifiedTime,
                  )
                : null,
            address: address == null
                ? null
                : AddressModel(
                    id: address.id,
                    relatedClientReferenceId: household.clientReferenceId,
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
                    locality: address.localityBoundaryCode != null
                        ? LocalityModel(
                            code: address.localityBoundaryCode!,
                            name: address.localityBoundaryName,
                          )
                        : null,
                    type: address.type,
                    rowVersion: address.rowVersion,
                    auditDetails: (household.auditCreatedBy != null &&
                            household.auditCreatedBy != null)
                        ? AuditDetails(
                            createdBy: household.auditCreatedBy!,
                            createdTime: household.auditCreatedTime!,
                            lastModifiedBy: household.auditModifiedBy,
                            lastModifiedTime: household.auditModifiedTime,
                          )
                        : null,
                    clientAuditDetails: (household.clientCreatedBy != null &&
                            household.clientCreatedTime != null)
                        ? ClientAuditDetails(
                            createdBy: household.clientCreatedBy!,
                            createdTime: household.clientCreatedTime!,
                            lastModifiedBy: household.clientModifiedBy,
                            lastModifiedTime: household.clientModifiedTime,
                          )
                        : null,
                  ),
          );
        })
        .where((element) => element.isDeleted != true)
        .toList();

    return {'total_count': totalCount, 'data': data};
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
}

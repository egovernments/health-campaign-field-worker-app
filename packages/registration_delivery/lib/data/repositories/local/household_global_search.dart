import 'dart:async';
import 'dart:math' as math;
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:registration_delivery/models/entities/task.dart';

import '../../../models/entities/household.dart';
import '../../../models/entities/status.dart';
import '../../../models/entities/task_resource.dart';
import '../../../utils/global_search_parameters.dart';
import 'closed_household_search.dart';

class HouseHoldGlobalSearchRepository extends LocalRepository {
  HouseHoldGlobalSearchRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<EntityModel>> search(EntitySearchModel query) {
    throw UnimplementedError();
  }

  @override
  DataModelType get type => throw UnimplementedError();

  houseHoldGlobalSearch(GlobalSearchParameters params) async {
    if (params.filter!.contains(Status.closeHousehold.name)) {
      return await ClosedHouseholdHoldSearchLocalRepository()
          .performClosedHouseholdSearch(params, super.sql);
    } else if (params.filter!.contains(Status.registered.name) ||
        params.filter!.contains(Status.notRegistered.name)) {
      dynamic selectQuery;

      var proximitySelectQuery =
          await proximitySearch(selectQuery, params, super.sql);

      var nameSelectQuery =
          await nameSearch(proximitySelectQuery, params, super.sql);

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
      } else {
        await filterSelectQuery.limit(params.limit ?? 50,
            offset: params.offset ?? 0);

        final results = await filterSelectQuery.get();

        return _returnHouseHoldModel(results);
      }
    } else if (params.filter!.isNotEmpty && params.filter != null) {
      dynamic selectQuery;

      var proximitySelectQuery =
          await proximitySearch(selectQuery, params, super.sql);

      var nameSelectQuery =
          await nameSearch(proximitySelectQuery, params, super.sql);

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
      } else {
        await filterSelectQuery.limit(params.limit ?? 50,
            offset: params.offset ?? 0);

        final results = await filterSelectQuery.get();

        return results
            .map((e) {
              final task = e.readTable(sql.task);
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
      }
    } else {
      dynamic selectQuery;

      var proximitySelectQuery =
          await proximitySearch(selectQuery, params, super.sql);

      var nameSelectQuery =
          await nameSearch(proximitySelectQuery, params, super.sql);

      if (nameSelectQuery == null) {
        return [];
      } else {
        await nameSelectQuery.limit(params.limit ?? 50,
            offset: params.offset ?? 0);

        final results = await nameSelectQuery.get();

        return _returnHouseHoldModel(results);
      }
    }
  }

  proximitySearch(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) {
    if (!params.isProximityEnabled) {
      return null;
    } else if (params.isProximityEnabled) {
      selectQuery = super.sql.address.select().join([
        joinHouseHoldAddress(sql),
      ]);
      performProximitySearch(selectQuery, params, sql);
      return selectQuery;
    }
  }

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
      await searchByName(selectQuery, params, sql);
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
                .equalsExp(sql.householdMember.householdClientReferenceId))
      ]);
    } else if (params.nameSearch != null &&
        params.nameSearch!.isNotEmpty &&
        selectQuery != null) {
      selectQuery = selectQuery.join([
        joinName(sql),
      ]);
      selectQuery = searchByName(selectQuery, params, sql);
    }
    return selectQuery;
  }

  performProximitySearch(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) {
    return (selectQuery
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
          ])))
        .orderBy([
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

  searchByName(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) {
    return selectQuery.where(buildAnd([
      if (params.nameSearch != null)
        buildOr([
          sql.name.givenName.contains(
            params.nameSearch!,
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
        selectQuery = super.sql.household.select().join([
          leftOuterJoin(
              sql.projectBeneficiary,
              sql.projectBeneficiary.beneficiaryClientReferenceId
                  .equalsExp(super.sql.household.clientReferenceId))
        ])
          ..where(filter == Status.registered.name
              ? sql.projectBeneficiary.beneficiaryClientReferenceId.isNotNull()
              : sql.projectBeneficiary.beneficiaryClientReferenceId.isNull());
      } else {
        var filterSearchQuery = await filterTasks(selectQuery, filter, sql);

        selectQuery = filterSearchQuery;
      }
    } else if (selectQuery != null) {
      if (filter == Status.registered.name ||
          filter == Status.notRegistered.name) {
        selectQuery = selectQuery.join([
          leftOuterJoin(
              sql.projectBeneficiary,
              filter == Status.registered.name
                  ? sql.projectBeneficiary.beneficiaryClientReferenceId
                      .equalsExp(super.sql.household.clientReferenceId)
                  : sql.projectBeneficiary.beneficiaryClientReferenceId
                      .equalsExp(super.sql.household.clientReferenceId))
        ])
          ..where(filter == Status.registered.name
              ? sql.projectBeneficiary.beneficiaryClientReferenceId.isNotNull()
              : sql.projectBeneficiary.beneficiaryClientReferenceId.isNull());
      } else {
        var filterSearchQuery = await filterTasks(selectQuery, filter, sql);

        selectQuery = filterSearchQuery;
      }
    }
    return selectQuery;
  }

  filterTasks(selectQuery, String filter, LocalSqlDataStore sql) {
    final statusMap = {
      Status.delivered.name: Status.delivered,
      Status.notDelivered.name: Status.notDelivered,
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
    selectQuery = sql.select(sql.task).join([]);

    selectQuery.where(sql.task.status.equals(
      statusMap[applyFilter]!.toValue(),
    ));

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

  joinProjectBeneficiary(LocalSqlDataStore sql) {
    return leftOuterJoin(sql.projectBeneficiary,
        sql.projectBeneficiary.clientReferenceId.isNotNull());
  }

  _returnHouseHoldModel(results) {
    return results
        .map((e) {
          final household = e.readTable(sql.household);
          final address = e.readTableOrNull(sql.address);

          return HouseholdModel(
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
  }
}

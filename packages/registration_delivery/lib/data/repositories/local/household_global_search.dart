import 'dart:async';
import 'dart:math' as math;

import 'package:closed_household/closed_household.dart'
    hide Status, StatusMapper;
import 'package:closed_household/closed_household.dart' as closed_status
    show Status;
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../models/entities/household.dart';
import '../../../models/entities/status.dart';
import '../../../utils/global_search_parameters.dart';

class HouseHoldGlobalSearchRepository extends LocalRepository {
  HouseHoldGlobalSearchRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<EntityModel>> search(EntitySearchModel query) {
    throw UnimplementedError();
  }

  @override
  DataModelType get type => throw UnimplementedError();

  houseHoldGlobalSearch(GlobalSearchParameters params) async {
    dynamic selectQuery;

    var proximitySelectQuery =
        await proximitySearch(selectQuery, params, super.sql);

    var nameSelectQuery =
        await nameSearch(proximitySelectQuery, params, super.sql);

    var filterSelectQuery = nameSelectQuery;

    if (params.filter != null && params.filter!.isNotEmpty) {
      for (var element in params.filter!) {
        filterSelectQuery =
            await filterSearch(filterSelectQuery, element, super.sql);
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

      if (params.filter?.contains(Status.closeHousehold.name) ?? false) {
        return results
            .map((e) {
              final userAction = e.readTableOrNull(sql.userAction);

              return UserActionModel(
                  id: userAction?.id,
                  tenantId: userAction?.tenantId,
                  action: userAction?.action,
                  clientReferenceId: userAction?.clientReferenceId,
                  rowVersion: userAction?.rowVersion,
                  auditDetails: (userAction?.auditCreatedBy != null &&
                          userAction?.auditCreatedTime != null)
                      ? AuditDetails(
                          createdBy: userAction?.auditCreatedBy!,
                          createdTime: userAction?.auditCreatedTime!,
                          lastModifiedBy: userAction?.auditModifiedBy,
                          lastModifiedTime: userAction?.auditModifiedTime,
                        )
                      : null,
                  clientAuditDetails: (userAction?.clientCreatedBy != null &&
                          userAction?.clientCreatedTime != null)
                      ? ClientAuditDetails(
                          createdBy: userAction?.clientCreatedBy!,
                          createdTime: userAction?.clientCreatedTime!,
                          lastModifiedBy: userAction?.clientModifiedBy,
                          lastModifiedTime: userAction?.clientModifiedTime,
                        )
                      : null,
                  beneficiaryTag: userAction.beneficiaryTag != null &&
                          userAction.beneficiaryTag.isNotEmpty
                      ? userAction.beneficiaryTag
                      : null,
                  boundaryCode: userAction.boundaryCode,
                  isDeleted: userAction.isDeleted,
                  latitude: userAction.latitude,
                  longitude: userAction.longitude,
                  locationAccuracy: userAction.locationAccuracy,
                  nonRecoverableError: userAction.nonRecoverableError,
                  projectId: userAction.projectId,
                  resourceTag: userAction.resourceTag,
                  status: userAction.status,
                  additionalFields: userAction?.additionalFields != null &&
                          userAction?.additionalFields.isNotEmpty
                      ? UserActionAdditionalFieldsMapper.fromJson(
                          userAction!.additionalFields.toString())
                      : null);
            })
            .where((element) => element.isDeleted != true)
            .toList();
      } else {
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
                        clientAuditDetails: (household.clientCreatedBy !=
                                    null &&
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
  }

  proximitySearch(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) {
    if (!params.isProximityEnabled) {
      return null;
    } else if (params.isProximityEnabled) {
      selectQuery = super.sql.household.select().join([
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

  filterSearch(selectQuery, String filter, LocalSqlDataStore sql) async {
    var sql = super.sql;
    if (selectQuery == null) {
      if (filter == Status.closeHousehold.name) {
        selectQuery = super.sql.userAction.select().join([])
          ..where(sql.userAction.status
              .equals(closed_status.Status.closeHousehold.toValue()));
      } else {
        selectQuery = super.sql.household.select().join([
          leftOuterJoin(
              sql.projectBeneficiary,
              sql.projectBeneficiary.beneficiaryClientReferenceId
                  .equalsExp(super.sql.household.clientReferenceId))
        ])
          ..where(filter == Status.registered.name
              ? sql.projectBeneficiary.beneficiaryClientReferenceId.isNotNull()
              : sql.projectBeneficiary.beneficiaryClientReferenceId.isNull());
      }
    } else if (selectQuery != null) {
      if (filter == Status.closeHousehold.name) {
        selectQuery = selectQuery.join([
          leftOuterJoin(
              sql.userAction,
              sql.userAction.status
                  .equals(closed_status.Status.closeHousehold.toValue()))
        ])
          ..where(sql.userAction.status
              .equals(closed_status.Status.closeHousehold.toValue()));
      } else {
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

  joinHouseHoldAddress(LocalSqlDataStore sql) {
    return leftOuterJoin(
      sql.address,
      sql.address.relatedClientReferenceId.equalsExp(
        sql.household.clientReferenceId,
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
}

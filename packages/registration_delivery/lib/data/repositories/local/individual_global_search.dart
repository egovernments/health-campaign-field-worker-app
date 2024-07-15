import 'dart:async';
import 'dart:math' as math;

import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../../models/entities/status.dart';
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

    var proximitySelectQuery =
        await proximitySearch(selectQuery, params, super.sql);

    var nameSelectQuery =
        await nameSearch(proximitySelectQuery, params, super.sql);

    var filterSelectQuery =
        await filterSearch(nameSelectQuery, params, super.sql);

    await filterSelectQuery.limit(params.limit ?? 50,
        offset: params.offset ?? 0);

    final results = await filterSelectQuery.get();
    return results
        .map((e) {
          final individual = e.readTableOrNull(sql.individual);
          final address = e.readTableOrNull(sql.address);
          final name = e.readTableOrNull(sql.name);

          return IndividualModel(
            id: individual?.id,
            tenantId: individual?.tenantId,
            clientReferenceId: individual!.clientReferenceId,
            dateOfBirth: individual.dateOfBirth,
            name: NameModel(
              givenName: name?.givenName,
              individualClientReferenceId: individual.clientReferenceId,
              tenantId: individual.tenantId,
              auditDetails: AuditDetails(
                createdBy: individual.auditCreatedBy!,
                createdTime: individual.auditCreatedTime!,
                lastModifiedBy: individual.auditModifiedBy,
                lastModifiedTime: individual.auditModifiedTime,
              ),
            ),
            rowVersion: individual.rowVersion,
            isDeleted: individual.isDeleted,
            auditDetails: AuditDetails(
              createdBy: individual.auditCreatedBy!,
              createdTime: individual.auditCreatedTime!,
              lastModifiedBy: individual.auditModifiedBy,
              lastModifiedTime: individual.auditModifiedTime,
            ),
            address: address == null
                ? null
                : [
                    AddressModel(
                      id: address.id,
                      relatedClientReferenceId:
                          address.relatedClientReferenceId,
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
                      auditDetails: AuditDetails(
                        createdBy: individual.auditCreatedBy!,
                        createdTime: individual.auditCreatedTime!,
                        lastModifiedBy: individual.auditModifiedBy,
                        lastModifiedTime: individual.auditModifiedTime,
                      ),
                    ),
                  ],
          );
        })
        .where((element) => element.isDeleted != true)
        .toList();
  }

  proximitySearch(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) {
    if (!params.isProximityEnabled) {
      return null;
    } else if (params.isProximityEnabled) {
      selectQuery = super.sql.individual.select().join([
        joinIndividualAddress(sql),
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
    } else if (params.nameSearch != null &&
        params.nameSearch!.isNotEmpty &&
        selectQuery != null) {
      selectQuery = selectQuery.join([
        joinName(sql),
      ]);
      selectQuery = searchByName(selectQuery, params, sql);
    }
    print(selectQuery.toString());
    return selectQuery;
  }

  filterSearch(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) {
    var sql = super.sql;
    if (params.filter == null || params.filter!.isEmpty) {
      return selectQuery;
    } else if (params.filter != null &&
        params.filter!.isNotEmpty &&
        selectQuery == null) {
      for (var filter in params.filter!) {
        if (filter == Status.registered.name) {
          selectQuery = super.sql.individual.select();
          selectQuery = selectQuery.join([
            leftOuterJoin(
              sql.projectBeneficiary,
              sql.projectBeneficiary.beneficiaryClientReferenceId
                  .equalsExp(super.sql.individual.clientReferenceId),
            )
          ])
            ..where(sql.projectBeneficiary.beneficiaryClientReferenceId
                .isNotNull());
        } else if (filter == Status.notRegistered.name) {
          selectQuery = super.sql.individual.select();
          selectQuery = selectQuery.join([
            leftOuterJoin(
              sql.projectBeneficiary,
              sql.projectBeneficiary.beneficiaryClientReferenceId
                  .equalsExp(super.sql.individual.clientReferenceId),
            )
          ])
            ..where(
                sql.projectBeneficiary.beneficiaryClientReferenceId.isNull());
        }
      }
    } else if (params.filter != null &&
        params.filter!.isNotEmpty &&
        selectQuery != null) {
      for (var filter in params.filter!) {
        if (filter == Status.registered.name) {
          selectQuery = selectQuery.join([
            leftOuterJoin(
              sql.projectBeneficiary,
              sql.projectBeneficiary.beneficiaryClientReferenceId
                  .equalsExp(super.sql.individual.clientReferenceId),
            )
          ])
            ..where(sql.projectBeneficiary.beneficiaryClientReferenceId
                .isNotNull());
        } else if (filter == Status.notRegistered.name) {
          selectQuery = selectQuery.join([
            leftOuterJoin(
              sql.projectBeneficiary,
              sql.projectBeneficiary.beneficiaryClientReferenceId
                  .equalsExp(super.sql.individual.clientReferenceId),
            )
          ])
            ..where(
                sql.projectBeneficiary.beneficiaryClientReferenceId.isNull());
        }
      }
    }
    print(selectQuery.toString());
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

  joinIndividualAddress(LocalSqlDataStore sql) {
    return leftOuterJoin(
      sql.address,
      sql.address.relatedClientReferenceId.equalsExp(
        sql.individual.clientReferenceId,
      ),
    );
  }

  performProximitySearch(
      selectQuery, GlobalSearchParameters params, LocalSqlDataStore sql) {
    return (selectQuery
          ..where(buildAnd([
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

  joinProjectBeneficiary(LocalSqlDataStore sql) {
    return leftOuterJoin(sql.projectBeneficiary,
        sql.projectBeneficiary.clientReferenceId.isNotNull());
  }
}

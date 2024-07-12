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

    final results = await filterSelectQuery.get();

    return results;
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
          selectQuery = super.sql.individual.select().join([
            joinProjectBeneficiary(sql),
          ]);
        } else if (filter == Status.notRegistered.name) {
          selectQuery = super.sql.individual.select();
          selectQuery.where((a) => notExistsQuery(
                sql.projectBeneficiary.select()
                  ..where((b) => b.beneficiaryClientReferenceId
                      .equalsExp(a.clientReferenceId)),
              ));
        }
      }
    } else if (params.filter != null &&
        params.filter!.isNotEmpty &&
        selectQuery != null) {
      for (var filter in params.filter!) {
        if (filter == Status.registered.name) {
          selectQuery.join([
            joinProjectBeneficiary(sql),
          ]);
        } else if (filter == Status.notRegistered.name) {
          selectQuery.where(
            notExistsQuery(
              sql.projectBeneficiary.select()
                ..where(
                  (b) => b.beneficiaryClientReferenceId
                      .equalsExp(sql.individual.clientReferenceId),
                ),
            ),
          );
        }
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

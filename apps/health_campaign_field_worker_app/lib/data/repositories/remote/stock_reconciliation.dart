// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';

import '../../../models/data_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/environment_config.dart';
import '../../data_repository.dart';

class StockReconciliationRemoteRepository extends RemoteRepository<
    HcmStockReconciliationModel, HcmStockReconciliationSearchModel> {
  StockReconciliationRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'StockReconciliation',
  });

  @override
  FutureOr<Response> bulkCreate(List<EntityModel> entities) {
    final stockMapEntities = entities.map((e) => e.toMap()).toList();
    List<Map<String, dynamic>> transformedLogs = [];

    for (var log in stockMapEntities) {
      var stockRecon = log["stockReconciliation"] as Map<String, dynamic>;
      var transformedLog = {
        ...stockRecon,
        "additionalFields": log["additionalFields"],
        "auditDetails": log["auditDetails"],
        "clientAuditDetails": log["clientAuditDetails"],
      };
      transformedLogs.add(transformedLog);
    }

    return executeFuture(
      future: () async {
        return await dio.post(
          bulkCreatePath,
          options: Options(headers: {
            "content-type": 'application/json',
          }),
          data: {
            EntityPlurals.getPluralForEntityName(entityName): transformedLogs,
          },
        );
      },
    );
  }

  @override
  FutureOr<List<HcmStockReconciliationModel>> search(
    HcmStockReconciliationSearchModel query, {
    int? offSet,
    int? limit,
  }) async {
    Response response;

    response = await executeFuture(
      future: () async {
        return await dio.post(
          searchPath,
          queryParameters: {
            'offset': offSet ?? 0,
            'limit': limit ?? 100,
            'tenantId': envConfig.variables.tenantId,
            if (query.isDeleted ?? false) 'includeDeleted': query.isDeleted,
          },
          data: {
            EntityPlurals.getPluralForEntityName(entityName):
                query.stockReconciliationSearchModel?.toMap(),
          },
        );
      },
    );

    final responseMap = (response.data);

    if (responseMap is! Map<String, dynamic>) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    if (!responseMap.containsKey(
      EntityPlurals.getPluralForEntityName(entityName),
    )) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityResponse =
        await responseMap[EntityPlurals.getPluralForEntityName(entityName)];

    if (entityResponse is! List) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityList = entityResponse.whereType<Map<String, dynamic>>();

    var entities = entityList
        .map((e) => HcmStockReconciliationModel(
              additionalFields:
                  StockReconciliationAdditionalFieldsMapper.fromMap(
                e['additionalFields'],
              ),
              stockReconciliation: StockReconciliationModelMapper.fromMap(e),
              auditDetails: AuditDetailsMapper.fromMap(e['auditDetails']),
              clientAuditDetails:
                  ClientAuditDetailsMapper.fromMap(e['clientAuditDetails']),
            ))
        .toList();

    return entities;
  }

  @override
  DataModelType get type => DataModelType.stockReconciliation;
}

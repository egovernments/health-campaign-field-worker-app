// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:referral_reconciliation/models/entities/h_f_referral.dart';

import '../../../models/entities/hcm_hf_referral.dart';
import '../../../utils/constants.dart';
import '../../../utils/environment_config.dart';

class HFReferralRemoteRepository
    extends RemoteRepository<HcmHFReferralModel, HcmHFReferralSearchModel> {
  HFReferralRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'HFReferral',
    super.isSearchResponsePlural = true,
  });

  @override
  FutureOr<Response> bulkCreate(List<EntityModel> entities) async {
    final hfReferralMapEntities = entities.map((e) => e.toMap()).toList();
    List<Map<String, dynamic>> transformedLogs = [];

    for (var log in hfReferralMapEntities) {
      var stock = log["hfReferral"] as Map<String, dynamic>;
      var transformedLog = {
        ...stock,
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
  FutureOr<List<HcmHFReferralModel>> search(
    HcmHFReferralSearchModel query, {
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
                query.hFReferral?.toMap(),
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
        .map((e) => HcmHFReferralModel(
              additionalFields: HFReferralAdditionalFieldsMapper.fromMap(
                  e['additionalFields']),
              hFReferral: HFReferralModelMapper.fromMap(e),
              auditDetails: AuditDetailsMapper.fromMap(e['auditDetails']),
              clientAuditDetails:
                  ClientAuditDetailsMapper.fromMap(e['clientAuditDetails']),
            ))
        .toList();

    return entities;
  }

  @override
  DataModelType get type => DataModelType.hFReferral;
}

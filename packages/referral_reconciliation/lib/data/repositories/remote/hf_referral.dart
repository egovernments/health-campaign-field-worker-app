// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:referral_reconciliation/models/entities/h_f_referral.dart';

import '../../../utils/utils.dart';

class HFReferralRemoteRepository
    extends RemoteRepository<HFReferralModel, HFReferralSearchModel> {
  HFReferralRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'HFReferral',
    super.isSearchResponsePlural = true,
  });

  @override
  FutureOr<List<HFReferralModel>> search(
    HFReferralSearchModel query, {
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
            'tenantId': ReferralReconSingleton().tenantId,
            if (query.isDeleted ?? false) 'includeDeleted': query.isDeleted,
          },
          data: {
            EntityPlurals.getPluralForEntityName(entityName): query.toMap(),
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

    List<HFReferralModel> hfReferralList;

    try {
      hfReferralList = entityResponse
          .map((e) => HFReferralModelMapper.fromMap(
                e,
              ))
          .toList();
    } catch (e) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    return hfReferralList;
  }

  @override
  DataModelType get type => DataModelType.hFReferral;
}

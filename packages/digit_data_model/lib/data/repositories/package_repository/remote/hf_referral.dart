// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:dio/dio.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/hf_referral.dart';

class HFReferralRemoteRepository
    extends RemoteRepository<HFReferralModel, HFReferralSearchModel> {
  HFReferralRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'HFReferral',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.hFReferral;

  @override
  FutureOr<List<HFReferralModel>> search(
    HFReferralSearchModel query, {
    int? offSet,
    int? limit,
    int? lastSyncedTime,
  }) async {
    Response response;

    try {
      response = await executeFuture(
        future: () async {
          return await dio.post(
            searchPath,
            queryParameters: {
              'offset': offSet ?? 0,
              'limit': limit ?? 100,
              if (lastSyncedTime != null) 'lastChangedSince': lastSyncedTime,
              'tenantId': DigitDataModelSingleton().tenantId,
              if (query.isDeleted ?? false) 'includeDeleted': query.isDeleted,
            },
            data: {
              entityName: query.toMap(),
            },
          );
        },
      );
    } catch (error) {
      rethrow;
    }

    final responseMap = response.data;

    if (responseMap is! Map<String, dynamic>) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    String key = isSearchResponsePlural ? entityNamePlural : entityName;

    if (!responseMap.containsKey(key)) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityResponse = await responseMap[key];

    if (entityResponse is! List) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityList =
        entityResponse.whereType<Map<String, dynamic>>().toList();

    return entityList
        .map((e) => MapperContainer.globals.fromMap<HFReferralModel>(e))
        .cast<HFReferralModel>()
        .toList();
  }

  /// Fetches the total count of HFReferral records matching the query.
  /// Makes a single call with limit=0 to get only the TotalCount.
  Future<int> fetchTotalCount(
    HFReferralSearchModel query, {
    int? offSet,
    int? lastSyncedTime,
  }) async {
    Response response;

    try {
      response = await executeFuture(
        future: () async {
          return await dio.post(
            searchPath,
            queryParameters: {
              'offset': offSet ?? 0,
              'limit': 0,
              if (lastSyncedTime != null) 'lastChangedSince': lastSyncedTime,
              'tenantId': DigitDataModelSingleton().tenantId,
              if (query.isDeleted ?? false) 'includeDeleted': query.isDeleted,
            },
            data: {
              entityName: query.toMap(),
            },
          );
        },
      );
    } catch (error) {
      rethrow;
    }

    final responseMap = response.data;

    if (responseMap is! Map<String, dynamic> ||
        !responseMap.containsKey('TotalCount')) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    return responseMap['TotalCount'] as int;
  }
}

// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';

class StockRemoteRepository
    extends RemoteRepository<StockModel, StockSearchModel> {
  StockRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Stock',
  });

  @override
  DataModelType get type => DataModelType.stock;

  @override
  FutureOr<List<StockModel>> search(
    StockSearchModel query, {
    int? offSet,
    int? limit,
    int? lastSyncedTime,
    bool? includeOnlyUpdatedByOthers,
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
              if (includeOnlyUpdatedByOthers != null) 'includeOnlyUpdatedByOthers': includeOnlyUpdatedByOthers,
              if (lastSyncedTime != null) 'lastChangedSince': lastSyncedTime,
              'tenantId': DigitDataModelSingleton().tenantId,
              if (query.isDeleted ?? false) 'includeDeleted': query.isDeleted,
            },
            data: {
              isPlural ? entityNamePlural : entityName:
                  isPlural ? [query.toMap()] : query.toMap(),
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

    String key = (isSearchResponsePlural) ? entityNamePlural : entityName;

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
        .map((e) => MapperContainer.globals.fromMap<StockModel>(e))
        .toList();
  }

  /// Fetches the total count of stock records matching the query from the API.
  /// Makes a single call with limit=0 to get only the TotalCount without
  /// fetching actual records.
  Future<int> fetchTotalCount(
    StockSearchModel query, {
    int? offSet,
    int? lastSyncedTime,
    bool? includeOnlyUpdatedByOthers,
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
              if (includeOnlyUpdatedByOthers != null) 'includeOnlyUpdatedByOthers': includeOnlyUpdatedByOthers,
              if (lastSyncedTime != null) 'lastChangedSince': lastSyncedTime,
              'tenantId': DigitDataModelSingleton().tenantId,
              if (query.isDeleted ?? false) 'includeDeleted': query.isDeleted,
            },
            data: {
              isPlural ? entityNamePlural : entityName:
                  isPlural ? [query.toMap()] : query.toMap(),
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

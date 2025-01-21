// Generated using mason. Do not modify by hand

import 'dart:async';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import '../../../models/downsync/downsync.dart';

class DownsyncRemoteRepository
    extends RemoteRepository<DownsyncModel, DownsyncSearchModel> {
  DownsyncRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Downsync',
  });

  @override
  String get searchPath => actionMap[ApiOperation.search]?[0] ?? '';

  String get searchClfPath => actionMap[ApiOperation.search]?[1] ?? '';

  String get searchClfMemberData => actionMap[ApiOperation.search]?[2] ?? '';

  @override
  DataModelType get type => DataModelType.downsync;

  FutureOr<Map<String, dynamic>> searchClfDownSync(DownsyncSearchModel query,
      {int? offSet, int? limit}) async {
    int defaultBatchSize = limit ?? 100;
    int currentOffset = offSet ?? 0;

    Map<String, dynamic> finalResult = {
      "Households": [],
      "DownsyncCriteria": {}
    };

    Response response;
    response = await executeFuture(future: () async {
      return await dio.post(
        searchClfPath,
        queryParameters: {
          'offset': currentOffset,
          'limit': defaultBatchSize,
          'tenantId': DigitDataModelSingleton().tenantId,
          if (query.isDeleted ?? false) 'includeDeleted': query.isDeleted
        },
        data: {
          isPlural ? entityNamePlural : 'DownsyncCriteria':
              isPlural ? [query.toMap()] : query.toMap(),
        },
      );
    });

    //Execute the request
    try {} catch (error) {}

    final responseMap = response.data;

    if (responseMap is! Map<String, dynamic>) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchClfPath,
        response: responseMap,
      );
    }

    //Check whether the response contains valid key
    if (!responseMap.containsKey('Households')) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityResponse = responseMap['Households'];
    final DownsyncModel downSyncCriteria = entityResponse['DownsyncCriteria'];

    final household_map = entityResponse['HouseholdCountMap'] as List;

    try {
      household_map
          .forEach((e) => finalResult["Household"].add(e['household']));
    } catch (e) {
      rethrow;
    }

    finalResult["DownsyncCriteria"] = entityResponse['DownsyncCriteria'];

    return finalResult;
  }

  FutureOr<Map<String, dynamic>> getMemberData(DownsyncSearchModel query,
      {int? offSet, int? limit}) async {
    Response response;

    try {
      response = await executeFuture(
        future: () async {
          return await dio.post(
            searchClfMemberData,
            queryParameters: {
              'offset': offSet ?? 0,
              'limit': limit ?? 100,
              'tenantId': DigitDataModelSingleton().tenantId,
              if (query.isDeleted ?? false) 'includeDeleted': query.isDeleted,
            },
            data: {
              entityName == 'Downsync' ? 'DownsyncCriteria' : entityName:
                  query.toMap(),
            },
          );
        },
      );
    } catch (error) {
      return {};
    }

    final responseMap = response.data;

    if (!responseMap.containsKey(
      entityName,
    )) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    return responseMap[entityName];
  }
}

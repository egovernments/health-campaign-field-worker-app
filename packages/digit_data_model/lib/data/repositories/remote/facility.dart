// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';


class FacilityRemoteRepository extends RemoteRepository<FacilityModel, FacilitySearchModel> {
  FacilityRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Facility',
    super.isSearchResponsePlural = true,
  });

  @override
  FutureOr<List<FacilityModel>> search(
      FacilitySearchModel query, {
        int? offSet,
        int? limit,
      }) async {
    int defaultBatchSize = limit ?? 100; // Default batch size for fetching data
    int currentOffset = offSet ?? 0;

    List<FacilityModel> allResults = [];
    bool hasMoreData = true;
    List<Map<String, dynamic>>? lastResponse;

    while (hasMoreData) {
      Response response;

      try {
        response = await executeFuture(
          future: () async {
            return await dio.post(
              searchPath,
              queryParameters: {
                'offset': currentOffset,
                'limit': defaultBatchSize,
                'tenantId': DigitDataModelSingleton().tenantId,
                if (query.isDeleted ?? false) 'includeDeleted': query.isDeleted,
              },
              data: entityName == 'User'
                  ? query.toMap()
                  : {
                isPlural
                    ? entityNamePlural
                    : entityName == 'ServiceDefinition'
                    ? 'ServiceDefinitionCriteria'
                    : entityName == 'Downsync'
                    ? 'DownsyncCriteria'
                    : entityName:
                isPlural ? [query.toMap()] : query.toMap(),
              },
            );
          },
        );
      } catch (error) {
        break; // Break out of the loop if an error occurs
      }

      final responseMap = response.data;

      if (responseMap is! Map<String, dynamic>) {
        throw InvalidApiResponseException(
          data: query.toMap(),
          path: searchPath,
          response: responseMap,
        );
      }

      String key = (isSearchResponsePlural || entityName == 'ServiceDefinition')
          ? entityNamePlural
          : entityName;

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

      final entityList = entityResponse.whereType<Map<String, dynamic>>().toList();

      if (lastResponse != null && lastResponse.toString() == entityList.toString()) {
        // If the last response is equal to the current response, stop fetching more data
        break;
      }

      List<FacilityModel> currentBatch;

      try {
        currentBatch = entityList.map((e) => MapperContainer.globals.fromMap<FacilityModel>(e)).toList();
      } catch (e) {
        rethrow;
      }

      if (currentBatch.isEmpty) {
        hasMoreData = false; // if no more data stop fetching
      } else {
        allResults.addAll(currentBatch);
        currentOffset += defaultBatchSize;
        lastResponse = entityList; // Update lastResponse to the current response
      }
    }

    return allResults;
  }

  @override
  DataModelType get type => DataModelType.facility;
}

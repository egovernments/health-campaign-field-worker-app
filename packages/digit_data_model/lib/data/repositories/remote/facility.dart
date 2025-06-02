// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';

class FacilityRemoteRepository
    extends RemoteRepository<FacilityModel, FacilitySearchModel> {
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

    //To fetch the totalCount from the first Response
    bool flag = true;

    //Total number of records
    var totalCount = 0;

    do {
      Response response;

      //Execute the request
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
              data: {
                isPlural ? entityNamePlural : entityName:
                    isPlural ? [query.toMap()] : query.toMap(),
              },
            );
          },
        );
      } catch (error) {
        rethrow;
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

      String key = (isSearchResponsePlural) ? entityNamePlural : entityName;

      //Check whether the response contains valid key and totalCount
      if (!responseMap.containsKey(key) ||
          !responseMap.containsKey('TotalCount')) {
        throw InvalidApiResponseException(
          data: query.toMap(),
          path: searchPath,
          response: responseMap,
        );
      }

      //Fetch the totalCount of records only from the first response
      if (flag && responseMap.containsKey('TotalCount')) {
        totalCount = responseMap['TotalCount'];
        flag = false;
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

      List<FacilityModel> currentBatch;

      try {
        currentBatch = entityList
            .map((e) => MapperContainer.globals.fromMap<FacilityModel>(e))
            .toList();
      } catch (e) {
        rethrow;
      }

      allResults.addAll(currentBatch);
      currentOffset += defaultBatchSize;
      totalCount -= defaultBatchSize;

      //If remaining record is less than defaultBatchSize, adjust the Batch size
      if (totalCount < defaultBatchSize) defaultBatchSize = totalCount;
    } while (totalCount > 0);

    return allResults;
  }

  @override
  DataModelType get type => DataModelType.facility;
}

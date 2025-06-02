// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';

class ProductVariantRemoteRepository extends RemoteRepository<ProductVariantModel, ProductVariantSearchModel> {
  ProductVariantRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ProductVariant',
  });

  @override
  FutureOr<List<ProductVariantModel>> search(
      ProductVariantSearchModel query, {
        int? offSet,
        int? limit,
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
      rethrow;
    }

    final responseMap = (response.data);

    if (responseMap is! Map<String, dynamic>) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    if (!responseMap.containsKey(
      (isSearchResponsePlural || entityName == 'ServiceDefinition')
          ? entityNamePlural
          : entityName,
    )) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityResponse = await responseMap[
    (isSearchResponsePlural || entityName == 'ServiceDefinition')
        ? entityNamePlural
        : entityName];

    if (entityResponse is! List) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityList = entityResponse.whereType<Map<String, dynamic>>();
    var mapperRes = <ProductVariantModel>[];
    try {
      mapperRes =
          entityList.map((e) => MapperContainer.globals.fromMap<ProductVariantModel>(e)).toList();
    } catch (e) {
      rethrow;
    }

    return mapperRes;
  }

  @override
  DataModelType get type => DataModelType.productVariant;
}

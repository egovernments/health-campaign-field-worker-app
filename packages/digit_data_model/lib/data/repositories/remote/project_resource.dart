// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';

class ProjectResourceRemoteRepository extends RemoteRepository<ProjectResourceModel, ProjectResourceSearchModel> {
  ProjectResourceRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'ProjectResource',
    super.isSearchResponsePlural = true,
  });

  @override
  FutureOr<List<ProjectResourceModel>> search(
      ProjectResourceSearchModel query, {
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
    var mapperRes = <ProjectResourceModel>[];
    try {
      mapperRes =
          entityList.map((e) => MapperContainer.globals.fromMap<ProjectResourceModel>(e)).toList();
    } catch (e) {
      rethrow;
    }

    return mapperRes;
  }

  @override
  DataModelType get type => DataModelType.projectResource;
}

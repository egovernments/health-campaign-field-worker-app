// Generated using mason. Do not modify by hand

import 'dart:async';
import 'dart:convert';

import 'package:digit_components/digit_components.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../models/data_model.dart';
import '../../../utils/environment_config.dart';
import '../../data_repository.dart';

class BoundaryRemoteRepository
    extends RemoteRepository<BoundaryModel, BoundarySearchModel> {
  BoundaryRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'TenantBoundary',
  });

  @override
  FutureOr<List<BoundaryModel>> search(BoundarySearchModel query) async {
    Response response;
    try {
      response = await executeFuture(
        future: () async {
          return await dio.post(
            searchPath,
            queryParameters: {
              'offset': 0,
              'limit': 100,
              'tenantId': envConfig.variables.tenantId,
              ...query.toMap(),
            },
            data: {},
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

      List<BoundaryModel> boundaryModelList = [];

      processJsonArray(
        List<Map<String, dynamic>> jsonArray,
        int level,
        String code,
        String unchanged,
      ) {
        for (final element in jsonArray) {
          final r = Mapper.fromMap<BoundaryModel>(Map.castFrom(element));

          code = '$code.${r.code}';

          if (List.castFrom(element['children']).isNotEmpty) {
            element['materializedPath'] = code;

            boundaryModelList.add(
              Mapper.fromMap<BoundaryModel>(
                Map.castFrom(element),
              ),
            );

            final childR = Mapper.fromMap<BoundaryModel>(Map.castFrom(element));

            code = unchanged;

            processJsonArray(
              List.castFrom(element['children']),
              level + 1,
              '$code.${childR.code}',
              unchanged,
            );
          } else if (List.castFrom(element['children']).isEmpty) {
            element['materializedPath'] = code;

            boundaryModelList.add(
              Mapper.fromMap<BoundaryModel>(
                Map.castFrom(element),
              ),
            );
          }
        }
      }

      final entityList = entityResponse.whereType<Map<String, dynamic>>();

      List<BoundaryModel> boundaryList =
          List.castFrom(entityList.first['boundary']).map((e) {
        int level = 0;
        processJsonArray(
          List.castFrom(e['children']),
          level,
          Mapper.fromMap<BoundaryModel>(Map.castFrom(e)).code.toString(),
          Mapper.fromMap<BoundaryModel>(Map.castFrom(e)).code.toString(),
        );

        e['materializedPath'] =
            Mapper.fromMap<BoundaryModel>(Map.castFrom(e)).code.toString();
        boundaryModelList.add(Mapper.fromMap<BoundaryModel>(Map.castFrom(e)));

        return Mapper.fromMap<BoundaryModel>(Map.castFrom(e));
      }).toList();

      print(boundaryModelList);

      return boundaryModelList;
    } on DioError catch (e) {
      rethrow;
    }
  }

  FutureOr<T> executeFuture<T>({
    required Future<T> Function() future,
  }) async {
    try {
      return await future();
    } on DioError catch (error) {
      const encoder = JsonEncoder.withIndent('  ');

      String? errorResponse;
      String? requestBody;

      debugPrint('${'-' * 40} ${runtimeType.toString()} ${'-' * 40}');

      try {
        errorResponse = encoder.convert(
          error.response?.data,
        );
      } catch (_) {
        errorResponse = 'Could not parse error';
      }

      try {
        requestBody =
            encoder.convert(error.requestOptions.data['TenantBoundary'][0]);
      } catch (_) {
        requestBody = 'Could not parse request body';
      }

      AppLogger.instance.debug(
        requestBody,
        title: runtimeType.toString(),
      );

      AppLogger.instance.error(
        message: '${error.error}\n$errorResponse',
        title: '${runtimeType.toString()} | DIO_ERROR',
      );

      debugPrint(
        '${'-' * 40}${'-' * (runtimeType.toString().length + 2)}${'-' * 40}',
      );

      rethrow;
    } catch (error) {
      AppLogger.instance.error(
        message: error.toString(),
        title: runtimeType.toString(),
      );

      rethrow;
    }
  }

  @override
  DataModelType get type => DataModelType.boundary;
}

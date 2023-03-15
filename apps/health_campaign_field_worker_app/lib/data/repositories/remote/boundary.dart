// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import 'dart:async';
import 'dart:convert';

import 'package:digit_components/digit_components.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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

    print("data can bee over written");

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

      final entityList = entityResponse.whereType<Map<String, dynamic>>();

      List<BoundaryModel> boundaryList =
          List.castFrom(entityList.first['boundary'])
              .map((e) => Mapper.fromMap<BoundaryModel>(Map.castFrom(e)))
              .toList();

      return boundaryList;
    } on DioError catch (e) {
      rethrow;
    }
  }

  @override
  DataModelType get type => DataModelType.boundary;
}

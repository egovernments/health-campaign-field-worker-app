// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:registration_delivery/models/entities/id_status.dart';
import 'package:registration_delivery/models/entities/unique_id_pool.dart';

class UniqueIdPoolRemoteRepository
    extends RemoteRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel> {
  UniqueIdPoolRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName =
        'IdDispatchRequest', // Using IdDispatchRequest instead of entity name to match the operation use case in the backend
    super.isSearchResponsePlural = false,
  });

  Future<UniqueIdSearchResponse> searchWithMetadata(
    UniqueIdPoolSearchModel query, {
    int? offSet,
    int? limit,
  }) async {
    int defaultBatchSize = limit ?? 100;
    int currentOffset = offSet ?? 0;

    Response response = await executeFuture(
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

    final responseMap = response.data;

    if (responseMap is! Map<String, dynamic>) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final rawEntities = responseMap['UniqueBeneficiaryIds'];
    final fetchLimit = responseMap['FetchLimit'] ?? 0;

    if (rawEntities is! List) {
      if (responseMap['Errors'] is List) {
        final errors = responseMap['Errors'] as List;
        if (errors.isNotEmpty && errors.first['message'] != null) {
          final errorMessage = errors.first['message'] as String;
          if (errorMessage.contains('ID generation limit exceeded')) {
            throw UniqueIdLimitExceededException(errorMessage);
          }
        }
      }

      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityList = rawEntities.whereType<Map<String, dynamic>>().toList();

    List<UniqueIdPoolModel> currentBatch = entityList.map((e) {
      return MapperContainer.globals.fromMap<UniqueIdPoolModel>(e);
    }).toList();

    final updatedBatch = currentBatch.map((model) {
      return model.copyWith(
        userUuid: query.userUuid,
        status: model.status != IdStatus.assigned.toValue()
            ? IdStatus.unAssigned.toValue()
            : model.status,
        deviceUuid: query.deviceUuid,
        additionalFields: null,
      );
    }).toList();

    return UniqueIdSearchResponse(
      models: updatedBatch,
      fetchLimit: fetchLimit,
    );
  }

  @override
  DataModelType get type => DataModelType.uniqueId;
}

class UniqueIdLimitExceededException implements Exception {
  final String message;

  UniqueIdLimitExceededException(this.message);

  @override
  String toString() => message;
}

import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:digit_data_model/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:transit_post/utils/utils.dart';

class FaceAuthEventRemoteRepository
    extends RemoteRepository<FaceAuthEventModel, FaceAuthEventSearchModel> {
  FaceAuthEventRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'FaceAuthEvent',
    super.isSearchResponsePlural = true,
  });

  @override
  FutureOr<List<FaceAuthEventModel>> search(
    FaceAuthEventSearchModel query, {
    int? offSet,
    int? limit,
    int? lastSyncedTime,
    bool? includeOnlyUpdatedByOthers,
  }) async {
    Response response;

    final requestBody = {
      'faceAuthEventSearchCriteria': {
        'tenantId': TransitPostSingleton().tenantId,
        if (query.clientReferenceId != null &&
            query.clientReferenceId!.isNotEmpty)
          'clientReferenceId': query.clientReferenceId,
        if (query.individualId != null) 'individualId': query.individualId,
        if (query.eventType != null) 'eventType': query.eventType,
        if (query.outcome != null) 'outcome': query.outcome,
        if (query.projectId != null) 'projectId': query.projectId,
      },
    };
    debugPrint(
      'FaceAuthEventRemote.search: POST $searchPath '
      'tenantId=${TransitPostSingleton().tenantId} '
      'body=$requestBody',
    );

    try {
      response = await executeFuture(
        future: () async {
          return await dio.post(
            searchPath,
            queryParameters: {
              'tenantId': TransitPostSingleton().tenantId,
              'limit': limit ?? 100,
              'offset': offSet ?? 0,
            },
            data: requestBody,
          );
        },
      );
    } on DioException catch (e) {
      debugPrint(
        'FaceAuthEventRemote.search: DioException type=${e.type} '
        'status=${e.response?.statusCode} '
        'path=$searchPath '
        'responseBody=${e.response?.data}',
      );
      rethrow;
    } catch (e, st) {
      debugPrint(
        'FaceAuthEventRemote.search: unexpected error $e\n$st',
      );
      rethrow;
    }

    final responseMap = (response.data);
    debugPrint(
      'FaceAuthEventRemote.search: HTTP ${response.statusCode} '
      'runtimeType=${responseMap.runtimeType} '
      'response=$responseMap',
    );

    if (responseMap is! Map<String, dynamic>) {
      debugPrint(
        'FaceAuthEventRemote.search: FAIL — response is not a Map. '
        'Got ${responseMap.runtimeType}',
      );
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final pluralKey = EntityPlurals.getPluralForEntityName(entityName);
    if (!responseMap.containsKey(pluralKey)) {
      debugPrint(
        'FaceAuthEventRemote.search: FAIL — response missing key "$pluralKey". '
        'Available keys=${responseMap.keys.toList()}',
      );
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityResponse = await responseMap[pluralKey];

    if (entityResponse is! List) {
      debugPrint(
        'FaceAuthEventRemote.search: FAIL — "$pluralKey" is not a List. '
        'Got ${entityResponse.runtimeType}: $entityResponse',
      );
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityList = entityResponse.whereType<Map<String, dynamic>>();

    return entityList
        .map((e) => FaceAuthEventModelMapper.fromMap(e))
        .toList();
  }

  @override
  FutureOr<Response> bulkCreate(List<EntityModel> entities) async {
    final mapEntities = entities
        .whereType<FaceAuthEventModel>()
        .map(_toRequestMap)
        .toList();

    debugPrint(
      'FaceAuthEventRemote.bulkCreate: POST $bulkCreatePath '
      'entityCount=${mapEntities.length} '
      'clientRefs=${mapEntities.map((e) => e['clientReferenceId']).toList()}',
    );

    try {
      final response = await executeFuture(
        future: () async {
          return await dio.post(
            bulkCreatePath,
            queryParameters: {
              'tenantId': TransitPostSingleton().tenantId,
            },
            options: Options(headers: {
              'content-type': 'application/json',
            }),
            data: {
              EntityPlurals.getPluralForEntityName(entityName): mapEntities,
            },
          );
        },
      );
      debugPrint(
        'FaceAuthEventRemote.bulkCreate: HTTP ${response.statusCode} '
        'response=${response.data}',
      );
      return response;
    } on DioException catch (e) {
      debugPrint(
        'FaceAuthEventRemote.bulkCreate: DioException type=${e.type} '
        'status=${e.response?.statusCode} '
        'responseBody=${e.response?.data}',
      );
      rethrow;
    }
  }

  /// Builds the request map manually to avoid dart_mappable NBSP in keys.
  /// App-internal fields that have no server column go into additionalFields.
  Map<String, dynamic> _toRequestMap(FaceAuthEventModel e) {
    final additionalFieldsList = <Map<String, String>>[
      {'key': 'isSync', 'value': e.isSync.toString()},
      {'key': 'deviceId', 'value': e.deviceId},
      {'key': 'boundaryCode', 'value': e.boundaryCode},
      if (e.syncTimestamp != null)
        {'key': 'syncTimestamp', 'value': e.syncTimestamp.toString()},
    ];

    return {
      'clientReferenceId': e.clientReferenceId,
      'individualId': e.individualId,
      'eventType': e.eventType,
      'outcome': e.outcome,
      'confidence': e.confidence,
      'latitude': e.latitude,
      'longitude': e.longitude,
      'locationAccuracy': e.locationAccuracy,
      'failedAttemptCount': e.failedAttemptCount,
      'timestamp': e.timestamp,
      'projectId': e.projectId,
      if (e.tenantId != null) 'tenantId': e.tenantId,
      if (e.id != null) 'id': e.id,
      if (e.rowVersion != null) 'rowVersion': e.rowVersion,
      if (e.fallbackReason != null) 'fallbackReason': e.fallbackReason,
      if (e.popupTime != null) 'popupTime': e.popupTime,
      if (e.responseTime != null) 'responseTime': e.responseTime,
      if (e.responseType != null) 'responseType': e.responseType,
      if (e.anomalyFlags != null) 'anomalyFlags': e.anomalyFlags,
      // base64-encoded JPEG of the cropped face captured at verification time.
      // Field is optional; we only send when present so we don't override the
      // server-side default with an empty string.
      if (e.faceImage != null && e.faceImage!.isNotEmpty)
        'faceImage': e.faceImage,
      if (e.isDeleted != null) 'isDeleted': e.isDeleted,
      if (e.auditDetails != null)
        'auditDetails': {
          'createdBy': e.auditDetails!.createdBy,
          'createdTime': e.auditDetails!.createdTime,
          'lastModifiedBy': e.auditDetails!.lastModifiedBy,
          'lastModifiedTime': e.auditDetails!.lastModifiedTime,
        },
      if (e.clientAuditDetails != null)
        'clientAuditDetails': {
          'createdBy': e.clientAuditDetails!.createdBy,
          'createdTime': e.clientAuditDetails!.createdTime,
          'lastModifiedBy': e.clientAuditDetails!.lastModifiedBy,
          'lastModifiedTime': e.clientAuditDetails!.lastModifiedTime,
        },
      'additionalFields': {
        'schema': 'FaceAuthEvent',
        'version': 1,
        'fields': additionalFieldsList,
      },
    };
  }

  @override
  DataModelType get type => DataModelType.faceAuthEvent;
}

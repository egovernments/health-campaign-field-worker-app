import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:digit_data_model/utils/constants.dart';
import 'package:dio/dio.dart';
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
    int? lastChangedSince,
  }) async {
    Response response;

    response = await executeFuture(
      future: () async {
        return await dio.post(
          searchPath,
          queryParameters: {
            'tenantId': TransitPostSingleton().tenantId,
            'limit': limit ?? 100,
            'offset': offSet ?? 0,
          },
          data: {
            'faceAuthEventSearchCriteria': {
              'tenantId': TransitPostSingleton().tenantId,
              if (query.clientReferenceId != null &&
                  query.clientReferenceId!.isNotEmpty)
                'clientReferenceId': query.clientReferenceId,
              if (query.individualId != null)
                'individualId': query.individualId,
              if (query.eventType != null) 'eventType': query.eventType,
              if (query.outcome != null) 'outcome': query.outcome,
              if (query.projectId != null) 'projectId': query.projectId,
            },
          },
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
      EntityPlurals.getPluralForEntityName(entityName),
    )) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityResponse =
        await responseMap[EntityPlurals.getPluralForEntityName(entityName)];

    if (entityResponse is! List) {
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

    return executeFuture(
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
  }

  /// Builds the request map manually to avoid dart_mappable NBSP in keys.
  /// App-internal fields are stored in additionalFields so the server persists them.
  Map<String, dynamic> _toRequestMap(FaceAuthEventModel e) {
    final additionalFieldsList = <Map<String, String>>[
      {'key': 'isSync', 'value': e.isSync.toString()},
      {'key': 'deviceId', 'value': e.deviceId},
      {'key': 'boundaryCode', 'value': e.boundaryCode},
      {'key': 'confidence', 'value': e.confidence.toString()},
      {'key': 'latitude', 'value': e.latitude.toString()},
      {'key': 'longitude', 'value': e.longitude.toString()},
      {'key': 'locationAccuracy', 'value': e.locationAccuracy.toString()},
      {'key': 'failedAttemptCount', 'value': e.failedAttemptCount.toString()},
      if (e.syncTimestamp != null)
        {'key': 'syncTimestamp', 'value': e.syncTimestamp.toString()},
    ];

    return {
      'clientReferenceId': e.clientReferenceId,
      'individualId': e.individualId,
      'eventType': e.eventType,
      'outcome': e.outcome,
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

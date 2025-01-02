// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:attendance_management/attendance_management.dart';
import 'package:digit_data_model/utils/constants.dart';
import 'package:dio/dio.dart';


class AttendanceLogRemoteRepository
    extends RemoteRepository<AttendanceLogModel, AttendanceLogSearchModel> {
  AttendanceLogRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Attendance',
    super.isSearchResponsePlural = true,
  });

  @override
  FutureOr<List<AttendanceLogModel>> search(
    AttendanceLogSearchModel query, {
    int? offSet,
    int? limit,
  }) async {
    Response response;

    response = await executeFuture(
      future: () async {
        return await dio.post(
          searchPath,
          queryParameters: query.clientReferenceId != null &&
                  (query.clientReferenceId ?? []).isNotEmpty
              ? {
                  'tenantId': AttendanceSingleton().tenantId,
                }
              : {
                  'tenantId': AttendanceSingleton().tenantId,
                  ...query.toMap(),
                },
          data: query.clientReferenceId != null &&
                  (query.clientReferenceId ?? []).isNotEmpty
              ? {
                  EntityPlurals.getPluralForEntityName(entityName):
                      query.toMap(),
                }
              : {},
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

    return entityList.map((e) => AttendanceLogModelMapper.fromMap(e)).toList();
  }

  @override
  FutureOr<Response> bulkCreate(List<EntityModel> entities) async {
    final attendanceLogMapEntities = entities.map((e) => e.toMap()).toList();
    List<Map<String, dynamic>> transformedLogs = [];

    for (var log in attendanceLogMapEntities) {
      transformedLogs.add(log);
    }

    return executeFuture(
      future: () async {
        return await dio.post(
          bulkCreatePath,
          options: Options(headers: {
            "content-type": 'application/json',
          }),
          data: {
            EntityPlurals.getPluralForEntityName(entityName): transformedLogs,
          },
        );
      },
    );
  }

  @override
  DataModelType get type => DataModelType.attendance;
}

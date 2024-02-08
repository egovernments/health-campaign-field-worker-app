// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:dio/dio.dart';

import '../../../models/data_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/environment_config.dart';
import '../../data_repository.dart';

class AttendanceLogRemoteRepository extends RemoteRepository<
    HCMAttendanceLogModel, HCMAttendanceLogSearchModel> {
  AttendanceLogRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Attendance',
    super.isSearchResponsePlural = true,
  });

  @override
  FutureOr<List<HCMAttendanceLogModel>> search(
    HCMAttendanceLogSearchModel query, {
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
                  'tenantId': envConfig.variables.tenantId,
                }
              : {
                  'tenantId': envConfig.variables.tenantId,
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

    return entityList
        .map((e) => HCMAttendanceLogModel(
              attendance: AttendanceLogModelMapper.fromMap(e),
              auditDetails: AuditDetailsMapper.fromMap(e['auditDetails']),
              clientAuditDetails: ClientAuditDetailsMapper.fromMap(e['clientAuditDetails']),
    ))
        .toList();
  }

  @override
  FutureOr<Response> bulkCreate(List<EntityModel> entities) async {
    final attendanceLogMapEntities = entities.map((e) => e.toMap()).toList();
    List<Map<String, dynamic>> transformedLogs = [];

    for (var log in attendanceLogMapEntities) {
      var attendanceLog = log["attendance"] as Map<String, dynamic>;
      var transformedLog = {
        ...attendanceLog,
        "auditDetails": log["auditDetails"],
        "clientAuditDetails": log ["clientAuditDetails"],
      };
      transformedLogs.add(transformedLog);
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

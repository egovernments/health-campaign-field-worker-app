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
          : EntityPlurals.getPluralForEntityName(entityName),
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
            : EntityPlurals.getPluralForEntityName(entityName)];

    if (entityResponse is! List) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityList = entityResponse.whereType<Map<String, dynamic>>();

    return entityList
        .map((e) => Mapper.fromMap<HCMAttendanceLogModel>(e))
        .toList();
  }

  @override
  DataModelType get type => DataModelType.attendance;
}

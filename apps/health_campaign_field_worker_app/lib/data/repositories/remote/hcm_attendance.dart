// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:attendance_management/models/attendance_register.dart';
import 'package:dio/dio.dart';

import '../../../models/data_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/environment_config.dart';
import '../../data_repository.dart';

class AttendanceRemoteRepository extends RemoteRepository<
    HCMAttendanceRegisterModel, HCMAttendanceSearchModel> {
  AttendanceRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'AttendanceRegister',
    super.isSearchResponsePlural = true,
  });

  @override
  FutureOr<List<HCMAttendanceRegisterModel>> search(
    HCMAttendanceSearchModel query, {
    int? offSet,
    int? limit,
  }) async {
    Response response;

    response = await executeFuture(
      future: () async {
        return await dio.post(
          searchPath,
          queryParameters: {
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
        .map((e) => HCMAttendanceRegisterModel(
              attendanceRegister: AttendanceRegisterModelMapper.fromMap(e),
            ))
        .toList();
  }

  @override
  DataModelType get type => DataModelType.attendanceRegister;
}

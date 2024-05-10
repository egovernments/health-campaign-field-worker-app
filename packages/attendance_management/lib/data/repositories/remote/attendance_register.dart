// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/utils/constants.dart';
import 'package:dio/dio.dart';

import '../../../models/entities/attendance_register.dart';
import '../../../utils/utils.dart';

class AttendanceRemoteRepository extends RemoteRepository<
    AttendanceRegisterModel, AttendanceRegisterSearchModel> {
  AttendanceRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'AttendanceRegister',
    super.isSearchResponsePlural = true,
  });

  @override
  FutureOr<List<AttendanceRegisterModel>> search(
    AttendanceRegisterSearchModel query, {
    int? offSet,
    int? limit,
  }) async {
    Response response;

    response = await executeFuture(
      future: () async {
        return await dio.post(
          searchPath,
          queryParameters: {
            'tenantId': AttendanceSingleton().tenantId,
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

    List<AttendanceRegisterModel> attendanceRegisterModel;

    try {
      attendanceRegisterModel = entityResponse
          .map((e) => AttendanceRegisterModelMapper.fromMap(
                e,
              ))
          .toList();
    } catch (e) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    return attendanceRegisterModel;
  }

  @override
  DataModelType get type => DataModelType.attendanceRegister;
}

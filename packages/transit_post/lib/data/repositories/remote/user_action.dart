import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:dio/dio.dart';
import 'package:transit_post/utils/utils.dart';

// This will create , update and search data from remote Repository
class UserActionRemoteRepository
    extends RemoteRepository<UserActionModel, UserActionSearchModel> {
  UserActionRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'UserAction',
  });

  @override
  DataModelType get type => DataModelType.complaints;

  @override
  FutureOr<Response> create(UserActionModel entity) async {
    return executeFuture(
      future: () async {
        final response = await dio.post(
          createPath,
          options: Options(headers: {
            "content-type": 'application/json',
          }),
          data: entity,
        );

        return response;
      },
    );
  }

  @override
  FutureOr<Response> update(EntityModel entity) => throw UnimplementedError();

  @override
  FutureOr<Response> delete(EntityModel entity) => throw UnimplementedError();

  @override
  FutureOr<List<UserActionModel>> search(
    UserActionSearchModel query, {
    int? offSet,
    int? limit,
  }) =>
      throw UnimplementedError();

  @override
  FutureOr<Response> bulkCreate(List<EntityModel> entities) {
    return executeFuture(
      future: () async {
        return await dio.post(
          bulkCreatePath,
          options: Options(headers: {
            "content-type": 'application/json',
          }),
          queryParameters: {
            "tenantId": TransitPostSingleton().tenantId,
          },
          data: entities,
        );
      },
    );
  }

  @override
  FutureOr<Response> bulkDelete(List<EntityModel> entities) {
    throw UnimplementedError();
  }

  @override
  FutureOr<Response> bulkUpdate(List<EntityModel> entities) {
    throw UnimplementedError();
  }
}

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:health_campaign_field_worker_app/utils/environment_config.dart';

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class PgrServiceRemoteRepository
    extends RemoteRepository<PgrServiceModel, PgrServiceSearchModel> {
  PgrServiceRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'service',
  });

  @override
  DataModelType get type => DataModelType.complaints;

  @override
  FutureOr<Response> create(PgrServiceModel entity) async {
    return executeFuture(
      future: () async {
        final response = await dio.post(
          createPath,
          options: Options(headers: {
            "content-type": 'application/json',
          }),
          data: PgrComplaintModel(
            service: entity,
            workflow: const PgrWorkflowModel(
              action: "APPLY",
              comments: "",
              assignees: [],
            ),
          ).toMap(),
        );

        return response;
      },
    );
  }

  @override
  FutureOr<List<PgrServiceModel>> search(PgrServiceSearchModel query) async {
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
            }..addAll(query.toMap()),
            data: {},
          );
        },
      );
    } catch (error) {
      return [];
    }

    final responseMap = response.data;

    if (responseMap is! Map<String, dynamic>) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    if (!responseMap.containsKey(entityName)) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityResponse = await responseMap[entityName];
    if (entityResponse is! List) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityList = entityResponse.whereType<Map<String, dynamic>>();

    return entityList.map((e) => Mapper.fromMap<PgrServiceModel>(e)).toList();
  }

  @override
  FutureOr<Response> update(EntityModel entity) => throw UnimplementedError();

  @override
  FutureOr<Response> delete(EntityModel entity) => throw UnimplementedError();

  @override
  FutureOr<Response> bulkCreate(List<EntityModel> entities) {
    throw UnimplementedError();
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

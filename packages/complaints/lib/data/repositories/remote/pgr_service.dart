import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';

import '../../../models/pgr_complaints.dart';
import '../../../models/pgr_complaints_response.dart';

// This will create , update and search data from remote Repository
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
              action: "CREATE",
              comments: "",
              assignees: [],
            ),
          ).toMap(),
        );

        return response;
      },
    );
  }

  FutureOr<List<PgrServiceResponseModel>> searchWithoutClientReferenceId(
    PgrServiceSearchModel query, {
    int? offSet,
    int? limit,
  }) async {
    Response response;

    try {
      response = await executeFuture(
        future: () async {
          return await dio.post(
            searchPath,
            queryParameters: {
              'offset': offSet ?? 0,
              'limit': limit ?? 100,
              'tenantId': DigitDataModelSingleton().tenantId,
            }..addAll(query.toMap()),
            data: query.toMap(),
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

    PgrServiceCreateResponseModel pgrServiceCreateResponseModel;
    List<PgrComplaintResponseModel> pgrComplaintModel;
    try {
      pgrServiceCreateResponseModel =
          PgrServiceCreateResponseModelMapper.fromMap(
        responseMap,
      );
      pgrComplaintModel = pgrServiceCreateResponseModel.serviceWrappers;
    } catch (e) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    return pgrComplaintModel.map((e) {
      return e.service;
    }).toList();
  }

  @override
  FutureOr<Response> update(EntityModel entity) => throw UnimplementedError();

  @override
  FutureOr<Response> delete(EntityModel entity) => throw UnimplementedError();

  @override
  FutureOr<List<PgrServiceModel>> search(
    PgrServiceSearchModel query, {
    int? offSet,
    int? limit,
  }) =>
      throw UnimplementedError();

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

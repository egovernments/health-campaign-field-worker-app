// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';

import '../../../models/data_model.dart';
import '../../../utils/environment_config.dart';
import '../../data_repository.dart';

class BoundaryRemoteRepository
    extends RemoteRepository<BoundaryModel, BoundarySearchModel> {
  BoundaryRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'TenantBoundary',
  });

  @override
  FutureOr<List<BoundaryModel>> search(
    BoundarySearchModel query, {
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
          : entityName,
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
            : entityName];
    if (entityResponse is! List) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityList = entityResponse.whereType<Map<String, dynamic>>();

    final boundaryRoot = entityList.firstOrNull;

    if (boundaryRoot == null) return [];
    if (!boundaryRoot.containsKey('boundary')) return [];

    final boundaryList = entityList.first['boundary'];

    /// We can combine both into one function. But better to keep it separate
    /// to help with readability
    List<BoundaryModel> boundaryModelList = _castToBoundaryModel(
      List.castFrom(boundaryList),
    );
    boundaryModelList = _flattenBoundaryMap(boundaryModelList);

    return boundaryModelList;
  }

  /// Flattens the boundary map
  ///  - Adds the materialized path to each boundary
  ///  - Removes the children from the boundary
  List<BoundaryModel> _flattenBoundaryMap(
    List<BoundaryModel> boundaryList, {
    BoundaryModel? parent,
  }) {
    List<BoundaryModel> boundaryModelList = [];
    for (final e in boundaryList) {
      final materializedPath = parent?.materializedPath?.split('.') ?? [];
      final boundary = e.copyWith(
        materializedPath: [...materializedPath, e.code ?? ''].join('.'),
      );

      boundaryModelList.add(boundary.copyWith(children: []));
      boundaryModelList.addAll(_flattenBoundaryMap(
        boundary.children,
        parent: boundary,
      ));
    }

    return boundaryModelList;
  }

  /// Casts the list of [Map] to [BoundaryModel]
  List<BoundaryModel> _castToBoundaryModel(
    Iterable<Map<String, dynamic>> entityList,
  ) {
    final boundaryModelList = entityList.map((e) {
      return Mapper.fromMap<BoundaryModel>(e);
    }).toList();

    return boundaryModelList;
  }

  @override
  DataModelType get type => DataModelType.boundary;
}

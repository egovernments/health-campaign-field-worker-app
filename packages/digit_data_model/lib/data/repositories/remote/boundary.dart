// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:recase/recase.dart';

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
            'tenantId': DigitDataModelSingleton().tenantId,
            'includeChildren': true,
            'hierarchyType': DigitDataModelSingleton().hierarchyType,
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
    boundaryModelList = _flattenBoundaryMap(
      boundaryModelList,
      i: 1,
    );

    return boundaryModelList;
  }

  /// Flattens the boundary map
  ///  - Adds the materialized path to each boundary
  ///  - Removes the children from the boundary
  List<BoundaryModel> _flattenBoundaryMap(
    List<BoundaryModel> boundaryList, {
    BoundaryModel? parent,
    required int i,
  }) {
    List<BoundaryModel> boundaryModelList = [];
    for (final e in boundaryList) {
      final materializedPath = parent?.materializedPath?.split('.') ?? [];
      final boundary = e.copyWith(
        materializedPath: [...materializedPath, e.code ?? ''].join('.'),
        boundaryNum: [...materializedPath, e.code ?? ''].length,
        label: e.boundaryType,
        name: e.code?.split('_').lastOrNull?.titleCase ?? e.code?.titleCase,
      );

      boundaryModelList.add(boundary.copyWith(children: []));
      boundaryModelList.addAll(_flattenBoundaryMap(
        boundary.children,
        parent: boundary,
        i: i,
      ));
    }

    return boundaryModelList;
  }

  /// Casts the list of [Map] to [BoundaryModel]
  List<BoundaryModel> _castToBoundaryModel(
    Iterable<Map<String, dynamic>> entityList,
  ) {
    final boundaryModelList = entityList.map((e) {
      return BoundaryModelMapper.fromMap(e);
    }).toList();

    return boundaryModelList;
  }

  @override
  DataModelType get type => DataModelType.boundary;
}

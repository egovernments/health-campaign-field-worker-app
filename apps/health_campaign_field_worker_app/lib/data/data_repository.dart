import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'local_store/sql_store/sql_store.dart';
import '../models/data_model.dart';
import 'repositories/oplog/oplog.dart';

abstract class DataRepository<D extends DataModel, R extends DataModel> {

  const DataRepository();

  FutureOr<List<D>> search(R query);

  FutureOr<dynamic> create(D entity);

  FutureOr<dynamic> update(D entity);
}

abstract class RemoteRepository<D extends DataModel, R extends DataModel>
    extends DataRepository<D, R> {
  final Dio dio;
  final String path;
  final String entityName;

  final String? _createPath;
  final String? _updatePath;
  final String? _searchPath;

  RemoteRepository(
    this.dio, {
    String? createPath,
    String? updatePath,
    String? searchPath,
    required this.path,
    required this.entityName,
  })  : _createPath = createPath,
        _updatePath = updatePath,
        _searchPath = searchPath;

  String get createPath => _createPath ?? '$path/_create';

  String get updatePath => _updatePath ?? '$path/_update';

  String get searchPath => _searchPath ?? '$path/_search';

  @override
  FutureOr<List<D>> search(R query) async {
    final response = await dio.post(createPath, data: {
      entityName: query.toMap(),
    });

    final responseMap = json.decode(response.data);
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

    return entityList.map((e) => Mapper.fromMap<D>(e)).toList();
  }

  @override
  FutureOr<Response> create(D entity) async {
    return await dio.post(
      createPath,
      data: {
        entityName: [entity.toMap()],
        "apiOperation": "CREATE",
      },
    );
  }

  @override
  FutureOr<Response> update(D entity) async {
    return await dio.post(
      updatePath,
      data: {
        entityName: [entity.toMap()],
        "apiOperation": "UPDATE",
      },
    );
  }
}

abstract class LocalRepository<D extends DataModel, R extends DataModel>
    extends DataRepository<D, R> {
  final LocalSqlDataStore sql;
  final OpLogManager opLogManager;

  DataModelType get type;

  const LocalRepository(this.sql, this.opLogManager);

  @override
  @mustCallSuper
  FutureOr<void> create(D entity) async {
    await createOplogEntry(entity, ApiOperation.create, type);
  }

  @override
  @mustCallSuper
  FutureOr<void> update(D entity) async {
    await createOplogEntry(entity, ApiOperation.update, type);
  }

  FutureOr<void> createOplogEntry(
    D entity,
    ApiOperation operation,
    DataModelType type,
  ) =>
      opLogManager.createEntry(OpLogEntry(entity, operation), type);
}

class InvalidApiResponseException implements Exception {
  final String path;
  final Map<String, dynamic> data;
  final dynamic response;

  const InvalidApiResponseException({
    required this.path,
    required this.data,
    required this.response,
  });
}

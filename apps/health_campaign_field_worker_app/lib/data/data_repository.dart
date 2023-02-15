import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/data_model.dart';
import 'local_store/sql_store/sql_store.dart';
import 'repositories/oplog/oplog.dart';

abstract class DataRepository<D extends EntityModel,
    R extends EntitySearchModel> {
  const DataRepository();

  DataModelType get type;

  FutureOr<List<D>> search(R query);

  FutureOr<dynamic> create(D entity);

  FutureOr<dynamic> update(D entity);

  FutureOr<dynamic> delete(D entity);
}

abstract class RemoteRepository<D extends EntityModel,
    R extends EntitySearchModel> extends DataRepository<D, R> {
  final Dio dio;
  final String entityName;

  final Map<ApiOperation, String> actionMap;

  String get createPath => actionMap[ApiOperation.create] ?? '';

  String get updatePath => actionMap[ApiOperation.update] ?? '';

  String get searchPath => actionMap[ApiOperation.search] ?? '';

  String get bulkCreatePath => actionMap[ApiOperation.bulkCreate] ?? '';

  String get bulkUpdatePath => actionMap[ApiOperation.bulkUpdate] ?? '';

  String get bulkDeletePath => actionMap[ApiOperation.bulkDelete] ?? '';

  RemoteRepository(
    this.dio, {
    required this.actionMap,
    required this.entityName,
  });

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
  FutureOr<Response> delete(D entity) async {
    return await dio.post(
      createPath,
      data: {
        entityName: [entity.toMap()],
        "apiOperation": "DELETE",
      },
    );
  }

  FutureOr<Response> bulkCreate(List<D> entities) async {
    List<dynamic> jsonString = [];
    for (var e in entities) {
      jsonString.add(e.toJson());
    }

    final headers = {
      "content-type": 'application/json',
    };

    final data = entities.map((e) => Mapper.toJson(e)).toString();

    final res = await dio.post(
      bulkCreatePath,
      options: Options(headers: headers),
      data: jsonEncode({
        ('${entityName}s').toString():
            json.decode(entities.map((e) => e.toJson()).toList().toString()),
      }),
    );
    print(res);
    return res;
  }

  FutureOr<Response> bulkUpdate(List<D> entities) async {
    return await dio.post(bulkUpdatePath, data: {
      entityName: entities,
      "apiOperation": "UPDATE",
    });
  }

  FutureOr<Response> bulkDelete(List<D> entities) async {
    return await dio.post(bulkDeletePath, data: {
      entityName: entities,
      "apiOperation": "DELETE",
    });
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

abstract class LocalRepository<D extends EntityModel,
    R extends EntitySearchModel> extends DataRepository<D, R> {
  final LocalSqlDataStore sql;
  final OpLogManager<D> opLogManager;

  const LocalRepository(this.sql, this.opLogManager);

  @override
  @mustCallSuper
  FutureOr<void> create(D entity) async {
    await createOplogEntry(entity, DataOperation.create);
  }

  @override
  @mustCallSuper
  FutureOr<void> update(D entity) async {
    await createOplogEntry(entity, DataOperation.update);
  }

  @override
  @mustCallSuper
  FutureOr<void> delete(D entity) async {
    await createOplogEntry(entity, DataOperation.delete);
  }

  FutureOr<void> createOplogEntry(
    D entity,
    DataOperation operation,
  ) =>
      opLogManager.createEntry(
        OpLogEntry(
          entity,
          operation,
          dateCreated: DateTime.now(),
          type: type,
        ),
        type,
      );

  Future<List<OpLogEntry>> getItemsToBeSynced() async {
    return opLogManager.getPendingSyncedEntries(type);
  }

  FutureOr<void> markSynced(OpLogEntry<D> entry) async {
    return opLogManager.markSynced(entry);
  }
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

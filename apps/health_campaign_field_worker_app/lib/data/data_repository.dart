import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/data_model.dart';
import '../utils/constants.dart';
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
  final bool isPlural;

  final Map<ApiOperation, String> actionMap;

  String get createPath => actionMap[ApiOperation.create] ?? '';

  String get updatePath => actionMap[ApiOperation.update] ?? '';

  String get searchPath => actionMap[ApiOperation.search] ?? '';

  String get bulkCreatePath {
    return actionMap[ApiOperation.bulkCreate] ?? '';
  }

  String get bulkUpdatePath => actionMap[ApiOperation.bulkUpdate] ?? '';

  String get bulkDeletePath => actionMap[ApiOperation.bulkDelete] ?? '';

  RemoteRepository(
    this.dio, {
    required this.actionMap,
    required this.entityName,
    this.isPlural = false,
  });

  @override
  FutureOr<List<D>> search(R query) async {
    final response = await dio.post(searchPath, data: {
      isPlural ? EntityPlurals.getPluralForEntityName(entityName) : entityName:
          isPlural ? [query.toMap()] : query.toMap(),
    });

    final responseMap = (response.data);
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
        EntityPlurals.getPluralForEntityName(entityName): [entity.toMap()],
        "apiOperation": "DELETE",
      },
    );
  }

  FutureOr<Response> bulkCreate(List<EntityModel> entities) async {
    final res = await dio.post(
      bulkCreatePath,
      options: Options(headers: {
        "content-type": 'application/json',
      }),
      data: {
        EntityPlurals.getPluralForEntityName(entityName): _getMap(entities),
      },
    );

    return res;
  }

  FutureOr<Response> bulkUpdate(List<EntityModel> entities) async {
    return await dio.post(
      bulkUpdatePath,
      options: Options(headers: {
        "content-type": 'application/json',
      }),
      data: {
        EntityPlurals.getPluralForEntityName(entityName): _getMap(entities),
        "apiOperation": "UPDATE",
      },
    );
  }

  FutureOr<Response> bulkDelete(List<EntityModel> entities) async {
    return await dio.post(
      bulkDeletePath,
      options: Options(headers: {
        "content-type": 'application/json',
      }),
      data: {
        EntityPlurals.getPluralForEntityName(entityName): _getMap(entities),
        "apiOperation": "DELETE",
      },
    );
  }

  @override
  FutureOr<Response> update(EntityModel entity) async {
    return await dio.post(
      updatePath,
      data: {
        entityName: [entity.toMap()],
        "apiOperation": "UPDATE",
      },
    );
  }

  List<Map<String, dynamic>> _getMap(List<EntityModel> entities) {
    return entities.map((e) => Mapper.toMap(e)).toList();
  }
}

abstract class LocalRepository<D extends EntityModel,
    R extends EntitySearchModel> extends DataRepository<D, R> {
  final LocalSqlDataStore sql;
  final OpLogManager<D> opLogManager;

  const LocalRepository(this.sql, this.opLogManager);

  @override
  @mustCallSuper
  FutureOr<void> create(D entity, {bool createOpLog = true}) async {
    if (createOpLog) await createOplogEntry(entity, DataOperation.create);
  }

  @override
  @mustCallSuper
  FutureOr<void> update(D entity, {bool createOpLog = true}) async {
    if (createOpLog) await createOplogEntry(entity, DataOperation.update);
  }

  @override
  @mustCallSuper
  FutureOr<void> delete(D entity, {bool createOpLog = true}) async {
    if (createOpLog) await createOplogEntry(entity, DataOperation.delete);
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

  Future<List<OpLogEntry<D>>> getItemsToBeSynced() async {
    return opLogManager.getPendingSyncedEntries(type);
  }

  FutureOr<void> markSynced(OpLogEntry<EntityModel> entry) async {
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

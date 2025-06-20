// Importing necessary packages and files.
import 'dart:async';
import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../utils/constants.dart';

/// `DataRepository` is an abstract class that defines the interface for a data repository.
/// It has two type parameters: `D` for the entity model and `R` for the entity search model.
abstract class DataRepository<D extends EntityModel,
    R extends EntitySearchModel> {
  const DataRepository();

  /// The `type` getter returns the type of the data model.
  DataModelType get type;

  /// The `search` method searches for entities that match the given query.
  FutureOr<List<D>> search(
    R query,
  );

  /// The `create` method creates a new entity.
  FutureOr<dynamic> create(D entity);

  /// The `update` method updates an existing entity.
  FutureOr<dynamic> update(D entity);

  /// The `delete` method deletes an existing entity.
  FutureOr<dynamic> delete(D entity);
}

/// `RemoteRepository` is an abstract class that extends `DataRepository` and provides additional functionality for remote repositories.
abstract class RemoteRepository<D extends EntityModel,
    R extends EntitySearchModel> extends DataRepository<D, R> {
  final Dio dio;
  final String entityName;
  final bool isPlural;
  final bool isSearchResponsePlural;

  final Map<ApiOperation, String> actionMap;

  String get entityNamePlural =>
      EntityPlurals.getPluralForEntityName(entityName);

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
    this.isSearchResponsePlural = false,
  });

  @override
  FutureOr<List<D>> search(
    R query, {
    int? offSet,
    int? limit,
    int? lastChangedSince,
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
              if (query.isDeleted ?? false) 'includeDeleted': query.isDeleted,
              if (lastChangedSince != null)
                'lastChangedSince': lastChangedSince,
            },
            data: entityName == 'User'
                ? query.toMap()
                : {
                    isPlural
                            ? entityNamePlural
                            : entityName == 'ServiceDefinition'
                                ? 'ServiceDefinitionCriteria'
                                : entityName == 'Downsync'
                                    ? 'DownsyncCriteria'
                                    : entityName:
                        isPlural ? [query.toMap()] : query.toMap(),
                  },
          );
        },
      );
    } catch (error) {
      return [];
    }

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
    var mapperRes = <D>[];
    try {
      mapperRes =
          entityList.map((e) => MapperContainer.globals.fromMap<D>(e)).toList();
    } catch (e) {
      rethrow;
    }

    return mapperRes;
  }

  FutureOr<Response> singleCreate(D entity) async {
    return await dio.post(
      createPath,
      data: {
        'Service': entity.toMap(),
        "apiOperation": "CREATE",
      },
    );
  }

  FutureOr<Map<String, dynamic>> downSync(
    R query, {
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
              if (query.isDeleted ?? false) 'includeDeleted': query.isDeleted,
            },
            data: {
              entityName == 'Downsync' ? 'DownsyncCriteria' : entityName:
                  query.toMap(),
            },
          );
        },
      );
    } catch (error) {
      return {};
    }

    final responseMap = response.data;

    if (!responseMap.containsKey(
      entityName,
    )) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    return responseMap[entityName];
  }

  @override
  FutureOr<Response> create(D entity) async {
    return executeFuture(
      future: () async {
        return await dio.post(
          createPath,
          data: {
            EntityPlurals.getPluralForEntityName(entityName): [entity.toMap()],
            "apiOperation": "CREATE",
          },
        );
      },
    );
  }

  @override
  FutureOr<Response> delete(D entity) async {
    return executeFuture(
      future: () async {
        return await dio.post(
          createPath,
          data: {
            EntityPlurals.getPluralForEntityName(entityName): [entity.toMap()],
            "apiOperation": "DELETE",
          },
        );
      },
    );
  }

  FutureOr<Response> bulkCreate(List<EntityModel> entities) async {
    return executeFuture(
      future: () async {
        return await dio.post(
          bulkCreatePath,
          options: Options(headers: {
            "content-type": 'application/json',
          }),
          queryParameters: {
            "tenantId": DigitDataModelSingleton().tenantId,
          },
          data: {
            EntityPlurals.getPluralForEntityName(entityName): _getMap(entities),
          },
        );
      },
    );
  }

  FutureOr<Response> bulkUpdate(List<EntityModel> entities) async {
    return executeFuture(
      future: () async {
        return await dio.post(
          bulkUpdatePath,
          options: Options(headers: {
            "content-type": 'application/json',
          }),
          queryParameters: {
            "tenantId": DigitDataModelSingleton().tenantId,
          },
          data: {
            EntityPlurals.getPluralForEntityName(entityName): _getMap(entities),
            "apiOperation": "UPDATE",
          },
        );
      },
    );
  }

  FutureOr<Response> dumpError(
    List<EntityModel> entities,
    DataOperation operation,
  ) async {
    return executeFuture(
      future: () async {
        String url = "";

        if (operation == DataOperation.create) {
          url = bulkCreatePath;
        } else if (operation == DataOperation.update) {
          url = bulkUpdatePath;
        } else if (operation == DataOperation.delete) {
          url = bulkDeletePath;
        } else if (operation == DataOperation.singleCreate) {
          url = createPath;
        } else if (operation == DataOperation.singleCreate) {
          url = searchPath;
        }

        return await dio.post(
          DigitDataModelSingleton().errorDumpApiPath,
          options: Options(headers: {
            "content-type": 'application/json',
          }),
          queryParameters: {
            "tenantId": DigitDataModelSingleton().tenantId,
          },
          data: {
            'errorDetail': {
              "apiDetails": {
                "id": null,
                "url": url,
                "contentType": null,
                "methodType": null,
                "requestBody": _getMap(entities).toString(),
                "requestHeaders": null,
                "additionalDetails": null,
              },
              "errors": [
                {
                  "exception": null,
                  "type": "NON_RECOVERABLE",
                  "errorCode": null,
                  "errorMessage": "UPLOAD_ERROR_FROM_APP",
                  "additionalDetails": null,
                },
              ],
            },
          },
        );
      },
    );
  }

  FutureOr<Response> bulkDelete(List<EntityModel> entities) async {
    return executeFuture(
      future: () async {
        return await dio.post(
          bulkDeletePath,
          options: Options(headers: {
            "content-type": 'application/json',
          }),
          queryParameters: {
            "tenantId": DigitDataModelSingleton().tenantId,
          },
          data: {
            EntityPlurals.getPluralForEntityName(entityName): _getMap(entities),
            "apiOperation": "DELETE",
          },
        );
      },
    );
  }

  @override
  FutureOr<Response> update(EntityModel entity) async {
    return executeFuture(
      future: () async {
        return await dio.post(
          updatePath,
          data: entityName == 'User'
              ? {entityName: entity.toMap()}
              : {
                  entityName: [entity.toMap()],
                  "apiOperation": "UPDATE",
                },
        );
      },
    );
  }

  List<Map<String, dynamic>> _getMap(List<EntityModel> entities) {
    return entities.map((e) => MapperContainer.globals.toMap(e)).toList();
  }

  FutureOr<T> executeFuture<T>({
    required Future<T> Function() future,
  }) async {
    try {
      return await future();
    } on DioException catch (error) {
      const encoder = JsonEncoder.withIndent('  ');

      String? errorResponse;
      String? requestBody;

      try {
        errorResponse = encoder.convert(
          error.response?.data,
        );
      } catch (_) {
        errorResponse = 'Could not parse error';
      }

      try {
        requestBody = encoder.convert(error.requestOptions.data);
      } catch (_) {
        requestBody = 'Could not parse request body';
      }
      rethrow;
    } catch (error) {
      rethrow;
    }
  }
}

/// `LocalRepository` is an abstract class that extends `DataRepository` and provides additional functionality for local repositories.
abstract class LocalRepository<D extends EntityModel,
    R extends EntitySearchModel> extends DataRepository<D, R> {
  final LocalSqlDataStore sql;
  final OpLogManager<D> opLogManager;

  const LocalRepository(this.sql, this.opLogManager);

  @override
  @mustCallSuper
  FutureOr<void> create(
    D entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    if (createOpLog) await createOplogEntry(entity, dataOperation);
  }

  FutureOr<void> bulkCreate(List<D> entities) => throw UnimplementedError();

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

  FutureOr<void> createOplogEntry(D entity, DataOperation operation) async {
    final auditDetails = entity.auditDetails;
    if (auditDetails == null) {
      return;
    }
    final entry = OpLogEntry(
      entity,
      operation,
      createdAt: DateTime.now(),
      createdBy: entity.clientAuditDetails?.lastModifiedBy ?? '',
      type: type,
    );

    return opLogManager.put(entry);
  }

  Future<List<OpLogEntry<D>>> getItemsToBeSyncedUp(String createdBy) async {
    return opLogManager.getPendingUpSync(type, createdBy: createdBy);
  }

  Future<List<OpLogEntry<D>>> getItemsToBeSyncedDown(String createdBy) async {
    return opLogManager.getPendingDownSync(type, createdBy: createdBy);
  }

  FutureOr<void> markSyncedUp({
    OpLogEntry<D>? entry,
    String? clientReferenceId,
    int? id,
    bool? nonRecoverableError,
  }) async {
    await opLogManager.markSyncUp(
      entry: entry,
      clientReferenceId: clientReferenceId,
      id: id,
      nonRecoverableError: nonRecoverableError,
    );
  }
}

/// `InvalidApiResponseException` is a class that represents an exception for an invalid API response.
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

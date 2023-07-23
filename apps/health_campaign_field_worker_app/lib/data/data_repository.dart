// Importing necessary packages and files
import 'dart:async'; // For working with asynchronous operations
import 'dart:convert'; // For working with JSON encoding and decoding

import 'package:digit_components/digit_components.dart'; // Importing components from Digit Components library
import 'package:dio/dio.dart'; // Importing the Dio package for making HTTP requests
import 'package:flutter/cupertino.dart'; // Importing the Flutter's Cupertino library

import '../models/data_model.dart'; // Importing the data model file
import '../utils/constants.dart'; // Importing constants used in the application
import '../utils/environment_config.dart'; // Importing the environment configuration file
import 'local_store/sql_store/sql_store.dart'; // Importing the LocalSqlDataStore for managing local SQL storage
import 'repositories/oplog/oplog.dart'; // Importing the OpLogManager for managing data synchronization operations

// Abstract class for DataRepository
abstract class DataRepository<D extends EntityModel,
    R extends EntitySearchModel> {
  const DataRepository();

  DataModelType get type; // Abstract getter to get the DataModelType

  // Abstract methods for search, create, update, and delete operations
  FutureOr<List<D>> search(R query);
  FutureOr<dynamic> create(D entity);
  FutureOr<dynamic> update(D entity);
  FutureOr<dynamic> delete(D entity);
}

// Abstract class for RemoteRepository extending DataRepository
abstract class RemoteRepository<D extends EntityModel,
    R extends EntitySearchModel> extends DataRepository<D, R> {
  final Dio dio; // Dio instance for making HTTP requests
  final String
      entityName; // The name of the entity for which the repository is used
  final bool isPlural; // Flag indicating if the entity name is plural
  final bool
      isSearchResponsePlural; // Flag indicating if the search response is plural

  final Map<ApiOperation, String>
      actionMap; // Map of API operations and their corresponding paths

  // Get the plural form of the entity name
  String get entityNamePlural =>
      EntityPlurals.getPluralForEntityName(entityName);

  // Get the path for creating a single entity
  String get createPath => actionMap[ApiOperation.create] ?? '';

  // Get the path for updating a single entity
  String get updatePath => actionMap[ApiOperation.update] ?? '';

  // Get the path for searching entities
  String get searchPath => actionMap[ApiOperation.search] ?? '';

  // Get the path for bulk creating entities
  String get bulkCreatePath => actionMap[ApiOperation.bulkCreate] ?? '';

  // Get the path for bulk updating entities
  String get bulkUpdatePath => actionMap[ApiOperation.bulkUpdate] ?? '';

  // Get the path for bulk deleting entities
  String get bulkDeletePath => actionMap[ApiOperation.bulkDelete] ?? '';

  // Constructor for RemoteRepository
  RemoteRepository(
    this.dio, {
    required this.actionMap,
    required this.entityName,
    this.isPlural = false,
    this.isSearchResponsePlural = false,
  });

  // Override the search method for searching entities remotely
  @override
  FutureOr<List<D>> search(R query) async {
    Response response;

    try {
      // Execute the HTTP POST request using Dio with appropriate parameters
      response = await executeFuture(
        future: () async {
          return await dio.post(
            searchPath,
            queryParameters: {
              'offset': 0,
              'limit': 100,
              'tenantId': envConfig.variables.tenantId,
              if (query.isDeleted ?? false) 'includeDeleted': query.isDeleted,
            },
            data: entityName == 'User'
                ? query.toMap()
                : {
                    isPlural
                            ? entityNamePlural
                            : entityName == 'ServiceDefinition'
                                ? 'ServiceDefinitionCriteria'
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

    // Check if the response data is not a Map<String, dynamic>
    if (responseMap is! Map<String, dynamic>) {
      // Throw an InvalidApiResponseException with details of the invalid response
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    // Check if the response data does not contain the entity name or plural form of entity name
    if (!responseMap.containsKey(
      (isSearchResponsePlural || entityName == 'ServiceDefinition')
          ? entityNamePlural
          : entityName,
    )) {
      // Throw an InvalidApiResponseException with details of the invalid response
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    // Get the entity response list from the response data
    final entityResponse = await responseMap[
        (isSearchResponsePlural || entityName == 'ServiceDefinition')
            ? entityNamePlural
            : entityName];

    // Check if the entity response is not a List
    if (entityResponse is! List) {
      // Throw an InvalidApiResponseException with details of the invalid response
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    // Filter and extract the entityList from the entityResponse list
    final entityList = entityResponse.whereType<Map<String, dynamic>>();

    // Map each entity map to an instance of the data model and return as a List
    return entityList.map((e) => Mapper.fromMap<D>(e)).toList();
  }

  // Single entity create method using HTTP POST request
  FutureOr<Response> singleCreate(D entity) async {
    return await dio.post(
      createPath,
      data: {
        'Service': entity.toMap(),
        "apiOperation": "CREATE",
      },
    );
  }

  // Override the create method for creating entities remotely
  @override
  FutureOr<Response> create(D entity) async {
    return executeFuture(
      future: () async {
        return await dio.post(
          createPath,
          data: {
            entityName: [entity.toMap()],
            "apiOperation": "CREATE",
          },
        );
      },
    );
  }

  // Override the delete method for deleting entities remotely
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

  // Bulk create method using HTTP POST request
  FutureOr<Response> bulkCreate(List<EntityModel> entities) async {
    return executeFuture(
      future: () async {
        return await dio.post(
          bulkCreatePath,
          options: Options(headers: {
            "content-type": 'application/json',
          }),
          data: {
            EntityPlurals.getPluralForEntityName(entityName): _getMap(entities),
          },
        );
      },
    );
  }

  // Bulk update method using HTTP POST request
  FutureOr<Response> bulkUpdate(List<EntityModel> entities) async {
    return executeFuture(
      future: () async {
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
      },
    );
  }

  // Bulk delete method using HTTP POST request
  FutureOr<Response> bulkDelete(List<EntityModel> entities) async {
    return executeFuture(
      future: () async {
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
      },
    );
  }

  // Update method using HTTP POST request
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

  // Helper method to convert a list of entities to a list of maps
  List<Map<String, dynamic>> _getMap(List<EntityModel> entities) {
    return entities.map((e) => Mapper.toMap(e)).toList();
  }

  // Helper method to execute a future with error handling
  FutureOr<T> executeFuture<T>({
    required Future<T> Function() future,
  }) async {
    try {
      return await future();
    } on DioError catch (error) {
      // Handle DioError and log details using AppLogger
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

      AppLogger.instance.debug(
        requestBody,
        title: runtimeType.toString(),
      );

      AppLogger.instance.error(
        message: '${error.error}\n$errorResponse',
        title: '${runtimeType.toString()} | DIO_ERROR',
      );

      rethrow; // Rethrow the DioError to propagate the error
    } catch (error) {
      // Handle other errors and log details using AppLogger
      AppLogger.instance.error(
        message: error.toString(),
        title: runtimeType.toString(),
      );

      rethrow; // Rethrow the error to propagate it
    }
  }
}

// Abstract class for LocalRepository extending DataRepository
abstract class LocalRepository<D extends EntityModel,
    R extends EntitySearchModel> extends DataRepository<D, R> {
  final LocalSqlDataStore
      sql; // LocalSqlDataStore for managing local SQL storage
  final OpLogManager<D>
      opLogManager; // OpLogManager for managing data synchronization operations

  // Constructor for LocalRepository
  const LocalRepository(this.sql, this.opLogManager);

  // Override the create method for creating entities locally with oplog entry
  @override
  @mustCallSuper
  FutureOr<void> create(
    D entity, {
    bool createOpLog = true,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    if (createOpLog) await createOplogEntry(entity, dataOperation);
  }

  // Abstract method for bulkCreate that should be implemented in derived classes
  FutureOr<void> bulkCreate(List<D> entities) => throw UnimplementedError();

  // Override the update method for updating entities locally with oplog entry
  @override
  @mustCallSuper
  FutureOr<void> update(D entity, {bool createOpLog = true}) async {
    if (createOpLog) await createOplogEntry(entity, DataOperation.update);
  }

  // Override the delete method for deleting entities locally with oplog entry
  @override
  @mustCallSuper
  FutureOr<void> delete(D entity, {bool createOpLog = true}) async {
    if (createOpLog) await createOplogEntry(entity, DataOperation.delete);
  }

  // Helper method to create an oplog entry for the given entity and operation
  FutureOr<void> createOplogEntry(D entity, DataOperation operation) async {
    final auditDetails = entity.auditDetails;

    // Check if the entity has audit details
    if (auditDetails == null) {
      return;
    }

    // Create an OpLogEntry with entity details and operation type
    final entry = OpLogEntry(
      entity,
      operation,
      createdAt: DateTime.now(),
      createdBy: auditDetails.createdBy,
      type: type,
    );

    // Put the OpLogEntry into the opLogManager for synchronization
    return opLogManager.put(entry);
  }

  // Get a list of OpLogEntries that are pending to be synced up for the given createdBy
  Future<List<OpLogEntry<D>>> getItemsToBeSyncedUp(String createdBy) async {
    return opLogManager.getPendingUpSync(type, createdBy: createdBy);
  }

  // Get a list of OpLogEntries that are pending to be synced down for the given createdBy
  Future<List<OpLogEntry<D>>> getItemsToBeSyncedDown(String createdBy) async {
    return opLogManager.getPendingDownSync(type, createdBy: createdBy);
  }

  // Mark an OpLogEntry as synced up with optional client reference ID and ID
  FutureOr<void> markSyncedUp({
    OpLogEntry<D>? entry,
    String? clientReferenceId,
    int? id,
  }) async {
    return opLogManager.markSyncUp(
      entry: entry,
      clientReferenceId: clientReferenceId,
      id: id,
    );
  }
}

// Custom exception class for representing invalid API response errors
class InvalidApiResponseException implements Exception {
  final String path; // The path of the API endpoint
  final Map<String, dynamic> data; // The request data sent to the API
  final dynamic response; // The response received from the API

  // Constructor for InvalidApiResponseException
  const InvalidApiResponseException({
    required this.path,
    required this.data,
    required this.response,
  });
}

/// CrudService provides business logic for CRUD operations and advanced search on dynamic entities.
///
/// Handles:
/// - Relationship graph building for entity traversal
/// - Nested model mapping resolution
/// - Multi-table search with filter resolution
/// - Entity CRUD operations via repositories

import 'dart:async';

import 'package:digit_crud_bloc/repositories/local/search_entity_repository.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/foundation.dart';

import '../models/global_search_params.dart';

/// Service class for managing CRUD operations on dynamic entities.
///
/// This class must be extended to provide entity-specific repository resolution.
/// See `DigitCrudService` in the `registration_delivery` package for an example.
class CrudService {
  final List<RelationshipMapping>? relationshipMap;
  final List<NestedModelMapping>? nestedModelMappings;
  final SearchEntityRepository? searchEntityRepository;

  late final Map<String, List<RelationshipMapping>> _relationshipGraph;
  late final Map<String, Map<String, NestedFieldMapping>> _nestedMappingLookup;

  bool _isInitialized = false;

  CrudService({
    this.relationshipMap,
    this.nestedModelMappings,
    this.searchEntityRepository,
  });

  /// Whether the service has been initialized.
  bool get isInitialized => _isInitialized;

  /// Initializes relationship graph and nested mappings for CRUD operations.
  ///
  /// Must be called before using [searchEntities].
  void init() {
    _buildRelationshipGraph();
    _initNestedMappings();
    _isInitialized = true;
    _log('CrudService initialized successfully.');
  }

  /// Ensures the service is initialized before performing operations.
  void _ensureInitialized() {
    if (!_isInitialized) {
      throw StateError(
        'CrudService has not been initialized. Call init() before using search operations.',
      );
    }
  }

  void _buildRelationshipGraph() {
    _relationshipGraph = {};
    for (final mapping in relationshipMap ?? []) {
      // Add forward edge
      _relationshipGraph.putIfAbsent(mapping.from, () => []);
      _relationshipGraph[mapping.from]!.add(mapping);

      // Add reverse edge for bidirectional traversal
      final reverseMapping = RelationshipMapping(
        from: mapping.to,
        to: mapping.from,
        localKey: mapping.foreignKey,
        foreignKey: mapping.localKey,
      );
      _relationshipGraph.putIfAbsent(reverseMapping.from, () => []);
      _relationshipGraph[reverseMapping.from]!.add(reverseMapping);
    }

    _log('Built relationship graph with ${_relationshipGraph.length} nodes.');
  }

  void _initNestedMappings() {
    _nestedMappingLookup = {
      for (final mapping in nestedModelMappings ?? [])
        mapping.rootModel: mapping.fields,
    };

    _log('Initialized ${_nestedMappingLookup.length} nested model mappings.');
  }

  /// Searches entities using the provided query parameters.
  ///
  /// Supports multi-table filtering where filters can target different tables
  /// and will be resolved through relationship traversal.
  ///
  /// [query] - The search parameters including filters, select list, pagination, etc.
  ///
  /// Returns a tuple of (grouped results by model name, total count).
  ///
  /// Throws [StateError] if the service has not been initialized.
  Future<(Map<String, List<EntityModel>>, int)> searchEntities({
    required GlobalSearchParameters query,
  }) async {
    _ensureInitialized();

    if (searchEntityRepository == null) {
      _log('Warning: searchEntityRepository is null. Returning empty results.');
      return (<String, List<EntityModel>>{}, 0);
    }

    try {
      return await searchEntityRepository!.searchEntities(
        filters: query.filters,
        relationshipGraph: _relationshipGraph,
        nestedModelMapping: _nestedMappingLookup,
        select: query.select,
        primaryTable: query.primaryModel,
        primaryKeyField: query.primaryKeyField,
        filterLogic: query.filterLogic,
        pagination: query.pagination,
        orderBy: query.orderBy,
      );
    } catch (e, stackTrace) {
      _logError('Search failed', e, stackTrace);
      rethrow;
    }
  }

  /// Creates new entities in the data store.
  ///
  /// [entities] - List of entities to create.
  ///
  /// Throws [UnimplementedError] if [getRepositoryForEntity] is not overridden.
  Future<void> createEntities(List<EntityModel> entities) async {
    if (entities.isEmpty) return;

    for (final entity in entities) {
      final repository = getRepositoryForEntity(entity);
      if (repository != null) {
        await repository.create(entity);
      } else {
        _log(
          'Warning: No repository found for entity type: ${entity.runtimeType}. '
          'Entity was not created.',
        );
      }
    }
  }

  /// Updates existing entities in the data store.
  ///
  /// [entities] - List of entities to update.
  ///
  /// Throws [UnimplementedError] if [getRepositoryForEntity] is not overridden.
  Future<void> updateEntities(List<EntityModel> entities) async {
    if (entities.isEmpty) return;

    for (final entity in entities) {
      final repository = getRepositoryForEntity(entity);
      if (repository != null) {
        await repository.update(entity);
      } else {
        _log(
          'Warning: No repository found for entity type: ${entity.runtimeType}. '
          'Entity was not updated.',
        );
      }
    }
  }

  /// Deletes entities from the data store.
  ///
  /// [entities] - List of entities to delete.
  ///
  /// Throws [UnimplementedError] if [getRepositoryForEntity] is not overridden.
  Future<void> deleteEntities(List<EntityModel> entities) async {
    if (entities.isEmpty) return;

    for (final entity in entities) {
      final repository = getRepositoryForEntity(entity);
      if (repository != null) {
        await repository.delete(entity);
      } else {
        _log(
          'Warning: No repository found for entity type: ${entity.runtimeType}. '
          'Entity was not deleted.',
        );
      }
    }
  }

  /// Returns the appropriate repository for the given entity type.
  ///
  /// Override this method in subclasses to provide entity-specific repository resolution.
  ///
  /// Example implementation:
  /// ```dart
  /// @override
  /// DataRepository? getRepositoryForEntity(EntityModel entity) {
  ///   if (entity is HouseholdModel) {
  ///     return context.repository<HouseholdModel, HouseholdSearchModel>(context);
  ///   } else if (entity is IndividualModel) {
  ///     return context.repository<IndividualModel, IndividualSearchModel>(context);
  ///   }
  ///   return null;
  /// }
  /// ```
  DataRepository? getRepositoryForEntity(EntityModel entity) {
    throw UnimplementedError(
      'getRepositoryForEntity() must be overridden in a subclass to provide '
      'entity-specific repository resolution. '
      'See DigitCrudService in registration_delivery package for an example.',
    );
  }

  /// Logs debug information in debug mode only.
  void _log(String message) {
    if (kDebugMode) {
      debugPrint('[CrudService] $message');
    }
  }

  /// Logs error information.
  void _logError(String message, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      debugPrint('[CrudService] ERROR: $message');
      debugPrint('Error: $error');
      debugPrint('StackTrace: $stackTrace');
    }
  }
}

/// CrudService provides business logic for CRUD operations and advanced search on dynamic entities.
/// Handles relationship graphs and nested model mappings for flexible data access.

import 'dart:async';
import 'package:digit_crud_bloc/repositories/local/search_entity_repository.dart';
import 'package:digit_data_model/data_model.dart';
import '../models/global_search_params.dart';

class CrudService {
  final List<RelationshipMapping>? relationshipMap;
  final List<NestedModelMapping>? nestedModelMappings;
  final SearchEntityRepository? searchEntityRepository;

  late final Map<String, List<RelationshipMapping>> _relationshipGraph;
  late final Map<String, Map<String, NestedFieldMapping>> _nestedMappingLookup;

  CrudService({
    this.relationshipMap,
    this.nestedModelMappings,
    this.searchEntityRepository,
  });

  /// Initializes relationship graph and nested mappings for CRUD operations.
  void init() {
    _buildRelationshipGraph();
    _initNestedMappings();
  }

  void _buildRelationshipGraph() {
    _relationshipGraph = {};
    for (final mapping in relationshipMap ?? []) {
      _relationshipGraph.putIfAbsent(mapping.from, () => []);
      _relationshipGraph[mapping.from]!.add(mapping);
      final reverseMapping = RelationshipMapping(
        from: mapping.to,
        to: mapping.from,
        localKey: mapping.foreignKey,
        foreignKey: mapping.localKey,
      );
      _relationshipGraph.putIfAbsent(reverseMapping.from, () => []);
      _relationshipGraph[reverseMapping.from]!.add(reverseMapping);
    }
  }

  void _initNestedMappings() {
    _nestedMappingLookup = {
      for (final mapping in nestedModelMappings ?? [])
        mapping.rootModel: mapping.fields,
    };
  }

  /// Searches entities using the provided query parameters.
  Future<(Map<String, List<EntityModel>>, int)> searchEntities({
    required GlobalSearchParameters query,
  }) async {
    if (searchEntityRepository == null) {
      return (<String, List<EntityModel>>{}, 0);
    }
    return searchEntityRepository!.searchEntities(
      filters: query.filters,
      relationshipGraph: _relationshipGraph,
      nestedModelMapping: _nestedMappingLookup,
      select: query.select,
      primaryTable: query.primaryModel,
      pagination: query.pagination,
    );
  }

  /// Creates new entities in the data store.
  Future<void> createEntities(List<EntityModel> entities) async {
    for (final entity in entities) {
      final repository = getRepositoryForEntity(entity);
      await repository?.create(entity);
    }
  }

  /// Updates existing entities in the data store.
  Future<void> updateEntities(List<EntityModel> entities) async {
    for (final entity in entities) {
      final repository = getRepositoryForEntity(entity);
      await repository?.update(entity);
    }
  }

  /// Deletes entities from the data store.
  Future<void> deleteEntities(List<EntityModel> entities) async {
    for (final entity in entities) {
      final repository = getRepositoryForEntity(entity);
      await repository?.delete(entity);
    }
  }

  /// Returns the appropriate repository for the given entity type.
  DataRepository? getRepositoryForEntity(EntityModel entity) {
    // Implement logic to return the correct repository for the entity type.
    return null;
  }
}

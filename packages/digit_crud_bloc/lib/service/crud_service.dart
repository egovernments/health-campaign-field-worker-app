import 'dart:async';

import 'package:digit_crud_bloc/repositories/local/search_entity_repository.dart';
import 'package:digit_data_model/data_model.dart';

import '../models/global_search_params.dart';

class RegistrationService {
  final List<RelationshipMapping>? relationshipMap;
  final List<NestedModelMapping>? nestedModelMappings;

  late final Map<String, List<RelationshipMapping>> _relationshipGraph;
  late final Map<String, Map<String, NestedFieldMapping>> _nestedMappingLookup;

  final SearchEntityRepository? searchEntityRepository;

  RegistrationService({
    this.relationshipMap,
    this.nestedModelMappings,
    this.searchEntityRepository,
  });

  void init() {
    _buildRelationshipGraph();
    _initNestedMappings();
  }

  void _buildRelationshipGraph() {
    _relationshipGraph = {};

    for (final mapping in relationshipMap ?? []) {
      // Forward mapping
      _relationshipGraph.putIfAbsent(mapping.from, () => []);
      _relationshipGraph[mapping.from]!.add(mapping);

      // Reverse mapping
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

  Future<(Map<String, List<EntityModel>>, int)> searchHouseholds({
    required GlobalSearchParameters query,
  }) async {
    if (searchEntityRepository == null) {
      return Future.value((<String, List<EntityModel>>{}, 0));
    } else {
      return searchEntityRepository!.searchEntities(
        filters: query.filters,
        relationshipGraph: _relationshipGraph,
        nestedModelMapping: _nestedMappingLookup,
        select: query.select,
        primaryTable: query.primaryModel,
        pagination: query.pagination,
      );
    }
  }

  Future<void> registerEntities(List<EntityModel> entities) async {
    for (final entity in entities) {
      final repository = getRepositoryForEntity(entity);
      await repository?.create(entity);
    }
  }

  Future<void> updateEntities(List<EntityModel> entities) async {
    for (final entity in entities) {
      final repository = getRepositoryForEntity(entity);
      await repository?.update(entity);
    }
  }

  Future<void> deleteEntities(List<EntityModel> entities) async {
    for (final entity in entities) {
      final repository = getRepositoryForEntity(entity);
      await repository?.delete(entity);
    }
  }

  DataRepository? getRepositoryForEntity(EntityModel entity) {
    return null;
  }
}

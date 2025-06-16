// lib/src/services/household_registration_service.dart

import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:registration_delivery/utils/typedefs.dart';
import 'package:registration_bloc/repositories/local/search_entity_repository.dart';

import '../models/entities/household.dart';
import '../models/entities/household_member.dart';
import '../models/entities/project_beneficiary.dart';
import '../models/entities/task.dart';
import '../models/global_search_params.dart';
import '../repositories/local/household_global_search.dart';
import '../repositories/local/individual_global_search.dart';
// import '../utils/typedefs.dart';

class RegistrationService {
  final List<RelationshipMapping> relationshipMap;
  final List<NestedModelMapping> nestedModelMappings;


  late final Map<String, List<RelationshipMapping>> _relationshipGraph;
  late final Map<String, Map<String, NestedFieldMapping> > _nestedMappingLookup;

  final SearchEntityRepository searchEntityRepository;
  final IndividualDataRepository individualRepository;
  final HouseholdDataRepository householdRepository;
  final HouseholdMemberDataRepository householdMemberRepository;
  final ProjectBeneficiaryDataRepository projectBeneficiaryRepository;
  final TaskDataRepository taskDataRepository;

  RegistrationService({
    required this.relationshipMap,
    required this.nestedModelMappings,
    required this.individualRepository,
    required this.householdRepository,
    required this.householdMemberRepository,
    required this.projectBeneficiaryRepository,
    required this.taskDataRepository,
    required this.searchEntityRepository,
  });

  void init() {
    _buildRelationshipGraph();
    _initNestedMappings();
  }

  void _buildRelationshipGraph() {
    _relationshipGraph = {};

    for (final mapping in relationshipMap) {
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
      for (final mapping in nestedModelMappings) mapping.rootModel: mapping.fields,
    };
  }

  List<RelationshipMapping> resolveAllRelationshipsDFS(String root) {
    final visited = <String>{};
    final result = <RelationshipMapping>[];

    void dfs(String entity) {
      if (visited.contains(entity)) return;
      visited.add(entity);

      final mappings = _relationshipGraph[entity];
      if (mappings == null) return;

      for (final mapping in mappings) {
        result.add(mapping);
        dfs(mapping.to);
      }
    }

    dfs(root);
    return result;
  }

  Future<List<EntityModel>> searchHouseholds({
    required GlobalSearchParameters query,
  }) async {
    final root = query.filters.first.root;
    final resolvedRelationships = resolveAllRelationshipsDFS(root);

    return searchEntityRepository.searchEntities(
      filters: query.filters,
      relationships: resolvedRelationships,
      nestedModelMapping: _nestedMappingLookup,
      select: query.select,
      pagination: query.pagination,
    );
  }

  Future<void> registerEntities(List<EntityModel> entities) async {
    for (final entity in entities) {
      final repository = getRepositoryForEntity(entity);
      await repository.create(entity);
    }
  }

  Future<void> updateEntities(List<EntityModel> entities) async {
    for (final entity in entities) {
      final repository = getRepositoryForEntity(entity);
      await repository.update(entity);
    }
  }

  Future<void> deleteEntities(List<EntityModel> entities) async {
    for (final entity in entities) {
      final repository = getRepositoryForEntity(entity);
      await repository.delete(entity);
    }
  }

  DataRepository getRepositoryForEntity(EntityModel entity) {
    if (entity is HouseholdModel) {
      return householdRepository;
    } else if (entity is IndividualModel) {
      return individualRepository;
    } else if (entity is HouseholdMemberModel) {
      return householdMemberRepository;
    } else if (entity is ProjectBeneficiaryModel) {
      return projectBeneficiaryRepository;
    } else if (entity is TaskModel) {
      return taskDataRepository;
    } else {
      throw Exception(
          'No repository found for entity type: ${entity.runtimeType}');
    }
  }
}

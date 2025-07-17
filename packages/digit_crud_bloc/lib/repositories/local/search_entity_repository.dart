/// SearchEntityRepository provides advanced querying and hydration for dynamic entities.
/// Supports filtering, relationships, nested models, and geospatial queries.

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math' as math;
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/utils.dart';
import 'query_builder.dart';
import 'hydration_helper.dart';
import 'relationship_graph_helper.dart';

class SearchEntityRepository extends LocalRepository {
  SearchEntityRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<EntityModel>> search(EntitySearchModel query) {
    throw UnimplementedError();
  }

  @override
  DataModelType get type => throw UnimplementedError();

  Future<(Map<String, List<EntityModel>>, int)> searchEntities({
    required List<SearchFilter> filters,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    required Map<String, Map<String, NestedFieldMapping>> nestedModelMapping,
    required List<String> select,
    String? primaryTable,
    PaginationParams? pagination,
  }) async {
    return _buildAndExecuteSearchQuery(
      filters: filters,
      relationshipGraph: relationshipGraph,
      select: select,
      primaryTable: primaryTable,
      pagination: pagination,
      nestedModelMapping: nestedModelMapping,
    );
  }

  /// Builds and executes the search query, delegating to helpers for query, hydration, and relationship logic.
  Future<(Map<String, List<EntityModel>>, int)> _buildAndExecuteSearchQuery({
    required List<SearchFilter> filters,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    required Map<String, Map<String, NestedFieldMapping>> nestedModelMapping,
    required List<String> select,
    String? primaryTable,
    required PaginationParams? pagination,
  }) async {
    final rootTable = filters.first.root;
    final queriedModels = <String>{rootTable};
    final allResults = <Map<String, dynamic>>[];
    var totalCount = 0;
    final modelToResults = <String, List<Map<String, dynamic>>>{};

    final rootResults = await QueryBuilder.queryRawTable(
      sql: sql,
      table: rootTable,
      filters: filters,
      select: select,
      pagination: pagination,
      isPrimaryTable: primaryTable == rootTable,
      onCountFetched: (count) {
        totalCount = count;
      },
    );

    final hydratedRoot = await HydrationHelper.hydrateRawRows(
      this,
      rootResults,
      nestedModelMapping,
      rootTable,
    );
    modelToResults[rootTable] = hydratedRoot;
    allResults.addAll(hydratedRoot);

    for (final model in select) {
      if (queriedModels.contains(model)) continue;
      final path = await RelationshipGraphHelper.findShortestPath(
        fromModels: queriedModels,
        toModel: model,
        graph: relationshipGraph,
      );
      if (path.isEmpty) {
        debugPrint("No path found to model $model");
        continue;
      }
      final origin = path.first.from;
      var currentRows = modelToResults[origin] ?? [];
      for (final rel in path) {
        final fromKey = QueryBuilder.camelToSnake(rel.localKey);
        final toTable = QueryBuilder.camelToSnake(rel.to);
        final toKey = QueryBuilder.camelToSnake(rel.foreignKey);
        final joinValues = currentRows.map((row) => row[fromKey]).whereType().toSet().toList();
        if (joinValues.isEmpty) break;
        final filter = SearchFilter(
          root: toTable,
          field: toKey,
          operator: 'in',
          value: joinValues,
        );
        currentRows = await QueryBuilder.queryRawTable(
          sql: sql,
          table: toTable,
          filters: [filter],
          select: select,
          isPrimaryTable: primaryTable == toTable,
          pagination: pagination,
          onCountFetched: (count) {
            totalCount = count;
          },
        );
      }
      final enriched = await HydrationHelper.hydrateRawRows(
        this,
        currentRows,
        nestedModelMapping,
        model,
      );
      modelToResults[model] = enriched;
      allResults.addAll(enriched);
      queriedModels.add(model);
    }

    final Map<String, List<EntityModel>> groupedResults = {};
    for (final row in allResults) {
      final modelName = row['modelName'] as String;
      if (!select.contains(modelName)) continue;
      final entity = CrudBlocSingleton.instance.dynamicEntityModelListener.dynamicEntityModelFromMap(modelName, QueryBuilder.snakeToCamelDeep(row));
      if (entity != null) {
        groupedResults.putIfAbsent(modelName, () => []).add(entity);
      }
    }
    return (groupedResults, totalCount);
  }

  /// Queries a raw table with filters and returns the result rows.
  Future<List<Map<String, dynamic>>> _queryRawTable({
    required String table,
    required List<SearchFilter> filters,
    required List<String> select,
    PaginationParams? pagination,
    bool isPrimaryTable = false,
    void Function(int count)? onCountFetched,
  }) async {
    return await QueryBuilder.queryRawTable(
      sql: sql,
      table: table,
      filters: filters,
      select: select,
      pagination: pagination,
      isPrimaryTable: isPrimaryTable,
      onCountFetched: onCountFetched,
    );
  }

  /// Hydrates raw rows with nested model data.
  Future<List<Map<String, dynamic>>> _hydrateRawRows(
    List<Map<String, dynamic>> rawRows,
    Map<String, Map<String, NestedFieldMapping>> nestedModelMapping,
    String currentModelName,
  ) async {
    return await HydrationHelper.hydrateRawRows(
      this,
      rawRows,
      nestedModelMapping,
      currentModelName,
    );
  }
}

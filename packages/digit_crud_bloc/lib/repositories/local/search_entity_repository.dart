import 'dart:async';

import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/utils.dart';
import '../helpers/hydration_helper.dart';
import '../helpers/query_analyzer.dart';
import '../helpers/query_builder.dart';
import '../helpers/query_executor.dart';
import '../helpers/relationship_graph_helper.dart';

/// SearchEntityRepository provides advanced querying and hydration for dynamic entities.
/// Supports filtering, relationships, nested models, and geospatial queries.

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

  Future<(Map<String, List<EntityModel>>, int)> _buildAndExecuteSearchQuery({
    required List<SearchFilter> filters,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    required Map<String, Map<String, NestedFieldMapping>> nestedModelMapping,
    required List<String> select,
    String? primaryTable,
    required PaginationParams? pagination,
  }) async {
    // Check if we should use optimized approach
    final shouldOptimize = _shouldUseOptimizedQuery(filters, select);

    if (shouldOptimize) {
      try {
        // Use the optimized query approach
        return await _executeOptimizedQuery(
          filters: filters,
          relationshipGraph: relationshipGraph,
          nestedModelMapping: nestedModelMapping,
          select: select,
          primaryTable: primaryTable,
          pagination: pagination,
        );
      } catch (e) {
        debugPrint('Optimized query failed, falling back to original: $e');
        // Fall back to original implementation if optimization fails
      }
    }

    // Original implementation (fallback)
    return await _executeOriginalQuery(
      filters: filters,
      relationshipGraph: relationshipGraph,
      nestedModelMapping: nestedModelMapping,
      select: select,
      primaryTable: primaryTable,
      pagination: pagination,
    );
  }

  /// Determines whether to use optimized query approach
  bool _shouldUseOptimizedQuery(
      List<SearchFilter> filters, List<String> select) {
    // Use optimization for multi-table queries
    final uniqueRoots = filters.map((f) => f.root).toSet();

    // Optimize if:
    // 1. Multiple root tables OR
    // 2. Multiple select tables OR
    // 3. Complex filters (more than 3)
    return uniqueRoots.length > 1 || select.length > 1 || filters.length > 3;
  }

  /// Execute query using optimized approach
  Future<(Map<String, List<EntityModel>>, int)> _executeOptimizedQuery({
    required List<SearchFilter> filters,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    required Map<String, Map<String, NestedFieldMapping>> nestedModelMapping,
    required List<String> select,
    String? primaryTable,
    PaginationParams? pagination,
  }) async {
    // Step 1: Analyze the query
    final analyzer = QueryAnalyzer(
      relationshipGraph: relationshipGraph,
      nestedModelMapping: nestedModelMapping,
    );

    final strategy = analyzer.analyzeQuery(
      filters: filters,
      selectTables: select,
      primaryTable: primaryTable,
    );

    debugPrint('Query strategy selected: ${strategy.type}');

    // Step 2: Execute using the appropriate strategy
    final executor = QueryExecutors(
      sql: sql,
      nestedModelMapping: nestedModelMapping,
      searchEntityRepository: this,
    );

    return await executor.executeStrategy(
      strategy: strategy,
      filters: filters,
      selectTables: select,
      relationshipGraph: relationshipGraph,
      pagination: pagination,
    );
  }

  /// Original query implementation (preserved as fallback)
  Future<(Map<String, List<EntityModel>>, int)> _executeOriginalQuery({
    required List<SearchFilter> filters,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    required Map<String, Map<String, NestedFieldMapping>> nestedModelMapping,
    required List<String> select,
    String? primaryTable,
    PaginationParams? pagination,
  }) async {
    // Group filters by root table
    final filtersByRoot = <String, List<SearchFilter>>{};
    for (final filter in filters) {
      filtersByRoot.putIfAbsent(filter.root, () => []).add(filter);
    }

    final queriedModels = <String>{};
    final allResults = <Map<String, dynamic>>[];
    var totalCount = 0;
    final modelToResults = <String, List<Map<String, dynamic>>>{};

    // Query each root table with its filters
    for (final entry in filtersByRoot.entries) {
      final rootTable = entry.key;
      final rootFilters = entry.value;

      final rootResults = await QueryBuilder.queryRawTable(
        sql: sql,
        table: rootTable,
        filters: rootFilters,
        select: select,
        pagination: primaryTable == rootTable ? pagination : null,
        isPrimaryTable: primaryTable == rootTable,
        onCountFetched: (count) {
          if (primaryTable == rootTable) {
            totalCount = count;
          }
        },
      );

      final hydratedRoot = await HydrationHelper.hydrateRawRows(
        sql,
        this,
        rootResults,
        nestedModelMapping,
        rootTable,
      );

      modelToResults[rootTable] = hydratedRoot;
      allResults.addAll(hydratedRoot);
      queriedModels.add(rootTable);
    }

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

        final joinValues =
            currentRows.map((row) => row[fromKey]).whereType().toSet().toList();
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
        sql,
        this,
        currentRows,
        nestedModelMapping,
        model,
      );
      modelToResults[model] = enriched;
      allResults.addAll(enriched);
      queriedModels.add(model);
    }

    // Group results by model name
    final Map<String, List<EntityModel>> groupedResults = {};

    for (final row in allResults) {
      final modelName = row['modelName'] as String;
      if (!select.contains(modelName)) continue;

      final entity = CrudBlocSingleton.instance.dynamicEntityModelListener
          .dynamicEntityModelFromMap(
              modelName, QueryBuilder.snakeToCamelDeep(row));
      groupedResults.putIfAbsent(modelName, () => []).add(entity!);
    }

    return (groupedResults, totalCount);
  }
}

Expression<bool> buildDynamicExpression({
  required Expression col,
  required String operator,
  required dynamic value,
}) {
  final symbol = Symbol(operator);

  try {
    // For null-based methods like isNull(), isNotNull()
    if (operator == 'isNull' || operator == 'isNotNull') {
      return Function.apply(col.noSuchMethod, [Invocation.method(symbol, [])])
          as Expression<bool>;
    }

    // For list-based methods like isIn(), isNotIn()
    if ((operator == 'isIn' || operator == 'isNotIn') && value is! List) {
      throw Exception("Operator '$operator' expects a List value");
    }

    // Normal method with one argument
    return Function.apply(col.noSuchMethod, [
      Invocation.method(symbol, [value])
    ]) as Expression<bool>;
  } catch (e) {
    throw Exception("Failed to apply operator '$operator' on column: $e");
  }
}

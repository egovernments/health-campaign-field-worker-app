import 'dart:async';

import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/utils.dart';
import '../helpers/hydration_helper.dart';
import '../helpers/query_builder.dart';
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
    final rootTable = filters.first.root;
    final queriedModels = <String>{};
    final allResults = <Map<String, dynamic>>[];
    var totalCount = 0;
    final modelToResults = <String, List<Map<String, dynamic>>>{};

    // Step 1: If root and primary table are same, just query directly
    if (rootTable == primaryTable) {
      final rootResults = await QueryBuilder.queryRawTable(
        sql: sql,
        table: rootTable,
        filters: filters,
        select: select,
        pagination: pagination,
        isPrimaryTable: true,
        onCountFetched: (count) {
          totalCount = count;
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
    } else {
      // Step 2: Root filter is on another entity, need to resolve primary table
      final rootResults = await QueryBuilder.queryRawTable(
        sql: sql,
        table: rootTable,
        filters: filters,
        select: select,
        pagination: pagination,
        isPrimaryTable: false,
        onCountFetched: (count) {
          totalCount = count;
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

      // Traverse to primary table
      final pathToPrimary = await RelationshipGraphHelper.findShortestPath(
        fromModels: {rootTable},
        toModel: primaryTable!,
        graph: relationshipGraph,
      );

      var currentRows = hydratedRoot;
      for (final rel in pathToPrimary) {
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
          isPrimaryTable: toTable == primaryTable,
          pagination: pagination,
          onCountFetched: (count) {
            totalCount = count;
          },
        );
      }

      final hydratedPrimary = await HydrationHelper.hydrateRawRows(
        sql,
        this,
        currentRows,
        nestedModelMapping,
        primaryTable!,
      );

      modelToResults[primaryTable!] = hydratedPrimary;
      allResults.addAll(hydratedPrimary);
      queriedModels.add(primaryTable!);
    }

    // Step 3: Expand all other requested models fully (no original filters, only relationship based)
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

        // Only relationship filter, no original user filter here
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
          isPrimaryTable: toTable == primaryTable,
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

    // Step 4: Group results by model name
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

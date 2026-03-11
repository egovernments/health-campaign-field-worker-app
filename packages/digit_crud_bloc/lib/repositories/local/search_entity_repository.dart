import 'dart:async';

import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/foundation.dart';

import '../../utils/utils.dart';
import '../helpers/hydration_helper.dart';
import '../helpers/multi_table_filter_resolver.dart';
import '../helpers/query_builder.dart';
import '../helpers/relationship_graph_helper.dart';

/// SearchEntityRepository provides advanced querying and hydration for dynamic entities.
///
/// Supports:
/// - Multi-table filtering with AND/OR logic
/// - Relationship traversal between entities
/// - Nested model hydration
/// - Geospatial queries (within radius)
/// - Pagination and ordering
class SearchEntityRepository extends LocalRepository {
  SearchEntityRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<EntityModel>> search(EntitySearchModel query) {
    throw UnimplementedError(
      'Use searchEntities() for advanced multi-table queries.',
    );
  }

  @override
  DataModelType get type => throw UnimplementedError();

  /// Searches entities with support for multi-table filtering.
  ///
  /// [filters] - Search filters that can span multiple tables.
  /// [relationshipGraph] - Bidirectional graph of entity relationships.
  /// [nestedModelMapping] - Mappings for hydrating nested fields.
  /// [select] - List of model names to include in results.
  /// [primaryTable] - The primary table for pagination and result focus.
  /// [primaryKeyField] - Primary key field name (required for multi-table filters).
  /// [filterLogic] - How to combine filters across tables (AND/OR).
  /// [pagination] - Pagination parameters.
  /// [orderBy] - Ordering configuration.
  ///
  /// Returns a tuple of (grouped results by model name, total count).
  Future<(Map<String, List<EntityModel>>, int)> searchEntities({
    required List<SearchFilter> filters,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    required Map<String, Map<String, NestedFieldMapping>> nestedModelMapping,
    required List<String> select,
    String? primaryTable,
    String? primaryKeyField,
    MultiTableFilterLogic filterLogic = MultiTableFilterLogic.and,
    PaginationParams? pagination,
    SearchOrderBy? orderBy,
  }) async {
    // Validate inputs
    _validateInputs(
      filters: filters,
      select: select,
      primaryTable: primaryTable,
    );

    try {
      return await _executeMultiTableSearch(
        filters: filters,
        relationshipGraph: relationshipGraph,
        nestedModelMapping: nestedModelMapping,
        select: select,
        primaryTable: primaryTable!,
        primaryKeyField: primaryKeyField ?? _inferPrimaryKeyField(primaryTable),
        filterLogic: filterLogic,
        pagination: pagination,
        orderBy: orderBy,
      );
    } catch (e, stackTrace) {
      _logError('Search failed', e, stackTrace);
      rethrow;
    }
  }

  /// Validates input parameters before executing search.
  void _validateInputs({
    required List<SearchFilter> filters,
    required List<String> select,
    required String? primaryTable,
  }) {
    if (filters.isEmpty) {
      throw ArgumentError('At least one filter is required for search.');
    }

    if (select.isEmpty) {
      throw ArgumentError('At least one model must be selected.');
    }

    if (primaryTable == null || primaryTable.isEmpty) {
      throw ArgumentError(
        'primaryTable is required for multi-table search. '
        'Specify the main table from which results should be returned.',
      );
    }
  }

  /// Infers the primary key field name based on common conventions.
  String _inferPrimaryKeyField(String tableName) {
    // Default convention used in the codebase
    return 'clientReferenceId';
  }

  /// Executes the multi-table search with filter resolution.
  Future<(Map<String, List<EntityModel>>, int)> _executeMultiTableSearch({
    required List<SearchFilter> filters,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    required Map<String, Map<String, NestedFieldMapping>> nestedModelMapping,
    required List<String> select,
    required String primaryTable,
    required String primaryKeyField,
    required MultiTableFilterLogic filterLogic,
    required PaginationParams? pagination,
    required SearchOrderBy? orderBy,
  }) async {
    final queriedModels = <String>{};
    final modelToResults = <String, List<Map<String, dynamic>>>{};
    var totalCount = 0;

    // Step 1: Resolve multi-table filters to primary table constraints
    final filterResolver = MultiTableFilterResolver(
      sql: sql,
      relationshipGraph: relationshipGraph,
    );

    final filterResult = await filterResolver.resolveFilters(
      filters: filters,
      primaryTable: primaryTable,
      primaryKeyField: primaryKeyField,
      filterLogic: filterLogic,
    );

    // If filter resolution resulted in empty set, return empty results
    if (filterResult.isEmptyResult) {
      _log('Filter resolution resulted in empty set, returning no results.');
      return (<String, List<EntityModel>>{}, 0);
    }

    // Step 2: Build combined filters for primary table query
    final primaryFilters = _buildPrimaryTableFilters(
      primaryTableFilters: filterResult.primaryTableFilters,
      resolvedConstraints: filterResult.resolvedPrimaryKeyConstraints,
      primaryTable: primaryTable,
      primaryKeyField: primaryKeyField,
    );

    // Step 3: Query the primary table with combined filters
    final primaryResults = await QueryBuilder.queryRawTable(
      sql: sql,
      table: primaryTable,
      filters: primaryFilters,
      select: select,
      pagination: pagination,
      isPrimaryTable: true,
      onCountFetched: (count) {
        totalCount = count;
      },
      orderBy: orderBy,
    );

    _log('Primary table query returned ${primaryResults.length} rows.');

    // Step 4: Hydrate primary table results with nested data
    final hydratedPrimary = await HydrationHelper.hydrateRawRows(
      sql,
      this,
      primaryResults,
      nestedModelMapping,
      primaryTable,
    );

    modelToResults[primaryTable] = hydratedPrimary;
    queriedModels.add(primaryTable);

    // Step 5: Expand to other selected models via relationships
    await _expandToRelatedModels(
      select: select,
      primaryTable: primaryTable,
      queriedModels: queriedModels,
      modelToResults: modelToResults,
      relationshipGraph: relationshipGraph,
      nestedModelMapping: nestedModelMapping,
    );

    // Step 6: Convert results to EntityModel instances
    final groupedResults = _convertToEntityModels(
      modelToResults: modelToResults,
      select: select,
    );

    return (groupedResults, totalCount);
  }

  /// Builds the combined filter list for the primary table query.
  List<SearchFilter> _buildPrimaryTableFilters({
    required List<SearchFilter> primaryTableFilters,
    required Set<dynamic> resolvedConstraints,
    required String primaryTable,
    required String primaryKeyField,
  }) {
    final combinedFilters = <SearchFilter>[...primaryTableFilters];

    // Add resolved constraints from related tables if any
    if (resolvedConstraints.isNotEmpty) {
      combinedFilters.add(
        SearchFilter(
          root: primaryTable,
          field: primaryKeyField,
          operator: 'in',
          value: resolvedConstraints.toList(),
        ),
      );
    }

    // Ensure at least one filter exists (required by QueryBuilder)
    if (combinedFilters.isEmpty) {
      throw StateError(
        'No filters available for primary table query. '
        'This should not happen - check filter resolution logic.',
      );
    }

    return combinedFilters;
  }

  /// Expands query results to include other selected models via relationships.
  Future<void> _expandToRelatedModels({
    required List<String> select,
    required String primaryTable,
    required Set<String> queriedModels,
    required Map<String, List<Map<String, dynamic>>> modelToResults,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    required Map<String, Map<String, NestedFieldMapping>> nestedModelMapping,
  }) async {
    for (final model in select) {
      if (queriedModels.contains(model)) continue;

      final path = await RelationshipGraphHelper.findShortestPath(
        fromModels: queriedModels,
        toModel: model,
        graph: relationshipGraph,
      );

      if (path.isEmpty) {
        _log('No relationship path found to model: $model. Skipping.');
        continue;
      }

      final expandedRows = await _traverseRelationshipPath(
        path: path,
        modelToResults: modelToResults,
      );

      if (expandedRows.isEmpty) {
        _log('No rows found for model: $model after relationship traversal.');
        continue;
      }

      // Hydrate the expanded rows
      final hydratedRows = await HydrationHelper.hydrateRawRows(
        sql,
        this,
        expandedRows,
        nestedModelMapping,
        model,
      );

      modelToResults[model] = hydratedRows;
      queriedModels.add(model);

      _log('Expanded to model: $model with ${hydratedRows.length} rows.');
    }
  }

  /// Traverses a relationship path to fetch related rows.
  Future<List<Map<String, dynamic>>> _traverseRelationshipPath({
    required List<RelationshipMapping> path,
    required Map<String, List<Map<String, dynamic>>> modelToResults,
  }) async {
    if (path.isEmpty) return [];

    final origin = path.first.from;
    var currentRows = modelToResults[origin] ?? [];

    for (final rel in path) {
      final fromKeySnake = QueryBuilder.camelToSnake(rel.localKey);
      final toTable = rel.to;

      // Extract join values from current rows
      final joinValues = currentRows
          .map((row) => row[fromKeySnake])
          .where((v) => v != null)
          .toSet()
          .toList();

      if (joinValues.isEmpty) {
        _log('No join values for relationship: ${rel.from} -> ${rel.to}');
        return [];
      }

      // Query the related table
      currentRows = await QueryBuilder.queryRawTable(
        sql: sql,
        table: toTable,
        filters: [
          SearchFilter(
            root: toTable,
            field: rel.foreignKey,
            operator: 'in',
            value: joinValues,
          ),
        ],
        select: ['*'],
        isPrimaryTable: false,
      );
    }

    return currentRows;
  }

  /// Converts raw result rows to typed EntityModel instances.
  Map<String, List<EntityModel>> _convertToEntityModels({
    required Map<String, List<Map<String, dynamic>>> modelToResults,
    required List<String> select,
  }) {
    final groupedResults = <String, List<EntityModel>>{};

    for (final entry in modelToResults.entries) {
      final modelName = entry.key;
      final rows = entry.value;

      // Skip models not in the select list
      if (!select.contains(modelName)) continue;

      final entities = <EntityModel>[];

      for (final row in rows) {
        // Get model name from row or use the key
        final rowModelName = row['modelName'] as String? ?? modelName;

        if (!select.contains(rowModelName)) continue;

        try {
          final camelCaseRow = QueryBuilder.snakeToCamelDeep(row);
          final entity = CrudBlocSingleton.instance.dynamicEntityModelListener
              .dynamicEntityModelFromMap(rowModelName, camelCaseRow);

          if (entity != null) {
            entities.add(entity);
          } else {
            _log(
              'Warning: Failed to convert row to entity for model: $rowModelName. '
              'Ensure DynamicEntityModelListener handles this model type.',
            );
          }
        } catch (e) {
          _logError('Failed to convert row to $rowModelName entity', e, StackTrace.current);
          // Continue processing other rows instead of failing entirely
        }
      }

      if (entities.isNotEmpty) {
        groupedResults[modelName] = entities;
      }
    }

    return groupedResults;
  }

  /// Logs debug information in debug mode only.
  void _log(String message) {
    if (kDebugMode) {
      debugPrint('[SearchEntityRepository] $message');
    }
  }

  /// Logs error information.
  void _logError(String message, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      debugPrint('[SearchEntityRepository] ERROR: $message');
      debugPrint('Error: $error');
      debugPrint('StackTrace: $stackTrace');
    }
  }
}

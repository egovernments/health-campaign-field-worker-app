import 'dart:async';

import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart' hide OrderBy;
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

  /// Session-scoped guard for the lazy stats refresh in
  /// [_ensureStatsFreshOncePerSession]. Static so it survives across
  /// short-lived repository instances (Drift lets callers spin one up
  /// per query on some paths). Reset on hot restart, which is what we
  /// want — after a fresh install the first ever process needs the
  /// refresh; every subsequent app-launch already gets its `beforeOpen`
  /// ANALYZE from the DB layer.
  static bool _statsRefreshedThisSession = false;
  static Future<void>? _statsRefreshInFlight;

  /// SQLite's planner uses `sqlite_stat1` to decide SCAN vs INDEX. On a
  /// fresh install our `onCreate` runs ANALYZE while every table is
  /// still empty, so stat1 records "0 rows everywhere" and the planner
  /// keeps picking SCAN for lookups like
  /// `SELECT * FROM project_facility WHERE project_id = ?` even after
  /// downsync populates the table (measured: SCAN + SQLCipher decrypt
  /// per page turns a 2-row hit into a 2.5s query).
  ///
  /// Re-running ANALYZE on the first search of the session catches this
  /// case at ~100-200 ms one-time cost, and every subsequent query in
  /// the session sees real row counts and picks the right index. Guard
  /// via a Future so concurrent first-searches share a single ANALYZE.
  Future<void> _ensureStatsFreshOncePerSession() async {
    if (_statsRefreshedThisSession) return;
    if (_statsRefreshInFlight != null) {
      await _statsRefreshInFlight;
      return;
    }
    _statsRefreshInFlight = () async {
      try {
        await sql.customStatement('PRAGMA analysis_limit = 400');
        await sql.customStatement('ANALYZE');
      } catch (e) {
        // Best-effort: a failure here just means we skip the perf lift,
        // not correctness — swallow so we don't break the search.
        if (kDebugMode) {
          debugPrint('[SearchEntityRepository] session ANALYZE failed: $e');
        }
      } finally {
        _statsRefreshedThisSession = true;
      }
    }();
    await _statsRefreshInFlight;
    _statsRefreshInFlight = null;
  }

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
    // Refresh planner stats once per session before we build the query.
    // See _ensureStatsFreshOncePerSession for why — without this, the
    // very first search after a fresh install falls to SCAN because
    // sqlite_stat1 was populated on empty tables at onCreate time.
    await _ensureStatsFreshOncePerSession();

    final queriedModels = <String>{};
    final modelToResults = <String, List<Map<String, dynamic>>>{};
    var totalCount = 0;

    // Step 1: Build SQL-level subquery constraints for cross-table filters.
    final filterResolver = MultiTableFilterResolver(
      sql: sql,
      relationshipGraph: relationshipGraph,
    );

    final constraints =
        await filterResolver.buildCrossTableConstraintExpressions(
      filters: filters,
      primaryTable: primaryTable,
      primaryKeyField: primaryKeyField,
      filterLogic: filterLogic,
    );

    final primaryFilters = constraints.primaryTableFilters;
    var crossTableConstraints = constraints.crossTableConstraints;

    if (filterLogic == MultiTableFilterLogic.or &&
        crossTableConstraints.length > 1) {
      crossTableConstraints = [
        crossTableConstraints.reduce((a, b) => a | b)
      ];
    }

    if (primaryFilters.isEmpty && crossTableConstraints.isEmpty) {
      throw ArgumentError('No applicable filters for primary table query.');
    }

    // Step 2: Primary table query (data + count)
    final primaryResults = await QueryBuilder.queryRawTable(
      sql: sql,
      table: primaryTable,
      filters: primaryFilters,
      select: select,
      pagination: pagination,
      isPrimaryTable: true,
      // Only fire a SELECT COUNT(*) when the caller actually needs the total
      // for pagination. Without pagination we already fetch every matching
      // row, so `results.length` is the correct total — and the extra COUNT
      // was blocking the whole search behind write-lock contention with the
      // background sync isolate (measured at ~1.1s per warm search entry).
      onCountFetched: pagination != null
          ? (count) {
              totalCount = count;
            }
          : null,
      orderBy: orderBy,
      extraConstraints: crossTableConstraints,
    );
    if (pagination == null) {
      totalCount = primaryResults.length;
    }

    // Step 3: Hydrate primary table results with nested data
    final hydratedPrimary = await HydrationHelper.hydrateRawRows(
      sql,
      this,
      primaryResults,
      nestedModelMapping,
      primaryTable,
    );

    modelToResults[primaryTable] = hydratedPrimary;
    queriedModels.add(primaryTable);

    // Step 4: Expand to other selected models via relationships
    await _expandToRelatedModels(
      select: select,
      primaryTable: primaryTable,
      queriedModels: queriedModels,
      modelToResults: modelToResults,
      relationshipGraph: relationshipGraph,
      nestedModelMapping: nestedModelMapping,
    );

    // Step 5: Convert results to EntityModel instances
    final groupedResults = _convertToEntityModels(
      modelToResults: modelToResults,
      select: select,
    );

    return (groupedResults, totalCount);
  }

  /// Builds the combined filter list for the primary table query.
  // ignore: unused_element
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

    for (var i = 0; i < path.length; i++) {
      final rel = path[i];
      final isLastStep = i == path.length - 1;
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

      // For intermediate hops only project the column we'll need to keep
      // joining on. The final hop needs the full row so hydration + entity
      // conversion can use it.
      final List<String>? hopProjection = isLastStep
          ? null
          : [path[i + 1].localKey];

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
        selectColumns: hopProjection,
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

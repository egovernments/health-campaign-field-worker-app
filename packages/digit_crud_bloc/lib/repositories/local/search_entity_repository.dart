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

  static bool _indexDiagLogged = false;

  /// One-shot diagnostic: log indexes on suspect tables and the SQLite
  /// query plan for a representative IN-lookup. Confirms whether the
  /// expected indexes exist and whether SQLite is actually using them.
  ///
  /// Gated behind kDebugMode because in release builds it would still run
  /// two synchronous SQL queries plus ~25 sequential debugPrint syscalls
  /// on the first search of a session — enough to produce a visible UI
  /// stall on slower devices. Everything the caller cares about (whether
  /// indexes exist, whether SQLite uses them) is a dev-time question that
  /// doesn't need to fire in production.
  Future<void> _logIndexDiagnostics() async {
    if (!kDebugMode) return;
    if (_indexDiagLogged) return;
    _indexDiagLogged = true;
    try {
      final idx = await sql
          .customSelect(
            "SELECT tbl_name, name FROM sqlite_master "
            "WHERE type='index' AND tbl_name IN "
            "('identifier','address','name','individual','household',"
            "'household_member','project_beneficiary') "
            "ORDER BY tbl_name, name",
          )
          .get();
      // Coalesce the per-row prints into a single buffer so we make one
      // debugPrint call instead of N+1. debugPrint on Android is a logcat
      // syscall; batching cuts the syscall overhead materially even in
      // debug mode.
      final buf = StringBuffer('[IndexDiag] indexes found:\n');
      for (final row in idx) {
        buf.writeln(
            '  ${row.read<String>("tbl_name")}.${row.read<String>("name")}');
      }
      debugPrint(buf.toString());

      final plan = await sql
          .customSelect(
            "EXPLAIN QUERY PLAN "
            "SELECT * FROM identifier "
            "WHERE individual_client_reference_id = 'PROBE_VALUE_SHOULD_NOT_EXIST'",
          )
          .get();
      final planBuf = StringBuffer('[IndexDiag] plan for identifier lookup:\n');
      for (final row in plan) {
        planBuf.writeln('  ${row.data}');
      }
      debugPrint(planBuf.toString());
    } catch (e) {
      debugPrint('[IndexDiag] failed: $e');
    }
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

  /// Infers the primary key field name based on the actual table schema.
  /// Falls back to 'id' for tables that don't have a clientReferenceId column.
  String _inferPrimaryKeyField(String tableName) {
    try {
      final table = sql.allTables.firstWhere(
        (t) => t.actualTableName == QueryBuilder.camelToSnake(tableName),
      );
      final hasClientRef =
          table.$columns.any((c) => c.$name == 'client_reference_id');
      return hasClientRef ? 'clientReferenceId' : 'id';
    } catch (_) {
      return 'clientReferenceId';
    }
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
    // Fire-and-forget — running two SQL queries + prints in front of the
    // real search adds tens of ms of blocking on the first tap of a
    // session (the diagnostic guard ensures it only runs once anyway).
    // Detach with unawaited so the actual search proceeds immediately.
    unawaited(_logIndexDiagnostics());
    final overallSw = Stopwatch()..start();
    final queriedModels = <String>{};
    final modelToResults = <String, List<Map<String, dynamic>>>{};
    var totalCount = 0;

    // Step 1: Build SQL-level subquery constraints for cross-table filters.
    final stepSw = Stopwatch()..start();
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
    debugPrint(
        '[SearchPerf] buildConstraints=${stepSw.elapsedMilliseconds}ms '
        '(primaryFilters=${primaryFilters.length}, crossTable=${crossTableConstraints.length})');

    if (primaryFilters.isEmpty && crossTableConstraints.isEmpty) {
      throw ArgumentError('No applicable filters for primary table query.');
    }

    // Step 2: Primary table query (data + count)
    stepSw
      ..reset()
      ..start();
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
      extraConstraints: crossTableConstraints,
    );
    debugPrint(
        '[SearchPerf] primaryQuery=${stepSw.elapsedMilliseconds}ms '
        '(rows=${primaryResults.length}, totalCount=$totalCount)');

    // Step 3: Hydrate primary table results with nested data
    stepSw
      ..reset()
      ..start();
    final hydratedPrimary = await HydrationHelper.hydrateRawRows(
      sql,
      this,
      primaryResults,
      nestedModelMapping,
      primaryTable,
    );
    debugPrint(
        '[SearchPerf] hydratePrimary=${stepSw.elapsedMilliseconds}ms');

    modelToResults[primaryTable] = hydratedPrimary;
    queriedModels.add(primaryTable);

    // Step 4: Expand to other selected models via relationships
    stepSw
      ..reset()
      ..start();
    await _expandToRelatedModels(
      select: select,
      primaryTable: primaryTable,
      queriedModels: queriedModels,
      modelToResults: modelToResults,
      relationshipGraph: relationshipGraph,
      nestedModelMapping: nestedModelMapping,
    );
    debugPrint(
        '[SearchPerf] expandRelated=${stepSw.elapsedMilliseconds}ms '
        '(models=${modelToResults.keys.toList()})');

    // Step 5: Convert results to EntityModel instances
    stepSw
      ..reset()
      ..start();
    final groupedResults = _convertToEntityModels(
      modelToResults: modelToResults,
      select: select,
    );
    debugPrint(
        '[SearchPerf] convertEntities=${stepSw.elapsedMilliseconds}ms');

    debugPrint(
        '[SearchPerf] TOTAL=${overallSw.elapsedMilliseconds}ms '
        'primary=$primaryTable, pageSize=${primaryResults.length}');

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
      final modelSw = Stopwatch()..start();

      final pathSw = Stopwatch()..start();
      final path = await RelationshipGraphHelper.findShortestPath(
        fromModels: queriedModels,
        toModel: model,
        graph: relationshipGraph,
      );
      final pathMs = pathSw.elapsedMilliseconds;

      if (path.isEmpty) {
        _log('No relationship path found to model: $model. Skipping.');
        continue;
      }

      final traverseSw = Stopwatch()..start();
      final expandedRows = await _traverseRelationshipPath(
        path: path,
        modelToResults: modelToResults,
      );
      final traverseMs = traverseSw.elapsedMilliseconds;

      if (expandedRows.isEmpty) {
        debugPrint(
            '[ExpandPerf] $model EMPTY pathHops=${path.length} traverse=${traverseMs}ms');
        _log('No rows found for model: $model after relationship traversal.');
        continue;
      }

      // Hydrate the expanded rows
      final hydrateSw = Stopwatch()..start();
      final hydratedRows = await HydrationHelper.hydrateRawRows(
        sql,
        this,
        expandedRows,
        nestedModelMapping,
        model,
      );
      final hydrateMs = hydrateSw.elapsedMilliseconds;

      modelToResults[model] = hydratedRows;
      queriedModels.add(model);

      debugPrint(
          '[ExpandPerf] $model rows=${hydratedRows.length} pathHops=${path.length} '
          'path=${pathMs}ms traverse=${traverseMs}ms hydrate=${hydrateMs}ms total=${modelSw.elapsedMilliseconds}ms');
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
          _logError('Failed to convert row to $rowModelName entity', e,
              StackTrace.current);
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

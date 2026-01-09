/// MultiTableFilterResolver provides utilities for resolving filters across multiple tables.
///
/// This helper enables filtering on related tables by:
/// 1. Grouping filters by their root table
/// 2. Resolving non-primary table filters to primary table key constraints
/// 3. Supporting both AND (intersection) and OR (union) logic for multi-table filters

import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_crud_bloc/repositories/helpers/query_builder.dart';
import 'package:digit_crud_bloc/repositories/helpers/relationship_graph_helper.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/foundation.dart';

/// Result of multi-table filter resolution containing the resolved constraints
/// to be applied to the primary table query.
class MultiTableFilterResult {
  /// Filters that apply directly to the primary table.
  final List<SearchFilter> primaryTableFilters;

  /// Additional primary key constraints derived from related table filters.
  /// These are the IDs that satisfy filters on related tables.
  final Set<dynamic> resolvedPrimaryKeyConstraints;

  /// Whether any related table filters were processed.
  final bool hasRelatedTableFilters;

  /// Whether the resolution resulted in an empty constraint set,
  /// meaning no results should be returned.
  final bool isEmptyResult;

  const MultiTableFilterResult({
    required this.primaryTableFilters,
    required this.resolvedPrimaryKeyConstraints,
    required this.hasRelatedTableFilters,
    required this.isEmptyResult,
  });

  /// Creates an empty result indicating no matching records.
  const MultiTableFilterResult.empty()
      : primaryTableFilters = const [],
        resolvedPrimaryKeyConstraints = const {},
        hasRelatedTableFilters = true,
        isEmptyResult = true;

  /// Creates a result with only primary table filters (no related table filters).
  factory MultiTableFilterResult.primaryOnly(List<SearchFilter> filters) {
    return MultiTableFilterResult(
      primaryTableFilters: filters,
      resolvedPrimaryKeyConstraints: const {},
      hasRelatedTableFilters: false,
      isEmptyResult: false,
    );
  }
}

/// Resolves filters across multiple tables to produce constraints for the primary table.
class MultiTableFilterResolver {
  final LocalSqlDataStore _sql;
  final Map<String, List<RelationshipMapping>> _relationshipGraph;

  MultiTableFilterResolver({
    required LocalSqlDataStore sql,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
  })  : _sql = sql,
        _relationshipGraph = relationshipGraph;

  /// Resolves all filters and returns constraints to apply to the primary table.
  ///
  /// [filters] - All search filters, potentially spanning multiple tables.
  /// [primaryTable] - The primary table name (results will be from this table).
  /// [primaryKeyField] - The primary key field name for the primary table.
  /// [filterLogic] - How to combine filters across tables (AND/OR).
  ///
  /// Returns a [MultiTableFilterResult] containing:
  /// - Filters for the primary table
  /// - Resolved primary key constraints from related tables
  /// - Metadata about the resolution
  Future<MultiTableFilterResult> resolveFilters({
    required List<SearchFilter> filters,
    required String primaryTable,
    required String primaryKeyField,
    required MultiTableFilterLogic filterLogic,
  }) async {
    if (filters.isEmpty) {
      return const MultiTableFilterResult(
        primaryTableFilters: [],
        resolvedPrimaryKeyConstraints: {},
        hasRelatedTableFilters: false,
        isEmptyResult: false,
      );
    }

    // Group filters by their root table
    final filtersByTable = _groupFiltersByTable(filters);

    // Extract primary table filters
    final primaryTableFilters = filtersByTable[primaryTable] ?? [];

    // Get tables that have filters but are not the primary table
    final relatedTablesWithFilters = filtersByTable.keys
        .where((table) => table != primaryTable)
        .toList();

    // If no related table filters, return primary filters only
    if (relatedTablesWithFilters.isEmpty) {
      return MultiTableFilterResult.primaryOnly(primaryTableFilters);
    }

    // Resolve each related table's filters to primary key constraints
    final resolvedConstraintSets = <Set<dynamic>>[];

    for (final relatedTable in relatedTablesWithFilters) {
      final relatedFilters = filtersByTable[relatedTable]!;

      try {
        final constraintSet = await _resolveRelatedTableToPrimaryKeys(
          relatedTable: relatedTable,
          relatedFilters: relatedFilters,
          primaryTable: primaryTable,
          primaryKeyField: primaryKeyField,
        );

        // If AND logic and we got empty set, entire result is empty
        if (filterLogic == MultiTableFilterLogic.and && constraintSet.isEmpty) {
          _log('No matching records found for filters on table: $relatedTable');
          return const MultiTableFilterResult.empty();
        }

        resolvedConstraintSets.add(constraintSet);
      } catch (e, stackTrace) {
        _logError(
          'Failed to resolve filters for table: $relatedTable',
          e,
          stackTrace,
        );
        // Re-throw to let caller handle the error appropriately
        rethrow;
      }
    }

    // Combine constraint sets based on filter logic
    final combinedConstraints = _combineConstraintSets(
      resolvedConstraintSets,
      filterLogic,
    );

    // If combined constraints are empty after AND logic, no results
    if (filterLogic == MultiTableFilterLogic.and &&
        resolvedConstraintSets.isNotEmpty &&
        combinedConstraints.isEmpty) {
      return const MultiTableFilterResult.empty();
    }

    return MultiTableFilterResult(
      primaryTableFilters: primaryTableFilters,
      resolvedPrimaryKeyConstraints: combinedConstraints,
      hasRelatedTableFilters: true,
      isEmptyResult: false,
    );
  }

  /// Groups filters by their root table name.
  Map<String, List<SearchFilter>> _groupFiltersByTable(
    List<SearchFilter> filters,
  ) {
    final grouped = <String, List<SearchFilter>>{};
    for (final filter in filters) {
      grouped.putIfAbsent(filter.root, () => []).add(filter);
    }
    return grouped;
  }

  /// Resolves filters on a related table to primary key values.
  ///
  /// This method:
  /// 1. Queries the related table with its filters
  /// 2. Finds the relationship path from related table to primary table
  /// 3. Traverses the path to collect primary key values
  Future<Set<dynamic>> _resolveRelatedTableToPrimaryKeys({
    required String relatedTable,
    required List<SearchFilter> relatedFilters,
    required String primaryTable,
    required String primaryKeyField,
  }) async {
    // Step 1: Query the related table with its filters
    final relatedRows = await QueryBuilder.queryRawTable(
      sql: _sql,
      table: relatedTable,
      filters: relatedFilters,
      select: ['*'],
      isPrimaryTable: false,
    );

    if (relatedRows.isEmpty) {
      _log('No rows found in $relatedTable matching filters');
      return {};
    }

    _log('Found ${relatedRows.length} rows in $relatedTable matching filters');

    // Step 2: Find relationship path from related table to primary table
    final pathToPrimary = await RelationshipGraphHelper.findShortestPath(
      fromModels: {relatedTable},
      toModel: primaryTable,
      graph: _relationshipGraph,
    );

    if (pathToPrimary.isEmpty) {
      throw StateError(
        'No relationship path found from "$relatedTable" to "$primaryTable". '
        'Ensure RelationshipMapping is configured for these tables.',
      );
    }

    _log(
      'Relationship path: ${_formatPath(relatedTable, pathToPrimary, primaryTable)}',
    );

    // Step 3: Traverse the path to reach primary table
    final primaryKeyValues = await _traversePathToPrimaryKeys(
      startRows: relatedRows,
      path: pathToPrimary,
      primaryKeyField: primaryKeyField,
    );

    _log(
      'Resolved ${primaryKeyValues.length} primary key values from $relatedTable',
    );

    return primaryKeyValues;
  }

  /// Traverses a relationship path and returns the primary key values.
  Future<Set<dynamic>> _traversePathToPrimaryKeys({
    required List<Map<String, dynamic>> startRows,
    required List<RelationshipMapping> path,
    required String primaryKeyField,
  }) async {
    var currentRows = startRows;

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
        _log('No join values found at step ${i + 1} (${rel.from} -> ${rel.to})');
        return {};
      }

      // Query next table in the path
      final nextRows = await QueryBuilder.queryRawTable(
        sql: _sql,
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

      if (nextRows.isEmpty) {
        _log('No rows found in $toTable for join at step ${i + 1}');
        return {};
      }

      currentRows = nextRows;

      // If this is the last step, extract primary key values
      if (isLastStep) {
        final primaryKeySnake = QueryBuilder.camelToSnake(primaryKeyField);
        return currentRows
            .map((row) => row[primaryKeySnake])
            .where((v) => v != null)
            .toSet();
      }
    }

    return {};
  }

  /// Combines multiple constraint sets based on the filter logic.
  Set<dynamic> _combineConstraintSets(
    List<Set<dynamic>> sets,
    MultiTableFilterLogic logic,
  ) {
    if (sets.isEmpty) return {};
    if (sets.length == 1) return sets.first;

    switch (logic) {
      case MultiTableFilterLogic.and:
        // Intersection: only IDs present in ALL sets
        return sets.reduce((a, b) => a.intersection(b));

      case MultiTableFilterLogic.or:
        // Union: IDs present in ANY set
        return sets.reduce((a, b) => a.union(b));
    }
  }

  /// Formats a relationship path for logging.
  String _formatPath(
    String from,
    List<RelationshipMapping> path,
    String to,
  ) {
    if (path.isEmpty) return '$from -> $to (direct)';

    final steps = path.map((r) => '${r.from} -> ${r.to}').join(' -> ');
    return steps;
  }

  /// Logs debug information in debug mode only.
  void _log(String message) {
    if (kDebugMode) {
      debugPrint('[MultiTableFilterResolver] $message');
    }
  }

  /// Logs error information.
  void _logError(String message, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      debugPrint('[MultiTableFilterResolver] ERROR: $message');
      debugPrint('Error: $error');
      debugPrint('StackTrace: $stackTrace');
    }
  }
}

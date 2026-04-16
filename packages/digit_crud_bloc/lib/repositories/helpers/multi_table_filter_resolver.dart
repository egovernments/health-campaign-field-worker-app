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

  /// Primary key constraints to EXCLUDE from results.
  /// These are IDs that should NOT appear in results (used by notExists operator).
  final Set<dynamic> excludedPrimaryKeyConstraints;

  /// Whether any related table filters were processed.
  final bool hasRelatedTableFilters;

  /// Whether the resolution resulted in an empty constraint set,
  /// meaning no results should be returned.
  final bool isEmptyResult;

  const MultiTableFilterResult({
    required this.primaryTableFilters,
    required this.resolvedPrimaryKeyConstraints,
    this.excludedPrimaryKeyConstraints = const {},
    required this.hasRelatedTableFilters,
    required this.isEmptyResult,
  });

  /// Creates an empty result indicating no matching records.
  const MultiTableFilterResult.empty()
      : primaryTableFilters = const [],
        resolvedPrimaryKeyConstraints = const {},
        excludedPrimaryKeyConstraints = const {},
        hasRelatedTableFilters = true,
        isEmptyResult = true;

  /// Creates a result with only primary table filters (no related table filters).
  factory MultiTableFilterResult.primaryOnly(List<SearchFilter> filters) {
    return MultiTableFilterResult(
      primaryTableFilters: filters,
      resolvedPrimaryKeyConstraints: const {},
      excludedPrimaryKeyConstraints: const {},
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

    _log('DEBUG: primaryTable=$primaryTable, tables with filters: ${filtersByTable.keys.toList()}');
    for (final entry in filtersByTable.entries) {
      for (final f in entry.value) {
        _log('DEBUG:   table=${entry.key}: field=${f.field}, op=${f.operator}, value=${f.value}');
      }
    }

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

    // Separate notExists filters from regular filters.
    // Further split notExists into:
    //   - scoped (value is Map with 'scope' key) → produces INCLUSION constraints
    //   - non-scoped → produces EXCLUSION constraints (legacy behavior)
    final notExistsFilters = <String, List<SearchFilter>>{};
    final scopedNotExistsFilters = <SearchFilter>[];
    final regularRelatedTables = <String>[];

    for (final relatedTable in relatedTablesWithFilters) {
      final relatedFilters = filtersByTable[relatedTable]!;
      final hasNotExists = relatedFilters.any((f) => f.operator == 'notExists');

      if (hasNotExists) {
        final nonScopedForThisTable = <SearchFilter>[];
        for (final f in relatedFilters) {
          if (f.operator == 'notExists' && _isScopedValue(f.value)) {
            scopedNotExistsFilters.add(f);
          } else {
            nonScopedForThisTable.add(f);
          }
        }
        if (nonScopedForThisTable.isNotEmpty) {
          notExistsFilters[relatedTable] = nonScopedForThisTable;
        }
      } else {
        regularRelatedTables.add(relatedTable);
      }
    }

    // Resolve regular related table filters to primary key constraints
    final resolvedConstraintSets = <Set<dynamic>>[];

    for (final relatedTable in regularRelatedTables) {
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

    // Resolve scoped notExists: find scope-level entities that LACK matching
    // related rows, then traverse from scope to primary → INCLUDE those keys.
    //
    // Example: notExists with scope=projectBeneficiary on task.status=SUCCESS
    // finds projectBeneficiaries WITHOUT a SUCCESS task, then gets their
    // household IDs → include those households.
    for (final scopedFilter in scopedNotExistsFilters) {
      try {
        final includedKeys = await _resolveScopedNotExists(
          scopedFilter: scopedFilter,
          primaryTable: primaryTable,
          primaryKeyField: primaryKeyField,
        );

        if (filterLogic == MultiTableFilterLogic.and && includedKeys.isEmpty) {
          _log('Scoped notExists: No matching records, returning empty');
          return const MultiTableFilterResult.empty();
        }

        resolvedConstraintSets.add(includedKeys);
      } catch (e, stackTrace) {
        _logError('Failed to resolve scoped notExists', e, stackTrace);
        rethrow;
      }
    }

    // Resolve non-scoped notExists filters: find primary keys that DO have
    // rows in the related table matching the filter criteria, then exclude them.
    //
    // Semantics:
    // - If the notExists filter has a meaningful field+value (e.g.,
    //   {field: status, value: [ADMINISTRATION_SUCCESS], op: notExists}),
    //   the resolver finds primary keys whose related rows MATCH that
    //   criteria, and excludes them. This means "find primary keys with NO
    //   related row matching the given filter".
    // - If the filter is a placeholder (e.g., value="true" on an id field),
    //   the resolver falls back to the legacy behavior of excluding any
    //   primary key that has ANY related row.
    final excludedConstraints = <Set<dynamic>>[];

    for (final entry in notExistsFilters.entries) {
      final relatedTable = entry.key;
      final relatedFilters = entry.value;

      try {
        // Convert notExists filters to equivalent regular filters (in/equals)
        // so we can find primary keys whose related rows match the criteria.
        // Skip placeholder filters (where value is a boolean-like string on
        // an id field) to preserve legacy behavior.
        final matchingFilters = <SearchFilter>[];
        for (final f in relatedFilters) {
          if (f.operator != 'notExists') {
            matchingFilters.add(f);
            continue;
          }

          final isPlaceholderValue =
              f.value == null ||
                  f.value == 'true' ||
                  f.value == 'false' ||
                  f.value == true ||
                  f.value == false;
          final isIdField = f.field == 'clientReferenceId' ||
              f.field == 'id';

          if (isPlaceholderValue && isIdField) {
            // Legacy placeholder pattern — skip adding a matching filter so
            // we fall through to "all rows" behavior below.
            continue;
          }

          // Convert to equivalent positive filter
          final positiveOp = f.value is List ? 'in' : 'equals';
          matchingFilters.add(SearchFilter(
            field: f.field,
            operator: positiveOp,
            value: f.value,
            root: f.root,
          ));
        }

        // If no real matching filters were produced, fall back to the legacy
        // "exclude any primary key with any related row" behavior.
        final filtersToUse = matchingFilters.any((f) => f.operator != 'notExists')
            ? matchingFilters
            : <SearchFilter>[];

        final allRelatedKeys = await _resolveRelatedTableToPrimaryKeys(
          relatedTable: relatedTable,
          relatedFilters: filtersToUse,
          primaryTable: primaryTable,
          primaryKeyField: primaryKeyField,
        );

        _log('notExists: Found ${allRelatedKeys.length} primary keys with matching rows in $relatedTable - these will be excluded (filtersUsed=${filtersToUse.length})');
        excludedConstraints.add(allRelatedKeys);
      } catch (e, stackTrace) {
        _logError(
          'Failed to resolve notExists filters for table: $relatedTable',
          e,
          stackTrace,
        );
        rethrow;
      }
    }

    // Combine regular constraint sets based on filter logic
    final combinedConstraints = _combineConstraintSets(
      resolvedConstraintSets,
      filterLogic,
    );

    // Combine excluded constraint sets (union - exclude all)
    final combinedExcluded = excludedConstraints.isEmpty
        ? <dynamic>{}
        : excludedConstraints.reduce((a, b) => a.union(b));

    // If combined constraints are empty after resolution, no results
    if (resolvedConstraintSets.isNotEmpty && combinedConstraints.isEmpty) {
      // For AND logic: intersection is empty → no results
      // For OR logic: union is empty → no related rows matched, and if
      //   there are no primary table filters either, return empty
      if (filterLogic == MultiTableFilterLogic.and ||
          (primaryTableFilters.isEmpty && excludedConstraints.isEmpty)) {
        return const MultiTableFilterResult.empty();
      }
    }

    return MultiTableFilterResult(
      primaryTableFilters: primaryTableFilters,
      resolvedPrimaryKeyConstraints: combinedConstraints,
      excludedPrimaryKeyConstraints: combinedExcluded,
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

  /// Returns true if [value] encodes a scoped notExists filter.
  /// Scoped values are Maps with 'scope' and 'values' keys.
  bool _isScopedValue(dynamic value) {
    return value is Map && value.containsKey('scope') && value.containsKey('values');
  }

  /// Resolves a scoped notExists filter to primary key values to INCLUDE.
  ///
  /// This implements "at least one scope-level entity lacks a matching related
  /// row" semantics. For example, with scope=projectBeneficiary and
  /// root=task, this finds projectBeneficiaries WITHOUT a matching task,
  /// then traverses to household to get primary keys to include.
  ///
  /// Steps:
  /// 1. Query related table with positive filter → traverse to scope → get
  ///    scope keys WITH match
  /// 2. Query ALL scope rows → get all scope keys
  /// 3. Subtract to get scope keys WITHOUT match
  /// 4. Traverse scope → primary table → get primary keys to INCLUDE
  Future<Set<dynamic>> _resolveScopedNotExists({
    required SearchFilter scopedFilter,
    required String primaryTable,
    required String primaryKeyField,
  }) async {
    final valueMap = scopedFilter.value as Map;
    final scope = valueMap['scope'] as String;
    final actualValues = valueMap['values'];
    final relatedTable = scopedFilter.root;

    _log('Scoped notExists: scope=$scope, related=$relatedTable, '
        'field=${scopedFilter.field}, values=$actualValues');

    // Step 1: Find scope keys that HAVE matching related rows.
    // Query related table with a positive version of the filter, then
    // traverse from related table → scope table.
    final positiveOp = actualValues is List ? 'in' : 'equals';
    final positiveFilter = SearchFilter(
      field: scopedFilter.field,
      operator: positiveOp,
      value: actualValues,
      root: relatedTable,
    );

    // Find path from related table to scope table
    final pathToScope = await RelationshipGraphHelper.findShortestPath(
      fromModels: {relatedTable},
      toModel: scope,
      graph: _relationshipGraph,
    );

    Set<dynamic> scopeKeysWithMatch;
    if (pathToScope.isEmpty) {
      // No path: maybe related and scope are the same table, or no relation
      _log('Scoped notExists: No path from $relatedTable to $scope, '
          'assuming no scope keys with match');
      scopeKeysWithMatch = {};
    } else {
      // Query related table with positive filter
      final matchingRelatedRows = await QueryBuilder.queryRawTable(
        sql: _sql,
        table: relatedTable,
        filters: [positiveFilter],
        select: ['*'],
        isPrimaryTable: false,
      );

      if (matchingRelatedRows.isEmpty) {
        scopeKeysWithMatch = {};
      } else {
        // Traverse from related rows → scope table to get scope keys
        scopeKeysWithMatch = await _traversePathToPrimaryKeys(
          startRows: matchingRelatedRows,
          path: pathToScope,
          primaryKeyField: 'clientReferenceId',
        );
      }
    }

    _log('Scoped notExists: ${scopeKeysWithMatch.length} $scope keys '
        'WITH matching $relatedTable rows');

    // Step 2: Get ALL scope keys
    final allScopeRows = await QueryBuilder.queryRawTable(
      sql: _sql,
      table: scope,
      filters: [],
      select: ['*'],
      isPrimaryTable: false,
    );

    if (allScopeRows.isEmpty) {
      _log('Scoped notExists: No rows in scope table $scope');
      return {};
    }

    final scopeKeySnake = QueryBuilder.camelToSnake('clientReferenceId');
    final allScopeKeys = allScopeRows
        .map((row) => row[scopeKeySnake])
        .where((v) => v != null)
        .toSet();

    _log('Scoped notExists: ${allScopeKeys.length} total $scope keys');

    // Step 3: Subtract to get scope keys WITHOUT matching related rows
    final scopeKeysWithoutMatch = allScopeKeys.difference(scopeKeysWithMatch);

    _log('Scoped notExists: ${scopeKeysWithoutMatch.length} $scope keys '
        'WITHOUT matching $relatedTable rows');

    if (scopeKeysWithoutMatch.isEmpty) {
      return {};
    }

    // Step 4: Traverse scope → primary table to get primary keys to INCLUDE.
    // Filter scope rows to only those without match.
    final scopeRowsWithoutMatch = allScopeRows
        .where((row) => scopeKeysWithoutMatch.contains(row[scopeKeySnake]))
        .toList();

    final pathToPrimary = await RelationshipGraphHelper.findShortestPath(
      fromModels: {scope},
      toModel: primaryTable,
      graph: _relationshipGraph,
    );

    if (pathToPrimary.isEmpty) {
      throw StateError(
        'No relationship path from scope "$scope" to primary "$primaryTable". '
        'Ensure RelationshipMapping is configured.',
      );
    }

    _log('Scoped notExists: Path ${_formatPath(scope, pathToPrimary, primaryTable)}');

    final primaryKeys = await _traversePathToPrimaryKeys(
      startRows: scopeRowsWithoutMatch,
      path: pathToPrimary,
      primaryKeyField: primaryKeyField,
    );

    _log('Scoped notExists: Resolved ${primaryKeys.length} primary keys to include');

    return primaryKeys;
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

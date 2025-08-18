import 'dart:async';
import 'dart:convert';

import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_crud_bloc/repositories/helpers/hydration_helper.dart';
import 'package:digit_crud_bloc/repositories/helpers/optimized_query_builder.dart';
import 'package:digit_crud_bloc/repositories/helpers/query_analyzer.dart';
import 'package:digit_crud_bloc/repositories/helpers/query_builder.dart';
import 'package:digit_crud_bloc/utils/utils.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/foundation.dart';

/// QueryExecutor handles the execution of optimized queries and result processing
class QueryExecutors {
  final LocalSqlDataStore sql;
  final Map<String, Map<String, NestedFieldMapping>> nestedModelMapping;
  final dynamic searchEntityRepository; // Avoid circular dependency

  QueryExecutors({
    required this.sql,
    required this.nestedModelMapping,
    this.searchEntityRepository,
  });

  /// Executes queries based on the strategy and returns processed results
  Future<(Map<String, List<EntityModel>>, int)> executeStrategy({
    required QueryStrategy strategy,
    required List<SearchFilter> filters,
    required List<String> selectTables,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    PaginationParams? pagination,
  }) async {
    switch (strategy.type) {
      case QueryStrategyType.single:
        return _executeSingleQuery(
          strategy: strategy,
          filters: filters,
          selectTables: selectTables,
          pagination: pagination,
        );

      case QueryStrategyType.join:
        return _executeJoinQuery(
          strategy: strategy,
          filters: filters,
          selectTables: selectTables,
          relationshipGraph: relationshipGraph,
          pagination: pagination,
        );

      case QueryStrategyType.cte:
        // TODO: Implement CTE execution
        return _executeBatchQuery(
          strategy: strategy,
          filters: filters,
          selectTables: selectTables,
          relationshipGraph: relationshipGraph,
          pagination: pagination,
        );

      case QueryStrategyType.batch:
        return _executeBatchQuery(
          strategy: strategy,
          filters: filters,
          selectTables: selectTables,
          relationshipGraph: relationshipGraph,
          pagination: pagination,
        );

      case QueryStrategyType.parallel:
        return _executeParallelQueries(
          strategy: strategy,
          filters: filters,
          selectTables: selectTables,
          relationshipGraph: relationshipGraph,
          pagination: pagination,
        );
    }
  }

  /// Execute a single table query
  Future<(Map<String, List<EntityModel>>, int)> _executeSingleQuery({
    required QueryStrategy strategy,
    required List<SearchFilter> filters,
    required List<String> selectTables,
    PaginationParams? pagination,
  }) async {
    final table = strategy.tableGroups.first.tables.first;
    final tableFilters = filters.where((f) => f.root == table).toList();

    // Use existing QueryBuilder for single table
    final results = await QueryBuilder.queryRawTable(
      sql: sql,
      table: table,
      filters: tableFilters,
      select: selectTables,
      pagination: pagination,
      isPrimaryTable: strategy.primaryTable == table,
      onCountFetched: (count) {}, // Handle in return
    );

    // Hydrate if needed
    final hydratedResults = strategy.requiresHydration
        ? await HydrationHelper.hydrateRawRows(
            sql,
            searchEntityRepository,
            results,
            nestedModelMapping,
            table,
          )
        : results;

    // Convert to entities
    final entities = _convertToEntities(hydratedResults, table);

    // Get count
    final totalCount =
        pagination != null ? await _getCount(table, tableFilters) : -1;

    return ({table: entities}, totalCount);
  }

  /// Execute an optimized JOIN query
  Future<(Map<String, List<EntityModel>>, int)> _executeJoinQuery({
    required QueryStrategy strategy,
    required List<SearchFilter> filters,
    required List<String> selectTables,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    PaginationParams? pagination,
  }) async {
    // Build the JOIN query
    final builder = JoinQueryBuilder(
      strategy: strategy,
      filters: filters,
      selectTables: selectTables,
      relationshipGraph: relationshipGraph,
      pagination: pagination,
    );

    final queries = builder.buildQueries();

    // Execute queries
    final results = <String, List<Map<String, dynamic>>>{};
    int totalCount = -1;

    for (final query in queries) {
      if (query.type == QueryType.count) {
        // Execute count query
        totalCount = await _executeCountQuery(query);
      } else {
        // Execute main JOIN query
        final rawResults = await _executeRawQuery(query);

        // Process JOIN results into separate tables
        final processedResults = _processJoinResults(
          rawResults: rawResults,
          query: query,
          selectTables: selectTables,
        );

        // Hydrate if needed
        for (final entry in processedResults.entries) {
          final table = entry.key;
          final rows = entry.value;

          if (strategy.requiresHydration &&
              nestedModelMapping.containsKey(table)) {
            final hydrated = await HydrationHelper.hydrateRawRows(
              sql,
              searchEntityRepository,
              rows,
              nestedModelMapping,
              table,
            );
            results[table] = hydrated;
          } else {
            results[table] = rows;
          }
        }
      }
    }

    // Convert to entities
    final entityResults = <String, List<EntityModel>>{};
    for (final entry in results.entries) {
      entityResults[entry.key] = _convertToEntities(entry.value, entry.key);
    }

    return (entityResults, totalCount);
  }

  /// Execute batch queries for complex scenarios
  Future<(Map<String, List<EntityModel>>, int)> _executeBatchQuery({
    required QueryStrategy strategy,
    required List<SearchFilter> filters,
    required List<String> selectTables,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    PaginationParams? pagination,
  }) async {
    final results = <String, List<Map<String, dynamic>>>{};
    int totalCount = -1;

    // Execute queries in optimal order
    for (final table in strategy.executionOrder) {
      if (!selectTables.contains(table)) continue;

      final tableFilters = filters.where((f) => f.root == table).toList();

      // Check if we can use results from previous queries
      final relatedResults = _findRelatedResults(
        targetTable: table,
        currentResults: results,
        relationshipGraph: relationshipGraph,
      );

      List<Map<String, dynamic>> tableResults;

      if (relatedResults != null) {
        // Use IN query with related IDs
        final inFilter = SearchFilter(
          root: table,
          field: relatedResults.foreignKey,
          operator: 'in',
          value: relatedResults.ids,
        );

        tableResults = await QueryBuilder.queryRawTable(
          sql: sql,
          table: table,
          filters: [...tableFilters, inFilter],
          select: selectTables,
          pagination: strategy.primaryTable == table ? pagination : null,
          isPrimaryTable: strategy.primaryTable == table,
          onCountFetched: (count) {
            if (strategy.primaryTable == table) totalCount = count;
          },
        );
      } else {
        // Direct query
        tableResults = await QueryBuilder.queryRawTable(
          sql: sql,
          table: table,
          filters: tableFilters,
          select: selectTables,
          pagination: strategy.primaryTable == table ? pagination : null,
          isPrimaryTable: strategy.primaryTable == table,
          onCountFetched: (count) {
            if (strategy.primaryTable == table) totalCount = count;
          },
        );
      }

      // Hydrate if needed
      if (strategy.requiresHydration && nestedModelMapping.containsKey(table)) {
        tableResults = await HydrationHelper.hydrateRawRows(
          sql,
          searchEntityRepository,
          tableResults,
          nestedModelMapping,
          table,
        );
      }

      results[table] = tableResults;
    }

    // Convert to entities
    final entityResults = <String, List<EntityModel>>{};
    for (final entry in results.entries) {
      entityResults[entry.key] = _convertToEntities(entry.value, entry.key);
    }

    return (entityResults, totalCount);
  }

  /// Execute parallel queries for disconnected groups
  Future<(Map<String, List<EntityModel>>, int)> _executeParallelQueries({
    required QueryStrategy strategy,
    required List<SearchFilter> filters,
    required List<String> selectTables,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    PaginationParams? pagination,
  }) async {
    // Create futures for each group
    final futures = <Future<Map<String, List<Map<String, dynamic>>>>>{};

    for (final group in strategy.tableGroups) {
      futures.add(_executeGroupQuery(
        group: group,
        filters: filters,
        selectTables: selectTables,
        relationshipGraph: relationshipGraph,
        pagination:
            group.tables.contains(strategy.primaryTable) ? pagination : null,
        isPrimaryTable: group.tables.contains(strategy.primaryTable),
      ));
    }

    // Execute all groups in parallel
    final groupResults = await Future.wait(futures);

    // Merge results
    final mergedResults = <String, List<Map<String, dynamic>>>{};
    for (final groupResult in groupResults) {
      mergedResults.addAll(groupResult);
    }

    // Convert to entities
    final entityResults = <String, List<EntityModel>>{};
    for (final entry in mergedResults.entries) {
      entityResults[entry.key] = _convertToEntities(entry.value, entry.key);
    }

    // Get count for primary table
    int totalCount = -1;
    if (strategy.primaryTable != null && pagination != null) {
      final primaryFilters =
          filters.where((f) => f.root == strategy.primaryTable).toList();
      totalCount = await _getCount(strategy.primaryTable!, primaryFilters);
    }

    return (entityResults, totalCount);
  }

  /// Execute query for a single group
  Future<Map<String, List<Map<String, dynamic>>>> _executeGroupQuery({
    required TableGroup group,
    required List<SearchFilter> filters,
    required List<String> selectTables,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    PaginationParams? pagination,
    bool isPrimaryTable = false,
  }) async {
    // If group has only one table, use simple query
    if (group.tables.length == 1) {
      final table = group.tables.first;
      final tableFilters = filters.where((f) => f.root == table).toList();

      final results = await QueryBuilder.queryRawTable(
        sql: sql,
        table: table,
        filters: tableFilters,
        select: selectTables,
        pagination: pagination,
        isPrimaryTable: isPrimaryTable,
        onCountFetched: (_) {},
      );

      return {table: results};
    }

    // For multiple tables in group, use appropriate strategy
    // This is a simplified version - in production, recursively apply strategy
    final results = <String, List<Map<String, dynamic>>>{};

    for (final table in group.tables) {
      if (!selectTables.contains(table)) continue;

      final tableFilters = filters.where((f) => f.root == table).toList();
      final tableResults = await QueryBuilder.queryRawTable(
        sql: sql,
        table: table,
        filters: tableFilters,
        select: selectTables,
        pagination: table == group.tables.first ? pagination : null,
        isPrimaryTable: isPrimaryTable && table == group.tables.first,
        onCountFetched: (_) {},
      );

      results[table] = tableResults;
    }

    return results;
  }

  /// Execute a raw SQL query
  Future<List<Map<String, dynamic>>> _executeRawQuery(QuerySpec query) async {
    try {
      final result = sql.customSelect(
        query.sql,
        variables: query.variables,
        readsFrom: {}, // Let Drift determine this
      );

      final rows = await result.get();

      // Convert QueryRow to Map
      final results = <Map<String, dynamic>>[];
      for (final row in rows) {
        final rowMap = <String, dynamic>{};

        // Extract all columns from the row
        // This is simplified - in production, use proper column mapping
        for (final table in query.resultTables) {
          final alias = query.tableAliases[table] ?? table;

          // Try to read columns for this table
          try {
            // Read table name indicator
            final tableName = row.read<String?>('${alias}_table_name');
            if (tableName != null) {
              rowMap['modelName'] = tableName;
            }

            // Read all columns (simplified - needs proper implementation)
            // In production, iterate through actual table columns
            final tableData = row.data;
            for (final entry in tableData.entries) {
              if (entry.key.startsWith('${alias}_') ||
                  query.tableAliases.isEmpty) {
                rowMap[entry.key] = entry.value;
              }
            }
          } catch (e) {
            debugPrint('Error reading columns for $table: $e');
          }
        }

        results.add(rowMap);
      }

      return results;
    } catch (e) {
      debugPrint('Query execution failed: $e');
      debugPrint('Query SQL: ${query.sql}');
      rethrow;
    }
  }

  /// Execute a count query
  Future<int> _executeCountQuery(QuerySpec query) async {
    try {
      final result = sql.customSelect(
        query.sql,
        variables: query.variables,
      );

      final rows = await result.get();
      if (rows.isNotEmpty) {
        return rows.first.read<int>('total');
      }
      return 0;
    } catch (e) {
      debugPrint('Count query failed: $e');
      return 0;
    }
  }

  /// Process JOIN query results into separate table results
  Map<String, List<Map<String, dynamic>>> _processJoinResults({
    required List<Map<String, dynamic>> rawResults,
    required QuerySpec query,
    required List<String> selectTables,
  }) {
    final processedResults = <String, List<Map<String, dynamic>>>{};

    // Group results by table
    for (final row in rawResults) {
      for (final table in query.resultTables) {
        if (!selectTables.contains(table)) continue;

        final alias = query.tableAliases[table] ?? table;
        final tableData = <String, dynamic>{};

        // Extract columns for this table
        for (final entry in row.entries) {
          if (entry.key == '${alias}_table_name') {
            tableData['modelName'] = QueryBuilder.snakeToCamel(table);
          } else if (entry.key.startsWith('${alias}_')) {
            // Remove alias prefix from column name
            final columnName = entry.key.substring('${alias}_'.length);
            tableData[columnName] = entry.value;
          } else if (query.tableAliases.isEmpty &&
              !entry.key.contains('_table_name')) {
            // No aliases, include all columns
            tableData[entry.key] = entry.value;
          }
        }

        if (tableData.isNotEmpty) {
          processedResults.putIfAbsent(table, () => []).add(tableData);
        }
      }
    }

    // Remove duplicates based on ID
    for (final entry in processedResults.entries) {
      final seen = <String>{};
      final unique = <Map<String, dynamic>>[];

      for (final row in entry.value) {
        final id = row['id']?.toString() ?? '';
        if (id.isNotEmpty && !seen.contains(id)) {
          seen.add(id);
          unique.add(row);
        } else if (id.isEmpty) {
          unique.add(row); // Keep rows without ID
        }
      }

      processedResults[entry.key] = unique;
    }

    return processedResults;
  }

  /// Find related results from previous queries
  ({List<dynamic> ids, String foreignKey})? _findRelatedResults({
    required String targetTable,
    required Map<String, List<Map<String, dynamic>>> currentResults,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
  }) {
    for (final entry in currentResults.entries) {
      final sourceTable = entry.key;
      final sourceRows = entry.value;

      // Find relationship from source to target
      final relationships = relationshipGraph[sourceTable] ?? [];
      final relationship = relationships.firstWhere(
        (r) => r.to == targetTable,
        orElse: () => RelationshipMapping(
          from: '',
          to: '',
          localKey: '',
          foreignKey: '',
        ),
      );

      if (relationship.from.isNotEmpty) {
        // Extract IDs from source results
        final ids = sourceRows
            .map((row) => row[QueryBuilder.camelToSnake(relationship.localKey)])
            .where((id) => id != null)
            .toSet()
            .toList();

        if (ids.isNotEmpty) {
          return (ids: ids, foreignKey: relationship.foreignKey);
        }
      }
    }

    return null;
  }

  /// Get count for a table with filters
  Future<int> _getCount(String table, List<SearchFilter> filters) async {
    final whereClause = QueryBuilder.buildWhereClauseRaw(filters);
    final whereArgs = QueryBuilder.buildWhereArgs(filters);

    final query = sql.customSelect(
      'SELECT COUNT(*) as total FROM ${QueryBuilder.camelToSnake(table)} WHERE $whereClause',
      variables: whereArgs,
    );

    final result = await query.get();
    if (result.isNotEmpty) {
      return result.first.read<int>('total');
    }
    return 0;
  }

  /// Convert raw results to entity models
  List<EntityModel> _convertToEntities(
    List<Map<String, dynamic>> results,
    String table,
  ) {
    final entities = <EntityModel>[];

    for (final row in results) {
      try {
        // Ensure modelName is set correctly
        row['modelName'] = table;

        // Handle additional_fields JSON
        if (row.containsKey('additional_fields')) {
          final raw = row['additional_fields'];
          if (raw is String && raw.trim().isNotEmpty) {
            try {
              final decoded = jsonDecode(raw);
              if (decoded is Map<String, dynamic>) {
                row['additional_fields'] = decoded;
              }
            } catch (e) {
              debugPrint('Failed to decode additional_fields: $e');
            }
          }
        }

        // Convert snake_case to camelCase
        final camelRow = QueryBuilder.snakeToCamelDeep(row);

        // Create entity using dynamic model listener
        final entity = CrudBlocSingleton.instance.dynamicEntityModelListener
            .dynamicEntityModelFromMap(
          QueryBuilder.snakeToCamel(table),
          camelRow,
        );

        if (entity != null) {
          entities.add(entity);
        }
      } catch (e) {
        debugPrint('Failed to convert row to entity: $e');
      }
    }

    return entities;
  }
}

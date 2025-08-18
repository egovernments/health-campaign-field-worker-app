import 'package:digit_crud_bloc/models/global_search_params.dart';

/// QueryAnalyzer analyzes search queries to determine the optimal execution strategy.
/// It evaluates relationships, complexity, and data patterns to choose between
/// JOIN, CTE, batch, or parallel query strategies.

enum QueryStrategyType {
  single,    // Single table query
  join,      // 2-3 table JOIN query
  cte,       // Common Table Expression for 4-5 tables
  batch,     // Batch queries for complex relationships
  parallel,  // Parallel execution for disconnected groups
}

class QueryStrategy {
  final QueryStrategyType type;
  final List<TableGroup> tableGroups;
  final Map<String, QueryComplexity> complexityMap;
  final List<String> executionOrder;
  final bool requiresHydration;
  final String? primaryTable;

  const QueryStrategy({
    required this.type,
    required this.tableGroups,
    required this.complexityMap,
    required this.executionOrder,
    this.requiresHydration = false,
    this.primaryTable,
  });
}

class TableGroup {
  final Set<String> tables;
  final List<RelationshipMapping> relationships;
  final List<SearchFilter> filters;
  final bool isConnected;
  final int depth; // Relationship depth from root

  const TableGroup({
    required this.tables,
    required this.relationships,
    required this.filters,
    required this.isConnected,
    required this.depth,
  });
}

class QueryComplexity {
  final String table;
  final int relationshipCount;
  final int filterCount;
  final bool hasNestedModels;
  final bool hasManyToMany;
  final int estimatedRows;
  final double complexityScore;

  const QueryComplexity({
    required this.table,
    required this.relationshipCount,
    required this.filterCount,
    required this.hasNestedModels,
    required this.hasManyToMany,
    required this.estimatedRows,
    required this.complexityScore,
  });
}

class QueryAnalyzer {
  final Map<String, List<RelationshipMapping>> relationshipGraph;
  final Map<String, Map<String, NestedFieldMapping>> nestedModelMapping;

  QueryAnalyzer({
    required this.relationshipGraph,
    required this.nestedModelMapping,
  });

  /// Analyzes the query and returns the optimal strategy
  QueryStrategy analyzeQuery({
    required List<SearchFilter> filters,
    required List<String> selectTables,
    String? primaryTable,
  }) {
    // Step 1: Group filters by root table
    final filtersByRoot = _groupFiltersByRoot(filters);
    
    // Step 2: Build table groups based on relationships
    final tableGroups = _buildTableGroups(
      filtersByRoot,
      selectTables,
    );
    
    // Step 3: Calculate complexity for each table
    final complexityMap = _calculateComplexity(
      tableGroups,
      filtersByRoot,
    );
    
    // Step 4: Determine optimal strategy
    final strategy = _selectOptimalStrategy(
      tableGroups,
      complexityMap,
      primaryTable,
    );
    
    return strategy;
  }

  Map<String, List<SearchFilter>> _groupFiltersByRoot(
    List<SearchFilter> filters,
  ) {
    final grouped = <String, List<SearchFilter>>{};
    for (final filter in filters) {
      grouped.putIfAbsent(filter.root, () => []).add(filter);
    }
    return grouped;
  }

  List<TableGroup> _buildTableGroups(
    Map<String, List<SearchFilter>> filtersByRoot,
    List<String> selectTables,
  ) {
    final allTables = <String>{
      ...filtersByRoot.keys,
      ...selectTables,
    };
    
    final visited = <String>{};
    final groups = <TableGroup>[];
    
    for (final table in allTables) {
      if (visited.contains(table)) continue;
      
      // Find all connected tables using BFS
      final group = _findConnectedTables(
        startTable: table,
        allTables: allTables,
        visited: visited,
      );
      
      // Calculate relationship depth
      final depth = _calculateDepth(group.tables);
      
      // Get filters for this group
      final groupFilters = <SearchFilter>[];
      for (final t in group.tables) {
        groupFilters.addAll(filtersByRoot[t] ?? []);
      }
      
      groups.add(TableGroup(
        tables: group.tables,
        relationships: group.relationships,
        filters: groupFilters,
        isConnected: true,
        depth: depth,
      ));
    }
    
    return groups;
  }

  ({Set<String> tables, List<RelationshipMapping> relationships}) 
      _findConnectedTables({
    required String startTable,
    required Set<String> allTables,
    required Set<String> visited,
  }) {
    final groupTables = <String>{};
    final groupRelationships = <RelationshipMapping>[];
    final queue = <String>[startTable];
    
    while (queue.isNotEmpty) {
      final current = queue.removeAt(0);
      if (visited.contains(current)) continue;
      
      visited.add(current);
      groupTables.add(current);
      
      // Find all relationships for current table
      final relationships = relationshipGraph[current] ?? [];
      for (final rel in relationships) {
        if (allTables.contains(rel.to) && !visited.contains(rel.to)) {
          queue.add(rel.to);
          groupRelationships.add(rel);
        }
      }
    }
    
    return (tables: groupTables, relationships: groupRelationships);
  }

  int _calculateDepth(Set<String> tables) {
    if (tables.length <= 1) return 0;
    
    // Find shortest path between furthest tables
    int maxDepth = 0;
    for (final fromTable in tables) {
      for (final toTable in tables) {
        if (fromTable == toTable) continue;
        final depth = _findShortestPathLength(fromTable, toTable);
        maxDepth = maxDepth > depth ? maxDepth : depth;
      }
    }
    return maxDepth;
  }

  int _findShortestPathLength(String from, String to) {
    final visited = <String>{};
    final queue = <(String, int)>[(from, 0)];
    
    while (queue.isNotEmpty) {
      final (current, depth) = queue.removeAt(0);
      if (current == to) return depth;
      if (visited.contains(current)) continue;
      
      visited.add(current);
      final relationships = relationshipGraph[current] ?? [];
      for (final rel in relationships) {
        if (!visited.contains(rel.to)) {
          queue.add((rel.to, depth + 1));
        }
      }
    }
    return -1; // No path found
  }

  Map<String, QueryComplexity> _calculateComplexity(
    List<TableGroup> tableGroups,
    Map<String, List<SearchFilter>> filtersByRoot,
  ) {
    final complexityMap = <String, QueryComplexity>{};
    
    for (final group in tableGroups) {
      for (final table in group.tables) {
        final relationships = relationshipGraph[table] ?? [];
        final filters = filtersByRoot[table] ?? [];
        final hasNested = nestedModelMapping.containsKey(table);
        
        // Check for many-to-many relationships
        bool hasManyToMany = false;
        for (final rel in relationships) {
          final reverseRels = relationshipGraph[rel.to] ?? [];
          if (reverseRels.any((r) => r.to == table && r.foreignKey != rel.localKey)) {
            hasManyToMany = true;
            break;
          }
        }
        
        // Estimate rows (simplified - in production, use statistics)
        final estimatedRows = _estimateRowCount(table, filters);
        
        // Calculate complexity score
        final score = _computeComplexityScore(
          relationshipCount: relationships.length,
          filterCount: filters.length,
          hasNested: hasNested,
          hasManyToMany: hasManyToMany,
          estimatedRows: estimatedRows,
        );
        
        complexityMap[table] = QueryComplexity(
          table: table,
          relationshipCount: relationships.length,
          filterCount: filters.length,
          hasNestedModels: hasNested,
          hasManyToMany: hasManyToMany,
          estimatedRows: estimatedRows,
          complexityScore: score,
        );
      }
    }
    
    return complexityMap;
  }

  int _estimateRowCount(String table, List<SearchFilter> filters) {
    // Simplified estimation - in production, use table statistics
    int baseEstimate = 1000; // Default estimate
    
    for (final filter in filters) {
      switch (filter.operator) {
        case 'equals':
          baseEstimate = (baseEstimate * 0.01).round(); // Very selective
          break;
        case 'in':
          final values = filter.value as List;
          baseEstimate = (baseEstimate * 0.01 * values.length).round();
          break;
        case 'contains':
          baseEstimate = (baseEstimate * 0.3).round(); // Less selective
          break;
        case 'isNotNull':
        case 'isNull':
          baseEstimate = (baseEstimate * 0.5).round();
          break;
      }
    }
    
    return baseEstimate.clamp(1, 100000);
  }

  double _computeComplexityScore({
    required int relationshipCount,
    required int filterCount,
    required bool hasNested,
    required bool hasManyToMany,
    required int estimatedRows,
  }) {
    double score = 0;
    
    // Relationship complexity
    score += relationshipCount * 2.0;
    
    // Filter complexity (filters reduce complexity)
    score -= filterCount * 0.5;
    
    // Nested models add complexity
    if (hasNested) score += 3.0;
    
    // Many-to-many significantly increases complexity
    if (hasManyToMany) score += 5.0;
    
    // Row count factor
    if (estimatedRows > 10000) score += 3.0;
    else if (estimatedRows > 1000) score += 1.5;
    
    return score.clamp(0, 20);
  }

  QueryStrategy _selectOptimalStrategy(
    List<TableGroup> tableGroups,
    Map<String, QueryComplexity> complexityMap,
    String? primaryTable,
  ) {
    // Single disconnected group
    if (tableGroups.length == 1) {
      final group = tableGroups.first;
      return _strategyForSingleGroup(
        group,
        complexityMap,
        primaryTable,
      );
    }
    
    // Multiple disconnected groups - use parallel
    return QueryStrategy(
      type: QueryStrategyType.parallel,
      tableGroups: tableGroups,
      complexityMap: complexityMap,
      executionOrder: _determineExecutionOrder(tableGroups, complexityMap),
      requiresHydration: _requiresHydration(complexityMap),
      primaryTable: primaryTable,
    );
  }

  QueryStrategy _strategyForSingleGroup(
    TableGroup group,
    Map<String, QueryComplexity> complexityMap,
    String? primaryTable,
  ) {
    final tableCount = group.tables.length;
    final totalComplexity = group.tables
        .map((t) => complexityMap[t]?.complexityScore ?? 0)
        .reduce((a, b) => a + b);
    
    // Single table - simple query
    if (tableCount == 1) {
      return QueryStrategy(
        type: QueryStrategyType.single,
        tableGroups: [group],
        complexityMap: complexityMap,
        executionOrder: group.tables.toList(),
        requiresHydration: _requiresHydration(complexityMap),
        primaryTable: primaryTable,
      );
    }
    
    // 2-3 tables with low complexity - JOIN
    if (tableCount <= 3 && totalComplexity < 10) {
      return QueryStrategy(
        type: QueryStrategyType.join,
        tableGroups: [group],
        complexityMap: complexityMap,
        executionOrder: _optimizeJoinOrder(group, complexityMap),
        requiresHydration: _requiresHydration(complexityMap),
        primaryTable: primaryTable,
      );
    }
    
    // 4-5 tables or moderate complexity - CTE
    if (tableCount <= 5 && totalComplexity < 15) {
      return QueryStrategy(
        type: QueryStrategyType.cte,
        tableGroups: [group],
        complexityMap: complexityMap,
        executionOrder: _determineExecutionOrder([group], complexityMap),
        requiresHydration: _requiresHydration(complexityMap),
        primaryTable: primaryTable,
      );
    }
    
    // Complex scenario - batch
    return QueryStrategy(
      type: QueryStrategyType.batch,
      tableGroups: [group],
      complexityMap: complexityMap,
      executionOrder: _determineExecutionOrder([group], complexityMap),
      requiresHydration: _requiresHydration(complexityMap),
      primaryTable: primaryTable,
    );
  }

  List<String> _optimizeJoinOrder(
    TableGroup group,
    Map<String, QueryComplexity> complexityMap,
  ) {
    // Sort tables by estimated rows (smallest first for optimal JOIN)
    final tables = group.tables.toList();
    tables.sort((a, b) {
      final aRows = complexityMap[a]?.estimatedRows ?? 999999;
      final bRows = complexityMap[b]?.estimatedRows ?? 999999;
      return aRows.compareTo(bRows);
    });
    return tables;
  }

  List<String> _determineExecutionOrder(
    List<TableGroup> groups,
    Map<String, QueryComplexity> complexityMap,
  ) {
    final order = <String>[];
    
    for (final group in groups) {
      // Sort by complexity score (simplest first)
      final tables = group.tables.toList();
      tables.sort((a, b) {
        final aScore = complexityMap[a]?.complexityScore ?? 0;
        final bScore = complexityMap[b]?.complexityScore ?? 0;
        return aScore.compareTo(bScore);
      });
      order.addAll(tables);
    }
    
    return order;
  }

  bool _requiresHydration(Map<String, QueryComplexity> complexityMap) {
    return complexityMap.values.any((c) => c.hasNestedModels);
  }
}
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_crud_bloc/repositories/helpers/query_analyzer.dart';
import 'package:digit_crud_bloc/repositories/helpers/query_builder.dart';
import 'package:drift/drift.dart';

/// Abstract base class for all query builders
abstract class OptimizedQueryBuilder {
  final QueryStrategy strategy;
  final List<SearchFilter> filters;
  final List<String> selectTables;
  final Map<String, List<RelationshipMapping>> relationshipGraph;
  final PaginationParams? pagination;

  OptimizedQueryBuilder({
    required this.strategy,
    required this.filters,
    required this.selectTables,
    required this.relationshipGraph,
    this.pagination,
  });

  /// Builds the SQL query(ies) based on the strategy
  List<QuerySpec> buildQueries();

  /// Determines which columns to select for each table
  Map<String, List<String>> determineColumns();
}

/// Represents a single query specification
class QuerySpec {
  final String sql;
  final List<Variable> variables;
  final QueryType type;
  final List<String> resultTables;
  final Map<String, String> tableAliases;

  const QuerySpec({
    required this.sql,
    required this.variables,
    required this.type,
    required this.resultTables,
    this.tableAliases = const {},
  });
}

enum QueryType {
  select,
  join,
  cte,
  count,
}

/// JoinQueryBuilder handles queries for 2-3 related tables using JOINs
class JoinQueryBuilder extends OptimizedQueryBuilder {
  JoinQueryBuilder({
    required super.strategy,
    required super.filters,
    required super.selectTables,
    required super.relationshipGraph,
    super.pagination,
  });

  @override
  List<QuerySpec> buildQueries() {
    final group = strategy.tableGroups.first;
    final orderedTables = strategy.executionOrder;
    
    // Build the main JOIN query
    final joinQuery = _buildJoinQuery(
      tables: orderedTables,
      group: group,
    );
    
    // If pagination is needed, build a separate count query
    final queries = <QuerySpec>[joinQuery];
    if (pagination != null && strategy.primaryTable != null) {
      queries.add(_buildCountQuery(strategy.primaryTable!));
    }
    
    return queries;
  }

  QuerySpec _buildJoinQuery({
    required List<String> tables,
    required TableGroup group,
  }) {
    if (tables.isEmpty) {
      throw ArgumentError('No tables to join');
    }
    
    final sqlBuilder = StringBuffer();
    final variables = <Variable>[];
    final tableAliases = <String, String>{};
    
    // Create aliases for tables (t1, t2, t3, etc.)
    for (int i = 0; i < tables.length; i++) {
      tableAliases[tables[i]] = 't${i + 1}';
    }
    
    // Build SELECT clause
    sqlBuilder.write('SELECT ');
    sqlBuilder.write(_buildSelectClause(tables, tableAliases));
    
    // Build FROM clause with first table
    final firstTable = tables.first;
    final firstAlias = tableAliases[firstTable]!;
    sqlBuilder.write(' FROM ${QueryBuilder.camelToSnake(firstTable)} $firstAlias');
    
    // Build JOIN clauses for remaining tables
    final joinedTables = {firstTable};
    for (int i = 1; i < tables.length; i++) {
      final targetTable = tables[i];
      final targetAlias = tableAliases[targetTable]!;
      
      // Find relationship between any joined table and target
      final relationship = _findRelationship(
        fromTables: joinedTables,
        toTable: targetTable,
        relationships: group.relationships,
      );
      
      if (relationship != null) {
        final fromAlias = tableAliases[relationship.from]!;
        final joinType = _determineJoinType(targetTable, relationship);
        
        sqlBuilder.write(' $joinType ${QueryBuilder.camelToSnake(targetTable)} $targetAlias');
        sqlBuilder.write(' ON $fromAlias.${QueryBuilder.camelToSnake(relationship.localKey)}');
        sqlBuilder.write(' = $targetAlias.${QueryBuilder.camelToSnake(relationship.foreignKey)}');
        
        joinedTables.add(targetTable);
      } else {
        // If no direct relationship, try to find a path
        final path = _findJoinPath(joinedTables, targetTable);
        if (path.isNotEmpty) {
          // Add intermediate joins if needed
          for (final rel in path) {
            if (!joinedTables.contains(rel.to)) {
              final intermediateAlias = 't${tables.length + joinedTables.length}';
              tableAliases[rel.to] = intermediateAlias;
              
              final fromAlias = tableAliases[rel.from]!;
              sqlBuilder.write(' LEFT JOIN ${QueryBuilder.camelToSnake(rel.to)} $intermediateAlias');
              sqlBuilder.write(' ON $fromAlias.${QueryBuilder.camelToSnake(rel.localKey)}');
              sqlBuilder.write(' = $intermediateAlias.${QueryBuilder.camelToSnake(rel.foreignKey)}');
              
              joinedTables.add(rel.to);
            }
          }
        }
      }
    }
    
    // Build WHERE clause
    final whereClause = _buildWhereClause(tables, tableAliases, variables);
    if (whereClause.isNotEmpty) {
      sqlBuilder.write(' WHERE $whereClause');
    }
    
    // Add ORDER BY if needed
    if (strategy.primaryTable != null) {
      final primaryAlias = tableAliases[strategy.primaryTable!];
      if (primaryAlias != null) {
        sqlBuilder.write(' ORDER BY $primaryAlias.id');
      }
    }
    
    // Add pagination
    if (pagination != null && strategy.primaryTable != null) {
      sqlBuilder.write(' LIMIT ${pagination!.limit} OFFSET ${pagination!.offset}');
    }
    
    return QuerySpec(
      sql: sqlBuilder.toString(),
      variables: variables,
      type: QueryType.join,
      resultTables: tables,
      tableAliases: tableAliases,
    );
  }

  String _buildSelectClause(
    List<String> tables,
    Map<String, String> tableAliases,
  ) {
    final columns = determineColumns();
    final selectParts = <String>[];
    
    for (final table in tables) {
      final alias = tableAliases[table]!;
      final tableColumns = columns[table] ?? ['*'];
      
      if (tableColumns.contains('*')) {
        // Select all columns from this table
        selectParts.add('$alias.*');
        // Add table identifier for result processing
        selectParts.add("'$table' as ${alias}_table_name");
      } else {
        // Select specific columns
        for (final col in tableColumns) {
          final snakeCol = QueryBuilder.camelToSnake(col);
          selectParts.add('$alias.$snakeCol as ${alias}_$snakeCol');
        }
        selectParts.add("'$table' as ${alias}_table_name");
      }
    }
    
    return selectParts.join(', ');
  }

  String _buildWhereClause(
    List<String> tables,
    Map<String, String> tableAliases,
    List<Variable> variables,
  ) {
    final whereParts = <String>[];
    
    // Group filters by table
    final filtersByTable = <String, List<SearchFilter>>{};
    for (final filter in filters) {
      if (tables.contains(filter.root)) {
        filtersByTable.putIfAbsent(filter.root, () => []).add(filter);
      }
    }
    
    // Build WHERE conditions for each table
    for (final entry in filtersByTable.entries) {
      final table = entry.key;
      final tableFilters = entry.value;
      final alias = tableAliases[table]!;
      
      for (final filter in tableFilters) {
        final column = QueryBuilder.camelToSnake(filter.field);
        final condition = _buildFilterCondition(
          tableAlias: alias,
          column: column,
          filter: filter,
          variables: variables,
        );
        
        if (condition.isNotEmpty) {
          whereParts.add(condition);
        }
      }
    }
    
    return whereParts.join(' AND ');
  }

  String _buildFilterCondition({
    required String tableAlias,
    required String column,
    required SearchFilter filter,
    required List<Variable> variables,
  }) {
    switch (filter.operator) {
      case 'equals':
        variables.add(Variable.withString(filter.value.toString()));
        return '$tableAlias.$column = ?';
        
      case 'contains':
        variables.add(Variable.withString('%${filter.value}%'));
        return '$tableAlias.$column LIKE ?';
        
      case 'isNotNull':
        return '$tableAlias.$column IS NOT NULL';
        
      case 'isNull':
        return '$tableAlias.$column IS NULL';
        
      case 'in':
        final values = filter.value as List;
        if (values.isEmpty) return '';
        final placeholders = List.filled(values.length, '?').join(', ');
        for (final value in values) {
          variables.add(Variable.withString(value.toString()));
        }
        return '$tableAlias.$column IN ($placeholders)';
        
      case 'notIn':
        final values = filter.value as List;
        if (values.isEmpty) return '';
        final placeholders = List.filled(values.length, '?').join(', ');
        for (final value in values) {
          variables.add(Variable.withString(value.toString()));
        }
        return '$tableAlias.$column NOT IN ($placeholders)';
        
      case 'within':
        // Handle geospatial within - requires special handling
        // This would need latitude/longitude columns
        return '1=1'; // Placeholder - implement actual distance calculation
        
      default:
        throw ArgumentError('Unsupported operator: ${filter.operator}');
    }
  }

  RelationshipMapping? _findRelationship({
    required Set<String> fromTables,
    required String toTable,
    required List<RelationshipMapping> relationships,
  }) {
    // Find direct relationship from any joined table to target
    for (final fromTable in fromTables) {
      final relationship = relationships.firstWhere(
        (r) => r.from == fromTable && r.to == toTable,
        orElse: () => relationships.firstWhere(
          (r) => r.to == fromTable && r.from == toTable,
          orElse: () => RelationshipMapping(
            from: '',
            to: '',
            localKey: '',
            foreignKey: '',
          ),
        ),
      );
      
      if (relationship.from.isNotEmpty) {
        // Reverse the relationship if needed
        if (relationship.to == fromTable) {
          return RelationshipMapping(
            from: relationship.to,
            to: relationship.from,
            localKey: relationship.foreignKey,
            foreignKey: relationship.localKey,
          );
        }
        return relationship;
      }
    }
    return null;
  }

  List<RelationshipMapping> _findJoinPath(
    Set<String> fromTables,
    String toTable,
  ) {
    // Use BFS to find shortest path from any joined table to target
    final visited = <String>{};
    final queue = <(String, List<RelationshipMapping>)>[];
    
    // Start from all joined tables
    for (final startTable in fromTables) {
      queue.add((startTable, []));
    }
    
    while (queue.isNotEmpty) {
      final (current, path) = queue.removeAt(0);
      
      if (current == toTable) {
        return path;
      }
      
      if (visited.contains(current)) continue;
      visited.add(current);
      
      final relationships = relationshipGraph[current] ?? [];
      for (final rel in relationships) {
        if (!visited.contains(rel.to)) {
          queue.add((rel.to, [...path, rel]));
        }
      }
    }
    
    return [];
  }

  String _determineJoinType(String table, RelationshipMapping relationship) {
    // Check if the foreign key is nullable or if it's optional
    // For now, default to LEFT JOIN for safety
    // In production, check schema or use configuration
    
    // Use INNER JOIN for required relationships (e.g., order -> user)
    // Use LEFT JOIN for optional relationships (e.g., user -> profile)
    
    final hasFilters = filters.any((f) => f.root == table);
    
    // If table has filters, use INNER JOIN to exclude nulls
    if (hasFilters) {
      return 'INNER JOIN';
    }
    
    // Default to LEFT JOIN for optional relationships
    return 'LEFT JOIN';
  }

  QuerySpec _buildCountQuery(String primaryTable) {
    final sqlBuilder = StringBuffer();
    final variables = <Variable>[];
    
    // Simple count query for the primary table with its filters
    sqlBuilder.write('SELECT COUNT(*) as total FROM ');
    sqlBuilder.write(QueryBuilder.camelToSnake(primaryTable));
    
    // Add filters for primary table only
    final primaryFilters = filters.where((f) => f.root == primaryTable).toList();
    if (primaryFilters.isNotEmpty) {
      final whereParts = <String>[];
      for (final filter in primaryFilters) {
        final column = QueryBuilder.camelToSnake(filter.field);
        final condition = _buildFilterCondition(
          tableAlias: '',
          column: column,
          filter: filter,
          variables: variables,
        ).replaceAll('.', ''); // Remove table alias prefix
        
        if (condition.isNotEmpty) {
          whereParts.add(condition);
        }
      }
      
      if (whereParts.isNotEmpty) {
        sqlBuilder.write(' WHERE ${whereParts.join(' AND ')}');
      }
    }
    
    return QuerySpec(
      sql: sqlBuilder.toString(),
      variables: variables,
      type: QueryType.count,
      resultTables: [primaryTable],
    );
  }

  @override
  Map<String, List<String>> determineColumns() {
    final columns = <String, List<String>>{};
    
    for (final table in selectTables) {
      if (table == strategy.primaryTable) {
        // For primary table, select all columns
        columns[table] = ['*'];
      } else {
        // For joined tables, select essential columns + foreign keys
        final essentialColumns = <String>['id'];
        
        // Add foreign key columns used in relationships
        for (final rel in strategy.tableGroups.first.relationships) {
          if (rel.from == table) {
            essentialColumns.add(rel.localKey);
          } else if (rel.to == table) {
            essentialColumns.add(rel.foreignKey);
          }
        }
        
        // Add columns used in filters
        for (final filter in filters) {
          if (filter.root == table) {
            essentialColumns.add(filter.field);
          }
        }
        
        // If this table is in selectTables, get all columns
        if (selectTables.contains(table)) {
          columns[table] = ['*'];
        } else {
          columns[table] = essentialColumns.toSet().toList();
        }
      }
    }
    
    return columns;
  }
}
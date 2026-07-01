/// QueryBuilder provides static utilities for building SQL queries, where clauses, and argument lists from filters.
import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart' hide OrderBy;
import 'package:flutter/material.dart' as debug;

class QueryBuilder {
  /// Looks up a dynamic table by camelCase name.
  static TableInfo<Table, Object?> _tableInfo(
      LocalSqlDataStore sql, String tableName) {
    return sql.allTables.firstWhere(
      (t) => t.actualTableName == camelToSnake(tableName),
      orElse: () => throw Exception('Table $tableName not found'),
    );
  }

  /// Looks up a column on a dynamic table by camelCase name.
  static GeneratedColumn<Object> _columnOf(
      TableInfo<Table, Object?> table, String columnCamel) {
    final snake = camelToSnake(columnCamel);
    return table.$columns.firstWhere(
      (c) => c.$name == snake,
      orElse: () => throw Exception(
          'Column $columnCamel not found in ${table.actualTableName}'),
    );
  }

  /// Builds a Drift `Expression<bool>` representing
  /// `primaryKeyColumn IN (SELECT path.last.localKey FROM path.first.from
  ///   [INNER JOIN ...] WHERE <filtersOnFirstTable>)`.
  ///
  /// This lets SQLite plan the multi-table join + filter as one statement,
  /// using indexes on each joined column. It replaces the previous pipeline
  /// of materializing primary-key sets in Dart and re-binding them as a
  /// large IN(...) clause.
  static Expression<bool> buildPrimaryKeySubqueryExpression({
    required LocalSqlDataStore sql,
    required List<RelationshipMapping> path,
    required List<SearchFilter> filtersOnFirstTable,
    required GeneratedColumn<Object> primaryKeyColumn,
    bool negate = false,
  }) {
    if (path.isEmpty) {
      throw ArgumentError('Relationship path must not be empty');
    }

    final firstTable = _tableInfo(sql, path.first.from);
    final lastRel = path.last;
    final projectTable = _tableInfo(sql, lastRel.from);
    final projectColumn = _columnOf(projectTable, lastRel.localKey);

    final subquery = sql.selectOnly(firstTable, distinct: true)
      ..addColumns([projectColumn]);

    // INNER JOIN every hop except the last (whose `to` table is the primary
    // table — we don't need to join it, the FK on `from` already suffices).
    final joins = <Join>[];
    for (var i = 0; i < path.length - 1; i++) {
      final rel = path[i];
      final fromTable = _tableInfo(sql, rel.from);
      final toTable = _tableInfo(sql, rel.to);
      final localCol = _columnOf(fromTable, rel.localKey);
      final foreignCol = _columnOf(toTable, rel.foreignKey);
      // FK columns in this schema are TEXT; cast both sides to compare.
      joins.add(innerJoin(
        toTable,
        (localCol as Expression<String>)
            .equalsExp(foreignCol as Expression<String>),
      ));
    }
    if (joins.isNotEmpty) {
      subquery.join(joins);
    }

    // Filters apply to the first (originally-rooted) related table.
    for (final filter in filtersOnFirstTable) {
      if (filter.operator == 'within') {
        final expr = _buildWithinBoundingBoxExpression(firstTable, filter);
        if (expr != null) subquery.where(expr);
        continue;
      }
      if (filter.operator == 'containsAll') {
        final expr = _buildContainsAllExpression(firstTable, filter);
        if (expr != null) subquery.where(expr);
        continue;
      }
      if (filter.operator == 'equalsAny') {
        final expr = _buildEqualsAnyExpression(firstTable, filter);
        if (expr != null) subquery.where(expr);
        continue;
      }
      final col = _columnOf(firstTable, filter.field);
      final expr = _filterToExpression(col, filter);
      if (expr != null) subquery.where(expr);
    }

    // primaryKey IN (subquery) or NOT IN (subquery) when negated
    final inExpr =
        (primaryKeyColumn as Expression<String>).isInQuery(subquery);
    return negate ? inExpr.not() : inExpr;
  }

  /// Builds a single `primary_pk IN (SELECT pivot_fk FROM pivot
  ///   INNER JOIN related_table_1 …
  ///   INNER JOIN related_table_2 …
  ///   WHERE all_filters)` expression that combines multiple related-table
  /// filter groups into ONE subquery — provided every group's path ends at
  /// the same pivot table (the table directly connected to primary).
  ///
  /// When that condition holds, this replaces N separately-materialized
  /// `pk IN (subN)` clauses with a single subquery SQLite can plan as one
  /// statement, picking the most selective filter first. Major win for both
  /// COUNT and the data query when COUNT enumerates large result sets.
  ///
  /// Returns null when the input paths don't share a pivot — the caller
  /// must fall back to one subquery per related table.
  static Expression<bool>? buildCombinedSubqueryExpression({
    required LocalSqlDataStore sql,
    required List<
            ({List<RelationshipMapping> path, List<SearchFilter> filters})>
        pathFilterPairs,
    required GeneratedColumn<Object> primaryKeyColumn,
  }) {
    if (pathFilterPairs.isEmpty) return null;
    for (final pair in pathFilterPairs) {
      if (pair.path.isEmpty) return null;
    }

    // Pivot = the `from` table of the last hop (the one connecting to primary).
    // All paths must share the same pivot for the combine to be valid.
    final pivotTable = pathFilterPairs.first.path.last.from;
    final pivotFkField = pathFilterPairs.first.path.last.localKey;
    for (final pair in pathFilterPairs) {
      if (pair.path.last.from != pivotTable ||
          pair.path.last.localKey != pivotFkField) {
        return null; // paths diverge before primary; can't combine
      }
    }

    final pivotInfo = _tableInfo(sql, pivotTable);
    final pivotFkColumn = _columnOf(pivotInfo, pivotFkField);

    final subquery = sql.selectOnly(pivotInfo, distinct: true)
      ..addColumns([pivotFkColumn]);

    final joinedTables = <String>{pivotTable};
    final joins = <Join>[];

    // Walk each path BACKWARD from pivot toward the originally-filtered table,
    // so every join condition references tables already in scope.
    for (final pair in pathFilterPairs) {
      for (var i = pair.path.length - 2; i >= 0; i--) {
        final rel = pair.path[i];
        if (joinedTables.contains(rel.from)) continue;

        final fromInfo = _tableInfo(sql, rel.from);
        final toInfo = _tableInfo(sql, rel.to);
        final localCol = _columnOf(fromInfo, rel.localKey);
        final foreignCol = _columnOf(toInfo, rel.foreignKey);

        joins.add(innerJoin(
          fromInfo,
          (localCol as Expression<String>)
              .equalsExp(foreignCol as Expression<String>),
        ));
        joinedTables.add(rel.from);
      }
    }
    if (joins.isNotEmpty) subquery.join(joins);

    // Apply each group's filters on its originally-rooted table.
    for (final pair in pathFilterPairs) {
      final filterTable = _tableInfo(sql, pair.path.first.from);
      for (final filter in pair.filters) {
        if (filter.operator == 'within') {
          final expr = _buildWithinBoundingBoxExpression(filterTable, filter);
          if (expr != null) subquery.where(expr);
          continue;
        }
        if (filter.operator == 'containsAll') {
          final expr = _buildContainsAllExpression(filterTable, filter);
          if (expr != null) subquery.where(expr);
          continue;
        }
        if (filter.operator == 'equalsAny') {
          final expr = _buildEqualsAnyExpression(filterTable, filter);
          if (expr != null) subquery.where(expr);
          continue;
        }
        final col = _columnOf(filterTable, filter.field);
        final expr = _filterToExpression(col, filter);
        if (expr != null) subquery.where(expr);
      }
    }

    return (primaryKeyColumn as Expression<String>).isInQuery(subquery);
  }

  /// Builds a lat/lon bounding-box `Expression<bool>` for a 'within' filter
  /// applied inside a cross-table subquery. The subquery can only do the
  /// coarse bounding-box prefilter — exact Haversine refinement requires
  /// reading lat/lon into Dart, which the primary-table queryRawTable path
  /// handles when 'within' is rooted on the primary table itself.
  static Expression<bool>? _buildWithinBoundingBoxExpression(
      TableInfo<Table, Object?> table, SearchFilter filter) {
    if (filter.coordinates == null || filter.value == null) return null;

    final latField = table.$columns.firstWhere(
      (c) => c.$name == 'latitude',
      orElse: () => throw Exception(
          'Latitude column not found in ${table.actualTableName}'),
    );
    final lonField = table.$columns.firstWhere(
      (c) => c.$name == 'longitude',
      orElse: () => throw Exception(
          'Longitude column not found in ${table.actualTableName}'),
    );

    final centerLat = filter.coordinates!.latitude;
    final centerLon = filter.coordinates!.longitude;
    final radiusInKm = (filter.value as num).toDouble();

    const earthRadius = 6371.0;
    const degToRad = math.pi / 180.0;

    final deltaLat = radiusInKm / earthRadius;
    final deltaLon =
        radiusInKm / (earthRadius * math.cos(centerLat * degToRad));

    final minLat = centerLat - deltaLat;
    final maxLat = centerLat + deltaLat;
    final minLon = centerLon - deltaLon;
    final maxLon = centerLon + deltaLon;

    return (latField as Expression<double>).isBetweenValues(minLat, maxLat) &
        (lonField as Expression<double>).isBetweenValues(minLon, maxLon);
  }

  /// Builds `(col1 = v OR col2 = v …)` for an `equalsAny` filter applied
  /// inside a cross-table subquery. Mirrors the queryRawTable path's
  /// existing equalsAny handling.
  static Expression<bool>? _buildEqualsAnyExpression(
      TableInfo<Table, Object?> table, SearchFilter filter) {
    if (filter.value == null) return null;
    final columnNames = filter.field
        .split(',')
        .map((f) => camelToSnake(f.trim()))
        .where((f) => f.isNotEmpty)
        .toList();
    if (columnNames.isEmpty) return null;

    Expression<bool>? combined;
    for (final colName in columnNames) {
      final col = table.$columns.firstWhere(
        (c) => c.$name == colName,
        orElse: () => throw Exception(
            'Column $colName not found in ${table.actualTableName}'),
      );
      final clause = col.equals(filter.value);
      combined = combined == null ? clause : combined | clause;
    }
    return combined;
  }

  /// Builds the `containsAll` expression: split the value on whitespace and
  /// require every part to appear (LIKE) in at least one of the
  /// comma-separated columns.
  ///
  /// Example: field='givenName,familyName', value='John Smith' →
  ///   (given_name LIKE %John% OR family_name LIKE %John%) AND
  ///   (given_name LIKE %Smith% OR family_name LIKE %Smith%)
  static Expression<bool>? _buildContainsAllExpression(
      TableInfo<Table, Object?> table, SearchFilter filter) {
    final columnNames = filter.field
        .split(',')
        .map((f) => camelToSnake(f.trim()))
        .where((f) => f.isNotEmpty)
        .toList();
    final parts = filter.value
            ?.toString()
            .trim()
            .split(RegExp(r'\s+'))
            .where((t) => t.isNotEmpty)
            .toList() ??
        const <String>[];
    if (parts.isEmpty || columnNames.isEmpty) return null;

    final columns = columnNames.map((colName) {
      return table.$columns.firstWhere(
        (c) => c.$name == colName,
        orElse: () => throw Exception(
            'Column $colName not found in ${table.actualTableName}'),
      ) as Expression<String>;
    }).toList();

    Expression<bool>? combined;
    for (final part in parts) {
      // Wrap each LIKE with isNotNull so a NULL column contributes FALSE
      // to the OR instead of NULL — otherwise FALSE OR NULL = NULL and the
      // surrounding AND/WHERE drops the row.
      Expression<bool> partClause =
          columns.first.isNotNull() & columns.first.like('%$part%');
      for (var i = 1; i < columns.length; i++) {
        partClause =
            partClause | (columns[i].isNotNull() & columns[i].like('%$part%'));
      }
      combined = combined == null ? partClause : combined & partClause;
    }
    return combined;
  }

  /// Converts a SearchFilter to a Drift `Expression<bool>` for the given
  /// column. Mirrors the operator set handled by `queryRawTable`.
  /// Returns null when the filter resolves to "match everything" (e.g.
  /// `in []`).
  static Expression<bool>? _filterToExpression(
      GeneratedColumn<Object> col, SearchFilter filter) {
    switch (filter.operator) {
      case 'equals':
        return col.equals(filter.value);
      case 'notEqual':
      case 'notEquals':
        return col.equals(filter.value).not();
      case 'contains':
        // Prefix match (LIKE 'val%') so a column index on this field can be
        // used; substring matching defeats the index. Use `matches` when a
        // genuine substring lookup is needed (e.g. searching inside a JSON
        // column like additionalFields).
        return (col as Expression<String>).like('${filter.value}%');
      case 'matches':
        return (col as Expression<String>).like('%${filter.value}%');
      case 'notContains':
        return col.isNull() |
            (col as Expression<String>).like('%${filter.value}%').not();
      case 'isNotNull':
        return col.isNotNull();
      case 'isNull':
        return col.isNull();
      case 'in':
        {
          final list = _normalizeToList(filter.value);
          if (list.isEmpty) return null;
          if (col is GeneratedColumn<int>) {
            final ints = list
                .map((v) => v is int ? v : int.tryParse(v.toString()))
                .whereType<int>()
                .toList();
            if (ints.isEmpty) return null;
            return col.isIn(ints);
          }
          return (col as GeneratedColumn<String>)
              .isIn(list.map((v) => v.toString()).toList());
        }
      case 'notIn':
        {
          final list = _normalizeToList(filter.value);
          if (list.isEmpty) return null;
          if (col is GeneratedColumn<int>) {
            final ints = list
                .map((v) => v is int ? v : int.tryParse(v.toString()))
                .whereType<int>()
                .toList();
            if (ints.isEmpty) return null;
            return col.isNotIn(ints);
          }
          return (col as GeneratedColumn<String>)
              .isNotIn(list.map((v) => v.toString()).toList());
        }
      case 'notExists':
        {
          // notExists: extract inner values and build IN expression.
          // The subquery-level negation (NOT IN) is handled by
          // buildPrimaryKeySubqueryExpression with negate=true.
          dynamic innerValues;
          if (filter.value is Map) {
            innerValues = (filter.value as Map)['values'] ?? filter.value;
          } else {
            innerValues = filter.value;
          }
          final list = _normalizeToList(innerValues);
          if (list.isEmpty) return null;
          if (col is GeneratedColumn<int>) {
            final ints = list
                .map((v) => v is int ? v : int.tryParse(v.toString()))
                .whereType<int>()
                .toList();
            if (ints.isEmpty) return null;
            return col.isIn(ints);
          }
          return (col as GeneratedColumn<String>)
              .isIn(list.map((v) => v.toString()).toList());
        }
      default:
        throw Exception('Unsupported operator in subquery: ${filter.operator}');
    }
  }

  /// Normalizes a value to a List for 'in' and 'notIn' operators.
  /// Handles cases where a single string is passed instead of a list.
  /// Also trims string values.
  static List<dynamic> _normalizeToList(dynamic value) {
    if (value is List) {
      // Trim string values in the list
      return value.map((v) => v is String ? v.trim() : v).toList();
    } else if (value is String) {
      // Split by comma if it contains commas, otherwise wrap as single-item list
      final trimmed = value.trim();
      if (trimmed.contains(',')) {
        return trimmed
            .split(',')
            .map((v) => v.trim())
            .where((v) => v.isNotEmpty)
            .toList();
      }
      return [trimmed];
    }
    return [value];
  }

  static String camelToSnake(String input) {
    return input.replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => '_${match.group(0)!.toLowerCase()}',
    );
  }

  static Map<String, dynamic> snakeToCamelDeep(Map<String, dynamic> input) {
    return input.map((key, value) {
      final newKey = _snakeToCamel(key);
      final newValue = _transformValue(value);
      return MapEntry(newKey, newValue);
    });
  }

  static dynamic _transformValue(dynamic value) {
    if (value is Map<String, dynamic>) {
      return snakeToCamelDeep(value);
    } else if (value is List) {
      return value.map((item) {
        if (item is Map<String, dynamic>) {
          return snakeToCamelDeep(item);
        }
        return item;
      }).toList();
    }
    return value;
  }

  static String _snakeToCamel(String input) {
    // Drop empty segments so adjacent/leading/trailing underscores don't
    // RangeError on `p[0]` and don't produce stray capitalizations.
    final parts = input.split('_').where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return input;
    return parts.first +
        parts.skip(1).map((p) => p[0].toUpperCase() + p.substring(1)).join();
  }

  static String buildWhereClauseRaw(List<SearchFilter> filters) {
    return filters.map((filter) {
      final column = camelToSnake(filter.field);
      switch (filter.operator) {
        case 'equals':
          return '$column = ?';
        case 'contains':
        case 'matches':
          return '$column LIKE ?';
        case 'notContains':
          return '($column IS NULL OR $column NOT LIKE ?)';
        case 'isNotNull':
          return '$column IS NOT NULL';
        case 'isNull':
          return '$column IS NULL';
        case 'in':
          final values = _normalizeToList(filter.value);
          if (values.isEmpty) return '1 = 1';
          return '$column IN (${List.filled(values.length, '?').join(', ')})';
        case 'notIn':
          final values = _normalizeToList(filter.value);
          if (values.isEmpty) return '1 = 1';
          return '$column NOT IN (${List.filled(values.length, '?').join(', ')})';
        case 'within':
          return '1 = 1';
        case 'notEqual':
        case 'notEquals':
          return '$column != ?';
        case 'equalsAny':
          // Supports OR condition: field contains comma-separated column names
          // Example: field='senderId,receiverId', value='F-123'
          // Generates: (sender_id = ? OR receiver_id = ?)
          final columns = filter.field
              .split(',')
              .map((f) => camelToSnake(f.trim()))
              .where((f) => f.isNotEmpty)
              .toList();
          if (columns.isEmpty) return '1 = 1';
          return '(${columns.map((c) => '$c = ?').join(' OR ')})';
        case 'containsAll':
          // Every whitespace-separated part of the value must be contained
          // in at least one of the comma-separated columns.
          // Example: field='givenName,familyName', value='John Smith'
          // Generates: ((given_name LIKE ? OR family_name LIKE ?) AND
          //            (given_name LIKE ? OR family_name LIKE ?))
          final cols = filter.field
              .split(',')
              .map((f) => camelToSnake(f.trim()))
              .where((f) => f.isNotEmpty)
              .toList();
          final parts = filter.value
                  ?.toString()
                  .trim()
                  .split(RegExp(r'\s+'))
                  .where((t) => t.isNotEmpty)
                  .toList() ??
              const <String>[];
          if (parts.isEmpty || cols.isEmpty) return '1 = 1';
          // ($c IS NOT NULL AND $c LIKE ?) so NULL columns contribute FALSE,
          // not NULL, to the OR — see _buildContainsAllExpression for context.
          final partClauses = parts.map((_) =>
              '(${cols.map((c) => '($c IS NOT NULL AND $c LIKE ?)').join(' OR ')})');
          return '(${partClauses.join(' AND ')})';
        case 'notExists':
          // notExists uses the inner values list for an IN clause.
          // Subquery-level negation (NOT IN) is handled separately.
          dynamic innerVal = filter.value;
          if (innerVal is Map) {
            innerVal = innerVal['values'] ?? innerVal;
          }
          final nValues = _normalizeToList(innerVal);
          if (nValues.isEmpty) return '1 = 1';
          return '$column IN (${List.filled(nValues.length, '?').join(', ')})';
        default:
          throw Exception('Unsupported operator: ${filter.operator}');
      }
    }).join(' AND ');
  }

  static List<Variable> buildWhereArgs(List<SearchFilter> filters) {
    final args = <Variable>[];
    for (final filter in filters) {
      switch (filter.operator) {
        case 'equals':
          args.add(Variable.withString(filter.value.toString()));
          break;
        case 'notEqual':
        case 'notEquals':
          args.add(Variable.withString(filter.value.toString()));
          break;
        case 'contains':
          args.add(Variable.withString('${filter.value}%'));
          break;
        case 'matches':
          args.add(Variable.withString('%${filter.value}%'));
          break;
        case 'notContains':
          args.add(Variable.withString('%${filter.value}%'));
          break;
        case 'in':
        case 'notIn':
          final list = _normalizeToList(filter.value);
          if (list.isNotEmpty) {
            args.addAll(list.map((v) => Variable.withString(v.toString())));
          }
          break;
        case 'equalsAny':
          // Add the same value for each column in the OR condition.
          // Empty entries are stripped to match buildWhereClauseRaw.
          final columnCount = filter.field
              .split(',')
              .map((f) => f.trim())
              .where((f) => f.isNotEmpty)
              .length;
          for (int i = 0; i < columnCount; i++) {
            args.add(Variable.withString(filter.value.toString()));
          }
          break;
        case 'containsAll':
          // One '%part%' arg per (part, column) pair, matching the
          // clause structure built in buildWhereClauseRaw.
          final cols = filter.field
              .split(',')
              .map((f) => f.trim())
              .where((f) => f.isNotEmpty)
              .toList();
          final parts = filter.value
                  ?.toString()
                  .trim()
                  .split(RegExp(r'\s+'))
                  .where((t) => t.isNotEmpty)
                  .toList() ??
              const <String>[];
          for (final part in parts) {
            for (var i = 0; i < cols.length; i++) {
              args.add(Variable.withString('%$part%'));
            }
          }
          break;
        case 'isNotNull':
        case 'isNull':
        case 'within':
          break;
        case 'notExists':
          dynamic innerVal = filter.value;
          if (innerVal is Map) {
            innerVal = innerVal['values'] ?? innerVal;
          }
          final nList = _normalizeToList(innerVal);
          if (nList.isNotEmpty) {
            args.addAll(nList.map((v) => Variable.withString(v.toString())));
          }
          break;
        default:
          throw Exception('Unsupported operator: ${filter.operator}');
      }
    }
    return args;
  }

  /// SQLite's bundled engine limits the number of bound parameters per
  /// statement (typically 999 on platforms shipping SQLCipher). When the
  /// resolver/hydration paths produce a wider FK set than this, we transparently
  /// chunk the IN list, run multiple queries, and concatenate results.
  /// Safe only for paths without pagination/count/ordering (resolver hops and
  /// nested hydration). The primary-table path is unaffected.
  static const int _maxInListSize = 500;

  static Future<List<Map<String, dynamic>>> queryRawTable({
    required LocalSqlDataStore sql,
    required String table,
    required List<SearchFilter> filters,
    required List<String> select,
    PaginationParams? pagination,
    bool isPrimaryTable = false,
    void Function(int count)? onCountFetched,
    SearchOrderBy? orderBy,
    List<String>? selectColumns,
    List<Expression<bool>>? extraConstraints,
  }) async {
    // Auto-chunk over-sized IN/notIn lists before the SQL ever gets built.
    // Only safe for queries that don't paginate / count / order — the resolver
    // and hydration paths fit this criterion.
    if (!isPrimaryTable &&
        pagination == null &&
        onCountFetched == null &&
        orderBy == null) {
      final int oversizeIndex = filters.indexWhere((f) =>
          (f.operator == 'in' || f.operator == 'notIn') &&
          _normalizeToList(f.value).length > _maxInListSize);
      if (oversizeIndex >= 0) {
        final big = filters[oversizeIndex];
        final allValues = _normalizeToList(big.value);
        final merged = <Map<String, dynamic>>[];
        for (var i = 0; i < allValues.length; i += _maxInListSize) {
          final end = (i + _maxInListSize <= allValues.length)
              ? i + _maxInListSize
              : allValues.length;
          final chunk = allValues.sublist(i, end);
          final chunkedFilters = List<SearchFilter>.from(filters);
          chunkedFilters[oversizeIndex] = SearchFilter(
            root: big.root,
            field: big.field,
            operator: big.operator,
            value: chunk,
            coordinates: big.coordinates,
          );
          final chunkRows = await queryRawTable(
            sql: sql,
            table: table,
            filters: chunkedFilters,
            select: select,
            isPrimaryTable: false,
            selectColumns: selectColumns,
          );
          merged.addAll(chunkRows);
        }
        return merged;
      }
    }

    final dynamicTable = sql.allTables.firstWhere(
      (t) => t.actualTableName == camelToSnake(table),
      orElse: () => throw Exception('Table $table not found'),
    );

    final List<Expression<bool>> whereClauses = [];
    if (extraConstraints != null && extraConstraints.isNotEmpty) {
      whereClauses.addAll(extraConstraints);
    }

    double? centerLat, centerLon, radiusInKm;

    for (final filter in filters.where((f) => f.root == table)) {
      // Handle 'within' filter separately
      if (filter.operator == 'within') {
        if (filter.coordinates == null || filter.value == null) {
          throw Exception(
              "Missing coordinates or radius for 'within' operator");
        }

        // TODO: Avoid hardcoded column names 'latitude' and 'longitude' in future
        final latField = dynamicTable.$columns.firstWhere(
          (c) => c.$name == 'latitude',
          orElse: () => throw Exception('Latitude column not found in $table'),
        );
        final lonField = dynamicTable.$columns.firstWhere(
          (c) => c.$name == 'longitude',
          orElse: () => throw Exception('Longitude column not found in $table'),
        );

        centerLat = filter.coordinates!.latitude;
        centerLon = filter.coordinates!.longitude;
        radiusInKm = (filter.value as num).toDouble();

        const earthRadius = 6371.0;
        const degToRad = math.pi / 180.0;

        final deltaLat = radiusInKm / earthRadius;
        final deltaLon =
            radiusInKm / (earthRadius * math.cos(centerLat * degToRad));

        final minLat = centerLat - deltaLat;
        final maxLat = centerLat + deltaLat;
        final minLon = centerLon - deltaLon;
        final maxLon = centerLon + deltaLon;

        final latExpr = latField as Expression<double>;
        final lonExpr = lonField as Expression<double>;

        final boundingBox = latExpr.isBetweenValues(minLat, maxLat) &
            lonExpr.isBetweenValues(minLon, maxLon);

        whereClauses.add(boundingBox);
        continue;
      }

      // Handle equalsAny operator separately (multiple columns with OR)
      if (filter.operator == 'equalsAny') {
        final columnNames =
            filter.field.split(',').map((f) => camelToSnake(f.trim())).toList();
        final List<Expression<bool>> orClauses = [];

        for (final colName in columnNames) {
          final col = dynamicTable.$columns.firstWhere(
            (c) => c.$name == colName,
            orElse: () =>
                throw Exception('Column $colName not found in $table'),
          );
          orClauses.add(col.equals(filter.value));
        }

        // Combine with OR: (col1 = value OR col2 = value)
        if (orClauses.isNotEmpty) {
          Expression<bool> combined = orClauses.first;
          for (int i = 1; i < orClauses.length; i++) {
            combined = combined | orClauses[i];
          }
          whereClauses.add(combined);
        }
        continue;
      }

      // Handle containsAll: split value on whitespace and require every
      // part to appear (LIKE) in at least one of the comma-separated columns.
      if (filter.operator == 'containsAll') {
        final expr = _buildContainsAllExpression(dynamicTable, filter);
        if (expr != null) whereClauses.add(expr);
        continue;
      }

      final columnName = camelToSnake(filter.field);
      final col = dynamicTable.$columns.firstWhere(
        (c) => c.$name == columnName,
        orElse: () => throw Exception('Column $columnName not found in $table'),
      );

      switch (filter.operator) {
        case 'equals':
          whereClauses.add(col.equals(filter.value));
          break;
        case 'notEqual':
        case 'notEquals':
          whereClauses.add(col.equals(filter.value).not());
          break;
        case 'contains':
          whereClauses
              .add((col as Expression<String>).like('${filter.value}%'));
          break;
        case 'matches':
          whereClauses
              .add((col as Expression<String>).like('%${filter.value}%'));
          break;
        case 'notContains':
          whereClauses.add(col.isNull() |
              (col as Expression<String>).like('%${filter.value}%').not());
          break;
        case 'isNotNull':
          whereClauses.add(col.isNotNull());
          break;
        case 'isNull':
          whereClauses.add(col.isNull());
          break;
        case 'in':
          final list = _normalizeToList(filter.value);
          if (list.isEmpty) break; // Empty list = no filter (match all)
          if (col is GeneratedColumn<int>) {
            final ints = list
                .map((v) => v is int ? v : int.tryParse(v.toString()))
                .whereType<int>()
                .toList();
            if (ints.isNotEmpty) whereClauses.add(col.isIn(ints));
          } else if (col is GeneratedColumn<String>) {
            whereClauses.add(col.isIn(list.map((v) => v.toString()).toList()));
          }
          break;
        case 'notIn':
          final list = _normalizeToList(filter.value);
          if (list.isEmpty) break; // Empty list = no filter (match all)
          if (col is GeneratedColumn<int>) {
            final ints = list
                .map((v) => v is int ? v : int.tryParse(v.toString()))
                .whereType<int>()
                .toList();
            if (ints.isNotEmpty) whereClauses.add(col.isNotIn(ints));
          } else if (col is GeneratedColumn<String>) {
            whereClauses
                .add(col.isNotIn(list.map((v) => v.toString()).toList()));
          }
          break;
        case 'notExists':
          // notExists: extract inner values and build IN clause.
          // Subquery-level negation is handled by buildPrimaryKeySubqueryExpression.
          dynamic innerVal = filter.value;
          if (innerVal is Map) {
            innerVal = innerVal['values'] ?? innerVal;
          }
          final neList = _normalizeToList(innerVal);
          if (neList.isEmpty) break;
          if (col is GeneratedColumn<int>) {
            final ints = neList
                .map((v) => v is int ? v : int.tryParse(v.toString()))
                .whereType<int>()
                .toList();
            if (ints.isNotEmpty) whereClauses.add(col.isIn(ints));
          } else if (col is GeneratedColumn<String>) {
            whereClauses
                .add(col.isIn(neList.map((v) => v.toString()).toList()));
          }
          break;
        default:
          throw Exception('Unsupported operator: ${filter.operator}');
      }
    }

    // Primary count query — built as a Future so it can run in parallel with
    // the data query below rather than serially.
    Future<int>? countFuture;
    Expression<int>? countExpr;
    if (isPrimaryTable && onCountFetched != null) {
      if (centerLat != null && centerLon != null && radiusInKm != null) {
        // Geo path: read lat/lon back into Dart for Haversine post-filter,
        // but route through selectOnly so the full whereClauses (bounding
        // box + any cross-table extraConstraints) are honored — the previous
        // raw-SQL path silently dropped extraConstraints from the count.
        final latCol = dynamicTable.$columns
            .firstWhere((c) => c.$name == 'latitude') as Expression<double>;
        final lonCol = dynamicTable.$columns
            .firstWhere((c) => c.$name == 'longitude') as Expression<double>;
        final geoQuery = sql.selectOnly(dynamicTable)
          ..addColumns([latCol, lonCol]);
        if (whereClauses.isNotEmpty) {
          geoQuery.where(buildAnd(whereClauses));
        }
        countFuture = () async {
          final rawResults = await geoQuery.get();

          const earthRadius = 6371.0;
          const degToRad = math.pi / 180.0;

          double haversine(double lat1, double lon1, double lat2, double lon2) {
            final dLat = (lat2 - lat1) * degToRad;
            final dLon = (lon2 - lon1) * degToRad;
            final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
                math.cos(lat1 * degToRad) *
                    math.cos(lat2 * degToRad) *
                    math.sin(dLon / 2) *
                    math.sin(dLon / 2);
            final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
            return earthRadius * c;
          }

          return rawResults.where((row) {
            final lat = row.read(latCol);
            final lon = row.read(lonCol);
            if (lat == null || lon == null) return false;
            return haversine(centerLat!, centerLon!, lat, lon) <= radiusInKm!;
          }).length;
        }();
      } else {
        // Use Drift's selectOnly so the same Expression<bool> whereClauses
        // (including cross-table subquery constraints) apply uniformly to
        // both the data fetch and the count.
        countExpr = countAll();
        final countQuery = sql.selectOnly(dynamicTable)
          ..addColumns([countExpr]);
        if (whereClauses.isNotEmpty) {
          countQuery.where(buildAnd(whereClauses));
        }
        countFuture =
            countQuery.getSingle().then((row) => row.read(countExpr!) ?? 0);
      }
    }

    // Data fetch query.
    // The primary table is already unique by primary key, so DISTINCT only adds
    // a sort/dedupe pass for no gain. Keep it only when the caller can't
    // guarantee uniqueness (i.e. legacy paths that don't project specific
    // columns and aren't the primary table).
    final useDistinct = !isPrimaryTable && selectColumns == null;
    final dataQuery = sql.selectOnly(dynamicTable, distinct: useDistinct);
    if (whereClauses.isNotEmpty) {
      dataQuery.where(buildAnd(whereClauses));
    }

    // Project only requested columns when provided, else fetch all columns.
    final List<GeneratedColumn<Object>> projectedColumns;
    if (selectColumns != null && selectColumns.isNotEmpty) {
      final wantedSnake = selectColumns.map((c) => camelToSnake(c)).toSet();
      projectedColumns = dynamicTable.$columns
          .where((c) => wantedSnake.contains(c.$name))
          .toList();
      if (projectedColumns.isEmpty) {
        // Fallback: avoid an empty SELECT list.
        projectedColumns.addAll(dynamicTable.$columns);
      }
    } else {
      projectedColumns = dynamicTable.$columns.toList();
    }
    dataQuery.addColumns(projectedColumns);

    // Apply ordering if provided
    if (orderBy != null && isPrimaryTable) {
      final SearchOrderBy searchOrder = orderBy;
      final orderColumn = camelToSnake(searchOrder.field);
      final col = dynamicTable.$columns.firstWhere(
        (c) => c.$name == orderColumn,
        orElse: () =>
            throw Exception('Order column $orderColumn not found in $table'),
      );

      final orderingMode = searchOrder.order.toUpperCase() == 'ASC'
          ? OrderingMode.asc
          : OrderingMode.desc;

      dataQuery.orderBy([OrderingTerm(expression: col, mode: orderingMode)]);
    }

    if (pagination != null && isPrimaryTable) {
      dataQuery.limit(pagination.limit, offset: pagination.offset);
    }

    // Drift serializes statements on a single connection, so a "parallel"
    // future actually executes back-to-back. Time count and data separately
    // so we can see which one is the cost.
    int countMs = 0;
    if (countFuture != null) {
      final cs = Stopwatch()..start();
      final total = await countFuture;
      countMs = cs.elapsedMilliseconds;
      onCountFetched!(total);
    }
    final dataSw = Stopwatch()..start();
    final results = await dataQuery.get();
    final dataMs = dataSw.elapsedMilliseconds;
    if (isPrimaryTable) {
      debug.debugPrint(
          '[QueryPerf] $table count=${countMs}ms data=${dataMs}ms rows=${results.length}');
    }

    // Only callers that fetch the full row need additional_fields decoded
    // (entity hydration). Resolver / hydration FK-only queries skip the JSON
    // work entirely.
    final shouldDecodeAdditionalFields = selectColumns == null;
    final modelNameCamel = _snakeToCamel(table);

    // Map result rows
    List<Map<String, dynamic>> rows = results.map((row) {
      final rowMap = {
        for (final column in projectedColumns)
          column.$name: column is GeneratedColumnWithTypeConverter
              ? row.readWithConverter(column)
              : row.read(column),
      };

      rowMap['modelName'] = modelNameCamel;

      if (shouldDecodeAdditionalFields &&
          rowMap.containsKey('additional_fields')) {
        final raw = rowMap['additional_fields'];
        if (raw is String && raw.trim().isNotEmpty) {
          try {
            final decoded = jsonDecode(raw);
            if (decoded is Map<String, dynamic>) {
              rowMap['additional_fields'] = decoded;
            }
          } catch (e) {}
        }
      }

      return rowMap;
    }).toList();

    // Final filtering using actual haversine distance
    if (centerLat != null && centerLon != null && radiusInKm != null) {
      const earthRadius = 6371.0;
      const degToRad = math.pi / 180.0;

      double haversine(double lat1, double lon1, double lat2, double lon2) {
        final dLat = (lat2 - lat1) * degToRad;
        final dLon = (lon2 - lon1) * degToRad;
        final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
            math.cos(lat1 * degToRad) *
                math.cos(lat2 * degToRad) *
                math.sin(dLon / 2) *
                math.sin(dLon / 2);
        final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
        return earthRadius * c;
      }

      rows = rows.where((row) {
        final lat = row['latitude'] as double?;
        final lon = row['longitude'] as double?;
        if (lat == null || lon == null) return false;
        return haversine(centerLat!, centerLon!, lat, lon) <= radiusInKm!;
      }).toList();
    }

    return rows;
  }
}

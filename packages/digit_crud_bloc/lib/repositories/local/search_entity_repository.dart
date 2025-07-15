import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math' as math;

import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';
import 'package:registration_delivery/models/entities/task.dart';

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
    final queriedModels = <String>{rootTable};
    final allResults = <Map<String, dynamic>>[];
    var totalCount = 0;
    final modelToResults = <String, List<Map<String, dynamic>>>{};

    final rootResults = await _queryRawTable(
      table: rootTable,
      filters: filters,
      select: select,
      pagination: pagination,
      isPrimaryTable: primaryTable == rootTable,
      onCountFetched: (count) {
        totalCount = count;
      },
    );

    final hydratedRoot =
        await _hydrateRawRows(rootResults, nestedModelMapping, rootTable);
    modelToResults[rootTable] = hydratedRoot;
    allResults.addAll(hydratedRoot);

    for (final model in select) {
      if (queriedModels.contains(model)) continue;

      final path = await _findShortestPath(
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
        final fromKey = camelToSnake(rel.localKey);
        final toTable = camelToSnake(rel.to);
        final toKey = camelToSnake(rel.foreignKey);

        final joinValues =
            currentRows.map((row) => row[fromKey]).whereType().toSet().toList();
        if (joinValues.isEmpty) break;

        final filter = SearchFilter(
          root: toTable,
          field: toKey,
          operator: 'in',
          value: joinValues,
        );

        currentRows = await _queryRawTable(
          table: toTable,
          filters: [filter],
          select: select,
          isPrimaryTable: primaryTable == toTable,
          pagination: pagination,
          onCountFetched: (count) {
            totalCount = count;
          },
        );
      }

      final enriched =
          await _hydrateRawRows(currentRows, nestedModelMapping, model);
      modelToResults[model] = enriched;
      allResults.addAll(enriched);
      queriedModels.add(model);
    }

    // Group results by model name
    final Map<String, List<EntityModel>> groupedResults = {};

    for (final row in allResults) {
      final modelName = row['modelName'] as String;
      if (!select.contains(modelName)) continue;

      final entity =
          dynamicEntityModelFromMap(modelName, snakeToCamelDeep(row));
      groupedResults.putIfAbsent(modelName, () => []).add(entity);
    }

    return (groupedResults, totalCount);
  }

  Future<List<Map<String, dynamic>>> _hydrateRawRows(
    List<Map<String, dynamic>> rawRows,
    Map<String, Map<String, NestedFieldMapping>> nestedModelMapping,
    String currentModelName,
  ) async {
    final enrichedRows = <Map<String, dynamic>>[];

    final modelNestedMapping = nestedModelMapping[currentModelName];
    if (modelNestedMapping == null) return rawRows;

    // Deep copy raw rows
    enrichedRows.addAll(rawRows.map((e) => Map<String, dynamic>.from(e)));

    for (final entry in modelNestedMapping.entries) {
      final targetTable = entry.value.table;
      final field = entry.value;

      final localKeySnake = camelToSnake(field.localKey);

      // Collect all non-null local key values from enriched rows
      final localValues = enrichedRows
          .map((row) => row[localKeySnake])
          .where((v) => v != null)
          .toSet();

      if (localValues.isEmpty) continue;

      // Query related table
      final targetResults = await _queryRawTable(
        table: targetTable,
        filters: [
          SearchFilter(
            root: targetTable,
            field: camelToSnake(field.foreignKey),
            operator: 'in',
            value: localValues.toList(),
          ),
        ],
        select: ['*'],
      );

      // Attach hydrated data to each enriched row
      for (final row in enrichedRows) {
        final localValue = row[localKeySnake];
        if (localValue == null) continue;

        // Match related rows based on foreign key
        final relatedRows = targetResults.where((targetRow) {
          return targetRow[camelToSnake(field.foreignKey)] == localValue;
        }).toList();

        row[entry.key] = field.type == NestedMappingType.one
            ? (relatedRows.isNotEmpty ? relatedRows.first : null)
            : relatedRows;
      }
    }

    return enrichedRows;
  }

  Future<List<Map<String, dynamic>>> _queryRawTable({
    required String table,
    required List<SearchFilter> filters,
    required List<String> select,
    PaginationParams? pagination,
    bool isPrimaryTable = false,
    void Function(int count)? onCountFetched,
  }) async {
    final dynamicTable = sql.allTables.firstWhere(
      (t) => t.actualTableName == table,
      orElse: () => throw Exception('Table $table not found'),
    );

    final List<Expression<bool>> whereClauses = [];

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

      final columnName = camelToSnake(filter.field);
      final col = dynamicTable.$columns.firstWhere(
        (c) => c.$name == columnName,
        orElse: () => throw Exception('Column $columnName not found in $table'),
      );

      switch (filter.operator) {
        case 'equals':
          whereClauses.add(col.equals(filter.value));
          break;
        case 'contains':
          whereClauses
              .add((col as Expression<String>).like('%${filter.value}%'));
          break;
        case 'isNotNull':
          whereClauses.add(col.isNotNull());
          break;
        case 'isNull':
          whereClauses.add(col.isNull());
          break;
        case 'in':
          final list = (filter.value as List);
          if (col is GeneratedColumn<int>) {
            whereClauses.add(col.isIn(list.cast<int>()));
          } else if (col is GeneratedColumn<String>) {
            whereClauses.add(col.isIn(list.cast<String>()));
          }
          break;
        case 'notIn':
          final list = (filter.value as List);
          if (col is GeneratedColumn<int>) {
            whereClauses.add(col.isNotIn(list.cast<int>()));
          } else if (col is GeneratedColumn<String>) {
            whereClauses.add(col.isNotIn(list.cast<String>()));
          }
          break;
        default:
          throw Exception('Unsupported operator: ${filter.operator}');
      }
    }

    // Primary count query
    if (isPrimaryTable && onCountFetched != null) {
      // Run same query without pagination, only filters
      final whereClause =
          _buildWhereClauseRaw(filters.where((f) => f.root == table).toList());
      final whereArgs =
          _buildWhereArgs(filters.where((f) => f.root == table).toList());

      int finalCount;

      if (centerLat != null && centerLon != null && radiusInKm != null) {
        // Need lat/lon values for Haversine filtering
        final countQuery = sql.customSelect(
          'SELECT latitude, longitude FROM $table WHERE $whereClause',
          variables: whereArgs,
        );

        final rawResults = await countQuery.get();

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

        finalCount = rawResults.where((row) {
          double? lat;
          double? lon;

          try {
            final latVal = row.read<double>('latitude');
            lat = (latVal is int) ? latVal.toDouble() : latVal as double?;
          } catch (e) {
            debugPrint('Failed to read latitude: $e');
            lat = null;
          }

          try {
            final lonVal = row.read<double>('longitude');
            lon = (lonVal is int) ? lonVal.toDouble() : lonVal as double?;
          } catch (e) {
            debugPrint('Failed to read longitude: $e');
            lon = null;
          }

          if (lat == null || lon == null) {
            debugPrint('Skipping row due to null lat/lon');
            return false;
          }

          final distance = haversine(centerLat!, centerLon!, lat, lon);
          debugPrint('Lat: $lat, Lon: $lon → Distance: $distance km');
          return distance <= radiusInKm!;
        }).length;
      } else {
        // Original optimized COUNT query
        final countQuery = sql.customSelect(
          'SELECT COUNT(*) AS total FROM $table WHERE $whereClause',
          variables: whereArgs,
        );

        final rawResults = await countQuery.get();
        finalCount = rawResults.first.read<int>('total');
      }

      onCountFetched(finalCount);
    }

    // Data fetch query
    final dataQuery = buildSelectQuery(
      isPrimaryTable: isPrimaryTable,
      table: table,
      filters: filters,
      pagination: pagination,
      whereClauses: whereClauses,
    );

    final results = await dataQuery.get();

    // Map result rows
    List<Map<String, dynamic>> rows = results.map((row) {
      final rowMap = {
        for (final column in dynamicTable.$columns)
          column.$name: column is GeneratedColumnWithTypeConverter
              ? row.readWithConverter(column)
              : row.read(column),
      };

      rowMap['modelName'] = _snakeToCamel(table);

      if (rowMap.containsKey('additional_fields')) {
        final raw = rowMap['additional_fields'];
        if (raw is String && raw.trim().isNotEmpty) {
          try {
            final decoded = jsonDecode(raw);
            if (decoded is Map<String, dynamic>) {
              rowMap['additional_fields'] = decoded;
            }
          } catch (e) {
            debugPrint('Failed to decode additional_fields JSON: $e');
          }
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

  Selectable<TypedResult> buildSelectQuery({
    required bool isPrimaryTable,
    required String table,
    required List<SearchFilter> filters,
    PaginationParams? pagination,
    required List<Expression<bool>> whereClauses,
  }) {
    final dynamicTable = sql.allTables.firstWhere(
      (t) => t.actualTableName == table,
      orElse: () => throw Exception('Table $table not found'),
    );

    final query = sql.selectOnly(dynamicTable, distinct: true);

    if (whereClauses.isNotEmpty) {
      query.where(buildAnd(whereClauses));
    }

    query.addColumns(dynamicTable.$columns);

    if (pagination != null && isPrimaryTable) {
      query.limit(pagination.limit, offset: pagination.offset);
    }

    return query;
  }

  String _buildWhereClauseRaw(List<SearchFilter> filters) {
    return filters.map((filter) {
      final column = camelToSnake(filter.field);
      switch (filter.operator) {
        case 'equals':
          return '$column = ?';
        case 'contains':
          return '$column LIKE ?';
        case 'isNotNull':
          return '$column IS NOT NULL';
        case 'isNull':
          return '$column IS NULL';
        case 'in':
          final values = filter.value as List;
          return '$column IN (${List.filled(values.length, '?').join(', ')})';
        case 'notIn':
          final values = filter.value as List;
          return '$column NOT IN (${List.filled(values.length, '?').join(', ')})';
        case 'within':
          // We'll handle bounding box manually; skip for raw SQL
          return '1 = 1'; // dummy true condition
        default:
          throw Exception('Unsupported operator: ${filter.operator}');
      }
    }).join(' AND ');
  }

  List<Variable> _buildWhereArgs(List<SearchFilter> filters) {
    final args = <Variable>[];

    for (final filter in filters) {
      switch (filter.operator) {
        case 'equals':
          args.add(Variable.withString(filter.value.toString()));
          break;
        case 'contains':
          args.add(Variable.withString('%${filter.value}%'));
          break;
        case 'in':
        case 'notIn':
          final list = filter.value as List;
          args.addAll(list.map((v) => Variable.withString(v.toString())));
          break;
        case 'isNotNull':
        case 'isNull':
        case 'within':
          // No variable needed
          break;
        default:
          throw Exception('Unsupported operator: ${filter.operator}');
      }
    }

    return args;
  }
}

EntityModel dynamicEntityModelFromMap(
    String modelName, Map<String, dynamic> map) {
  switch (modelName) {
    case 'individual':
      return IndividualModelMapper.fromMap(map);
    case 'household':
      return HouseholdModelMapper.fromMap(map);
    case 'projectBeneficiary':
      return ProjectBeneficiaryModelMapper.fromMap(map);
    case 'householdMember':
      return HouseholdMemberModelMapper.fromMap(map);
    case 'task':
      return TaskModelMapper.fromMap(map);

    default:
      return EntityModelMapper.fromMap(map);
  }
}

String camelToSnake(String input) {
  return input.replaceAllMapped(
    RegExp(r'[A-Z]'),
    (match) => '_${match.group(0)!.toLowerCase()}',
  );
}

Map<String, dynamic> snakeToCamelDeep(Map<String, dynamic> input) {
  return input.map((key, value) {
    final newKey = _snakeToCamel(key);
    final newValue = _transformValue(value);
    return MapEntry(newKey, newValue);
  });
}

dynamic _transformValue(dynamic value) {
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

String _snakeToCamel(String input) {
  final parts = input.split('_');
  return parts.first +
      parts.skip(1).map((p) => p[0].toUpperCase() + p.substring(1)).join();
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

Future<List<RelationshipMapping>> _findShortestPath({
  required Set<String> fromModels,
  required String toModel,
  required Map<String, List<RelationshipMapping>> graph,
}) async {
  final queue = Queue<List<RelationshipMapping>>();
  final visited = <String>{};

  for (final model in fromModels) {
    visited.add(model);
    for (final next in graph[model] ?? []) {
      queue.add([next]);
    }
  }

  while (queue.isNotEmpty) {
    final path = queue.removeFirst();
    final current = path.last.to;

    if (current == toModel) return path;

    for (final next in graph[current] ?? []) {
      if (!visited.contains(next.to)) {
        visited.add(next.to);
        queue.add([...path, next]);
      }
    }
  }

  return [];
}

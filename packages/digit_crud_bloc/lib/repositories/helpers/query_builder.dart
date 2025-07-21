/// QueryBuilder provides static utilities for building SQL queries, where clauses, and argument lists from filters.
import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QueryBuilder {
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
    final parts = input.split('_');
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
          return '1 = 1';
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
          break;
        default:
          throw Exception('Unsupported operator: ${filter.operator}');
      }
    }
    return args;
  }

  static Future<List<Map<String, dynamic>>> queryRawTable({
    required LocalSqlDataStore sql,
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
          buildWhereClauseRaw(filters.where((f) => f.root == table).toList());
      final whereArgs =
          buildWhereArgs(filters.where((f) => f.root == table).toList());

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
    final dataQuery = sql.selectOnly(dynamicTable, distinct: true);
    if (whereClauses.isNotEmpty) {
      dataQuery.where(buildAnd(whereClauses));
    }
    dataQuery.addColumns(dynamicTable.$columns);
    if (pagination != null && isPrimaryTable) {
      dataQuery.limit(pagination.limit, offset: pagination.offset);
    }

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
}

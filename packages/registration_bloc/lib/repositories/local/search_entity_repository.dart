import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:registration_bloc/models/entities/household_member.dart';
import 'package:registration_bloc/models/global_search_params.dart';
import 'package:registration_delivery/models/entities/household.dart';
import '../../models/entities/project_beneficiary.dart';

class SearchEntityRepository extends LocalRepository{
  SearchEntityRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<EntityModel>> search(EntitySearchModel query) {
    throw UnimplementedError();
  }

  @override
  DataModelType get type => throw UnimplementedError();
  Future<Map<String, List<EntityModel>>> searchEntities({
    required List<SearchFilter> filters,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    required Map<String, Map<String, NestedFieldMapping> > nestedModelMapping,
    required List<String> select,
    PaginationParams? pagination,
  }) async {
    return _buildAndExecuteSearchQuery(
      filters: filters,
      relationshipGraph: relationshipGraph,
      select: select,
      pagination: pagination,
      nestedModelMapping: nestedModelMapping,
    );
  }

  Future<Map<String, List<EntityModel>>> _buildAndExecuteSearchQuery({
    required List<SearchFilter> filters,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    required Map<String, Map<String, NestedFieldMapping>> nestedModelMapping,
    required List<String> select,
    required PaginationParams? pagination,
  }) async {
    final rootTable = filters.first.root;
    final queriedModels = <String>{rootTable};
    final allResults = <Map<String, dynamic>>[];
    final modelToResults = <String, List<Map<String, dynamic>>>{};

    final rootResults = await _queryRawTable(
      table: rootTable,
      filters: filters,
      select: select,
      pagination: pagination,
    );

    final hydratedRoot = await _hydrateRawRows(rootResults, nestedModelMapping, rootTable);
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

        final joinValues = currentRows.map((row) => row[fromKey]).whereType().toSet().toList();
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
          pagination: pagination,
        );
      }

      final enriched = await _hydrateRawRows(currentRows, nestedModelMapping, model);
      modelToResults[model] = enriched;
      allResults.addAll(enriched);
      queriedModels.add(model);
    }

    // Group results by model name
    final Map<String, List<EntityModel>> groupedResults = {};

    for (final row in allResults) {
      final modelName = row['modelName'] as String;
      if (!select.contains(modelName)) continue;

      final entity = dynamicEntityModelFromMap(modelName, snakeToCamelDeep(row));
      groupedResults.putIfAbsent(modelName, () => []).add(entity);
    }

    return groupedResults;
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
  }) async {

    // Dynamically build the table reference
    final dynamicTable = sql.allTables.firstWhere(
          (t) => t.actualTableName == table,
      orElse: () => throw Exception('Table $table not found'),
    );

    final query = sql.selectOnly(dynamicTable, distinct: true);

    // Build WHERE clause from filters
    final whereClauses = filters
        .where((f) => f.root == table)
        .map((filter) {
      final columnName = camelToSnake(filter.field);
      final col = dynamicTable.$columns.firstWhere(
            (c) => c.$name == columnName,
        orElse: () => throw Exception('Column $columnName not found in $table'),
      );

      switch (filter.operator) {
        case 'equals':
          return col.equals(filter.value);
        case 'contains':
          return (col as Expression<String>).like('%${filter.value}%');
        case 'isNotNull':
          return col.isNotNull();
        case 'isNull':
          return col.isNull();
        case 'in':
          if (filter.value is! List) {
            throw Exception("Operator 'in' expects a list value, got ${filter.value.runtimeType}");
          }
          final list = filter.value as List;

          if (col is GeneratedColumn<int>) {
            return (col as GeneratedColumn<int>).isIn(list.cast<int>());
          } else if (col is GeneratedColumn<String>) {
            return (col as GeneratedColumn<String>).isIn(list.cast<String>());
          } else {
            throw Exception("Unsupported column type for 'in' operator on column ${col.$name}");
          }

        case 'notIn':
          if (filter.value is! List) {
            throw Exception("Operator 'notIn' expects a list value, got ${filter.value.runtimeType}");
          }
          final list = filter.value as List;

          if (col is GeneratedColumn<int>) {
            return (col as GeneratedColumn<int>).isNotIn(list.cast<int>());
          } else if (col is GeneratedColumn<String>) {
            return (col as GeneratedColumn<String>).isNotIn(list.cast<String>());
          } else {
            throw Exception("Unsupported column type for 'notIn' operator on column ${col.$name}");
          }
        default:
          throw Exception('Unsupported operator: ${filter.operator}');
      }
    }).toList();

    if (whereClauses.isNotEmpty) {
      query.where(buildAnd(whereClauses));
    }

    // Apply pagination
    if (pagination != null) {
      query.limit(pagination.limit, offset: pagination.offset);
    }

    final List<Expression> selectedExpressions = [];

    query.addColumns(dynamicTable.$columns);
    selectedExpressions.addAll(dynamicTable.$columns);

    final rows = await query.get();

    return rows.map((row) {
      final rowMap = {
        for (final column in dynamicTable.$columns)
          column.$name: column is GeneratedColumnWithTypeConverter
              ? row.readWithConverter(column)
              : row.read(column),
      };
      rowMap['modelName'] = _snakeToCamel(table); // add model name to help filter later
      // ✅ Decode JSON for additionalFields if it exists
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
  }
}

EntityModel dynamicEntityModelFromMap(String modelName, Map<String, dynamic> map) {
  switch (modelName) {
    case 'individual':
      return IndividualModelMapper.fromMap(map);
    case 'household':
      return HouseholdModelMapper.fromMap(map);
    case 'projectBeneficiary':
      return ProjectBeneficiaryModelMapper.fromMap(map);
    case 'householdMember':
      return HouseholdMemberModelMapper.fromMap(map);
    default:
      throw Exception('Unknown model: $modelName');
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
  return parts.first + parts.skip(1).map((p) => p[0].toUpperCase() + p.substring(1)).join();
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
      return Function.apply(col.noSuchMethod, [Invocation.method(symbol, [])]) as Expression<bool>;
    }

    // For list-based methods like isIn(), isNotIn()
    if ((operator == 'isIn' || operator == 'isNotIn') && value is! List) {
      throw Exception("Operator '$operator' expects a List value");
    }

    // Normal method with one argument
    return Function.apply(col.noSuchMethod, [Invocation.method(symbol, [value])]) as Expression<bool>;
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


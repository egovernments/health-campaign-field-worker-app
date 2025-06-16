import 'dart:async';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';
import 'package:registration_bloc/models/global_search_params.dart';
import '../../models/entities/household.dart';
import '../../models/entities/project_beneficiary.dart';

class SearchEntityRepository extends LocalRepository{
  SearchEntityRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<EntityModel>> search(EntitySearchModel query) {
    throw UnimplementedError();
  }

  @override
  DataModelType get type => throw UnimplementedError();
  Future<List<EntityModel>> searchEntities({
    required List<SearchFilter> filters,
    required List<RelationshipMapping> relationships,
    required Map<String, Map<String, NestedFieldMapping> > nestedModelMapping,
    required List<String> select,
    PaginationParams? pagination,
  }) async {
    return _buildAndExecuteSearchQuery(
      filters: filters,
      relationships: relationships,
      select: select,
      pagination: pagination,
      nestedModelMapping: nestedModelMapping,
    );
  }

  Future<List<EntityModel>> _buildAndExecuteSearchQuery({
    required List<SearchFilter> filters,
    required List<RelationshipMapping> relationships,
    required Map<String, Map<String, NestedFieldMapping> > nestedModelMapping,
    required List<String> select,
    PaginationParams? pagination,
  }) async {
    if (filters.isEmpty) return [];

    final rootFilter = filters.first;
    final rootTable = rootFilter.root;

    // Step 1: Query the root table with the root filter
    final rootResults = await _queryRawTable(
      table: rootTable,
      filters: [rootFilter],
      select: [rootFilter.field], // only needed fields for join
    );

    if (rootResults.isEmpty) return [];

    // Step 2: Find the relationship path to final target table
    final rootToTargetMapping = relationships.where((rel) => rel.from == rootTable).toList();

    if (rootToTargetMapping.isEmpty) {
      throw Exception("No relationship mapping found from $rootTable");
    }

    // Step 3: Use relationship to extract join key values from rootResults
    final joinedResults = <Map<String, dynamic>>[];
    for (final rel in rootToTargetMapping) {
      final targetTable = rel.to;

      final joinValues = rootResults
          .map((row) => row[camelToSnake(rel.localKey)])
          .where((val) => val != null)
          .toSet()
          .toList();

      if (joinValues.isEmpty) continue;

      // Step 4: Construct a dynamic filter to get results from target table
      final targetFilter = SearchFilter(
        root: targetTable,
        field: rel.foreignKey,
        operator: 'in',
        value: joinValues,
      );

      final targetResults = await _queryRawTable(
        table: targetTable,
        filters: [targetFilter],
        select: select,
        pagination: pagination,
      );

      // Final joinedResults from primary + relationship joins
      final enrichedRawRows = await _hydrateRawRows(targetResults, nestedModelMapping, targetTable);

      joinedResults.addAll(enrichedRawRows);
    }



    // Convert raw enriched rows into typed EntityModel instances
    final results = joinedResults
        .map((row) => dynamicEntityModelFromMap(
      select.first,
      snakeToCamelDeep(row),
    ))
        .toList();

    return results;
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
        row[entry.key] = field.type == NestedMappingType.one
            ? (targetResults.isNotEmpty ? targetResults.first : null)
            : targetResults;
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
      return {
        for (final column in dynamicTable.$columns)
          column.$name: column is GeneratedColumnWithTypeConverter
              ? row.readWithConverter(column)
              : row.read(column),
      };
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


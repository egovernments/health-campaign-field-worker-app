import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import '../../models/global_search_params.dart';
import '../../utils/utils.dart';
import '../helpers/hydration_helper.dart';
import '../helpers/query_builder.dart';
import '../helpers/query_planner.dart';

/// SearchEntityRepository provides advanced querying and hydration for dynamic entities.
/// Supports filtering, relationships, nested models, and geospatial queries.

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
    // 1. Build query plan
    final plan = await QueryPlanner.build(
      filters: filters,
      relationshipGraph: relationshipGraph,
      select: select,
      primaryModel: primaryTable,
      pagination: pagination,
    );

    // 2. Execute optimized join query
    var totalCount = 0;
    final rawRows = await QueryBuilder.queryWithJoins(
      sql: sql,
      plan: plan,
      applyCount: true,
      onCountFetched: (count) => totalCount = count,
    );

    // 3. Split joined rows into per-model raw maps
    final modelToRawRows = <String, List<Map<String, dynamic>>>{};
    for (final raw in rawRows) {
      // For each selected model, extract its slice from the flat row.
      for (final model in select) {
        final snakeModel = QueryBuilder.camelToSnake(model);
        final modelSlice = <String, dynamic>{};

        raw.forEach((key, value) {
          // Expect aliasing in the form of "table_column" (e.g., individual_given_name)
          if (!key.startsWith('${snakeModel}_')) return;
          final columnName = key
              .substring(snakeModel.length + 1); // remove prefix + underscore
          modelSlice[columnName] = value;
        });

        if (modelSlice.isEmpty) continue;

        // Optionally include modelName for compatibility if something downstream expects it
        modelSlice['modelName'] = model;

        modelToRawRows.putIfAbsent(model, () => []).add(modelSlice);
      }
    }

    // 4. Hydrate nested models per model (if there are nested mappings for that model)
    final modelToHydratedRows = <String, List<Map<String, dynamic>>>{};
    for (final model in modelToRawRows.keys) {
      final rows = modelToRawRows[model]!;
      final hydrated = await HydrationHelper.hydrateRawRows(
        sql,
        this,
        rows,
        nestedModelMapping,
        model,
      );
      modelToHydratedRows[model] = hydrated;
    }

    // 5. Convert to EntityModel instances grouped by model
    final groupedResults = <String, List<EntityModel>>{};
    for (final model in modelToHydratedRows.keys) {
      final hydratedRows = modelToHydratedRows[model]!;
      for (final row in hydratedRows) {
        if (!select.contains(model)) continue;
        final entity = CrudBlocSingleton.instance.dynamicEntityModelListener
            .dynamicEntityModelFromMap(
                model, QueryBuilder.snakeToCamelDeep(row));
        if (entity != null) {
          groupedResults.putIfAbsent(model, () => []).add(entity);
        }
      }
    }

    return (groupedResults, totalCount);
  }
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

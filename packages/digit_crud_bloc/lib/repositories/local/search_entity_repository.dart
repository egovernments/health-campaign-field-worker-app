import 'dart:async';

import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

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
    // ✅ 1. Build query plan
    final plan = await QueryPlanner.build(
      filters: filters,
      relationshipGraph: relationshipGraph,
      select: select,
      primaryModel: primaryTable,
      pagination: pagination,
    );

    // ✅ 2. Execute optimized join query
    var totalCount = 0;
    final rawRows = await QueryBuilder.queryWithJoins(
      sql: sql,
      plan: plan,
      applyCount: true,
      onCountFetched: (count) => totalCount = count,
    );

    // ✅ 3. Hydrate nested models (uses your current logic)
    final hydrated = await HydrationHelper.hydrateRawRows(
      sql,
      this,
      rawRows,
      nestedModelMapping,
      plan.rootTable,
    );

    // ✅ 4. Convert to grouped EntityModel list
    final groupedResults = <String, List<EntityModel>>{};
    for (final row in hydrated) {
      final modelName = row['modelName'] as String;
      if (!select.contains(modelName)) continue;

      final entity = CrudBlocSingleton.instance.dynamicEntityModelListener
          .dynamicEntityModelFromMap(
              modelName, QueryBuilder.snakeToCamelDeep(row));
      if (entity != null) {
        groupedResults.putIfAbsent(modelName, () => []).add(entity);
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

import 'package:digit_crud_bloc/repositories/helpers/relationship_graph_helper.dart';
import 'package:flutter/cupertino.dart';

import '../../models/global_search_params.dart';
import '../../models/query_plan.dart';

class QueryPlanner {
  static Future<QueryPlan> build({
    required List<SearchFilter> filters,
    required Map<String, List<RelationshipMapping>> relationshipGraph,
    required List<String> select,
    String? primaryModel,
    PaginationParams? pagination,
  }) async {
    final rootTable = primaryModel ?? filters.first.root;
    final selectModels = select.toSet();

    final joins = <QueryJoin>[];
    final visited = <String>{rootTable};

    final allReferencedModels = <String>{
      ...selectModels,
      ...filters.map((f) => f.root),
    };

    for (final model in allReferencedModels) {
      if (model == rootTable) continue;

      final path = await RelationshipGraphHelper.findShortestPath(
        fromModels: visited,
        toModel: model,
        graph: relationshipGraph,
      );

      if (path.isEmpty) {
        debugPrint("No path from $rootTable to $model");
        continue;
      }

      for (final rel in path) {
        final alreadyJoined = joins.any((j) =>
            j.fromTable == rel.from &&
            j.toTable == rel.to &&
            j.localKey == rel.localKey &&
            j.foreignKey == rel.foreignKey);

        if (!alreadyJoined) {
          joins.add(QueryJoin(
            fromTable: rel.from,
            toTable: rel.to,
            localKey: rel.localKey,
            foreignKey: rel.foreignKey,
          ));
        }

        visited.add(rel.to);
      }
    }

    final selects = selectModels
        .map((model) => QuerySelect(table: model, column: '*'))
        .toList();

    return QueryPlan(
      rootTable: rootTable,
      joins: joins,
      selects: selects,
      filters: filters,
      pagination: pagination,
    );
  }
}

/// RelationshipGraphHelper provides static utilities for relationship graph pathfinding.
import 'dart:collection';
import 'package:digit_crud_bloc/models/global_search_params.dart';

class RelationshipGraphHelper {
  static Future<List<RelationshipMapping>> findShortestPath({
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
} 
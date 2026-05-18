import 'package:digit_data_model/data_model.dart';
import 'package:flutter/cupertino.dart';

import 'value_resolver.dart';

/// Groups entities by their runtime type or by custom field values.
class EntityGrouper {
  final IValueResolver _resolver;

  EntityGrouper(this._resolver);

  /// Groups a list of entities by their runtime type name.
  Map<String, List<dynamic>> groupEntitiesByType(List<EntityModel> entities) {
    final map = <String, List<dynamic>>{};
    for (final entity in entities) {
      final typeName = entity.runtimeType.toString();
      map.putIfAbsent(typeName, () => []).add(entity);
    }
    return map;
  }

  /// Groups a list of entities by a custom field path
  /// (e.g., "additionalFields.fields.mrnNumber").
  /// Returns a list of group objects:
  /// [{"groupKey": "value1", "items": [entity1, entity2]}, ...]
  List<Map<String, dynamic>> groupEntitiesByCustomField(
    List<dynamic> entities,
    String fieldPath,
  ) {
    final Map<String, List<dynamic>> groupedByField = {};
    int nullCounter = 0;

    for (final entity in entities) {
      try {
        // Resolve the field value for this entity
        final fieldValue = _resolver.resolveValue(fieldPath, entity, {});

        // Create unique keys for null values instead of grouping them together
        final groupKey = fieldValue?.toString() ?? 'null_${nullCounter++}';

        groupedByField.putIfAbsent(groupKey, () => []).add(entity);
      } catch (e) {
        debugPrint('Error grouping entity by field $fieldPath: $e');
        // Put ungroupable entities in unique 'null' groups
        groupedByField
            .putIfAbsent('null_${nullCounter++}', () => [])
            .add(entity);
      }
    }

    // Convert to list of group objects with groupKey and items
    final result = <Map<String, dynamic>>[];
    for (final entry in groupedByField.entries) {
      result.add({
        'groupKey': entry.key,
        'items': entry.value,
      });
    }

    return result;
  }
}

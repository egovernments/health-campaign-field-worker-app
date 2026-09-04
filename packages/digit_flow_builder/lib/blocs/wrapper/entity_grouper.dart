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
  ///
  /// When an entity is missing the field, `groupKey` is emitted as `null`
  /// (rather than a synthesised placeholder like "null_0") so display
  /// configs can hide the group cleanly with `item.groupKey == null`.
  /// Internally each field-less entity still lands in its own bucket so
  /// unrelated null-keyed entities aren't merged.
  List<Map<String, dynamic>> groupEntitiesByCustomField(
    List<dynamic> entities,
    String fieldPath,
  ) {
    final Map<String, List<dynamic>> groupedByField = {};
    final Map<String, dynamic> originalKeys = {};
    int nullCounter = 0;

    for (final entity in entities) {
      try {
        final fieldValue = _resolver.resolveValue(fieldPath, entity, {});
        final bucketKey =
            fieldValue?.toString() ?? '__nullGroup_${nullCounter++}';
        groupedByField.putIfAbsent(bucketKey, () => []).add(entity);
        originalKeys.putIfAbsent(bucketKey, () => fieldValue);
      } catch (e) {
        debugPrint('Error grouping entity by field $fieldPath: $e');
        final bucketKey = '__nullGroup_${nullCounter++}';
        groupedByField.putIfAbsent(bucketKey, () => []).add(entity);
        originalKeys.putIfAbsent(bucketKey, () => null);
      }
    }

    final result = <Map<String, dynamic>>[];
    for (final entry in groupedByField.entries) {
      result.add({
        'groupKey': originalKeys[entry.key],
        'items': entry.value,
      });
    }

    return result;
  }
}

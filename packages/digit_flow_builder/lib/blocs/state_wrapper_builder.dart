import 'package:digit_data_model/data_model.dart';

/// Utility for reading field values from any EntityModel using generated toMap()
class EntityFieldAccessor {
  static dynamic getFieldValue(EntityModel entity, String fieldName) {
    final map = entity.toMap();
    return map[fieldName];
  }
}

/// Enhanced field accessor that handles entity field access safely
class EnhancedEntityFieldAccessor {
  static dynamic getFieldValue(EntityModel entity, String fieldName) {
    switch (fieldName) {
      case 'boundaryCode':
        return entity.boundaryCode;
      case 'isDeleted':
        return entity.isDeleted;
      case 'auditDetails':
        return entity.auditDetails;
      case 'clientAuditDetails':
        return entity.clientAuditDetails;
      default:
        try {
          final map = entity.toMap();
          if (map.containsKey(fieldName)) {
            return map[fieldName];
          }

          final variations = [
            fieldName,
            fieldName.toLowerCase(),
            fieldName.toUpperCase(),
            _camelCase(fieldName),
            _snakeCase(fieldName),
          ];

          for (final variation in variations) {
            if (map.containsKey(variation)) {
              return map[variation];
            }
          }

          throw Exception(
            'Field "$fieldName" not found on entity of type ${entity.runtimeType}. '
            'Available fields: ${map.keys.join(', ')}',
          );
        } catch (e) {
          throw Exception(
            'Error accessing field "$fieldName" on entity of type ${entity.runtimeType}: $e',
          );
        }
    }
  }

  static String _camelCase(String input) {
    if (input.isEmpty) return input;
    return input[0].toLowerCase() + input.substring(1);
  }

  static String _snakeCase(String input) {
    return input.replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => '_${match.group(0)!.toLowerCase()}',
    );
  }
}

class WrapperBuilder {
  final List<EntityModel> entities;
  final Map<String, dynamic> config;

  WrapperBuilder(this.entities, this.config);

  List<dynamic> build() {
    final entityMap = _groupEntitiesByType();
    final List<dynamic> wrappers = [];

    final rootEntityType = config['rootEntity'];
    final roots = entityMap[rootEntityType] ?? [];

    for (final root in roots) {
      if (!_passesFilters(root, entityMap)) continue;

      final wrapperData = <String, dynamic>{rootEntityType: root};

      for (final relation in config['relations'] ?? []) {
        final relatedEntities =
            _findRelatedEntities(root, relation, wrapperData, entityMap);
        wrapperData[relation['name']] = relatedEntities;
      }

      wrappers.add(wrapperData);
    }

    return wrappers;
  }

  Map<String, List<dynamic>> _groupEntitiesByType() {
    final map = <String, List<dynamic>>{};
    for (final entity in entities) {
      final typeName = entity.runtimeType.toString();
      map.putIfAbsent(typeName, () => []).add(entity);
    }
    return map;
  }

  bool _passesFilters(dynamic root, Map<String, List<dynamic>> entityMap) {
    final filters = config['filters'] as List<dynamic>?;
    if (filters == null || filters.isEmpty) return true;

    for (final filter in filters) {
      final field = filter['field'];
      final equals = filter['equals'];

      if (!filter.containsKey('entity')) {
        // Apply filter directly to the root entity
        final value = EnhancedEntityFieldAccessor.getFieldValue(root, field);
        if (equals != null && value != equals) {
          return false;
        }
      } else {
        // Original entity-based filter logic
        final entityType = filter['entity'];
        final condition = filter['condition'];
        final join = filter['join'];

        final filterEntities = entityMap[entityType] ?? [];

        bool hasMatchingEntity = false;
        for (final entity in filterEntities) {
          bool conditionMatches = false;
          if (condition['equals'] != null) {
            final fieldValue = EnhancedEntityFieldAccessor.getFieldValue(
                entity, condition['field']);
            conditionMatches = fieldValue == condition['equals'];
          }

          if (conditionMatches && join != null) {
            final sourceValue = EnhancedEntityFieldAccessor.getFieldValue(
                entity, join['sourceField']);
            final targetValue = EnhancedEntityFieldAccessor.getFieldValue(
                root, join['targetField']);
            hasMatchingEntity = sourceValue == targetValue;
          } else if (conditionMatches) {
            hasMatchingEntity = true;
          }

          if (hasMatchingEntity) break;
        }

        if (!hasMatchingEntity) return false;
      }
    }

    return true;
  }

  List<dynamic> _findRelatedEntities(
    dynamic root,
    Map<String, dynamic> relation,
    Map<String, dynamic> wrapperData,
    Map<String, List<dynamic>> entityMap,
  ) {
    final entityType = relation['entity'];
    final candidates = entityMap[entityType] ?? [];

    final match = relation['match'] as Map<String, dynamic>?;
    if (match == null) return [];

    final targetField = match['field'] as String?;
    final equalsFrom = match['equalsFrom'] as String?;
    final inFrom = match['inFrom'] as String?;

    final equalsValue = equalsFrom != null
        ? _resolveValue(equalsFrom, root, wrapperData)
        : null;
    final inValues =
        inFrom != null ? _resolveList(inFrom, wrapperData).toSet() : null;

    var related = candidates.where((e) {
      if (targetField == null) return false;
      final candidateValue = _resolveValue(targetField, e, wrapperData);
      if (equalsValue != null) return candidateValue == equalsValue;
      if (inValues != null) return inValues.contains(candidateValue);
      return false;
    }).toList();

    final filters = relation['filters'] as List<dynamic>? ?? [];
    related = related.where((entity) {
      return filters.every((filter) {
        final field = filter['field'];
        final expected = filter['equals'];
        final actual = _resolveValue(field, entity, wrapperData);
        return actual == expected;
      });
    }).toList();

    return related;
  }

  dynamic _resolveValue(
      String path, dynamic root, Map<String, dynamic> wrapperData) {
    final parts = path.split('.');

    if (parts.length == 1) {
      if (root is EntityModel) {
        final value = EnhancedEntityFieldAccessor.getFieldValue(root, parts[0]);
        return value;
      }
      return null;
    }

    dynamic current = wrapperData;

    for (var i = 0; i < parts.length; i++) {
      final part = parts[i];
      final isLast = i == parts.length - 1;

      // If current is a Map, index directly
      if (current is Map) {
        current = current[part];
        continue;
      }

      // If current is a List:
      if (current is List) {
        // Numeric index into the list: members.0.name
        if (int.tryParse(part) != null) {
          final idx = int.parse(part);
          if (idx >= 0 && idx < current.length) {
            current = current[idx];
            continue;
          } else {
            return null;
          }
        }

        // Non-numeric: map each element to the requested field and flatten results
        final List<dynamic> next = [];
        for (final item in current) {
          dynamic val;
          if (item is Map) {
            val = item[part];
          } else if (item is EntityModel) {
            val = EnhancedEntityFieldAccessor.getFieldValue(item, part);
          } else if (item is List && int.tryParse(part) != null) {
            final idx = int.parse(part);
            if (idx >= 0 && idx < item.length) val = item[idx];
          }

          if (val != null) {
            if (val is Iterable && val is! String) {
              next.addAll(val.where((e) => e != null));
            } else {
              next.add(val);
            }
          }
        }

        if (next.isEmpty) return null;

        // If this is the last path part and next has exactly one value,
        // collapse to the single value to preserve existing scalar semantics.
        if (isLast && next.length == 1) {
          current = next.first;
        } else {
          current = next;
        }
        continue;
      }

      // If current is an EntityModel, read the field via accessor
      if (current is EntityModel) {
        current = EnhancedEntityFieldAccessor.getFieldValue(current, part);
        continue;
      }

      // If nothing matched, bail out
      return null;
    }
    return current;
  }

  List<dynamic> _resolveList(String path, Map<String, dynamic> wrapperData) {
    final value = _resolveValue(path, null, wrapperData);
    if (value is List) {
      return value;
    }
    return [value];
  }
}

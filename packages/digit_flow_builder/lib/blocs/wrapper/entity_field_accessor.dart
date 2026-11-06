import 'package:digit_data_model/data_model.dart';

/// Utility for reading field values from any EntityModel using generated toMap()
class EntityFieldAccessor {
  static dynamic getFieldValue(EntityModel entity, String fieldName) {
    final map = entity.toMap();
    return map[fieldName];
  }
}

/// Enhanced field accessor that handles entity field access safely with caching
class EnhancedEntityFieldAccessor {
  // Cache for toMap() results - cleared per build cycle
  static final Map<EntityModel, Map<String, dynamic>> _mapCache = {};

  static Map<String, dynamic> _getCachedMap(EntityModel entity) {
    return _mapCache.putIfAbsent(entity, () => entity.toMap());
  }

  static void clearCache() {
    _mapCache.clear();
  }

  static dynamic getFieldValue(EntityModel entity, String fieldName) {
    // Dotted paths walk Maps/Lists. Handles additionalFields.fields.<key>
    // specially: looks up the entry where key == <key> and returns its value.
    // Opt-in: only activates when the caller passes a dotted string.
    if (fieldName.contains('.')) {
      return _resolveNestedPath(entity, fieldName);
    }

    // Fast path for common fields - avoid toMap() call
    switch (fieldName) {
      case 'boundaryCode':
        return entity.boundaryCode;
      case 'isDeleted':
        return entity.isDeleted;
      case 'auditDetails':
        return entity.auditDetails;
      case 'clientAuditDetails':
        return entity.clientAuditDetails;
    }

    // Get cached map
    final map = _getCachedMap(entity);

    // Try exact match first
    if (map.containsKey(fieldName)) {
      return map[fieldName];
    }

    // Try camelCase and snake_case only
    final camelCase = _camelCase(fieldName);
    if (camelCase != fieldName && map.containsKey(camelCase)) {
      return map[camelCase];
    }

    final snakeCase = _snakeCase(fieldName);
    if (snakeCase != fieldName && map.containsKey(snakeCase)) {
      return map[snakeCase];
    }

    throw Exception(
      'Field "$fieldName" not found on entity of type ${entity.runtimeType}. '
      'Available fields: ${map.keys.join(', ')}',
    );
  }

  // Walk a dotted field path against an entity's toMap() output.
  // Special-cases the `additionalFields.fields.<key>` pattern so callers can
  // address individual fields inside the additionalFields List<{key,value}>.
  static dynamic _resolveNestedPath(EntityModel entity, String path) {
    final parts = path.split('.');
    dynamic current = _getCachedMap(entity);
    for (int i = 0; i < parts.length; i++) {
      final part = parts[i];
      if (current == null) return null;
      if (current is Map) {
        // additionalFields.fields.<key> → find entry where key == <key>
        if (part == 'fields' &&
            i + 1 < parts.length &&
            current['fields'] is List) {
          final fieldsList = current['fields'] as List;
          final key = parts[i + 1];
          for (final f in fieldsList) {
            if (f is Map && f['key'] == key) {
              return f['value'];
            }
          }
          return null;
        }
        current = current[part];
      } else {
        return null;
      }
    }
    return current;
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

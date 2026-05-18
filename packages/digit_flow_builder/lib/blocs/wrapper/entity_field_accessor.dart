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

import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_forms_engine/utils/utils.dart';
import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:flutter/cupertino.dart';

import '../utils/utils.dart';

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
    final List<dynamic> wrappers = [];
    try {
      final entityMap = _groupEntitiesByType();
      final rootEntityType = config['rootEntity'];
      final roots = entityMap[rootEntityType] ?? [];

      for (final root in roots) {
        if (!_passesFilters(root, entityMap)) continue;

        final wrapperData = <String, dynamic>{rootEntityType: root};

        // 1. Build relations
        for (final relation in config['relations'] ?? []) {
          final relatedEntities =
              _findRelatedEntities(root, relation, wrapperData, entityMap);
          wrapperData[relation['name']] = relatedEntities;
        }

        // 2. Apply normal fields (supports String or Map config)
        final fields = config['fields'] as Map<String, dynamic>? ?? {};
        for (final entry in fields.entries) {
          final valueConfig = entry.value;
          if (valueConfig is String) {
            wrapperData[entry.key] =
                _resolveValue(valueConfig, root, wrapperData);
          } else if (valueConfig is Map<String, dynamic>) {
            wrapperData[entry.key] =
                _evaluateFieldMap(valueConfig, root, wrapperData);
          } else {
            wrapperData[entry.key] = valueConfig;
          }
        }

        // 3. Apply computed fields
        final computed = _applyComputed(wrapperData, config);
        wrapperData.addAll(computed);

        // 4. Apply computed list fields
        final computedList = _applyComputedList(wrapperData, config);
        wrapperData.addAll(computedList);

        wrappers.add(wrapperData);
      }
    } catch (e, st) {
      debugPrint('WrapperBuilder.build error: $e\n$st');
    }
    return wrappers;
  }

  // ------------------------- Helpers -------------------------

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
        final value = EnhancedEntityFieldAccessor.getFieldValue(root, field);
        if (equals != null && value != equals) return false;
      } else {
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
      Map<String, List<dynamic>> entityMap) {
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

  dynamic _traverse(dynamic obj, String path) {
    if (obj == null || path.isEmpty) return null;
    final parts = path.split('.');
    dynamic current = obj;

    for (final part in parts) {
      if (current == null) return null;

      if (current is Map) {
        current = current[part];
      } else if (current is EntityModel) {
        current = EnhancedEntityFieldAccessor.getFieldValue(current, part);
      } else if (current is String) {
        // Try parsing JSON string
        try {
          final decoded = jsonDecode(current);
          if (decoded is Map) {
            current = decoded[part];
          } else {
            return null;
          }
        } catch (_) {
          return null; // not valid JSON
        }
      } else {
        // Fallback for nested POJOs
        try {
          if ((current as dynamic).toJson is Function) {
            current = (current as dynamic).toJson()[part];
          } else if ((current as dynamic).toMap is Function) {
            current = (current as dynamic).toMap()[part];
          } else {
            return null;
          }
        } catch (_) {
          return null;
        }
      }
    }
    return current;
  }

  dynamic _evaluateFieldMap(Map<String, dynamic> fieldConfig, dynamic root,
      Map<String, dynamic> wrapperData) {
    var list = _resolveValue(fieldConfig['from'], root, wrapperData);
    debugPrint('FieldMap[from]: ${fieldConfig['from']} -> $list');
    debugPrint('FieldMap config: $fieldConfig');

    if (list == null) {
      list = [];
    } else if (list is! Iterable) {
      list = [list]; // wrap single object into a list
    }
    // map
    if (fieldConfig.containsKey('map')) {
      final mapExpr = fieldConfig['map'];
      list = list.map((item) => _resolveValue(mapExpr, item, wrapperData));
    }

    // where - supports both single condition and multiple conditions
    if (fieldConfig.containsKey('where')) {
      final whereConf = fieldConfig['where'];

      // Handle multiple where conditions (array of conditions)
      if (whereConf is List) {
        debugPrint('Evaluating multiple where conditions: $whereConf');
        list = list.where((item) {
          final result = whereConf.every(
              (condition) => _evaluateCondition(condition, item, wrapperData));
          debugPrint('Item $item passed all conditions: $result');
          return result;
        });
      }
      // Handle single where condition (legacy support)
      else if (whereConf is Map) {
        debugPrint('Evaluating single where condition: $whereConf');
        list = list.where((item) {
          final result = _evaluateCondition(whereConf, item, wrapperData);
          debugPrint('Item $item passed condition: $result');
          return result;
        });
      }
    }

    // select
    if (fieldConfig.containsKey('select')) {
      final sel = fieldConfig['select'];
      list = list.map((item) => _resolveValue(sel, item, wrapperData));
    }

    debugPrint('After where: $list');

    list = list.toList();

    // takeLast
    if (fieldConfig['takeLast'] == true && list.isNotEmpty) {
      list = [list.last];
    }

    // takeFirst
    if (fieldConfig['takeFirst'] == true && list.isNotEmpty) {
      list = [list.first];
    }

    // default
    if (list.isEmpty && fieldConfig.containsKey('default')) {
      return fieldConfig['default'];
    }

    // collapse single-item lists
    if (list.length == 1) return list.first;

    return list;
  }

  dynamic _resolveValue(
      String path, dynamic root, Map<String, dynamic> wrapperData) {
    try {
      String expr = path.trim();

      // Strip template braces
      if (expr.startsWith('{{') && expr.endsWith('}}')) {
        expr = expr.substring(2, expr.length - 2).trim();
      }

      // now shortcut
      if (expr == 'now') return DateTime.now().millisecondsSinceEpoch;

      // singleton access
      if (expr.startsWith('singleton.')) {
        final singleton = singletonToMap();
        final subPath = expr.replaceFirst('singleton.', '');
        return _traverse(singleton, subPath);
      }

      final parts = expr.split('.');
      dynamic current;

      // FIRST check wrapperData
      if (wrapperData.containsKey(parts[0])) {
        current = wrapperData[parts[0]];
        parts.removeAt(0);
        if (parts.isEmpty) return current;
      }
      // root Map
      else if (root is Map) {
        current = root[parts[0]];
        parts.removeAt(0);
        if (parts.isEmpty) return current; // ✅ short-circuit for simple fields
      }
      // root EntityModel
      else if (root is EntityModel) {
        current = EnhancedEntityFieldAccessor.getFieldValue(root, parts[0]);
        parts.removeAt(0);
        if (parts.isEmpty) return current;
      }
      // AdditionalField
      else if (root is AdditionalField) {
        if (parts[0] == 'key') return root.key;
        if (parts[0] == 'value') return root.value;
        return null;
      } else {
        return null;
      }

      // traverse remaining parts
      for (var i = 0; i < parts.length; i++) {
        final part = parts[i];
        final isLast = i == parts.length - 1;
        if (current == null) return null;

        if (current is Map) {
          current = current[part];
          continue;
        }

        if (current is List) {
          final idx = int.tryParse(part);
          if (idx != null && idx >= 0 && idx < current.length) {
            current = current[idx];
          } else {
            final List<dynamic> next = [];
            for (final item in current) {
              dynamic val;
              if (item is Map) {
                val = item[part];
              } else if (item is EntityModel)
                val = EnhancedEntityFieldAccessor.getFieldValue(item, part);
              else if (item is AdditionalField) if ((part == 'key')) {
                val = item.key;
              } else {
                val = (part == 'value') ? item.value : null;
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
            current = (isLast && next.length == 1) ? next.first : next;
          }
          continue;
        }

        if (current is AdditionalField) {
          current = (part == 'key')
              ? current.key
              : (part == 'value')
                  ? current.value
                  : null;
          continue;
        }

        if (current is EntityModel) {
          current = EnhancedEntityFieldAccessor.getFieldValue(current, part);
          continue;
        }

        return null;
      }

      return current;
    } catch (e) {
      debugPrint('WrapperBuilder._resolveValue error: $e for path=$path');
      return null;
    }
  }

  List<dynamic> _resolveList(String path, Map<String, dynamic> wrapperData) {
    final value = _resolveValue(path, null, wrapperData);
    if (value is List) return value;
    return [value];
  }

  /// Helper to evaluate a single condition for where clauses
  bool _evaluateCondition(
      dynamic condition, dynamic item, Map<String, dynamic> wrapperData) {
    if (condition is Map<String, dynamic>) {
      debugPrint('Evaluating condition: $condition on item: $item');
      // logical operators
      if (condition.containsKey('and')) {
        final List list = condition['and'];
        return list.every((c) => _evaluateCondition(c, item, wrapperData));
      }
      if (condition.containsKey('or')) {
        final List list = condition['or'];
        return list.any((c) => _evaluateCondition(c, item, wrapperData));
      }

      final left = _resolveValue(condition['left'], item, wrapperData);
      final right = _resolveValue(condition['right'], item, wrapperData);

      debugPrint(
          'Condition evaluation: left=$left (${condition['left']}) ${condition['operator']} right=$right (${condition['right']})');

      // numeric comparison (for milliseconds)
      switch (condition['operator']) {
        case 'eq':
        case 'equals':
          return left == right;
        case 'neq':
        case 'notEquals':
          return left != right;
        case 'lt':
          if (left is num && right is num) return left < right;
          return false;
        case 'lte':
          if (left is num && right is num) return left <= right;
          return false;
        case 'gt':
          if (left is num && right is num) return left > right;
          return false;
        case 'gte':
          if (left is num && right is num) return left >= right;
          return false;
        case 'contains':
          return left is String && right is String
              ? left.contains(right)
              : false;
        case 'in':
          return right is List ? right.contains(left) : false;
        default:
          return false;
      }
    }
    return false;
  }
}

Map<String, dynamic> _applyComputed(
  Map<String, dynamic> wrapperData,
  Map<String, dynamic> config,
) {
  final computed = config['computed'] as Map<String, dynamic>? ?? {};
  final results = <String, dynamic>{};

  for (final entry in computed.entries) {
    final key = entry.key;
    final conf = entry.value as Map<String, dynamic>;
    debugPrint('Computed[$key] config=$conf');

    if (conf.containsKey('condition')) {
      results[key] = ConditionEvaluator.evaluate(
              {...wrapperData, ...results}, conf['condition']) ??
          conf['fallback'];
    } else if (conf.containsKey('from') &&
        conf.containsKey('evaluateCondition')) {
      results[key] =
          _evaluateWithCondition({...wrapperData, ...results}, conf) ??
              conf['fallback'];
    } else if (conf.containsKey('from') && conf.containsKey('reduce')) {
      results[key] =
          ComputedEvaluator.reduce({...wrapperData, ...results}, conf) ??
              conf['reduce']['fallback'];
    } else if (conf.containsKey('from')) {
      // ✅ Use _evaluateFieldMap if query operators are present
      final hasQueryOps = conf.keys.any((k) => [
            'where',
            'map',
            'select',
            'takeFirst',
            'takeLast',
            'default'
          ].contains(k));
      if (hasQueryOps) {
        results[key] = WrapperBuilder([], {})._evaluateFieldMap(
          Map<String, dynamic>.from(conf),
          wrapperData[config['rootEntity']], // root entity
          wrapperData,
        );
      } else {
        results[key] =
            resolveValueRaw(conf['from'], wrapperData) ?? conf['fallback'];
      }
    } else {
      results[key] = conf['fallback'];
    }

    debugPrint('Computed[$key] => ${results[key]}');
  }

  return results;
}

/// Flattens context for formula parser by converting model maps to flat key-value pairs
/// Also applies configurable field transformations
Map<String, dynamic> _flattenContextForFormulaParser(
    Map<String, dynamic> context,
    {Map<String, dynamic>? transformations}) {
  final flat = <String, dynamic>{};

  context.forEach((key, value) {
    if (value == null) {
      // Skip null values
    } else if (value is EntityModel) {
      // Convert EntityModel to map and flatten with prefix
      try {
        final modelMap = value.toMap();
        modelMap.forEach((fieldKey, fieldValue) {
          // Create keys like "Individual.name", "Household.memberCount"
          flat['${key}.${fieldKey}'] = fieldValue;
          // Also add without prefix for backward compatibility
          flat[fieldKey] = fieldValue;
        });
      } catch (e) {
        debugPrint('Error flattening EntityModel $key: $e');
      }
    } else if (value is Map) {
      // Flatten nested maps
      value.forEach((nestedKey, nestedValue) {
        if (nestedValue is EntityModel) {
          // Handle models within maps
          try {
            final modelMap = nestedValue.toMap();
            modelMap.forEach((fieldKey, fieldValue) {
              flat['${key}.${nestedKey}.${fieldKey}'] = fieldValue;
            });
          } catch (e) {
            debugPrint('Error flattening nested EntityModel: $e');
          }
        } else {
          // Regular nested values
          flat['${key}.${nestedKey}'] = nestedValue;
        }
      });
    } else if (value is List) {
      // Handle lists - FormulaParser doesn't directly support lists
      // so we add list length and indexed access
      flat['${key}.length'] = value.length;
      for (int i = 0; i < value.length && i < 10; i++) {
        // Limit to first 10 items
        if (value[i] is EntityModel) {
          try {
            final modelMap = value[i].toMap();
            modelMap.forEach((fieldKey, fieldValue) {
              flat['${key}[$i].${fieldKey}'] = fieldValue;
            });
          } catch (e) {
            debugPrint('Error flattening list EntityModel: $e');
          }
        } else {
          flat['${key}[$i]'] = value[i];
        }
      }
    } else {
      // Simple values
      flat[key] = value;
    }
  });

  // Apply transformations if provided
  if (transformations != null) {
    flat.addAll(_applyFieldTransformations(flat, transformations));
  }

  return flat;
}

/// Applies configurable field transformations to the flattened context
Map<String, dynamic> _applyFieldTransformations(
    Map<String, dynamic> flat, Map<String, dynamic> transformations) {
  final transformed = <String, dynamic>{};

  transformations.forEach((transformedFieldName, config) {
    if (config is! Map<String, dynamic>) return;

    final type = config['type'] as String?;
    final sourceField = config['source'] as String?;

    if (type == null || sourceField == null) return;

    final sourceValue = flat[sourceField];
    if (sourceValue == null) return;

    try {
      switch (type) {
        case 'ageInMonths':
          transformed[transformedFieldName] =
              _calculateAgeInMonths(sourceValue);
          break;
        case 'ageInYears':
          transformed[transformedFieldName] = _calculateAgeInYears(sourceValue);
          break;
        case 'dateString':
          transformed[transformedFieldName] =
              _formatDateString(sourceValue, config['format']);
          break;
        case 'uppercase':
          transformed[transformedFieldName] =
              sourceValue.toString().toUpperCase();
          break;
        case 'lowercase':
          transformed[transformedFieldName] =
              sourceValue.toString().toLowerCase();
          break;
        case 'numeric':
          transformed[transformedFieldName] =
              num.tryParse(sourceValue.toString()) ?? 0;
          break;
        case 'boolean':
          transformed[transformedFieldName] = _parseBoolean(sourceValue);
          break;
        case 'custom':
          // Allow custom transformation expressions
          final expression = config['expression'] as String?;
          if (expression != null) {
            transformed[transformedFieldName] =
                _evaluateCustomExpression(expression, flat);
          }
          break;
        default:
          debugPrint('Unknown transformation type: $type');
      }
    } catch (e) {
      debugPrint('Error applying transformation $transformedFieldName: $e');
    }
  });

  return transformed;
}

/// Calculate age in months from date of birth
int _calculateAgeInMonths(dynamic dateValue) {
  DateTime? birthDate;

  if (dateValue is int) {
    // Assume milliseconds since epoch
    birthDate = DateTime.fromMillisecondsSinceEpoch(dateValue);
  } else if (dateValue is String) {
    // Try to parse date string
    birthDate = DateTime.tryParse(dateValue);
  } else if (dateValue is DateTime) {
    birthDate = dateValue;
  }

  if (birthDate == null) return 0;

  final now = DateTime.now();
  final months =
      (now.year - birthDate.year) * 12 + (now.month - birthDate.month);

  // Adjust if the day hasn't occurred yet this month
  if (now.day < birthDate.day) {
    return months - 1;
  }

  return months;
}

/// Calculate age in years from date of birth
int _calculateAgeInYears(dynamic dateValue) {
  return (_calculateAgeInMonths(dateValue) / 12).floor();
}

/// Format date as string
String _formatDateString(dynamic dateValue, String? format) {
  DateTime? date;

  if (dateValue is int) {
    date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  } else if (dateValue is String) {
    date = DateTime.tryParse(dateValue);
  } else if (dateValue is DateTime) {
    date = dateValue;
  }

  if (date == null) return '';

  // Simple format support - can be extended
  switch (format) {
    case 'yyyy-MM-dd':
      return '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    case 'dd/MM/yyyy':
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    default:
      return date.toIso8601String();
  }
}

/// Parse boolean from various formats
bool _parseBoolean(dynamic value) {
  if (value is bool) return value;
  if (value is String) {
    return value.toLowerCase() == 'true' ||
        value == '1' ||
        value.toLowerCase() == 'yes';
  }
  if (value is num) return value != 0;
  return false;
}

/// Evaluate custom transformation expressions (placeholder)
dynamic _evaluateCustomExpression(
    String expression, Map<String, dynamic> context) {
  // This is a placeholder for custom expressions
  // Could be extended to support simple arithmetic or string operations
  debugPrint('Custom expression evaluation not implemented: $expression');
  return null;
}

/// Evaluates list items with condition parsing using formula parser
dynamic _evaluateWithCondition(
    Map<String, dynamic> wrapperData, Map<String, dynamic> conf) {
  final list = resolveValueRaw(conf['from'], wrapperData);
  if (list is! Iterable) return null;

  final evaluateConfig = conf['evaluateCondition'] as Map<String, dynamic>?;
  if (evaluateConfig == null) return null;

  // Build context map from context list - completely generic
  final contextMap = <String, dynamic>{};
  final contextList = evaluateConfig['context'] as List<dynamic>? ?? [];

  for (int i = 0; i < contextList.length; i++) {
    final contextValue = resolveValueRaw(contextList[i], wrapperData);
    contextMap['context$i'] = contextValue;
  }

  final selectField = conf['select']?.toString();
  final takeLast = conf['takeLast'] == true;
  dynamic lastResult;

  // Evaluate each item
  for (final item in list) {
    if (item is! Map) continue;

    final condition = resolveValueRaw(
            evaluateConfig['condition'], {'item': item, ...wrapperData})
        ?.toString();
    if (condition == null || condition.isEmpty) continue;

    // Prepare flat context for formula parser with transformations
    final transformations =
        evaluateConfig['transformations'] as Map<String, dynamic>?;
    final flatContext = _flattenContextForFormulaParser(
        {...contextMap, 'item': item, ...wrapperData},
        transformations: transformations);

    try {
      // TODO: Fix condition format in configuration files - replace 'and' with '&&' for proper formula parser syntax
      final sanitizedCondition =
          condition.replaceAll(' and ', ' && ').replaceAll('and', '&&');
      final parser = FormulaParser(sanitizedCondition, flatContext);
      final result = parser.parse;

      if (result['isSuccess'] && result['value'] == true) {
        final itemResult = selectField != null
            ? resolveValueRaw(selectField, {'item': item, ...wrapperData})
            : item;

        if (takeLast) {
          lastResult = itemResult;
        } else {
          return itemResult;
        }
      }
    } catch (e) {
      debugPrint('Formula evaluation error: $e');
      // Continue to next item on error
    }
  }

  return takeLast ? lastResult : null;
}

Map<String, dynamic> _applyComputedList(
  Map<String, dynamic> wrapperData,
  Map<String, dynamic> config,
) {
  final computedList = config['computedList'] as Map<String, dynamic>? ?? {};
  final results = <String, dynamic>{};

  for (final entry in computedList.entries) {
    final key = entry.key;
    final conf = entry.value as Map<String, dynamic>;
    debugPrint('Computed[$key] config=$conf -> ${results[key]}');

    results[key] =
        ComputedListEvaluator.evaluate({...wrapperData, ...results}, conf);
  }

  return results;
}

class ConditionEvaluator {
  static bool? evaluate(
      Map<String, dynamic> context, Map<String, dynamic> conf) {
    final left = resolve(context, conf['left']);
    final right = resolve(context, conf['right']);

    switch (conf['operator']) {
      case 'equals':
        return left == right;
      case 'notEquals':
        return left != right;
      case 'lt':
        return (left is num && right is num) ? left < right : false;
      case 'lte':
        return (left is num && right is num) ? left <= right : false;
      case 'gt':
        return (left is num && right is num) ? left > right : false;
      case 'gte':
        return (left is num && right is num) ? left >= right : false;
      default:
        return null;
    }
  }

  static dynamic resolve(Map<String, dynamic> ctx, dynamic expr) {
    if (expr == null) return null;
    return resolveValueRaw(expr, ctx); // 🔑 use your new raw resolver
  }
}

class ComputedEvaluator {
  static dynamic reduce(
      Map<String, dynamic> context, Map<String, dynamic> conf) {
    final list = resolveValueRaw(conf['from'], context);
    if (list is! Iterable) return conf['reduce']['fallback'];

    final field = conf['reduce']['field'] as String?;
    final operation = conf['reduce']['operation'];

    final values =
        list.map((item) => resolveValueRaw(field, item)).whereType<num>();

    if (values.isEmpty) return conf['reduce']['fallback'];

    switch (operation) {
      case 'max':
        return values.reduce((a, b) => a > b ? a : b);
      case 'min':
        return values.reduce((a, b) => a < b ? a : b);
      default:
        return conf['reduce']['fallback'];
    }
  }
}

class ComputedListEvaluator {
  static List<dynamic> evaluate(
      Map<String, dynamic> ctx, Map<String, dynamic> conf) {
    var list = resolveValueRaw(conf['from'], ctx);
    if (list is! Iterable) return [];

    // Handle evaluateCondition for formula-based filtering
    if (conf.containsKey('evaluateCondition')) {
      return _evaluateWithConditionInList(ctx, conf, list);
    }

    Iterable result = list;

    if (conf.containsKey('skip')) {
      final skipCount = resolveValueRaw(conf['skip']['from'], ctx);
      if (skipCount is int) result = result.skip(skipCount);
    }

    if (conf.containsKey('where')) {
      final whereConf = conf['where'];
      whereConf['right'] = ConditionEvaluator.resolve(ctx, whereConf['right']);
      result = result.where((item) {
        return ConditionEvaluator.evaluate(
                item is Map<String, dynamic> ? item : {'item': item},
                whereConf) ??
            false;
      });
    }

    if (conf.containsKey('takeWhile')) {
      final tw = conf['takeWhile'];
      result = _takeWhile(result, (item) {
        return ConditionEvaluator.evaluate(
                item is Map<String, dynamic> ? item : {'item': item}, tw) ??
            false;
      });
    }

    return result.toList();
  }

  /// Extracts variable names from the condition string
  static Set<String> extractKeys(String condition) {
    final keywords = {"and", "or", "not", "true", "false"};
    final splitPattern = RegExp(r'and|or|not');
    final identifierPattern = RegExp(r'^[a-zA-Z_][a-zA-Z0-9_]*$');

    // Add spaces around operators
    final operatorsPattern = RegExp(r'(<=|>=|!=|==|<|>|=|\+|\-|\*|\/|\(|\))');
    condition = condition.replaceAllMapped(
      operatorsPattern,
      (match) => ' ${match[0]} ',
    );

    final tokens =
        condition.split(RegExp(r'\s+')).where((e) => e.isNotEmpty).toList();

    final keys = <String>{};

    for (final token in tokens) {
      final parts = token
          .split(splitPattern)
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty);

      for (final part in parts) {
        // ✅ Only keep identifier-like parts, ignore numbers & operators
        if (identifierPattern.hasMatch(part) && !keywords.contains(part)) {
          keys.add(part);
        }
      }
    }

    return keys;
  }

  /// Applies transformations such as age calculations
  static dynamic applyTransformation(
      Map<String, dynamic> item, Map<String, dynamic> transform) {
    final type = transform['type'];
    final source = transform['source'];

    if (type == 'ageInMonths' && source == 'dateOfBirth') {
      return calculateAgeInMonths(item[source]);
    }
    return item[source]; // fallback
  }

  static int calculateAgeInMonths(String dob) {
    final dateOfBirth = parseDate(dob);
    final age = DigitDateUtils.calculateAge(dateOfBirth);
    return age.months;
  }

  /// Builds the context map by extracting only required keys and applying transformations
  static Map<String, dynamic> buildContextForCondition(
    Map<String, dynamic> ctx,
    Map<String, dynamic> conf,
    Set<String> requiredKeys,
  ) {
    final evaluateConfig = conf['evaluateCondition'] as Map<String, dynamic>?;
    if (evaluateConfig == null) return {};

    final contextList = evaluateConfig['context'] as List<dynamic>? ?? [];
    final transformations =
        evaluateConfig['transformations'] as Map<String, dynamic>? ?? {};

    final contextMap = <String, dynamic>{};

    for (final item in contextList) {
      final contextItem = resolveValueRaw(item, ctx);

      // Convert object to Map if it's a custom model
      Map<String, dynamic> contextAsMap;
      if (contextItem is Map<String, dynamic>) {
        contextAsMap = contextItem;
      } else {
        // Try converting object to Map using toJson or reflection
        try {
          contextAsMap = contextItem.toMap();
        } catch (_) {
          // fallback to empty map if cannot convert
          contextAsMap = {};
        }
      }

      // Merge additionalFields if exists
      if (contextAsMap.containsKey('additionalFields') &&
          contextAsMap['additionalFields'] is Map<String, dynamic>) {
        contextAsMap.addAll(contextAsMap['additionalFields']);
      }

      for (final key in requiredKeys) {
        // Check if this key needs transformation
        if (transformations.containsKey(key)) {
          final transform = transformations[key];
          final sourceField = transform['source'] as String?;

          // Apply transformation if source field exists in contextAsMap
          if (sourceField != null && contextAsMap.containsKey(sourceField)) {
            final transformedValue =
                applyTransformation(contextAsMap, transform);
            contextMap[key] = transformedValue;
          }
        } else if (contextAsMap.containsKey(key)) {
          // Direct mapping for keys that don't need transformation
          contextMap[key] = contextAsMap[key];
        }
      }
    }

    return contextMap;
  }

  /// Handle evaluateCondition within computedList with optimized context
  static List<dynamic> _evaluateWithConditionInList(
      Map<String, dynamic> ctx, Map<String, dynamic> conf, Iterable list) {
    final evaluateConfig = conf['evaluateCondition'] as Map<String, dynamic>?;
    if (evaluateConfig == null) return [];

    final selectField = conf['select']?.toString();
    final takeLast = conf['takeLast'] == true;
    final results = <dynamic>[];

    final condition = evaluateConfig['condition']?.toString() ?? '';
    if (condition.isEmpty) return [];

    // Evaluate each item
    for (final item in list) {
      if (item is! Map) continue;

      // Extract required keys from the condition
      final resolvedCondition = resolveValueRaw(condition, item);
      final requiredKeys = extractKeys(resolvedCondition);

      // Build the context map with only required keys and applying transformations
      final flatContext = buildContextForCondition(ctx, conf, requiredKeys);

      if (resolvedCondition == null || resolvedCondition.isEmpty) continue;

      try {
        // TODO: Fix condition format in configuration files - replace 'and' with '&&' for proper formula parser syntax
        final sanitizedCondition = resolvedCondition
            .replaceAll(' and ', ' && ')
            .replaceAll('and', '&&');
        final parser = FormulaParser(sanitizedCondition, flatContext);
        final result = parser.parse;

        if (result['isSuccess'] && result['value'] == true) {
          results.add(item);
        }
      } catch (e) {
        debugPrint('Formula evaluation error in computedList: $e');
        // Continue to next item on error
      }
    }

    return results;
  }

  static Iterable<T> _takeWhile<T>(
      Iterable<T> src, bool Function(T) test) sync* {
    for (final item in src) {
      if (!test(item)) break;
      yield item;
    }
  }
}

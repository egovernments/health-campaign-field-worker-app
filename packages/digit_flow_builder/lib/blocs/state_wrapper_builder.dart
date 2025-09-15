import 'package:digit_data_model/data_model.dart';
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
      } else {
        // Fallback for singleton or nested POJO
        try {
          final mirror = current;
          current = (mirror as dynamic)?.toJson()[part];
        } catch (_) {
          current = null;
        }
      }
    }
    return current;
  }

  dynamic _evaluateFieldMap(Map<String, dynamic> fieldConfig, dynamic root,
      Map<String, dynamic> wrapperData) {
    var list = _resolveValue(fieldConfig['from'], root, wrapperData);
    if (list is! Iterable) list = [];

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
        list = list.where((item) {
          return whereConf.every(
              (condition) => _evaluateCondition(condition, item, wrapperData));
        });
      }
      // Handle single where condition (legacy support)
      else if (whereConf is Map) {
        list = list
            .where((item) => _evaluateCondition(whereConf, item, wrapperData));
      }
    }

    // select
    if (fieldConfig.containsKey('select')) {
      final sel = fieldConfig['select'];
      list = list.map((item) => _resolveValue(sel, item, wrapperData));
    }

    list = list.toList();

    // takeLast
    if (fieldConfig['takeLast'] == true && list.isNotEmpty) {
      list = [list.last];
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
      String expr = path;
      if (expr.startsWith('{{') && expr.endsWith('}}')) {
        expr = expr.substring(2, expr.length - 2).trim();
      }

      // Singleton access
      if (expr.startsWith('singleton.')) {
        final singleton = FlowBuilderSingleton();
        final subPath = expr.replaceFirst('singleton.', '');
        return _traverse(singleton, subPath);
      }

      final parts = expr.split('.');

      dynamic current;

      // FIRST check wrapperData
      if (wrapperData.containsKey(parts[0])) {
        current = wrapperData[parts[0]];
        parts.removeAt(0);
      } else if (root is EntityModel) {
        current = EnhancedEntityFieldAccessor.getFieldValue(root, parts[0]);
        parts.removeAt(0);
      } else {
        current = null;
      }

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
            // map each item and flatten
            final List<dynamic> next = [];
            for (final item in current) {
              dynamic val;
              if (item is Map)
                val = item[part];
              else if (item is EntityModel)
                val = EnhancedEntityFieldAccessor.getFieldValue(item, part);
              if (val != null) {
                if (val is Iterable && val is! String)
                  next.addAll(val.where((e) => e != null));
                else
                  next.add(val);
              }
            }
            if (next.isEmpty) return null;
            current = (isLast && next.length == 1) ? next.first : next;
          }
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
      debugPrint('WrapperBuilder._resolveValue error: $e');
      return null;
    }
  }

  List<dynamic> _resolveList(String path, Map<String, dynamic> wrapperData) {
    final value = _resolveValue(path, null, wrapperData);
    if (value is List) return value;
    return [value];
  }

  /// Helper to evaluate a single condition for where clauses
  bool _evaluateCondition(Map<dynamic, dynamic> condition, dynamic item,
      Map<String, dynamic> wrapperData) {
    final left = _resolveValue(condition['left'], item, wrapperData);
    final right = condition['right'];

    switch (condition['operator']) {
      case 'eq':
      case 'equals':
        return left == right;
      case 'lt':
        return left is num && right is num ? left < right : false;
      case 'lte':
        return left is num && right is num ? left <= right : false;
      case 'gt':
        return left is num && right is num ? left > right : false;
      case 'gte':
        return left is num && right is num ? left >= right : false;
      case 'neq':
      case 'notEquals':
        return left != right;
      case 'contains':
        return left is String && right is String ? left.contains(right) : false;
      case 'in':
        return right is List ? right.contains(left) : false;
      default:
        return false;
    }
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

    if (conf.containsKey('condition')) {
      results[key] =
          ConditionEvaluator.evaluate(wrapperData, conf['condition']) ??
              conf['fallback'];
    } else if (conf.containsKey('from') &&
        conf.containsKey('evaluateCondition')) {
      results[key] =
          _evaluateWithCondition(wrapperData, conf) ?? conf['fallback'];
    } else if (conf.containsKey('from') && conf.containsKey('reduce')) {
      results[key] = ComputedEvaluator.reduce(wrapperData, conf) ??
          conf['reduce']['fallback'];
    } else if (conf.containsKey('from')) {
      results[key] =
          resolveValueRaw(conf['from'], wrapperData) ?? conf['fallback'];
    } else {
      results[key] = conf['fallback'];
    }
  }

  return results;
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

    // Pass everything to formula parser - no hardcoding
    final evaluationContext = <String, dynamic>{
      ...contextMap,
      'item': item,
      ...wrapperData
    };

    // TODO: Replace with actual formula parser call
    // final result = FormulaParser.evaluate(condition, evaluationContext);
    final result = _placeholderFormulaEvaluation(condition, evaluationContext);

    if (result == true) {
      final itemResult = selectField != null
          ? resolveValueRaw(selectField, {'item': item, ...wrapperData})
          : item;

      if (takeLast) {
        lastResult = itemResult;
      } else {
        return itemResult;
      }
    }
  }

  return takeLast ? lastResult : null;
}

/// Placeholder for formula parser - will be replaced with actual formula parser
bool _placeholderFormulaEvaluation(
    String condition, Map<String, dynamic> context) {
  // TODO: Replace this with actual formula parser package call
  // This is just a placeholder until the formula parser is integrated
  debugPrint('Formula condition: $condition');
  debugPrint('Context keys: ${context.keys.join(', ')}');

  // Return false for now - will be replaced with actual formula parser
  return false;
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
    results[key] = ComputedListEvaluator.evaluate(wrapperData, conf);
  }

  return results;
}

class ConditionEvaluator {
  static bool? evaluate(
      Map<String, dynamic> context, Map<String, dynamic> conf) {
    final left = resolve(context, conf['left']);
    final right = conf['rightIsPath'] == true
        ? resolve(context, conf['right'])
        : conf['right'];

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

  static Iterable<T> _takeWhile<T>(
      Iterable<T> src, bool Function(T) test) sync* {
    for (final item in src) {
      if (!test(item)) break;
      yield item;
    }
  }
}

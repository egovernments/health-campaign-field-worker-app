import 'package:digit_forms_engine/utils/utils.dart';
import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/utils.dart';
import 'condition_evaluator.dart';

/// Evaluates computed lists with formula-based filtering,
/// transformations, and context building.
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

      // Make a deep copy of whereConf
      final Map<String, dynamic> whereCopy =
          Map<String, dynamic>.from(whereConf);

      // Modify only the copy
      whereCopy['right'] = ConditionEvaluator.resolve(ctx, whereCopy['right']);

      result = result.where((item) {
        return ConditionEvaluator.evaluate(
              item is Map<String, dynamic> ? item : {'item': item},
              whereCopy,
            ) ??
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

  /// Extracts variable names from the condition string.
  static Set<String> extractKeys(String condition) {
    final keywords = {"and", "or", "not", "true", "false"};
    // Mathematical functions to exclude from variable extraction
    final functions = {
      "MIN",
      "MAX",
      "CEIL",
      "FLOOR",
      "ROUND",
      "ABS",
      "SQRT",
      "POW",
      "SUM",
      "AVG"
    };
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
        // Only keep identifier-like parts, ignore numbers, operators & function names
        if (identifierPattern.hasMatch(part) &&
            !keywords.contains(part) &&
            !functions.contains(part.toUpperCase())) {
          keys.add(part);
        }
      }
    }

    return keys;
  }

  /// Applies transformations such as age calculations and type conversions.
  static dynamic applyTransformation(
      Map<String, dynamic> item, Map<String, dynamic> transform) {
    final type = transform['type'];
    final source = transform['source'];
    final value = item[source];

    switch (type) {
      case 'ageInMonths':
        return calculateAgeInMonths(value);
      case 'int':
        if (value is int) return value;
        if (value is num) return value.toInt();
        if (value is String) return int.tryParse(value) ?? 0;
        return 0;
      case 'double':
        if (value is double) return value;
        if (value is num) return value.toDouble();
        if (value is String) return double.tryParse(value) ?? 0.0;
        return 0.0;
      case 'bool':
        if (value is bool) return value;
        if (value is String) {
          return value.toLowerCase() == 'true' || value == '1';
        }
        if (value is num) return value != 0;
        return false;
      default:
        return value; // fallback - return original value
    }
  }

  static int calculateAgeInMonths(String dob) {
    final dateOfBirth = parseDate(dob);
    final age = DigitDateUtils.calculateAge(dateOfBirth);
    return age.years * 12 + age.months;
  }

  /// Infers the expected type of a variable from the condition and returns default value.
  static dynamic _getDefaultValueForMissingKey(
    String key,
    String resolvedCondition,
  ) {
    // Create patterns to match the key in different comparison contexts
    final patterns = [
      RegExp('$key\\s*==\\s*(TRUE|FALSE)', caseSensitive: false),
      RegExp('$key\\s*!=\\s*(TRUE|FALSE)', caseSensitive: false),
      RegExp('(TRUE|FALSE)\\s*==\\s*$key', caseSensitive: false),
      RegExp('(TRUE|FALSE)\\s*!=\\s*$key', caseSensitive: false),
    ];

    // Check if it's a boolean comparison
    for (final pattern in patterns) {
      if (pattern.hasMatch(resolvedCondition)) {
        return 'false'; // Default boolean value as string
      }
    }

    // Check if it's a numeric comparison (>=, <=, >, <, ==, !=)
    final numericPatterns = [
      RegExp('$key\\s*(>=|<=|>|<|==|!=)\\s*\\d+'),
      RegExp('\\d+\\s*(>=|<=|>|<|==|!=)\\s*$key'),
    ];

    for (final pattern in numericPatterns) {
      if (pattern.hasMatch(resolvedCondition)) {
        return '0'; // Default numeric value as string
      }
    }

    // Default to null for other types
    return null;
  }

  /// Builds the context map by extracting only required keys and applying transformations.
  static Map<String, dynamic> buildContextForCondition(
    Map<String, dynamic> ctx,
    Map<String, dynamic> conf,
    Set<String> requiredKeys,
    String resolvedCondition,
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
      if (contextAsMap['additionalFields'] is Map<String, dynamic>) {
        final additional =
            contextAsMap['additionalFields'] as Map<String, dynamic>;

        if (additional['fields'] is List) {
          final fieldsList = additional['fields'] as List;

          for (final field in fieldsList) {
            if (field is Map<String, dynamic> &&
                field.containsKey('key') &&
                field.containsKey('value')) {
              contextAsMap[field['key']] = field['value'];
            }
          }
        }
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

    // Handle missing required keys with default values
    for (final key in requiredKeys) {
      if (!contextMap.containsKey(key)) {
        final defaultValue =
            _getDefaultValueForMissingKey(key, resolvedCondition);
        contextMap[key] = defaultValue;
        debugPrint(
            'Missing key "$key" in context, using default: $defaultValue');
      }
    }

    return contextMap;
  }

  /// Handle evaluateCondition within computedList with optimized context.
  static List<dynamic> _evaluateWithConditionInList(
      Map<String, dynamic> ctx, Map<String, dynamic> conf, Iterable list) {
    final evaluateConfig = conf['evaluateCondition'] as Map<String, dynamic>?;
    if (evaluateConfig == null) return [];

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
      final flatContext =
          buildContextForCondition(ctx, conf, requiredKeys, resolvedCondition);

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
        } else if (result['isSuccess'] && result['value'] is num) {
          final computedValue = result['value'];

          if (item['ProductVariants'] is List) {
            for (final variant in item['ProductVariants']) {
              if (variant is Map) {
                variant['quantity'] = computedValue;
              }
            }
          }

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

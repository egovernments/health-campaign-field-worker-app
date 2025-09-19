import 'package:digit_flow_builder/utils/utils.dart';
import 'package:digit_formula_parser/digit_formula_parser.dart';

/// Universal conditional evaluator for any widget property
class ConditionalEvaluator {
  /// Checks if a value is a conditional configuration
  static bool isConditional(dynamic value) {
    return value is Map && value.containsKey('@condition');
  }

  /// Evaluates a value that might be conditional
  /// If it's a conditional config, evaluates it; otherwise returns as-is
  /// IMPORTANT: This method is PURE - it never modifies the input value
  static dynamic evaluate(dynamic value, dynamic context) {
    if (!isConditional(value)) {
      return value;
    }

    // Clone the map so the original input is never mutated
    final valueMap = Map<String, dynamic>.from(value as Map);

    final conditions = valueMap['@condition'] as List<dynamic>? ?? [];
    final defaultValue = valueMap['@default'];

    // Evaluate each condition in order
    for (final condition in conditions) {
      if (condition is Map<String, dynamic>) {
        final whenExpr = condition['when'] as String?;
        final conditionValue = condition['value'];

        if (whenExpr != null && evaluateExpression(whenExpr, context ?? {})) {
          // Recursively evaluate if the value itself is conditional
          return evaluate(conditionValue, context);
        }
      }
    }

    // Return default value (also evaluate if it's conditional)
    return evaluate(defaultValue, context);
  }

  /// Evaluates a boolean expression using FormulaParser
  static bool evaluateExpression(String expression, dynamic context) {
    try {
      // First resolve any template variables in the expression
      final resolved = resolveTemplate(expression, context) ?? expression;

      // Use FormulaParser to evaluate the resolved expression
      final parser = FormulaParser(
        resolved.toString(),
        {}, //// AS CONDITION IS ALREADY RESOLVED WE DO NOT NEED TO SEND ANYTHING
      );

      final result = parser.parse;
      return result["isSuccess"] == true && result["value"] == true;
    } catch (e) {
      print('Error evaluating expression "$expression": $e');
      return false;
    }
  }

  /// Recursively processes a config object to evaluate all conditional properties
  /// IMPORTANT: This method creates a NEW config object without modifying the original
  static Map<String, dynamic> processConfig(
    Map<String, dynamic> config,
    Map<dynamic, dynamic>? context,
  ) {
    final processed = <String, dynamic>{};

    config.forEach((key, value) {
      if (isConditional(value)) {
        // Evaluate conditional value
        processed[key] = evaluate(value, context);
      } else if (value is Map<String, dynamic>) {
        // Recursively process nested maps - create new map
        processed[key] =
            processConfig(Map<String, dynamic>.from(value), context);
      } else if (value is List) {
        // Process lists - create new list
        processed[key] = value.map((item) {
          if (item is Map<String, dynamic>) {
            return processConfig(Map<String, dynamic>.from(item), context);
          }
          return evaluate(item, context);
        }).toList();
      } else {
        // Regular value
        processed[key] = value;
      }
    });

    return processed;
  }

  /// Helper to create a conditional configuration
  static Map<String, dynamic> createConditional({
    required List<ConditionCase> conditions,
    dynamic defaultValue,
  }) {
    return {
      '@condition': conditions.map((c) => c.toMap()).toList(),
      if (defaultValue != null) '@default': defaultValue,
    };
  }
}

/// Represents a single condition case
class ConditionCase {
  final String when;
  final dynamic value;

  const ConditionCase({
    required this.when,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'when': when,
      'value': value,
    };
  }
}

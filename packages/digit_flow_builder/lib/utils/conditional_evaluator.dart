import 'package:digit_flow_builder/utils/utils.dart';
import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:flutter/material.dart';

import '../widget_registry.dart';

/// Universal conditional evaluator for any widget property
class ConditionalEvaluator {
  /// Checks if a value is a conditional configuration
  static bool isConditional(dynamic value) {
    return value is Map && value.containsKey('@condition');
  }

  /// Evaluates a value that might be conditional
  /// If it's a conditional config, evaluates it; otherwise returns as-is
  /// IMPORTANT: This method is PURE - it never modifies the input value
  static dynamic evaluate(dynamic value, dynamic context, {String? screenKey}) {
    // Handle string expressions with templates/functions (e.g., "{{fn:hasRole('ADMIN')}} == true")
    if (value is String && value.contains('{{')) {
      final resolved = resolveTemplate(value, context, screenKey: screenKey);

      // If the resolved string looks like a boolean expression, evaluate it
      if (resolved.contains('==') ||
          resolved.contains('!=') ||
          resolved.contains('>') ||
          resolved.contains('<') ||
          resolved.contains('&&') ||
          resolved.contains('||')) {
        return evaluateExpression(resolved, context);
      }

      // Handle simple boolean string values
      if (resolved == 'true') return true;
      if (resolved == 'false') return false;

      // If it's just a simple value after resolution, return it
      return resolved;
    }

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
          return evaluate(conditionValue, context, screenKey: screenKey);
        }
      }
    }

    // Return default value (also evaluate if it's conditional)
    return evaluate(defaultValue, context, screenKey: screenKey);
  }

  /// Evaluates a boolean expression using FormulaParser
  static bool evaluateExpression(String expression, dynamic context) {
    try {
      // First resolve any template variables in the expression
      final resolved = resolveTemplate(expression, context) ?? expression;

      print('🔍 ConditionalEvaluator: Evaluating expression: "$expression"');
      print('🔍 ConditionalEvaluator: Resolved to: "$resolved"');

      // Use FormulaParser to evaluate the resolved expression
      final parser = FormulaParser(
        resolved.toString(),
        {}, //// AS CONDITION IS ALREADY RESOLVED WE DO NOT NEED TO SEND ANYTHING
      );

      final result = parser.parse;
      print('🔍 ConditionalEvaluator: Parser result: $result');

      final boolResult = result["isSuccess"] == true && result["value"] == true;
      print('🔍 ConditionalEvaluator: Final boolean result: $boolResult');

      return boolResult;
    } catch (e) {
      print('❌ Error evaluating expression "$expression": $e');
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

  /// Handles visibility check for widgets
  /// Returns the widget built by [builder] if visible, otherwise returns SizedBox.shrink()
  ///
  /// - [context]: The BuildContext from the widget
  /// - [json]: The widget's JSON configuration containing the 'visible' property
  /// - [builder]: A function that builds the widget when visible
  static Widget buildWithVisibility(
    BuildContext context,
    Map<String, dynamic> json,
    Widget Function() builder,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final modelMap = crudCtx?.stateData?.modelMap ?? {};

    // Create evaluation context that includes:
    // 1. formData at top level for direct access (selectedFacility, selectedProduct, etc.)
    // 2. modelMap for entity access (stock, productVariant, etc.)
    // 3. item and contextData for compatibility
    final evalContext = {
      'item': crudCtx?.item,
      'contextData': crudCtx?.stateData?.rawState ?? {},
      ...modelMap,
      // Include modelMap so {{stock}}, {{productVariant}} etc. can be resolved
    };

    final screenKey = crudCtx?.screenKey;

    print('🔍 buildWithVisibility: evalContext keys = ${evalContext.keys}');
    print('🔍 buildWithVisibility: visible condition = ${json['visible']}');

    // Check visibility condition
    final visible = evaluate(
      json['visible'] ?? true,
      evalContext,
      screenKey: screenKey,
    );

    print('🔍 buildWithVisibility: visible result = $visible');

    if (visible == false) {
      return const SizedBox.shrink();
    }

    return builder();
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

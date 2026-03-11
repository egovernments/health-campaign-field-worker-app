import 'package:digit_flow_builder/utils/utils.dart';
import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:flutter/material.dart';

import '../blocs/flow_crud_bloc.dart';
import '../widget_registry.dart';
import 'interpolation.dart';

/// Universal conditional evaluator for any widget property
class ConditionalEvaluator {
  /// Checks if a value is a conditional configuration
  static bool isConditional(dynamic value) {
    return value is Map && value.containsKey('@condition');
  }

  /// Evaluates a value that might be conditional
  /// If it's a conditional config, evaluates it; otherwise returns as-is
  /// IMPORTANT: This method is PURE - it never modifies the input value
  static dynamic evaluate(dynamic value, dynamic context,
      {String? screenKey, CrudStateData? stateData}) {
    // Get widgetData from registry if screenKey is provided
    Map<String, dynamic>? widgetData;
    if (screenKey != null) {
      final currentState = FlowCrudStateRegistry().get(screenKey);
      widgetData = currentState?.widgetData;
    }

    // Enhance context with key aliases from stateData.modelMap
    // This allows templates to use 'stock' or 'stockReconciliation' even if
    // the key is 'Stock', 'StockModel', or 'StockReconciliationModel'
    dynamic enhancedContext = context;
    if (stateData != null && stateData.modelMap.isNotEmpty) {
      final Map<String, dynamic> contextMap = context is Map<String, dynamic>
          ? Map<String, dynamic>.from(context)
          : <String, dynamic>{};

      // Add key aliases for modelMap keys
      for (final entry in stateData.modelMap.entries) {
        final key = entry.key;
        final lowerKey = key.toLowerCase();

        // Add lowercase version if not already present
        if (!contextMap.containsKey(lowerKey)) {
          contextMap[lowerKey] = entry.value;
        }

        // Also add without 'Model' suffix preserving original casing
        // (e.g., 'StockReconciliationModel' -> 'StockReconciliation' and 'stockReconciliation')
        if (key.endsWith('Model')) {
          final shortKey = key.substring(0, key.length - 5);
          if (!contextMap.containsKey(shortKey)) {
            contextMap[shortKey] = entry.value;
          }
          // Also add camelCase version (first letter lowercase)
          if (shortKey.isNotEmpty) {
            final camelKey = shortKey[0].toLowerCase() + shortKey.substring(1);
            if (!contextMap.containsKey(camelKey)) {
              contextMap[camelKey] = entry.value;
            }
          }
        }

        // Also add lowercase without 'model' suffix
        if (lowerKey.endsWith('model')) {
          final shortKey = lowerKey.substring(0, lowerKey.length - 5);
          if (!contextMap.containsKey(shortKey)) {
            contextMap[shortKey] = entry.value;
          }
        }
      }
      enhancedContext = contextMap;
    }

    // Handle string expressions with templates/functions (e.g., "{{fn:hasRole('ADMIN')}} == true")
    if (value is String) {
      String resolved = value;

      // If it contains templates, resolve them first
      if (value.contains('{{')) {
        resolved = resolveTemplate(value, enhancedContext,
            screenKey: screenKey, stateData: stateData, widgetData: widgetData);
      }

      // If the resolved string looks like a boolean expression, evaluate it
      if (resolved.contains('==') ||
          resolved.contains('!=') ||
          resolved.contains('>') ||
          resolved.contains('<') ||
          resolved.contains('&&') ||
          resolved.contains('||')) {
        return evaluateExpression(resolved, context, stateData: stateData);
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

        if (whenExpr != null &&
            evaluateExpression(whenExpr, context ?? {}, stateData: stateData)) {
          // Recursively evaluate if the value itself is conditional
          return evaluate(conditionValue, context,
              screenKey: screenKey, stateData: stateData);
        }
      }
    }

    // Return default value (also evaluate if it's conditional)
    return evaluate(defaultValue, context,
        screenKey: screenKey, stateData: stateData);
  }

  /// Evaluates a boolean expression using FormulaParser
  static bool evaluateExpression(String expression, dynamic context,
      {CrudStateData? stateData}) {
    try {
      // First resolve any template variables in the expression
      final resolved =
          resolveTemplate(expression, context, stateData: stateData) ??
              expression;

      // Use FormulaParser to evaluate the resolved expression
      final parser = FormulaParser(
        resolved.toString(),
        {}, //// AS CONDITION IS ALREADY RESOLVED WE DO NOT NEED TO SEND ANYTHING
      );

      final result = parser.parse;

      final boolResult = result["isSuccess"] == true && result["value"] == true;

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

    // Check visibility condition
    final visible = evaluate(
      json['visible'] ?? true,
      evalContext,
      screenKey: screenKey,
      stateData: crudCtx?.stateData,
    );

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

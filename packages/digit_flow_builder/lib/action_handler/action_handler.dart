import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:flutter/material.dart';

import 'action_config.dart';
import 'action_executor_registry.dart';

/// ActionHandler using the executor pattern for better modularity and extensibility
///
/// This handler provides a plugin-based architecture where each action type
/// is handled by a dedicated executor. This allows for:
/// - Easy addition of new action types without modifying core code
/// - Better testability through isolated executors
/// - Clear separation of concerns
class ActionHandler {
  static final ActionExecutorRegistry _registry = ActionExecutorRegistry();

  /// Get the registry for external configuration
  static ActionExecutorRegistry get registry => _registry;

  /// Evaluates condition expressions using FormulaParser
  static bool evaluateCondition(
    Map<String, dynamic> condition,
    Map<String, dynamic> data,
  ) {
    final expression = condition['expression'] as String?;
    if (expression == null || expression == 'DEFAULT') return true;

    final flatData = flattenFormData(data);

    try {
      final parser = FormulaParser(
        expression,
        flatData.isEmpty ? {'dummy': {}} : flatData,
      );

      final result = parser.parse;
      return result["isSuccess"] && result["value"] == true;
    } catch (e) {
      // If parsing fails, return false
      return false;
    }
  }

  /// Execute actions with conditional support
  static Future<Map<String, dynamic>> executeActions(
    List<dynamic> actions,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    for (final actionJson in actions) {
      if (actionJson['condition'] != null) {
        // Conditional action block
        final condition = actionJson['condition'] as Map<String, dynamic>;
        final formData = contextData['formData'] as Map<String, dynamic>? ?? {};

        if (evaluateCondition(condition, formData)) {
          final subActions = actionJson['actions'] as List? ?? [];
          for (final subActionJson in subActions) {
            final action = ActionConfig.fromJson(subActionJson);
            contextData = await execute(action, context, contextData);
          }
          break; // Execute only the first matching condition
        }
      } else {
        // Legacy direct action
        final action = ActionConfig.fromJson(actionJson);
        contextData = await execute(action, context, contextData);
      }
    }
    return contextData;
  }

  /// Execute a single action using the executor registry
  static Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    return await _registry.execute(action, context, contextData);
  }

  /// Helper to flatten nested form data for condition evaluation
  static Map<String, dynamic> flattenFormData(Map<String, dynamic> data) {
    final flattened = <String, dynamic>{};

    void flatten(Map<String, dynamic> current, String prefix) {
      current.forEach((key, value) {
        final newKey = prefix.isEmpty ? key : '$prefix.$key';
        if (value is Map<String, dynamic>) {
          flatten(value, newKey);
        } else {
          flattened[newKey] = value;
        }
      });
    }

    flatten(data, '');
    return flattened;
  }
}

/// Helper function to flatten form data (can be used by executors)
Map<String, dynamic> flattenFormData(Map<String, dynamic> data) {
  return ActionHandler.flattenFormData(data);
}

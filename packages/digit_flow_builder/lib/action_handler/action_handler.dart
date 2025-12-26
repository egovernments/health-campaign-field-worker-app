import 'package:auto_route/auto_route.dart';
import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:flutter/material.dart';

import '../blocs/flow_crud_bloc.dart';
import '../utils/interpolation.dart';
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

    debugPrint('CONDITION_EVAL_FLAT: flatData=$flatData');

    try {
      final parser = FormulaParser(
        expression,
        flatData.isEmpty ? {'dummy': {}} : flatData,
      );

      debugPrint('CONDITION_EVAL_FLAT: parsedExpression=${parser.parsedExpression}');
      final result = parser.parse;
      debugPrint('CONDITION_EVAL_FLAT: result=$result');
      return result["isSuccess"] && result["value"] == true;
    } catch (e) {
      debugPrint('CONDITION_EVAL_FLAT: error=$e');
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
    int i = 0;
    while (i < actions.length) {
      final actionJson = actions[i];

      if (actionJson['condition'] != null) {
        // Conditional action block - collect all consecutive conditional actions
        final conditionalGroup = <Map<String, dynamic>>[];
        while (i < actions.length && actions[i]['condition'] != null) {
          conditionalGroup.add(actions[i] as Map<String, dynamic>);
          i++;
        }

        // Evaluate conditions and execute the first matching one
        final formData = contextData['formData'] as Map<String, dynamic>? ?? {};
        final navigation = contextData['navigation'] as Map<String, dynamic>? ?? {};

        // Get screen key - try context first, then check action properties for _parentScreenKey
        // (injected by popup actions to preserve parent page context)
        String? screenKey = getScreenKeyFromArgs(context) ?? context.router.currentPath;

        // Check if any action in the group has _parentScreenKey (from popup context)
        for (final condActionJson in conditionalGroup) {
          final subActions = condActionJson['actions'] as List? ?? [];
          for (final subAction in subActions) {
            if (subAction is Map<String, dynamic>) {
              final parentKey = subAction['properties']?['_parentScreenKey'] as String?;
              if (parentKey != null) {
                screenKey = parentKey;
                break;
              }
            }
          }
        }

        final currentState = FlowCrudStateRegistry().get(screenKey ?? '');

        // Get widgetData from the current state (contains filter selections, etc.)
        final widgetData = currentState?.widgetData ?? {};

        // Merge formData, navigation, and widgetData for condition evaluation
        // Also convert string "true"/"false" to boolean for proper evaluation
        final evaluationData = <String, dynamic>{};

        void addWithTypeConversion(Map<String, dynamic> source) {
          source.forEach((key, value) {
            if (value == 'true') {
              evaluationData[key] = true;
            } else if (value == 'false') {
              evaluationData[key] = false;
            } else {
              evaluationData[key] = value;
            }
          });
        }

        addWithTypeConversion(formData);
        addWithTypeConversion(navigation);

        // Add widgetData - flatten list values to check membership
        // For selection cards, convert list of selected codes to individual keys
        widgetData.forEach((key, value) {
          if (value is List) {
            // For lists (like selected options), add each item as a separate key
            // and also add the list itself for "in" operations
            evaluationData[key] = value;
            for (var item in value) {
              // Allow checking "selectedStatus == ADMINISTRATION_SUCCESS"
              // by adding the value as a key that equals itself
              if (item is String) {
                evaluationData[item] = item;
              }
            }
          } else if (value == 'true') {
            evaluationData[key] = true;
          } else if (value == 'false') {
            evaluationData[key] = false;
          } else {
            evaluationData[key] = value;
          }
        });

        for (final condActionJson in conditionalGroup) {
          final condition = condActionJson['condition'] as Map<String, dynamic>;
          debugPrint('CONDITION_EVAL: expression=${condition['expression']}, data=$evaluationData');

          if (evaluateCondition(condition, evaluationData)) {
            debugPrint('CONDITION_EVAL: Condition matched!');
            final subActions = condActionJson['actions'] as List? ?? [];
            for (final subActionJson in subActions) {
              final action = ActionConfig.fromJson(subActionJson);
              contextData = await execute(action, context, contextData);
            }
            break; // Execute only the first matching condition in this group
          }
        }
        // Continue to next action after conditional group (don't break out of main loop)
      } else {
        // Direct action (non-conditional)
        final action = ActionConfig.fromJson(actionJson);
        contextData = await execute(action, context, contextData);
        i++;
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

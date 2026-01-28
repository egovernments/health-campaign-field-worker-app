import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_formula_parser/digit_formula_parser.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';
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
  /// Traverses a nested data structure following a dot-separated path
  /// e.g., "tasks.0.status" traverses data['tasks'][0]['status']
  static dynamic _traversePath(dynamic data, String path) {
    if (path.isEmpty) return data;
    dynamic value = data;
    for (final part in path.split('.')) {
      if (value == null) return null;
      if (value is Map) {
        value = value[part];
      } else if (value is List) {
        final index = int.tryParse(part);
        if (index != null && index >= 0 && index < value.length) {
          value = value[index];
        } else {
          return null;
        }
      } else {
        return null;
      }
    }
    return value;
  }

  /// Extracts variable paths from condition expression that may need resolution
  /// from stateWrapper. Looks for patterns like "tasks.0.status" (word.number.word)
  static Set<String> _extractVariablePaths(String expression) {
    final paths = <String>{};
    // Match patterns like: word.number.word or word.number or word.word.word
    // These are likely paths that need resolution from stateWrapper
    final pathRegex = RegExp(r'\b([a-zA-Z_]\w*(?:\.\d+|\.[a-zA-Z_]\w*)+)\b');
    for (final match in pathRegex.allMatches(expression)) {
      paths.add(match.group(1)!);
    }
    return paths;
  }

  /// Resolves variable paths from stateWrapper/item context and adds them to evaluationData
  static void _resolveStateWrapperPaths(
    String expression,
    Map<String, dynamic> evaluationData,
    List<dynamic>? stateWrapper,
    Map<String, dynamic>? item,
  ) {
    final paths = _extractVariablePaths(expression);
    if (paths.isEmpty) return;

    // Determine the data source - prefer item (current template iteration) over stateWrapper
    Map<String, dynamic>? dataSource;
    if (item != null && item.isNotEmpty) {
      dataSource = item;
    } else if (stateWrapper != null && stateWrapper.isNotEmpty) {
      final first = stateWrapper.first;
      if (first is Map<String, dynamic>) {
        dataSource = first;
      }
    }

    if (dataSource == null) return;

    for (final path in paths) {
      // Skip if already in evaluationData
      if (evaluationData.containsKey(path)) continue;

      final resolved = _traversePath(dataSource, path);
      if (resolved != null) {
        evaluationData[path] = resolved;
      }
    }
  }

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

        // Get screen key - try route args first, then contextData['parentScreenKey']
        // (set by CLOSE_POPUP action when used from popup)
        final screenKey = getEffectiveScreenKey(context, contextData);

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
            // If single element list, store as string for simpler equality checks
            // e.g., selectedStatus == CLOSED_HOUSEHOLD works when selectedStatus is "CLOSED_HOUSEHOLD"
            if (value.length == 1) {
              var singleValue = value.first;
              // Strip quotes if the value is a quoted string (e.g., "\"VALUE\"" -> "VALUE")
              if (singleValue is String &&
                  singleValue.length >= 2 &&
                  singleValue.startsWith('"') &&
                  singleValue.endsWith('"')) {
                singleValue = singleValue.substring(1, singleValue.length - 1);
              }
              evaluationData[key] = singleValue;
              // Don't add value as key - let parser treat literals in expression as-is
            } else {
              // For multi-select, keep as list for "in" operations
              evaluationData[key] = value;
              for (var item in value) {
                if (item is String) {
                  evaluationData[item] = item;
                }
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

        // Get stateWrapper and item for resolving paths in condition expressions
        final stateWrapper = currentState?.stateWrapper;
        final item = contextData['item'] as Map<String, dynamic>?;

        for (final condActionJson in conditionalGroup) {
          final condition = condActionJson['condition'] as Map<String, dynamic>;
          var expression = condition['expression'] as String?;

          // Resolve any variable paths from stateWrapper/item context
          if (expression != null && expression != 'DEFAULT') {
            expression = resolveTemplate(expression, stateWrapper);
          }

          // Create a copy of condition with resolved expression to avoid mutating original config
          final resolvedCondition = Map<String, dynamic>.from(condition);
          resolvedCondition['expression'] = expression;

          if (evaluateCondition(resolvedCondition, evaluationData)) {
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

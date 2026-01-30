import 'package:digit_ui_components/constants/icon_mapping.dart';
import 'package:digit_ui_components/widgets/atoms/menu_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class MenuCardWidget implements FlowWidget {
  @override
  String get format => 'menu_card';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final stateData = crudCtx?.stateData;

    // Get form data from registry for resolving form field values
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);
    final formData = screenKey != null
        ? FlowCrudStateRegistry().get(screenKey)?.formData
        : null;

    return MenuCard(
      onTap: () {
        if (json['onAction'] != null) {
          final actionsList = List<Map<String, dynamic>>.from(json['onAction']);

          // Build context for condition evaluation
          final evalContext = {
            ...?stateData?.modelMap,
            ...?formData,
          };

          for (var actionJson in actionsList) {
            // Check if this is a conditional action block
            if (actionJson.containsKey('condition')) {
              final condition =
                  actionJson['condition'] as Map<String, dynamic>?;
              final expression = condition?['expression'] as String?;

              // Evaluate condition
              bool conditionMet = false;
              if (expression == null || expression == 'DEFAULT') {
                conditionMet = true;
              } else {
                conditionMet = ConditionalEvaluator.evaluateExpression(
                  expression,
                  evalContext,
                );
              }

              if (conditionMet) {
                // Execute actions in this conditional block
                final subActions =
                    actionJson['actions'] as List<dynamic>? ?? [];
                for (var subActionJson in subActions) {
                  final action = _resolveAction(
                    subActionJson as Map<String, dynamic>,
                    stateData,
                    formData,
                  );
                  onAction(action);
                }
                // Only execute first matching condition block
                break;
              }
            } else {
              // Legacy direct action (no condition)
              final action = _resolveAction(actionJson, stateData, formData);
              onAction(action);
            }
          }
        }
      },
      heading: _localizeText(context, json['heading']) ?? "",
      description: _localizeText(context, json['description']),
      icon: DigitIconMapping.getIcon(json['icon']),
    );
  }

  String? _localizeText(BuildContext context, String? text) {
    if (text == null) return null;
    final localization = LocalizationContext.maybeOf(context);
    return localization?.translate(text) ?? text;
  }

  /// Resolves an action config with navigation data
  ActionConfig _resolveAction(
    Map<String, dynamic> actionJson,
    CrudStateData? stateData,
    Map<String, dynamic>? formData,
  ) {
    var action = ActionConfig.fromJson(actionJson);

    // Resolve navigation data if present
    final navData = action.properties['data'] as List<dynamic>?;

    if (navData != null) {
      final resolvedData = navData.map((entry) {
        final key = entry['key'] as String;
        final rawValue = entry['value'];

        // Try to resolve from modelMap first, then fallback to formData
        dynamic resolvedValue = stateData != null
            ? resolveValue(rawValue, stateData.modelMap)
            : rawValue;

        if (resolvedValue == rawValue && formData != null) {
          // If not resolved from modelMap, try formData
          resolvedValue = resolveValue(rawValue, formData);
        }

        return {
          "key": key,
          "value": resolvedValue,
        };
      }).toList();

      action = ActionConfig(
        action: action.action,
        actionType: action.actionType,
        properties: {
          ...action.properties,
          'data': resolvedData,
        },
        condition: action.condition,
        actions: action.actions,
      );
    }

    return action;
  }
}

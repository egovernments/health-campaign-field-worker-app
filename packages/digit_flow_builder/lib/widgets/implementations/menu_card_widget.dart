import 'package:digit_ui_components/constants/icon_mapping.dart';
import 'package:digit_ui_components/widgets/atoms/menu_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/flow_widget_state.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
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
    final flowState = WidgetStateContext.of(context);

    return MenuCard(
      onTap: () {
        if (json['onAction'] != null) {
          final actionsList = List<Map<String, dynamic>>.from(json['onAction']);

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
                  flowState.evalContext,
                );
              }

              if (conditionMet) {
                // Execute actions in this conditional block
                final subActions =
                    actionJson['actions'] as List<dynamic>? ?? [];
                for (var subActionJson in subActions) {
                  final action = _resolveAction(
                    subActionJson as Map<String, dynamic>,
                    flowState.evalContext,
                  );
                  onAction(action);
                }
                // Only execute first matching condition block
                break;
              }
            } else {
              // Legacy direct action (no condition)
              final action = _resolveAction(actionJson, flowState.evalContext);
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
    Map<String, dynamic> evalContext,
  ) {
    var action = ActionConfig.fromJson(actionJson);

    // Resolve navigation data if present
    final navData = action.properties['data'] as List<dynamic>?;

    if (navData != null) {
      final resolvedData = navData.map((entry) {
        final key = entry['key'] as String;
        final rawValue = entry['value'];

        // Resolve using evalContext which contains all data sources
        final resolvedValue = resolveValue(rawValue, evalContext);

        return {
          "key": key,
          "value": resolvedValue == rawValue ? rawValue : resolvedValue,
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

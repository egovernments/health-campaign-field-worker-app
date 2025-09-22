import 'package:digit_ui_components/widgets/atoms/menu_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

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

    // Create evaluation context
    final evalContext = {
      'item': crudCtx?.item,
      'contextData': crudCtx?.stateData?.rawState ?? {},
    };

    // Check visibility condition
    final visible = ConditionalEvaluator.evaluate(
      json['visible'] ?? true,
      evalContext,
    );

    if (visible == false) {
      return const SizedBox.shrink();
    }

    return MenuCard(
      onTap: () {
        if (json['onAction'] != null) {
          final actionsList = List<Map<String, dynamic>>.from(json['onAction']);

          for (var actionJson in actionsList) {
            var action = ActionConfig.fromJson(actionJson);

            // Resolve navigation data if present
            final navData = action.properties['data'] as List<dynamic>?;

            if (navData != null && stateData != null) {
              final resolvedData = navData.map((entry) {
                final key = entry['key'] as String;
                final rawValue = entry['value'];
                final resolvedValue = resolveValue(rawValue, stateData);

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

            onAction(action);
          }
        }
      },
      heading: json['heading'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

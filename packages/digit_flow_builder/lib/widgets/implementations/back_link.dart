import 'package:digit_ui_components/theme/ComponentTheme/back_button_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_back_button.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/flow_widget_state.dart';
import '../../utils/utils.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class BackLinkWidget implements FlowWidget {
  @override
  String get format => 'backLink';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final flowState = WidgetStateContext.of(context);
    final localization = LocalizationContext.maybeOf(context);

    // Resolve template using flowState.evalContext
    final labelText = json['label'] ?? '';
    final label = resolveTemplate(
          labelText,
          flowState.evalContext,
          localization: localization,
        ) ??
        labelText;

    return DigitBackButton(
      label: label,
      handleBack: () {
        if (json['onAction'] != null) {
          final actionsList = List<Map<String, dynamic>>.from(json['onAction']);

          for (var actionJson in actionsList) {
            var action = ActionConfig.fromJson(actionJson);

            // Resolve navigation data if present
            final navData = action.properties['data'] as List<dynamic>?;

            if (navData != null) {
              final resolvedData = navData.map((entry) {
                final key = entry['key'] as String;
                final rawValue = entry['value'];

                // Resolve using flowState.evalContext which contains all data sources
                final resolvedValue = resolveValue(rawValue, flowState.evalContext);

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

            onAction(action);
          }
        }
      },
      digitBackButtonThemeData: const DigitBackButtonThemeData().copyWith(
        context: context,
        backDigitButtonIcon: Icon(
          Icons.arrow_left,
          size: Theme.of(context).spacerTheme.spacer5,
          color: Theme.of(context).colorTheme.primary.primary2,
        ),
      ),
    );
  }
}

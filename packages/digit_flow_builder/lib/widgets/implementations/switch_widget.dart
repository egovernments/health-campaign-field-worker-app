import 'package:digit_ui_components/widgets/atoms/switch.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/flow_widget_state.dart';
import '../resolved_flow_widget.dart';

class SwitchWidget extends ResolvedFlowWidget {
  @override
  String get format => 'switch';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final fieldKey = json['fieldName'] as String? ?? 'switchValue';

    return WidgetStateContext.reactive(context, (ctx, state) {
      if (state.widgetData[fieldKey] == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          state.updateWidgetData(fieldKey, false);
        });
      }
      return DigitSwitch(
        label: resolved.resolvedLabel,
        value: state.widgetData[fieldKey] ?? false,
        mainAxisAlignment: MainAxisAlignment.start,
        onChanged: (value) {
          state.updateWidgetData(fieldKey, value);
          if (json['onAction'] != null) {
            final actionsList = json['onAction'] is List
                ? List<Map<String, dynamic>>.from(json['onAction'])
                : [Map<String, dynamic>.from(json['onAction'])];

            for (var raw in actionsList) {
              raw['properties'] ??= {};
              raw['properties']['data'] = [
                {
                  'key': json['fieldName'] ?? 'switch',
                  'value': value,
                }
              ];
              final action = ActionConfig.fromJson(raw);
              onAction(action);
            }
          }
        },
      );
    });
  }
}

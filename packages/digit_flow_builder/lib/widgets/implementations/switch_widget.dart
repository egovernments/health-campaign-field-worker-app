import 'package:digit_ui_components/widgets/atoms/switch.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
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
    return DigitSwitch(
      label: resolved.resolvedLabel,
      value: false,
      mainAxisAlignment: MainAxisAlignment.start,
      onChanged: (value) {
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
  }
}

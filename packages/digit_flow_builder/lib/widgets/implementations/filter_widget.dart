import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../flow_widget_interface.dart';

class FilterWidget implements FlowWidget {
  @override
  String get format => 'filter';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    return DigitButton(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      label: json['label'] ?? '',
      onPressed: () {
        if (json['onAction'] != null) {
          final actionsList = json['onAction'] is List
              ? List<Map<String, dynamic>>.from(json['onAction'])
              : [Map<String, dynamic>.from(json['onAction'])];

          for (var raw in actionsList) {
            final action = ActionConfig.fromJson(raw);
            onAction(action);
          }
        }
      },
      type: DigitButtonType.tertiary,
      size: DigitButtonSize.large,
      suffixIcon: Icons.filter_alt_sharp,
    );
  }
}
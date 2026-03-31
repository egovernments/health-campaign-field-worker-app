import 'package:digit_flow_builder/utils/flow_widget_state.dart';
import 'package:digit_flow_builder/widgets/resolved_flow_widget.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';

class CheckBoxWidget extends ResolvedFlowWidget {
  @override
  String get format => 'checkbox';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    var rawValue = json['value'];
    var value = resolved.resolveText(rawValue.toString()) == 'true';

    final fieldKey = json['fieldKey'] as String? ?? 'checkbox';

    return WidgetStateContext.reactive(context, (ctx, state) {
      // Initialize widgetData with today's date on first render
      if (state.widgetData[fieldKey] == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          state.updateWidgetData(fieldKey, value);
        });
      }
      return Checkbox(
        checkColor: Colors.white,
        value: state.widgetData[fieldKey] ?? value,
        onChanged: (bool? value) {
          state.updateWidgetData(fieldKey, value);
        },
      );
    });
  }
}

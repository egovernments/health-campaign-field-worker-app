import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../resolved_flow_widget.dart';

class LabelValueSummaryWidget extends ResolvedFlowWidget {
  @override
  String get format => 'labelValueSummary';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    return LabelValueSummary(
      padding: const EdgeInsets.all(12.0),
      items: [
        for (var item in json['items'] ?? [])
          LabelValueItem(
            labelFlex: item['labelFlex'] ?? 5,
            label: item['label'],
            value: item['value'] ?? "N/A",
          ),
      ],
    );
  }
}

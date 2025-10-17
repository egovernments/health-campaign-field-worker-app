import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class LabelPairListWidget implements FlowWidget {
  @override
  String get format => 'labelPairList';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final List<dynamic> data = json['data'] ?? [];
    return LabelValueSummary(
      padding: const EdgeInsets.all(0),
      items: data.map((e) {
        final key = e['key'] ?? '';
        final value = e['value'];

        final valueText = resolveTemplate(
            value ?? '',
            crudCtx?.item != null
                ? crudCtx!.item
                : crudCtx?.stateData?.rawState);

        return LabelValueItem(
          maxLines: 5,
          label: key,
          value: valueText,
          labelFlex: 9,
        );
      }).toList(),
    );
  }
}

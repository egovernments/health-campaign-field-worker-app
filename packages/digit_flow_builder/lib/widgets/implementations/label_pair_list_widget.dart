import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

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
    final localization = LocalizationContext.maybeOf(context);

    return LabelValueSummary(
      padding: const EdgeInsets.all(0),
      items: data.map((e) {
        final key = e['key'] ?? '';
        final value = e['value'];

        // Localize first, then resolve template
        final localizedKey = localization?.translate(key) ?? key;
        final localizedValue =
            localization?.translate(value ?? '') ?? (value ?? '');

        final keyText = resolveTemplate(
            localizedKey,
            crudCtx?.item != null
                ? crudCtx!.item
                : crudCtx?.stateData?.rawState);

        final valueText = resolveTemplate(
            localizedValue,
            crudCtx?.item != null
                ? crudCtx!.item
                : crudCtx?.stateData?.rawState);

        return LabelValueItem(
          maxLines: 5,
          label: localization?.translate(keyText) ?? keyText,
          value: localization?.translate(valueText) ?? valueText,
          labelFlex: 7,
        );
      }).toList(),
    );
  }
}

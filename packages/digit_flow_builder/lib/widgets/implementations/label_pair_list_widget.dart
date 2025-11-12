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

    // Filter out null items if hideIfNull is true
    final filteredItems = <LabelValueItem>[];

    for (var e in data) {
      final key = e['key'] ?? '';
      final value = e['value'];
      final defaultValue = e['defaultValue'];
      final hideIfNull = e['hideIfNull'] == true;

      // Localize first, then resolve template
      final localizedKey = localization?.translate(key) ?? key;
      final localizedValue =
          localization?.translate(value ?? '') ?? (value ?? '');

      final keyText = resolveTemplate(
          localizedKey,
          crudCtx?.item != null
              ? crudCtx!.item
              : crudCtx?.stateData?.rawState);

      var valueText = resolveTemplate(
          localizedValue,
          crudCtx?.item != null
              ? crudCtx!.item
              : crudCtx?.stateData?.rawState);

      // Check if value is null or empty
      final isValueEmpty =
          valueText == null || valueText.isEmpty || valueText == 'null';

      // If hideIfNull is true and value is empty, skip this item
      if (hideIfNull && isValueEmpty) {
        continue;
      }

      // If value is empty and defaultValue is provided, use defaultValue
      if (isValueEmpty && defaultValue != null) {
        final localizedDefaultValue =
            localization?.translate(defaultValue) ?? defaultValue;
        valueText = resolveTemplate(
            localizedDefaultValue,
            crudCtx?.item != null
                ? crudCtx!.item
                : crudCtx?.stateData?.rawState);
      }

      // Add the item to the list
      filteredItems.add(
        LabelValueItem(
          maxLines: 5,
          label: localization?.translate(keyText) ?? keyText,
          value: localization?.translate(valueText ?? '') ?? (valueText ?? ''),
          labelFlex: 7,
        ),
      );
    }

    return LabelValueSummary(
      padding: const EdgeInsets.all(0),
      items: filteredItems,
    );
  }
}

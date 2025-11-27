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
    final contextData =
        crudCtx?.item != null ? crudCtx!.item : crudCtx?.stateData?.rawState;

    // Filter out null items if hideIfNull is true
    final filteredItems = <LabelValueItem>[];

    for (var e in data) {
      // Check if this is an iterate directive
      if (e['iterate'] != null) {
        final iterateItems =
            _processIterateDirective(e, contextData, localization);
        filteredItems.addAll(iterateItems);
        continue;
      }

      final key = e['key'] ?? '';
      final value = e['value'];
      final defaultValue = e['defaultValue'];
      final hideIfNull = e['hideIfNull'] == true;

      // Resolve template with localization support
      final keyText = resolveTemplate(
        key,
        contextData,
        localization: localization,
      );

      var valueText = resolveTemplate(
        value ?? '',
        contextData,
        localization: localization,
      );

      // Check if value is null or empty
      final isValueEmpty =
          valueText == null || valueText.isEmpty || valueText == 'null';

      // If hideIfNull is true and value is empty, skip this item
      if (hideIfNull && isValueEmpty) {
        continue;
      }

      // If value is empty and defaultValue is provided, use defaultValue
      if (isValueEmpty && defaultValue != null) {
        valueText = resolveTemplate(
          defaultValue,
          contextData,
          localization: localization,
        );
      }

      // Add the item to the list
      filteredItems.add(
        LabelValueItem(
          maxLines: 5,
          label: keyText,
          value: valueText ?? '',
          labelFlex: 7,
        ),
      );
    }

    return LabelValueSummary(
      padding: const EdgeInsets.all(0),
      items: filteredItems,
    );
  }

  /// Process an iterate directive to dynamically generate label-value pairs
  List<LabelValueItem> _processIterateDirective(
    Map<String, dynamic> config,
    dynamic contextData,
    dynamic localization,
  ) {
    final items = <LabelValueItem>[];

    final iteratePath = config['iterate'] as String;
    final keyField = config['keyField'] ?? 'key';
    final valueField = config['valueField'] ?? 'value';
    final excludeKeys = (config['excludeKeys'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toSet() ??
        {};
    final hideIfNull = config['hideIfNull'] == true;

    // Resolve the iterate path to get the list
    final resolvedList = resolveValue(iteratePath, contextData);

    if (resolvedList == null || resolvedList is! List) {
      return items;
    }

    for (var field in resolvedList) {
      if (field is! Map) continue;

      final fieldKey = field[keyField]?.toString();
      final fieldValue = field[valueField];

      if (fieldKey == null) continue;

      // Check excludeKeys
      if (excludeKeys.contains(fieldKey)) continue;

      final valueStr = fieldValue?.toString() ?? '';
      final isValueEmpty = valueStr.isEmpty || valueStr == 'null';

      if (hideIfNull && isValueEmpty) {
        continue;
      }

      final localizedKey = localization?.translate(fieldKey) ?? fieldKey;
      final localizedValue = localization?.translate(valueStr) ?? valueStr;

      items.add(
        LabelValueItem(
          maxLines: 5,
          label: localizedKey,
          value: localizedValue,
          labelFlex: 7,
        ),
      );
    }

    return items;
  }
}

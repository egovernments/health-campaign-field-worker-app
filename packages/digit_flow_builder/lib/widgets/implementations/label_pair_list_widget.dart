import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/utils.dart';
import '../resolved_flow_widget.dart';

class LabelPairListWidget extends ResolvedFlowWidget {
  @override
  String get format => 'labelPairList';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final List<dynamic> data = json['data'] ?? [];
    final localization = resolved.localization;
    // Pairs with an empty/null value are always hidden (unless a
    // defaultValue is provided) — the widget decides, not the JSON.
    final filteredItems = <LabelValueItem>[];

    for (var e in data) {
      // Check if this is an iterate directive
      if (e['iterate'] != null) {
        final iterateItems =
            _processIterateDirective(e, resolved.evalContext, localization);
        filteredItems.addAll(iterateItems);
        continue;
      }

      final key = e['key'] ?? '';
      final value = e['value'];
      final defaultValue = e['defaultValue'];
      final isMultiSelect = e['isMultiSelect'] == true;

      // Resolve template using evalContext
      final keyText = resolveTemplate(
        key,
        resolved.evalContext,
        localization: localization,
      );

      var valueText = resolveTemplate(
        value ?? '',
        resolved.evalContext,
        localization: localization,
      );

      // Check if value is null or empty
      final isValueEmpty =
          valueText == null || valueText.isEmpty || valueText == 'null';

      // If value is empty and defaultValue is provided, use defaultValue
      if (isValueEmpty && defaultValue != null) {
        valueText = resolveTemplate(
          defaultValue,
          resolved.evalContext,
          localization: localization,
        );
      } else if (isValueEmpty) {
        // Hide the pair when value is empty and no default is provided
        continue;
      }

      // Localize the display value. For multi-select fields, split
      // dot-separated codes and translate each individually.
      String? displayValue;
      if (valueText == null || valueText == 'null') {
        displayValue = '--';
      } else if (isMultiSelect && valueText.contains('.')) {
        displayValue = valueText
            .split('.')
            .map((part) => localization?.translate(part) ?? part)
            .join(', ');
      } else {
        displayValue = localization?.translate(valueText) ?? valueText;
      }

      // Add the item to the list
      filteredItems.add(
        LabelValueItem(
          maxLines: 5,
          label: keyText,
          value: displayValue,
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

    // Resolve the iterate path to get the list using evalContext
    final resolvedList = resolveValue(iteratePath, contextData as Map<String, dynamic>);

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

      // Hide the pair when value is empty (matches non-iterate default)
      if (isValueEmpty) {
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

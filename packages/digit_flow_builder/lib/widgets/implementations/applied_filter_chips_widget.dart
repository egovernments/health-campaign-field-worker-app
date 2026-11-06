import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/digit_chip.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/flow_widget_state.dart';
import '../localization_context.dart';
import '../resolved_flow_widget.dart';

/// Shows the filters currently applied on a list screen as removable chips,
/// so a worker can see why the list is narrowed and undo one filter without
/// reopening the filter popup.
///
/// Each entry in `chips` names a widgetData key written by a filter widget:
/// ```json
/// {
///   "format": "appliedFilterChips",
///   "fieldName": "appliedFilters",
///   "chips": [
///     {"key": "siteType", "displayKey": "name", "onRemove": [ ... ]},
///     {"key": "siteProximity", "label": "GV_FILTER_CHIP_NEARBY", "onRemove": [ ... ]}
///   ]
/// }
/// ```
/// A chip shows while its value is set (non-empty, or `true` for a switch).
/// Its text is `label` when given; otherwise the selected option's
/// `displayKey` field (from the dropdown's `<key>-object`), else the code,
/// localized either way. Tapping the chip's close icon runs `onRemove`;
/// for a switch (bool) filter it first writes `false`, so the switch stays
/// off rather than falling back to its default.
class AppliedFilterChipsWidget extends ResolvedFlowWidget {
  @override
  String get format => 'appliedFilterChips';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final chips = (json['chips'] as List?)?.whereType<Map>().toList() ?? [];
    if (chips.isEmpty) return const SizedBox.shrink();

    return WidgetStateContext.reactive(context, (ctx, state) {
      final localization = LocalizationContext.maybeOf(ctx);
      String translate(String text) => localization?.translate(text) ?? text;

      final visible = <Widget>[];
      for (final chip in chips) {
        final key = chip['key']?.toString();
        if (key == null || key.isEmpty) continue;

        final value = state.widgetData[key];
        final isSet = value is bool
            ? value
            : value != null && value.toString().trim().isNotEmpty;
        if (!isSet) continue;

        visible.add(DigitChip(
          label: translate(_chipText(chip, key, value, state.widgetData)),
          onItemDelete: () {
            // A switch filter is turned off rather than unset: an unset
            // switch falls back to its default, which for proximity is on.
            if (value is bool) state.updateWidgetData(key, false);
            final onRemove = chip['onRemove'];
            if (onRemove is! List) return;
            for (final raw in onRemove.whereType<Map>()) {
              onAction(ActionConfig.fromJson(Map<String, dynamic>.from(raw)));
            }
          },
        ));
      }

      if (visible.isEmpty) return const SizedBox.shrink();

      // Same layout Digit's multi-select dropdown uses for its chips.
      return Wrap(
        spacing: spacer2,
        runSpacing: spacer2,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: visible,
      );
    });
  }

  String _chipText(
    Map chip,
    String key,
    dynamic value,
    Map<String, dynamic> widgetData,
  ) {
    final label = chip['label']?.toString();
    if (label != null && label.isNotEmpty) return label;

    final displayKey = chip['displayKey']?.toString() ?? 'name';
    final selected = widgetData['$key-object'];
    if (selected is Map) {
      final name = selected[displayKey]?.toString();
      if (name != null && name.isNotEmpty) return name;
    }
    return value.toString();
  }
}

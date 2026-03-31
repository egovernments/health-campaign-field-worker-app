import 'package:digit_flow_builder/utils/flow_widget_state.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/button_theme.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/widget_parsers.dart';
import '../resolved_flow_widget.dart';

class SelectButtonWidget extends ResolvedFlowWidget {
  @override
  String get format => 'selectButton';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final fieldKey = resolved.resolveField(json['fieldKey']) as String?;
    final fieldValue = resolved.resolveField(json['fieldValue']) as String?;
    final condition = json['condition'] as Map<String, dynamic>?;
    final groupKey = resolved.resolveField(json['groupKey']) as String?;
    final props = Map<String, dynamic>.from(json['properties'] ?? {});

    String padding = props['padding'] ?? 'spacer2';
    var selectedData;
    var isSelected = false;

    if ((fieldKey == null || fieldValue == null) && condition == null) {
      throw Exception(
          'fieldKey and fieldValue are required for selectButton widget');
    }

    return WidgetStateContext.reactive(context, (ctx, state) {
      if (condition != null) {
        condition["lhs"] = resolved.resolveField(condition["lhs"]);
        condition["rhs"] = resolved.resolveField(condition["rhs"]);
        isSelected = condition["lhs"] == condition["rhs"];
      } else {
        selectedData = (groupKey != null
                ? (state.widgetData[groupKey]?[fieldKey])
                : state.widgetData[fieldKey]) ??
            false;
      }

      return WidgetParsers.wrapWithBottomGap(
        DigitButton(
          crossAxisAlignment: CrossAxisAlignment.center,
          label: resolved.resolvedLabel ?? '',
          isDisabled: resolved.isDisabled,
          onPressed: () async {
            if (json['onAction'] != null) {
              final actionsList =
                  List<Map<String, dynamic>>.from(json['onAction']);
              await resolved.executeActions(actionsList, context);
            }
            if (condition == null) {
              if (groupKey != null) {
                state.updateWidgetData(groupKey,
                    {...?state.widgetData[groupKey], fieldKey: fieldValue});
              } else {
                state.updateWidgetData(fieldKey!, fieldValue);
              }
            }
          },
          type: WidgetParsers.parseButtonType(
              isSelected || (selectedData != null && selectedData == fieldValue)
                  ? props['selectedType']
                  : props['type']),
          size: WidgetParsers.parseButtonSize(props['size']),
          digitButtonThemeData: DigitButtonThemeData(
            primaryDigitButtonColor: DigitButtonThemeData.defaultTheme(context)
                .primaryDigitButtonColor,
            DigitButtonColor: colorMap[props["color"]] ??
                DigitButtonThemeData.defaultTheme(context).DigitButtonColor,
            disabledColor:
                DigitButtonThemeData.defaultTheme(context).disabledColor,
            radius: BorderRadius.circular(spacer3),
            largeRadius: BorderRadius.circular(spacer3),
            smallMediumRadius: BorderRadius.circular(spacer3),
            padding: EdgeInsets.all(WidgetParsers.parseSize(padding)),
          ),
          mainAxisSize: WidgetParsers.parseMainAxisSize(props['mainAxisSize']),
          mainAxisAlignment:
              WidgetParsers.parseMainAxisAlignment(props['mainAxisAlignment']),
          suffixIcon: json['suffixIcon'] != null
              ? DigitIconMapping.getIcon(json['suffixIcon'])
              : null,
          prefixIcon: json['prefixIcon'] != null
              ? DigitIconMapping.getIcon(json['prefixIcon'])
              : null,
        ),
        props,
      );
    });
  }

  Map<String, Color> colorMap = {'green': Colors.green};
}

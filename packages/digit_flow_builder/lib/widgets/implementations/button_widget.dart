import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/button_theme.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/widget_parsers.dart';
import '../resolved_flow_widget.dart';

class ButtonWidget extends ResolvedFlowWidget {
  @override
  String get format => 'button';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final props = Map<String, dynamic>.from(json['properties'] ?? {});

    String padding = props['padding'] ?? 'spacer2';

    return WidgetParsers.wrapWithBottomGap(
      DigitButton(
        crossAxisAlignment: CrossAxisAlignment.center,
        capitalizeLetters: false,
        label: resolved.resolvedLabel ?? '',
        isDisabled: resolved.isDisabled,
        onPressed: () async {
          if (json['onAction'] != null) {
            final actionsList =
                List<Map<String, dynamic>>.from(json['onAction']);
            await resolved.executeActions(actionsList, context);
          }
        },
        type: WidgetParsers.parseButtonType(props['type']),
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
        iconColor: colorMap[props["color"]],
        textColor: colorMap[props["color"]],
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
  }

  Map<String, Color> colorMap = {'green': Colors.green};
}

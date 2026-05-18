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

    DigitButtonType type = WidgetParsers.parseButtonType(props['type']);
    DigitButtonSize size = WidgetParsers.parseButtonSize(props['size']);
    String? height = props['height'];
    String? radius = props['radius'];

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
        type: type,
        size: size,
        digitButtonThemeData:
            DigitButtonThemeData.defaultTheme(context).copyWith(
          smallDigitButtonHeight:
              (size == DigitButtonSize.small && height != null)
                  ? WidgetParsers.parseSize(height)
                  : DigitButtonThemeData.defaultTheme(context)
                      .smallDigitButtonHeight,
          mediumDigitButtonHeight:
              (size == DigitButtonSize.medium && height != null)
                  ? WidgetParsers.parseSize(height)
                  : DigitButtonThemeData.defaultTheme(context)
                      .mediumDigitButtonHeight,
          largeDigitButtonHeight:
              (size == DigitButtonSize.large && height != null)
                  ? WidgetParsers.parseSize(height)
                  : DigitButtonThemeData.defaultTheme(context)
                      .largeDigitButtonHeight,
          smallMediumRadius: ((size == DigitButtonSize.small ||
                      size == DigitButtonSize.medium) &&
                  radius != null)
              ? BorderRadius.circular(WidgetParsers.parseSize(radius))
              : DigitButtonThemeData.defaultTheme(context).smallMediumRadius,
          largeRadius: (size == DigitButtonSize.large && radius != null)
              ? BorderRadius.circular(WidgetParsers.parseSize(radius))
              : DigitButtonThemeData.defaultTheme(context).largeRadius,
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
  }
}

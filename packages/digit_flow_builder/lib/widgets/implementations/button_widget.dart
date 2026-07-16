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
    String? iconSize = props['iconSize'];
    String? horizontalPadding = props['horizontalPadding'];
    String? fontFamily = props['fontFamily'];
    final bool overrideTextStyle = fontFamily != null;

    final bool alignCenter = props['align'] == 'center';

    final button = DigitButton(
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
          smallIconSize: (size == DigitButtonSize.small && iconSize != null)
              ? WidgetParsers.parseSize(iconSize)
              : DigitButtonThemeData.defaultTheme(context).smallIconSize,
          mediumIconSize: (size == DigitButtonSize.medium && iconSize != null)
              ? WidgetParsers.parseSize(iconSize)
              : DigitButtonThemeData.defaultTheme(context).mediumIconSize,
          largeIconSize: (size == DigitButtonSize.large && iconSize != null)
              ? WidgetParsers.parseSize(iconSize)
              : DigitButtonThemeData.defaultTheme(context).largeIconSize,
          padding: horizontalPadding != null
              ? EdgeInsets.symmetric(
                  horizontal: WidgetParsers.parseSize(horizontalPadding))
              : DigitButtonThemeData.defaultTheme(context).padding,
          smallDigitButtonTextStyle:
              (size == DigitButtonSize.small && overrideTextStyle)
                  ? DigitButtonThemeData.defaultTheme(context)
                      .smallDigitButtonTextStyle
                      ?.copyWith(fontFamily: fontFamily)
                  : DigitButtonThemeData.defaultTheme(context)
                      .smallDigitButtonTextStyle,
          mediumDigitButtonTextStyle:
              (size == DigitButtonSize.medium && overrideTextStyle)
                  ? DigitButtonThemeData.defaultTheme(context)
                      .mediumDigitButtonTextStyle
                      ?.copyWith(fontFamily: fontFamily)
                  : DigitButtonThemeData.defaultTheme(context)
                      .mediumDigitButtonTextStyle,
          largeDigitButtonTextStyle:
              (size == DigitButtonSize.large && overrideTextStyle)
                  ? DigitButtonThemeData.defaultTheme(context)
                      .largeDigitButtonTextStyle
                      ?.copyWith(fontFamily: fontFamily)
                  : DigitButtonThemeData.defaultTheme(context)
                      .largeDigitButtonTextStyle,
        ),
        mainAxisSize: WidgetParsers.parseMainAxisSize(props['mainAxisSize']),
        mainAxisAlignment:
            WidgetParsers.parseMainAxisAlignment(props['mainAxisAlignment']),
        suffixIcon: props['suffixIcon'] != null
            ? DigitIconMapping.getIcon(props['suffixIcon'])
            : null,
        prefixIcon: props['prefixIcon'] != null
            ? DigitIconMapping.getIcon(props['prefixIcon'])
            : null,
    );

    return WidgetParsers.wrapWithBottomGap(
      alignCenter ? Center(child: button) : button,
      props,
    );
  }
}

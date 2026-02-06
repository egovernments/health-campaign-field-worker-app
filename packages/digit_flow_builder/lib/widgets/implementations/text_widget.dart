import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/flow_widget_state.dart';
import '../../utils/utils.dart';
import '../../utils/widget_parsers.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class TextWidget implements FlowWidget {
  @override
  String get format =>
      'textTemplate'; // add support to take multiple format types

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final state = WidgetStateContext.of(context);
    final localization = LocalizationContext.maybeOf(context);

    // Resolve template using state.evalContext which provides all contexts:
    // itemData, parentData, contextData, formData, widgetData, modelMap
    final value = json['value'] ?? '';
    final resolvedValue = resolveTemplate(
          value,
          state.evalContext,
          localization: localization,
        ) ??
        value;

    // Get style from properties
    final properties = json['properties'] as Map<String, dynamic>? ?? {};
    final styleKey = properties['style']?.toString();
    final textStyle = _parseTextStyle(context, styleKey);

    final displayValue = (resolvedValue ?? '')
        .replaceAll(RegExp(r'\bnull\b', caseSensitive: false), '--');

    return WidgetParsers.wrapWithBottomGap(
      Flexible(
        child: Text(
          displayValue.isEmpty ? '--' : displayValue,
          style: textStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ),
      properties,
    );
  }

  TextStyle? _parseTextStyle(BuildContext context, String? styleKey) {
    if (styleKey == null) return null;

    final digitTextTheme = Theme.of(context).digitTextTheme(context);

    switch (styleKey) {
      // Heading styles
      case 'headingXl':
        return digitTextTheme.headingXl;
      case 'headingL':
        return digitTextTheme.headingL;
      case 'headingM':
        return digitTextTheme.headingM;
      case 'headingS':
        return digitTextTheme.headingS;
      // Body styles
      case 'bodyL':
        return digitTextTheme.bodyL;
      case 'bodyS':
        return digitTextTheme.bodyS;
      // Caption styles
      case 'captionL':
        return digitTextTheme.captionL;
      case 'captionS':
        return digitTextTheme.captionS;
      // Label style
      case 'label':
        return digitTextTheme.label;
      default:
        return null;
    }
  }
}

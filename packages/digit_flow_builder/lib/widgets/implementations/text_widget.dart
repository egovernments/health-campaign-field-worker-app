import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
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
    final crudCtx = CrudItemContext.of(context);
    final localization = LocalizationContext.maybeOf(context);

    // Resolve template with localization support for mixed content
    final value = json['value'] ?? '';
    final resolvedValue = resolveTemplate(
          value,
          crudCtx?.item != null ? crudCtx!.item : crudCtx?.stateData?.rawState,
          localization: localization,
        ) ??
        value;

    // Get style from properties
    final properties = json['properties'] as Map<String, dynamic>? ?? {};
    final styleKey = properties['style']?.toString();
    final textStyle = _parseTextStyle(context, styleKey);

    return WidgetParsers.wrapWithBottomGap(
      Text(
        resolvedValue != "null" ? resolvedValue : "--",
        style: textStyle,
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

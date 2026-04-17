import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/widget_parsers.dart';
import '../resolved_flow_widget.dart';

class TextWidget extends ResolvedFlowWidget {
  @override
  String get format =>
      'textTemplate'; // add support to take multiple format types

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    // Use the pre-resolved label, or resolve 'value' field as fallback
    final value = json['value'] ?? '';

    // Get style from properties
    final properties = json['properties'] as Map<String, dynamic>? ?? {};
    final styleKey = properties['style']?.toString();
    final separatedBy = properties['separatedBy'];
    final replaceAll = properties['replaceAll'] as List?;
    final textStyle = _parseTextStyle(context, styleKey);

    var resolvedValue = (separatedBy != null && value is String)
        ? value
            .split(separatedBy)
            .map((part) => resolved.resolveText(part))
            .join(separatedBy)
        : resolved.resolveText(value);

    if (replaceAll != null) {
      for (var replacement in replaceAll) {
        final searchValue = replacement['searchValue']?.toString() ?? '';
        final replaceValue = replacement['replaceValue']?.toString() ?? '';
        resolvedValue = resolvedValue.replaceAll(searchValue, replaceValue);
      }
    }

    final displayValue = (resolvedValue)
        .replaceAll(RegExp(r'\bnull\b', caseSensitive: false), '--');

    return WidgetParsers.wrapWithBottomGap(
      Text(
        displayValue.isEmpty ? '--' : displayValue,
        style: textStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: json["maxLines"] ?? 2,
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

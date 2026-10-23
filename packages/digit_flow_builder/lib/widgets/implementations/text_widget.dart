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
        style: textStyle?.copyWith(
          color:
              _parseTextColor(context, properties['color']?.toString()) ?? null,
        ),
        textAlign: _parseTextAlign(properties['textAlign']?.toString()),
        // `maxLines: 0` means "as many as it takes" — the only way for a
        // config to ask for genuinely unbounded text, since omitting the key
        // falls back to the two-line default. Ellipsis only makes sense when
        // there is a line cap to overflow.
        overflow: _maxLines(json) == null
            ? TextOverflow.visible
            : TextOverflow.ellipsis,
        maxLines: _maxLines(json),
      ),
      properties,
    );
  }

  int? _maxLines(Map<String, dynamic> json) {
    final raw = json["maxLines"];
    if (raw == null) return 2;
    final value = raw is num ? raw.toInt() : int.tryParse(raw.toString());
    if (value == null) return 2;
    return value <= 0 ? null : value;
  }

  /// Horizontal alignment for the rendered text. Without this a wrapped
  /// string stays left-aligned inside its block even when the block itself
  /// has been centred by the surrounding row.
  TextAlign? _parseTextAlign(String? value) {
    switch (value) {
      case 'center':
        return TextAlign.center;
      case 'right':
      case 'end':
        return TextAlign.end;
      case 'left':
      case 'start':
        return TextAlign.start;
      default:
        return null;
    }
  }

  Color? _parseTextColor(BuildContext context, String? colorKey) {
    if (colorKey == null) return null;

    final theme = Theme.of(context);
    switch (colorKey) {
      case 'primary':
        return theme.colorScheme.primary;
      case 'onPrimary':
        return theme.colorScheme.onPrimary;
      case 'secondary':
        return theme.colorScheme.secondary;
      case 'onSecondary':
        return theme.colorScheme.onSecondary;
      case 'error':
        return theme.colorScheme.error;
      case 'onError':
        return theme.colorScheme.onError;
      case 'surface':
        return theme.colorScheme.surface;
      case 'onSurface':
        return theme.colorScheme.onSurface;
      case 'textSecondary':
        return theme.colorTheme.text.secondary;
      case 'inputBorder':
        return theme.colorTheme.generic.inputBorder;
      default:
        return null;
    }
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

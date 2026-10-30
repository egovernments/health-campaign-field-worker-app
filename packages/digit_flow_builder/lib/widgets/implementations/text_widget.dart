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
    final baseStyle = _parseTextStyle(context, styleKey);
    final themedStyle = baseStyle?.copyWith(
      color: _parseTextColor(context, properties['color']?.toString()),
    );
    // An explicit `textStyle` (design values: hex colour, px size, weight,
    // family, line height) wins over the theme `style` and `color` keys.
    final textStyle = _applyTextStyle(themedStyle, properties['textStyle']);

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

  /// Merges a `textStyle` map over [base]. Keys: `color` (#RRGGBB or
  /// #AARRGGBB), `fontSize` (number or "18px"), `fontWeight` (100–900 or
  /// "bold"/"normal"), `fontFamily` (first family of a CSS list) and
  /// `lineHeight` (multiplier).
  TextStyle? _applyTextStyle(TextStyle? base, dynamic spec) {
    if (spec is! Map) return base;

    final color = _parseHexColor(spec['color']?.toString());
    final fontSize = _parseNumber(spec['fontSize']);
    final fontWeight = _parseFontWeight(spec['fontWeight']);
    // Bundled families are registered without spaces ("RobotoCondensed"),
    // while design specs use the CSS name ("Roboto Condensed").
    final fontFamily = spec['fontFamily']
        ?.toString()
        .split(',')
        .first
        .replaceAll(RegExp('[\'" ]'), '');
    final lineHeight = _parseNumber(spec['lineHeight']);

    return (base ?? const TextStyle()).copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily:
          fontFamily == null || fontFamily.isEmpty ? null : fontFamily,
      height: lineHeight,
    );
  }

  Color? _parseHexColor(String? value) {
    if (value == null || !value.startsWith('#')) return null;
    var hex = value.substring(1);
    if (hex.length == 6) hex = 'FF$hex';
    if (hex.length != 8) return null;
    final argb = int.tryParse(hex, radix: 16);
    return argb == null ? null : Color(argb);
  }

  double? _parseNumber(dynamic value) {
    if (value is num) return value.toDouble();
    if (value is String) {
      return double.tryParse(value.trim().replaceAll(RegExp(r'px$'), ''));
    }
    return null;
  }

  FontWeight? _parseFontWeight(dynamic value) {
    if (value == 'bold') return FontWeight.bold;
    if (value == 'normal') return FontWeight.normal;
    final weight = _parseNumber(value)?.round();
    if (weight == null || weight < 100 || weight > 900) return null;
    return FontWeight.values[weight ~/ 100 - 1];
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

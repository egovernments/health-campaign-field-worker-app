import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/digit_tag_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_tag.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/widget_parsers.dart';
import '../resolved_flow_widget.dart';

class TagWidget extends ResolvedFlowWidget {
  @override
  String get format => 'tag';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final properties = json['properties'] as Map<String, dynamic>?;
    final resolveValue = json['labelPlaceHolders'] != null
        ? resolved.resolveTextWithPlaceHolders(
            json['label'], json['labelPlaceHolders'])
        : resolved.resolveTextWithArgs(json['label'], json['labelArgs']);
    final tagTypeStr = properties?['tagType'] as String? ?? '';
    final theme = Theme.of(context);
    final iconKey = properties?['icon'] as String?;

    if (tagTypeStr == 'info') {
      final bgOpacity = (properties?['bgOpacity'] as num?)?.toDouble();
      // 'warningBg' renders as a light amber tint (warning at 16% over paper)
      // instead of the raw warningBg token, which is too close to white to
      // stand out against the card while still being WCAG-friendly and light.
      final baseBackground = properties?['bgColor'] == 'warningBg'
          ? Color.alphaBlend(
              theme.colorTheme.alert.warning.withOpacity(0.16),
              theme.colorTheme.paper.primary,
            )
          : theme.colorTheme.alert.infoBg;
      final backgroundColor = bgOpacity != null
          ? baseBackground.withOpacity(bgOpacity)
          : baseBackground;
      final textColor = properties?['textColor'] == 'primary2'
          ? theme.colorTheme.primary.primary2
          : theme.colorTheme.alert.info;

      return WidgetParsers.wrapWithBottomGap(
        Tag(
          isIcon: true,
          isStroke: false,
          label: resolveValue,
          type: TagType.monochrome,
          customIcon: iconKey != null
              ? Icon(DigitIconMapping.getIcon(iconKey), color: textColor, size: 16)
              : null,
          themeData: TagThemeData(
            monochromeBackgroundColor: backgroundColor,
            monochromeColor: textColor,
          ),
        ),
        properties,
      );
    }

    final tagType = WidgetParsers.parseTagType(properties?['tagType']);
    final isStroke = properties?['isStroke'] as bool? ?? false;

    // For error tags with a dynamic status label, pick the icon from the
    // raw (untranslated) status so "Not Eligible" and "Unable to Deliver"
    // get their distinct glyphs even though they share one config node.
    IconData? statusIcon;
    if (iconKey == null && tagType == TagType.error) {
      final rawStatus =
          resolved.resolveFieldRaw(json['label'])?.toString().toUpperCase() ??
              '';
      statusIcon = rawStatus.contains('INELIGIBLE')
          ? Icons.warning_rounded
          : Icons.error;
    }

    return WidgetParsers.wrapWithBottomGap(
      Tag(
        isIcon: true,
        isStroke: isStroke,
        label: resolveValue,
        type: tagType,
        customIcon: (iconKey != null || statusIcon != null)
            ? Icon(
                iconKey != null
                    ? DigitIconMapping.getIcon(iconKey)
                    : statusIcon,
                color: tagType == TagType.error
                    ? theme.colorTheme.alert.error
                    : theme.colorTheme.alert.warning,
                size: 16,
              )
            : null,
      ),
      properties,
    );
  }
}

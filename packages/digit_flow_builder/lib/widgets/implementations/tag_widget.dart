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
      final backgroundColor = bgOpacity != null
          ? theme.colorTheme.alert.infoBg.withOpacity(bgOpacity)
          : theme.colorTheme.alert.infoBg;
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
    final isStroke = properties?['isStroke'] as bool? ?? true;
    return WidgetParsers.wrapWithBottomGap(
      Tag(
        isIcon: true,
        isStroke: isStroke,
        label: resolveValue,
        type: tagType,
        customIcon: iconKey != null
            ? Icon(
                DigitIconMapping.getIcon(iconKey),
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

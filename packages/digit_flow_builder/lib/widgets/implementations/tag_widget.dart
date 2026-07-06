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
    final resolveValue = resolved.resolveText(json['label']);
    final tagTypeStr = properties?['tagType'] as String? ?? '';

    if (tagTypeStr == 'info') {
      final theme = Theme.of(context);
      return WidgetParsers.wrapWithBottomGap(
        Tag(
          isIcon: true,
          isStroke: false,
          label: resolveValue,
          type: TagType.monochrome,
          themeData: TagThemeData(
            monochromeBackgroundColor: theme.colorTheme.alert.infoBg,
            monochromeColor: theme.colorTheme.alert.info,
          ),
        ),
        properties,
      );
    }

    return WidgetParsers.wrapWithBottomGap(
      Tag(
        isIcon: true,
        isStroke: true,
        label: resolveValue,
        type: WidgetParsers.parseTagType(properties?['tagType']),
      ),
      properties,
    );
  }
}

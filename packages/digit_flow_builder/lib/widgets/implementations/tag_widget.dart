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
    // Label is already resolved by the base class
    final properties = json['properties'] as Map<String, dynamic>?;

    return WidgetParsers.wrapWithBottomGap(
      Tag(
        isStroke: true,
        label: resolved.resolvedLabel ?? '',
        type: WidgetParsers.parseTagType(properties?['tagType']),
      ),
      properties,
    );
  }
}

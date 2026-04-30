import 'package:digit_ui_components/widgets/atoms/digit_tag.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/widget_parsers.dart';
import '../localization_context.dart';
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
    final tagMapping =
        properties?['tagMapping'] as Map<String, dynamic>?;

    // Resolve the value template if present (e.g., additionalFields lookups)
    final rawValue = json['value'] as String?;
    final resolvedValue = rawValue != null && rawValue.isNotEmpty
        ? resolved.resolveTextWithCrudStates(rawValue)
        : null;

    // Determine label and tag type from tagMapping or fallback to resolvedLabel
    String displayLabel;
    TagType tagType = WidgetParsers.parseTagType(properties?['tagType']);

    if (resolvedValue != null &&
        resolvedValue.isNotEmpty &&
        tagMapping != null &&
        tagMapping.containsKey(resolvedValue)) {
      final mapping = tagMapping[resolvedValue] as Map<String, dynamic>;
      final mappedLabel = mapping['label'] as String? ?? resolvedValue;
      final localization = LocalizationContext.maybeOf(context);
      displayLabel = localization?.translate(mappedLabel) ?? mappedLabel;
      final mappedType = mapping['type'] as String?;
      if (mappedType != null) {
        tagType = WidgetParsers.parseTagType(mappedType);
      }
    } else {
      displayLabel = resolved.resolvedLabel ?? resolvedValue ?? '';
    }

    return WidgetParsers.wrapWithBottomGap(
      Tag(
        isStroke: true,
        label: displayLabel,
        type: tagType,
      ),
      properties,
    );
  }
}

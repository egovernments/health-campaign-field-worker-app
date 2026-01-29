import 'package:digit_ui_components/widgets/atoms/digit_tag.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/flow_widget_state.dart';
import '../../utils/utils.dart';
import '../../utils/widget_parsers.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class TagWidget implements FlowWidget {
  @override
  String get format => 'tag';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final flowState = WidgetStateContext.of(context);
    final localization = LocalizationContext.maybeOf(context);

    // Check visibility condition
    if (json['visible'] != null) {
      final visible = ConditionalEvaluator.evaluate(
        json['visible'],
        flowState.evalContext,
        stateData: flowState.stateData,
      );
      if (visible == false) {
        return const SizedBox.shrink();
      }
    }

    // Resolve template using flowState.evalContext
    final value = json['label'] ?? '';
    final valueText = resolveTemplate(
          value,
          flowState.evalContext,
          localization: localization,
        ) ??
        value;

    final properties = json['properties'] as Map<String, dynamic>?;

    return WidgetParsers.wrapWithBottomGap(
      Tag(
        isStroke: true,
        label: valueText,
        type: WidgetParsers.parseTagType(properties?['tagType']),
      ),
      properties,
    );
  }
}

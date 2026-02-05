import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/flow_widget_state.dart';
import '../../utils/interpolation.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class ExpandableWidget implements FlowWidget {
  @override
  String get format => 'expandable';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final flowState = WidgetStateContext.of(context);

    // Check visibility condition
    final visible = ConditionalEvaluator.evaluate(
      json['visible'] ?? true,
      flowState.evalContext,
    );

    if (visible == false) {
      return const SizedBox.shrink();
    }

    return _ExpandableStateful(
      json: json,
      onAction: onAction,
      flowState: flowState,
    );
  }
}

class _ExpandableStateful extends StatefulWidget {
  final Map<String, dynamic> json;
  final void Function(ActionConfig) onAction;
  final FlowWidgetState flowState;

  const _ExpandableStateful({
    required this.json,
    required this.onAction,
    required this.flowState,
  });

  @override
  State<_ExpandableStateful> createState() => _ExpandableStatefulState();
}

class _ExpandableStatefulState extends State<_ExpandableStateful> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.json['initiallyExpanded'] == true;
  }

  @override
  Widget build(BuildContext context) {
    final localization = LocalizationContext.maybeOf(context);
    final flowState = widget.flowState;
    final stateData = flowState.stateData;

    // Resolve expand/collapse labels
    final expandLabelText =
        widget.json['expandLabel']?.toString() ?? 'VIEW_DETAILS';
    final collapseLabelText =
        widget.json['collapseLabel']?.toString() ?? 'HIDE_DETAILS';

    final expandLabel =
        localization?.translate(expandLabelText) ?? expandLabelText;
    final collapseLabel =
        localization?.translate(collapseLabelText) ?? collapseLabelText;

    // Build children widgets
    final childrenJson = widget.json['children'] as List<dynamic>? ?? [];
    final childWidgets = childrenJson.map<Widget>((childJson) {
      final processed = stateData != null
          ? preprocessConfigWithState(
              Map<String, dynamic>.from(childJson),
              stateData,
              listIndex: flowState.listIndex,
              item: flowState.itemData,
            )
          : Map<String, dynamic>.from(childJson);

      return CrudItemContext(
        stateData: stateData,
        listIndex: flowState.listIndex,
        item: flowState.itemData,
        screenKey: flowState.screenKey,
        compositeKey: flowState.compositeKey,
        child: LayoutMapper.map(
          processed,
          stateData,
          context,
          widget.onAction,
          item: flowState.itemData,
          listIndex: flowState.listIndex,
          compositeKey: flowState.compositeKey,
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        DigitButton(
          type: DigitButtonType.link,
          size: DigitButtonSize.medium,
          onPressed: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          suffixIcon: isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
          label: isExpanded ? collapseLabel : expandLabel,
        ),
        if (isExpanded) ...childWidgets,
      ],
    );
  }
}

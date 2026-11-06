import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/flow_widget_state.dart';
import '../../utils/interpolation.dart';
import '../../widget_registry.dart';
import '../localization_context.dart';
import '../resolved_flow_widget.dart';

class ExpandableWidget extends ResolvedFlowWidget {
  @override
  String get format => 'expandable';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    // Visibility already checked by base class
    return _ExpandableStateful(
      json: json,
      onAction: onAction,
      flowState: resolved.state,
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

import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/conditional_evaluator.dart';
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
    final crudCtx = CrudItemContext.of(context);
    final stateData = crudCtx?.stateData;

    // Create evaluation context
    final evalContext = {
      'item': crudCtx?.item,
      'contextData': crudCtx?.stateData?.rawState ?? {},
    };

    // Check visibility condition
    final visible = ConditionalEvaluator.evaluate(
      json['visible'] ?? true,
      evalContext,
    );

    if (visible == false) {
      return const SizedBox.shrink();
    }

    return _ExpandableStateful(
      json: json,
      onAction: onAction,
      stateData: stateData,
      crudCtx: crudCtx,
    );
  }
}

class _ExpandableStateful extends StatefulWidget {
  final Map<String, dynamic> json;
  final void Function(ActionConfig) onAction;
  final CrudStateData? stateData;
  final CrudItemContext? crudCtx;

  const _ExpandableStateful({
    required this.json,
    required this.onAction,
    this.stateData,
    this.crudCtx,
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
      final processed = widget.stateData != null
          ? preprocessConfigWithState(
              Map<String, dynamic>.from(childJson),
              widget.stateData!,
              listIndex: widget.crudCtx?.listIndex,
              item: widget.crudCtx?.item,
            )
          : Map<String, dynamic>.from(childJson);

      return CrudItemContext(
        stateData: widget.stateData,
        listIndex: widget.crudCtx?.listIndex,
        item: widget.crudCtx?.item,
        screenKey: widget.crudCtx?.screenKey,
        child: LayoutMapper.map(
          processed,
          widget.stateData,
          context,
          widget.onAction,
          item: widget.crudCtx?.item,
          listIndex: widget.crudCtx?.listIndex,
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

import 'package:digit_ui_components/theme/radius.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/interpolation.dart';
import '../../utils/widget_parsers.dart';
import '../../widget_registry.dart';
import '../resolved_flow_widget.dart';

class CardWidget extends ResolvedFlowWidget {
  @override
  String get format => 'card';

  /// Mirrors the visibility check used for top-level body items in
  /// layout_renderer so hidden children are skipped entirely instead of
  /// rendering as zero-height widgets that still receive DigitCard's
  /// inter-child spacing.
  bool _isChildVisible(Map<String, dynamic> json, dynamic stateData,
      String? screenKey, dynamic item) {
    final modelMap = stateData?.modelMap ?? {};
    final evalContext = {
      'item': item,
      'contextData': stateData?.rawState ?? {},
      ...modelMap,
    };

    if (json['hidden'] != null) {
      final hiddenResult = ConditionalEvaluator.evaluate(
        json['hidden'],
        evalContext,
        screenKey: screenKey,
        stateData: stateData,
      );
      if (hiddenResult == true) return false;
    }

    if (json['visible'] != null) {
      final visibleResult = ConditionalEvaluator.evaluate(
        json['visible'],
        evalContext,
        screenKey: screenKey,
        stateData: stateData,
      );
      if (visibleResult == false) return false;
    }

    return true;
  }

  double? _parseRadiusValue(dynamic key) {
    switch (key?.toString()) {
      case 'radius1':
        return radius1;
      case 'radius2':
        return radius2;
      case 'radius3':
        return radius3;
      case 'radius4':
        return radius4;
      default:
        return null;
    }
  }

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final stateData = resolved.stateData;

    // Read spacing from properties (can be conditional, e.g., 0 when child is hidden)
    final spacingValue = json['properties']?['spacing'];
    final double? spacing =
        spacingValue is num ? spacingValue.toDouble() : null;

    final String cardTypeStr =
        json['properties']?['type']?.toString() ?? 'primary';
    final radiusOverride = _parseRadiusValue(json['properties']?['radius']);
    // Secondary cards use radius1 (4px) to match the SelectionCard container,
    // unless a per-instance "radius" property is provided.
    // Primary cards fall back to DigitCard's own default (radius4 = 12px).
    final BorderRadius? borderRadius = radiusOverride != null
        ? BorderRadius.circular(radiusOverride)
        : (cardTypeStr == 'secondary' ? BorderRadius.circular(radius1) : null);

    return DigitCard(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.zero,
      spacing: spacing,
      borderRadius: borderRadius,
      cardType: WidgetParsers.parseCardType(cardTypeStr),
      onPressed: () {
        if (json['onAction'] != null) {
          final actionsList =
              List<Map<String, dynamic>>.from(json['onAction']);
          final currentEvalContext = resolved.getFreshEvalContext();

          for (var actionJson in actionsList) {
            final action =
                resolved.resolveAction(actionJson, currentEvalContext);
            onAction(action);
          }
        }
      },
      children: (json['children'] as List).map<Widget?>((childJson) {
        final processed = stateData != null
            ? preprocessConfigWithState(
                Map<String, dynamic>.from(childJson),
                stateData,
                listIndex: crudCtx?.listIndex,
                item: crudCtx?.item,
              )
            : Map<String, dynamic>.from(childJson);

        // Skip hidden children so they don't consume DigitCard's
        // inter-child spacing as invisible zero-height widgets.
        if (!_isChildVisible(
            processed, stateData, crudCtx?.screenKey, crudCtx?.item)) {
          return null;
        }

        return CrudItemContext(
          stateData: stateData,
          listIndex: crudCtx?.listIndex,
          item: crudCtx?.item,
          screenKey: crudCtx?.screenKey,
          compositeKey: resolved.compositeKey,
          child: LayoutMapper.map(processed, stateData, context, onAction,
              item: crudCtx?.item,
              listIndex: crudCtx?.listIndex,
              compositeKey: resolved.compositeKey),
        );
      }).whereType<Widget>().toList(),
    );
  }
}

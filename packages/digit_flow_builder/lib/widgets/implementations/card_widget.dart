import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/flow_widget_state.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import '../../utils/widget_parsers.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class CardWidget implements FlowWidget {
  @override
  String get format => 'card';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final flowState = WidgetStateContext.of(context);
    final crudCtx = CrudItemContext.of(context);
    final stateData = flowState.stateData;

    // Check visibility condition
    final visible = ConditionalEvaluator.evaluate(
      json['visible'] ?? true,
      flowState.evalContext,
    );

    if (visible == false) {
      return const SizedBox.shrink();
    }

    // Read spacing from properties (can be conditional, e.g., 0 when child is hidden)
    final spacingValue = json['properties']?['spacing'];
    final double? spacing = spacingValue is num ? spacingValue.toDouble() : null;

    return DigitCard(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(5),
      spacing: spacing,
      cardType: WidgetParsers.parseCardType(
          json['properties']?['type']?.toString() ?? 'primary'),
      onPressed: () {
        if (json['onAction'] != null) {
          final actionsList = List<Map<String, dynamic>>.from(json['onAction']);

          for (var actionJson in actionsList) {
            var action = ActionConfig.fromJson(actionJson);

            // Resolve navigation data if present
            final navData = action.properties['data'] as List<dynamic>?;

            if (navData != null) {
              final resolvedData = navData.map((entry) {
                final key = entry['key'] as String;
                final rawValue = entry['value'];

                // Resolve using flowState.evalContext which contains all data sources
                final resolvedValue = resolveValue(rawValue, flowState.evalContext);

                return {
                  "key": key,
                  "value": resolvedValue == rawValue ? rawValue : resolvedValue,
                };
              }).toList();

              action = ActionConfig(
                action: action.action,
                actionType: action.actionType,
                properties: {
                  ...action.properties,
                  'data': resolvedData,
                },
                condition: action.condition,
                actions: action.actions,
              );
            }

            onAction(action);
          }
        }
      },
      children: (json['children'] as List).map<Widget>((childJson) {
        final processed = stateData != null
            ? preprocessConfigWithState(
                Map<String, dynamic>.from(childJson),
                stateData,
                listIndex: crudCtx?.listIndex,
                item: crudCtx?.item,
              )
            : Map<String, dynamic>.from(childJson);

        return CrudItemContext(
          stateData: stateData,
          listIndex: crudCtx?.listIndex,
          item: crudCtx?.item,
          screenKey: crudCtx?.screenKey,
          child: LayoutMapper.map(processed, stateData, context, onAction,
              item: crudCtx?.item, listIndex: crudCtx?.listIndex),
        );
      }).toList(),
    );
  }
}

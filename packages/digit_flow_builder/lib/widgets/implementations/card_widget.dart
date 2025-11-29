import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../layout_renderer.dart';
import '../../utils/conditional_evaluator.dart';
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
    final crudCtx = CrudItemContext.of(context);
    final stateData = crudCtx?.stateData;

    // Get form data from registry for resolving form field values
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);
    final formData = screenKey != null
        ? FlowCrudStateRegistry().get(screenKey)?.formData
        : null;

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

    return DigitCard(
      width: MediaQuery.of(context).size.width,
      cardType:
          WidgetParsers.parseCardType(json['type']?.toString() ?? 'primary'),
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

                // Try to resolve from modelMap first, then fallback to formData
                dynamic resolvedValue = stateData != null
                    ? resolveValue(rawValue, stateData.modelMap)
                    : rawValue;

                if (resolvedValue == rawValue && formData != null) {
                  // If not resolved from modelMap, try formData
                  resolvedValue = resolveValue(rawValue, formData);
                }

                return {
                  "key": key,
                  "value": resolvedValue,
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

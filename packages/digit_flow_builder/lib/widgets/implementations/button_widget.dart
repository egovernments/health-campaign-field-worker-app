import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import '../../utils/widget_parsers.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class ButtonWidget implements FlowWidget {
  @override
  String get format => 'button';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final crudStateData = crudCtx?.stateData;
    final stateData = (crudCtx?.item != null && crudCtx!.item!.isNotEmpty)
        ? crudCtx.item
        : crudCtx?.stateData?.rawState != null &&
                crudCtx!.stateData!.rawState.isNotEmpty
            ? crudCtx.stateData?.rawState.first
            : null;

    // Get form data from registry for resolving form field values
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);
    final formData = screenKey != null
        ? FlowCrudStateRegistry().get(screenKey)?.formData
        : null;

    // Create evaluation context
    final evalContext = {
      'item': crudCtx?.item,
      'contextData': crudCtx?.stateData?.rawState ?? {},
      ...crudStateData?.modelMap ?? {},
    };

    // Check visibility condition
    if (json['visible'] != null) {
      final visible = ConditionalEvaluator.evaluate(
        json['visible'],
        evalContext,
        stateData: crudStateData,
      );
      if (visible == false) {
        return const SizedBox.shrink();
      }
    }

    // Check disabled condition
    bool isDisabled = false;
    if (json['disabled'] != null) {
      final disabledResult = ConditionalEvaluator.evaluate(
        json['disabled'],
        evalContext,
        stateData: crudStateData,
      );
      isDisabled = disabledResult == true;
    }

    final props = Map<String, dynamic>.from(json['properties'] ?? {});
    final localization = LocalizationContext.maybeOf(context);

    // Localize first, then resolve template
    final labelText = json['label'] ?? '';
    final localizedLabel = localization?.translate(labelText) ?? labelText;

    // Use interpolateWithCrudStates for proper contextData resolution
    String resolvedLabel = localizedLabel;
    if (crudStateData != null && localizedLabel.contains('{{')) {
      resolvedLabel = interpolateWithCrudStates(
        template: localizedLabel,
        stateData: crudStateData,
        item: crudCtx?.item,
      );
    } else if (stateData != null) {
      resolvedLabel = resolveTemplate(localizedLabel, stateData) ?? localizedLabel;
    }

    return DigitButton(
      label: resolvedLabel,
      isDisabled: isDisabled,
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

                // Try to resolve from stateData first, then fallback to formData
                dynamic resolvedValue = stateData != null
                    ? resolveValue(rawValue, stateData)
                    : rawValue;

                if (resolvedValue == rawValue && formData != null) {
                  // If not resolved from stateData, try formData
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
      type: WidgetParsers.parseButtonType(props['type']),
      size: WidgetParsers.parseButtonSize(props['size']),
      mainAxisSize: WidgetParsers.parseMainAxisSize(props['mainAxisSize']),
      mainAxisAlignment:
          WidgetParsers.parseMainAxisAlignment(props['mainAxisAlignment']),
      suffixIcon: json['suffixIcon'] != null
          ? DigitIconMapping.getIcon(json['suffixIcon'])
          : null,
      prefixIcon: json['prefixIcon'] != null
          ? DigitIconMapping.getIcon(json['prefixIcon'])
          : null,
    );
  }
}

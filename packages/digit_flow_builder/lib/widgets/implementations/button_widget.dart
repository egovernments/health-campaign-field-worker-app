import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../action_handler/action_handler.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/flow_widget_state.dart';
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
    final flowState = WidgetStateContext.of(context);
    final crudStateData = flowState.stateData;

    // Check visibility condition
    if (json['visible'] != null) {
      final visible = ConditionalEvaluator.evaluate(
        json['visible'],
        flowState.evalContext,
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
        flowState.evalContext,
        stateData: crudStateData,
      );
      isDisabled = disabledResult == true;
    }

    final props = Map<String, dynamic>.from(json['properties'] ?? {});
    final localization = LocalizationContext.maybeOf(context);

    // Resolve template with localization support for mixed content
    final labelText = json['label'] ?? '';
    String resolvedLabel = labelText;
    if (crudStateData != null && labelText.contains('{{')) {
      // For complex templates, use interpolateWithCrudStates then localize non-placeholder parts
      resolvedLabel = interpolateWithCrudStates(
        template: labelText,
        stateData: crudStateData,
        item: flowState.itemData,
      );
      // Translate if it's a pure localization key (no templates remaining)
      if (!resolvedLabel.contains('{{')) {
        resolvedLabel = localization?.translate(resolvedLabel) ?? resolvedLabel;
      }
    } else {
      resolvedLabel = resolveTemplate(
            labelText,
            flowState.evalContext,
            localization: localization,
          ) ??
          labelText;
    }

    return WidgetParsers.wrapWithBottomGap(
      DigitButton(
        crossAxisAlignment: CrossAxisAlignment.center,
        label: resolvedLabel,
        isDisabled: isDisabled,
        onPressed: () async {
          if (json['onAction'] != null) {
            final actionsList = List<Map<String, dynamic>>.from(json['onAction']);

            // Helper function to resolve navigation data for an action
            Map<String, dynamic> resolveNavDataForAction(Map<String, dynamic> actionJson) {
              var action = ActionConfig.fromJson(actionJson);
              final navData = action.properties['data'] as List<dynamic>?;

              if (navData != null) {
                final resolvedData = navData.map((entry) {
                  final rawValue = entry['value'];

                  // Try to resolve from stateData first, then widgetData, then formData
                  dynamic resolvedValue = flowState.evalContext.isNotEmpty
                      ? resolveValue(rawValue, flowState.evalContext)
                      : rawValue;

                  if (resolvedValue == rawValue && flowState.widgetData.isNotEmpty) {
                    // If not resolved from stateData, try widgetData
                    resolvedValue = resolveValue(rawValue, flowState.widgetData);
                  }

                  if (resolvedValue == rawValue && flowState.formData.isNotEmpty) {
                    // If not resolved from widgetData, try formData
                    resolvedValue = resolveValue(rawValue, flowState.formData);
                  }

                  return {
                    ...Map<String, dynamic>.from(entry), // Keep all original fields (operation, root, etc.)
                    "value": resolvedValue ?? rawValue,
                  };
                }).toList();

                return {
                  ...actionJson,
                  'properties': {
                    ...action.properties,
                    'data': resolvedData,
                  },
                };
              }

              return actionJson;
            }

            // Pre-resolve navigation data and condition expressions for all actions
            final resolvedActionsList = actionsList.map((actionJson) {
              var resolvedActionJson = Map<String, dynamic>.from(actionJson);

              // Resolve condition expression if present
              if (actionJson['condition'] != null) {
                final condition = Map<String, dynamic>.from(actionJson['condition']);
                final expression = condition['expression'] as String?;
                if (expression != null && expression.contains('{{')) {
                  // Resolve the expression template using flowState.evalContext
                  String resolvedExpression = resolveTemplate(expression, flowState.evalContext) ?? expression;
                  if (resolvedExpression == expression && crudStateData != null) {
                    resolvedExpression = resolveValueRaw(
                      expression,
                      flowState.evalContext,
                    );
                  }
                  condition['expression'] = resolvedExpression;
                  resolvedActionJson['condition'] = condition;
                }
              }

              // Check if this is a conditional action with nested actions array
              if (actionJson['actions'] != null) {
                final nestedActions = List<Map<String, dynamic>>.from(actionJson['actions']);
                final resolvedNestedActions = nestedActions.map((nestedAction) {
                  return resolveNavDataForAction(Map<String, dynamic>.from(nestedAction));
                }).toList();
                resolvedActionJson['actions'] = resolvedNestedActions;
              } else {
                // Resolve navigation data for top-level action
                resolvedActionJson = resolveNavDataForAction(resolvedActionJson);
              }

              return resolvedActionJson;
            }).toList();

            // Build initial context data from current state using flowState.evalContext
            final initialContextData = <String, dynamic>{
              'wrappers': const [],
              ...flowState.evalContext,
            };

            // Use ActionHandler.executeActions to chain actions with shared contextData
            // This ensures that REVERSE_TRANSFORM's formData flows to NAVIGATION
            await ActionHandler.executeActions(
              resolvedActionsList,
              context,
              initialContextData,
            );
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
      ),
      props,
    );
  }
}

import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../action_handler/action_handler.dart';
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

    // Get form data and widget data from registry for resolving field values
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);
    final currentState = screenKey != null
        ? FlowCrudStateRegistry().get(screenKey)
        : null;
    final formData = currentState?.formData;
    final widgetData = currentState?.widgetData;

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

    // Resolve template with localization support for mixed content
    final labelText = json['label'] ?? '';
    String resolvedLabel = labelText;
    if (crudStateData != null && labelText.contains('{{')) {
      // For complex templates, use interpolateWithCrudStates then localize non-placeholder parts
      resolvedLabel = interpolateWithCrudStates(
        template: labelText,
        stateData: crudStateData,
        item: crudCtx?.item,
      );
      // Translate if it's a pure localization key (no templates remaining)
      if (!resolvedLabel.contains('{{')) {
        resolvedLabel = localization?.translate(resolvedLabel) ?? resolvedLabel;
      }
    } else {
      resolvedLabel = resolveTemplate(
            labelText,
            stateData,
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
                  dynamic resolvedValue = evalContext != null
                      ? resolveValue(rawValue, evalContext)
                      : rawValue;

                  if (resolvedValue == rawValue && widgetData != null) {
                    // If not resolved from stateData, try widgetData
                    resolvedValue = resolveValue(rawValue, widgetData);
                  }

                  if (resolvedValue == rawValue && formData != null) {
                    // If not resolved from widgetData, try formData
                    resolvedValue = resolveValue(rawValue, formData);
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
                  // Resolve the expression template
                  String resolvedExpression = expression;
                  if (stateData != null) {
                    resolvedExpression = resolveTemplate(expression, evalContext) ?? expression;
                  }
                  if (resolvedExpression == expression && crudStateData != null) {
                    resolvedExpression = resolveValueRaw(
                      expression,
                      evalContext,
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

            // Build initial context data from current state
            final initialContextData = <String, dynamic>{
              'wrappers': const [],
              if (stateData != null) ...{
                'item': crudCtx?.item,
                'contextData': stateData,
              },
              if (formData != null) 'formData': formData,
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

import 'package:digit_flow_builder/action_handler/action_handler.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/utils/flow_widget_state.dart';
import 'package:digit_flow_builder/utils/utils.dart';
import 'package:digit_ui_components/constants/icon_mapping.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../flow_widget_interface.dart';

class IconsButtonWidget implements FlowWidget {
  @override
  String get format => 'iconButton';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final iconData = json['iconData'];
    final flowState = WidgetStateContext.of(context);
    final crudStateData = flowState.stateData;

    return IconButton(
      onPressed: () async {
        if (json['onAction'] != null) {
          final actionsList = List<Map<String, dynamic>>.from(json['onAction']);

          // Read current data from registry at click time
          // flowState data is captured at widget build time and may be stale
          final compositeKey = flowState.compositeKey ?? flowState.screenKey;
          final registryState = compositeKey != null
              ? FlowCrudStateRegistry().get(compositeKey)
              : null;
          final currentWidgetData =
              registryState?.widgetData ?? flowState.widgetData;
          final currentFormData = registryState?.formData ?? flowState.formData;

          // Build evalContext with latest widgetData and formData
          final currentEvalContext = <String, dynamic>{
            ...flowState.evalContext,
            ...currentFormData,
            ...currentWidgetData,
            'widgetData': currentWidgetData,
            'formData': currentFormData,
          };

          // Helper function to resolve navigation data for an action
          Map<String, dynamic> resolveNavDataForAction(
              Map<String, dynamic> actionJson) {
            var action = ActionConfig.fromJson(actionJson);
            final navData = action.properties['data'] as List<dynamic>?;

            if (navData != null) {
              final resolvedData = navData.map((entry) {
                final rawValue = entry['value'];

                // Try to resolve from evalContext first, then widgetData, then formData
                dynamic resolvedValue =
                    resolveValue(rawValue, currentEvalContext) ?? rawValue;

                if (resolvedValue == rawValue && currentWidgetData.isNotEmpty) {
                  // If not resolved from evalContext, try widgetData
                  resolvedValue = resolveValue(rawValue, currentWidgetData);
                }

                if (resolvedValue == rawValue && currentFormData.isNotEmpty) {
                  // If not resolved from widgetData, try formData
                  resolvedValue = resolveValue(rawValue, currentFormData);
                }

                return {
                  ...Map<String, dynamic>.from(
                      entry), // Keep all original fields (operation, root, etc.)
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
              final condition =
                  Map<String, dynamic>.from(actionJson['condition']);
              final expression = condition['expression'] as String?;
              if (expression != null && expression.contains('{{')) {
                // Resolve the expression template using current registry data
                String resolvedExpression =
                    resolveTemplate(expression, currentEvalContext) ??
                        expression;
                if (resolvedExpression == expression && crudStateData != null) {
                  resolvedExpression = resolveValueRaw(
                    expression,
                    currentEvalContext,
                  );
                }
                condition['expression'] = resolvedExpression;
                resolvedActionJson['condition'] = condition;
              }
            }

            // Check if this is a conditional action with nested actions array
            if (actionJson['actions'] != null) {
              final nestedActions =
                  List<Map<String, dynamic>>.from(actionJson['actions']);
              final resolvedNestedActions = nestedActions.map((nestedAction) {
                return resolveNavDataForAction(
                    Map<String, dynamic>.from(nestedAction));
              }).toList();
              resolvedActionJson['actions'] = resolvedNestedActions;
            } else {
              // Resolve navigation data for top-level action
              resolvedActionJson = resolveNavDataForAction(resolvedActionJson);
            }

            return resolvedActionJson;
          }).toList();

          // Build initial context data using current registry data
          // Also include navigation params from registry for condition evaluation
          final screenKey = flowState.screenKey;
          final navigationParams = screenKey != null
              ? FlowCrudStateRegistry()
                      .getNavigationParams(compositeKey ?? screenKey) ??
                  FlowCrudStateRegistry()
                      .getNavigationParams(screenKey.split('::').last) ??
                  {}
              : <String, dynamic>{};

          final initialContextData = <String, dynamic>{
            'wrappers': const [],
            ...currentEvalContext,
            'navigation': navigationParams,
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
      icon: Icon(DigitIconMapping.getIcon(iconData)),
    );
  }
}

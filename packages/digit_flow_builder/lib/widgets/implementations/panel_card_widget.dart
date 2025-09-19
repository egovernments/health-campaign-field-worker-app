import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class PanelCardWidget implements FlowWidget {
  @override
  String get format => 'panelCard';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final label = json['label'] ?? '';
    final description = json['description'] ?? '';
    Map<String, dynamic>? primaryAction = json['primaryAction'];
    Map<String, dynamic>? secondaryAction = json['secondaryAction'];

    void handleAction(Map<String, dynamic>? actionJson) {
      if (actionJson == null) return;

      final actionsList = actionJson['onAction'];
      final stateData = (crudCtx?.item != null && crudCtx!.item!.isNotEmpty)
          ? crudCtx.item
          : crudCtx?.stateData?.rawState != null &&
                  crudCtx!.stateData!.rawState.isNotEmpty
              ? crudCtx.stateData!.rawState.first
              : null;

      final currentKey = getScreenKeyFromArgs(context) ?? '';
      final navigationData =
          FlowCrudStateRegistry().getNavigationParams(currentKey);

      for (var actionMap in actionsList) {
        var action = ActionConfig.fromJson(actionMap);
        final navData = action.properties['data'] as List<dynamic>?;

        if (navData != null && (stateData != null || navigationData != null)) {
          final resolvedData = navData.map((entry) {
            final key = entry['key'] as String;
            final rawValue = entry['value'];
            final Map<String, dynamic> mergedData = {};

            if (navigationData is Map<String, dynamic>) {
              mergedData["navigation"] = navigationData;
            }

            final resolvedValue = resolveValue(rawValue, mergedData);

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

    return PanelCard(
      title: label,
      type: PanelType.success,
      description: description,
      actions: [
        if (primaryAction != null)
          DigitButton(
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
            label: primaryAction['label'] ?? '',
            onPressed: () => handleAction(json['primaryAction']),
          ),
        if (secondaryAction != null)
          DigitButton(
            type: DigitButtonType.secondary,
            size: DigitButtonSize.large,
            label: secondaryAction['label'] ?? '',
            onPressed: () => handleAction(json['secondaryAction']),
          ),
      ],
    );
  }
}

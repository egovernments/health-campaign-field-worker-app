import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class RadioWidget implements FlowWidget {
  @override
  String get format => 'radioList';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final stateData = crudCtx?.stateData;

    // Get screen key for state storage
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);

    // Get widgetData from registry to check for stored values
    final currentState =
        screenKey != null ? FlowCrudStateRegistry().get(screenKey) : null;
    final widgetData = currentState?.widgetData ?? {};

    // For resolving item-specific fields, we use the current item or first item
    final itemStateData = (crudCtx?.item != null && crudCtx!.item!.isNotEmpty)
        ? crudCtx.item
        : crudCtx?.stateData?.rawState != null &&
                crudCtx!.stateData!.rawState.isNotEmpty
            ? crudCtx.stateData?.rawState.first
            : null;

    final data = json['data'] as List<dynamic>? ?? [];
    final key = (json['key'] ?? json['fieldName']) as String?;
    final localization = LocalizationContext.maybeOf(context);

    // Check visibility condition
    final visible = json['visible'] == null ||
        (json['visible'] is bool && json['visible'] == true) ||
        (json['visible'] is String &&
            resolveValue(json['visible'], itemStateData) == true);

    if (!visible) {
      return const SizedBox.shrink();
    }

    // Get current selected value from state
    // Priority: widgetData (persisted selection) > itemStateData (entity data)
    dynamic currentValue;
    if (key != null) {
      // First check widgetData for persisted selection
      if (widgetData.containsKey(key)) {
        currentValue = widgetData[key];
      } else {
        // Fall back to itemStateData
        currentValue = resolveValue('{{$key}}', itemStateData);
        // If unresolved template, treat as null
        if (currentValue == '{{$key}}') {
          currentValue = null;
        }
      }
    }

    final options = data.map((item) {
      if (item is Map<String, dynamic>) {
        final name = item['name'] as String? ?? '';
        final localizedName = localization?.translate(name) ?? name;
        return SelectionCardOption(
          code: item['code'] as String? ?? '',
          name: localizedName,
        );
      }
      return SelectionCardOption(code: '', name: '');
    }).toList();

    // Build RadioDigitButtons from options
    final radioButtons = options.map((option) {
      return RadioButtonModel(
        code: option.code,
        name: localization?.translate(option.name) ?? option.name,
      );
    }).toList();

    return RadioList(
      radioDigitButtons: radioButtons,
      groupValue: currentValue?.toString() ?? "",
      onChanged: (selectedValue) {
        if (key != null && selectedValue != null) {
          // Find the selected option
          final selectedOption = options.firstWhere(
            (option) => option.code == selectedValue.code,
            orElse: () => SelectionCardOption(code: '', name: ''),
          );

          // Store selected value in widgetData only (for filters)
          if (screenKey != null) {
            final currentState = FlowCrudStateRegistry().get(screenKey);
            final existingWidgetData = currentState?.widgetData ?? {};

            // Update widget data with the selected value
            final updatedWidgetData = {
              ...existingWidgetData,
              key: selectedOption.code,
            };

            // Update the registry with widgetData only
            final updatedState =
                (currentState ?? const FlowCrudState()).copyWith(
              widgetData: updatedWidgetData,
            );
            FlowCrudStateRegistry().update(screenKey, updatedState);
          }

          // Trigger onChange actions if defined
          if (json['onChange'] != null) {
            final actionsList =
                List<Map<String, dynamic>>.from(json['onChange']);

            for (var actionJson in actionsList) {
              var action = ActionConfig.fromJson(actionJson);

              // Add selected value to action context
              final enhancedProperties = {
                ...action.properties,
                key: selectedValue,
                '${key}Code': selectedOption.code,
                '${key}Name': selectedOption.name,
              };

              action = ActionConfig(
                action: action.action,
                actionType: action.actionType,
                properties: enhancedProperties,
                condition: action.condition,
                actions: action.actions,
              );

              onAction(action);
            }
          }
        }
      },
    );
  }
}

class SelectionCardOption {
  final String code;
  final String name;

  SelectionCardOption({
    required this.code,
    required this.name,
  });
}

import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/flow_widget_state.dart';
import '../../utils/utils.dart';
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
    final state = WidgetStateContext.of(context);

    final data = json['data'] as List<dynamic>? ?? [];
    final key = (json['key'] ?? json['fieldName']) as String?;
    final localization = LocalizationContext.maybeOf(context);

    // Check visibility condition
    final visible = json['visible'] == null ||
        (json['visible'] is bool && json['visible'] == true) ||
        (json['visible'] is String &&
            resolveValue(json['visible'], state.evalContext) == true);

    if (!visible) {
      return const SizedBox.shrink();
    }

    // If no screenKey, fall back to non-reactive behavior
    if (state.screenKey == null) {
      return _buildRadioContent(
        json: json,
        context: context,
        onAction: onAction,
        screenKey: state.screenKey,
        evalContext: state.evalContext,
        data: data,
        key: key,
        localization: localization,
        widgetData: state.widgetData,
      );
    }

    // Wrap in ValueListenableBuilder to react to state changes
    return ValueListenableBuilder<FlowCrudState?>(
      valueListenable: FlowCrudStateRegistry().listen(state.screenKey!),
      builder: (context, flowState, _) {
        final widgetData = flowState?.widgetData ?? {};

        // Rebuild evalContext with updated widgetData from registry
        final updatedEvalContext = {
          ...state.evalContext,
          'widgetData': widgetData,
        };

        return _buildRadioContent(
          json: json,
          context: context,
          onAction: onAction,
          screenKey: state.screenKey,
          evalContext: updatedEvalContext,
          data: data,
          key: key,
          localization: localization,
          widgetData: widgetData,
        );
      },
    );
  }

  Widget _buildRadioContent({
    required Map<String, dynamic> json,
    required BuildContext context,
    required void Function(ActionConfig) onAction,
    required String? screenKey,
    required Map<String, dynamic> evalContext,
    required List<dynamic> data,
    required String? key,
    required dynamic localization,
    required Map<String, dynamic> widgetData,
  }) {
    // Get current selected value from state
    // Priority: widgetData (persisted selection) > evalContext (entity data)
    dynamic currentValue;
    if (key != null) {
      // First check widgetData for persisted selection
      if (widgetData.containsKey(key)) {
        currentValue = widgetData[key];
      } else {
        // Fall back to evalContext
        currentValue = resolveValue('{{$key}}', evalContext);
        // If unresolved template, treat as null
        if (currentValue == '{{$key}}') {
          currentValue = null;
        }
      }
    }

    final options = data
        .where((item) =>
    item is Map<String, dynamic> && item['isActive'] != false)
        .map((item) {
      final map = item as Map<String, dynamic>;
      final name = map['name'] as String? ?? '';
      final localizedName = localization?.translate(name) ?? name;

      return SelectionCardOption(
        code: map['code'] as String? ?? '',
        name: localizedName,
      );
    })
        .toList();

    // Build RadioDigitButtons from options
    final radioButtons = options.map((option) {
      return RadioButtonModel(
        code: option.code,
        name: localization?.translate(option.name) ?? option.name,
      );
    }).toList();

    return RadioList(
      key: ValueKey('${screenKey}_${key}_${currentValue ?? ''}'),
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

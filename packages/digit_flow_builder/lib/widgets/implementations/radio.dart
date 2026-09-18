import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/utils.dart';
import '../resolved_flow_widget.dart';

class RadioWidget extends ResolvedFlowWidget {
  @override
  String get format => 'radioList';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final data = json['data'] as List<dynamic>? ?? [];
    final key = (json['key'] ?? json['fieldName']) as String?;

    // Use compositeKey for registry operations
    final compositeKey = resolved.compositeKey;

    // If no compositeKey, fall back to non-reactive behavior
    if (compositeKey == null) {
      return _buildRadioContent(
        json: json,
        context: context,
        onAction: onAction,
        compositeKey: compositeKey,
        evalContext: resolved.evalContext,
        data: data,
        key: key,
        localization: resolved.localization,
        widgetData: resolved.widgetData,
      );
    }

    // Wrap in ValueListenableBuilder to react to state changes
    return ValueListenableBuilder<FlowCrudState?>(
      valueListenable: FlowCrudStateRegistry().listen(compositeKey),
      builder: (context, flowState, _) {
        final widgetData = flowState?.widgetData ?? {};

        final updatedEvalContext = {
          ...resolved.evalContext,
          'widgetData': widgetData,
        };

        return _buildRadioContent(
          json: json,
          context: context,
          onAction: onAction,
          compositeKey: compositeKey,
          evalContext: updatedEvalContext,
          data: data,
          key: key,
          localization: resolved.localization,
          widgetData: widgetData,
        );
      },
    );
  }

  Widget _buildRadioContent({
    required Map<String, dynamic> json,
    required BuildContext context,
    required void Function(ActionConfig) onAction,
    required String? compositeKey,
    required Map<String, dynamic> evalContext,
    required List<dynamic> data,
    required String? key,
    required dynamic localization,
    required Map<String, dynamic> widgetData,
  }) {
    // Get current selected value from state
    dynamic currentValue;
    if (key != null) {
      if (widgetData.containsKey(key)) {
        currentValue = widgetData[key];
      } else {
        currentValue = resolveValue('{{$key}}', evalContext);
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
    }).toList();

    final radioButtons = options.map((option) {
      return RadioButtonModel(
        code: option.code,
        name: localization?.translate(option.name) ?? option.name,
      );
    }).toList();

    return RadioList(
      key: ValueKey('${compositeKey}_${key}_${currentValue ?? ''}'),
      radioDigitButtons: radioButtons,
      groupValue: currentValue?.toString() ?? "",
      onChanged: (selectedValue) {
        if (key != null && selectedValue != null) {
          final selectedOption = options.firstWhere(
            (option) => option.code == selectedValue.code,
            orElse: () => SelectionCardOption(code: '', name: ''),
          );

          if (compositeKey != null) {
            final currentState = FlowCrudStateRegistry().get(compositeKey);
            final existingWidgetData = currentState?.widgetData ?? {};

            final updatedWidgetData = {
              ...existingWidgetData,
              key: selectedOption.code,
            };

            final updatedState =
                (currentState ?? const FlowCrudState()).copyWith(
              widgetData: updatedWidgetData,
            );
            FlowCrudStateRegistry().update(compositeKey, updatedState);
          }

          if (json['onChange'] != null) {
            final actionsList =
                List<Map<String, dynamic>>.from(json['onChange']);

            for (var actionJson in actionsList) {
              var action = ActionConfig.fromJson(actionJson);

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

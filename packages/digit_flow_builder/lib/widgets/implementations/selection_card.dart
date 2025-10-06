import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class SelectionCardWidget implements FlowWidget {
  @override
  String get format => 'selectionCard';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final data = json['data'] as List<dynamic>? ?? [];
    final fieldName = json['fieldName'] as String?;

    final options = data.map((item) {
      if (item is Map<String, dynamic>) {
        return SelectionCardOption(
          code: item['code'] as String? ?? '',
          name: item['name'] as String? ?? '',
        );
      }
      return SelectionCardOption(code: '', name: '');
    }).toList();

    // Get screen key from context
    final crudContext = CrudItemContext.of(context);
    final screenKey = crudContext?.screenKey;

    return SelectionCard(
      options: options,
      onSelectionChanged: (selectedOptions) {
        // Update widgetData in flow state if fieldName is provided
        if (fieldName != null && screenKey != null) {
          final currentFlowState = FlowCrudStateRegistry().get(screenKey);
          final currentWidgetData = Map<String, dynamic>.from(currentFlowState?.widgetData ?? {});

          // Store selected options as list of codes
          final selectedCodes = selectedOptions.map((opt) => opt.code).toList();
          currentWidgetData[fieldName] = selectedCodes;

          // Update the flow state with new widgetData
          if (currentFlowState != null) {
            final updatedState = currentFlowState.copyWith(
              widgetData: currentWidgetData,
            );
            FlowCrudStateRegistry().update(screenKey, updatedState);
          } else {
            // Create new state if doesn't exist
            final newState = FlowCrudState(
              widgetData: currentWidgetData,
            );
            FlowCrudStateRegistry().update(screenKey, newState);
          }
        }

        // Trigger configured actions if any
        if (json['onAction'] != null) {
          final actionsList = json['onAction'] is List
              ? List<Map<String, dynamic>>.from(json['onAction'])
              : [Map<String, dynamic>.from(json['onAction'])];

          for (var raw in actionsList) {
            final action = ActionConfig.fromJson(raw);
            onAction(action);
          }
        }
      },
      valueMapper: (option) => option.name,
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

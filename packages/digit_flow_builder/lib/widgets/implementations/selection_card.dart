import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

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
    final localization = LocalizationContext.maybeOf(context);

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

    // Use Builder to access the correct context where CrudItemContext is available
    return Builder(
      builder: (builderContext) {
        // Get screen key from the builder context (after CrudItemContext wrapper)
        final crudContext = CrudItemContext.of(builderContext);
        final screenKey = crudContext?.screenKey;

        return SelectionCard(
          showParentContainer: true,
          // equalWidthOptions: true,
          options: options,
          width: MediaQuery.of(builderContext).size.width * 0.6,
          onSelectionChanged: (selectedOptions) {
            // Update widgetData in flow state if fieldName is provided
            if (fieldName != null && screenKey != null) {
              final currentFlowState = FlowCrudStateRegistry().get(screenKey);
              final currentWidgetData =
                  Map<String, dynamic>.from(currentFlowState?.widgetData ?? {});

              // Store selected options as list of codes
              final selectedCodes =
                  selectedOptions.map((opt) => opt.code).toList();
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
          },
          valueMapper: (option) => option.name,
        );
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

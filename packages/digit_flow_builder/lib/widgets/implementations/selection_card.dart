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
    final data = json['enums'] as List<dynamic>? ?? [];
    final fieldName = json['fieldName'] as String?;
    final localization = LocalizationContext.maybeOf(context);

    final options = data
        .where((item) =>
    item is Map<String, dynamic> &&
        (item['isActive'] == true))
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

    // Use Builder to access the correct context where CrudItemContext is available
    return Builder(
      builder: (builderContext) {
        // Get screen key from the builder context (after CrudItemContext wrapper)
        final crudContext = CrudItemContext.of(builderContext);
        final screenKey = crudContext?.screenKey;

        // Get widgetData from registry to check for stored values
        final currentState =
            screenKey != null ? FlowCrudStateRegistry().get(screenKey) : null;
        final widgetData = currentState?.widgetData ?? {};

        // Get initial selection from widgetData if available
        List<SelectionCardOption> initialSelection = [];
        if (fieldName != null && widgetData.containsKey(fieldName)) {
          final storedCodes = widgetData[fieldName];
          if (storedCodes is List) {
            initialSelection = options
                .where((opt) => storedCodes.contains(opt.code))
                .toList();
          } else if (storedCodes is String) {
            // Handle single value case
            initialSelection = options
                .where((opt) => opt.code == storedCodes)
                .toList();
          }
        }

        return SelectionCard(
          showParentContainer: true,
          // equalWidthOptions: true,
          options: options,
          initialSelection: initialSelection,
          allowMultipleSelection: false,
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

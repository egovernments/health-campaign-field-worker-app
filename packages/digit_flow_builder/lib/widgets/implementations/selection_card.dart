import 'package:digit_ui_components/widgets/atoms/selection_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../localization_context.dart';
import '../resolved_flow_widget.dart';

class SelectionCardWidget extends ResolvedFlowWidget {
  @override
  String get format => 'selectionCard';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final data = json['enums'] as List<dynamic>? ?? [];
    final fieldName = json['fieldName'] as String?;
    final localization = LocalizationContext.maybeOf(context);

    final options = data
        .where((item) =>
    item is Map<String, dynamic> &&
        ((item['isActive'] == true) || (item['isActive'] == null)))
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

    final compositeKey = resolved.compositeKey;

    if (compositeKey == null) {
      // Fallback without state listening
      return SelectionCard(
        showParentContainer: true,
        options: options,
        initialSelection: const [],
        allowMultipleSelection: false,
        width: MediaQuery.of(context).size.width * 0.6,
        onSelectionChanged: (_) {},
        valueMapper: (option) => option.name,
      );
    }

    // Use ValueListenableBuilder to listen to FlowCrudStateRegistry updates
    // This ensures the widget rebuilds when widgetData changes (e.g., on CLEAR_STATE)
    return ValueListenableBuilder<FlowCrudState?>(
      valueListenable: FlowCrudStateRegistry().listen(compositeKey),
      builder: (context, flowState, _) {
        final widgetData = flowState?.widgetData ?? {};

        // Get selection from widgetData
        List<SelectionCardOption> initialSelection = [];
        if (fieldName != null && widgetData.containsKey(fieldName)) {
          final storedCodes = widgetData[fieldName];
          if (storedCodes is List) {
            initialSelection = options
                .where((opt) => storedCodes.contains(opt.code))
                .toList();
          } else if (storedCodes is String) {
            initialSelection = options
                .where((opt) => opt.code == storedCodes)
                .toList();
          }
        }

        return SelectionCard(
          key: ValueKey('${resolved.screenKey}_${fieldName}_${initialSelection.map((e) => e.code).join(',')}'),
          showParentContainer: true,
          options: options,
          initialSelection: initialSelection,
          allowMultipleSelection: false,
          width: MediaQuery.of(context).size.width * 0.6,
          onSelectionChanged: (selectedOptions) {
            // Update widgetData in flow state
            if (fieldName != null) {
              final currentFlowState = FlowCrudStateRegistry().get(compositeKey);
              final currentWidgetData =
                  Map<String, dynamic>.from(currentFlowState?.widgetData ?? {});

              final selectedCodes =
                  selectedOptions.map((opt) => opt.code).toList();
              currentWidgetData[fieldName] = selectedCodes;

              if (currentFlowState != null) {
                final updatedState = currentFlowState.copyWith(
                  widgetData: currentWidgetData,
                );
                FlowCrudStateRegistry().update(compositeKey, updatedState);
              } else {
                final newState = FlowCrudState(
                  widgetData: currentWidgetData,
                );
                FlowCrudStateRegistry().update(compositeKey, newState);
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

import 'package:digit_flow_builder/utils/flow_widget_state.dart';
import 'package:digit_flow_builder/widgets/resolved_flow_widget.dart';
import 'package:flutter/material.dart';
import 'package:digit_ui_components/digit_components.dart';

import '../../action_handler/action_config.dart';

class LabeledToggleWidget extends ResolvedFlowWidget {
  @override
  String get format => 'labeledToggle';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final fieldKey = json['fieldKey'] as String? ?? 'labeledToggleValue';
    final value = json['value'] as bool? ?? true;
    final activeLabel = json['activeLabel'] as String;
    final inactiveLabel = json['inactiveLabel'] as String;

    return WidgetStateContext.reactive(context, (ctx, state) {
      // Initialize widgetData with today's date on first render
      if (state.widgetData[fieldKey] == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          state.updateWidgetData(fieldKey, value);
        });
      }
      return DigitLabeledToggle(
        value: state.widgetData[fieldKey] ?? true,
        onChanged: (val) async {
          state.updateWidgetData(fieldKey, val);
          // Process onAction array from config (if present)
          if (json['onAction'] != null && json['onAction'] is List) {
            final actionsList =
                List<Map<String, dynamic>>.from(json['onAction']);
            if (actionsList.isNotEmpty) {
              await resolved.executeActions(actionsList, context);
            }
          }
        },
        activeLabel: activeLabel,
        inactiveLabel: inactiveLabel,
      );
    });
  }
}

class DigitLabeledToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String activeLabel;
  final String inactiveLabel;

  const DigitLabeledToggle({
    super.key,
    required this.value,
    required this.onChanged,
    required this.activeLabel,
    required this.inactiveLabel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 40,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        border: Border.all(color: theme.colorScheme.onSurface, width: 1),
        borderRadius: BorderRadius.circular(spacer3),
      ),
      child: Row(
        children: [
          _buildOption(
            context,
            label: activeLabel,
            isSelected: value,
            onTap: () => onChanged(true),
          ),
          _buildOption(
            context,
            label: inactiveLabel,
            isSelected: !value,
            onTap: () => onChanged(false),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected
                ? const DigitColors().light.primary1
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : const DigitColors().light.primary2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

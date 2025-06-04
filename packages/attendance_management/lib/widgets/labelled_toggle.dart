import 'package:flutter/material.dart';
import 'package:digit_ui_components/digit_components.dart';

const kPadding = 8.0;

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
        color: theme.colorScheme.surface,
        border: Border.all(
          color: const DigitColors().light.textPrimary,
           
        ),
        borderRadius: BorderRadius.circular(24),
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
            borderRadius: BorderRadius.circular(24),
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

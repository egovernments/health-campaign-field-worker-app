
import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../enum/app_enums.dart';

/// `DigitCheckboxIcon` is a widget that represents the visual appearance of a checkbox.
///
/// It supports three states: unchecked, intermediate, and checked. The appearance can be customized
/// based on the state, disabled status, and color.
class DigitCheckboxIcon extends StatelessWidget {
  /// Represents the current state of the checkbox.
  final CheckboxState state;

  /// Indicates whether the checkbox is disabled or not.
  final bool isDisabled;

  /// Custom color for the checkbox. If not provided, default colors will be used based on the state and disabled status.
  final Color? color;

  /// Creates a `DigitCheckboxIcon` widget with the given parameters.
  const DigitCheckboxIcon({super.key,
    required this.state,
    this.isDisabled = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return _buildCheckbox();
  }

  /// Builds the checkbox widget based on its state.
  Widget _buildCheckbox() {
    switch (state) {
      case CheckboxState.unchecked:
        return Container(
          width: CheckboxConstants.containerSize,
          height: CheckboxConstants.containerSize,
          decoration: BoxDecoration(
            border: Border.all(
              color: CheckboxConstants.uncheckedBorderColor(isDisabled: isDisabled, customColor: color),
              width: CheckboxConstants.borderWidth,
            ),
            borderRadius: BorderRadius.zero,
          ),
        );
      case CheckboxState.intermediate:
        return Container(
          width: CheckboxConstants.containerSize,
          height: CheckboxConstants.containerSize,
          decoration: BoxDecoration(
            border: Border.all(
              color: CheckboxConstants.intermediateBorderColor(isDisabled: isDisabled, customColor: color),
              width: CheckboxConstants.borderWidth,
            ),
            borderRadius: BorderRadius.zero,
          ),
          child: Center(
            child: Icon(
              Icons.square,
              size: CheckboxConstants.iconSize,
              color: CheckboxConstants.iconColor(isDisabled: isDisabled, customColor: color),
            ),
          ),
        );
      case CheckboxState.checked:
        return Container(
          width: CheckboxConstants.containerSize,
          height: CheckboxConstants.containerSize,
          decoration: BoxDecoration(
            border: Border.all(
              color: CheckboxConstants.checkedBorderColor(isDisabled: isDisabled, customColor: color),
              width: CheckboxConstants.borderWidth,
            ),
            borderRadius: BorderRadius.zero,
          ),
          child: Center(
            child: Icon(
              Icons.check,
              size: CheckboxConstants.iconSize,
              color: CheckboxConstants.iconColor(isDisabled: isDisabled, customColor: color),
            ),
          ),
        );
    }
  }
}


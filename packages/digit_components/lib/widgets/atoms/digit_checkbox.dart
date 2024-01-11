
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../constants/app_constants.dart';
import '../../enum/app_enums.dart';

/// `DigitCheckbox` is a checkbox component with a label and optional icon customization.
///
/// This widget allows the user to toggle between checked and unchecked states. It supports
/// customization of the checkbox icon color, label, and disabled state.
///
/// Example usage:
/// ```dart
/// DigitCheckbox(
///   label: 'CheckBox label',
///   onChanged: (value) {
///     // Handle checkbox state change
///     print('Feature X is now ${value ? 'enabled' : 'disabled'}');
///   },
///   disabled: false, // Set to true to disable the checkbox
///   value: true, // Set the initial state of the checkbox
///   padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0), // Customize padding
///   iconColor: Colors.blue, // Customize checkbox icon color
/// )
///
class DigitCheckbox extends StatefulWidget {
  /// The current value of the checkbox.
  final bool value;

  /// The label associated with the checkbox.
  final String label;

  /// Callback function triggered when the checkbox value changes.
  final ValueChanged<bool?>? onChanged;

  /// Padding around the checkbox widget.
  final EdgeInsetsGeometry padding;

  /// Indicates whether the checkbox is disabled or not.
  final bool disabled;

  /// Custom color for the checkbox icon.
  final Color? iconColor;

  /// Creates a `DigitCheckbox` widget with the given parameters.
  const DigitCheckbox({
    Key? key,
    required this.label,
    this.onChanged,
    this.disabled = false,
    this.value = false,
    this.padding = CheckboxConstants.defaultPadding,
    this.iconColor,
  }) : super(key: key);

  @override
  _DigitCheckboxState createState() => _DigitCheckboxState();
}

class _DigitCheckboxState extends State<DigitCheckbox> {
  late bool _currentState;

  @override
  void initState() {
    super.initState();
    _currentState = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
        padding: widget.padding,
        child: InkWell(
          hoverColor: const DigitColors().transaparent,
          splashColor: const DigitColors().transaparent,
          focusColor: const DigitColors().transaparent,
          onTap: widget.disabled
              ? null
              : () {
            setState(() {
              _currentState = !_currentState;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(_currentState);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: CheckboxConstants.containerSize,
                width: CheckboxConstants.containerSize,
                child: DigitCheckboxIcon(
                  state: _currentState ? CheckboxState.checked : CheckboxState.unchecked,
                  isDisabled: widget.disabled,
                  color: widget.iconColor,
                ),
              ),
              const Gap(kPadding * 2),
              Text(
                widget.label,
                style: DigitTheme.instance.mobileTheme.textTheme.bodyLarge?.copyWith(
                  color: widget.disabled ? const DigitColors().cloudGray : const DigitColors().woodsmokeBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

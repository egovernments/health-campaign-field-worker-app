import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox_icon.dart';
import 'package:flutter/material.dart';

/*A single checkbox component */
class DigitCheckbox extends StatefulWidget {
  final bool value;
  final String label;
  final ValueChanged<bool?>? onChanged;
  final EdgeInsetsGeometry padding;
  final bool disabled;
  final Color? iconColor;

  // Constructor for the DigitCheckbox widget with required parameters
  const DigitCheckbox({
    Key? key,
    required this.label,
    this.onChanged,
    this.disabled = false,
    this.value = false,
    this.padding = const EdgeInsets.only(left: 4.0),
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
    final theme = Theme.of(context);


    return IntrinsicWidth(
      child: Padding(
        padding: widget.padding,
        child: InkWell(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: widget.disabled ? null : () {
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
                height: 24,
                width: 24,
                child: DigitCheckboxIcon(
                  state: _currentState ? CheckboxState.checked : CheckboxState.unchecked,
                  isDisabled: widget.disabled,
                  color: widget.iconColor,
                )
              ),
              const SizedBox(width: 16),
              Text(
                widget.label,
                style: TextStyle(
                  color: widget.disabled ? const DigitColors().cloudGray : const DigitColors().woodsmokeBlack,
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

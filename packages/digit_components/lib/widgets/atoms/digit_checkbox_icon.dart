import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class DigitCheckboxIcon extends StatelessWidget {
  final CheckboxState state;
  final bool isDisabled;
  final Color? color;

  DigitCheckboxIcon({required this.state, this.isDisabled = false, this.color});

  @override
  Widget build(BuildContext context) {
    return _buildCheckbox();
  }

  Widget _buildCheckbox() {
    switch (state) {
      case CheckboxState.unchecked:
        return Container(
          width: 24.0,
          height: 24.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: color ?? (isDisabled ? const DigitColors().cloudGray : const DigitColors().davyGray),
              width: 2.0,
            ),
            borderRadius: BorderRadius.zero,
          ),
        );
      case CheckboxState.intermediate:
        return Container(
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: color ?? (isDisabled ? const DigitColors().cloudGray : const DigitColors().burningOrange),
                width: 2.0,
              ),
              borderRadius: BorderRadius.zero,
            ),
            child: Center(
              child: Icon(
                Icons.square,
                size: 16.0,
                color: color ?? (isDisabled ? const DigitColors().cloudGray : const DigitColors().burningOrange),
              ),
            ));
      case CheckboxState.checked:
        return Container(
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: color ?? (isDisabled ? const DigitColors().cloudGray : const DigitColors().burningOrange),
                width: 2.0,
              ),
              borderRadius: BorderRadius.zero,
            ),
            child: Center(
              child: Icon(
                Icons.check,
                size: 16.0,
                color: color ?? (isDisabled ? const DigitColors().cloudGray : const DigitColors().burningOrange),
              ),
            ));
    }
  }
}

enum CheckboxState {
  unchecked,
  intermediate,
  checked,
}

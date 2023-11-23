import 'package:flutter/material.dart';

import 'digit_base_form_input.dart';

class DigitTextFormInput extends BaseDigitFormInput {
  DigitTextFormInput({
    Key? key,
    required TextEditingController controller,
    String? label,
    String? initialValue,
    String? info,
    bool charCount = false,
    String? innerLabel,
    String? helpText,
    TooltipTriggerMode triggerMode = TooltipTriggerMode.tap,
    bool preferToolTipBelow = false,
    IconData? suffixIcon,
    IconData? prefixIcon,
    String? Function(String?)? validator,
    void Function(String?)? onError,
  }) : super(
    key: key,
    controller: controller,
    label: label,
    info: info,
    charCount: charCount,
    innerLabel: innerLabel,
    helpText: helpText,
    triggerMode: triggerMode,
    preferToolTipBelow: preferToolTipBelow,
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    validator: validator,
    onError: onError,
    initialValue: initialValue,
  );

  @override
  _DigitTextFormInputState createState() => _DigitTextFormInputState();
}

class _DigitTextFormInputState extends BaseDigitFormInputState {
  @override
  Widget build(BuildContext context) {
    // You can customize the appearance or behavior specific to the TextFormInput here
    return super.build(context);
  }
}

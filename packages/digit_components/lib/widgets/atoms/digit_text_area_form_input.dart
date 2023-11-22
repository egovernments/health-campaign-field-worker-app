import 'package:flutter/material.dart';

import 'digit_base_form_input.dart';

class DigitTextAreaFormInput extends BaseDigitFormInput {
  DigitTextAreaFormInput({
    Key? key,
    required TextEditingController controller,
    String? label,
    String? info,
    bool charCount = false,
    String? innerLabel,
    String? helpText,
    TooltipTriggerMode triggerMode = TooltipTriggerMode.tap,
    bool preferToolTipBelow = false,
    String? Function(String?)? validator,
    void Function(String?)? onError,
    int maxLine = 3,
    int minLine = 3,
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
    validator: validator,
    onError: onError,
    maxLine: maxLine,
    minLine: minLine,
  );

  @override
  _DigitTextAreaFormInputState createState() => _DigitTextAreaFormInputState();
}

class _DigitTextAreaFormInputState extends BaseDigitFormInputState {
  @override
  Widget build(BuildContext context) {
    // You can customize the appearance or behavior specific to the TextFormInput here
    return super.build(context);
  }
}

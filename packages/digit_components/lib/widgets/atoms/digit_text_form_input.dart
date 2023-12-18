import 'package:flutter/material.dart';

import '../../utils/validators/validator.dart';
import 'digit_base_form_input.dart';

class DigitTextFormInput extends BaseDigitFormInput {
  DigitTextFormInput({
    Key? key,
    required TextEditingController controller,
    String? label,
    String? initialValue,
    String? infoText,
    bool? info,
    bool readOnly = false,
    bool isDisabled = false,
    bool charCount = false,
    String? innerLabel,
    String? helpText,
    TooltipTriggerMode triggerMode = TooltipTriggerMode.tap,
    bool preferToolTipBelow = false,
    IconData? suffixIcon,
    IconData? prefixIcon,
    void Function(String?)? onError,
    final List<Validator>? validations,
    final void Function(String)? onChange,
  }) : super(
    key: key,
    controller: controller,
    label: label,
    info: info,
    infoText: infoText,
    readOnly: readOnly,
    isDisabled: isDisabled,
    charCount: charCount,
    innerLabel: innerLabel,
    helpText: helpText,
    triggerMode: triggerMode,
    preferToolTipBelow: preferToolTipBelow,
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    onError: onError,
    initialValue: initialValue,
    validations: validations,
    onChange: onChange,
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

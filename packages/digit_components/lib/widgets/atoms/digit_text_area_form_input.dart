import 'package:flutter/material.dart';

import '../../utils/validators/validator.dart';
import 'digit_base_form_input.dart';

/// `DigitTextAreaFormInput` is a customizable formfield widget that extends the baseforminput.
///
/// This widget
///
/// Example usage:
/// ```dart
/// DigitTextAreaFormInput(
/// controller: _textController,
/// label: 'Description',
/// innerLabel: 'Enter your details',
/// charCount: true,
/// helpText: 'This is a simple example of DigitTextAreaFormInput',
/// onChange: (value) {
/// print(value);
/// },
/// ),

class DigitTextAreaFormInput extends BaseDigitFormInput {
  const DigitTextAreaFormInput({
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
    void Function(String?)? onError,
    final List<Validator>? validations,
    int maxLine = 4,
    int minLine = 4,
    double height = 100,
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
    onError: onError,
    maxLine: maxLine,
    minLine: minLine,
    initialValue: initialValue,
    height: height,
    validations: validations,
    onChange: onChange,
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

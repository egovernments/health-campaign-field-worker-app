import 'package:flutter/material.dart';

import '../../utils/validators/validator.dart';
import 'digit_base_form_input.dart';

/// `DigitNumericFormInput` is a customizable formfield widget that extends the baseforminput.
///
/// Example usage:
/// ```dart
/// DigitNumericFormInput(
/// controller: _textController,
/// label: 'Username',
/// innerLabel: 'Enter a numeric value',
/// charCount: true,
/// helpText: 'This is a simple example of DigitNumericFormInput',
/// validations: [
/// // Example validation: Required field
/// Validator(ValidatorType.required),
/// ],
/// onChange: (value) {
/// print(value);
/// },
/// ),

class DigitNumericFormInput extends BaseDigitFormInput {



  const DigitNumericFormInput({
    Key? key,
    required TextEditingController controller,
    String? label,
    String? infoText,
    bool? info,
    String? initialValue,
    bool readOnly = false,
    bool isDisabled = false,
    bool charCount = false,
    String? innerLabel,
    String? helpText,
    TooltipTriggerMode triggerMode = TooltipTriggerMode.tap,
    bool preferToolTipBelow = false,
    IconData suffixIcon = Icons.add,
    IconData prefixIcon = Icons.remove,
    void Function(String?)? onError,
    TextInputType keyboardType = TextInputType.number,
    TextAlign textAlign = TextAlign.center,
    final List<Validator>? validations,
    final void Function(String)? onChange,
    final int step = 5,
    final int minValue = 0,
    final int maxValue = 100,
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
    keyboardType: keyboardType,
    textAlign: textAlign,
    initialValue: initialValue,
    validations: validations,
    onChange: onChange,
    step: step,
    maxValue: maxValue,
    minValue: minValue,
    showCurser: false,
  );

  @override
  _DigitNumericFormInputState createState() => _DigitNumericFormInputState();
}

class _DigitNumericFormInputState extends BaseDigitFormInputState {

  @override
  void onPrefixIconClick({void Function()? customFunction}) {
    setState(() {
      // Subtract step from the input value when the prefix icon is clicked
      int currentValue = int.tryParse(widget.controller.text) ?? 0;
      if((currentValue - widget.step)>=widget.minValue){
        widget.controller.text = (currentValue - widget.step).toString();
      }
    });

  }

  @override
  void onSuffixIconClick({void Function()? customFunction}) {
    setState(() {
      // Add step to the input value when the suffix icon is clicked
      int currentValue = int.tryParse(widget.controller.text) ?? 0;
      if((currentValue + widget.step)<=widget.maxValue){
        widget.controller.text = (currentValue + widget.step).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // You can customize the appearance or behavior specific to the TextFormInput here
    return super.build(context);
  }
}

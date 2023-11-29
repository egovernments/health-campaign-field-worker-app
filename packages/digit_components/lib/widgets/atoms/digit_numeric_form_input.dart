import 'package:flutter/material.dart';

import '../../utils/validators/validator.dart';
import 'digit_base_form_input.dart';

class DigitNumericFormInput extends BaseDigitFormInput {
  DigitNumericFormInput({
    Key? key,
    required TextEditingController controller,
    String? label,
    String? info,
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
  }) : super(
    key: key,
    controller: controller,
    label: label,
    info: info,
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
  );

  @override
  _DigitNumericFormInputState createState() => _DigitNumericFormInputState();
}

class _DigitNumericFormInputState extends BaseDigitFormInputState {

  @override
  void onPrefixIconClick({void Function()? customFunction}) {
    setState(() {
      // Subtract 1 from the input value when the prefix icon is clicked
      int currentValue = int.tryParse(widget.controller.text) ?? 0;
      widget.controller.text = (currentValue - 1).toString();
    });

  }

  @override
  void onSuffixIconClick({void Function()? customFunction}) {
    setState(() {
      // Add 1 to the input value when the suffix icon is clicked
      int currentValue = int.tryParse(widget.controller.text) ?? 0;
      widget.controller.text = (currentValue + 1).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // You can customize the appearance or behavior specific to the TextFormInput here
    return super.build(context);
  }
}

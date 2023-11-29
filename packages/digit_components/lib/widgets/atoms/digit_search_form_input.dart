import 'package:flutter/material.dart';

import '../../utils/validators/validator.dart';
import 'digit_base_form_input.dart';

class DigitSearchFormInput extends BaseDigitFormInput {
  DigitSearchFormInput({
    Key? key,
    required TextEditingController controller,
    String? label,
    String? info,
    bool charCount = false,
    String? innerLabel,
    String? helpText,
    bool readOnly = false,
    bool isDisabled = false,
    TooltipTriggerMode triggerMode = TooltipTriggerMode.tap,
    bool preferToolTipBelow = false,
    IconData suffix = Icons.search,
    void Function(String?)? onError,
    void Function()? onSuffixTap,
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
    suffix: suffix,
    onError: onError,
    onSuffixTap: onSuffixTap,
    validations: validations,
  );

  @override
  _DigitSearchFormInputState createState() => _DigitSearchFormInputState();
}

class _DigitSearchFormInputState extends BaseDigitFormInputState {


  @override
  void onSuffixIconClick({void Function()? customFunction}) {
    // Use the onTap function directly
    widget.onSuffixTap?.call();
  }
  Widget build(BuildContext context) {
    // You can customize the appearance or behavior specific to the TextFormInput here
    return super.build(context);
  }
}

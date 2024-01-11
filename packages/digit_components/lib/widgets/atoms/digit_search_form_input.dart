import 'package:flutter/material.dart';
import '../../utils/validators/validator.dart';
import 'digit_base_form_input.dart';

/// `DigitSearchFormInput` is a customizable form-field widget that extends the baseforminput.
///
/// Example usage:
/// ```dart
/// DigitSearchFormInput(
/// controller: _textController,
/// label: 'Search',
/// innerLabel: 'Enter your username',
/// charCount: true,
/// helpText: 'This is a simple example of DigitSearchFormInput',
/// onChange: (value) {
/// print(value);
/// },
/// onSuffixTap(){
///
/// }
/// ),

class DigitSearchFormInput extends BaseDigitFormInput {
  const DigitSearchFormInput({
    Key? key,
    required TextEditingController controller,
    String? label,
    String? infoText,
    bool? info,
    bool charCount = false,
    String? innerLabel,
    String? helpText,
    bool readOnly = false,
    bool isDisabled = false,
    TooltipTriggerMode triggerMode = TooltipTriggerMode.tap,
    bool preferToolTipBelow = false,
    IconData suffix = Icons.search,
    void Function(String?)? onError,
    void Function(String)? onSuffixTap,
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
    suffix: suffix,
    onError: onError,
    onSuffixTap: onSuffixTap,
    validations: validations,
    onChange: onChange,
  );

  @override
  _DigitSearchFormInputState createState() => _DigitSearchFormInputState();
}

class _DigitSearchFormInputState extends BaseDigitFormInputState {


  @override
  void onSuffixIconClick({void Function()? customFunction}) {
    /// Use the onTap function directly
    widget.onSuffixTap?.call(widget.controller.text);
  }

  @override
  Widget build(BuildContext context) {
    /// You can customize the appearance or behavior specific to the TextFormInput here
    return super.build(context);
  }
}

import 'package:flutter/material.dart';
import '../../blocs/DateSelection.dart';
import '../../utils/validators/validator.dart';
import 'digit_base_form_input.dart';

/// `DigitDateFormInput` is a customizable formfield widget that  extends the baseforminput.
///
/// Example usage:
/// ```dart
/// DigitDateFormInput(
/// controller: _textController,
/// label: 'Username',
/// innerLabel: 'click on the icon to choose a date',
/// charCount: true,
/// helpText: 'This is a simple example of DigitDateFormInput',
/// onChange: (value) {
/// print(value);
/// },
/// ),

class DigitDateFormInput extends BaseDigitFormInput {
  const DigitDateFormInput({
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
    IconData suffix = Icons.date_range,
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
    onError: onError,
    suffix: suffix,
    initialValue: initialValue,
    validations: validations,
    onChange: onChange,
  );

  @override
  _DigitDateFormInputState createState() => _DigitDateFormInputState();
}

class _DigitDateFormInputState extends BaseDigitFormInputState {

  DateSelectionBloc dateSelectionBloc = DateSelectionBloc();

  @override
  void onSuffixIconClick({void Function()? customFunction}) async {
    /// Show a date picker and update the controller's value


    await dateSelectionBloc.selectDate(
      context: context,
      controller: widget.controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    /// You can customize the appearance or behavior specific to the TextFormInput here
    return super.build(context);
  }
}

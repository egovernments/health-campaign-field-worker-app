import 'package:flutter/material.dart';
import '../../utils/time_utils.dart';
import '../../utils/validators/validator.dart';
import 'digit_base_form_input.dart';

/// `DigitTextFormInput` is a customizable textformfield widget that extends the baseforminput
///
/// This widget extends the baseforminput
///
/// Example usage:
/// ```dart
/// DigitTimeFormInput(
/// controller: _textController,
/// label: 'Time Picker',
/// innerLabel: 'click on the icon to select a time',
/// charCount: true,
/// helpText: 'This is a simple example of DigitTimeFormInput',
/// onChange: (value) {
/// print(value);
/// },
/// ),

class DigitTimeFormInput extends BaseDigitFormInput {
  const DigitTimeFormInput({
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
    IconData suffix = Icons.access_time,
    void Function(String?)? onError,
    final List<Validator>? validations,
    String? initialValue,
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
    initialValue: initialValue,
    validations: validations,
    onChange: onChange,
  );

  @override
  _DigitTimeFormInputState createState() => _DigitTimeFormInputState();
}



class _DigitTimeFormInputState extends BaseDigitFormInputState {

  @override
  void onSuffixIconClick({void Function()? customFunction}) async {
    // Show a time picker and update the controller's value
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (selectedTime != null) {

      setState(() {
        widget.controller.text = formatTime(selectedTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /// You can customize the appearance or behavior specific to the TextFormInput here
    return super.build(context);
  }
}

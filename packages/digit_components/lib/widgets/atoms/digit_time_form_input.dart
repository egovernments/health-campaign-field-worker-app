import 'package:flutter/material.dart';

import '../../utils/validators/validator.dart';
import 'digit_base_form_input.dart';

class DigitTimeFormInput extends BaseDigitFormInput {
  DigitTimeFormInput({
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
    IconData suffix = Icons.access_time,
    void Function(String?)? onError,
    final List<Validator>? validations,
    String? initialValue,
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
    initialValue: initialValue,
    validations: validations,
  );

  @override
  _DigitTimeFormInputState createState() => _DigitTimeFormInputState();
}

String _formatTime(TimeOfDay time) {
  // Format the time as hh:mm am/pm
  int hour = time.hourOfPeriod;
  int minute = time.minute;
  String period = time.period == DayPeriod.am ? 'AM' : 'PM';

  String hourString = (hour % 12).toString().padLeft(2, '0');
  String minuteString = minute.toString().padLeft(2, '0');

  return '$hourString:$minuteString $period';
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
        widget.controller.text = _formatTime(selectedTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // You can customize the appearance or behavior specific to the TextFormInput here
    return super.build(context);
  }
}

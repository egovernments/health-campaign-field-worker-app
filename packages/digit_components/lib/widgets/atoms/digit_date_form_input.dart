import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/validators/validator.dart';
import 'digit_base_form_input.dart';

class DigitDateFormInput extends BaseDigitFormInput {
  DigitDateFormInput({
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
  @override
  void onSuffixIconClick({void Function()? customFunction}) async {
    // Show a date picker and update the controller's value

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (selectedDate != null) {

      String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate.toLocal());

      setState(() {
        widget.controller.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // You can customize the appearance or behavior specific to the TextFormInput here
    return super.build(context);
  }
}

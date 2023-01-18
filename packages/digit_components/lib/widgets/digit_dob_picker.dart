import 'package:digit_components/widgets/atoms/digit_date_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:flutter/material.dart';

class DigitDobPicker extends StatelessWidget {
  final String datePickerFormControl;
  final String ageInputFormControl;

  final bool isVerified;
  final ValueChanged<DateTime?> onChangeDate;

  final String datePickerLabel;
  final String ageFieldLabel;
  final String separatorLabel;

  const DigitDobPicker(
      {super.key,
      required this.datePickerFormControl,
      required this.ageInputFormControl,
      this.isVerified = false,
      required this.onChangeDate,
      required this.datePickerLabel,
      required this.ageFieldLabel,
      required this.separatorLabel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: Colors.grey, style: BorderStyle.solid, width: 1.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
          child: Column(
            children: [
              DigitDateFormPicker(
                label: datePickerLabel,
                isRequired: true,
                formControlName: datePickerFormControl,
                onChangeOfDate: onChangeDate,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                separatorLabel,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              DigitTextFormField(
                formControlName: ageInputFormControl,
                label: ageFieldLabel,
                keyboardType: TextInputType.number,
                readOnly: isVerified,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_components/widgets/atoms/digit_date_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitDobPicker extends StatelessWidget {
  // Properties to hold the form control name, labels, and error messages for the components
  final String datePickerFormControl;
  final bool isVerified;
  final ControlValueAccessor? valueAccessor;
  final String datePickerLabel;
  final String ageFieldLabel;
  final String yearsHintLabel;
  final String monthsHintLabel;
  final String separatorLabel;
  final String yearsErrorMessage;
  final String monthsErrorMessage;

  const DigitDobPicker({
    super.key,
    required this.datePickerFormControl,
    this.isVerified = false,
    this.valueAccessor,
    required this.datePickerLabel,
    required this.ageFieldLabel,
    required this.yearsHintLabel,
    required this.monthsHintLabel,
    required this.separatorLabel,
    required this.yearsErrorMessage,
    required this.monthsErrorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: Colors.grey, style: BorderStyle.solid, width: 1.0),
        ),
        child: Column(
          children: [
            // Date picker component to select the date of birth
            DigitDateFormPicker(
              label: datePickerLabel,
              formControlName: datePickerFormControl,
            ),
            const SizedBox(height: 16),
            // Text widget to display a separator label between the date picker and age fields
            Text(
              separatorLabel,
              style: theme.textTheme.bodyLarge,
            ),
            Row(
              children: [
                Expanded(
                  // Text form field for entering the age in years
                  child: DigitTextFormField(
                    maxLength: 3,
                    valueAccessor:
                        DobValueAccessorYearsString(DobValueAccessor()),
                    formControlName: datePickerFormControl,
                    label: ageFieldLabel,
                    keyboardType: TextInputType.number,
                    hint: yearsHintLabel,
                    suffix: Text(
                      yearsHintLabel,
                      textAlign: TextAlign.center,
                    ),
                    readOnly: isVerified,
                    onChanged: (formControl) {
                      // Function to validate the entered age in years
                      Map<String, dynamic>? requiredTrue(
                          AbstractControl<dynamic> control) {
                        DigitDOBAge age =
                            DigitDateUtils.calculateAge(formControl.value);
                        return age.years <= 150 && age.years >= 0
                            ? null
                            : {yearsErrorMessage: true};
                      }

                      formControl.setValidators([requiredTrue]);
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  // Text form field for entering the age in months
                  child: DigitTextFormField(
                    maxLength: 2,
                    valueAccessor:
                        DobValueAccessorMonthString(DobValueAccessor()),
                    formControlName: datePickerFormControl,
                    label: '',
                    keyboardType: TextInputType.number,
                    suffix: Text(
                      monthsHintLabel,
                      textAlign: TextAlign.center,
                    ),
                    readOnly: isVerified,
                    onChanged: (formControl) {
                      // Function to validate the entered age in months
                      Map<String, dynamic>? requiredTrue(
                          AbstractControl<dynamic> control) {
                        DigitDOBAge age =
                            DigitDateUtils.calculateAge(formControl.value);
                        return age.months <= 11 && age.months >= 0
                            ? null
                            : {monthsErrorMessage: true};
                      }

                      formControl.setValidators([requiredTrue]);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// A custom ControlValueAccessor to convert the model value (DateTime) to the view value (DigitDOBAge) and vice versa.
class DobValueAccessor extends ControlValueAccessor<DateTime, DigitDOBAge> {
  @override
  DigitDOBAge? modelToViewValue(DateTime? modelValue) {
    if (modelValue == null) return null;
    return DigitDateUtils.calculateAge(modelValue);
  }

  @override
  DateTime? viewToModelValue(DigitDOBAge? viewValue) {
    if (viewValue == null) return null;
    final years = viewValue.years;
    final months = viewValue.months;
    final days = years * 365 + months * 30;

    final calculatedDate = DateTime.now().subtract(Duration(days: days));

    return DateTime(
      calculatedDate.year,
      calculatedDate.month,
      calculatedDate.day,
    );
  }
}

// A custom ControlValueAccessor to handle the view value as a string for years.
class DobValueAccessorYearsString
    extends ControlValueAccessor<DateTime, String> {
  final DobValueAccessor accessor;

  DobValueAccessorYearsString(this.accessor);
  String existingMonth = '0';

  @override
  String? modelToViewValue(DateTime? modelValue) {
    final dobAge = accessor.modelToViewValue(modelValue);
    existingMonth = dobAge != null ? dobAge.months.toString() : '0';
    return dobAge != null ? dobAge.years.toString() : existingMonth;
  }

  @override
  DateTime? viewToModelValue(String? viewValue) {
    final years = int.tryParse(viewValue ?? '');

    final dobAge = DigitDOBAge(years ?? 0, int.parse(existingMonth));
    return accessor.viewToModelValue(dobAge);
  }
}

// A custom ControlValueAccessor to handle the view value as a string for months.
class DobValueAccessorMonthString
    extends ControlValueAccessor<DateTime, String> {
  final DobValueAccessor accessor;

  DobValueAccessorMonthString(this.accessor);
  String existingYear = '0';

  @override
  String? modelToViewValue(DateTime? modelValue) {
    final dobAge = accessor.modelToViewValue(modelValue);
    existingYear = dobAge != null ? dobAge.years.toString() : '0';
    return dobAge != null ? dobAge.months.toString() : dobAge?.years.toString();
  }

  @override
  DateTime? viewToModelValue(String? viewValue) {
    final years = int.tryParse(viewValue ?? '');
    final dobAge = DigitDOBAge(int.parse(existingYear), years ?? 0);
    return accessor.viewToModelValue(dobAge);
  }
}

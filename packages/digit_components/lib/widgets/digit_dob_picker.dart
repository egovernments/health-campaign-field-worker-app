import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final String yearsAndMonthsErrMsg;
  final String cancelText;
  final String confirmText;

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
    required this.yearsAndMonthsErrMsg,
    this.confirmText = 'OK',
    this.cancelText = 'Cancel',
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
              cancelText: cancelText,
              confirmText: confirmText,
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
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
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
                        DateTime formValue = formControl.value;
                        return formValue.isAfter(DateTime.now()) ||
                                age.years < 0 ||
                                age.years > 150 ||
                                (age.years >= 150 && age.months > 0)
                            ? {'': true}
                            : null;
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
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
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
                        DateTime formValue = formControl.value;
                        return formValue.isAfter(DateTime.now()) ||
                                age.months < 0 ||
                                age.months > 11 ||
                                (age.years >= 150 && age.months > 0)
                            ? {'': true}
                            : null;
                      }

                      formControl.setValidators([requiredTrue]);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            ReactiveFormConsumer(
              builder: (context, form, child) {
                final datePickerControl = form.control(datePickerFormControl);
                if (datePickerControl.invalid) {
                  return Text(
                    yearsAndMonthsErrMsg,
                    style:
                        TextStyle(color: DigitTheme.instance.colorScheme.error),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
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
    final months = viewValue.months;
    final days = DigitDateUtils.yearsMonthsDaysToDays(
        viewValue.years, viewValue.months, viewValue.days);

    final calculatedDate = DateTime.now().subtract(Duration(days: days + 1));

    return viewValue.years < 0 || months < 0 || months > 11
        ? DateTime(
            viewValue.years < 0 ? DateTime.now().year + 1 : DateTime.now().year,
            DateTime.now().month + 1,
          )
        : DateTime(
            calculatedDate.year,
            calculatedDate.month,
          );
  }
}

// A custom ControlValueAccessor to handle the view value as a string for years.
class DobValueAccessorYearsString
    extends ControlValueAccessor<DateTime, String> {
  final DobValueAccessor accessor;

  DobValueAccessorYearsString(this.accessor);
  String existingMonth = '0';
  String existingDays = '0';

  @override
  String? modelToViewValue(DateTime? modelValue) {
    final dobAge = accessor.modelToViewValue(modelValue);
    existingMonth = dobAge != null ? dobAge.months.toString() : '0';
    existingDays = dobAge != null ? dobAge.days.toString() : '0';
    return dobAge != null && dobAge.years >= 0
        ? dobAge.years.toString()
        : existingMonth;
  }

  @override
  DateTime? viewToModelValue(String? viewValue) {
    final years = int.tryParse(viewValue ?? '');

    final dobAge = DigitDOBAge(
        years: years ?? 0, months: int.parse(existingMonth), days: 1);
    return accessor.viewToModelValue(dobAge);
  }
}

// A custom ControlValueAccessor to handle the view value as a string for months.
class DobValueAccessorMonthString
    extends ControlValueAccessor<DateTime, String> {
  final DobValueAccessor accessor;

  DobValueAccessorMonthString(this.accessor);
  String existingYear = '0';
  String existingDays = '0';

  @override
  String? modelToViewValue(DateTime? modelValue) {
    final dobAge = accessor.modelToViewValue(modelValue);
    existingYear =
        dobAge != null && dobAge.years >= 0 ? dobAge.years.toString() : '0';
    existingDays = dobAge != null ? dobAge.days.toString() : '0';
    int months = dobAge != null ? dobAge.months : 0;
    return dobAge != null ? months.toString() : existingYear;
  }

  @override
  DateTime? viewToModelValue(String? viewValue) {
    final months = int.tryParse(viewValue ?? '0');
    final dobAge = DigitDOBAge(
        years: int.parse(existingYear), months: months ?? 0, days: 1);
    return accessor.viewToModelValue(dobAge);
  }
}

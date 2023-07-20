import 'package:digit_components/widgets/atoms/digit_date_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitDobPicker extends StatelessWidget {
  final String datePickerFormControl;

  final bool isVerified;
  final ControlValueAccessor? valueAccessor;
  final String datePickerLabel;
  final String ageFieldLabel;
  final String yearsHintLabel;
  final String monthsHintLabel;
  final String separatorLabel;
  final String errorMessage;

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
    required this.errorMessage,
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
            DigitDateFormPicker(
              label: datePickerLabel,
              formControlName: datePickerFormControl,
            ),
            const SizedBox(height: 16),
            Text(
              separatorLabel,
              style: theme.textTheme.bodyLarge,
            ),
            Row(
              children: [
                Expanded(
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
                      /// Validates that control's value must be `true`
                      Map<String, dynamic>? requiredTrue(
                          AbstractControl<dynamic> control) {
                        String value = (DateTime.now()
                                    .difference(formControl.value)
                                    .inDays /
                                365)
                            .round()
                            .toStringAsFixed(0);
                        return int.parse(value) <= 150
                            ? null
                            : {errorMessage: true};
                      }

                      formControl.setValidators([requiredTrue]);
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
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
                      Map<String, dynamic>? requiredTrue(
                          AbstractControl<dynamic> control) {
                        int days =
                            DateTime.now().difference(formControl.value).inDays;
                        int years = days ~/ 365;
                        int months = (days - (years * 365)) ~/ 30;
                        return months <= 11 ? null : {errorMessage: true};
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

class DobValueAccessor extends ControlValueAccessor<DateTime, DigitDOBAge> {
  @override
  DigitDOBAge? modelToViewValue(DateTime? modelValue) {
    if (modelValue == null) return null;
    int days = DateTime.now().difference(modelValue).inDays;
    int years = days ~/ 365;
    int months = (days - (years * 365)) ~/ 30;
    return DigitDOBAge(years: years, months: months);
  }

  @override
  DateTime? viewToModelValue(DigitDOBAge? viewValue) {
    if (viewValue == null) return null;
    final years = viewValue.years;
    final months = viewValue.months;
    final days = years * 365 + months * 30;
    if (years == 0) return null;

    final calculatedDate = DateTime.now().subtract(Duration(days: days));

    return DateTime(
      calculatedDate.year,
      calculatedDate.month,
      calculatedDate.day,
    );
  }
}

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
    if (years == 0) return null;

    final dobAge =
        DigitDOBAge(years: years ?? 0, months: int.parse(existingMonth));
    return accessor.viewToModelValue(dobAge);
  }
}

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
    if (years == 0) return null;
    final dobAge =
        DigitDOBAge(months: years ?? 0, years: int.parse(existingYear));
    return accessor.viewToModelValue(dobAge);
  }
}

class DigitDOBAge {
  final int years;
  final int months;

  const DigitDOBAge({
    this.years = 0,
    this.months = 0,
  });
}

class DobValueMonthsAccessor extends ControlValueAccessor<DateTime, String> {
  @override
  String? modelToViewValue(DateTime? modelValue) {
    if (modelValue == null) return null;
    int days = DateTime.now().difference(modelValue).inDays;
    int years = days ~/ 365;
    int months = (days - (years * 365)) ~/ 30;
    return months.toStringAsFixed(0);
  }

  @override
  DateTime? viewToModelValue(String? viewValue) {
    if (viewValue == null) return null;
    final months = int.tryParse(viewValue);
    if (months == null) return null;
    final now = DateTime.now();
    final calculatedDate = now.subtract(Duration(days: months * 30));
    return DateTime(
      calculatedDate.year,
      calculatedDate.month,
      calculatedDate.day,
    );
  }
}

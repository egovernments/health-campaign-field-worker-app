import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitDateFormPicker extends StatelessWidget {
  final String label;
  final bool isRequired;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final ValueChanged<DateTime?>? onChangeOfDate;
  final String formControlName;
  final bool? isEnabled;
  final String? requiredMessage;
  final GlobalKey? contextkey;
  final String? Function(DateTime?)? validator;
  final AutovalidateMode? autoValidation;
  final EdgeInsets? margin;
  final DateTime? start;
  final DateTime? end;
  final String? hint;

  const DigitDateFormPicker({
    super.key,
    required this.label,
    required this.isRequired,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.onChangeOfDate,
    required this.formControlName,
    this.isEnabled,
    this.requiredMessage,
    this.contextkey,
    this.validator,
    this.autoValidation,
    this.margin,
    this.end,
    this.start,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return LabeledField(
      label: label,
      child: ReactiveDatePicker(
        formControlName: formControlName,
        firstDate: start ?? DateTime(1900),
        lastDate: end ?? DateTime.now(),
        builder: (context, picker, child) {
          return ReactiveTextField<String>(
            formControlName: formControlName,
            readOnly: true,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.date_range),
              label: hint == null ? null : Text(hint!),
            ),
            onTap: (control) {
              picker.showPicker();
            },
          );
        },
      ),
    );
  }
}

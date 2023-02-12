import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitTextFormField extends StatelessWidget {
  final bool readOnly;
  final String formControlName;
  final String? hint;
  final Widget? suffix;
  final bool isRequired;
  final int minLines;
  final int? maxLength;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool obscureText;
  final String label;
  final ControlValueAccessor<dynamic, String>? valueAccessor;
  final TextCapitalization textCapitalization;
  final Map<String, String Function(Object object)>? validationMessages;

  const DigitTextFormField({
    super.key,
    required this.label,
    required this.formControlName,
    this.hint,
    this.suffix,
    this.minLines = 1,
    this.valueAccessor,
    this.maxLength,
    this.onTap,
    this.focusNode,
    this.validationMessages,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.obscureText = false,
    this.isRequired = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) => LabeledField(
        label: '$label ${isRequired ? '*' : ''}',
        child: ReactiveTextField(
          readOnly: readOnly,
          formControlName: formControlName,
          maxLength: maxLength,
          validationMessages: validationMessages,
          autofocus: false,
          textCapitalization: textCapitalization,
          minLines: minLines,
          obscureText: obscureText,
          focusNode: focusNode,
          keyboardType: keyboardType,
          valueAccessor: valueAccessor,
          decoration: InputDecoration(
            labelText: hint,
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 48,
              maxWidth: 48,
            ),
            suffixIcon: suffix == null
                ? null
                : InkWell(
                    onTap: onTap,
                    child: suffix,
                  ),
          ),
        ),
      );
}

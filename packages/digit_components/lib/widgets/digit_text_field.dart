import 'package:digit_components/widgets/labeled_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DigitTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String prefixText;
  final int? maxLenght;
  final int? maxLines;
  final bool isRequired;
  final Function(String)? onChange;
  final List<FilteringTextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final String? pattern;
  final bool? obscureText;
  final String? message;
  final Function(String?)? validator;
  final TextCapitalization? textCapitalization;
  final AutovalidateMode? autoValidation;
  final bool? isDisabled;
  final bool? readOnly;
  final bool? isFilled;

  const DigitTextField({
    super.key,
    required this.label,
    this.prefixText = '',
    this.maxLenght,
    this.controller,
    this.isRequired = false,
    this.textInputType,
    this.inputFormatter,
    this.pattern,
    this.validator,
    this.message,
    this.focusNode,
    this.textCapitalization,
    this.onChange,
    this.maxLines,
    this.autoValidation,
    this.obscureText,
    this.isDisabled,
    this.readOnly,
    this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    return LabeledField(
      label: label,
      child: TextFormField(
        controller: controller,
        enabled: isDisabled != null
            ? (isDisabled == true)
                ? false
                : true
            : true,
        maxLength: maxLenght,
        keyboardType: textInputType ?? TextInputType.text,
        autofocus: false,
        inputFormatters: inputFormatter,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        onChanged: onChange,
        maxLines: maxLines,
        focusNode: focusNode,
        obscureText: obscureText ?? false,
        autovalidateMode: autoValidation,
        readOnly: readOnly ?? false,
        validator: validator != null
            ? (val) => validator!(val)
            : (value) {
                if (value!.trim().isEmpty && isRequired) {
                  return null;
                }
              },
      ),
    );
  }
}

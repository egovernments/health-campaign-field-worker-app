import 'package:digit_components/digit_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DigitTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final String prefixText;
  final int? maxLength;
  final int? maxLines;
  final bool isRequired;
  final ValueChanged<String>? onChange;
  final List<FilteringTextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final String? pattern;
  final String? message;
  final String? Function(String? value)? validator;
  final TextCapitalization? textCapitalization;
  final AutovalidateMode? autoValidation;
  final bool obscureText;
  final bool isDisabled;
  final bool readOnly;
  final bool? isFilled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const DigitTextField(
      {super.key,
      required this.label,
      this.prefixText = '',
      this.maxLength,
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
      this.obscureText = false,
      this.isDisabled = false,
      this.readOnly = false,
      this.isFilled,
      this.suffixIcon,
      this.prefixIcon});

  @override
  State<StatefulWidget> createState() => _DigitTextField();
}

class _DigitTextField extends State<DigitTextField> {
  @override
  Widget build(BuildContext context) {
    return LabeledField(
      label: widget.label,
      child: TextFormField(
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: widget.readOnly == true
                ? DigitTheme.instance.colorScheme.shadow
                : DigitTheme.instance.colorScheme.onSurface),
        controller: widget.controller,
        enabled: !widget.isDisabled,
        maxLength: widget.maxLength,
        keyboardType: widget.textInputType ?? TextInputType.text,
        autofocus: false,
        inputFormatters: widget.inputFormatter,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        onChanged: widget.onChange,
        maxLines: widget.maxLines,
        focusNode: widget.focusNode,
        obscureText: widget.obscureText,
        autovalidateMode: widget.autoValidation,
        readOnly: widget.readOnly,
        validator: (value) => widget.validator?.call(value),
        decoration: InputDecoration(
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 48,
            maxWidth: 48,
          ),
          suffixIcon: widget.suffixIcon,
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const DigitColors().lavaRed, width: 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const DigitColors().lavaRed, width: 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          prefixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
          prefixStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: widget.isDisabled
                  ? const DigitColors().cloudGray
                  : DigitTheme.instance.colorScheme.onBackground),
          prefixIcon: widget.prefixIcon ??
              (widget.prefixText == ''
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, bottom: 10, right: 0),
                      child: Text(
                        widget.prefixText,
                        style: TextStyle(
                            fontSize: kIsWeb ? 15 : 16,
                            fontWeight: FontWeight.w400,
                            color: widget.isDisabled
                                ? const DigitColors().cloudGray
                                : DigitTheme.instance.colorScheme.onBackground),
                      ),
                    )),
        ),
      ),
    );
  }
}

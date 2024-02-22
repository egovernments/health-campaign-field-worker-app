import 'package:digit_components/digit_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitTextFormField extends StatelessWidget {
  final bool readOnly;
  final String formControlName;
  final String? hint;
  final String? hintText;
  final Widget? suffix;
  final bool isRequired;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool obscureText;
  final String label;
  final int? minLength;
  final Widget? suffixIcon;
  final void Function(FormControl<dynamic>)? onChanged;
  final TextCapitalization textCapitalization;
  final ControlValueAccessor<dynamic, String>? valueAccessor;
  final Map<String, String Function(Object control)>? validationMessages;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final Widget? prefixIcon;
  final TextStyle? labelStyle;
  final EdgeInsets? padding;
  final bool? hideKeyboard;

  const DigitTextFormField({
    super.key,
    required this.label,
    required this.formControlName,
    this.hint,
    this.suffix,
    this.minLines = 1,
    this.maxLines = 1,
    this.valueAccessor,
    this.maxLength,
    this.onTap,
    this.focusNode,
    this.validationMessages,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.obscureText = false,
    this.isRequired = false,
    this.readOnly = false,
    this.onChanged,
    this.minLength,
    this.inputFormatters,
    this.prefixIcon,
    this.prefixText,
    this.hintText,
    this.labelStyle,
    this.padding,
    this.hideKeyboard = false,
  });

  @override
  Widget build(BuildContext context) => LabeledField(
        label: '$label ${isRequired ? '*' : ''}',
        padding: padding ??
            const EdgeInsets.only(
              top: kPadding * 2,
            ),
        labelStyle: labelStyle ?? Theme.of(context).textTheme.bodyLarge,
        child: Column(
          children: [
            Container(
              color: (readOnly && hideKeyboard == false)
                  ? const DigitColors().seaShellGray
                  : null,
              child: ReactiveTextField(
                  onChanged: onChanged,
                  readOnly: readOnly,
                  formControlName: formControlName,
                  maxLength: maxLength,
                  validationMessages: validationMessages,
                  autofocus: false,
                  textCapitalization: textCapitalization,
                  minLines: minLines,
                  maxLines: maxLines,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: (readOnly && hideKeyboard == false)
                          ? const DigitColors().davyGray
                          : DigitTheme.instance.colorScheme.onBackground),
                  obscureText: obscureText,
                  focusNode: focusNode,
                  keyboardType: keyboardType,
                  inputFormatters: inputFormatters,
                  valueAccessor: valueAccessor,
                  decoration: (readOnly && hideKeyboard == false)
                      ? InputDecoration(
                          enabledBorder: DigitTheme
                              .instance.inputDecorationTheme.disabledBorder,
                          fillColor: DigitTheme.instance.colors.cloudGray,
                          focusedBorder: DigitTheme
                              .instance.inputDecorationTheme.disabledBorder,
                          focusColor: DigitTheme.instance.colors.cloudGray,
                          suffixIcon: suffix == null
                              ? null
                              : InkWell(
                                  onTap: onTap,
                                  child: suffix,
                                ),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 0, minHeight: 0),
                          prefixStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                              color: readOnly
                                  ? const DigitColors().hintGrey
                                  : DigitTheme
                                      .instance.colorScheme.onBackground),
                          prefixIcon: prefixIcon ??
                              (prefixText == ''
                                  ? null
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          bottom: 10,
                                          right: 0),
                                      child: Text(
                                        prefixText ?? '',
                                        style: TextStyle(
                                            fontSize: kIsWeb ? 15 : 16,
                                            fontWeight: FontWeight.w200,
                                            color: readOnly
                                                ? const DigitColors().hintGrey
                                                : DigitTheme.instance
                                                    .colorScheme.onBackground),
                                      ),
                                    )),
                        )
                      : InputDecoration(
                          labelText: hint,
                          suffixIconConstraints: const BoxConstraints(
                            maxHeight: 40,
                            maxWidth: 100,
                          ),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 0, minHeight: 0),
                          prefixStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: readOnly
                                ? const DigitColors().hintGrey
                                : DigitTheme.instance.colorScheme.onBackground,
                          ),
                          prefixIcon: prefixIcon ??
                              (prefixText == ''
                                  ? null
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          bottom: 10,
                                          right: 0),
                                      child: Text(
                                        prefixText ?? '',
                                        style: TextStyle(
                                          fontSize: kIsWeb ? 15 : 16,
                                          fontWeight: FontWeight.w400,
                                          color: readOnly
                                              ? const DigitColors().hintGrey
                                              : DigitTheme.instance.colorScheme
                                                  .onBackground,
                                        ),
                                      ),
                                    )),
                          suffixIcon: suffix == null
                              ? null
                              : InkWell(
                                  onTap: onTap,
                                  child: suffix,
                                ),
                        )),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(hintText ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: const DigitColors().hintGrey,
                  )),
            )
          ],
        ),
      );
}

part of 'json_schema_builder.dart';

class JsonSchemaStringBuilder extends JsonSchemaBuilder<String> {
  final TextInputType inputType;
  final String? prefixText;
  final String? suffixText;
  final bool capitalizeWords;

  const JsonSchemaStringBuilder({
    required super.formControlName,
    required super.form,
    super.readOnly,
    super.onTap,
    super.key,
    super.value,
    super.label,
    this.suffixText,
    this.prefixText,
    this.inputType = TextInputType.text,
    super.isRequired,
    super.validations,
    super.innerLabel,
    super.helpText,
    super.tooltipText,
    super.charCount,
    this.capitalizeWords = false,
  });

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);
    final patternFormatter = getPatternFormatter(validations);
    final noEmojiFilter = FilteringTextInputFormatter.allow(
      RegExp(r'[\x00-\x7F]'), // ASCII only (0-127)
    );
    final formatters = [
      noEmojiFilter,
      if (patternFormatter != null) patternFormatter,
      if (capitalizeWords) _CapitalizeWordsFormatter(),
    ];

    return ReactiveFormConsumer(
      builder: (context, formGroup, child) {
        return ReactiveWrapperField(
          formControlName: formControlName,
          validationMessages: validationMessages,
          showErrors: (control) => control.invalid && control.touched,
          builder: (field) => LabeledField(
            infoText: translateIfPresent(tooltipText, loc),
            label: label,
            capitalizedFirstLetter: false,
            isRequired: isRequired ?? false,
            child: DigitTextFormInput(
              maxLength: getMaxLength(validations),
              charCount: charCount ?? false,
              helpText: helpText,
              innerLabel: innerLabel,
              readOnly: readOnly,
              keyboardType: inputType,
              suffixText: suffixText,
              prefixText: prefixText,
              initialValue: form.control(formControlName).value,
              onChange: (value) {
                form.control(formControlName).markAsTouched();
                form.control(formControlName).value = value;
              },
              errorMessage: field.errorText,
              inputFormatters: formatters,
            ),
          ),
        );
      },
    );
  }
}

class _CapitalizeWordsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;
    final newText = newValue.text.replaceAllMapped(
      RegExp(r'(^|\s)\S'),
      (match) => match.group(0)!.toUpperCase(),
    );
    return newValue.copyWith(text: newText, selection: newValue.selection);
  }
}

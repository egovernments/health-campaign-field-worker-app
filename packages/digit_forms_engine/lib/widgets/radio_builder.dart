part of 'json_schema_builder.dart';

class JsonSchemaRadioBuilder extends JsonSchemaBuilder<bool> {
  final List<Option> enums;
  final bool isBoolean;
  final TextStyle? labelStyle;

  const JsonSchemaRadioBuilder({
    required super.formControlName,
    required super.form,
    this.enums = const [],
    super.key,
    super.value,
    super.label,
    super.readOnly,
    this.isBoolean = false,
    super.validations,
    super.tooltipText,
    super.helpText,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);

    return ReactiveWrapperField(
      formControlName: formControlName,
      validationMessages: validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) {
        final radioList = RadioList(
          containerPadding:
              const EdgeInsets.only(bottom: spacer2, top: spacer2),
          readOnly: readOnly,
          groupValue: form.control(formControlName).value.toString(),
          errorMessage: field.errorText,
          radioDigitButtons: enums
              .map(
                (e) => RadioButtonModel(
                  code: e.code,
                  name: loc.translate(e.name),
                ),
              )
              .toList(),
          onChanged: (value) {
            form.control(formControlName).markAsTouched();
            if (isBoolean) {
              form.control(formControlName).value = value.code == 'true';
            } else {
              form.control(formControlName).value = value.code;
            }
          },
        );

        final helpTextWidget = _buildHelpText(context, field.errorText);

        return LabeledField(
          charCondition: true,
          isRequired: hasRequiredValidation(validations),
          capitalizedFirstLetter: false,
          label: label,
          labelStyle: labelStyle,
          infoText: tooltipText,
          child: helpTextWidget == null
              ? radioList
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [radioList, helpTextWidget],
                ),
        );
      },
    );
  }

  /// Help text rendered under the options.
  ///
  /// [RadioList] has no `helpText` prop of its own — only `errorMessage` —
  /// so unlike the dropdown and string builders this is drawn here rather
  /// than passed down. The style matches what `DigitBaseFormInput` applies
  /// to its own help text (bodyS, secondary text colour, truncated at 256
  /// characters) so a radio field reads the same as every other field.
  ///
  /// Returns null when there is nothing to show, so the common case stays a
  /// bare [RadioList] with no extra Column in the tree. An error also
  /// suppresses it: the components library replaces help text with the error
  /// rather than stacking both, and `RadioList` already renders the error
  /// itself.
  Widget? _buildHelpText(BuildContext context, String? errorText) {
    if (helpText == null || helpText!.isEmpty) return null;
    if (errorText != null) return null;

    final theme = Theme.of(context);
    final text = helpText!.length > 256
        ? '${helpText!.substring(0, 256)}...'
        : helpText!;

    return Padding(
      padding: const EdgeInsets.only(bottom: spacer1),
      child: Text(
        text,
        style: theme.digitTextTheme(context).bodyS.copyWith(
              color: theme.colorTheme.text.secondary,
            ),
      ),
    );
  }
}

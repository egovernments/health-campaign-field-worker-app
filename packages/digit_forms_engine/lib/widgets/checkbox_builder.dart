part of 'json_schema_builder.dart';

class JsonSchemaCheckboxBuilder extends JsonSchemaBuilder<bool> {
  const JsonSchemaCheckboxBuilder({
    required super.formControlName,
    required super.form,
    super.key,
    super.value,
    super.label,
    super.validations,
    super.readOnly,
    super.isRequired,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);

    // Access defaultValues from Provider to replace {value} placeholders
    final defaultValues = context.read<Map<String, dynamic>>();

    // Resolve label by replacing {value} with defaultValues
    final resolvedLabel =
        _resolveLabelPlaceholders(loc.translate(label ?? ''), defaultValues);

    return ReactiveWrapperField(
      formControlName: formControlName,
      validationMessages: validationMessages,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DigitCheckbox(
              isRequired: isRequired ?? false,
              readOnly: readOnly,
              label: resolvedLabel,
              value: (field.value ?? false) as bool,
              onChanged: (value) {
                form.control(formControlName).markAsTouched();
                field.control.value = value;
                if (value != true && hasRequiredValidation(validations)) {
                  form.control(formControlName).setErrors({'required': true});
                }
              },
            ),
            if (field.errorText != null) const SizedBox(width: spacer3),
            if (field.errorText != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: spacer1 / 2,
                      ),
                      SizedBox(
                        height: spacer4,
                        width: spacer4,
                        child: Icon(
                          Icons.info,
                          color: theme.colorTheme.alert.error,
                          size: BaseConstants.errorIconSize,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: spacer1),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      truncateWithEllipsis(
                        256,
                        field.errorText!,
                      ),
                      style: textTheme.bodyS.copyWith(
                        color: theme.colorTheme.alert.error,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }

  /// Resolves placeholders in label by replacing {key} with values from defaultValues
  String? _resolveLabelPlaceholders(
    String? label,
    Map<String, dynamic> defaultValues,
  ) {
    if (label == null || label.isEmpty) return label;

    // Regular expression to match {key} (single braces)
    final regex = RegExp(r'\{([^}]+)\}');

    return label.replaceAllMapped(regex, (match) {
      final key = match.group(1)?.trim() ?? '';
      if (key.isEmpty) return match.group(0) ?? '';

      // Look up the value in defaultValues
      final value = defaultValues[key];

      // If found, wrap value in ** for bold text
      if (value != null) {
        return '**${value.toString()}**';
      }

      // If not found, return placeholder as-is
      return match.group(0) ?? '';
    });
  }
}

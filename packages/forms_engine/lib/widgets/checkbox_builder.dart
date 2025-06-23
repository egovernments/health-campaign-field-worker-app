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

    return ReactiveWrapperField(
      formControlName: formControlName,
      validationMessages: validationMessages,
      builder: (field){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DigitCheckbox(
              isRequired: isRequired ?? false,
              readOnly: readOnly,
              label: label ?? 'checkbox label',
              value: (field.value ?? false) as bool,
              onChanged: (value){
                form.control(formControlName).markAsTouched();
                field.control.value = value;
                if(value!=true && hasRequiredValidation(validations)){
                  form.control(formControlName).setErrors({'required': true});
                }
              },
            ),
            if(field.errorText!=null)
              const SizedBox(width: spacer3),
            if(field.errorText!=null)
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
                    child: Text(truncateWithEllipsis(256, field.errorText!,),
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
}

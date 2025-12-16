part of 'json_schema_builder.dart';

class JsonSchemaIdPopulatorBuilder extends JsonSchemaBuilder<int> {
  final int? maxValue;
  final List<Option>? enums;
  final int? minValue;

  const JsonSchemaIdPopulatorBuilder({
    required super.formControlName,
    required super.form,
    this.enums,
    super.key,
    super.value,
    this.maxValue,
    this.minValue,
    super.label,
    super.helpText,
    super.innerLabel,
    super.readOnly,
    super.validations,
    super.isRequired,
    super.tooltipText,
  });

  @override
  Widget build(BuildContext context) {
    const idKey = 'idNumber';
    const idTypeKey = 'idType';
    const idAutoFilledKey = 'idAutoFilled';

    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);

    final defaultValues = context.read<Map<String, dynamic>>();
    final identifiers = defaultValues['availableIDs'];

    /// Register controls
    if (!form.contains(idKey)) {
      form.addAll({
        idKey: FormControl<String>(validators: [Validators.required]),
      });
    }

    if (!form.contains(idTypeKey)) {
      form.addAll({
        idTypeKey: FormControl<String>(
          validators: isRequired ?? false ? [Validators.required] : [],
        ),
      });
    }

    if (!form.contains(idAutoFilledKey)) {
      form.addAll({
        idAutoFilledKey: FormControl<bool>(value: false),
      });
    }

    /// Populate from combined value (edit case)
    final combinedValue = form.control(formControlName).value;
    if (combinedValue != null && combinedValue is String) {
      final parts = combinedValue.split(' ');
      if (parts.length >= 2) {
        final type = parts[0];
        final number = parts.sublist(1).join(' ');

        if (form.control(idTypeKey).value == null) {
          form.control(idTypeKey).value = type;
        }
        if (form.control(idKey).value == null && type != 'DEFAULT') {
          form.control(idKey).value = number;
          form.control(idAutoFilledKey).value = true;
        }
      }
    }

    /// Helper to update combined value
    void updateCombinedIdentifier() {
      final idType = form.control(idTypeKey).value;
      final idNumber = form.control(idKey).value;

      if (idType != null &&
          idNumber != null &&
          idNumber.toString().trim().isNotEmpty) {
        form.control(formControlName).value = '$idType, $idNumber';
      } else {
        form.control(formControlName).value = null;
      }
    }

    final isIdTypeMissing =
    (form.control(idTypeKey).value?.toString().trim().isEmpty ?? true);

    final isIdNumberMissing =
    (form.control(idKey).value?.toString().trim().isEmpty ?? true);

    return Column(
      children: [
        /// ID TYPE DROPDOWN
        ReactiveWrapperField(
          formControlName: formControlName,
          validationMessages: validationMessages,
          showErrors: (control) => control.invalid && control.touched,
          builder: (field) => LabeledField(
            infoText: translateIfPresent(tooltipText, loc),
            label: label,
            capitalizedFirstLetter: false,
            isRequired: isRequired ?? false,
            child: DigitDropdown<String>(
              helpText: helpText,
              errorMessage: isIdTypeMissing ? field.errorText : null,
              selectedOption: form.control(idTypeKey).value != null
                  ? DropdownItem(
                code: form.control(idTypeKey).value!,
                name: loc.translate(
                  (enums ?? [])
                      .firstWhere(
                        (e) =>
                    e.code ==
                        form.control(idTypeKey).value,
                    orElse: () => Option(
                      code: form.control(idTypeKey).value,
                      name: form.control(idTypeKey).value!,
                    ),
                  )
                      .name,
                ),
              )
                  : null,
              items: (enums ?? [])
                  .map(
                    (e) => DropdownItem(
                  code: e.code,
                  name: loc.translate(e.name),
                ),
              )
                  .toList(),
              onSelect: (value) {
                form.control(formControlName).markAsTouched();

                final defaultIdentifier = identifiers?[value.code];

                if (defaultIdentifier != null &&
                    defaultIdentifier is String) {
                  form.control(idTypeKey).value = value.code;
                  form.control(idKey).value = defaultIdentifier;
                  form.control(idAutoFilledKey).value = true;

                  form.control(formControlName).value =
                  '${value.code}, $defaultIdentifier';
                } else {
                  form.control(idTypeKey).value = value.code;
                  form.control(idKey).value = null;
                  form.control(idAutoFilledKey).value = false;
                  form.control(formControlName).value = null;
                }
              },
              onChange: (value) {
                if (value.isEmpty) {
                  form.control(idTypeKey).value = null;
                  form.control(idKey).value = null;
                  form.control(idAutoFilledKey).value = false;
                  form.control(formControlName).value = null;
                }
              },
            ),
          ),
        ),

        if (form.control(idTypeKey).value != null &&
            form.control(idTypeKey).value != 'DEFAULT')
          const SizedBox(height: spacer4),

        /// ID NUMBER FIELD
        if (form.control(idTypeKey).value != null &&
            form.control(idTypeKey).value != 'DEFAULT')
          ReactiveFormConsumer(
            builder: (context, formGroup, child) {
              return ReactiveWrapperField(
                formControlName: formControlName,
                validationMessages: validationMessages,
                showErrors: (control) => control.invalid && control.touched,
                builder: (field) => LabeledField(
                  label: loc.translate('ID_NUMBER_LABEL_TEXT'),
                  capitalizedFirstLetter: false,
                  isRequired: true,
                  child: DigitTextFormInput(
                    initialValue: form.control(idKey).value,
                    readOnly:
                    form.control(idAutoFilledKey).value == true,
                    onChange: (value) {
                      form.control(formControlName).markAsTouched();
                      form.control(idAutoFilledKey).value = false;
                      form.control(idKey).value = value;
                      updateCombinedIdentifier();
                    },
                    errorMessage:
                    isIdNumberMissing ? field.errorText : null,
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

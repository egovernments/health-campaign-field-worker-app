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

    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);

    // Access defaultValues via Provider
    final defaultValues = context.read<Map<String, dynamic>>();

    final identifiers = defaultValues['availableIDs'];

    // Register additional controls if not already present
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

    // Extract initial combined value and populate idType and idNumber
    final combinedValue = form.control(formControlName).value;
    if (combinedValue != null && combinedValue is String) {
      final parts = combinedValue.split(' ');
      if (parts.length >= 2) {
        final type = parts[0];
        final number =
            parts.sublist(1).join(' '); // In case idNumber contains spaces

        if (form.control(idTypeKey).value == null) {
          form.control(idTypeKey).value = type;
        }
        if (form.control(idKey).value == null && type != 'DEFAULT') {
          form.control(idKey).value = number;
        }
      }
    }

    final mainControl = form.control(formControlName);
    final isMainInvalid = mainControl.invalid && mainControl.touched;

    // Determine missing subfields
    final isIdTypeMissing = (form.control(idTypeKey).value == null ||
        form.control(idTypeKey).value.toString().trim().isEmpty);
    final isIdNumberMissing = (form.control(idKey).value == null ||
        form.control(idKey).value.toString().trim().isEmpty);

    // Helper to update the combined identifier string
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

    return Column(
      children: [
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
                              (e) => e.code == form.control(idTypeKey).value,
                              orElse: () => Option(
                                  code: form.control(idTypeKey).value,
                                  name: form.control(idTypeKey).value!),
                            )
                            .name,
                      ),
                    )
                  : null,
              items: (enums ?? [])
                  .map((e) =>
                      DropdownItem(code: e.code, name: loc.translate(e.name)))
                  .toList(),
              onSelect: (value) {
                form.control(formControlName).markAsTouched();
                final defaultIdentifier = identifiers?[value.code];

                if (defaultIdentifier != null && defaultIdentifier is String) {
                  final type = value.code;
                  final number = defaultIdentifier;

                  form.control(idTypeKey).value = type;
                  form.control(idKey).value = number;
                  form.control(formControlName).value = '$type, $number';
                } else {
                  form.control(idKey).value = null;
                  form.control(idTypeKey).value = value.code;
                  form.control(formControlName).value = null;
                }
              },
              onChange: (value) {
                form.control(formControlName).markAsTouched();
                if (value.isEmpty) {
                  form.control(idTypeKey).value = null;
                  form.control(idKey).value = null;
                  form.control(formControlName).value = null;
                }
              },
            ),
          ),
        ),
        if (form.control(idTypeKey).value != null &&
            form.control(idTypeKey).value != 'DEFAULT')
          const SizedBox(
            height: spacer4,
          ),
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
                    readOnly: form.control(idKey).value != null,
                    onChange: (value) {
                      form.control(formControlName).markAsTouched();
                      form.control(idKey).value = value;
                      updateCombinedIdentifier(); // Keep sync
                    },
                    errorMessage: isIdNumberMissing ? field.errorText : null,
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

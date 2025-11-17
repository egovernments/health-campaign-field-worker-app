part of 'json_schema_builder.dart';

class _ScanTarget {
  _ScanTarget._();
  static final _ScanTarget instance = _ScanTarget._();

  String? _key;
  void set(String key) => _key = key;
  void clear() => _key = null;
  String? get key => _key;
}

/// ---------- GS1 display helper (uses first useful AI) ----------
extension GS1Display on GS1Barcode {
  /// Prefer common IDs when available, else fall back to the first AI.
  String? displayValue({
    List<String> prefer = const ['01', '02', '00', '21', '10', '240'],
  }) {
    for (final k in prefer) {
      final el = elements[k];
      final v = el?.data?.toString().trim();
      if (v != null && v.isNotEmpty) return v;
    }
    if (elements.isEmpty) return null;
    final first = elements.entries.first.value.data?.toString().trim();
    return (first == null || first.isEmpty) ? null : first;
  }
}

class JsonSchemaScannerBuilder extends JsonSchemaBuilder<String> {
  final DateTime? start;
  final DateTime? end;

  const JsonSchemaScannerBuilder({
    required super.formControlName,
    required super.form,
    super.label,
    super.key,
    super.value,
    super.helpText,
    this.start,
    this.end,
    super.validations,
  });

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);

    // Resolve template variables in validations before using them
    final resolvedValidations = _resolveValidations(validations, form);

    final validationMessages = buildValidationMessages(resolvedValidations, loc);
    T? _val<T>(String type) =>
        resolvedValidations?.firstWhereOrNull((v) => v.type == type)?.value as T?;

    // ----- Read config from validations -----
    // isGS1: supports bool / "true"/"false" / num(0/1)
    final bool isGS1 = () {
      final dynamic raw =
          resolvedValidations?.firstWhereOrNull((v) => v.type == 'isGS1')?.value;
      if (raw is bool) return raw;
      if (raw is num) return raw != 0;
      if (raw is String) return raw.toLowerCase() == 'true';
      return false;
    }();

    // scanLimit: supports int / num / String
    final int scanLimit = () {
      final dynamic raw =
          resolvedValidations?.firstWhereOrNull((v) => v.type == 'scanLimit')?.value;
      if (raw is int) return raw;
      if (raw is num) return raw.toInt();
      final parsed = int.tryParse(raw?.toString() ?? '');
      return parsed ?? 1;
    }();

    // (Optional) pattern as plain string (no r'' needed)
    final String? patternString = () {
      final dynamic raw =
          resolvedValidations?.firstWhereOrNull((v) => v.type == 'pattern')?.value;
      final s = raw?.toString().trim();
      return (s == null || s.isEmpty) ? null : s;
    }();

    return ReactiveWrapperField(
      formControlName: formControlName,
      validationMessages: validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) => BlocConsumer<DigitScannerBloc, DigitScannerState>(
          listener: (context, state) {
        if (_ScanTarget.instance.key != formControlName) return;

        final List<String> items = isGS1
            ? state.barCodes
                .map((b) => b.displayValue() ?? b.toString())
                .toList(growable: false)
            : List<String>.from(state.qrCodes);

        final ctrl = form.control(formControlName);

        if (items.isEmpty) {
          // clear
          ctrl.updateValue(scanLimit == 1 ? null : '', emitEvent: false);
          return;
        }

        final String valueForControl =
            (scanLimit == 1) ? items.first : items.join(',');

        ctrl.updateValue(valueForControl, emitEvent: false);
      }, builder: (context, state) {
        // Read from the control (so multiple builders don't conflict)
        final ctrl = form.control(formControlName);
        final String? ctrlValue = ctrl.value as String?;

        final List<String> items = () {
          if (ctrlValue == null || ctrlValue.isEmpty) return const <String>[];
          if (scanLimit == 1) return <String>[ctrlValue];
          return ctrlValue.split(',');
        }();

        return items.isNotEmpty
            ? Container(
                padding: EdgeInsets.zero,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .78,
                      child: LabelValueSummary(
                        padding: EdgeInsets.zero,
                        withDivider: false,
                        items: [
                          LabelValueItem(
                            label: label ?? 'Voucher code',
                            value: items.join(', '),
                            labelFlex: 5,
                            maxLines: 5,
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                    DigitButton(
                      label: '',
                      onPressed: () {
                        _ScanTarget.instance.set(formControlName);
                        context.router
                            .push(DigitScannerRoute(
                          validations: _resolveValidations(validations, form),
                        ))
                            .whenComplete(() {
                          _ScanTarget.instance.clear();
                        });
                      },
                      type: DigitButtonType.tertiary,
                      size: DigitButtonSize.medium,
                      prefixIcon: Icons.edit,
                    )
                  ],
                ),
              )
            : DigitButton(
                capitalizeLetters: false,
                size: DigitButtonSize.large,
                label: label ?? 'scanner',
                onPressed: () async {
                  _ScanTarget.instance.set(formControlName);

                  context.router.push(DigitScannerRoute(
                    validations: _resolveValidations(validations, form),
                  ));
                },
                type: DigitButtonType.secondary,
                prefixIcon: Icons.qr_code,
                mainAxisSize: MainAxisSize.max,
              );
      }),
    );
  }
}

/// Helper function to resolve template variables in validations
/// Converts {{resourceCard.first.quantityDistributed}} to actual values
List<ValidationRule>? _resolveValidations(
  List<ValidationRule>? validations,
  FormGroup form,
) {
  if (validations == null || validations.isEmpty) return validations;

  // Build context from current form values
  final context = _buildFormContext(form);

  return validations.map((rule) {
    final value = rule.value;

    // Only resolve if value is a string with template variables
    if (value is String && value.contains('{{')) {
      final resolvedValue = resolveTemplateVariables(
        value,
        formValues: context,
      );

      // Return new ValidationRule with resolved value
      return ValidationRule(
        type: rule.type,
        value: resolvedValue,
        message: rule.message,
      );
    }

    // Return original rule if no resolution needed
    return rule;
  }).toList();
}

/// Build context map from FormGroup values
Map<String, dynamic> _buildFormContext(FormGroup form) {
  final context = <String, dynamic>{};

  form.controls.forEach((key, control) {
    if (control is FormGroup) {
      // Nested form group - flatten with dot notation
      final nestedContext = _buildFormContext(control);
      nestedContext.forEach((nestedKey, nestedValue) {
        context['$key.$nestedKey'] = nestedValue;
      });
    } else {
      context[key] = control.value;
    }
  });

  return context;
}

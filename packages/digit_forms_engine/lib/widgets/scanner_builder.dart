part of 'json_schema_builder.dart';

/// ---------- Lightweight per-field scan scoping (no bloc changes) ----------
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

/// ---------- Widget ----------
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
    super.validations, // <-- List<ValidationRule>? validations
  });

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);

    // Helpers to read typed values from ValidationRule list safely
    T? _val<T>(String type) =>
        validations?.firstWhereOrNull((v) => v.type == type)?.value as T?;

    // ----- Read config from validations -----
    // isGS1: supports bool / "true"/"false" / num(0/1)
    final bool isGS1 = () {
      final dynamic raw = validations
          ?.firstWhereOrNull((v) => v.type == 'isGS1')
          ?.value;
      if (raw is bool) return raw;
      if (raw is num) return raw != 0;
      if (raw is String) return raw.toLowerCase() == 'true';
      return false;
    }();

    // scanLimit: supports int / num / String
    final int scanLimit = () {
      final dynamic raw = validations
          ?.firstWhereOrNull((v) => v.type == 'scanLimit')
          ?.value;
      if (raw is int) return raw;
      if (raw is num) return raw.toInt();
      final parsed = int.tryParse(raw?.toString() ?? '');
      return parsed ?? 1;
    }();

    // (Optional) pattern as plain string (no r'' needed)
    final String? patternString = () {
      final dynamic raw = validations
          ?.firstWhereOrNull((v) => v.type == 'pattern')
          ?.value;
      final s = raw?.toString().trim();
      return (s == null || s.isEmpty) ? null : s;
    }();

    return ReactiveWrapperField(
      formControlName: formControlName,
      validationMessages: validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) => BlocConsumer<DigitScannerBloc, DigitScannerState>(
        // Only update *my* control if I am the active scan target
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
          (scanLimit == 1) ? items.first : items.join('\n');

          ctrl.updateValue(valueForControl, emitEvent: false);
        },
        builder: (context, state) {
          // Read from the control (so multiple builders don't conflict)
          final ctrl = form.control(formControlName);
          final String? ctrlValue = ctrl.value as String?;

          final List<String> items = () {
            if (ctrlValue == null || ctrlValue.isEmpty) return const <String>[];
            if (scanLimit == 1) return <String>[ctrlValue];
            return ctrlValue.split('\n');
          }();

          // Already scanned -> show summary and an Edit button
          if (items.isNotEmpty) {
            return Container(
              padding: EdgeInsets.zero,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .78,
                    child: LabelValueSummary(
                      padding: EdgeInsets.zero,
                      withDivider: false,
                      items: [
                        LabelValueItem(
                          label: label ?? 'Scans',
                          value:
                          (scanLimit == 1) ? items.first : items.join('\n'),
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
                      // Scope this scan session to *this* control
                      _ScanTarget.instance.set(formControlName);

                      // Open scanner: pass validations only; the page will init bloc from these
                      context
                          .router
                          .push(
                        DigitScannerRoute(
                          validations: validations,
                          // If your route also needs an "edit" flag, pass it here.
                          // isEditEnabled: true/false,
                        ),
                      )
                          .whenComplete(() {
                        _ScanTarget.instance.clear();
                      });
                    },
                    type: DigitButtonType.tertiary,
                    size: DigitButtonSize.medium,
                    prefixIcon: Icons.edit,
                  ),
                ],
              ),
            );
          }

          // Nothing scanned yet -> open scanner
          return DigitButton(
            capitalizeLetters: false,
            size: DigitButtonSize.large,
            label: label ?? 'scanner',
            onPressed: () async {
              // Scope this scan session to *this* control
              _ScanTarget.instance.set(formControlName);

              // Open scanner: pass validations only
              context
                  .router
                  .push(
                DigitScannerRoute(
                  validations: validations,
                ),
              )
                  .whenComplete(() {
                _ScanTarget.instance.clear();
              });
            },
            type: DigitButtonType.secondary,
            prefixIcon: Icons.qr_code,
            mainAxisSize: MainAxisSize.max,
          );
        },
      ),
    );
  }
}

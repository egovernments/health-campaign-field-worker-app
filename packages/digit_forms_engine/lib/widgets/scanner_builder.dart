part of 'json_schema_builder.dart';

class JsonSchemaScannerBuilder extends JsonSchemaBuilder<String> {
  final DateTime? start;
  final DateTime? end;
  final bool summaryData;

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
    this.summaryData = false,
  });

  /// Converts ValidationRule list to ScannerValidation list
  List<ScannerValidation>? _toScannerValidations() {
    if (validations == null) return null;
    return validations!
        .map((v) => ScannerValidation(
              type: v.type,
              value: v.value,
              message: v.message,
            ))
        .toList();
  }

  /// Attempts to parse a scanned QR string as the CDD-identity JSON payload
  /// (`{"userId": "<uuid>", "boundaryCode": "<code>", ...}`). Returns the
  /// decoded map only when the payload is a JSON object that carries a
  /// non-empty string `userId`; otherwise returns null. The strict shape
  /// gate keeps every existing scanner consumer (bare-UUID scans, GS1
  /// barcodes, voucher codes, encrypted attendance QR payloads, etc.)
  /// flowing through the original raw-text code path with zero behavior
  /// change.
  static Map<String, dynamic>? _tryParseIdentityPayload(String raw) {
    if (raw.isEmpty) return null;
    if (!raw.trimLeft().startsWith('{')) return null;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      final userId = decoded['userId'];
      if (userId is! String || userId.isEmpty) return null;
      return Map<String, dynamic>.from(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Writes the parsed JSON payload's `userId` into the current form
  /// control and spreads any additional top-level string keys into
  /// matching sibling form controls when they exist. Sibling writes
  /// silently no-op for controls that aren't declared in the schema —
  /// that's the opt-in mechanism: only the warehouseDetails dispatch
  /// form declares `boundaryCode` and so only it picks up the validation
  /// value.
  void _applyIdentityPayload(FormGroup form, Map<String, dynamic> payload) {
    form.control(formControlName).value = payload['userId'];
    for (final entry in payload.entries) {
      if (entry.key == 'userId') continue;
      final value = entry.value;
      if (value is! String || value.isEmpty) continue;
      if (form.contains(entry.key)) {
        form.control(entry.key).value = value;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = FormLocalization.of(context);
    final validationMessages = buildValidationMessages(validations, loc);
    return ReactiveWrapperField(
      formControlName: formControlName,
      validationMessages: validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) => BlocConsumer<DigitScannerBloc, DigitScannerState>(
          listenWhen: (previous, current) {
        // Only listen if this scanner initiated the scan
        return current.scannerId == formControlName;
      }, buildWhen: (previous, current) {
        // Only rebuild if this scanner initiated the scan
        return current.scannerId == formControlName;
      }, listener: (context, state) {
        if (state.qrCodes.isNotEmpty) {
          // Join multiple QR codes with comma separator
          final joined = state.qrCodes.join(', ');
          final identityPayload = state.qrCodes.length == 1
              ? _tryParseIdentityPayload(state.qrCodes.first)
              : null;
          if (identityPayload != null) {
            _applyIdentityPayload(form, identityPayload);
          } else {
            form.control(formControlName).value = joined;
          }
        } else if (state.barCodes.isNotEmpty) {
          // Serialize barcodes dynamically using only non-empty fields
          form.control(formControlName).value =
              DigitScannerUtils().serializeGs1Barcodes(state.barCodes);
        } else {
          // Clear the form value when all scanned data has been deleted
          form.control(formControlName).value = null;
        }
      }, builder: (context, state) {
        // Check if this scanner initiated the scan OR if form has pre-populated data
        final isThisScanner = state.scannerId == formControlName;
        final formValue = form.control(formControlName).value as String?;
        final hasFormValue = formValue != null && formValue.isNotEmpty;

        // Sync form value with state when returning from scanner page
        // The listener may miss state changes that happen during navigation
        if (isThisScanner && state.qrCodes.isNotEmpty) {
          // Mirror the listener: if a single-QR scan parses as the CDD
          // identity payload, the canonical form value is the userId, not
          // the raw JSON — comparing against joined raw would always show
          // a mismatch and re-overwrite the parsed userId with the JSON
          // blob.
          final identityPayload = state.qrCodes.length == 1
              ? _tryParseIdentityPayload(state.qrCodes.first)
              : null;
          final stateValue =
              identityPayload != null ? identityPayload['userId'] as String : state.qrCodes.join(', ');
          if (formValue != stateValue) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (identityPayload != null) {
                _applyIdentityPayload(form, identityPayload);
              } else {
                form.control(formControlName).value = stateValue;
              }
            });
          }
        } else if (isThisScanner && state.barCodes.isNotEmpty) {
          // Sync barcodes - build expected form value and compare
          final stateValue =
              DigitScannerUtils().serializeGs1Barcodes(state.barCodes);
          if (formValue != stateValue) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              form.control(formControlName).value = stateValue;
            });
          }
        } else if (isThisScanner &&
            state.qrCodes.isEmpty &&
            state.barCodes.isEmpty &&
            hasFormValue) {
          // Clear form value when all scanned data has been deleted
          WidgetsBinding.instance.addPostFrameCallback((_) {
            form.control(formControlName).value = null;
          });
        }

        // Check if this is barcode data (GS1 format)
        // New format: key:value|key:value (pipe-separated key-value pairs)
        // Legacy format: GTIN,SERIAL,BATCH,EXPIRY (4 comma-separated parts)
        bool isGS1BarcodeFormat(String value) {
          // New format: contains '|' or starts with 2-digit AI code followed by ':'
          if (value.contains('|') ||
              RegExp(r'^\d{2}:').hasMatch(value.trim())) {
            return true;
          }
          // Legacy format: check for semicolon-separated barcodes
          if (value.contains(';')) {
            final barcodes = value.split(';');
            final firstParts =
                barcodes.first.split(',').map((e) => e.trim()).toList();
            return firstParts.length == 4;
          }
          // Single legacy barcode check
          final parts = value.split(',').map((e) => e.trim()).toList();
          return parts.length == 4;
        }

        final isBarcodeData = (isThisScanner && state.barCodes.isNotEmpty) ||
            (hasFormValue && isGS1BarcodeFormat(formValue));

        // Use bloc state qrCodes if this scanner just scanned, otherwise parse from form value
        // QR codes are comma-separated
        final displayQrCodes = isThisScanner && state.qrCodes.isNotEmpty
            ? state.qrCodes
            : (!isBarcodeData && hasFormValue
                ? formValue
                    .split(',')
                    .map((e) => e.trim())
                    .where((e) => e.isNotEmpty)
                    .toList()
                : <String>[]);

        // Show barcode summary first (if barcode data exists), then QR summary
        final showBarcodeSummary = isBarcodeData && summaryData;
        final showQrSummary =
            !showBarcodeSummary && displayQrCodes.isNotEmpty && summaryData;

        // Show barcode (GS1) summary
        return showBarcodeSummary
            ? Container(
                padding: EdgeInsets.zero,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: isThisScanner && state.barCodes.isNotEmpty
                            // Use bloc state when available - show all barcodes
                            ? state.barCodes
                                .asMap()
                                .entries
                                .map((barcodeEntry) {
                                final index = barcodeEntry.key;
                                final gs1Data = DigitScannerUtils()
                                    .getGs1CodeFormattedStringAtIndex(
                                        state.barCodes, index);
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: index < state.barCodes.length - 1
                                        ? 16.0
                                        : 0,
                                  ),
                                  child: LabelValueSummary(
                                    padding: EdgeInsets.zero,
                                    withDivider: false,
                                    items: gs1Data.entries.map((entry) {
                                      return LabelValueItem(
                                        labelFlex: 5,
                                        label: "GS1_${entry.key}",
                                        value: entry.value is DateTime
                                            ? DateFormat('d MMMM yyyy')
                                                .format(entry.value)
                                                .toString()
                                            : entry.value,
                                        maxLines: 5,
                                      );
                                    }).toList(),
                                  ),
                                );
                              }).toList()
                            // Fall back to parsing form value using deserializer
                            : () {
                                final parsedBarcodes = DigitScannerUtils
                                    .deserializeGs1Barcodes(formValue!);
                                final widgets = <Widget>[];
                                for (int i = 0;
                                    i < parsedBarcodes.length;
                                    i++) {
                                  final items = parsedBarcodes[i]
                                      .entries
                                      .map((entry) => LabelValueItem(
                                            labelFlex: 5,
                                            label: "GS1_${entry.key}",
                                            value: entry.value,
                                            maxLines: 5,
                                          ))
                                      .toList();
                                  widgets.add(Padding(
                                    padding: EdgeInsets.only(
                                      bottom: i < parsedBarcodes.length - 1
                                          ? 16.0
                                          : 0,
                                    ),
                                    child: LabelValueSummary(
                                      padding: EdgeInsets.zero,
                                      withDivider: false,
                                      items: items,
                                    ),
                                  ));
                                }
                                return widgets;
                              }(),
                      ),
                    ),
                    DigitButton(
                      label: '',
                      onPressed: () {
                        // Pass form value directly to scanner page via route param
                        // Scanner page will parse and dispatch to bloc in initState
                        final provider = ScannerComparisonProvider.of(context);
                        final registry = ScannerComparisonRegistry();
                        final dupeFn = provider != null ? provider.duplicateCheckFn : registry.duplicateCheckFn;
                        final dupeErrFn = provider != null ? provider.duplicateErrorMessage : registry.duplicateErrorMessage;
                        final duplicateCheckFn = dupeFn != null
                            ? (String scannedValue) => dupeFn(
                                  formControlName, scannedValue, form.value)
                            : null;
                        final duplicateMsg = dupeErrFn?.call(formControlName);
                        context.router.push(DigitScannerRoute(
                          validations: _toScannerValidations(),
                          isGS1code: true,
                          isEditEnabled: true,
                          initialBarcodeData: formValue,
                          scannerId: formControlName,
                          duplicateCheckFn: duplicateCheckFn,
                          duplicateCheckMessage: duplicateMsg,
                        ));
                      },
                      type: DigitButtonType.tertiary,
                      size: DigitButtonSize.medium,
                      prefixIcon: Icons.edit,
                    )
                  ],
                ),
              )
            // Show QR code summary
            : showQrSummary
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
                                // Show all QR codes comma-separated
                                value: displayQrCodes.join(', '),
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
                            // Clear scanner state before navigating to edit QR codes
                            context.read<DigitScannerBloc>().add(
                                  DigitScannerEvent.handleScanner(
                                    barCode: [],
                                    qrCode: [],
                                    scannerId: formControlName,
                                  ),
                                );
                            // Use displayQrCodes which already has the parsed data
                            final provider2 = ScannerComparisonProvider.of(context);
                            final registry2 = ScannerComparisonRegistry();
                            final dupeFn2 = provider2 != null ? provider2.duplicateCheckFn : registry2.duplicateCheckFn;
                            final dupeErrFn2 = provider2 != null ? provider2.duplicateErrorMessage : registry2.duplicateErrorMessage;
                            final duplicateCheckFn2 = dupeFn2 != null
                                ? (String scannedValue) => dupeFn2(
                                      formControlName, scannedValue, form.value)
                                : null;
                            final duplicateMsg2 = dupeErrFn2?.call(formControlName);
                            context.router.push(DigitScannerRoute(
                              validations: _toScannerValidations(),
                              isEditEnabled: true,
                              initialQrCodes: displayQrCodes,
                              scannerId: formControlName,
                              duplicateCheckFn: duplicateCheckFn2,
                              duplicateCheckMessage: duplicateMsg2,
                            ));
                          },
                          type: DigitButtonType.tertiary,
                          size: DigitButtonSize.medium,
                          prefixIcon: Icons.edit,
                        )
                      ],
                    ),
                  )
                // Show scan button (no data yet)
                : DigitButton(
                    capitalizeLetters: false,
                    size: DigitButtonSize.large,
                    label: label ?? 'scanner',
                    onPressed: () async {
                      context.read<DigitScannerBloc>().add(
                            DigitScannerEvent.handleScanner(
                              scannerId: formControlName,
                            ),
                          );
                      final provider3 = ScannerComparisonProvider.of(context);
                      final registry3 = ScannerComparisonRegistry();
                      final dupeFn3 = provider3 != null ? provider3.duplicateCheckFn : registry3.duplicateCheckFn;
                      final dupeErrFn3 = provider3 != null ? provider3.duplicateErrorMessage : registry3.duplicateErrorMessage;
                      final duplicateCheckFn3 = dupeFn3 != null
                          ? (String scannedValue) => dupeFn3(
                                formControlName, scannedValue, form.value)
                          : null;
                      final duplicateMsg3 = dupeErrFn3?.call(formControlName);
                      context.router.push(DigitScannerRoute(
                        validations: _toScannerValidations(),
                        scannerId: formControlName,
                        duplicateCheckFn: duplicateCheckFn3,
                        duplicateCheckMessage: duplicateMsg3,
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

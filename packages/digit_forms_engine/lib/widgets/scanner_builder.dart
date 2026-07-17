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
  /// control. The payload's other keys (notably `boundaryCode`) are used
  /// transiently for reject-at-scan validation via
  /// [ScannerComparisonRegistry.expectedBoundaryCodeProvider] — they
  /// intentionally do NOT populate any form field, so the transformer
  /// keeps reading only what it always has and no schema-side wiring
  /// changes.
  void _applyIdentityPayload(FormGroup form, Map<String, dynamic> payload) {
    form.control(formControlName).value = payload['userId'];
  }

  /// Runs the app-registered identity payload validator against the
  /// parsed payload. Returns null when the scan is acceptable or the app
  /// hasn't registered a validator; returns the (already-localized)
  /// error message when the app wants the scan rejected. This is the
  /// single extension point for adding new cross-field checks (boundary,
  /// project, role, …) — the scanner package stays payload-agnostic.
  static String? _validateIdentityPayload(Map<String, dynamic> payload) {
    return ScannerComparisonRegistry()
        .identityPayloadValidator
        ?.call(payload);
  }

  /// Clears the scanner bloc state for this scanner so a subsequent
  /// rebuild doesn't re-apply a rejected payload, and clears the form
  /// value so any UI reading the field sees "no scan yet".
  void _rejectScan(BuildContext context, FormGroup form) {
    form.control(formControlName).value = null;
    context.read<DigitScannerBloc>().add(
          DigitScannerEvent.handleScanner(
            barCode: const [],
            qrCode: const [],
            scannerId: formControlName,
          ),
        );
  }

  /// Renders the reject snackbar with the app-supplied message. Kept on
  /// the listener path so it fires once per scan attempt rather than
  /// once per rebuild.
  void _showRejectSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Schema typo or a hidden field with includeInForm:false would leave the
    // FormGroup without this control; every form.control(formControlName)
    // below would then throw FormControlNotFoundException mid-listener. Render
    // nothing in that case so a bad config degrades gracefully instead of
    // crashing the page.
    if (!form.contains(formControlName)) {
      return const SizedBox.shrink();
    }
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
            final rejectReason = _validateIdentityPayload(identityPayload);
            if (rejectReason != null) {
              // App validator (boundary / project / whatever it grew to
              // check) said no. Reject wholesale — form value cleared,
              // scanner state reset so a follow-up rebuild doesn't
              // re-apply the payload, snackbar surfaces the reason.
              _rejectScan(context, form);
              _showRejectSnackbar(context, rejectReason);
            } else {
              _applyIdentityPayload(form, identityPayload);
            }
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
          if (identityPayload != null &&
              _validateIdentityPayload(identityPayload) != null) {
            // Rebuild caught a rejected payload that the listener hasn't
            // yet cleared (e.g. state restored from cold-start). Clear
            // silently — the listener path already showed the snackbar;
            // suppressing it here avoids double-toast on rapid rebuilds.
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _rejectScan(context, form);
            });
          } else {
            final stateValue = identityPayload != null
                ? identityPayload['userId'] as String
                : state.qrCodes.join(', ');
            if (formValue != stateValue) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (identityPayload != null) {
                  _applyIdentityPayload(form, identityPayload);
                } else {
                  form.control(formControlName).value = stateValue;
                }
              });
            }
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
        // QR codes are comma-separated.
        //
        // Special case for identity-payload scans (JSON with `userId`):
        // showing the raw JSON blob in the summary chip is confusing when
        // the value the form is actually holding is just the userId. If
        // the accepted payload parses, render the userId only. If the
        // payload parses but is a mismatch (validator rejected), we
        // won't be in this branch because _rejectScan clears qrCodes.
        List<String> displayQrCodes;
        if (isThisScanner && state.qrCodes.isNotEmpty) {
          final identityPayload = state.qrCodes.length == 1
              ? _tryParseIdentityPayload(state.qrCodes.first)
              : null;
          displayQrCodes = identityPayload != null
              ? [identityPayload['userId'] as String]
              : state.qrCodes;
        } else if (!isBarcodeData && hasFormValue) {
          displayQrCodes = formValue
              .split(',')
              .map((e) => e.trim())
              .where((e) => e.isNotEmpty)
              .toList();
        } else {
          displayQrCodes = <String>[];
        }

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

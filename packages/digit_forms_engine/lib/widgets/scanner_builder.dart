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
          form.control(formControlName).value = state.qrCodes.join(', ');
        } else if (state.barCodes.isNotEmpty) {
          // Store all barcodes, separated by semicolon
          // Each barcode is stored as: GTIN,SERIAL,BATCH,EXPIRY
          final barcodeStrings = <String>[];
          for (int i = 0; i < state.barCodes.length; i++) {
            final gs1Data = DigitScannerUtils()
                .getGs1CodeFormattedStringAtIndex(state.barCodes, i);

            // Convert GS1 map to comma-separated string in order: GTIN, SERIAL, BATCH, EXPIRY
            final gtin = gs1Data['01']?.toString() ?? '';
            final serial = gs1Data['21']?.toString() ?? '';
            final batch = gs1Data['10']?.toString() ?? '';
            final expiry = gs1Data['17'] is DateTime
                ? DateFormat('dd MMM yyyy').format(gs1Data['17'])
                : gs1Data['17']?.toString() ?? '';

            barcodeStrings.add('$gtin,$serial,$batch,$expiry');
          }
          // Join multiple barcodes with semicolon separator
          form.control(formControlName).value = barcodeStrings.join(';');
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
          final stateValue = state.qrCodes.join(', ');
          if (formValue != stateValue) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              form.control(formControlName).value = stateValue;
            });
          }
        } else if (isThisScanner && state.barCodes.isNotEmpty) {
          // Sync barcodes - build expected form value and compare
          final barcodeStrings = <String>[];
          for (int i = 0; i < state.barCodes.length; i++) {
            final gs1Data = DigitScannerUtils()
                .getGs1CodeFormattedStringAtIndex(state.barCodes, i);
            final gtin = gs1Data['01']?.toString() ?? '';
            final serial = gs1Data['21']?.toString() ?? '';
            final batch = gs1Data['10']?.toString() ?? '';
            final expiry = gs1Data['17'] is DateTime
                ? DateFormat('dd MMM yyyy').format(gs1Data['17'])
                : gs1Data['17']?.toString() ?? '';
            barcodeStrings.add('$gtin,$serial,$batch,$expiry');
          }
          final stateValue = barcodeStrings.join(';');
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
        // Single barcode: GTIN,SERIAL,BATCH,EXPIRY (4 comma-separated parts)
        // Multiple barcodes: barcode1;barcode2;barcode3 (semicolon-separated)
        bool isGS1BarcodeFormat(String value) {
          // Check for multiple barcodes (semicolon-separated)
          if (value.contains(';')) {
            final barcodes = value.split(';');
            // Check if first barcode has 4 parts
            final firstParts =
                barcodes.first.split(',').map((e) => e.trim()).toList();
            return firstParts.length == 4;
          }
          // Single barcode check
          final parts = value.split(',').map((e) => e.trim()).toList();
          // GS1 barcodes have exactly 4 parts
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
                            // Fall back to parsing form value (multiple barcodes separated by ;)
                            : () {
                                final barcodeStrings = formValue!.split(';');
                                final widgets = <Widget>[];
                                for (int i = 0;
                                    i < barcodeStrings.length;
                                    i++) {
                                  final parts = barcodeStrings[i].split(',');
                                  final items = <LabelValueItem>[];
                                  if (parts.isNotEmpty &&
                                      parts[0].trim().isNotEmpty) {
                                    items.add(LabelValueItem(
                                      labelFlex: 5,
                                      label: "GS1_01",
                                      value: parts[0].trim(),
                                      maxLines: 5,
                                    ));
                                  }
                                  if (parts.length > 1 &&
                                      parts[1].trim().isNotEmpty) {
                                    items.add(LabelValueItem(
                                      labelFlex: 5,
                                      label: "GS1_21",
                                      value: parts[1].trim(),
                                      maxLines: 5,
                                    ));
                                  }
                                  if (parts.length > 2 &&
                                      parts[2].trim().isNotEmpty) {
                                    items.add(LabelValueItem(
                                      labelFlex: 5,
                                      label: "GS1_10",
                                      value: parts[2].trim(),
                                      maxLines: 5,
                                    ));
                                  }
                                  if (parts.length > 3 &&
                                      parts[3].trim().isNotEmpty) {
                                    items.add(LabelValueItem(
                                      labelFlex: 5,
                                      label: "GS1_17",
                                      value: parts[3].trim(),
                                      maxLines: 5,
                                    ));
                                  }
                                  widgets.add(Padding(
                                    padding: EdgeInsets.only(
                                      bottom: i < barcodeStrings.length - 1
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
                        context.router.push(DigitScannerRoute(
                          validations: _toScannerValidations(),
                          isGS1code: true,
                          isEditEnabled: true,
                          initialBarcodeData: formValue,
                          scannerId: formControlName,
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
                            context.router.push(DigitScannerRoute(
                              validations: _toScannerValidations(),
                              isEditEnabled: true,
                              initialQrCodes: displayQrCodes,
                              scannerId: formControlName,
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
                      context.router.push(DigitScannerRoute(
                        validations: _toScannerValidations(),
                        scannerId: formControlName,
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

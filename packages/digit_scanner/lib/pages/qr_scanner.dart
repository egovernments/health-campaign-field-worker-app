import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:digit_scanner/models/scanner_validation.dart';
import 'package:digit_scanner/utils/scanner_utils.dart';
import 'package:digit_scanner/widgets/localized.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/TextTheme/digit_text_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../blocs/scanner.dart';
import '../widgets/vision_detector_views/detector_view.dart';

@RoutePage()
class DigitScannerPage extends LocalizedStatefulWidget {
  // Legacy parameters - kept for backward compatibility
  final bool singleValue;
  final int quantity;
  final bool isGS1code;
  final bool isEditEnabled;
  final String? regex;

  // New validations parameter - when provided, takes precedence over legacy params
  final List<ScannerValidation>? validations;

  // Initial data for edit mode - pass existing scanned codes
  final List<String>? initialQrCodes;

  // Initial barcode data for edit mode - pass existing GS1 barcode as formatted string (GTIN,SERIAL,BATCH,EXPIRY)
  final String? initialBarcodeData;

  /// Identifier for which scanner field initiated this scan.
  /// Used to prevent multiple scanner fields from reacting to the same state change.
  final String scannerId;

  /// Per-scan duplicate check callback. Returns true if the scanned value is a duplicate.
  final Future<bool> Function(String scannedValue)? duplicateCheckFn;

  /// Error message for duplicate detection (localization key)
  final String? duplicateCheckMessage;

  const DigitScannerPage({
    super.key,
    super.appLocalizations,
    this.quantity = 1,
    this.isGS1code = false,
    this.singleValue = false,
    this.isEditEnabled = false,
    this.regex,
    this.validations,
    this.initialQrCodes,
    this.initialBarcodeData,
    this.scannerId = 'default',
    this.duplicateCheckFn,
    this.duplicateCheckMessage,
  });

  /// Gets the effective quantity - from validations if available, otherwise from legacy param
  int get effectiveQuantity {
    if (validations != null && validations!.any((v) => v.type == 'scanLimit')) {
      return validations.scanLimit;
    }
    return quantity;
  }

  /// Gets the effective isGS1code - from validations if available, otherwise from legacy param
  bool get effectiveIsGS1code {
    if (validations != null && validations!.any((v) => v.type == 'isGS1')) {
      return validations.isGS1;
    }
    return isGS1code;
  }

  /// Gets the effective singleValue - from validations if available, otherwise from legacy param
  bool get effectiveSingleValue {
    if (validations != null && validations!.any((v) => v.type == 'scanLimit')) {
      return validations.isSingleValue;
    }
    return singleValue;
  }

  /// Gets the effective regex - from validations if available, otherwise from legacy param
  String? get effectiveRegex {
    if (validations != null && validations!.any((v) => v.type == 'pattern')) {
      return validations.pattern;
    }
    return regex;
  }

  /// Gets the scan limit exceeded message from validations
  String? get scanLimitMessage => validations?.scanLimitMessage;

  /// Gets the pattern validation message from validations
  String? get patternMessage => validations?.patternMessage;

  @override
  State<DigitScannerPage> createState() => DigitScannerPageState();
}

class DigitScannerPageState extends LocalizedState<DigitScannerPage>
    with WidgetsBindingObserver {
  final BarcodeScanner _barcodeScanner = BarcodeScanner();
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  var _cameraLensDirection = CameraLensDirection.back;
  AudioPlayer player = AudioPlayer();
  CameraController? _cameraController;
  static List<CameraDescription> _cameras = [];
  int _cameraIndex = -1;
  List<GS1Barcode> result = [];
  List<GS1Barcode> _originalBarcodes = [];
  List<String> codes = [];
  bool manualCode = false;
  bool flashStatus = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool _isPermissionDialogShowing = false;
  bool _waitingForPermissionFromSettings = false;
  static const _manualGtinFormKey = 'gtinCode';
  static const _manualCodeFormKey = 'manualCode';
  static const _manualSerialNoFormKey = 'serialNoCode';
  static const _manualExpiryDateFormKey = 'expiryDate';

  /// Safely parses DateTime from form control value
  /// Handles String, DateTime, int (milliseconds), and null values
  DateTime _parseExpiryDate(dynamic value) {
    // If already a DateTime, return it
    if (value is DateTime) return value;

    // If it's a String, try to parse with different formats
    if (value is String) {
      final trimmed = value.trim();
      if (trimmed.isEmpty) return DateTime.now();

      // Try common date formats
      final formats = [
        "dd/MM/yyyy",
        "dd/MM/yy",
        "dd MMM yyyy",
        "yyyy-MM-dd",
        "MM/dd/yyyy",
      ];

      for (final format in formats) {
        try {
          return DateFormat(format).parse(trimmed);
        } catch (_) {
          // Try next format
        }
      }

      // Try ISO8601 as fallback
      try {
        return DateTime.parse(trimmed);
      } catch (_) {
        debugPrint('Failed to parse date string: $trimmed');
        return DateTime.now();
      }
    }

    // If it's an int, treat as milliseconds since epoch
    if (value is int) {
      try {
        return DateTime.fromMillisecondsSinceEpoch(value);
      } catch (_) {
        debugPrint('Failed to parse date from milliseconds: $value');
        return DateTime.now();
      }
    }

    // For any other type or null, return current date
    debugPrint('Unexpected date type: ${value.runtimeType}');
    return DateTime.now();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkAndRequestCameraPermission();
    if (!widget.isEditEnabled) {
      // Clear scanner state for new scan
      context
          .read<DigitScannerBloc>()
          .add(DigitScannerEvent.handleScanner(scannerId: widget.scannerId));
    } else if (widget.initialQrCodes != null &&
        widget.initialQrCodes!.isNotEmpty) {
      // Initialize with existing QR code data for edit mode
      codes = List.from(widget.initialQrCodes!);
      // Dispatch after BlocConsumer subscribes to ensure it sees the state change
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          context.read<DigitScannerBloc>().add(
                DigitScannerEvent.handleScanner(
                  qrCode: widget.initialQrCodes!,
                  barCode: [],
                  scannerId: widget.scannerId,
                ),
              );
        }
      });
    } else if (widget.initialBarcodeData != null &&
        widget.initialBarcodeData!.isNotEmpty) {
      // Initialize with existing barcode (GS1) data for edit mode
      // Supports both new format (key:value|key:value) and legacy format (gtin,serial,batch,expiry)
      try {
        final parser = GS1BarcodeParser.defaultParser();
        final parsedBarcodes = <GS1Barcode>[];
        final deserializedMaps = DigitScannerUtils.deserializeGs1Barcodes(
            widget.initialBarcodeData!);

        for (final map in deserializedMaps) {
          final gtin = map['01'] ?? '';
          final serial = map['21'] ?? '';
          final batch = map['10'] ?? '';
          final expiryStr = map['17'] ?? '';

          DateTime expiryDate;
          if (expiryStr.isNotEmpty) {
            try {
              expiryDate = DateFormat('dd MMM yyyy').parse(expiryStr);
            } catch (_) {
              expiryDate = DateTime.now().add(const Duration(days: 365));
            }
          } else {
            expiryDate = DateTime.now().add(const Duration(days: 365));
          }

          final barcodeString = DigitScannerUtils().generateGS1Barcode(
            serialNumber: serial,
            expiryDate: expiryDate,
            batchNumber: batch,
            gtin: gtin,
          );

          parsedBarcodes.add(parser.parse(barcodeString));
        }

        if (parsedBarcodes.isNotEmpty) {
          result = parsedBarcodes;
          _originalBarcodes = List.from(parsedBarcodes);
          // Dispatch after BlocConsumer subscribes to ensure it sees the state change
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              context.read<DigitScannerBloc>().add(
                    DigitScannerEvent.handleScanner(
                      qrCode: [],
                      barCode: parsedBarcodes,
                      scannerId: widget.scannerId,
                    ),
                  );
            }
          });
        }
      } catch (e) {
        debugPrint('Error parsing initial barcode data: $e');
        result = [];
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed &&
        _waitingForPermissionFromSettings) {
      _waitingForPermissionFromSettings = false;
      _recheckPermissionAfterSettings();
    }
  }

  Future<void> _recheckPermissionAfterSettings() async {
    final status = await Permission.camera.status;
    if (mounted) {
      if (status.isGranted) {
        initializeCameras();
      } else if (status.isPermanentlyDenied || status.isDenied) {
        _showPermissionSettingsDialog();
      }
    }
  }

  Future<void> _checkAndRequestCameraPermission() async {
    final status = await Permission.camera.status;

    if (status.isGranted) {
      initializeCameras();
    } else if (status.isDenied) {
      // Request permission
      final result = await Permission.camera.request();
      if (result.isGranted) {
        initializeCameras();
      } else if (result.isPermanentlyDenied) {
        _showPermissionSettingsDialog();
      }
    } else if (status.isPermanentlyDenied) {
      // Permission permanently denied, show dialog to open settings
      _showPermissionSettingsDialog();
    }
  }

  Future<void> _showPermissionSettingsDialog() async {
    if (!mounted || _isPermissionDialogShowing) return;
    _isPermissionDialogShowing = true;
    await showCustomPopup(
      context: context,
      builder: (popupContext) => Popup(
        title: localizations.translate(i18.scanner.cameraPermissionDenied),
        description:
            localizations.translate(i18.scanner.cameraPermissionDeniedDesc),
        type: PopUpType.alert,
        inlineActions: true,
        actions: [
          DigitButton(
            label: localizations.translate(i18.scanner.openSettings),
            onPressed: () {
              Navigator.of(popupContext, rootNavigator: true).pop();
              _isPermissionDialogShowing = false;
              _waitingForPermissionFromSettings = true;
              openAppSettings();
            },
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
          ),
          DigitButton(
            label: localizations.translate(i18.common.coreCommonGoback),
            onPressed: () {
              Navigator.of(popupContext, rootNavigator: true).pop();
              _isPermissionDialogShowing = false;
              if (widget.isEditEnabled &&
                  widget.initialQrCodes != null &&
                  widget.initialQrCodes!.isNotEmpty) {
                // Restore initial QR values when canceling edit
                context.read<DigitScannerBloc>().add(
                      DigitScannerEvent.handleScanner(
                        qrCode: widget.initialQrCodes!,
                        barCode: [],
                        scannerId: widget.scannerId,
                      ),
                    );
              } else if (widget.isEditEnabled && _originalBarcodes.isNotEmpty) {
                // Restore initial barcode values when canceling edit
                context.read<DigitScannerBloc>().add(
                      DigitScannerEvent.handleScanner(
                        qrCode: [],
                        barCode: _originalBarcodes,
                        scannerId: widget.scannerId,
                      ),
                    );
              } else {
                context.read<DigitScannerBloc>().add(
                      DigitScannerEvent.handleScanner(
                        barCode: [],
                        qrCode: [],
                        scannerId: widget.scannerId,
                      ),
                    );
              }
              Navigator.of(context).pop();
            },
            type: DigitButtonType.secondary,
            size: DigitButtonSize.large,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: BlocConsumer<DigitScannerBloc, DigitScannerState>(
        listener: (context, state) {
          if (state.error != null &&
              (state.error?.toString() ?? '').trim().isNotEmpty) {
            Toast.showToast(
              context,
              type: ToastType.error,
              message: localizations.translate(state.error.toString()),
              sentenceCaseEnabled: false,
            );
            context.read<DigitScannerBloc>().add(
                  DigitScannerEvent.handleScanner(
                      barCode: [], qrCode: [], scannerId: widget.scannerId),
                );
          }
        },
        builder: (context, state) {
          return _cameras.isNotEmpty
              ? !manualCode
                  ? scanWidget(context, theme, textTheme, state)
                  : manualEntryWidget(context, theme, textTheme)
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    await DigitScannerUtils().processImage(
      context: context,
      inputImage: inputImage,
      canProcess: _canProcess,
      isBusy: _isBusy,
      setBusy: (busy) => mounted ? setState(() => _isBusy = busy) : null,
      setText: (text) => mounted ? setState(() => _text = text) : null,
      updateCustomPaint: (customPaint) => _customPaint = customPaint,
      isGS1code: widget.effectiveIsGS1code,
      quantity: widget.effectiveQuantity,
      result: result,
      handleError: handleErrorWrapper,
      storeValue: storeValueWrapper,
      storeCode: storeCodeWrapper,
      cameraLensDirection: _cameraLensDirection,
      barcodeScanner: _barcodeScanner,
      localizations: localizations,
      scanLimitMessage: widget.scanLimitMessage,
      regex: widget.effectiveRegex,
      patternMessage: widget.patternMessage,
      duplicateCheckFn: widget.duplicateCheckFn,
      duplicateCheckMessage: widget.duplicateCheckMessage,
    );
  }

  Future<void> handleErrorWrapper(String message) async {
    await DigitScannerUtils().handleError(
      context: context,
      message: message,
      player: player,
      result: result,
      setStateCallback: () {
        setState(() {
          _canProcess = true;
          _isBusy = false;
        });
      },
      localizations: localizations,
    );
  }

  Future<void> storeCodeWrapper(String code) async {
    await DigitScannerUtils().storeCode(
      context: context,
      code: code,
      player: player,
      singleValue: widget.effectiveSingleValue,
      updateCodes: (newCodes) {
        setState(() {
          codes = newCodes;
        });
      },
      initialCodes: codes,
    );
  }

  Future<void> storeValueWrapper(GS1Barcode scanData) async {
    await DigitScannerUtils().storeValue(
      context: context,
      scanData: scanData,
      player: player,
      updateResult: (newResult) {
        setState(() {
          result = newResult;
        });
      },
      initialResult: result,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _cameraController?.dispose();
    _barcodeScanner.close();
    _cameras = [];
    super.dispose();
  }

  void initializeCameras() async {
    if (_cameras.isEmpty) {
      _cameras = await availableCameras();
    }
    for (var i = 0; i < _cameras.length; i++) {
      if (_cameras[i].lensDirection == _cameraLensDirection) {
        setState(() {
          _cameraIndex = i;
        });
        break;
      }
    }
    var camera = _cameras[_cameraIndex];
    _cameraController = CameraController(
      camera,
      // Set to ResolutionPreset.high. Do NOT set it to ResolutionPreset.max because for some phones does NOT work.
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );
  }

  FormGroup buildForm() {
    if (widget.effectiveIsGS1code) {
      return fb.group(<String, Object>{
        _manualGtinFormKey: FormControl<String>(
          validators: [
            Validators.required,
            Validators.pattern(r'^\d{14}$'),
          ],
        ),
        _manualCodeFormKey: FormControl<String>(
          validators: [Validators.required],
        ),
        _manualSerialNoFormKey: FormControl<String>(),
        _manualExpiryDateFormKey: FormControl<DateTime>(
          validators: [Validators.required],
        ),
      });
    } else {
      return fb
          .group(<String, Object>{_manualCodeFormKey: FormControl<String>()});
    }
  }

  manualEntryWidget(
      BuildContext context, ThemeData theme, DigitTextTheme textTheme) {
    return widget.effectiveIsGS1code
        ? BlocBuilder<DigitScannerBloc, DigitScannerState>(
            builder: (context, state) {
            return ReactiveFormBuilder(
                form: () => buildForm(),
                builder: (context, form, child) {
                  return ScrollableContent(
                    backgroundColor: theme.colorScheme.onError,
                    header: GestureDetector(
                      onTap: () {
                        setState(() {
                          manualCode = false;
                          initializeCameras();
                        });
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.close,
                          color: Theme.of(context).colorTheme.text.primary,
                        ),
                      ),
                    ),
                    footer: Padding(
                      padding: const EdgeInsets.all(spacer4),
                      child: DigitButton(
                        mainAxisSize: MainAxisSize.max,
                        onPressed: () async {
                          if (widget.effectiveIsGS1code) {
                            form.markAllAsTouched();
                            if (!form.valid) return;

                            final bloc = context.read<DigitScannerBloc>();

                            try {
                              final gtinValue = form
                                  .control(_manualGtinFormKey)
                                  .value
                                  ?.toString()
                                  .trim();
                              final serialValue = form
                                  .control(_manualSerialNoFormKey)
                                  .value
                                  ?.toString()
                                  .trim();
                              final barcodeString =
                                  DigitScannerUtils().generateGS1Barcode(
                                gtin: gtinValue,
                                serialNumber: serialValue,
                                expiryDate: _parseExpiryDate(form
                                    .control(_manualExpiryDateFormKey)
                                    .value),
                                batchNumber: form
                                    .control(_manualCodeFormKey)
                                    .value
                                    .toString()
                                    .trim(),
                              );

                              // Now parse it using your existing model
                              final parser = GS1BarcodeParser.defaultParser();
                              final parsed = parser.parse(barcodeString);
                              // ✅ Append to existing barcodes; DO NOT touch qrCodes in GS1 mode
                              // Use local result as fallback when bloc state is empty
                              final existingBarcodes = state.barCodes.isNotEmpty
                                  ? state.barCodes
                                  : result;

                              // Per-scan duplicate check
                              if (widget.duplicateCheckFn != null) {
                                try {
                                  final serialized = DigitScannerUtils()
                                      .serializeGs1Barcodes([parsed]);
                                  final isDuplicate =
                                      await widget.duplicateCheckFn!(
                                          serialized);
                                  if (isDuplicate) {
                                    Toast.showToast(
                                      context,
                                      type: ToastType.error,
                                      message: localizations.translate(
                                          widget.duplicateCheckMessage ??
                                              i18.scanner
                                                  .resourceAlreadyScanned),
                                      sentenceCaseEnabled: false,
                                    );
                                    return;
                                  }
                                } catch (_) {
                                  Toast.showToast(
                                    context,
                                    type: ToastType.error,
                                    message: localizations.translate(
                                        i18.scanner.duplicateCheckFailed),
                                    sentenceCaseEnabled: false,
                                  );
                                  return;
                                }
                              }

                              // Check if barcode already scanned
                              // Compare full serialized form (all AI elements)
                              // to avoid false positives when serial number is
                              // optional and the last AI varies.
                              final newSerialized = DigitScannerUtils()
                                  .serializeGs1Barcodes([parsed]);
                              final alreadyScanned =
                                  existingBarcodes.any((element) {
                                final existingSerialized = DigitScannerUtils()
                                    .serializeGs1Barcodes([element]);
                                return existingSerialized == newSerialized;
                              });

                              if (alreadyScanned) {
                                Toast.showToast(
                                  context,
                                  type: ToastType.error,
                                  message: localizations.translate(
                                      i18.scanner.resourceAlreadyScanned),
                                  sentenceCaseEnabled: false,
                                );
                                return;
                              }

                              // Check scan limit before adding
                              if (existingBarcodes.length >=
                                  widget.effectiveQuantity) {
                                Toast.showToast(
                                  context,
                                  type: ToastType.error,
                                  message: widget.scanLimitMessage != null
                                      ? localizations
                                          .translate(widget.scanLimitMessage!)
                                      : localizations.translate(
                                          i18.scanner.scannedQtyExceed),
                                  sentenceCaseEnabled: false,
                                );
                                return;
                              }

                              final updatedBarcodes =
                                  List<GS1Barcode>.from(existingBarcodes)
                                    ..add(parsed);

                              // Keep local mirror in sync (used by UI)
                              setState(() {
                                result = updatedBarcodes;
                                manualCode = false;
                              });

                              bloc.add(
                                DigitScannerEvent.handleScanner(
                                  barCode: updatedBarcodes,
                                  qrCode: state.qrCodes,
                                  regex: widget.effectiveRegex,
                                  patternMessage: widget.patternMessage,
                                  scannerId: widget.scannerId,
                                ),
                              );

                              initializeCameras();
                            } catch (e) {
                              debugPrint(
                                  'Error parsing manual GS1 barcode: $e');
                              Toast.showToast(
                                context,
                                type: ToastType.error,
                                message: localizations
                                    .translate(i18.scanner.resourcesScanFailed),
                                sentenceCaseEnabled: false,
                              );
                            }
                          } else {
                            if (form.control(_manualCodeFormKey).value ==
                                    null ||
                                form
                                    .control(_manualCodeFormKey)
                                    .value
                                    .toString()
                                    .trim()
                                    .isEmpty) {
                              Toast.showToast(
                                context,
                                type: ToastType.error,
                                message: localizations
                                    .translate(i18.scanner.enterManualCode),
                              );
                            } else {
                              final manualValue = form
                                  .control(_manualCodeFormKey)
                                  .value
                                  .toString()
                                  .trim();
                              final bloc = context.read<DigitScannerBloc>();

                              // Per-scan duplicate check
                              if (widget.duplicateCheckFn != null) {
                                try {
                                  final isDuplicate =
                                      await widget.duplicateCheckFn!(
                                          manualValue);
                                  if (isDuplicate) {
                                    Toast.showToast(
                                      context,
                                      type: ToastType.error,
                                      message: localizations.translate(
                                          widget.duplicateCheckMessage ??
                                              i18.scanner
                                                  .resourceAlreadyScanned),
                                      sentenceCaseEnabled: false,
                                    );
                                    return;
                                  }
                                } catch (_) {
                                  Toast.showToast(
                                    context,
                                    type: ToastType.error,
                                    message: localizations.translate(
                                        i18.scanner.duplicateCheckFailed),
                                    sentenceCaseEnabled: false,
                                  );
                                  return;
                                }
                              }

                              // Check if QR code already scanned
                              final existingQrCodes = state.qrCodes.isNotEmpty
                                  ? state.qrCodes
                                  : codes;
                              if (existingQrCodes.contains(manualValue)) {
                                Toast.showToast(
                                  context,
                                  type: ToastType.error,
                                  message: localizations.translate(
                                      i18.scanner.resourceAlreadyScanned),
                                  sentenceCaseEnabled: false,
                                );
                                return;
                              }

                              final updatedQRCodes =
                                  List<String>.from(state.qrCodes)
                                    ..add(manualValue);

                              codes.add(manualValue);
                              bloc.add(
                                DigitScannerEvent.handleScanner(
                                    barCode: state.barCodes,
                                    qrCode: updatedQRCodes,
                                    regex: widget.effectiveRegex,
                                    patternMessage: widget.patternMessage,
                                    scannerId: widget.scannerId),
                              );
                              final scannedCount = widget.effectiveIsGS1code
                                  ? state.barCodes.length
                                  : state.qrCodes.length;

                              if (scannedCount < widget.effectiveQuantity) {
                                DigitScannerUtils().buildDialog(context,
                                    localizations, widget.effectiveQuantity);
                              }

                              setState(() {
                                manualCode = false;
                                initializeCameras();
                              });
                            }
                          }

//
                        },
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large,
                        label: localizations.translate(
                          i18.common.coreCommonSubmit,
                        ),
                      ),
                    ),
                    children: [
                      DigitCard(
                        margin: const EdgeInsets.all(spacer2),
                        cardType: CardType.secondary,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              localizations.translate(
                                i18.scanner.enterManualCode,
                              ),
                              style: textTheme.headingL.copyWith(
                                color: theme.colorTheme.text.primary,
                              ),
                            ),
                          ),
                          if (widget.effectiveIsGS1code)
                            ReactiveWrapperField(
                              formControlName: _manualGtinFormKey,
                              validationMessages: {
                                'required': (object) =>
                                    localizations.translate(
                                      i18.scanner.gtinRequired,
                                    ),
                                'pattern': (object) =>
                                    localizations.translate(
                                      i18.scanner.gtinPatternError,
                                    ),
                              },
                              builder: (field) {
                                return LabeledField(
                                  label: localizations.translate(
                                    i18.scanner.barCodeGtin,
                                  ),
                                  capitalizedFirstLetter: false,
                                  child: DigitTextFormInput(
                                      errorMessage: field.errorText,
                                      isRequired: true,
                                      onChange: (value) {
                                        form.control(_manualGtinFormKey).value =
                                            value;
                                      }),
                                );
                              },
                            ),
                          ReactiveWrapperField(
                            formControlName: _manualCodeFormKey,
                            validationMessages: widget.effectiveIsGS1code
                                ? {
                                    'required': (object) =>
                                        localizations.translate(
                                          i18.scanner.batchNoRequired,
                                        ),
                                  }
                                : null,
                            builder: (field) {
                              return LabeledField(
                                label: localizations.translate(
                                  widget.effectiveIsGS1code
                                      ? i18.scanner.barCodeBatch
                                      : i18.scanner.resourceCode,
                                ),
                                capitalizedFirstLetter: false,
                                child: DigitTextFormInput(
                                    errorMessage: field.errorText,
                                    isRequired: true,
                                    onChange: (value) {
                                      form.control(_manualCodeFormKey).value =
                                          value;
                                    }),
                              );
                            },
                          ),
                          if (widget.effectiveIsGS1code) ...[
                            ReactiveWrapperField(
                              formControlName: _manualSerialNoFormKey,
                              builder: (field) {
                                return LabeledField(
                                  label: localizations.translate(
                                    i18.scanner.barCodeSerial,
                                  ),
                                  capitalizedFirstLetter: false,
                                  child: DigitTextFormInput(
                                      errorMessage: field.errorText,
                                      isRequired: false,
                                      onChange: (value) {
                                        form
                                            .control(_manualSerialNoFormKey)
                                            .value = value;
                                      }),
                                );
                              },
                            ),
                            ReactiveWrapperField(
                                formControlName: _manualExpiryDateFormKey,
                                validationMessages: {
                                  'required': (object) =>
                                      localizations.translate(
                                        i18.scanner.expiryDateRequired,
                                      ),
                                },
                                builder: (field) {
                                  return LabeledField(
                                    label: localizations
                                        .translate(i18.scanner.barCodeExpiry),
                                    capitalizedFirstLetter: false,
                                    child: DigitDateFormInput(
                                      firstDate: DateTime.now(),
                                      isRequired: true,
                                      confirmText: localizations.translate(
                                        i18.common.coreCommonOk,
                                      ),
                                      cancelText: localizations.translate(
                                        i18.common.coreCommonCancel,
                                      ),
                                      initialValue: DateFormat('dd/MM/yyyy')
                                          .format(_parseExpiryDate(
                                              field.control.value)),
                                      readOnly: false,
                                      onChange: (value) {
                                        try {
                                          form
                                              .control(_manualExpiryDateFormKey)
                                              .value = DateFormat(
                                                  "dd/MM/yyyy")
                                              .parse(value);
                                        } catch (e) {
                                          debugPrint('Error parsing date: $e');
                                          form
                                              .control(_manualExpiryDateFormKey)
                                              .value = DateTime.now();
                                        }
                                      },
                                    ),
                                  );
                                }),
                          ],
                        ],
                      ),
                    ],
                  );
                });
          })
        : BlocBuilder<DigitScannerBloc, DigitScannerState>(
            builder: (context, state) {
            return ReactiveFormBuilder(
                form: () => buildForm(),
                builder: (context, form, child) {
                  return ScrollableContent(
                    backgroundColor: theme.colorScheme.onError,
                    header: GestureDetector(
                      onTap: () {
                        setState(() {
                          manualCode = false;
                          initializeCameras();
                        });
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.close,
                          color: Theme.of(context).colorTheme.text.primary,
                        ),
                      ),
                    ),
                    footer: Padding(
                      padding: const EdgeInsets.all(spacer4),
                      child: DigitButton(
                        mainAxisSize: MainAxisSize.max,
                        onPressed: () async {
                          if (form.control(_manualCodeFormKey).value == null ||
                              form
                                  .control(_manualCodeFormKey)
                                  .value
                                  .toString()
                                  .trim()
                                  .isEmpty) {
                            Toast.showToast(
                              context,
                              type: ToastType.error,
                              message: localizations
                                  .translate(i18.scanner.enterManualCode),
                              sentenceCaseEnabled: false,
                            );
                          } else {
                            final manualValue = form
                                .control(_manualCodeFormKey)
                                .value
                                .toString()
                                .trim();
                            final bloc = context.read<DigitScannerBloc>();

                            // Per-scan duplicate check
                            if (widget.duplicateCheckFn != null) {
                              try {
                                final isDuplicate =
                                    await widget.duplicateCheckFn!(manualValue);
                                if (isDuplicate) {
                                  Toast.showToast(
                                    context,
                                    type: ToastType.error,
                                    message: localizations.translate(
                                        widget.duplicateCheckMessage ??
                                            i18.scanner
                                                .resourceAlreadyScanned),
                                    sentenceCaseEnabled: false,
                                  );
                                  return;
                                }
                              } catch (_) {
                                Toast.showToast(
                                  context,
                                  type: ToastType.error,
                                  message: localizations.translate(
                                      i18.scanner.duplicateCheckFailed),
                                  sentenceCaseEnabled: false,
                                );
                                return;
                              }
                            }

                            // Use local codes as fallback when bloc state is empty
                            final existingQrCodes = state.qrCodes.isNotEmpty
                                ? state.qrCodes
                                : codes;

                            // Check if QR code already scanned
                            if (existingQrCodes.contains(manualValue)) {
                              Toast.showToast(
                                context,
                                type: ToastType.error,
                                message: localizations.translate(
                                    i18.scanner.resourceAlreadyScanned),
                                sentenceCaseEnabled: false,
                              );
                              return;
                            }

                            // Check scan limit before adding
                            if (existingQrCodes.length >=
                                widget.effectiveQuantity) {
                              Toast.showToast(
                                context,
                                type: ToastType.error,
                                message: widget.scanLimitMessage != null
                                    ? localizations
                                        .translate(widget.scanLimitMessage!)
                                    : localizations.translate(
                                        i18.scanner.scannedQtyExceed),
                                sentenceCaseEnabled: false,
                              );
                              return;
                            }

                            final updatedQRCodes =
                                List<String>.from(existingQrCodes)
                                  ..add(manualValue);
                            codes = updatedQRCodes;
                            bloc.add(
                              DigitScannerEvent.handleScanner(
                                barCode: state.barCodes,
                                qrCode: updatedQRCodes,
                                regex: widget.effectiveRegex,
                                patternMessage: widget.patternMessage,
                                scannerId: widget.scannerId,
                              ),
                            );

                            setState(() {
                              manualCode = false;
                              initializeCameras();
                            });
                          }
                        },
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large,
                        label: localizations.translate(
                          i18.common.coreCommonSubmit,
                        ),
                      ),
                    ),
                    children: [
                      DigitCard(
                          margin: const EdgeInsets.all(spacer2),
                          cardType: CardType.secondary,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                localizations.translate(
                                  i18.scanner.enterManualCode,
                                ),
                                style: textTheme.headingL.copyWith(
                                  color: theme.colorTheme.text.primary,
                                ),
                              ),
                            ),
                            ReactiveWrapperField(
                              formControlName: _manualCodeFormKey,
                              builder: (field) {
                                return InputField(
                                    label: localizations.translate(
                                      i18.scanner.resourceCode,
                                    ),
                                    errorMessage: field.errorText,
                                    isRequired: true,
                                    type: InputType.text,
                                    onChange: (value) {
                                      form.control(_manualCodeFormKey).value =
                                          value;
                                    });
                              },
                            ),
                          ])
                    ],
                  );
                });
          });
  }

  scanWidget(BuildContext context, ThemeData theme, DigitTextTheme textTheme,
      DigitScannerState state) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
          child: DetectorView(
            cameraController: _cameraController,
            cameras: _cameras,
            title: localizations.translate(i18.scanner.barCodeScannerLabel),
            customPaint: _customPaint,
            text: _text,
            onImage: processImage,
            initialCameraLensDirection: _cameraLensDirection,
            onCameraLensDirectionChanged: (value) =>
                _cameraLensDirection = value,
            onBackButtonPressed: () {
              if (widget.isEditEnabled &&
                  widget.initialQrCodes != null &&
                  widget.initialQrCodes!.isNotEmpty) {
                // Restore initial QR values when canceling edit
                context.read<DigitScannerBloc>().add(
                      DigitScannerEvent.handleScanner(
                        qrCode: widget.initialQrCodes!,
                        barCode: [],
                        scannerId: widget.scannerId,
                      ),
                    );
              } else if (widget.isEditEnabled && _originalBarcodes.isNotEmpty) {
                // Restore initial barcode values when canceling edit
                context.read<DigitScannerBloc>().add(
                      DigitScannerEvent.handleScanner(
                        qrCode: [],
                        barCode: _originalBarcodes,
                        scannerId: widget.scannerId,
                      ),
                    );
              } else {
                context
                    .read<DigitScannerBloc>()
                    .add(DigitScannerEvent.handleScanner(
                      barCode: [],
                      qrCode: [],
                      scannerId: widget.scannerId,
                    ));
              }
              Navigator.of(context).pop();
            },
          ),
        ),
        Positioned(
          top: spacer1 * 1.5,
          left: spacer1,
          child: SizedBox(
            child: InkWell(
              onTap: () async {
                _cameraController?.setFlashMode(
                  flashStatus ? FlashMode.off : FlashMode.torch,
                );
                setState(() {
                  flashStatus = !flashStatus;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    flashStatus ? Icons.flashlight_off : Icons.flashlight_on,
                    color: theme.colorScheme.secondary,
                  ),
                  Text(
                    localizations.translate(
                      flashStatus ? i18.scanner.flashOff : i18.scanner.flashOn,
                    ),
                    style: TextStyle(
                      color: theme.colorScheme.secondary,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        // [TODO : Need move to constants]
        Padding(
          padding: const EdgeInsets.only(top: spacer12),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              localizations.translate(
                i18.scanner.scannerLabel,
              ),
              style: TextStyle(
                color: theme.colorScheme.onError,
                fontSize: 16,
              ),
            ),
          ),
        ),

        Center(
          child: overlayForManualEntry(theme, textTheme),
        ),

        renderScannedResource(theme, textTheme, state)
      ],
    );
  }

  overlayForManualEntry(ThemeData theme, DigitTextTheme textTheme) {
    return Align(
      alignment: Alignment.center,
      widthFactor: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: spacer8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: spacer1),
              child: Text(
                  localizations.translate(
                    i18.scanner.manualScan,
                  ),
                  style: textTheme.bodyL
                      .copyWith(color: theme.colorTheme.paper.primary)),
            ),
            DigitButton(
                label: localizations.translate(
                  i18.scanner.enterManualCode,
                ),
                onPressed: () {
                  setState(() {
                    manualCode = true;
                  });
                },
                type: DigitButtonType.link,
                size: DigitButtonSize.large)
          ],
        ),
      ),
    );
  }

  renderScannedResource(
      ThemeData theme, DigitTextTheme textTheme, DigitScannerState state) {
    // Use state.barCodes when available, fall back to local result list
    // This handles the case where bloc state hasn't updated yet but result is set in initState
    final effectiveBarcodes =
        state.barCodes.isNotEmpty ? state.barCodes : result;
    final effectiveQrCodes = state.qrCodes.isNotEmpty ? state.qrCodes : codes;
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          width: MediaQuery.of(context).size.width,
          child: DigitCard(
            margin: const EdgeInsets.only(top: spacer1),
            padding:
                const EdgeInsets.fromLTRB(spacer3, spacer1, spacer3, spacer1),
            children: [
              DigitButton(
                label: localizations.translate(i18.common.coreCommonSubmit),
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
                type: DigitButtonType.primary,
                onPressed: () async {
                  final scannedCount = widget.effectiveIsGS1code
                      ? effectiveBarcodes.length
                      : effectiveQrCodes.length;

                  if (scannedCount < widget.effectiveQuantity) {
                    DigitScannerUtils().buildDialog(
                      context,
                      localizations,
                      widget.effectiveQuantity,
                    );
                    return;
                  } else {
                    final bloc = context.read<DigitScannerBloc>();
                    bloc.add(DigitScannerEvent.handleScanner(
                      barCode: effectiveBarcodes,
                      qrCode: effectiveQrCodes,
                      scannerId: widget.scannerId,
                    ));
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
        Positioned(
          bottom: (spacer1 * 10),
          height: (widget.effectiveIsGS1code
                  ? (effectiveBarcodes.length * 160.0) + 80.0
                  : ((effectiveQrCodes.length + 1) * 60.0))
              .clamp(0.0, MediaQuery.of(context).size.height / 3),
          width: MediaQuery.of(context).size.width,
          child: Container(
            width: 100,
            height: 120,
            decoration: BoxDecoration(
              color: theme.colorScheme.onError,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(spacer1 + 4),
                topRight: Radius.circular(spacer1 + 4),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onError,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(spacer2),
                      topRight: Radius.circular(spacer2),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    bottom: spacer2,
                    top: spacer2,
                    left: spacer3,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: widget.effectiveIsGS1code
                      ? Text(
                          '${effectiveBarcodes.length.toString()} ${localizations.translate(i18.scanner.resourcesScanned)}',
                          style: textTheme.headingM
                              .copyWith(color: theme.colorTheme.text.primary),
                        )
                      : Text(
                          '${effectiveQrCodes.length.toString()} ${localizations.translate(i18.scanner.resourcesScanned)}',
                          style: textTheme.headingM
                              .copyWith(color: theme.colorTheme.text.primary),
                        ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.effectiveIsGS1code
                        ? effectiveBarcodes.length
                        : effectiveQrCodes.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (widget.effectiveIsGS1code) {
                        final gs1Data = DigitScannerUtils()
                            .getGs1CodeFormattedStringAtIndex(
                                effectiveBarcodes, index);
                        return ListTile(
                          shape: const Border(),
                          title: Container(
                            margin: const EdgeInsets.only(
                              left: spacer1,
                              right: spacer1,
                            ),
                            decoration: BoxDecoration(
                              color: DigitTheme.instance.colorScheme.surface,
                              border: Border.all(
                                color: DigitTheme.instance.colorScheme.outline,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4.0),
                              ),
                            ),
                            padding: const EdgeInsets.all(spacer2),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: gs1Data.entries.map((entry) {
                                      final label = localizations
                                          .translate('GS1_${entry.key}');
                                      final value = entry.value is DateTime
                                          ? DateFormat('dd MMM yyyy')
                                              .format(entry.value)
                                          : entry.value?.toString() ?? '';
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: spacer1),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              child: Text(
                                                label,
                                                style: textTheme.bodyS.copyWith(
                                                  color: theme.colorTheme.text
                                                      .secondary,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: spacer1),
                                            Expanded(
                                              child: Text(
                                                value,
                                                style: textTheme.bodyS.copyWith(
                                                  color: theme
                                                      .colorTheme.text.primary,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    Icons.delete,
                                    color: theme.colorScheme.error,
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    final bloc =
                                        context.read<DigitScannerBloc>();
                                    result = List.from(effectiveBarcodes);
                                    result.removeAt(index);
                                    setState(() {
                                      result = result;
                                    });
                                    bloc.add(
                                      DigitScannerEvent.handleScanner(
                                        barCode: result,
                                        qrCode: effectiveQrCodes,
                                        regex: widget.effectiveRegex,
                                        patternMessage: widget.patternMessage,
                                        scannerId: widget.scannerId,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      // QR code display
                      return ListTile(
                        shape: const Border(),
                        title: Container(
                          margin: const EdgeInsets.only(
                            left: spacer1,
                            right: spacer1,
                          ),
                          height: spacer9,
                          decoration: BoxDecoration(
                            color: DigitTheme.instance.colorScheme.surface,
                            border: Border.all(
                              color: DigitTheme.instance.colorScheme.outline,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                          padding: const EdgeInsets.all(spacer2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  DigitScannerUtils().trimString(
                                      effectiveQrCodes[index].toString()),
                                ),
                              ),
                              IconButton(
                                padding: const EdgeInsets.only(
                                  bottom: spacer2,
                                ),
                                icon: Icon(
                                  Icons.delete,
                                  color: theme.colorScheme.error,
                                  size: 24,
                                ),
                                onPressed: () {
                                  final bloc = context.read<DigitScannerBloc>();
                                  codes = List.from(effectiveQrCodes);
                                  codes.removeAt(index);
                                  setState(() {
                                    codes = codes;
                                  });
                                  bloc.add(
                                    DigitScannerEvent.handleScanner(
                                      barCode: effectiveBarcodes,
                                      qrCode: codes,
                                      regex: widget.effectiveRegex,
                                      patternMessage: widget.patternMessage,
                                      scannerId: widget.scannerId,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

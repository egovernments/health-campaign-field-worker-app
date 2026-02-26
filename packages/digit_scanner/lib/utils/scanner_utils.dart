import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:digit_scanner/blocs/app_localization.dart';
import 'package:digit_scanner/utils/extensions/extensions.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
import 'package:intl/intl.dart';

import '../blocs/scanner.dart';
import '../widgets/vision_detector_views/painters/barcode_detector_painter.dart';
import './i18_key_constants.dart' as i18;
import 'constants.dart';

class DigitScannerUtils {
  void buildDialog(
    BuildContext context,
    ScannerLocalization localizations,
    int quantity,
  ) async {
    var contentLocalization = localizations
        .translate(
          i18.scanner.scannerDialogContent,
        )
        .replaceAll('{quantity}', quantity.toString());
    await showCustomPopup(
      context: context,
      builder: (popupContext) => Popup(
        title: localizations.translate(
          i18.scanner.scannerDialogTitle,
        ),
        onOutsideTap: () {
          Navigator.of(popupContext).pop();
        },
        description: contentLocalization,
        type: PopUpType.simple,
        actions: [
          DigitButton(
            label: localizations.translate(
              i18.scanner.scannerDialogPrimaryAction,
            ),
            onPressed: () {
              Navigator.of(
                popupContext,
                rootNavigator: true,
              ).pop(false);
            },
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
          ),
          DigitButton(
            label: localizations.translate(
              i18.scanner.scannerDialogSecondaryAction,
            ),
            onPressed: () {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pop(true);

              Navigator.of(
                context,
              ).pop();
            },
            type: DigitButtonType.secondary,
            size: DigitButtonSize.large,
          ),
        ],
      ),
    );
  }

  String trimString(String input) {
    return input.length > 20 ? '${input.substring(0, 20)}...' : input;
  }

  Future<void> processImage({
    required BuildContext context,
    required InputImage inputImage,
    required bool canProcess,
    required bool isBusy,
    required Function setBusy,
    required Function setText,
    required Function updateCustomPaint,
    required bool isGS1code,
    required int quantity,
    required List<GS1Barcode> result,
    required Function handleError,
    required Function storeValue,
    required Function storeCode,
    required CameraLensDirection cameraLensDirection,
    required BarcodeScanner barcodeScanner,
    required ScannerLocalization localizations,
    String? scanLimitMessage,
    String? regex,
    String? patternMessage,
    Future<bool> Function(String scannedValue)? duplicateCheckFn,
    String? duplicateCheckMessage,
  }) async {
    // Check if processing is allowed
    if (!canProcess) return;

    // Check if another processing is in progress
    if (isBusy) return;

    setBusy(true);

    // Clear previous text state
    setText('');

    // Process the image to detect barcodes
    final List<Barcode> barcodes;

    try {
      barcodes = await barcodeScanner.processImage(inputImage);
    } catch (e) {
      debugPrint('Error processing image: $e');
      return;
    }

    // Check if the input image has valid metadata for size and rotation
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      // If barcodes are found
      if (barcodes.isNotEmpty) {
        final bloc = context.read<DigitScannerBloc>();

        // Check if the widget is scanning GS1 codes
        if (isGS1code) {
          try {
            // Parse the first barcode using GS1BarcodeParser
            final parser = GS1BarcodeParser.defaultParser();
            final parsedResult =
                parser.parse(barcodes.first.displayValue.toString());

            // Per-scan duplicate check
            if (duplicateCheckFn != null) {
              final serialized =
                  DigitScannerUtils().serializeGs1Barcodes([parsedResult]);
              final isDuplicate = await duplicateCheckFn(serialized);
              if (isDuplicate) {
                await handleError(duplicateCheckMessage ??
                    localizations
                        .translate(i18.scanner.resourceAlreadyScanned));
                return;
              }
            }

            // Check if the barcode has already been scanned
            final alreadyScanned = bloc.state.barCodes.any((element) {
              if (element.elements.entries.isEmpty ||
                  parsedResult.elements.entries.isEmpty) {
                return false;
              }
              return element.elements.entries.last.value.data ==
                  parsedResult.elements.entries.last.value.data;
            });

            if (alreadyScanned) {
              // Handle error if the barcode is already scanned
              await handleError(
                  localizations.translate(i18.scanner.resourceAlreadyScanned));
            } else if (regex != null &&
                regex.trim().isNotEmpty &&
                !RegExp(regex)
                    .hasMatch(barcodes.first.displayValue.toString())) {
              // Handle error if barcode doesn't match regex pattern
              final errorMsg = patternMessage != null
                  ? localizations.translate(patternMessage)
                  : localizations.translate(i18.scanner.invalidBarcode);
              await handleError(errorMsg);
            } else if (quantity > result.length) {
              // Store the parsed result if the quantity is greater than result length
              await storeValue(parsedResult);
            } else if (quantity <= result.length) {
              // Handle error if there is a mismatch in the scanned resource count
              // Use custom message from validations if provided
              final errorMessage = scanLimitMessage != null
                  ? localizations.translate(scanLimitMessage)
                  : localizations.translate(i18.scanner.scannedQtyExceed);
              await handleError(errorMessage);
            } else {
              // Handle error if there is a mismatch in the scanned resource
              await handleError(
                  localizations.translate(i18.scanner.invalidBarcode));
            }
          } catch (e) {
            // Handle error if parsing fails
            await handleError(
                localizations.translate(i18.scanner.resourcesScanFailed));
          }
        } else {
          // For non-GS1 codes
          // Per-scan duplicate check
          if (duplicateCheckFn != null) {
            final isDuplicate =
                await duplicateCheckFn(barcodes.first.displayValue.toString());
            if (isDuplicate) {
              await handleError(duplicateCheckMessage ??
                  localizations.translate(i18.scanner.resourceAlreadyScanned));
              return;
            }
          }

          if (bloc.state.qrCodes.contains(barcodes.first.displayValue)) {
            // Handle error if the QR code is already scanned
            await handleError(
                localizations.translate(i18.scanner.resourceAlreadyScanned));
            return;
          } else if (regex != null &&
              regex.trim().isNotEmpty &&
              !RegExp(regex).hasMatch(barcodes.first.displayValue.toString())) {
            // Handle error if QR code doesn't match regex pattern
            final errorMsg = patternMessage != null
                ? localizations.translate(patternMessage)
                : localizations.translate(i18.scanner.invalidBarcode);
            await handleError(errorMsg);
          } else if (quantity > bloc.state.qrCodes.length) {
            // Store the QR code if not already scanned and quantity limit not reached
            await storeCode(barcodes.first.displayValue.toString());
          } else {
            // Handle error if the quantity limit is reached
            // Use custom message from validations if provided
            final errorMessage = scanLimitMessage != null
                ? localizations.translate(scanLimitMessage)
                : localizations.translate(i18.scanner.scannedQtyExceed);
            await handleError(errorMessage);
          }
        }
      }

      // Create a custom painter to draw the detected barcodes
      final painter = BarcodeDetectorPainter(
        barcodes,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        cameraLensDirection,
      );
      updateCustomPaint(CustomPaint(painter: painter));
    } else {
      // Display the number of barcodes found and their raw values
      String text =
          '${localizations.translate(i18.scanner.barCodesFound)}: ${barcodes.length}\n\n';
      for (final barcode in barcodes) {
        text +=
            '${localizations.translate(i18.scanner.barCode)}: ${barcode.rawValue}\n\n';
      }
      setText(text);

      // TODO: set _customPaint to draw boundingRect on top of image
      updateCustomPaint(null);
    }

    // Mark the processing as complete
    setBusy(false);
  }

  Future<void> handleError({
    required BuildContext context,
    required String message,
    required AudioPlayer player,
    required List<dynamic> result,
    required Function setStateCallback,
    required ScannerLocalization localizations,
  }) async {
    // Play the buzzer sound to indicate an error
    player.play(AssetSource(DigitScannerConstants().errorFilePath));

    // Check if the player has completed playing or if the result list is empty
    if (player.state == PlayerState.completed || result.isEmpty) {
      // Display a toast message with the provided error message
      Toast.showToast(
        context,
        type: ToastType.error,
        message: localizations.translate(message),
        sentenceCaseEnabled: false,
      );
    }

    // Wait for 2 seconds before proceeding
    await Future.delayed(const Duration(seconds: 2));

    // Update the state to allow processing again and indicate not busy
    setStateCallback();
  }

  Future<void> storeCode({
    required BuildContext context,
    required String code,
    required AudioPlayer player,
    required bool singleValue,
    required Function(List<String>) updateCodes,
    required List<String> initialCodes,
  }) async {
    // Play the add sound to indicate a successful scan
    player.play(AssetSource(DigitScannerConstants().audioFilePath));

    // Access the DigitScannerBloc from the context
    final bloc = context.read<DigitScannerBloc>();

    // Make a copy of the current QR codes from the bloc state
    List<String> codes = List.from(initialCodes);

    // If the widget is supposed to handle a single value, clear the codes list
    if (singleValue) {
      codes = [];
    }

    // Add the new code to the list
    codes.add(code);

    // Update the state with the new list of codes
    updateCodes(codes);

    // Dispatch an event to update the bloc with the new barcode and QR code lists
    bloc.add(DigitScannerEvent.handleScanner(
      barCode: bloc.state.barCodes, // Keep existing barcodes
      qrCode: codes, // Update QR codes with the new list
      scannerId: bloc.state.scannerId, // Preserve the scanner ID
    ));

    // Wait for 5 seconds before completing the function
    await Future.delayed(const Duration(seconds: 5));
  }

  Future<void> storeValue({
    required BuildContext context,
    required GS1Barcode scanData,
    required AudioPlayer player,
    required Function(List<GS1Barcode>) updateResult,
    required List<GS1Barcode> initialResult,
  }) async {
    // Assign the scanned data to a local variable
    final parsedResult = scanData;

    // Access the DigitScannerBloc from the context
    final bloc = context.read<DigitScannerBloc>();

    // Play the add sound to indicate a successful scan
    player.play(AssetSource(DigitScannerConstants().audioFilePath));

    // Wait for 3 seconds before proceeding
    await Future.delayed(const Duration(seconds: 3));

    // Make a copy of the current barcodes from the bloc state
    List<GS1Barcode> result = List.from(initialResult);

    // Remove duplicate entries based on the last value in the elements map
    result.removeDuplicates(
      (element) {
        if (element.elements.entries.isEmpty) {
          return ''; // Return empty string for empty elements
        }
        return element.elements.entries.last.value.data;
      },
    );

    // Add the new parsed result to the list
    result.add(parsedResult);

    // Dispatch an event to update the bloc with the new barcode and existing QR code lists
    bloc.add(DigitScannerEvent.handleScanner(
      barCode: result, // Update barcodes with the new list
      qrCode: bloc.state.qrCodes, // Keep existing QR codes
      scannerId: bloc.state.scannerId, // Preserve the scanner ID
    ));

    // Update the state with the new list of results
    updateResult(result);

    // Wait for 5 seconds before completing the function
    await Future.delayed(const Duration(seconds: 5));
  }

  Map<String, dynamic> getGs1CodeFormattedStringAtIndex(
      List<GS1Barcode> barCodes, int index) {
    if (index >= 0 && index < barCodes.length) {
      final elements = barCodes[index];
      final data = elements.getAIsData;
      // Filter out entries with null or empty values
      data.removeWhere((key, value) {
        if (value == null) return true;
        if (value is String && value.trim().isEmpty) return true;
        return false;
      });
      return data;
    }
    return {};
  }

  /// Serializes GS1 barcode data to a form value string.
  /// Format: key1:value1|key2:value2 per barcode, semicolons between barcodes.
  /// Only includes entries with non-empty values.
  String serializeGs1Barcodes(List<GS1Barcode> barCodes) {
    final barcodeStrings = <String>[];
    for (int i = 0; i < barCodes.length; i++) {
      final gs1Data = getGs1CodeFormattedStringAtIndex(barCodes, i);
      final parts = <String>[];
      for (final entry in gs1Data.entries) {
        final value = entry.value is DateTime
            ? DateFormat('dd MMM yyyy').format(entry.value)
            : entry.value?.toString() ?? '';
        if (value.trim().isNotEmpty) {
          parts.add('${entry.key}:$value');
        }
      }
      if (parts.isNotEmpty) {
        barcodeStrings.add(parts.join('|'));
      }
    }
    return barcodeStrings.join(';');
  }

  /// Deserializes a GS1 barcode form value string back to a list of key-value maps.
  /// Supports both new format (key:value|key:value) and legacy format (gtin,serial,batch,expiry).
  static List<Map<String, String>> deserializeGs1Barcodes(String data) {
    final result = <Map<String, String>>[];
    final barcodeStrings = data.split(';');
    for (final barcodeStr in barcodeStrings) {
      if (barcodeStr.trim().isEmpty) continue;
      // New format: contains '|' or starts with a 2-digit AI code followed by ':'
      if (barcodeStr.contains('|') ||
          RegExp(r'^\d{2}:').hasMatch(barcodeStr.trim())) {
        final map = <String, String>{};
        for (final pair in barcodeStr.split('|')) {
          final colonIndex = pair.indexOf(':');
          if (colonIndex > 0) {
            final key = pair.substring(0, colonIndex).trim();
            final value = pair.substring(colonIndex + 1).trim();
            if (value.isNotEmpty) {
              map[key] = value;
            }
          }
        }
        if (map.isNotEmpty) result.add(map);
      } else {
        // Legacy format: gtin,serial,batch,expiry (4 comma-separated positional values)
        final parts = barcodeStr.split(',');
        final map = <String, String>{};
        if (parts.isNotEmpty && parts[0].trim().isNotEmpty) {
          map['01'] = parts[0].trim();
        }
        if (parts.length > 1 && parts[1].trim().isNotEmpty) {
          map['21'] = parts[1].trim();
        }
        if (parts.length > 2 && parts[2].trim().isNotEmpty) {
          map['10'] = parts[2].trim();
        }
        if (parts.length > 3 && parts[3].trim().isNotEmpty) {
          map['17'] = parts[3].trim();
        }
        if (map.isNotEmpty) result.add(map);
      }
    }
    return result;
  }

  String generateGS1Barcode({
    required String batchNumber,
    required DateTime expiryDate,
    String? serialNumber,
    String? gtin,
  }) {
    const groupSeparator = '\u001d'; // ASCII 29
    final formattedDate = DateFormat('yyMMdd').format(expiryDate);

    // Include GTIN (01) if provided (fixed-length 14 digits, no GS needed)
    final gtinPart = gtin != null && gtin.isNotEmpty ? '01$gtin' : '';
    // Include Serial (21) only if provided (variable-length, needs GS)
    final serialPart = serialNumber != null && serialNumber.isNotEmpty
        ? '21$serialNumber$groupSeparator'
        : '';
    return '${gtinPart}10$batchNumber${groupSeparator}17$formattedDate$serialPart';
  }
}

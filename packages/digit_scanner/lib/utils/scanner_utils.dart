import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_scanner/blocs/app_localization.dart';
import 'package:digit_scanner/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

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
    await DigitDialog.show<bool>(
      context,
      options: DigitDialogOptions(
        titleText: localizations.translate(
          i18.scanner.scannerDialogTitle,
        ),
        contentText: contentLocalization,
        primaryAction: DigitDialogActions(
          label: localizations.translate(
            i18.scanner.scannerDialogPrimaryAction,
          ),
          action: (ctx) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pop(false);
          },
        ),
        secondaryAction: DigitDialogActions(
          label: localizations.translate(
            i18.scanner.scannerDialogSecondaryAction,
          ),
          action: (ctx) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pop(true);

            Navigator.of(
              context,
            ).pop();
          },
        ),
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
  }) async {
    // Check if processing is allowed
    if (!canProcess) return;

    // Check if another processing is in progress
    if (isBusy) return;

    setBusy(true);

    // Clear previous text state
    setText('');

    // Process the image to detect barcodes
    final barcodes = await barcodeScanner.processImage(inputImage);

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

            // Check if the barcode has already been scanned
            final alreadyScanned = bloc.state.barCodes.any((element) =>
                element.elements.entries.last.value.data ==
                parsedResult.elements.entries.last.value.data);

            if (alreadyScanned) {
              // Handle error if the barcode is already scanned
              await handleError(i18.scanner.resourceAlreadyScanned);
            } else if (quantity > result.length) {
              // Store the parsed result if the quantity is greater than result length
              await storeValue(parsedResult);
            } else {
              // Handle error if there is a mismatch in the scanned resource count
              await handleError(i18.scanner.scannedResourceCountMisMatch);
            }
          } catch (e) {
            // Handle error if parsing fails
            await handleError(i18.scanner.scannedResourceCountMisMatch);
          }
        } else {
          // For non-GS1 codes
          if (bloc.state.qrCodes.contains(barcodes.first.displayValue)) {
            // Handle error if the QR code is already scanned
            await handleError(i18.scanner.resourceAlreadyScanned);
            return;
          } else {
            // Store the QR code if not already scanned
            await storeCode(barcodes.first.displayValue.toString());
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
    player.play(AssetSource(DigitScannerConstants().audioFilePath));

    // Check if the player has completed playing or if the result list is empty
    if (player.state == PlayerState.completed || result.isEmpty) {
      // Display a toast message with the provided error message
      DigitToast.show(
        context,
        options: DigitToastOptions(
          localizations.translate(message), // Translate the message
          true, // Show as an error
          DigitTheme.instance.mobileTheme, // Use the current theme
        ),
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
      (element) => element.elements.entries.last.value.data,
    );

    // Add the new parsed result to the list
    result.add(parsedResult);

    // Dispatch an event to update the bloc with the new barcode and existing QR code lists
    bloc.add(DigitScannerEvent.handleScanner(
      barCode: result, // Update barcodes with the new list
      qrCode: bloc.state.qrCodes, // Keep existing QR codes
    ));

    // Update the state with the new list of results
    updateResult(result);

    // Wait for 5 seconds before completing the function
    await Future.delayed(const Duration(seconds: 5));
  }
}

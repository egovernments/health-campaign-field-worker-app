// part 'auth.freezed.dart' need to be added to auto generate the files for freezed model
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

part 'scanner.freezed.dart';

typedef DigitScannerEmitter = Emitter<DigitScannerState>;

class DigitScannerBloc extends Bloc<DigitScannerEvent, DigitScannerState> {
  DigitScannerBloc(
    super.initialState,
  ) {
    on(_handleScanner);
  }
  FutureOr<void> _handleScanner(
    DigitScannerScanEvent event,
    DigitScannerEmitter emit,
  ) async {
    try {
      final hasContent = event.barCode.isNotEmpty ||
          event.qrCode.isNotEmpty ||
          event.manualCode.trim().isNotEmpty;

      // Build pattern only if provided and non-empty
      final shouldValidate =
          (event.regex != null && event.regex!.trim().isNotEmpty) && hasContent;

      if (!shouldValidate) {
        // No validation (no regex or no content)
        emit(state.copyWith(
          barCodes: event.barCode,
          qrCodes: event.qrCode,
          error: null,
          scannerId: event.scannerId,
        ));
        return;
      }

      final pattern = RegExp(event.regex!);

      // Validate GS1 barcodes (use b.toString(); swap if you prefer another field)
      final validBarcodes = <GS1Barcode>[];
      var invalidBarcodeCount = 0;
      for (final b in event.barCode) {
        final text = b.toString();
        if (text.isNotEmpty && pattern.hasMatch(text)) {
          validBarcodes.add(b);
        } else if (text.isNotEmpty) {
          invalidBarcodeCount++;
        }
      }

      // Validate QR codes (strings)
      final validQRCodes = <String>[];
      var invalidQRCodeCount = 0;
      for (final q in event.qrCode) {
        final qt = q.trim();
        if (qt.isNotEmpty && pattern.hasMatch(qt)) {
          validQRCodes.add(qt);
        } else if (qt.isNotEmpty) {
          invalidQRCodeCount++;
        }
      }

      // Manual code (optional); not stored but can contribute to error
      String? manualError;
      final mc = event.manualCode.trim();
      if (mc.isNotEmpty && !pattern.hasMatch(mc)) {
        manualError = 'Manual code rejected';
      }

      final anyInvalid =
          invalidBarcodeCount > 0 || invalidQRCodeCount > 0 || manualError != null;

      emit(state.copyWith(
        barCodes: validBarcodes,
        qrCodes: validQRCodes,
        error: anyInvalid
            ? (event.patternMessage != null && event.patternMessage!.trim().isNotEmpty)
                ? event.patternMessage!
                : _buildErrorMessage(
                    invalidBarcodesCount: invalidBarcodeCount,
                    invalidQRCodesCount: invalidQRCodeCount,
                    manualError: manualError,
                  )
            : null,
        scannerId: event.scannerId,
      ));
    } catch (error) {
      emit(state.copyWith(
        error: 'Unable to scan: ${error.toString()}',
        loading: false,
      ));
      return;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
  String _buildErrorMessage({
    required int invalidBarcodesCount,
    required int invalidQRCodesCount,
    String? manualError,
  }) {
    final parts = <String>[];
    if (invalidBarcodesCount > 0) parts.add('$invalidBarcodesCount barcode(s) rejected');
    if (invalidQRCodesCount > 0) parts.add('$invalidQRCodesCount QR code(s) rejected');
    if (manualError != null) parts.add(manualError);
    return parts.isEmpty ? '' : '${parts.join('. ')}.';
  }
}

@freezed
class DigitScannerEvent with _$DigitScannerEvent {
  const factory DigitScannerEvent.handleScanner({
    @Default([]) List<GS1Barcode> barCode,
    @Default([]) List<String> qrCode,
    @Default('') String manualCode,
    String? regex,
    String? patternMessage,
    /// Identifier for which scanner field initiated this scan.
    /// Used to prevent multiple scanner fields from reacting to the same state change.
    /// Defaults to 'default' for backward compatibility with existing flows.
    @Default('default') String scannerId,
  }) = DigitScannerScanEvent;
}

@freezed
class DigitScannerState with _$DigitScannerState {
  const factory DigitScannerState({
    @Default([]) List<GS1Barcode> barCodes,
    @Default([]) List<String> qrCodes,
    @Default(false) bool loading,
    @Default(false) bool duplicate,
    String? error,
    /// Identifier for which scanner field this state belongs to.
    /// Used to filter state changes for specific scanner fields.
    /// Defaults to 'default' for backward compatibility.
    @Default('default') String scannerId,
  }) = _DigitScannerState;
}

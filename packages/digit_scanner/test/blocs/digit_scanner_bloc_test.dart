// Importing necessary packages and modules
import 'package:bloc_test/bloc_test.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:flutter_test/flutter_test.dart';

import '../constants/digit_scanner_test_constants.dart';

void main() {
  // Grouping tests related to DigitScannerBloc
  group('DigitScannerBloc', () {

    // Test for Clearing the Scanner state
    blocTest<DigitScannerBloc, DigitScannerState>(
      'emits Scanned codes or barcodes state after scanning',
      build: () => DigitScannerBloc(const DigitScannerState()),
      // Test event for clearing the state of scanner bloc and return empty qrCodes and BarCodes list
      act: (bloc) => bloc.add(const DigitScannerEvent.handleScanner()),
      // Expecting the bloc to emit a state with the saved warehouse details
      expect: () => <DigitScannerState>[const DigitScannerState()],
    );

    // Test for Emitting the scanned QR Code or Bar codes in state
    blocTest<DigitScannerBloc, DigitScannerState>(
      'emits Scanned codes or barcodes state after scanning',
      build: () => DigitScannerBloc(const DigitScannerState()),
      // Test event for clearing the state of scanner bloc and return empty qrCodes list
      act: (bloc) => bloc.add(DigitScannerEvent.handleScanner(
          qrCode: [DigitScannerTestConstants().testQRCode])),
      // Expecting the bloc to emit a state with the scanned qr code details
      expect: () => <DigitScannerState>[
        DigitScannerState(qrCodes: [DigitScannerTestConstants().testQRCode])
      ],
    );

    // Test for Emitting the scanned Bar codes in state
    blocTest<DigitScannerBloc, DigitScannerState>(
      'emits Scanned codes or barcodes state after scanning',
      build: () => DigitScannerBloc(const DigitScannerState()),
      // Test event for clearing the state of scanner bloc and return empty qrCodes list
      act: (bloc) => bloc.add(DigitScannerEvent.handleScanner(
          barCode: DigitScannerTestConstants().testBarCode)),
      // Expecting the bloc to emit the scanned barcodes in state
      expect: () => <DigitScannerState>[
        DigitScannerState(barCodes: DigitScannerTestConstants().testBarCode)
      ],
    );
  });
}

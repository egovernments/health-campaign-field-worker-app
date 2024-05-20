// Importing necessary packages and modules
import 'package:bloc_test/bloc_test.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

void main() {
  // Grouping tests related to RecordStockBloc
  group('DigitScannerBloc', () {
    // Declaring variables for mock and bloc
    late DigitScannerBloc digitScannerBloc;

    // Setting up the mock and the bloc for each test
    setUp(() {
      digitScannerBloc = DigitScannerBloc(
        const DigitScannerState(),
      );
    });

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
      act: (bloc) =>
          bloc.add(const DigitScannerEvent.handleScanner(qrCode: ['123456'])),
      // Expecting the bloc to emit a state with the saved warehouse details
      expect: () => <DigitScannerState>[
        const DigitScannerState(qrCodes: ['123456'])
      ],
    );

    // Test for Emitting the scanned Bar codes in state
    blocTest<DigitScannerBloc, DigitScannerState>(
      'emits Scanned codes or barcodes state after scanning',
      build: () => DigitScannerBloc(const DigitScannerState()),
      // Test event for clearing the state of scanner bloc and return empty qrCodes list
      act: (bloc) => bloc.add(const DigitScannerEvent.handleScanner(barCode: [
        GS1Barcode(
          code: Code(
            type: CodeType.GS1_128,
            codeTitle: 'Barcode1',
            fnc1: 'GS1',
          ),
          elements: {
            "00": GS1ParsedElement(
                aiCode: "00",
                rawData: "089061260502294703",
                data: 089061260502294703)
          },
        )
      ])),
      // Expecting the bloc to emit a state with the saved warehouse details
      expect: () => <DigitScannerState>[
        const DigitScannerState(barCodes: [
          GS1Barcode(
            code: Code(
              type: CodeType.GS1_128,
              codeTitle: 'Barcode1',
              fnc1: 'GS1',
            ),
            elements: {
              "00": GS1ParsedElement(
                  aiCode: "00",
                  rawData: "089061260502294703",
                  data: 089061260502294703)
            },
          )
        ])
      ],
    );
  });
}

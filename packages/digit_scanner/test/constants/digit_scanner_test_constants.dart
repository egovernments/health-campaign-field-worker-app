import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

class DigitScannerTestConstants {
  final String testQRCode = '123456';
  final String testManualCode = 'QRT56781';
  final List<GS1Barcode> testBarCode = [
    const GS1Barcode(
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
  ];
}

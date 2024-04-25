import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

// Abstract class defining the listener to interact with the data through any other application
abstract class ScannerListeners {
  // Method to search if any existing QR code present.
  void setScannedCodes(SetScannedCodes setScannedCodes);
}

// Singleton class for scanning QR and barcode operations
class ScannerSingleton {
  static final ScannerSingleton _singleton = ScannerSingleton._internal();

  factory ScannerSingleton() {
    return _singleton;
  }

  ScannerSingleton._internal();

  ScannerListeners? _scannerListeners;

  // Method to set Scanner listeners and other information
  void setScannerListeners({
    required ScannerListeners scannerListeners,
  }) {
    _scannerListeners = scannerListeners;
  }

  // Method to search existing QR if exists
  void setScannedCodes(SetScannedCodes setScannedCodes) {
    _scannerListeners?.setScannedCodes(setScannedCodes);
  }
}

class SetScannedCodes {
  final List<GS1Barcode> barCodes;
  final List<String> qrCodes;
  String? manualCode;
  final Function(bool isDuplicate) onScanned;

  SetScannedCodes({
    required this.barCodes,
    required this.qrCodes,
    this.manualCode,
    required this.onScanned,
  });
}

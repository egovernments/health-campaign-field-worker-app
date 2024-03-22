import 'package:digit_scanner/blocs/scanner_listeners.dart';

class HCMScannerBloc extends ScannerListeners {
  HCMScannerBloc();

  @override
  void setScannedCodes(SetScannedCodes setScannedCodes) async {
    ///Implement additional call for onSubmit in QR page
  }
}

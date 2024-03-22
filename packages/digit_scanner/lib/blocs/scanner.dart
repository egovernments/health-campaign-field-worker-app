// part 'auth.freezed.dart' need to be added to auto generate the files for freezed model
import 'dart:async';

import 'package:digit_scanner/blocs/scanner_listeners.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

part 'scanner.freezed.dart';

typedef DigitScannerEmitter = Emitter<DigitScannerState>;

class DigitScannerBloc extends Bloc<DigitScannerEvent, DigitScannerState> {
  // final ProjectBeneficiaryDataRepository projectBeneficiaryRepository;
  // final HFReferralDataRepository hfReferralDataRepository;

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
      emit(state.copyWith(barCodes: event.barCode, qrCodes: event.qrCode));
      ScannerSingleton().setScannedCodes(SetScannedCodes(
          barCodes: event.barCode,
          qrCodes: event.qrCode,
          onScanned: (bool isDuplicate) => isDuplicate));
    } catch (error) {
      rethrow;
    } finally {
      // emit(state.copyWith(loading: false));
    }
  }
}

@freezed
class DigitScannerEvent with _$DigitScannerEvent {
  const factory DigitScannerEvent.handleScanner({
    @Default([]) List<GS1Barcode> barCode,
    @Default([]) List<String> qrCode,
    @Default('') String manualCode,
  }) = DigitScannerScanEvent;
}

@freezed
class DigitScannerState with _$DigitScannerState {
  const factory DigitScannerState({
    @Default([]) List<GS1Barcode> barCodes,
    @Default([]) List<String> qrCodes,
    @Default(false) bool loading,
    @Default(false) bool duplicate,
  }) = _DigitScannerState;
}

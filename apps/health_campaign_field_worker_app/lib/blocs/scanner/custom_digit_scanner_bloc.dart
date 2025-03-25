// part 'auth.freezed.dart' need to be added to auto generate the files for freezed model
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

part 'custom_digit_scanner_bloc.freezed.dart';

enum BarcodeScanType { manual, scan }

typedef CustomDigitScannerEmitter = Emitter<CustomDigitScannerState>;

class CustomDigitScannerBloc
    extends Bloc<CustomDigitScannerEvent, CustomDigitScannerState> {
  CustomDigitScannerBloc(
    super.initialState,
  ) {
    on(_handleScanner);
  }
  FutureOr<void> _handleScanner(
    CustomDigitScannerScanEvent event,
    CustomDigitScannerEmitter emit,
  ) async {
    try {
      emit(state.copyWith(loading: true));
      emit(state.copyWith(barCodes: event.barCode, qrCodes: event.qrCode));
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}

@freezed
class CustomDigitScannerEvent with _$CustomDigitScannerEvent {
  const factory CustomDigitScannerEvent.handleScanner({
    @Default([]) List<(BarcodeScanType, GS1Barcode)> barCode,
    @Default([]) List<String> qrCode,
    @Default('') String manualCode,
  }) = CustomDigitScannerScanEvent;
}

@freezed
class CustomDigitScannerState with _$CustomDigitScannerState {
  const factory CustomDigitScannerState({
    @Default([]) List<(BarcodeScanType, GS1Barcode)> barCodes,
    @Default([]) List<String> qrCodes,
    @Default(false) bool loading,
    @Default(false) bool duplicate,
  }) = _CustomDigitScannerState;
}

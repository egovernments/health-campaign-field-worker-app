// part 'auth.freezed.dart' need to be added to auto generate the files for freezed model
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

import '../../models/data_model.dart';
import '../../utils/typedefs.dart';

part 'scanner.freezed.dart';

typedef ScannerEmitter = Emitter<ScannerState>;

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  final ProjectBeneficiaryDataRepository projectBeneficiaryRepository;
  final HFReferralDataRepository hfReferralDataRepository;

  ScannerBloc(
    super.initialState, {
    required this.projectBeneficiaryRepository,
    required this.hfReferralDataRepository,
  }) {
    on(_handleScanner);
  }
  FutureOr<void> _handleScanner(
    ScannerScanEvent event,
    ScannerEmitter emit,
  ) async {
    try {
      if (event.qrcode.isNotEmpty) {
        final projectBeneficiary = event.isReferral
            ? await hfReferralDataRepository
                .search(HFReferralSearchModel(beneficiaryId: event.qrcode.last))
            : await projectBeneficiaryRepository
                .search(ProjectBeneficiarySearchModel(tag: event.qrcode.last));

        if (projectBeneficiary.isEmpty) {
          emit(state.copyWith(duplicate: false));
        } else {
          emit(state.copyWith(duplicate: true));
        }
      } else {
        emit(state.copyWith(duplicate: false));
      }

      emit(state.copyWith(barcodes: event.barcode, qrcodes: event.qrcode));
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}

@freezed
class ScannerEvent with _$ScannerEvent {
  const factory ScannerEvent.handleScanner(
    List<GS1Barcode> barcode,
    List<String> qrcode, {
    @Default(false) bool isReferral,
  }) = ScannerScanEvent;
}

@freezed
class ScannerState with _$ScannerState {
  const factory ScannerState({
    @Default([]) List<GS1Barcode> barcodes,
    @Default([]) List<String> qrcodes,
    @Default(false) bool loading,
    @Default(false) bool duplicate,
  }) = _ScannerState;
}

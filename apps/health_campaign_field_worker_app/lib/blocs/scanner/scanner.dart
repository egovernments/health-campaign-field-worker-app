// part 'auth.freezed.dart' need to be added to auto generate the files for freezed model
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/entities/project_beneficiary.dart';
import '../../utils/typedefs.dart';

part 'scanner.freezed.dart';

typedef ScannerEmitter = Emitter<ScannerState>;

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  final ProjectBeneficiaryDataRepository projectBeneficiaryRepository;

  ScannerBloc(
    super.initialState, {
    required this.projectBeneficiaryRepository,
  }) {
    on(_handleScanner);
  }
  FutureOr<void> _handleScanner(
    ScannerScanEvent event,
    ScannerEmitter emit,
  ) async {
    try {
      if (event.qrcode.isNotEmpty) {
        final projectBeneficiary = await projectBeneficiaryRepository
            .search(ProjectBeneficiarySearchModel(tag: event.qrcode.first));

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
    List<String> qrcode,
  ) = ScannerScanEvent;
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

// scanner.dart
import 'dart:async';
import 'package:digit_scanner/utils/extensions/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

part 'scanner.freezed.dart';

typedef DigitScannerEmitter = Emitter<DigitScannerState>;

class DigitScannerBloc extends Bloc<DigitScannerEvent, DigitScannerState> {
  DigitScannerBloc(super.initialState) {
    on<DigitScannerScanEvent>(_handleScanner);
  }

  String _kBar(GS1Barcode b) => b.toString().trim();
  String _kQR(String s) => s.trim();

  // Pull message by key from merged (state + event) map with fallback
  String _pickMsg({
    required String key,
    required String fallback,
    Map<String, String>? eventMsgs,
  }) {
    final merged = <String, String>{
      ...state.messages,
      if (eventMsgs != null) ...eventMsgs,
    };
    final v = merged[key];
    return (v == null || v.trim().isEmpty) ? fallback : v;
  }

  void _emitError(
      DigitScannerEmitter emit, {
        required List<GS1Barcode> bar,
        required List<String> qr,
        required bool isGS1,
        required int qty,
        required String? regex,
        required String message,
        Map<String, String>? messages,
      }) {
    emit(state.copyWith(
      barCodes: bar,
      qrCodes: qr,
      isGS1: isGS1,
      quantity: qty,
      regex: regex,
      loading: false,
      error: message,
      messages: {
        ...state.messages,
        if (messages != null) ...messages,
      },
      errorSeq: state.errorSeq + 1,
    ));
  }

  FutureOr<void> _handleScanner(
      DigitScannerScanEvent event,
      DigitScannerEmitter emit,
      ) async {
    try {
      final modeIsGS1 = event.isGS1 ?? state.isGS1;
      final maxQty = (event.quantity ?? state.quantity).clamp(1, 1000);
      final isOverwrite = event.overwrite == true;

      // regex selection (same as before)
      final String? effectiveRegex = isOverwrite
          ? event.regex?.trim()
          : (event.regex ?? state.regex)?.trim();

      final RegExp? pattern = (effectiveRegex != null && effectiveRegex.isNotEmpty)
          ? RegExp(effectiveRegex)
          : null;

      // messages selection (new)
      final Map<String, String> effectiveMessages = isOverwrite
          ? (event.messages ?? const {})
          : {
        ...state.messages,
        if (event.messages != null) ...event.messages!,
      };

      final currBar = List<GS1Barcode>.from(state.barCodes);
      final currQR = List<String>.from(state.qrCodes);

      // overwrite branch
      if (isOverwrite) {
        if (modeIsGS1) {
          emit(state.copyWith(
            barCodes: List<GS1Barcode>.from(event.barCode),
            qrCodes: const [],
            isGS1: modeIsGS1,
            quantity: maxQty,
            regex: effectiveRegex,
            loading: false,
            error: null,
            messages: effectiveMessages,
          ));
        } else {
          emit(state.copyWith(
            barCodes: const [],
            qrCodes: List<String>.from(event.qrCode),
            isGS1: modeIsGS1,
            quantity: maxQty,
            regex: effectiveRegex,
            loading: false,
            error: null,
            messages: effectiveMessages,
          ));
        }
        return;
      }

      if (modeIsGS1) {
        // GS1 mode
        final candidates = List<GS1Barcode>.from(event.barCode);
        if (candidates.isEmpty) {
          emit(state.copyWith(error: null, loading: false, messages: effectiveMessages));
          return;
        }

        if (currBar.length + candidates.length > maxQty) {
          _emitError(
            emit,
            bar: currBar,
            qr: const [],
            isGS1: modeIsGS1,
            qty: maxQty,
            regex: effectiveRegex,
            messages: effectiveMessages,
            message: _pickMsg(
              key: 'scanLimit',
              fallback: 'Max Count reached',
              eventMsgs: event.messages,
            ),
          );
          return;
        }

        final exist = state.barCodes.map((b) => b.displayValue()).whereType<String>().toSet();
        final seenNew = <String>{};

        for (final b in candidates) {
          final s = b.displayValue();
          if (s == null || s.isEmpty) {
            _emitError(
              emit,
              bar: state.barCodes,
              qr: const [],
              isGS1: modeIsGS1,
              qty: maxQty,
              regex: effectiveRegex,
              messages: effectiveMessages,
              message: _pickMsg(
                key: 'invalidGS1',
                fallback: 'Invalid GS1: no usable value',
                eventMsgs: event.messages,
              ),
            );
            return;
          }
          if (pattern != null && !pattern.hasMatch(s)) {
            _emitError(
              emit,
              bar: state.barCodes,
              qr: const [],
              isGS1: modeIsGS1,
              qty: maxQty,
              regex: effectiveRegex,
              messages: effectiveMessages,
              message: _pickMsg(
                key: 'pattern',
                fallback: 'Regex failed',
                eventMsgs: event.messages,
              ),
            );
            return;
          }
          if (exist.contains(s) || !seenNew.add(s)) {
            _emitError(
              emit,
              bar: state.barCodes,
              qr: const [],
              isGS1: modeIsGS1,
              qty: maxQty,
              regex: effectiveRegex,
              messages: effectiveMessages,
              message: _pickMsg(
                key: 'duplicate',
                fallback: 'You are scanning Duplicate value',
                eventMsgs: event.messages,
              ),
            );
            return;
          }
        }

        emit(state.copyWith(
          barCodes: [...currBar, ...candidates],
          qrCodes: const [],
          isGS1: modeIsGS1,
          quantity: maxQty,
          regex: effectiveRegex,
          loading: false,
          error: null,
          messages: effectiveMessages,
        ));
        return;
      }

      // QR mode
      final candidates = <String>[
        ...event.qrCode,
        if (event.manualCode.trim().isNotEmpty) event.manualCode.trim(),
      ].map(_kQR).where((s) => s.isNotEmpty).toList(growable: false);

      if (candidates.isEmpty) {
        emit(state.copyWith(error: null, loading: false, messages: effectiveMessages));
        return;
      }

      if (currQR.length + candidates.length > maxQty) {
        _emitError(
          emit,
          bar: const [],
          qr: currQR,
          isGS1: modeIsGS1,
          qty: maxQty,
          regex: effectiveRegex,
          messages: effectiveMessages,
          message: _pickMsg(
            key: 'scanLimit',
            fallback: 'Max Count reached',
            eventMsgs: event.messages,
          ),
        );
        return;
      }

      final exist = currQR.toSet();
      final seenNew = <String>{};
      for (final q in candidates) {
        if (pattern != null && !pattern.hasMatch(q)) {
          _emitError(
            emit,
            bar: const [],
            qr: currQR,
            isGS1: modeIsGS1,
            qty: maxQty,
            regex: effectiveRegex,
            messages: effectiveMessages,
            message: _pickMsg(
              key: 'pattern',
              fallback: 'Regex failed',
              eventMsgs: event.messages,
            ),
          );
          return;
        }
        if (exist.contains(q) || !seenNew.add(q)) {
          _emitError(
            emit,
            bar: const [],
            qr: currQR,
            isGS1: modeIsGS1,
            qty: maxQty,
            regex: effectiveRegex,
            messages: effectiveMessages,
            message: _pickMsg(
              key: 'duplicate',
              fallback: 'You are scanning Duplicate value',
              eventMsgs: event.messages,
            ),
          );
          return;
        }
      }

      emit(state.copyWith(
        barCodes: const [],
        qrCodes: [...currQR, ...candidates],
        isGS1: modeIsGS1,
        quantity: maxQty,
        regex: effectiveRegex,
        loading: false,
        error: null,
        messages: effectiveMessages,
      ));
    } catch (e) {
      _emitError(
        emit,
        bar: state.barCodes,
        qr: state.qrCodes,
        isGS1: state.isGS1,
        qty: state.quantity,
        regex: state.regex,
        messages: state.messages,
        message: _pickMsg(
          key: 'scannerFailed',
          fallback: 'Scanner failed: ${e.toString()}',
        ),
      );
    }
  }
}

@freezed
class DigitScannerEvent with _$DigitScannerEvent {
  const factory DigitScannerEvent.handleScanner({
    @Default([]) List<GS1Barcode> barCode,
    @Default([]) List<String> qrCode,
    @Default('') String manualCode,
    bool? isGS1,
    int? quantity,
    String? regex,
    @Default(false) bool overwrite,

    /// 👇 new: optional messages map. Keys you can use:
    /// 'scanLimit', 'pattern', 'duplicate', 'invalidGS1', 'scannerFailed'
    Map<String, String>? messages,
  }) = DigitScannerScanEvent;
}

@freezed
class DigitScannerState with _$DigitScannerState {
  const factory DigitScannerState({
    @Default([]) List<GS1Barcode> barCodes,
    @Default([]) List<String> qrCodes,
    @Default(false) bool isGS1,
    @Default(1) int quantity,
    String? regex,
    @Default(false) bool loading,
    @Default(false) bool duplicate,
    String? error,

    /// 👇 new: carry custom messages
    @Default({}) Map<String, String> messages,

    /// increments on every error emit
    @Default(0) int errorSeq,
  }) = _DigitScannerState;
}

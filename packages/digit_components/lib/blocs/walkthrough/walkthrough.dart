import 'dart:async';

import 'package:digit_components/models/digiticoncard/digit_icon_card_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'walkthrough.freezed.dart';

typedef WalkthroughStateEmitter = Emitter<WalkthroughState>;

class WalkthroughBloc extends Bloc<WalkthroughEvent, WalkthroughState> {
  WalkthroughBloc(super.initialState) {
    on(_loadWalkthrough);
    on(_handleNext);
    on(_handleReset);
  }

  FutureOr<void> _loadWalkthrough(
    RequestWalkthroughLoadEvent event,
    WalkthroughStateEmitter emit,
  ) async {
    emit(state.copyWith(walkthroughData: event.walkthroughData));
  }

  FutureOr<void> _handleNext(
    RequestWalkthroughNextEvent event,
    WalkthroughStateEmitter emit,
  ) async {
    emit(state.copyWith(walkthroughIndex: state.walkthroughIndex + 1));
  }

  FutureOr<void> _handleReset(
    RequestWalkthroughResetEvent event,
    WalkthroughStateEmitter emit,
  ) async {
    emit(state.copyWith(walkthroughIndex: 0));
  }
}

@freezed
class WalkthroughEvent with _$WalkthroughEvent {
  const factory WalkthroughEvent.handleNext({
    required int walkthroughIndex,
  }) = RequestWalkthroughNextEvent;

  const factory WalkthroughEvent.loadWalkthrough(
          {required DigitIconCardWrapperModel walkthroughData}) =
      RequestWalkthroughLoadEvent;

  const factory WalkthroughEvent.handleReset() = RequestWalkthroughResetEvent;
}

@freezed
class WalkthroughState with _$WalkthroughState {
  const WalkthroughState._();

  const factory WalkthroughState({
    required DigitIconCardWrapperModel walkthroughData,
    @Default(0) int walkthroughIndex,
  }) = _WalkthroughState;
}

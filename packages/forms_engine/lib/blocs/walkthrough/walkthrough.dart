import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/forms_engine.dart';
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
      {required SchemaObject walkthroughData}) = RequestWalkthroughLoadEvent;

  const factory WalkthroughEvent.handleReset() = RequestWalkthroughResetEvent;
}

@freezed
class WalkthroughState with _$WalkthroughState {
  const WalkthroughState._();

  const factory WalkthroughState({
    required SchemaObject walkthroughData,
    @Default(0) int walkthroughIndex,
    @Default('/') String pageName,
  }) = _WalkthroughState;
}

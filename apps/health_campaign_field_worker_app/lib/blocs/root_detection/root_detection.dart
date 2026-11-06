import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jailbreak_root_detection/jailbreak_root_detection.dart';

part 'root_detection.freezed.dart';

typedef RootDetectionEmitter = Emitter<RootDetectionState>;

class RootDetectionBloc extends Bloc<RootDetectionEvent, RootDetectionState> {
  RootDetectionBloc() : super(const RootDetectionState(isRooted: null)) {
    on(_handleRootDetection);
  }

  FutureOr<void> _handleRootDetection(
    RootDetectionLoadedEvent event,
    RootDetectionEmitter emit,
  ) async {
    final isRooted = await JailbreakRootDetection.instance.isJailBroken;
    debugPrint('Device is rooted/jailbroken: $isRooted');
    emit(RootDetectionState(isRooted: isRooted));
  }
}

@freezed
class RootDetectionEvent with _$RootDetectionEvent {
  const factory RootDetectionEvent.onLoaded() = RootDetectionLoadedEvent;
}

@freezed
class RootDetectionState with _$RootDetectionState {
  const factory RootDetectionState({
    bool? isRooted,
  }) = _RootDetectionState;
}

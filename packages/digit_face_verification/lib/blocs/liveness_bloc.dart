import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../data/liveness_detection_service.dart';

part 'liveness_bloc.freezed.dart';

typedef LivenessEmitter = Emitter<LivenessState>;

class LivenessBloc extends Bloc<LivenessEvent, LivenessState> {
  final LivenessDetectionService _service;
  final Duration challengeTimeout;
  Timer? _timer;

  LivenessBloc({
    LivenessDetectionService? service,
    this.challengeTimeout = const Duration(seconds: 15),
  })  : _service = service ?? LivenessDetectionService(),
        super(const LivenessState.idle()) {
    on(_onStart);
    on(_onFaceFrame);
    on(_onTimeout);
    on(_onReset);
  }

  FutureOr<void> _onStart(
    LivenessStartEvent event,
    LivenessEmitter emit,
  ) {
    _service.reset();
    _startTimer();
    emit(const LivenessState.challenging(
      challenge: LivenessChallenge.blink,
      instruction: 'Please blink your eyes',
      progress: 0.0,
    ));
  }

  FutureOr<void> _onFaceFrame(
    LivenessFaceFrameEvent event,
    LivenessEmitter emit,
  ) {
    if (state is! LivenessChallengingState) return null;

    final result = _service.processFace(event.face);

    if (result.passed) {
      _cancelTimer();
      emit(const LivenessState.passed());
    } else {
      // Restart timer on each new challenge
      if (result.currentChallenge !=
          (state as LivenessChallengingState).challenge) {
        _startTimer();
      }
      emit(LivenessState.challenging(
        challenge: result.currentChallenge!,
        instruction: result.instruction,
        progress: result.progress,
      ));
    }
  }

  FutureOr<void> _onTimeout(
    LivenessTimeoutEvent event,
    LivenessEmitter emit,
  ) {
    _cancelTimer();
    _service.reset();
    emit(const LivenessState.failed(reason: 'Challenge timed out'));
  }

  FutureOr<void> _onReset(
    LivenessResetEvent event,
    LivenessEmitter emit,
  ) {
    _cancelTimer();
    _service.reset();
    emit(const LivenessState.idle());
  }

  void _startTimer() {
    _cancelTimer();
    _timer = Timer(challengeTimeout, () {
      if (!isClosed) {
        add(const LivenessEvent.timeout());
      }
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Future<void> close() {
    _cancelTimer();
    return super.close();
  }
}

@freezed
class LivenessEvent with _$LivenessEvent {
  const factory LivenessEvent.start() = LivenessStartEvent;

  const factory LivenessEvent.faceFrame({
    required Face face,
  }) = LivenessFaceFrameEvent;

  const factory LivenessEvent.timeout() = LivenessTimeoutEvent;

  const factory LivenessEvent.reset() = LivenessResetEvent;
}

@freezed
class LivenessState with _$LivenessState {
  const factory LivenessState.idle() = LivenessIdleState;

  const factory LivenessState.challenging({
    required LivenessChallenge challenge,
    required String instruction,
    @Default(0.0) double progress,
  }) = LivenessChallengingState;

  const factory LivenessState.passed() = LivenessPassedState;

  const factory LivenessState.failed({
    required String reason,
  }) = LivenessFailedState;
}

import 'dart:async';

import 'package:digit_face_verification/digit_face_verification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/face_auth_config.dart';
import '../../services/reverification_scheduler.dart';

part 'reverification_bloc.freezed.dart';

typedef ReVerificationEmitter = Emitter<ReVerificationState>;

/// BLoC for managing random re-verification prompts with countdown.
class ReVerificationBloc
    extends Bloc<ReVerificationEvent, ReVerificationState> {
  final FaceEmbeddingRepository repository;
  final FaceAuthConfig config;
  Timer? _windowTimer;
  Timer? _countdownTimer;

  /// Saved state when paused so we can resume the countdown.
  int? _pausedRemainingSeconds;
  int? _pausedPopupTime;

  /// Tracks the current iteration within a single trigger cycle.
  /// Each trigger gets [maxIterations] attempts before logging missed.
  static const int maxIterations = 3;
  int _currentIteration = 0;
  int _triggerPopupTime = 0;

  ReVerificationBloc({
    required this.repository,
    this.config = const FaceAuthConfig(),
  }) : super(const ReVerificationState.idle()) {
    on(_onTriggered);
    on(_onTick);
    on(_onFaceScanned);
    on(_onPinUsed);
    on(_onDismissed);
    on(_onTimeout);
    on(_onExternalVerified);
    on(_onPaused);
    on(_onResumed);
  }

  FutureOr<void> _onTriggered(
    ReVerificationTriggeredEvent event,
    ReVerificationEmitter emit,
  ) {
    // Ignore if already prompted or verifying
    if (state is ReVerificationPromptedState ||
        state is ReVerificationScanningState ||
        state is ReVerificationPinFallbackState) {
      return null;
    }

    _currentIteration = 1;
    _triggerPopupTime = DateTime.now().millisecondsSinceEpoch;
    _startCountdown(emit);
  }

  /// Starts (or restarts) the countdown timer and emits a prompted state.
  void _startCountdown(ReVerificationEmitter emit) {
    final popupTime = DateTime.now().millisecondsSinceEpoch;
    emit(ReVerificationState.prompted(
      popupTime: popupTime,
      remainingSeconds: config.countdownDuration.inSeconds,
      iteration: _currentIteration,
      maxIterations: maxIterations,
    ));

    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!isClosed) {
        add(const ReVerificationEvent.tick());
      }
    });

    _windowTimer?.cancel();
    _windowTimer = Timer(config.countdownDuration, () {
      if (!isClosed) {
        add(const ReVerificationEvent.timeout());
      }
    });
  }

  FutureOr<void> _onTick(
    ReVerificationTickEvent event,
    ReVerificationEmitter emit,
  ) {
    final current = state;
    if (current is ReVerificationPromptedState) {
      final remaining = current.remainingSeconds - 1;
      if (remaining > 0) {
        emit(ReVerificationState.prompted(
          popupTime: current.popupTime,
          remainingSeconds: remaining,
          iteration: current.iteration,
          maxIterations: current.maxIterations,
        ));
      }
    }
  }

  FutureOr<void> _onFaceScanned(
    ReVerificationFaceScannedEvent event,
    ReVerificationEmitter emit,
  ) async {
    _windowTimer?.cancel();
    _countdownTimer?.cancel();

    // Verify against all enrolled profiles (averaged + per-angle embeddings)
    final allEmbeddings = await repository.getAllEmbeddings();
    double bestSimilarity = -1.0;
    String? bestMatchId;

    for (final stored in allEmbeddings) {
      // Compare against averaged embedding
      double userBest = DistanceMetrics.cosineSimilarity(
        event.embedding,
        stored.embedding,
      );

      // Also compare against each angle embedding
      for (final angleEmb in stored.angleEmbeddings) {
        final angleSim = DistanceMetrics.cosineSimilarity(
          event.embedding,
          angleEmb,
        );
        if (angleSim > userBest) userBest = angleSim;
      }

      if (userBest > bestSimilarity) {
        bestSimilarity = userBest;
        bestMatchId = stored.individualId;
      }
    }

    // Compute adaptive threshold based on enrollment quality
    double effectiveThreshold = config.faceMatchThreshold;
    if (bestMatchId != null) {
      final bestStored = allEmbeddings.firstWhere(
        (e) => e.individualId == bestMatchId,
      );
      if (bestStored.angleEmbeddings.length >= 2) {
        effectiveThreshold = DistanceMetrics.adaptiveThreshold(
          averagedEmbedding: bestStored.embedding,
          angleEmbeddings: bestStored.angleEmbeddings,
          baseThreshold: config.faceMatchThreshold,
        );
      }
    }

    if (bestSimilarity >= effectiveThreshold && bestMatchId != null) {
      await repository.updateLastVerified(bestMatchId);
      final popupTime = (state is ReVerificationPromptedState)
          ? (state as ReVerificationPromptedState).popupTime
          : DateTime.now().millisecondsSinceEpoch;
      final elapsed = DateTime.now().millisecondsSinceEpoch - popupTime;
      emit(ReVerificationState.verified(
        confidence: bestSimilarity,
        elapsedMs: elapsed,
      ));
      // Auto-dismiss after short delay
      await Future.delayed(const Duration(seconds: 2));
      if (!isClosed) emit(const ReVerificationState.idle());
    } else {
      emit(const ReVerificationState.pinFallback());
    }
  }

  FutureOr<void> _onPinUsed(
    ReVerificationPinUsedEvent event,
    ReVerificationEmitter emit,
  ) async {
    _windowTimer?.cancel();
    _countdownTimer?.cancel();

    final profile = await repository.getProfile(event.individualId);
    if (profile == null) {
      emit(const ReVerificationState.idle());
      return;
    }

    final pinService = PinService();
    final isValid =
        pinService.verifyPin(event.pin, profile.pinHash, profile.pinSalt);

    if (isValid) {
      await repository.updateLastVerified(event.individualId);
      emit(const ReVerificationState.verified(
        confidence: 0.0,
        elapsedMs: 0,
      ));
      await Future.delayed(const Duration(seconds: 2));
      if (!isClosed) emit(const ReVerificationState.idle());
    } else {
      emit(const ReVerificationState.pinFallback());
    }
  }

  /// Pauses timers while the user is in the face verification dialog.
  /// Saves the remaining countdown so it can be resumed if the dialog
  /// is closed without completing verification.
  FutureOr<void> _onPaused(
    ReVerificationPausedEvent event,
    ReVerificationEmitter emit,
  ) {
    // Save remaining seconds and cancel timers, but keep the prompted
    // state so the appbar countdown banner stays visible while the
    // verification dialog is open.
    final current = state;
    if (current is ReVerificationPromptedState) {
      _pausedRemainingSeconds = current.remainingSeconds;
      _pausedPopupTime = current.popupTime;
    }
    _windowTimer?.cancel();
    _countdownTimer?.cancel();
    // Don't emit scanning — keep the current prompted state so the
    // banner remains visible.
  }

  /// Resumes the countdown from where it was paused (e.g. when the user
  /// closes the face verification dialog without completing verification).
  FutureOr<void> _onResumed(
    ReVerificationResumedEvent event,
    ReVerificationEmitter emit,
  ) {
    final remaining = _pausedRemainingSeconds;
    final popupTime = _pausedPopupTime;
    _pausedRemainingSeconds = null;
    _pausedPopupTime = null;

    if (remaining == null || remaining <= 0 || popupTime == null) {
      emit(const ReVerificationState.idle());
      return null;
    }

    emit(ReVerificationState.prompted(
      popupTime: popupTime,
      remainingSeconds: remaining,
      iteration: _currentIteration,
      maxIterations: maxIterations,
    ));

    // Restart countdown timer
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!isClosed) {
        add(const ReVerificationEvent.tick());
      }
    });

    // Restart window timeout for the remaining duration
    _windowTimer?.cancel();
    _windowTimer = Timer(Duration(seconds: remaining), () {
      if (!isClosed) {
        add(const ReVerificationEvent.timeout());
      }
    });
  }

  FutureOr<void> _onExternalVerified(
    ReVerificationExternalVerifiedEvent event,
    ReVerificationEmitter emit,
  ) async {
    _windowTimer?.cancel();
    _countdownTimer?.cancel();
    _currentIteration = 0;

    final popupTime = (state is ReVerificationPromptedState)
        ? (state as ReVerificationPromptedState).popupTime
        : DateTime.now().millisecondsSinceEpoch;
    final elapsed = DateTime.now().millisecondsSinceEpoch - popupTime;

    emit(ReVerificationState.verified(
      confidence: 1.0, // external verification passed
      elapsedMs: elapsed,
    ));
    await Future.delayed(const Duration(seconds: 1));
    if (!isClosed) emit(const ReVerificationState.idle());
  }

  FutureOr<void> _onDismissed(
    ReVerificationDismissedEvent event,
    ReVerificationEmitter emit,
  ) {
    _windowTimer?.cancel();
    _countdownTimer?.cancel();
    // Log as missed — will be flagged by anomaly detection
    emit(ReVerificationState.missed(
      popupTime: DateTime.now().millisecondsSinceEpoch,
    ));
    emit(const ReVerificationState.idle());
  }

  FutureOr<void> _onTimeout(
    ReVerificationTimeoutEvent event,
    ReVerificationEmitter emit,
  ) {
    _countdownTimer?.cancel();
    _windowTimer?.cancel();

    if (_currentIteration < maxIterations) {
      // More iterations remaining — restart countdown
      _currentIteration++;
      _startCountdown(emit);
    } else {
      // All iterations exhausted — log as missed/failed
      emit(ReVerificationState.missed(
        popupTime: _triggerPopupTime,
      ));
      _currentIteration = 0;
      emit(const ReVerificationState.idle());
    }
  }

  @override
  Future<void> close() {
    _windowTimer?.cancel();
    _countdownTimer?.cancel();
    return super.close();
  }
}

@freezed
class ReVerificationEvent with _$ReVerificationEvent {
  const factory ReVerificationEvent.triggered({
    required ReVerificationTrigger trigger,
  }) = ReVerificationTriggeredEvent;

  const factory ReVerificationEvent.tick() = ReVerificationTickEvent;

  const factory ReVerificationEvent.faceScanned({
    required List<double> embedding,
  }) = ReVerificationFaceScannedEvent;

  const factory ReVerificationEvent.pinUsed({
    required String pin,
    required String individualId,
  }) = ReVerificationPinUsedEvent;

  const factory ReVerificationEvent.dismissed() =
      ReVerificationDismissedEvent;

  const factory ReVerificationEvent.paused() = ReVerificationPausedEvent;

  const factory ReVerificationEvent.resumed() = ReVerificationResumedEvent;

  const factory ReVerificationEvent.externalVerified() =
      ReVerificationExternalVerifiedEvent;

  const factory ReVerificationEvent.timeout() = ReVerificationTimeoutEvent;
}

@freezed
class ReVerificationState with _$ReVerificationState {
  const factory ReVerificationState.idle() = ReVerificationIdleState;

  const factory ReVerificationState.prompted({
    required int popupTime,
    required int remainingSeconds,
    @Default(1) int iteration,
    @Default(3) int maxIterations,
  }) = ReVerificationPromptedState;

  const factory ReVerificationState.scanning() = ReVerificationScanningState;

  const factory ReVerificationState.verified({
    required double confidence,
    required int elapsedMs,
  }) = ReVerificationVerifiedState;

  const factory ReVerificationState.pinFallback() =
      ReVerificationPinFallbackState;

  const factory ReVerificationState.missed({
    required int popupTime,
  }) = ReVerificationMissedState;
}

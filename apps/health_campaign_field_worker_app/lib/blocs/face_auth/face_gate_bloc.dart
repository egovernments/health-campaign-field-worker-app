import 'dart:async';
import 'dart:typed_data';

import 'package:digit_face_verification/digit_face_verification.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/face_auth_config.dart';
import '../../services/worker_registry_service.dart';

part 'face_gate_bloc.freezed.dart';

typedef FaceGateEmitter = Emitter<FaceGateState>;

/// BLoC for the face identity gate shown after HCM login.
/// Verifies face against ALL enrolled profiles on the device.
class FaceGateBloc extends Bloc<FaceGateEvent, FaceGateState> {
  final FaceEmbeddingRepository repository;
  final WorkerRegistryService workerRegistryService;

  /// Loads the face-auth config from its independent MDMS call. Invoked once
  /// (lazily, on the first checkEnrollment) so the server threshold/attempts
  /// are applied BEFORE any verification. Null → keep compile-time defaults.
  final Future<FaceAuthConfig?> Function()? configLoader;
  bool _configLoaded = false;
  // Non-final so AuthenticatedPage can push the MDMS-derived threshold and
  // maxAttempts into a live bloc when those values resolve AFTER the
  // BlocProvider has constructed this bloc. Without this the bloc stays on
  // the compile-time defaults from FaceAuthConfig even though MDMS has new
  // values, and login verification would accept matches at the wrong cutoff.
  double similarityThreshold;
  int maxAttempts;

  int _currentAttempt = 0;

  /// The individual being verified in the current gate session.
  /// Set during checkEnrollment; used to scope face/PIN comparison to
  /// this user only so co-worker embeddings are never matched at login.
  String _targetIndividualId = '';

  FaceGateBloc({
    required this.repository,
    required this.workerRegistryService,
    this.configLoader,
    this.similarityThreshold = FaceAuthConfig.defaultFaceMatchThreshold,
    this.maxAttempts = FaceAuthConfig.defaultMaxFaceAttempts,
  }) : super(const FaceGateState.initial()) {

    on(_onCheckEnrollment);
    on(_onAttemptFaceVerify);
    on(_onPinFallback);
    on(_onSkipToEnrollment);
    on(_onReset);
    on(_onGoToPinEntry);
    on(_onRegistryCheckFailed);
  }

  /// Update threshold and maxAttempts in the live bloc once MDMS resolves.
  /// Called by AuthenticatedPage so the BlocProvider's create-time defaults
  /// aren't used when MDMS has different values for FACE_MATCH_THRESHOLD or
  /// MAX_FACE_ATTEMPTS.
  void updateConfig({double? threshold, int? maxAttempts}) {
    if (threshold != null) similarityThreshold = threshold;
    if (maxAttempts != null) this.maxAttempts = maxAttempts;
  }

  /// Fetches the face-auth config via [configLoader] and applies the server
  /// threshold / max-attempts. Runs at most once per bloc (retries on the
  /// next checkEnrollment only if the previous attempt failed).
  Future<void> _ensureConfigLoaded() async {
    if (_configLoaded || configLoader == null) return;
    try {
      final config = await configLoader!();
      if (config != null) {
        updateConfig(
          threshold: config.faceMatchThreshold,
          maxAttempts: config.maxFaceAttempts,
        );
        _configLoaded = true;
        debugPrint('FaceGateBloc: applied MDMS config '
            'threshold=${config.faceMatchThreshold} '
            'maxAttempts=${config.maxFaceAttempts}');
      }
    } catch (e) {
      debugPrint('FaceGateBloc: config load failed, using defaults: $e');
    }
  }

  FutureOr<void> _onCheckEnrollment(
    FaceGateCheckEnrollmentEvent event,
    FaceGateEmitter emit,
  ) async {
    try {
      debugPrint('FaceGateBloc: checking enrollment for ${event.individualId}...');

      // Step 0: Load the face-auth config from its independent MDMS call
      // before any verification, so the server threshold/attempts apply to
      // this session's scans (falls back to defaults on failure).
      await _ensureConfigLoaded();

      // Step 1: Check if worker exists in the server registry.
      // Skipped for re-verification and for login gate (user is already
      // authenticated — network may be unavailable offline).
      if (!event.skipWorkerCheck) {
        try {
          final workerExists = await workerRegistryService.workerExists(event.individualId);
          debugPrint('FaceGateBloc: workerExists=$workerExists');
          if (!workerExists) {
            emit(const FaceGateState.workerNotFound());
            return;
          }
        } catch (e) {
          // Registry unreachable — fail open and continue to local check.
          debugPrint('FaceGateBloc: workerExists threw (fail-open): $e');
        }
      }

      // Step 2: Check local face enrollment.
      // If individualId is empty (re-verification context), check if any
      // profile exists on the device rather than a specific individual.
      var hasEnrollment = event.individualId.isEmpty
          ? (await repository.getProfileCount()) > 0
          : await repository.hasEmbedding(event.individualId);
      debugPrint('FaceGateBloc: hasEnrollment(local)=$hasEnrollment');

      // Step 3: If not enrolled locally and we have an individualId, try to
      // sync from registry (login gate only — not re-verification).
      if (!hasEnrollment && event.individualId.isNotEmpty) {
        debugPrint('FaceGateBloc: attempting to sync enrollment from registry...');
        try {
          final synced = await workerRegistryService.syncEnrollmentFromRegistry(
            individualId: event.individualId,
            repository: repository,
          );
          debugPrint('FaceGateBloc: syncedFromRegistry=$synced');
          if (synced) hasEnrollment = true;
        } catch (e) {
          // Registry unreachable — skip sync, proceed with local state.
          debugPrint('FaceGateBloc: syncEnrollmentFromRegistry threw (fail-open): $e');
        }
      }

      if (!hasEnrollment) {
        emit(const FaceGateState.notEnrolled());
      } else {
        _currentAttempt = 0;
        _targetIndividualId = event.individualId;
        emit(const FaceGateState.scanning());
      }
    } catch (e) {
      debugPrint('FaceGateBloc: checkEnrollment error: $e');
      emit(FaceGateState.error(message: 'Failed to check enrollment: $e'));
    }
  }

  FutureOr<void> _onAttemptFaceVerify(
    FaceGateAttemptFaceVerifyEvent event,
    FaceGateEmitter emit,
  ) async {
    try {
      _currentAttempt++;
      debugPrint('FaceGateBloc: attemptFaceVerify attempt=$_currentAttempt');

      // Compare only against the target individual's embedding.
      // Using getAllEmbeddings() would allow a co-worker's face to pass login.
      List<FaceEmbedding> allEmbeddings;
      if (_targetIndividualId.isNotEmpty) {
        final target = await repository.getEmbedding(_targetIndividualId);
        allEmbeddings = target != null ? [target] : [];
      } else {
        allEmbeddings = await repository.getAllEmbeddings();
      }
      debugPrint('FaceGateBloc: found ${allEmbeddings.length} enrolled users to compare');

      String? bestMatchId;
      double bestSimilarity = -1.0;

      for (final stored in allEmbeddings) {
        // Compare against the averaged embedding
        final avgSimilarity = DistanceMetrics.cosineSimilarity(
          event.embedding,
          stored.embedding,
        );
        double userBest = avgSimilarity;

        // Also compare against each angle embedding for better matching
        for (final angleEmb in stored.angleEmbeddings) {
          final angleSimilarity = DistanceMetrics.cosineSimilarity(
            event.embedding,
            angleEmb,
          );
          if (angleSimilarity > userBest) {
            userBest = angleSimilarity;
          }
        }

        debugPrint('FaceGateBloc: similarity with ${stored.individualId} '
            'avg=$avgSimilarity best=$userBest '
            '(${stored.angleEmbeddings.length} angles)');

        if (userBest > bestSimilarity) {
          bestSimilarity = userBest;
          bestMatchId = stored.individualId;
        }
      }

      // Hard cutoff: the (MDMS-driven) similarityThreshold is authoritative.
      // No adaptive/per-enrollment adjustment.
      final double effectiveThreshold = similarityThreshold;
      debugPrint('FaceGateBloc: bestSimilarity=$bestSimilarity, '
          'threshold=$effectiveThreshold');

      if (bestSimilarity >= effectiveThreshold && bestMatchId != null) {
        await repository.updateLastVerified(bestMatchId);
        emit(FaceGateState.passed(
          individualId: bestMatchId,
          method: 'FACE_SUCCESS',
          confidence: bestSimilarity,
          faceImageBytes: event.faceImageBytes,
        ));
      } else if (_currentAttempt >= maxAttempts) {
        emit(const FaceGateState.fallbackRequired(
          reason: 'Maximum face verification attempts exceeded',
        ));
      } else {
        emit(FaceGateState.rejected(
          attemptNumber: _currentAttempt,
          maxAttempts: maxAttempts,
          confidence: bestSimilarity,
          faceImageBytes: event.faceImageBytes,
        ));
      }
    } catch (e) {
      debugPrint('FaceGateBloc: attemptFaceVerify error: $e');
      emit(FaceGateState.error(message: 'Face verification failed: $e'));
    }
  }

  FutureOr<void> _onPinFallback(
    FaceGatePinFallbackEvent event,
    FaceGateEmitter emit,
  ) async {
    try {
      final pinService = PinService();

      // Check PIN only against the target individual's profile.
      // Checking all profiles would allow a co-worker's PIN to pass login.
      final profileToCheck = _targetIndividualId.isNotEmpty
          ? await repository.getProfile(_targetIndividualId)
          : null;

      if (profileToCheck == null && _targetIndividualId.isNotEmpty) {
        emit(const FaceGateState.error(message: 'No enrolled profile found'));
        emit(const FaceGateState.pinEntry());
        return;
      }

      final profilesToCheck = profileToCheck != null
          ? [profileToCheck]
          : await repository.getAllProfiles();
      debugPrint('FaceGateBloc: pinFallback checking ${profilesToCheck.length} profiles');

      if (profilesToCheck.isEmpty) {
        emit(const FaceGateState.error(message: 'No enrolled profiles found'));
        return;
      }

      for (final profile in profilesToCheck) {
        final isValid = pinService.verifyPin(
          event.pin,
          profile.pinHash,
          profile.pinSalt,
        );
        if (isValid) {
          await repository.updateLastVerified(profile.individualId);
          emit(FaceGateState.passed(
            individualId: profile.individualId,
            method: 'PIN_FALLBACK',
            confidence: 0.0,
          ));
          return;
        }
      }

      emit(const FaceGateState.error(message: 'Invalid PIN'));
      emit(const FaceGateState.pinEntry());
    } catch (e) {
      debugPrint('FaceGateBloc: pinFallback error: $e');
      emit(FaceGateState.error(message: 'PIN verification failed: $e'));
    }
  }

  FutureOr<void> _onSkipToEnrollment(
    FaceGateSkipToEnrollmentEvent event,
    FaceGateEmitter emit,
  ) {
    emit(const FaceGateState.notEnrolled());
  }

  FutureOr<void> _onReset(
    FaceGateResetEvent event,
    FaceGateEmitter emit,
  ) {
    _currentAttempt = 0;
    _targetIndividualId = '';
    emit(const FaceGateState.initial());
  }

  FutureOr<void> _onGoToPinEntry(
    FaceGateGoToPinEntryEvent event,
    FaceGateEmitter emit,
  ) {
    emit(const FaceGateState.pinEntry());
  }

  FutureOr<void> _onRegistryCheckFailed(
    FaceGateRegistryCheckFailedEvent event,
    FaceGateEmitter emit,
  ) {
    emit(const FaceGateState.registryCheckFailed());
  }
}

@freezed
class FaceGateEvent with _$FaceGateEvent {
  const factory FaceGateEvent.checkEnrollment({
    @Default('') String individualId,
    @Default(false) bool skipWorkerCheck,
  }) = FaceGateCheckEnrollmentEvent;

  const factory FaceGateEvent.attemptFaceVerify({
    required List<double> embedding,
    Uint8List? faceImageBytes,
  }) = FaceGateAttemptFaceVerifyEvent;

  const factory FaceGateEvent.pinFallback({
    required String pin,
    required String individualId,
  }) = FaceGatePinFallbackEvent;

  const factory FaceGateEvent.skipToEnrollment() =
      FaceGateSkipToEnrollmentEvent;


  const factory FaceGateEvent.reset() = FaceGateResetEvent;

  const factory FaceGateEvent.goToPinEntry() = FaceGateGoToPinEntryEvent;

  const factory FaceGateEvent.registryCheckFailed() = FaceGateRegistryCheckFailedEvent;
}

@freezed
class FaceGateState with _$FaceGateState {
  const factory FaceGateState.initial() = FaceGateInitialState;

  const factory FaceGateState.notEnrolled() = FaceGateNotEnrolledState;

  const factory FaceGateState.scanning() = FaceGateScanningState;

  const factory FaceGateState.rejected({
    required int attemptNumber,
    required int maxAttempts,
    @Default(0.0) double confidence,
    Uint8List? faceImageBytes,
  }) = FaceGateRejectedState;

  const factory FaceGateState.fallbackRequired({
    required String reason,
  }) = FaceGateFallbackRequiredState;

  const factory FaceGateState.pinEntry() = FaceGatePinEntryState;

  const factory FaceGateState.passed({
    required String individualId,
    required String method,
    @Default(0.0) double confidence,
    Uint8List? faceImageBytes,
  }) = FaceGatePassedState;

  const factory FaceGateState.error({
    required String message,
  }) = FaceGateErrorState;

  const factory FaceGateState.registryCheckFailed() = FaceGateRegistryCheckFailedState;

  const factory FaceGateState.workerNotFound() = FaceGateWorkerNotFoundState;
}

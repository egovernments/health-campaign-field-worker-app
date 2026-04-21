import 'dart:async';
import 'dart:typed_data';

import 'package:digit_face_verification/digit_face_verification.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/worker_registry_service.dart';

part 'face_gate_bloc.freezed.dart';

typedef FaceGateEmitter = Emitter<FaceGateState>;

/// BLoC for the face identity gate shown after HCM login.
/// Verifies face against ALL enrolled profiles on the device.
class FaceGateBloc extends Bloc<FaceGateEvent, FaceGateState> {
  final FaceEmbeddingRepository repository;
  final WorkerRegistryService workerRegistryService;
  final double similarityThreshold;
  final int maxAttempts;

  int _currentAttempt = 0;

  FaceGateBloc({
    required this.repository,
    required this.workerRegistryService,
    this.similarityThreshold = 0.80,
    this.maxAttempts = 3,
  }) : super(const FaceGateState.initial()) {
    on(_onCheckEnrollment);
    on(_onAttemptFaceVerify);
    on(_onPinFallback);
    on(_onSkipToEnrollment);
    on(_onReset);
    on(_onGoToPinEntry);
    on(_onRegistryCheckFailed);
  }

  FutureOr<void> _onCheckEnrollment(
    FaceGateCheckEnrollmentEvent event,
    FaceGateEmitter emit,
  ) async {
    try {
      debugPrint('FaceGateBloc: checking enrollment for ${event.individualId}...');

      // Step 1: Check if worker exists in the server registry (skip for re-verification)
      if (!event.skipWorkerCheck) {
        final workerExists = await workerRegistryService.workerExists(event.individualId);
        debugPrint('FaceGateBloc: workerExists=$workerExists');
        if (!workerExists) {
          emit(const FaceGateState.workerNotFound());
          return;
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
        final synced = await workerRegistryService.syncEnrollmentFromRegistry(
          individualId: event.individualId,
          repository: repository,
        );
        debugPrint('FaceGateBloc: syncedFromRegistry=$synced');
        if (synced) hasEnrollment = true;
      }

      if (!hasEnrollment) {
        emit(const FaceGateState.notEnrolled());
      } else {
        _currentAttempt = 0;
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

      // Compare against ALL enrolled embeddings (averaged + per-angle)
      final allEmbeddings = await repository.getAllEmbeddings();
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

      // Compute adaptive threshold for best match based on enrollment quality
      double effectiveThreshold = similarityThreshold;
      if (bestMatchId != null) {
        final bestStored = allEmbeddings.firstWhere(
          (e) => e.individualId == bestMatchId,
        );
        if (bestStored.angleEmbeddings.length >= 2) {
          effectiveThreshold = DistanceMetrics.adaptiveThreshold(
            averagedEmbedding: bestStored.embedding,
            angleEmbeddings: bestStored.angleEmbeddings,
            baseThreshold: similarityThreshold,
          );
        }
      }
      debugPrint('FaceGateBloc: bestSimilarity=$bestSimilarity, '
          'effectiveThreshold=$effectiveThreshold (base=$similarityThreshold)');

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

      // Check PIN against ALL profiles on the device
      final allProfiles = await repository.getAllProfiles();
      debugPrint('FaceGateBloc: pinFallback checking ${allProfiles.length} profiles');

      if (allProfiles.isEmpty) {
        emit(const FaceGateState.error(message: 'No enrolled profiles found'));
        return;
      }

      for (final profile in allProfiles) {
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

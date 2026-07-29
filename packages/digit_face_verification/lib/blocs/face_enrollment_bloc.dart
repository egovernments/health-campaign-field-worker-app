import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/face_embedding_repository.dart';
import '../data/pin_service.dart';
import '../models/face_enrollment_profile.dart';
import '../utils/distance_metrics.dart';

part 'face_enrollment_bloc.freezed.dart';

typedef FaceEnrollmentEmitter = Emitter<FaceEnrollmentState>;

class FaceEnrollmentBloc
    extends Bloc<FaceEnrollmentEvent, FaceEnrollmentState> {
  final FaceEmbeddingRepository repository;
  final PinService pinService;
  final int maxProfiles;
  final int requiredAngles;
  final double qualityThreshold;
  final double duplicateThreshold;

  final List<List<double>> _capturedEmbeddings = [];
  String? _individualId;
  bool? _isSystemUser;
  String? _enrolledBy;
  bool _cancelled = false;

  FaceEnrollmentBloc({
    required this.repository,
    PinService? pinService,
    this.maxProfiles = 100,
    this.requiredAngles = 5,
    this.qualityThreshold = 0.6,
    this.duplicateThreshold = 0.75,
  })  : pinService = pinService ?? PinService(),
        super(const FaceEnrollmentState.initial()) {
    on(_onStart);
    on(_onCaptureAngle);
    on(_onLivenessCompleted);
    on(_onRetryAngle);
    on(_onConfirmPin);
    on(_onComplete);
    on(_onCancel);
  }

  /// Total steps including liveness: angle captures + 1 liveness step.
  int get totalSteps => requiredAngles + 1;

  /// Convert captured embedding count to display step number.
  /// Step 1 = front face, step 2 = liveness, steps 3+ = remaining angles.
  int _displayStep(int capturedCount) {
    if (capturedCount == 0) return 1; // Front face
    return capturedCount + 2; // +2 because step 2 is liveness
  }

  FutureOr<void> _onStart(
    FaceEnrollmentStartEvent event,
    FaceEnrollmentEmitter emit,
  ) async {
    _capturedEmbeddings.clear();
    _individualId = event.individualId;
    _isSystemUser = event.isSystemUser;
    _enrolledBy = event.enrolledBy;

    // Block re-enrollment only when both embedding AND profile exist (fully enrolled).
    // hasEmbedding alone returns true for partial writes (embedding saved, profile failed).
    final alreadyEnrolled = await repository.hasEmbedding(_individualId!) &&
        await repository.getProfile(_individualId!) != null;
    if (alreadyEnrolled) {
      emit(const FaceEnrollmentState.completed());
      return;
    }


    emit(FaceEnrollmentState.capturingAngle(
      current: 1,
      total: totalSteps,
      instruction: _getAngleInstruction(0),
    ));
  }

  FutureOr<void> _onCaptureAngle(
    FaceEnrollmentCaptureAngleEvent event,
    FaceEnrollmentEmitter emit,
  ) async {
    if (event.quality < qualityThreshold) {
      emit(const FaceEnrollmentState.qualityInsufficient());
      // Return to current angle capture
      emit(FaceEnrollmentState.capturingAngle(
        current: _displayStep(_capturedEmbeddings.length),
        total: totalSteps,
        instruction: _getAngleInstruction(_capturedEmbeddings.length),
      ));
      return;
    }

    _capturedEmbeddings.add(event.embedding);

    // After the first angle (front face), trigger liveness check
    if (_capturedEmbeddings.length == 1) {
      emit(const FaceEnrollmentState.livenessCheck());
      return;
    }

    // Check if we have all angles
    if (_capturedEmbeddings.length >= requiredAngles) {
      await _processEnrollment(emit);
      return;
    }

    emit(FaceEnrollmentState.capturingAngle(
      current: _displayStep(_capturedEmbeddings.length),
      total: totalSteps,
      instruction: _getAngleInstruction(_capturedEmbeddings.length),
    ));
  }

  FutureOr<void> _onLivenessCompleted(
    FaceEnrollmentLivenessCompletedEvent event,
    FaceEnrollmentEmitter emit,
  ) {
    // Continue to next angle capture (step 3+)
    emit(FaceEnrollmentState.capturingAngle(
      current: _displayStep(_capturedEmbeddings.length),
      total: totalSteps,
      instruction: _getAngleInstruction(_capturedEmbeddings.length),
    ));
  }

  FutureOr<void> _onRetryAngle(
    FaceEnrollmentRetryAngleEvent event,
    FaceEnrollmentEmitter emit,
  ) {
    emit(FaceEnrollmentState.capturingAngle(
      current: _displayStep(_capturedEmbeddings.length),
      total: totalSteps,
      instruction: _getAngleInstruction(_capturedEmbeddings.length),
    ));
  }

  FutureOr<void> _onConfirmPin(
    FaceEnrollmentConfirmPinEvent event,
    FaceEnrollmentEmitter emit,
  ) {
    emit(const FaceEnrollmentState.completed());
  }

  FutureOr<void> _onComplete(
    FaceEnrollmentCompleteEvent event,
    FaceEnrollmentEmitter emit,
  ) {
    _capturedEmbeddings.clear();
    emit(const FaceEnrollmentState.completed());
  }

  FutureOr<void> _onCancel(
    FaceEnrollmentCancelEvent event,
    FaceEnrollmentEmitter emit,
  ) {
    _capturedEmbeddings.clear();
    emit(const FaceEnrollmentState.initial());
  }

  @override
  Future<void> close() {
    _cancelled = true;
    _capturedEmbeddings.clear();
    return super.close();
  }

  Future<void> _processEnrollment(FaceEnrollmentEmitter emit) async {
    if (_cancelled) return;
    emit(const FaceEnrollmentState.processing());

    try {
      // Average the embeddings
      final averaged = _averageEmbeddings(_capturedEmbeddings);

      // Cross-check against existing profiles for twin detection
      final allEmbeddings = await repository.getAllEmbeddings();
      for (final existing in allEmbeddings) {
        if (existing.individualId == _individualId) continue;
        final similarity =
            DistanceMetrics.cosineSimilarity(averaged, existing.embedding);
        if (similarity > duplicateThreshold) {
          emit(FaceEnrollmentState.duplicateDetected(
            matchedId: existing.individualId,
            similarity: similarity,
          ));
          return;
        }
      }

      // Generate PIN
      final pin = pinService.generateDefaultPin();
      final salt = pinService.generateSalt();
      final hash = pinService.hashPin(pin, salt);

      // Save embedding and profile atomically so a mid-write failure cannot
      // leave the account with an embedding but no PIN (un-enrollable state).
      final profile = FaceEnrollmentProfile(
        individualId: _individualId!,
        pinHash: hash,
        pinSalt: salt,
        isSystemUser: _isSystemUser ?? true,
        enrolledByUserId: _enrolledBy ?? '',
        enrolledAt: DateTime.now(),
      );
      await repository.saveEmbeddingAndProfile(
        individualId: _individualId!,
        embedding: averaged,
        angleEmbeddings: List.from(_capturedEmbeddings),
        isSystemUser: _isSystemUser ?? true,
        enrolledBy: _enrolledBy ?? '',
        profile: profile,
      );

      if (_isSystemUser ?? true) {
        emit(FaceEnrollmentState.pinAssigned(pin: pin));
      } else {
        emit(const FaceEnrollmentState.completed());
      }
    } catch (e) {
      debugPrint('FaceEnrollmentBloc: enrollment failed: $e');
      _capturedEmbeddings.clear();
      emit(const FaceEnrollmentState.error(
          message: 'FACE_AUTH_ENROLLMENT_FAILED'));
    }
  }

  /// Average multiple embedding vectors element-wise.
  List<double> _averageEmbeddings(List<List<double>> embeddings) {
    if (embeddings.isEmpty) return [];
    if (embeddings.length == 1) return List.from(embeddings.first);

    final dim = embeddings.first.length;
    // Discard any embedding with the wrong dimension so a short-circuit return
    // from the ML model on an error frame cannot cause a RangeError.
    final valid = embeddings.where((e) => e.length == dim).toList();
    if (valid.isEmpty) return [];
    if (valid.length == 1) return List.from(valid.first);

    final averaged = List<double>.filled(dim, 0.0);

    for (final emb in valid) {
      for (int i = 0; i < dim; i++) {
        averaged[i] += emb[i];
      }
    }

    final count = valid.length.toDouble();
    for (int i = 0; i < dim; i++) {
      averaged[i] /= count;
    }

    // L2 normalize the averaged embedding
    double norm = 0.0;
    for (final v in averaged) {
      norm += v * v;
    }
    norm = norm > 0 ? (1.0 / math.sqrt(norm)) : 1.0;
    for (int i = 0; i < dim; i++) {
      averaged[i] *= norm;
    }

    return averaged;
  }

  String _getAngleInstruction(int index) {
    const instructions = [
      'FACE_AUTH_ANGLE_STRAIGHT',
      'FACE_AUTH_ANGLE_LEFT',
      'FACE_AUTH_ANGLE_RIGHT',
      'FACE_AUTH_ANGLE_UP',
      'FACE_AUTH_ANGLE_DOWN',
    ];
    return index < instructions.length ? instructions[index] : instructions[0];
  }
}

@freezed
class FaceEnrollmentEvent with _$FaceEnrollmentEvent {
  const factory FaceEnrollmentEvent.start({
    required String individualId,
    required bool isSystemUser,
    required String enrolledBy,
  }) = FaceEnrollmentStartEvent;

  const factory FaceEnrollmentEvent.captureAngle({
    required List<double> embedding,
    required double quality,
  }) = FaceEnrollmentCaptureAngleEvent;

  const factory FaceEnrollmentEvent.livenessCompleted() =
      FaceEnrollmentLivenessCompletedEvent;

  const factory FaceEnrollmentEvent.retryAngle() =
      FaceEnrollmentRetryAngleEvent;

  const factory FaceEnrollmentEvent.confirmPin() =
      FaceEnrollmentConfirmPinEvent;

  const factory FaceEnrollmentEvent.complete() = FaceEnrollmentCompleteEvent;

  const factory FaceEnrollmentEvent.cancel() = FaceEnrollmentCancelEvent;
}

@freezed
class FaceEnrollmentState with _$FaceEnrollmentState {
  const factory FaceEnrollmentState.initial() = FaceEnrollmentInitialState;

  const factory FaceEnrollmentState.capturingAngle({
    required int current,
    required int total,
    required String instruction,
  }) = FaceEnrollmentCapturingAngleState;

  const factory FaceEnrollmentState.livenessCheck() =
      FaceEnrollmentLivenessCheckState;

  const factory FaceEnrollmentState.processing() =
      FaceEnrollmentProcessingState;

  const factory FaceEnrollmentState.pinAssigned({
    required String pin,
  }) = FaceEnrollmentPinAssignedState;

  const factory FaceEnrollmentState.completed() = FaceEnrollmentCompletedState;

  const factory FaceEnrollmentState.qualityInsufficient() =
      FaceEnrollmentQualityInsufficientState;

  const factory FaceEnrollmentState.duplicateDetected({
    required String matchedId,
    required double similarity,
  }) = FaceEnrollmentDuplicateDetectedState;

  const factory FaceEnrollmentState.maxUsersReached() =
      FaceEnrollmentMaxUsersReachedState;

  const factory FaceEnrollmentState.error({
    required String message,
  }) = FaceEnrollmentErrorState;
}

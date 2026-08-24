import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/face_embedding_repository.dart';
import '../data/face_model_service.dart';
import '../utils/distance_metrics.dart';

part 'face_verification_bloc.freezed.dart';

typedef FaceVerificationEmitter = Emitter<FaceVerificationState>;

class FaceVerificationBloc
    extends Bloc<FaceVerificationEvent, FaceVerificationState> {
  final FaceModelService faceModelService;
  final FaceEmbeddingRepository embeddingRepository;

  /// Hard match cutoff. Overridden by [thresholdLoader] (e.g. MDMS) on the
  /// first verify; non-final so the resolved value can be applied.
  double similarityThreshold;

  /// Loads the authoritative threshold (e.g. from the independent MDMS call).
  /// Applied once, lazily, before the first verification. Null → keep the
  /// constructor value.
  final Future<double?> Function()? thresholdLoader;
  bool _thresholdLoaded = false;

  FaceVerificationBloc({
    required this.faceModelService,
    required this.embeddingRepository,
    this.thresholdLoader,
    this.similarityThreshold = DistanceMetrics.defaultThreshold,
  }) : super(const FaceVerificationState.idle()) {
    on(_onInitialize);
    on(_onRegisterFace);
    on(_onVerifyFace);
    on(_onDeleteRegistration);
    on(_onFaceDetected);
    on(_onReset);
  }

  /// Loads the authoritative threshold once (retries next verify on failure).
  Future<void> _ensureThreshold() async {
    if (_thresholdLoaded || thresholdLoader == null) return;
    try {
      final t = await thresholdLoader!();
      if (t != null && t.isFinite && t >= 0.70 && t <= 1.0) {
        similarityThreshold = t;
        _thresholdLoaded = true;
      }
    } catch (_) {
      // Keep the constructor/default threshold on failure.
    }
  }

  FutureOr<void> _onInitialize(
    FaceVerificationInitializeEvent event,
    FaceVerificationEmitter emit,
  ) async {
    try {
      emit(const FaceVerificationState.processing(
        message: 'FACE_AUTH_INITIALIZING',
      ));
      await faceModelService.initialize();
      emit(const FaceVerificationState.idle());
    } catch (e) {
      debugPrint('FaceVerificationBloc: init failed: $e');
      emit(const FaceVerificationState.error(
        message: 'FACE_AUTH_INIT_FAILED',
      ));
    }
  }

  FutureOr<void> _onRegisterFace(
    FaceVerificationRegisterEvent event,
    FaceVerificationEmitter emit,
  ) async {
    try {
      emit(const FaceVerificationState.processing(
        message: 'FACE_AUTH_PROCESSING',
      ));

      if (event.embedding.isEmpty) {
        emit(const FaceVerificationState.noFaceDetected());
        return;
      }

      // This path is for non-system (co-worker) face registration — no PIN
      // profile is created here because co-workers authenticate by face only.
      await embeddingRepository.saveEmbedding(
        individualId: event.individualId,
        embedding: event.embedding,
        isSystemUser: false,
      );

      emit(FaceVerificationState.registered(
        individualId: event.individualId,
        confidence: event.quality,
      ));
    } catch (e) {
      debugPrint('FaceVerificationBloc: registration failed: $e');
      emit(const FaceVerificationState.error(
          message: 'FACE_AUTH_REGISTRATION_FAILED'));
    }
  }

  FutureOr<void> _onVerifyFace(
    FaceVerificationVerifyEvent event,
    FaceVerificationEmitter emit,
  ) async {
    try {
      emit(const FaceVerificationState.processing(
        message: 'FACE_AUTH_VERIFYING',
      ));

      // Apply the authoritative (e.g. MDMS) threshold before matching.
      await _ensureThreshold();

      final stored = await embeddingRepository.getEmbedding(
        event.individualId,
      );

      if (stored == null) {
        emit(const FaceVerificationState.error(
          message: 'FACE_AUTH_NO_REGISTERED_FACE',
        ));
        return;
      }

      // Compare against averaged embedding and each angle embedding; take the best.
      final candidates = [stored.embedding, ...stored.angleEmbeddings];

      double bestSimilarity = double.negativeInfinity;
      for (final ref in candidates) {
        final sim = DistanceMetrics.cosineSimilarity(event.embedding, ref);
        if (sim > bestSimilarity) bestSimilarity = sim;
      }

      if (bestSimilarity >= similarityThreshold) {
        emit(FaceVerificationState.verified(
          confidence: bestSimilarity,
          faceImageBytes: event.faceImageBytes,
        ));
      } else {
        emit(FaceVerificationState.rejected(
          confidence: bestSimilarity,
          faceImageBytes: event.faceImageBytes,
        ));
      }
    } catch (e) {
      debugPrint('FaceVerificationBloc: verification failed: $e');
      emit(const FaceVerificationState.error(
          message: 'FACE_AUTH_VERIFICATION_FAILED'));
    }
  }

  FutureOr<void> _onDeleteRegistration(
    FaceVerificationDeleteEvent event,
    FaceVerificationEmitter emit,
  ) async {
    try {
      await embeddingRepository.deleteEmbedding(event.individualId);
      emit(const FaceVerificationState.idle());
    } catch (e) {
      debugPrint('FaceVerificationBloc: delete failed: $e');
      emit(const FaceVerificationState.error(
          message: 'FACE_AUTH_DELETE_FAILED'));
    }
  }

  FutureOr<void> _onFaceDetected(
    FaceVerificationFaceDetectedEvent event,
    FaceVerificationEmitter emit,
  ) {
    if (event.faceCount == 0) {
      emit(const FaceVerificationState.noFaceDetected());
    } else if (event.faceCount > 1) {
      emit(const FaceVerificationState.multipleFacesDetected());
    } else {
      emit(FaceVerificationState.detecting(quality: event.quality));
    }
  }

  FutureOr<void> _onReset(
    FaceVerificationResetEvent event,
    FaceVerificationEmitter emit,
  ) {
    emit(const FaceVerificationState.idle());
  }
}

@freezed
class FaceVerificationEvent with _$FaceVerificationEvent {
  const factory FaceVerificationEvent.initialize() =
      FaceVerificationInitializeEvent;

  const factory FaceVerificationEvent.registerFace({
    required String individualId,
    required List<double> embedding,
    @Default(1.0) double quality,
  }) = FaceVerificationRegisterEvent;

  const factory FaceVerificationEvent.verifyFace({
    required String individualId,
    required List<double> embedding,
    Uint8List? faceImageBytes,
  }) = FaceVerificationVerifyEvent;

  const factory FaceVerificationEvent.deleteRegistration({
    required String individualId,
  }) = FaceVerificationDeleteEvent;

  const factory FaceVerificationEvent.faceDetected({
    required int faceCount,
    @Default(0.0) double quality,
  }) = FaceVerificationFaceDetectedEvent;

  const factory FaceVerificationEvent.reset() = FaceVerificationResetEvent;
}

@freezed
class FaceVerificationState with _$FaceVerificationState {
  const factory FaceVerificationState.idle() = FaceVerificationIdleState;

  const factory FaceVerificationState.detecting({
    @Default(0.0) double quality,
  }) = FaceVerificationDetectingState;

  const factory FaceVerificationState.processing({
    @Default('') String message,
  }) = FaceVerificationProcessingState;

  const factory FaceVerificationState.registered({
    required String individualId,
    required double confidence,
  }) = FaceVerificationRegisteredState;

  const factory FaceVerificationState.verified({
    required double confidence,
    Uint8List? faceImageBytes,
  }) = FaceVerificationVerifiedState;

  const factory FaceVerificationState.rejected({
    required double confidence,
    Uint8List? faceImageBytes,
  }) = FaceVerificationRejectedState;

  const factory FaceVerificationState.noFaceDetected() =
      FaceVerificationNoFaceState;

  const factory FaceVerificationState.multipleFacesDetected() =
      FaceVerificationMultipleFacesState;

  const factory FaceVerificationState.error({
    required String message,
  }) = FaceVerificationErrorState;
}

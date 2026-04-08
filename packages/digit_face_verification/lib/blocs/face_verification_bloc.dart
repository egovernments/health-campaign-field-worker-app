import 'dart:async';

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
  final double similarityThreshold;

  FaceVerificationBloc({
    required this.faceModelService,
    required this.embeddingRepository,
    this.similarityThreshold = DistanceMetrics.defaultThreshold,
  }) : super(const FaceVerificationState.idle()) {
    on(_onInitialize);
    on(_onRegisterFace);
    on(_onVerifyFace);
    on(_onDeleteRegistration);
    on(_onFaceDetected);
    on(_onReset);
  }

  FutureOr<void> _onInitialize(
    FaceVerificationInitializeEvent event,
    FaceVerificationEmitter emit,
  ) async {
    try {
      emit(const FaceVerificationState.processing(
        message: 'Initializing face recognition...',
      ));
      await faceModelService.initialize();
      emit(const FaceVerificationState.idle());
    } catch (e) {
      emit(FaceVerificationState.error(
        message: 'Failed to initialize: $e',
      ));
    }
  }

  FutureOr<void> _onRegisterFace(
    FaceVerificationRegisterEvent event,
    FaceVerificationEmitter emit,
  ) async {
    try {
      emit(const FaceVerificationState.processing(
        message: 'Processing face...',
      ));

      if (event.embedding.isEmpty) {
        emit(const FaceVerificationState.noFaceDetected());
        return;
      }

      await embeddingRepository.saveEmbedding(
        individualId: event.individualId,
        embedding: event.embedding,
      );

      emit(FaceVerificationState.registered(
        individualId: event.individualId,
        confidence: event.quality,
      ));
    } catch (e) {
      emit(FaceVerificationState.error(message: 'Registration failed: $e'));
    }
  }

  FutureOr<void> _onVerifyFace(
    FaceVerificationVerifyEvent event,
    FaceVerificationEmitter emit,
  ) async {
    try {
      emit(const FaceVerificationState.processing(
        message: 'Verifying face...',
      ));

      final stored = await embeddingRepository.getEmbedding(
        event.individualId,
      );

      if (stored == null) {
        emit(const FaceVerificationState.error(
          message: 'No registered face found. Please register first.',
        ));
        return;
      }

      final result = DistanceMetrics.verify(
        event.embedding,
        stored.embedding,
        threshold: similarityThreshold,
      );

      if (result.isMatch) {
        emit(FaceVerificationState.verified(
          confidence: result.similarity,
        ));
      } else {
        emit(FaceVerificationState.rejected(
          confidence: result.similarity,
        ));
      }
    } catch (e) {
      emit(FaceVerificationState.error(message: 'Verification failed: $e'));
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
      emit(FaceVerificationState.error(message: 'Delete failed: $e'));
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
  }) = FaceVerificationVerifiedState;

  const factory FaceVerificationState.rejected({
    required double confidence,
  }) = FaceVerificationRejectedState;

  const factory FaceVerificationState.noFaceDetected() =
      FaceVerificationNoFaceState;

  const factory FaceVerificationState.multipleFacesDetected() =
      FaceVerificationMultipleFacesState;

  const factory FaceVerificationState.error({
    required String message,
  }) = FaceVerificationErrorState;
}

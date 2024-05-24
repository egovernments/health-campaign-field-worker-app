// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/data_model.dart';
import '../../utils/typedefs.dart';

part 'record_referral.freezed.dart';

typedef RecordHFReferralEmitter = Emitter<RecordHFReferralState>;

class RecordHFReferralBloc
    extends Bloc<RecordHFReferralEvent, RecordHFReferralState> {
  final HFReferralDataRepository hfReferralRepository;

  RecordHFReferralBloc(
    super.initialState, {
    required this.hfReferralRepository,
  }) {
    on(_handleSaveFacilityDetails);
    on(_handleCreateHFReferralEntry);
    on(_handleViewHFReferralEntry);
  }

  FutureOr<void> _handleSaveFacilityDetails(
    RecordHFReferralSaveFacilityDetailsEvent event,
    RecordHFReferralEmitter emit,
  ) async {
    state.maybeMap(
      orElse: () {
        throw const InvalidRecordHFReferralStateException();
      },
      create: (value) {
        emit(value.copyWith(
          facilityId: event.facilityId,
          dateOfEvaluation: event.dateOfEvaluation,
          healthFacilityCord: event.healthFacilityCord,
          referredBy: event.referredBy,
        ));
      },
    );
  }

  FutureOr<void> _handleCreateHFReferralEntry(
    RecordHFReferralCreateEntryEvent event,
    RecordHFReferralEmitter emit,
  ) async {
    await state.maybeMap(
      orElse: () {
        throw const InvalidRecordHFReferralStateException();
      },
      create: (value) async {
        if (!value.viewOnly) {
          final facilityId = event.hfReferralModel.projectFacilityId;
          final dateOfEvaluation =
              event.hfReferralModel.auditDetails?.createdTime;

          if (facilityId == null || facilityId.trim().toString().isEmpty) {
            throw const InvalidRecordHFReferralStateException(
              'Facility cannot be null',
            );
          }
          if (dateOfEvaluation == null) {
            throw const InvalidRecordHFReferralStateException(
              'Date of Evaluation cannot be null',
            );
          }

          emit(value.copyWith(loading: true));

          try {
            if (event.hfReferralModel != null) {
              await hfReferralRepository.create(
                event.hfReferralModel,
              );

              emit(
                RecordHFReferralPersistedState(
                  hfReferralModel: event.hfReferralModel,
                  projectId: value.projectId,
                  facilityId: value.facilityId,
                  dateOfEvaluation: value.dateOfEvaluation,
                  healthFacilityCord: value.healthFacilityCord,
                  referredBy: value.referredBy,
                ),
              );
            }
          } catch (error) {
            emit(value.copyWith(loading: false));
            rethrow;
          }
        } else {
          emit(
            value.copyWith(
              hfReferralModel: value.hfReferralModel,
              viewOnly: value.viewOnly,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _handleViewHFReferralEntry(
    RecordHFReferralViewEvent event,
    RecordHFReferralEmitter emit,
  ) async {
    await state.maybeMap(
      orElse: () {
        throw const InvalidRecordHFReferralStateException();
      },
      view: (value) async {
        final facilityId = event.hfReferralModel.projectFacilityId;
        final dateOfEvaluation =
            event.hfReferralModel.auditDetails?.createdTime;

        if (facilityId == null || facilityId.trim().toString().isEmpty) {
          throw const InvalidRecordHFReferralStateException(
            'Facility cannot be null',
          );
        }
        if (dateOfEvaluation == null) {
          throw const InvalidRecordHFReferralStateException(
            'Date of Evaluation cannot be null',
          );
        }

        try {
          emit(
            RecordHFReferralViewState(
              hfReferralModel: event.hfReferralModel,
              projectId: value.projectId,
            ),
          );
        } catch (error) {
          emit(const RecordHFReferralErrorState(error: 'Unable to fetch'));
          rethrow;
        }
      },
    );
  }
}

@freezed
class RecordHFReferralEvent with _$RecordHFReferralEvent {
  const factory RecordHFReferralEvent.saveFacilityDetails({
    required DateTime dateOfEvaluation,
    required String facilityId,
    String? healthFacilityCord,
    String? referredBy,
  }) = RecordHFReferralSaveFacilityDetailsEvent;

  const factory RecordHFReferralEvent.createReferralEntry({
    required HFReferralModel hfReferralModel,
  }) = RecordHFReferralCreateEntryEvent;

  const factory RecordHFReferralEvent.viewReferral({
    required HFReferralModel hfReferralModel,
  }) = RecordHFReferralViewEvent;
}

@freezed
class RecordHFReferralState with _$RecordHFReferralState {
  const factory RecordHFReferralState.create({
    @Default(false) bool loading,
    required String projectId,
    String? facilityId,
    DateTime? dateOfEvaluation,
    String? healthFacilityCord,
    String? referredBy,
    HFReferralModel? hfReferralModel,
    @Default(false) bool viewOnly,
  }) = RecordHFReferralCreateState;

  const factory RecordHFReferralState.persisted({
    required String projectId,
    String? facilityId,
    DateTime? dateOfEvaluation,
    String? healthFacilityCord,
    String? referredBy,
    HFReferralModel? hfReferralModel,
    @Default(false) bool viewOnly,
  }) = RecordHFReferralPersistedState;
  const factory RecordHFReferralState.view({
    required String projectId,
    String? facilityId,
    DateTime? dateOfEvaluation,
    String? healthFacilityCord,
    String? referredBy,
    HFReferralModel? hfReferralModel,
    @Default(false) bool viewOnly,
  }) = RecordHFReferralViewState;
  const factory RecordHFReferralState.error({
    String? error,
  }) = RecordHFReferralErrorState;
}

class InvalidRecordHFReferralStateException implements Exception {
  final String? message;

  const InvalidRecordHFReferralStateException([this.message]);
}

// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:referral_reconciliation/blocs/referral_reconciliation_listeners.dart';

import '../models/entities/h_f_referral.dart';

part 'referral_recon_record.freezed.dart';

typedef RecordHFReferralEmitter = Emitter<RecordHFReferralState>;

class RecordHFReferralBloc
    extends Bloc<RecordHFReferralEvent, RecordHFReferralState> {
  RecordHFReferralBloc(
    super.initialState,
  ) {
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
    bool referralSaved = false;
    await state.maybeMap(
      orElse: () {
        throw const InvalidRecordHFReferralStateException();
      },
      create: (value) async {
        if (!value.viewOnly) {
          final facilityId = event.hfReferralModel.projectFacilityId;
          final dateOfEvaluation = int.tryParse(
              event.additionalData?['dateOfEvaluation'].toString() ??
                  DateTime.now().millisecondsSinceEpoch.toString());

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
              ReferralReconSingleton()
                  .saveReferralReconDetails(ReferralReconciliation(
                hfReferralModel: event.hfReferralModel,
                additionalData:
                    event.additionalData != null ? event.additionalData! : {},
              ));

              emit(
                RecordHFReferralPersistedState(
                  hfReferralModel: event.hfReferralModel,
                  additionalData: event.additionalData,
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
        final dateOfEvaluation = int.tryParse(
            event.additionalData?['dateOfEvaluation'].toString() ??
                DateTime.now().millisecondsSinceEpoch.toString());

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
              additionalData: event.additionalData,
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
    required Map<String, Object>? additionalData,
  }) = RecordHFReferralCreateEntryEvent;

  const factory RecordHFReferralEvent.viewReferral({
    required HFReferralModel hfReferralModel,
    required Map<String, Object>? additionalData,
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
    Map<String, Object>? additionalData,
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
    Map<String, Object>? additionalData,
  }) = RecordHFReferralPersistedState;
  const factory RecordHFReferralState.view({
    required String projectId,
    String? facilityId,
    DateTime? dateOfEvaluation,
    String? healthFacilityCord,
    String? referredBy,
    HFReferralModel? hfReferralModel,
    @Default(false) bool viewOnly,
    Map<String, Object>? additionalData,
  }) = RecordHFReferralViewState;
  const factory RecordHFReferralState.error({
    String? error,
  }) = RecordHFReferralErrorState;
}

class InvalidRecordHFReferralStateException implements Exception {
  final String? message;

  const InvalidRecordHFReferralStateException([this.message]);
}

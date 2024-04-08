import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:referral_reconciliation/blocs/referral_reconciliation_listeners.dart';

import '../models/entities/referral_project_facility.dart';

part 'project_facility.freezed.dart';

typedef ReferralReconProjectFacilityStateEmitter
    = Emitter<ReferralReconProjectFacilityState>;

class ReferralReconProjectFacilityBloc extends Bloc<
    ReferralReconProjectFacilityEvent, ReferralReconProjectFacilityState> {
  ReferralReconProjectFacilityBloc(super.initialState) {
    on(_handleLoadProjectFacilitiesForProjectId);
  }

  Future<void> _handleLoadProjectFacilitiesForProjectId(
    ProjectFacilityLoadForProjectEvent event,
    ReferralReconProjectFacilityStateEmitter emit,
  ) async {
    emit(const ProjectFacilityLoadingState());
    List<ReferralProjectFacilityModel>? projectFacilities =
        await ReferralReconSingleton().getProjectFacilitiesForProjectId();
    if (projectFacilities == null) {
      emit(const ProjectFacilityEmptyState());
    } else {
      emit(ProjectFacilityFetchedState(projectFacilities: projectFacilities));
    }
  }
}

@freezed
class ReferralReconProjectFacilityEvent
    with _$ReferralReconProjectFacilityEvent {
  const factory ReferralReconProjectFacilityEvent.loadForProjectId({
    required String projectId,
    @Default(true) bool loadAllProjects,
  }) = ProjectFacilityLoadForProjectEvent;
}

@freezed
class ReferralReconProjectFacilityState
    with _$ReferralReconProjectFacilityState {
  const factory ReferralReconProjectFacilityState.empty() =
      ProjectFacilityEmptyState;

  const factory ReferralReconProjectFacilityState.loading() =
      ProjectFacilityLoadingState;

  const factory ReferralReconProjectFacilityState.fetched({
    required List<ReferralProjectFacilityModel> projectFacilities,
  }) = ProjectFacilityFetchedState;
}

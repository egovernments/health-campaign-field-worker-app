import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:referral_reconciliation/blocs/referral_reconciliation_listeners.dart';

import '../models/entities/referral_project_facility.dart';

part 'project_facility.freezed.dart';

// Define a typedef for the emitter function used to emit state changes.
typedef ReferralReconProjectFacilityStateEmitter
    = Emitter<ReferralReconProjectFacilityState>;

// Define the Bloc responsible for managing ReferralReconProjectFacility events and states.
class ReferralReconProjectFacilityBloc extends Bloc<
    ReferralReconProjectFacilityEvent, ReferralReconProjectFacilityState> {
  // Constructor initializes the Bloc with an initial state and sets up event handlers.
  ReferralReconProjectFacilityBloc(super.initialState) {
    on(_handleLoadProjectFacilitiesForProjectId);
  }

  // Event handler for loading project facilities for a project ID.
  Future<void> _handleLoadProjectFacilitiesForProjectId(
    ProjectFacilityLoadForProjectEvent event,
    ReferralReconProjectFacilityStateEmitter emit,
  ) async {
    // Emit loading state.
    emit(const ProjectFacilityLoadingState());
    // Fetch project facilities for the specified project ID.
    List<ReferralProjectFacilityModel>? projectFacilities =
        await ReferralReconSingleton().getProjectFacilitiesForProjectId();

    // Check if project facilities are fetched successfully.
    if (projectFacilities == null) {
      emit(const ProjectFacilityEmptyState());
    } else {
      emit(ProjectFacilityFetchedState(projectFacilities: projectFacilities));
    }
  }
}

// Define freezed classes for the ReferralReconProjectFacility events.
@freezed
class ReferralReconProjectFacilityEvent
    with _$ReferralReconProjectFacilityEvent {
  const factory ReferralReconProjectFacilityEvent.loadForProjectId({
    required String projectId,
    @Default(true) bool loadAllProjects,
  }) = ProjectFacilityLoadForProjectEvent;
}

// Define freezed classes for the ReferralReconProjectFacility states.
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

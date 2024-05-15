import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/utils.dart';

part 'project_facility.freezed.dart';

// Define a typedef for the emitter function used to emit state changes.
typedef ReferralReconProjectFacilityStateEmitter
    = Emitter<ReferralReconProjectFacilityState>;

// Define the Bloc responsible for managing ReferralReconProjectFacility events and states.
class ReferralReconProjectFacilityBloc extends Bloc<
    ReferralReconProjectFacilityEvent, ReferralReconProjectFacilityState> {
  BuildContext context;
  // Constructor initializes the Bloc with an initial state and sets up event handlers.
  ReferralReconProjectFacilityBloc(super.initialState,
      {required this.context}) {
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
    final facilitiesBloc = context.read<ProjectFacilityBloc>();
    facilitiesBloc.add(ProjectFacilityLoadEvent(
      query: ProjectFacilitySearchModel(
        projectId: [ReferralReconSingleton().projectId],
      ),
    ));

    final facilitiesState = await facilitiesBloc.stream.firstWhere(
      (state) => state.maybeWhen(
        fetched: (
          facilities,
        ) =>
            true,
        orElse: () => false,
      ),
    );

    List<ProjectFacilityModel> projectFacilities = [];
    facilitiesState.maybeWhen(
      fetched: (
        facilities,
      ) {
        for (var element in facilities) {
          projectFacilities.add(
            element,
          );
        }
      },
      orElse: () {},
    );

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
    required List<ProjectFacilityModel> projectFacilities,
  }) = ProjectFacilityFetchedState;
}

// Importing necessary packages and files.
import 'dart:async';

import 'package:digit_data_model/models/entities/project_facility.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/typedefs.dart';

// Part directive for the generated code.
part 'project_facility.freezed.dart';

// Type alias for a function that emits a `ProjectFacilityState`.
typedef ProjectFacilityEmitter = Emitter<ProjectFacilityState>;

/// `ProjectFacilityBloc` is a class that extends `Bloc` and manages the state of project facilities.
/// It uses `ProjectFacilityDataRepository` to interact with the data layer.
class ProjectFacilityBloc
    extends Bloc<ProjectFacilityEvent, ProjectFacilityState> {
  // The data repository used by this bloc.
  final ProjectFacilityDataRepository projectFacilityDataRepository;

  /// The constructor for `ProjectFacilityBloc`.
  /// It initializes the bloc with an empty state and sets up the event handler for loading project facilities.
  ProjectFacilityBloc(
    super.initialState, {
    required this.projectFacilityDataRepository,
  }) {
    on(_handleLoad);
  }

  /// The `_handleLoad` method handles the `ProjectFacilityLoadEvent` event.
  /// It loads the project facilities and emits a new state.
  FutureOr<void> _handleLoad(
    ProjectFacilityLoadEvent event,
    ProjectFacilityEmitter emit,
  ) async {
    emit(const ProjectFacilityLoadingState());
    List<ProjectFacilityModel> results =
        await projectFacilityDataRepository.search(
      event.query,
    );
    List<ProjectFacilityModel> ss = [
      ProjectFacilityModel(
          id: 'ier-383-dhd', facilityId: "FCT-YU-09", projectId: "demo"),
    ];
    results.addAll(ss);

    if (results.isEmpty) {
      emit(const ProjectFacilityEmptyState());
    } else {
      emit(ProjectFacilityFetchedState(projectFacilities: results));
    }
  }
}

/// `ProjectFacilityEvent` is a freezed union of all possible events that can occur in the `ProjectFacilityBloc`.
@freezed
class ProjectFacilityEvent with _$ProjectFacilityEvent {
  /// The `ProjectFacilityLoadEvent` event is triggered when project facilities need to be loaded.
  const factory ProjectFacilityEvent.load({
    required ProjectFacilitySearchModel query,
  }) = ProjectFacilityLoadEvent;
}

/// `ProjectFacilityState` is a freezed union of all possible states that can occur in the `ProjectFacilityBloc`.
@freezed
class ProjectFacilityState with _$ProjectFacilityState {
  /// The `ProjectFacilityEmptyState` state represents the state where no project facilities are loaded.
  const factory ProjectFacilityState.empty() = ProjectFacilityEmptyState;

  /// The `ProjectFacilityLoadingState` state represents the state where project facilities are being loaded.
  const factory ProjectFacilityState.loading() = ProjectFacilityLoadingState;

  /// The `ProjectFacilityFetchedState` state represents the state where project facilities have been loaded.
  const factory ProjectFacilityState.fetched({
    required List<ProjectFacilityModel> projectFacilities,
  }) = ProjectFacilityFetchedState;
}

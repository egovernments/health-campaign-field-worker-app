// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/entities/project_facility.dart';
import '../../utils/typedefs.dart';

part 'project_facility.freezed.dart';

typedef ProjectFacilityEmitter = Emitter<ProjectFacilityState>;

class ProjectFacilityBloc
    extends Bloc<ProjectFacilityEvent, ProjectFacilityState> {
  final ProjectFacilityDataRepository projectFacilityDataRepository;

  ProjectFacilityBloc(
    super.initialState, {
    required this.projectFacilityDataRepository,
  }) {
    on(_handleLoad);
  }

  FutureOr<void> _handleLoad(
    ProjectFacilityLoadEvent event,
    ProjectFacilityEmitter emit,
  ) async {
    emit(const ProjectFacilityEmptyState());
    final results = await projectFacilityDataRepository.search(
      event.query,
    );

    if (results.isEmpty) {
      emit(const ProjectFacilityEmptyState());
    } else {
      emit(ProjectFacilityFetchedState(projectFacilities: results));
    }
  }
}

@freezed
class ProjectFacilityEvent with _$ProjectFacilityEvent {
  const factory ProjectFacilityEvent.load({
    required ProjectFacilitySearchModel query,
  }) = ProjectFacilityLoadEvent;
}

@freezed
class ProjectFacilityState with _$ProjectFacilityState {
  const factory ProjectFacilityState.empty() = ProjectFacilityEmptyState;

  const factory ProjectFacilityState.loading() = ProjectFacilityLoadingState;

  const factory ProjectFacilityState.fetched({
    required List<ProjectFacilityModel> projectFacilities,
  }) = ProjectFacilityFetchedState;
}

// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/local_store/sql_store/sql_store.dart';
import '../../data/repositories/local/project.dart';
import '../../data/repositories/local/project_staff.dart';
import '../../data/repositories/oplog/oplog.dart';
import '../../data/repositories/remote/project.dart';
import '../../data/repositories/remote/project_staff.dart';
import '../../models/data_model.dart';

part 'project.freezed.dart';

typedef ProjectEmitter = Emitter<ProjectState>;

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final LocalSecureStore localSecureStore;

  final ProjectStaffRemoteRepository projectStaffRemoteRepository;
  final ProjectRemoteRepository projectRemoteRepository;

  final Isar isar;
  final LocalSqlDataStore sql;

  ProjectBloc({
    LocalSecureStore? localSecureStore,
    required this.projectStaffRemoteRepository,
    required this.projectRemoteRepository,
    required this.sql,
    required this.isar,
  })  : localSecureStore = localSecureStore ?? LocalSecureStore.instance,
        super(const ProjectsEmptyState()) {
    on(_handleProjectInit);
    on(_handleProjectSelection);
  }

  FutureOr<void> _handleProjectInit(
    ProjectInitializeEvent event,
    ProjectEmitter emit,
  ) async {
    emit(const ProjectLoadingState());
    final userObject = await localSecureStore.userRequestModel;
    final uuid = userObject?.uuid;

    final projectStaffList = await projectStaffRemoteRepository.search(
      ProjectStaffSearchModel(staffId: uuid),
    );

    if (projectStaffList.isEmpty) {
      emit(const ProjectsEmptyState());
    } else {
      final projectStaff = projectStaffList.first;

      await ProjectStaffLocalRepository(sql, ProjectStaffOpLogManager(isar))
          .create(
        projectStaff,
        createOpLog: false,
      );

      final projects = await projectRemoteRepository.search(
        ProjectSearchModel(
          id: projectStaff.projectId,
          tenantId: projectStaff.tenantId,
        ),
      );

      for (final project in projects) {
        await ProjectLocalRepository(
          sql,
          ProjectOpLogManager(isar),
        ).create(
          project,
          createOpLog: false,
        );
      }
      emit(ProjectSelectionFetchedState(projects: projects));
    }
  }

  Future<void> _handleProjectSelection(
    ProjectSelectProjectEvent event,
    ProjectEmitter emit,
  ) async {
    state.maybeMap(
      orElse: () {
        return;
      },
      fetched: (value) {
        emit(value.copyWith(selectedProject: event.model));
      },
    );
  }
}

@freezed
class ProjectEvent with _$ProjectEvent {
  const factory ProjectEvent.initialize() = ProjectInitializeEvent;

  const factory ProjectEvent.selectProject(ProjectModel model) =
      ProjectSelectProjectEvent;
}

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState.uninitialized() = ProjectUninitializedState;

  const factory ProjectState.loading() = ProjectLoadingState;

  const factory ProjectState.empty() = ProjectsEmptyState;

  const factory ProjectState.fetched({
    required List<ProjectModel> projects,
    ProjectModel? selectedProject,
  }) = ProjectSelectionFetchedState;
}

// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart';

import '../../data/data_repository.dart';
import '../../data/local_store/secure_store/secure_store.dart';
import '../../models/auth/auth_model.dart';
import '../../models/data_model.dart';
import '../../utils/environment_config.dart';
import '../../utils/utils.dart';

part 'project.freezed.dart';

typedef ProjectEmitter = Emitter<ProjectState>;

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final LocalSecureStore localSecureStore;

  /// Project Staff Repositories
  final RemoteRepository<ProjectStaffModel, ProjectStaffSearchModel>
      projectStaffRemoteRepository;
  final LocalRepository<ProjectStaffModel, ProjectStaffSearchModel>
      projectStaffLocalRepository;

  /// Project Repositories
  final RemoteRepository<ProjectModel, ProjectSearchModel>
      projectRemoteRepository;
  final LocalRepository<ProjectModel, ProjectSearchModel>
      projectLocalRepository;

  /// Project Facility Repositories
  final RemoteRepository<ProjectFacilityModel, ProjectFacilitySearchModel>
      projectFacilityRemoteRepository;
  final LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel>
      projectFacilityLocalRepository;

  /// Facility Repositories
  final RemoteRepository<FacilityModel, FacilitySearchModel>
      facilityRemoteRepository;
  final LocalRepository<FacilityModel, FacilitySearchModel>
      facilityLocalRepository;

  final RemoteRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel>
      serviceDefinitionremoteRepository;
  final LocalRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel>
      serviceLocalremoteRepository;

  ProjectBloc({
    LocalSecureStore? localSecureStore,
    required this.projectStaffRemoteRepository,
    required this.projectRemoteRepository,
    required this.projectStaffLocalRepository,
    required this.projectLocalRepository,
    required this.projectFacilityRemoteRepository,
    required this.projectFacilityLocalRepository,
    required this.facilityRemoteRepository,
    required this.facilityLocalRepository,
    required this.serviceDefinitionremoteRepository,
    required this.serviceLocalremoteRepository,
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

    List<ProjectStaffModel> projectStaffList =
        await projectStaffRemoteRepository.search(
      ProjectStaffSearchModel(staffId: uuid),
    );

    projectStaffList.removeDuplicates((e) => e.id);

    if (projectStaffList.isEmpty) {
      emit(const ProjectsEmptyState());
    } else {
      List<ProjectModel> projects = [];

      for (final projectStaff in projectStaffList) {
        await projectStaffLocalRepository.create(
          projectStaff,
          createOpLog: false,
        );

        final staffProjects = await projectRemoteRepository.search(
          ProjectSearchModel(
            id: projectStaff.projectId,
            tenantId: projectStaff.tenantId,
          ),
        );

        projects.addAll(staffProjects);
      }

      projects.removeDuplicates((e) => e.id);
      projects.removeDuplicates(
        (element) => element.id,
      );

      for (final project in projects) {
        await projectLocalRepository.create(
          project,
          createOpLog: false,
        );
      }

      if (projects.isNotEmpty) {
        final projectFacilities = await projectFacilityRemoteRepository.search(
          ProjectFacilitySearchModel(
            projectId: projects.map((e) => e.id).toList(),
          ),
        );

        for (final projectFacility in projectFacilities) {
          await projectFacilityLocalRepository.create(
            projectFacility,
            createOpLog: false,
          );

          final facilities = await facilityRemoteRepository.search(
            FacilitySearchModel(
              id: [projectFacility.facilityId],
            ),
          );

          for (final facility in facilities) {
            await facilityLocalRepository.create(
              facility,
              createOpLog: false,
            );
          }
        }

        List<String> codes = [];
        for (var elements in userObject!.roles) {
          switch (elements.code) {
            case UserRoleCodeEnum.warehouseManager:
              codes = projects
                  .map((ele) => '${ele.name}.WAREHOUSE.${'WAREHOUSE_MANAGER'}')
                  .toList();
              break;
            case UserRoleCodeEnum.registrar:
              codes = projects
                  .map((ele) => '${ele.name}.WAREHOUSE.${'REGISTRAR'}')
                  .toList();
              break;
            case UserRoleCodeEnum.systemAdministrator:
              codes = projects
                  .map((ele) =>
                      '${ele.name}.WAREHOUSE.${'SYSTEM_ADMINISTRATOR'}')
                  .toList();
              break;
            case UserRoleCodeEnum.supervisor:
              codes = projects
                  .map((ele) => '${ele.name}.WAREHOUSE.${'SUPERVISOR'}')
                  .toList();

              break;
          }
        }

        final serviceDefinition = await serviceDefinitionremoteRepository
            .search(ServiceDefinitionSearchModel(
          tenantId: envConfig.variables.tenantId,
          code: codes,
        ));

        for (var element in serviceDefinition) {
          await serviceLocalremoteRepository.create(
            element,
            createOpLog: false,
          );
        }
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

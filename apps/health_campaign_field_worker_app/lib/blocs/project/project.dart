// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import '../../data/data_repository.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/secure_store/secure_store.dart';
import '../../models/auth/auth_model.dart';
import '../../models/data_model.dart';
import '../../utils/environment_config.dart';
import '../../utils/utils.dart';

part 'project.freezed.dart';

typedef ProjectEmitter = Emitter<ProjectState>;

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final LocalSecureStore localSecureStore;
  final Isar isar;

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
      serviceDefinitionRemoteRepository;
  final LocalRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel>
      serviceDefinitionLocalRepository;

  final RemoteRepository<BoundaryModel, BoundarySearchModel>
      boundaryRemoteRepository;

  /// Project Resource Repositories
  final RemoteRepository<ProjectResourceModel, ProjectResourceSearchModel>
      projectResourceRemoteRepository;
  final LocalRepository<ProjectResourceModel, ProjectResourceSearchModel>
      projectResourceLocalRepository;

  /// Product Variant Repositories
  final RemoteRepository<ProductVariantModel, ProductVariantSearchModel>
      productVariantRemoteRepository;
  final LocalRepository<ProductVariantModel, ProductVariantSearchModel>
      productVariantLocalRepository;

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
    required this.serviceDefinitionRemoteRepository,
    required this.boundaryRemoteRepository,
    required this.isar,
    required this.serviceDefinitionLocalRepository,
    required this.projectResourceLocalRepository,
    required this.projectResourceRemoteRepository,
    required this.productVariantLocalRepository,
    required this.productVariantRemoteRepository,
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
        await _loadProjectFacilities(projects);
        await _loadProductVariants(projects);
      }

      emit(ProjectSelectionFetchedState(projects: projects));
    }
  }

  FutureOr<void> _loadProjectFacilities(List<ProjectModel> projects) async {
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
  }

  FutureOr<void> _loadProductVariants(List<ProjectModel> projects) async {
    for (final project in projects) {
      final projectResources = await projectResourceRemoteRepository.search(
        ProjectResourceSearchModel(projectId: project.id),
      );

      for (final projectResource in projectResources) {
        await projectResourceLocalRepository.create(
          projectResource,
          createOpLog: false,
        );

        final productVariants = await productVariantRemoteRepository.search(
          ProductVariantSearchModel(
            id: [projectResource.resource.productVariantId],
          ),
        );

        for (final productVariant in productVariants) {
          await productVariantLocalRepository.create(
            productVariant,
            createOpLog: false,
          );
        }
        final configs = await isar.appConfigurations.where().findAll();
        final userObject = await localSecureStore.userRequestModel;
        List<String> codes = [];
        for (var elements in userObject!.roles) {
          switch (elements.code) {
            case UserRoleCodeEnum.warehouseManager:
              configs.first.checklistTypes
                  ?.map((e) => e.code)
                  .forEach((element) {
                for (var ele in projects) {
                  codes.add('${ele.name}.$element.${'WAREHOUSE_MANAGER'}');
                }
              });

              break;
            case UserRoleCodeEnum.registrar:
              configs.first.checklistTypes
                  ?.map((e) => e.code)
                  .forEach((element) {
                for (var ele in projects) {
                  codes.add('${ele.name}.$element.${'REGISTRAR'}');
                }
              });

              break;
            case UserRoleCodeEnum.systemAdministrator:
              configs.first.checklistTypes
                  ?.map((e) => e.code)
                  .forEach((element) {
                for (var ele in projects) {
                  codes.add('${ele.name}.$element.${'SYSTEM_ADMINISTRATOR'}');
                }
              });

              break;
            case UserRoleCodeEnum.supervisor:
              configs.first.checklistTypes
                  ?.map((e) => e.code)
                  .forEach((element) {
                for (var ele in projects) {
                  codes.add('${ele.name}.$element.${'SUPERVISOR'}');
                }
              });
              break;
            case UserRoleCodeEnum.distributor:
              configs.first.checklistTypes
                  ?.map((e) => e.code)
                  .forEach((element) {
                for (var ele in projects) {
                  codes.add('${ele.name}.$element.${'DISTRIBUTOR'}');
                }
              });
              break;
          }
        }

        final serviceDefinition = await serviceDefinitionRemoteRepository
            .search(ServiceDefinitionSearchModel(
          tenantId: envConfig.variables.tenantId,
          code: codes,
        ));

        for (var element in serviceDefinition) {
          await serviceDefinitionLocalRepository.create(
            element,
            createOpLog: false,
          );
        }
      }
    }
  }

  Future<void> _handleProjectSelection(
    ProjectSelectProjectEvent event,
    ProjectEmitter emit,
  ) async {
    final List<BoundaryModel> boundaries = (await boundaryRemoteRepository
        .search(BoundarySearchModel(boundaryType: '')));
    print(boundaries.first.name);

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

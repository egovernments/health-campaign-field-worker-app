// GENERATED using mason_cli
import 'dart:async';
import 'dart:core';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_components/digit_components.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:recase/recase.dart';

import '../../../models/app_config/app_config_model.dart' as app_configuration;
import '../../data/data_repository.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/no_sql/schema/row_versions.dart';
import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/repositories/remote/mdms.dart';
import '../../models/app_config/app_config_model.dart';
import '../../models/auth/auth_model.dart';
import '../../models/data_model.dart';
import '../../models/project_type/project_type_model.dart';
import '../../utils/environment_config.dart';
import '../../utils/utils.dart';

part 'project.freezed.dart';

typedef ProjectEmitter = Emitter<ProjectState>;

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final LocalSecureStore localSecureStore;
  final Isar isar;
  final MdmsRepository mdmsRepository;

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

  ///Boundary Resource Repositories
  final RemoteRepository<BoundaryModel, BoundarySearchModel>
      boundaryRemoteRepository;
  final LocalRepository<BoundaryModel, BoundarySearchModel>
      boundaryLocalRepository;

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
    required this.boundaryLocalRepository,
    required this.isar,
    required this.serviceDefinitionLocalRepository,
    required this.projectResourceLocalRepository,
    required this.projectResourceRemoteRepository,
    required this.productVariantLocalRepository,
    required this.productVariantRemoteRepository,
    required this.mdmsRepository,
  })  : localSecureStore = localSecureStore ?? LocalSecureStore.instance,
        super(const ProjectState()) {
    on(_handleProjectInit);
    on(_handleProjectSelection);
  }

  FutureOr<void> _handleProjectInit(
    ProjectInitializeEvent event,
    ProjectEmitter emit,
  ) async {
    emit(const ProjectState(
      loading: true,
      projects: [],
      selectedProject: null,
      projectType: null,
    ));

    final connectivityResult = await (Connectivity().checkConnectivity());

    AppLogger.instance.info(
      'Connectivity Result: $connectivityResult',
      title: 'ProjectBloc',
    );

    final isOnline = connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile;
    final selectedProject = await localSecureStore.selectedProject;
    final isProjectSetUpComplete = await localSecureStore
        .isProjectSetUpComplete(selectedProject?.id ?? "noProjectId");

    /*Checks for if device is online and project data downloaded*/
    if (isOnline && !isProjectSetUpComplete) {
      await _loadOnline(emit);
    } else {
      await _loadOffline(emit);
    }
  }

  FutureOr<void> _loadOnline(ProjectEmitter emit) async {
    final userObject = await localSecureStore.userRequestModel;
    final uuid = userObject?.uuid;

    List<ProjectStaffModel> projectStaffList;
    try {
      projectStaffList = await projectStaffRemoteRepository.search(
        ProjectStaffSearchModel(staffId: uuid),
      );
    } on DioError catch (error) {
      if (error.response != null &&
          error.response!.data['Errors'][0]['message']
              .toString()
              .contains(Constants.invalidAccessTokenKey)) {
        emit(
          state.copyWith(
            loading: false,
            syncError: ProjectSyncErrorType.sessionExpired,
          ),
        );
      } else {
        emit(
          state.copyWith(
            loading: false,
            syncError: ProjectSyncErrorType.projectStaff,
          ),
        );
      }

      return;
    }

    projectStaffList.removeDuplicates((e) => e.id);

    if (projectStaffList.isEmpty) {
      emit(const ProjectState(
        projects: [],
        loading: false,
        selectedProject: null,
        syncError: null,
      ));

      return;
    }

    List<ProjectModel> projects = [];
    ProjectType? projectType;
    for (final projectStaff in projectStaffList) {
      await projectStaffLocalRepository.create(
        projectStaff,
        createOpLog: false,
      );

      List<ProjectModel> staffProjects;
      try {
        staffProjects = await projectRemoteRepository.search(
          ProjectSearchModel(
            id: projectStaff.projectId,
            tenantId: projectStaff.tenantId,
          ),
        );
      } catch (_) {
        emit(state.copyWith(
          loading: false,
          syncError: ProjectSyncErrorType.project,
        ));

        return;
      }

      projects.addAll(staffProjects);
    }

    projects.removeDuplicates((e) => e.id);

    for (final project in projects) {
      await projectLocalRepository.create(
        project,
        createOpLog: false,
      );
    }

    if (projects.isNotEmpty) {
      try {
        await _loadProjectFacilities(projects);
      } catch (_) {
        emit(
          state.copyWith(
            loading: false,
            syncError: ProjectSyncErrorType.projectFacilities,
          ),
        );
      }
      try {
        await _loadProductVariants(projects);
      } catch (_) {
        emit(
          state.copyWith(
            loading: false,
            syncError: ProjectSyncErrorType.productVariants,
          ),
        );
      }
      try {
        await _loadServiceDefinition(projects);
      } catch (_) {
        emit(
          state.copyWith(
            loading: false,
            syncError: ProjectSyncErrorType.serviceDefinitions,
          ),
        );
      }
      try {
        await _loadServiceDefinition(projects);
      } catch (_) {
        emit(
          state.copyWith(
            loading: false,
            syncError: ProjectSyncErrorType.serviceDefinitions,
          ),
        );
      }
      // TODO [Need to optimize the code]
      try {
        final projectTypes = await mdmsRepository.searchProjectType(
          envConfig.variables.mdmsApiPath,
          MdmsRequestModel(
            mdmsCriteria: MdmsCriteriaModel(
              tenantId: envConfig.variables.tenantId,
              moduleDetails: [
                const MdmsModuleDetailModel(
                  moduleName: 'HCM-PROJECT-TYPES',
                  masterDetails: [MdmsMasterDetailModel('projectTypes')],
                ),
              ],
            ),
          ).toJson(),
        );

        await mdmsRepository.writeToProjectTypeDB(
          projectTypes,
          isar,
        );

        emit(state.copyWith(
          projectType: projectTypes.projectTypeWrapper?.projectTypes
              .where((element) => element.id == projects.first.projectTypeId)
              .toList()
              .firstOrNull,
        ));
      } catch (_) {}
    }

    emit(ProjectState(
      projects: projects,
      loading: false,
      syncError: null,
      projectType: projectType,
    ));

    if (projects.length == 1) {
      add(ProjectSelectProjectEvent(projects.first));
    }
  }

  FutureOr<void> _loadOffline(ProjectEmitter emit) async {
    final projects = await projectLocalRepository.search(
      ProjectSearchModel(
        tenantId: envConfig.variables.tenantId,
      ),
    );

    projects.removeDuplicates((element) => element.id);

    final selectedProject = await localSecureStore.selectedProject;
    final getSelectedProjectType = await localSecureStore.selectedProjectType;
    final currentRunningCycle = getSelectedProjectType?.cycles
        ?.where(
          (e) =>
              (e.startDate!) < DateTime.now().millisecondsSinceEpoch &&
              (e.endDate!) > DateTime.now().millisecondsSinceEpoch,
          // Return null when no matching cycle is found
        )
        .firstOrNull;
    emit(
      ProjectState(
        loading: false,
        projects: projects,
        selectedProject: selectedProject,
        projectType: getSelectedProjectType,
        selectedCycle: currentRunningCycle,
      ),
    );
  }

  FutureOr<void> _loadProjectFacilities(List<ProjectModel> projects) async {
    final projectFacilities = await projectFacilityRemoteRepository.search(
      ProjectFacilitySearchModel(
        projectId: projects.map((e) => e.id).toList(),
      ),
    );

    String? parentProjectId;

    if (projects.isNotEmpty &&
        projects.first.projectHierarchy != null &&
        projects.first.projectHierarchy!.split('.').length >= 2) {
      parentProjectId = projects.first.projectHierarchy?.split('.')[1];
    }

    for (final projectFacility in projectFacilities) {
      await projectFacilityLocalRepository.create(
        projectFacility,
        createOpLog: false,
      );
    }

    /// Passing [id] as [null] is required to load all facilities associated
    /// with the tenant
    if (parentProjectId == null) {
      final facilities = await facilityRemoteRepository.search(
        FacilitySearchModel(
          id: null,
        ),
      );

      await facilityLocalRepository.bulkCreate(facilities);
    } else {
      final parentProjectFacilities =
          await projectFacilityRemoteRepository.search(
        ProjectFacilitySearchModel(
          projectId: [parentProjectId],
        ),
      );
      final facilities = await facilityRemoteRepository.search(
        FacilitySearchModel(
          id: parentProjectFacilities.map((e) => e.facilityId).toList(),
        ),
      );

      await facilityLocalRepository.bulkCreate(facilities);
    }
  }

  FutureOr<void> _loadServiceDefinition(List<ProjectModel> projects) async {
    final configs = await isar.appConfigurations.where().findAll();
    final userObject = await localSecureStore.userRequestModel;
    List<String> codes = [];
    for (UserRoleModel elements in userObject!.roles) {
      configs.first.checklistTypes?.map((e) => e.code).forEach((element) {
        for (final project in projects) {
          codes.add(
            '${project.name}.$element.${elements.code.snakeCase.toUpperCase()}',
          );
        }
      });
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
      }
    }
  }

  Future<void> _handleProjectSelection(
    ProjectSelectProjectEvent event,
    ProjectEmitter emit,
  ) async {
    emit(state.copyWith(loading: true, syncError: null));

    List<BoundaryModel> boundaries;
    try {
      final configResult = await mdmsRepository.searchAppConfig(
        envConfig.variables.mdmsApiPath,
        MdmsRequestModel(
          mdmsCriteria: MdmsCriteriaModel(
            tenantId: envConfig.variables.tenantId,
            moduleDetails: [
              const MdmsModuleDetailModel(
                moduleName: 'module-version',
                masterDetails: [
                  MdmsMasterDetailModel('ROW_VERSIONS'),
                ],
              ),
            ],
          ),
        ).toJson(),
      );
      final projectType = await mdmsRepository.searchProjectType(
        envConfig.variables.mdmsApiPath,
        MdmsRequestModel(
          mdmsCriteria: MdmsCriteriaModel(
            tenantId: envConfig.variables.tenantId,
            moduleDetails: [
              const MdmsModuleDetailModel(
                moduleName: 'HCM-PROJECT-TYPES',
                masterDetails: [MdmsMasterDetailModel('projectTypes')],
              ),
            ],
          ),
        ).toJson(),
      );

      await mdmsRepository.writeToProjectTypeDB(
        projectType,
        isar,
      );

      final selectedProjectType = projectType.projectTypeWrapper?.projectTypes
          .where(
            (element) => element.id == event.model.projectTypeId,
          )
          .toList()
          .firstOrNull;
      final currentRunningCycle = selectedProjectType?.cycles
          ?.where(
            (e) =>
                (e.startDate!) < DateTime.now().millisecondsSinceEpoch &&
                (e.endDate!) > DateTime.now().millisecondsSinceEpoch,
            // Return null when no matching cycle is found
          )
          .firstOrNull;

      final cycles = List<Cycle>.from(
        selectedProjectType?.cycles ?? [],
      );
      cycles.sort((a, b) => a.id.compareTo(b.id));

      final reqProjectType = selectedProjectType?.copyWith(cycles: cycles);

      final rowversionList = await isar.rowVersionLists
          .filter()
          .moduleEqualTo('egov-location')
          .findAll();

      final serverVersion = configResult.rowVersions?.rowVersionslist
          ?.where(
            (element) => element.module == 'egov-location',
          )
          .toList()
          .firstOrNull
          ?.version;
      final boundaryRefetched = await localSecureStore.boundaryRefetched;

      if (rowversionList.firstOrNull?.version != serverVersion ||
          boundaryRefetched) {
        boundaries = await boundaryRemoteRepository.search(
          BoundarySearchModel(
            boundaryType: event.model.address?.boundaryType,
            code: event.model.address?.boundary,
          ),
        );
        await boundaryLocalRepository.deleteAll();
        await boundaryLocalRepository.bulkCreate(boundaries);
        await localSecureStore.setSelectedProject(event.model);
        await localSecureStore.setSelectedProjectType(reqProjectType);
        await localSecureStore.setBoundaryRefetch(false);
        final List<RowVersionList> rowVersionList = [];

        final data = (configResult).rowVersions?.rowVersionslist;

        for (final element in data ?? <app_configuration.RowVersions>[]) {
          final rowVersion = RowVersionList();
          rowVersion.module = element.module;
          rowVersion.version = element.version;
          rowVersionList.add(rowVersion);
        }
        await isar.writeTxn(() async {
          await isar.rowVersionLists.clear();

          await isar.rowVersionLists.putAll(rowVersionList);
        });
      } else {
        boundaries = await boundaryLocalRepository.search(
          BoundarySearchModel(
            boundaryType: event.model.address?.boundaryType,
            code: event.model.address?.boundary,
          ),
        );
        if (boundaries.isEmpty) {
          boundaries = await boundaryRemoteRepository.search(
            BoundarySearchModel(
              boundaryType: event.model.address?.boundaryType,
              code: event.model.address?.boundary,
            ),
          );
          await boundaryLocalRepository.deleteAll();
          await boundaryLocalRepository.bulkCreate(boundaries);
        }
        await localSecureStore.setSelectedProject(event.model);
        await localSecureStore.setSelectedProjectType(reqProjectType);
      }
      await localSecureStore.setProjectSetUpComplete(event.model.id, true);
    } catch (_) {
      emit(state.copyWith(
        loading: false,
        syncError: ProjectSyncErrorType.boundary,
      ));

      return;
    }
    final getSelectedProjectType = await localSecureStore.selectedProjectType;
    final currentRunningCycle = getSelectedProjectType?.cycles
        ?.where(
          (e) =>
              (e.startDate!) < DateTime.now().millisecondsSinceEpoch &&
              (e.endDate!) > DateTime.now().millisecondsSinceEpoch,
          // Return null when no matching cycle is found
        )
        .firstOrNull;

    emit(state.copyWith(
      selectedProject: event.model,
      loading: false,
      syncError: null,
      projectType: getSelectedProjectType,
      selectedCycle: currentRunningCycle,
    ));
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
  const ProjectState._();

  const factory ProjectState({
    @Default([]) List<ProjectModel> projects,
    ProjectType? projectType,
    Cycle? selectedCycle,
    ProjectModel? selectedProject,
    @Default(false) bool loading,
    ProjectSyncErrorType? syncError,
  }) = _ProjectState;

  bool get isEmpty => projects.isEmpty;

  bool get isNotEmpty => !isEmpty;

  bool get hasSelectedProject => selectedProject != null;
}

enum ProjectSyncErrorType {
  projectStaff,
  project,
  projectFacilities,
  productVariants,
  serviceDefinitions,
  boundary,
  sessionExpired,
}

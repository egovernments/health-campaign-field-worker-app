// GENERATED using mason_cli
import 'dart:async';
import 'dart:core';

import 'package:attendance_management/attendance_management.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_dss/digit_dss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:isar/isar.dart';
import 'package:recase/recase.dart';
import 'package:survey_form/survey_form.dart';

import '../../../models/app_config/app_config_model.dart' as app_configuration;
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/no_sql/schema/row_versions.dart';
import '../../data/local_store/no_sql/schema/service_registry.dart';
import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/repositories/remote/bandwidth_check.dart';
import '../../data/repositories/remote/mdms.dart';
import '../../models/app_config/app_config_model.dart';
import '../../models/auth/auth_model.dart';
import '../../models/entities/roles_type.dart';
import '../../utils/least_level_boundary_singleton.dart';
import '../../utils/background_service.dart';
import '../../utils/environment_config.dart';
import '../../utils/utils.dart';

part 'project.freezed.dart';

typedef ProjectEmitter = Emitter<ProjectState>;

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final LocalSecureStore localSecureStore;
  final Isar isar;
  final MdmsRepository mdmsRepository;

  final BandwidthCheckRepository bandwidthCheckRepository;

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

  final RemoteRepository<AttendanceRegisterModel, AttendanceRegisterSearchModel>
      attendanceRemoteRepository;
  final LocalRepository<AttendanceRegisterModel, AttendanceRegisterSearchModel>
      attendanceLocalRepository;
  final RemoteRepository<IndividualModel, IndividualSearchModel>
      individualRemoteRepository;
  final LocalRepository<AttendanceLogModel, AttendanceLogSearchModel>
      attendanceLogLocalRepository;
  final RemoteRepository<AttendanceLogModel, AttendanceLogSearchModel>
      attendanceLogRemoteRepository;
  final LocalRepository<IndividualModel, IndividualSearchModel>
      individualLocalRepository;

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

  /// Stock Repositories
  final RemoteRepository<StockModel, StockSearchModel> stockRemoteRepository;
  final LocalRepository<StockModel, StockSearchModel> stockLocalRepository;

  /// Service Definition Repositories
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
  final DashboardRemoteRepository dashboardRemoteRepository;
  BuildContext context;

  ProjectBloc({
    LocalSecureStore? localSecureStore,
    required this.bandwidthCheckRepository,
    required this.projectStaffRemoteRepository,
    required this.projectRemoteRepository,
    required this.projectStaffLocalRepository,
    required this.projectLocalRepository,
    required this.projectFacilityRemoteRepository,
    required this.projectFacilityLocalRepository,
    required this.facilityRemoteRepository,
    required this.facilityLocalRepository,
    required this.stockRemoteRepository,
    required this.stockLocalRepository,
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
    required this.attendanceLocalRepository,
    required this.attendanceRemoteRepository,
    required this.individualLocalRepository,
    required this.individualRemoteRepository,
    required this.attendanceLogLocalRepository,
    required this.attendanceLogRemoteRepository,
    required this.dashboardRemoteRepository,
    required this.context,
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
    ));

    final connectivityResult = await (Connectivity().checkConnectivity());

    AppLogger.instance.info(
      'Connectivity Result: $connectivityResult',
      title: 'ProjectBloc',
    );

    final isOnline =
        connectivityResult.firstOrNull == ConnectivityResult.wifi ||
            connectivityResult.firstOrNull == ConnectivityResult.mobile;
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
    final batchSize = await _getBatchSize();
    final userObject = await localSecureStore.userRequestModel;
    final uuid = userObject?.uuid;

    List<ProjectStaffModel> projectStaffList;
    try {
      projectStaffList = await projectStaffRemoteRepository.search(
        ProjectStaffSearchModel(staffId: [uuid.toString()]),
      );
    } catch (error) {
      emit(
        state.copyWith(
          loading: false,
          syncError: ProjectSyncErrorType.projectStaff,
        ),
      );

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
      // INFO : Need to add project load functions

      try {
        await _loadProjectFacilities(projects, batchSize);
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
    }

    emit(ProjectState(
      projects: projects,
      loading: false,
      syncError: null,
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
    emit(
      ProjectState(
        loading: false,
        projects: projects,
        selectedProject: selectedProject,
      ),
    );
  }

  FutureOr<void> _loadProjectFacilities(
      List<ProjectModel> projects, int batchSize) async {
    final projectFacilities = await projectFacilityRemoteRepository.search(
      ProjectFacilitySearchModel(
        projectId: projects.map((e) => e.id).toList(),
      ),
    );

    await projectFacilityLocalRepository.bulkCreate(projectFacilities);

    final facilities = await facilityRemoteRepository.search(
      FacilitySearchModel(tenantId: envConfig.variables.tenantId),
      limit: batchSize,
    );

    await facilityLocalRepository.bulkCreate(facilities);
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
        ProjectResourceSearchModel(projectId: [project.id]),
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
      if (context.loggedInUserRoles
          .where(
            (role) =>
                role.code == RolesType.districtSupervisor.toValue() ||
                role.code == RolesType.teamSupervisor.toValue(),
          )
          .toList()
          .isNotEmpty) {
        final attendanceRegisters = await attendanceRemoteRepository.search(
          AttendanceRegisterSearchModel(
            staffId: context.loggedInIndividualId,
            referenceId: event.model.id,
            localityCode: event.model.address?.boundary,
          ),
        );
        await attendanceLocalRepository.bulkCreate(attendanceRegisters);

        for (final register in attendanceRegisters) {
          if (register.attendees != null &&
              (register.attendees ?? []).isNotEmpty) {
            try {
              final individuals = await individualRemoteRepository.search(
                IndividualSearchModel(
                  id: register.attendees!.map((e) => e.individualId!).toList(),
                ),
              );
              await individualLocalRepository.bulkCreate(individuals);
              final logs = await attendanceLogRemoteRepository.search(
                AttendanceLogSearchModel(
                  registerId: register.id,
                ),
              );
              await attendanceLogLocalRepository.bulkCreate(logs);
            } catch (_) {
              emit(state.copyWith(
                loading: false,
                syncError: ProjectSyncErrorType.project,
              ));

              return;
            }
          }
        }
      }
      try {
        final startDate = DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .toLocal()
            .millisecondsSinceEpoch;
        final endDate = DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 23, 59)
            .toLocal()
            .millisecondsSinceEpoch;
        final serviceRegistry = await isar.serviceRegistrys.where().findAll();
        final dashboardConfig = await isar.dashboardConfigSchemas
            .where()
            .filter()
            .chartsIsNotNull()
            .chartsIsNotEmpty()
            .findAll();
        final dashboardActionPath = Constants.getEndPoint(
            serviceRegistry: serviceRegistry,
            service: DashboardResponseModel.schemaName.toUpperCase(),
            action: ApiOperation.search.toValue(),
            entityName: DashboardResponseModel.schemaName);
        if (dashboardConfig.isNotEmpty &&
            dashboardConfig.first.enableDashboard == true &&
            dashboardConfig.first.charts != null) {
          final loggedInIndividualId = await localSecureStore.userIndividualId;
          final registers = await attendanceLocalRepository.search(
            AttendanceRegisterSearchModel(
              staffId: loggedInIndividualId,
              referenceId: event.model.id,
            ),
          );
          List<String> attendeesIndividualIds = [];
          registers.forEach((r) {
            r.attendees?.where((a) => a.individualId != null).forEach((att) {
              attendeesIndividualIds.add(att.individualId.toString());
            });
          });
          final individuals =
              await individualLocalRepository.search(IndividualSearchModel(
            id: attendeesIndividualIds,
          ));
          final userUUIDList = individuals
              .where((ind) => ind.userUuid != null)
              .map((i) => i.userUuid.toString())
              .toList();
          await processDashboardConfig(
            dashboardConfig.first.charts ?? [],
            startDate,
            endDate,
            isar,
            DateTime.now(),
            dashboardRemoteRepository,
            dashboardActionPath.trim().isNotEmpty
                ? dashboardActionPath
                : '/dashboard-analytics/dashboard/getChartV2',
            //[TODO: To be added to MDMS Service registry
            envConfig.variables.tenantId,
            event.model.id,
            userUUIDList,
          );
        }
      } catch (e) {
        debugPrint(e.toString());
      }
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
            codes: event.model.address?.boundary,
          ),
        );
        await boundaryLocalRepository.bulkCreate(boundaries);
        await localSecureStore.setSelectedProject(event.model);
        await localSecureStore.setBoundaryRefetch(false);
        final List<RowVersionList> rowVersionList = [];

        final data = (configResult).rowVersions?.rowVersionslist;

        for (final element in data ?? <app_configuration.RowVersions>[]) {
          final rowVersion = RowVersionList();
          rowVersion.module = element.module;
          rowVersion.version = element.version;
          rowVersionList.add(rowVersion);
        }
        isar.writeTxnSync(() {
          isar.rowVersionLists.clear();

          isar.rowVersionLists.putAllSync(rowVersionList);
        });
      } else {
        boundaries = await boundaryLocalRepository.search(
          BoundarySearchModel(
            boundaryType: event.model.address?.boundaryType,
            codes: event.model.address?.boundary,
          ),
        );
        if (boundaries.isEmpty) {
          boundaries = await boundaryRemoteRepository.search(
            BoundarySearchModel(
              boundaryType: event.model.address?.boundaryType,
              codes: event.model.address?.boundary,
            ),
          );
        }
        await boundaryLocalRepository.bulkCreate(boundaries);
        LeastLevelBoundarySingleton().setBoundary(boundaries: findLeastLevelBoundaries(boundaries));
        await localSecureStore.setSelectedProject(event.model);
      }
      await localSecureStore.setProjectSetUpComplete(event.model.id, true);
    } catch (_) {
      emit(state.copyWith(
        loading: false,
        syncError: ProjectSyncErrorType.boundary,
      ));
    }

    emit(state.copyWith(
      selectedProject: event.model,
      loading: false,
      syncError: null,
    ));
  }

  FutureOr<int> _getBatchSize() async {
    try {
      final configs = await isar.appConfigurations.where().findAll();

      final double speed = await bandwidthCheckRepository.pingBandwidthCheck(
        bandWidthCheckModel: null,
      );

      int configuredBatchSize = getBatchSizeToBandwidth(
        speed,
        configs,
        isDownSync: true,
      );
      return configuredBatchSize;
    } catch (e) {
      rethrow;
    }
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
  boundary
}

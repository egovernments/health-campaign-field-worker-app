// GENERATED using mason_cli
import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_data_model/data/repositories/package_repository/remote/stock.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/attendance_log.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:digit_data_model/models/entities/attendance_register.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_dss/digit_dss.dart';
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:recase/recase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_form/survey_form.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';
import 'package:transit_post/data/repositories/remote/user_action.dart';

import '../../../models/app_config/app_config_model.dart' as app_configuration;
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/no_sql/schema/row_versions.dart';
import '../../data/local_store/no_sql/schema/service_registry.dart';
import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/remote_client.dart';
import '../../data/repositories/remote/bandwidth_check.dart';
import '../../data/repositories/remote/mdms.dart';
import '../../models/entities/mdms_master_enums.dart';
import '../../models/entities/mdms_module_enums.dart';
import '../../models/auth/auth_model.dart';
import '../../models/downsync/downsync.dart';
import '../../models/entities/roles_type.dart';
import '../../utils/download_image.dart';
import '../../utils/environment_config.dart';
import '../../utils/least_level_boundary_singleton.dart';
import '../../utils/stock_calculation_utils.dart';
import '../../utils/utils.dart';
import '../auth/auth.dart';
import '../push_notification/push_notification.dart';

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

  /// Face Auth Event Repositories (nullable — not all projects expose this endpoint)
  final RemoteRepository<FaceAuthEventModel, FaceAuthEventSearchModel>?
      faceAuthEventRemoteRepository;
  final LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>?
      faceAuthEventLocalRepository;

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
  final LocalRepository<DownsyncModel, DownsyncSearchModel>
      downSyncLocalRepository;
  final UserActionLocalRepository userActionLocalRepository;
  final UserActionRemoteRepository userActionRemoteRepository;

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
    required this.downSyncLocalRepository,
    required this.userActionLocalRepository,
    required this.userActionRemoteRepository,
    this.faceAuthEventRemoteRepository,
    this.faceAuthEventLocalRepository,
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

    final isOnline = connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile);
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
      reportSyncProgress('projectStaff');
      projectStaffList = await projectStaffRemoteRepository.search(
        ProjectStaffSearchModel(staffId: [uuid.toString()]),
      );
    } catch (error) {
      emit(
        state.copyWith(
          projects: [],
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
    reportSyncProgress('project');
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
      // Facility fetch moved: `_loadFacilities` used to fire a
      // tenant-wide search here (unfiltered by project), pulling every
      // facility in the environment. That's wasteful on large tenants —
      // we only need the facilities referenced by the selected project's
      // project-facility mappings. It now runs from inside
      // `_loadProjectFacilities` after the project is selected, using
      // the specific `facilityId`s returned there.

      try {
        reportSyncProgress('productVariant');
        await _loadProductVariants(projects);
      } catch (_) {
        emit(
          state.copyWith(
            projects: [],
            loading: false,
            syncError: ProjectSyncErrorType.productVariants,
          ),
        );
        return;
      }
      try {
        reportSyncProgress('serviceDefinition');
        await _loadServiceDefinition(projects);
      } catch (_) {
        emit(
          state.copyWith(
            projects: [],
            loading: false,
            syncError: ProjectSyncErrorType.serviceDefinitions,
          ),
        );
        return;
      }
      try {
        reportSyncProgress('projectType');
        final projectTypes = await mdmsRepository.searchProjectType(
          envConfig.variables.mdmsApiPath,
          envConfig.variables.tenantId,
        );

        await mdmsRepository.writeToProjectTypeDB(
          projectTypes,
          isar,
        );

        String? additionalProjectTypeId =
            projects.first.additionalDetails?.projectType?.id;

        emit(state.copyWith(
          projectType: projectTypes.projectTypeWrapper?.projectTypes
              .where((element) =>
                  element.id ==
                  (additionalProjectTypeId ?? projects.first.projectTypeId))
              .toList()
              .firstOrNull,
        ));
      } catch (_) {}
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

    // Cold-restart restore: rehydrate the runtime hierarchy from the persisted
    // selected project before any boundary / MDMS work runs.
    if (selectedProject != null) {
      final restoredHierarchy =
          selectedProject.additionalDetails?.hierarchyType;
      DigitDataModelSingleton().setHierarchyType(
        (restoredHierarchy != null && restoredHierarchy.isNotEmpty)
            ? restoredHierarchy
            : envConfig.variables.hierarchyType,
      );
    }

    emit(
      ProjectState(
        loading: false,
        projects: projects,
        selectedProject: selectedProject,
      ),
    );

    /* An empty BoundarySearchModel is sent to retrieve all boundaries from the repository.
    This ensures that the entire dataset is fetched, as no specific filters or constraints are applied.Facility
    The retrieved boundaries are then processed to find the least level boundaries and set them in the singleton.*/
    final boundaries = await boundaryLocalRepository.search(
      BoundarySearchModel(),
    );
    LeastLevelBoundarySingleton()
        .setBoundary(boundaries: findLeastLevelBoundaries(boundaries));
  }

  // The assigned boundary's own materializedPath, minus its last segment —
  // i.e. the ancestor chain above it. Null if not found in [tree].
  String? _ancestorPrefixFor(List<BoundaryModel> tree, String? assignedCode) {
    if (assignedCode == null) return null;
    final assigned = tree.firstWhere(
      (b) => b.code == assignedCode,
      orElse: () => BoundaryModel(),
    );
    final segs = assigned.materializedPath?.split('.');
    if (segs == null || segs.length <= 1) return null;
    return segs.sublist(0, segs.length - 1).join('.');
  }

  // Prefixes every boundary's materializedPath with [prefix], so a scoped
  // fetch (rooted at the project's assigned boundary) ends up with the
  // same full root-to-leaf path a full-tree fetch would have produced.
  List<BoundaryModel> _withAncestorPrefix(
    List<BoundaryModel> boundaries,
    String? prefix,
  ) {
    if (prefix == null) return boundaries;
    return boundaries
        .map((b) => b.copyWith(
              materializedPath: '$prefix.${b.materializedPath}',
            ))
        .toList();
  }

  FutureOr<void> _loadProjectFacilities(
    ProjectModel project, {
    List<BoundaryModel>? prefetchedTree,
  }) async {
    final userObject = await localSecureStore.userRequestModel;
    final assignedBoundaryType = project.address?.boundaryType;
    final assignedBoundaryCode = project.address?.boundary;
    List<String>? boundaryTypes;

    if (assignedBoundaryType != null && assignedBoundaryCode != null) {
      // Derive parent → current → child boundary types from the boundary
      // search API response for the CURRENT hierarchy (multi-hierarchy
      // safe). We fetch the full hierarchy tree with no `codes` filter (or
      // reuse one already fetched by the caller); the remote client's
      // `_flattenBoundaryMap` computes `materializedPath` and
      // `boundaryNum` root-to-leaf, so once flattened we can locate the
      // assigned code by materializedPath (which is unique) and take
      // parent (boundaryNum-1) and child (boundaryNum+1) types.
      try {
        final treeRows = prefetchedTree ??
            await boundaryRemoteRepository.search(
              BoundarySearchModel(),
            );

        // Locate the assigned row anywhere in the tree by exact code
        // match.
        final assigned = treeRows.firstWhere(
          (b) => b.code == assignedBoundaryCode,
          orElse: () => BoundaryModel(code: assignedBoundaryCode),
        );

        final assignedPath = assigned.materializedPath;
        final assignedNum = assigned.boundaryNum;

        String? parentType;
        String? childType;

        if (assignedNum != null && assignedPath != null) {
          // Parent's materializedPath is assigned's minus the last
          // (dot-separated) segment. This is authoritative — no
          // reliance on boundary-code underscore structure.
          if (assignedNum > 1) {
            final segs = assignedPath.split('.');
            if (segs.length >= 2) {
              final parentPath = segs.sublist(0, segs.length - 1).join('.');
              final parent = treeRows.firstWhere(
                (b) =>
                    b.materializedPath == parentPath &&
                    b.label != null &&
                    b.label!.isNotEmpty,
                orElse: () => BoundaryModel(),
              );
              parentType = parent.label;
            }
          }

          // Child = any row whose materializedPath starts with
          // assigned's + '.' and whose boundaryNum is exactly one deeper.
          final childPrefix = '$assignedPath.';
          final child = treeRows.firstWhere(
            (b) =>
                b.boundaryNum == assignedNum + 1 &&
                b.label != null &&
                b.label!.isNotEmpty &&
                (b.materializedPath?.startsWith(childPrefix) ?? false),
            orElse: () => BoundaryModel(),
          );
          childType = child.label;
        }

        boundaryTypes = [
          if (parentType != null && parentType.isNotEmpty) parentType,
          assignedBoundaryType,
          if (childType != null && childType.isNotEmpty) childType,
        ];
      } catch (e) {
        // Any failure falls through to the single-type default below —
        // same behaviour the old MDMS path had when it couldn't find a
        // match.
        debugPrint(
            'boundary-derivation from search response failed: $e');
      }

      boundaryTypes ??= [assignedBoundaryType];
    }

    final projectFacilities = await projectFacilityRemoteRepository.search(
      ProjectFacilitySearchModel(
        projectId: [project.id],
        boundaryTypes: boundaryTypes,
      ),
    );

    await projectFacilityLocalRepository.bulkCreate(projectFacilities);

    // Fetch only the facilities referenced by this project's
    // project-facility mappings, instead of pulling every facility in
    // the tenant. Chunk the id list so the query-string / body stays
    // within a sensible size for the search API.
    final facilityIds = projectFacilities
        .map((pf) => pf.facilityId)
        .whereType<String>()
        .toSet()
        .toList();
    if (facilityIds.isNotEmpty) {
      const chunkSize = 100;
      for (var i = 0; i < facilityIds.length; i += chunkSize) {
        final end = (i + chunkSize < facilityIds.length)
            ? i + chunkSize
            : facilityIds.length;
        final chunk = facilityIds.sublist(i, end);
        try {
          final facilities = await facilityRemoteRepository.search(
            FacilitySearchModel(
              tenantId: envConfig.variables.tenantId,
              id: chunk,
            ),
          );
          await facilityLocalRepository.bulkCreate(facilities);
        } catch (e) {
          debugPrint(
              'facility fetch failed for chunk starting at $i: $e');
        }
      }
    }

    // Register notification token with current level facility IDs
    final currentFacilityIds = projectFacilities
        .where((pf) {
          final facilityLevel = pf.additionalFields?.fields
              .where((f) => f.key == 'facilityLevel')
              .firstOrNull
              ?.value;
          return facilityLevel == 'current';
        })
        .map((pf) => pf.facilityId)
        .toList();

    if (currentFacilityIds.isNotEmpty) {
      final serviceRegistry = await isar.serviceRegistrys.where().findAll();
      final apiEndPoint = Constants.getNotificationEndPoint(
        serviceRegistry: serviceRegistry,
        service: 'NOTIFICATION',
        action: ApiOperation.register.toValue(),
        entityName: 'NotificationToken',
      );

      if (apiEndPoint.isNotEmpty) {
        context.read<PushNotificationBloc>().add(
              PushNotificationEvent.registerToken(
                  apiEndPoint: apiEndPoint,
                  facilityIds: currentFacilityIds,
                  userObject: userObject),
            );
      }
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

  Future<List<AttendanceLogModel>> _updateLogsData(
      List<AttendanceLogModel> logs) async {
    List<AttendanceLogModel> updatedLogs = [];
    for (var log in logs) {
      var additionalDetails = log.additionalDetails;
      if (additionalDetails != null &&
          additionalDetails['isFirstSignature'] == "true" &&
          additionalDetails['signatureFileStoreId'] != null) {
        String signatureFileStoreId = additionalDetails['signatureFileStoreId'];
        String signatureBase64 =
            await DownloadImage.downloadSignature(signatureFileStoreId);
        additionalDetails['signatureData'] = signatureBase64;
      }
      updatedLogs.add(log.copyWith(additionalDetails: additionalDetails));
    }
    return updatedLogs;
  }

  /// Fetches the HCM user roles for [individuals] (by userUuid) in a single
  /// /user/v1/_search call and stamps them into each individual's
  /// additionalFields under the 'userRoles' key (comma-separated role codes),
  /// so role-based filters (e.g. the FIELD_SUPPORT non-mobile-user list) work
  /// offline. Best-effort: on any failure the individuals are returned as-is.
  Future<List<IndividualModel>> _annotateUserRoles(
      List<IndividualModel> individuals) async {
    try {
      final userUuids = individuals
          .map((e) => e.userUuid)
          .where((u) => u != null && u.isNotEmpty)
          .cast<String>()
          .toSet()
          .toList();
      if (userUuids.isEmpty) return individuals;

      final response = await DioClient().dio.post(
        '/user/v1/_search',
        data: {
          'tenantId': envConfig.variables.tenantId,
          'uuid': userUuids,
          'pageSize': userUuids.length,
        },
      );

      final users = (response.data as Map<String, dynamic>?)?['user'];
      if (users is! List) return individuals;

      final rolesByUuid = <String, String>{};
      for (final u in users) {
        if (u is! Map) continue;
        final uuid = u['uuid']?.toString();
        final roles = u['roles'];
        if (uuid == null || roles is! List) continue;
        rolesByUuid[uuid] = roles
            .map((r) => r is Map ? r['code']?.toString() : null)
            .whereType<String>()
            .join(',');
      }
      debugPrint('[FaceAuth] userRoles fetched for ${rolesByUuid.length} users');

      return individuals.map((ind) {
        final roles = ind.userUuid != null ? rolesByUuid[ind.userUuid] : null;
        if (roles == null) return ind;
        final existing = ind.additionalFields?.fields
                .where((f) => f.key != 'userRoles')
                .toList() ??
            <AdditionalField>[];
        return ind.copyWith(
          additionalFields: IndividualAdditionalFields(
            version: ind.additionalFields?.version ?? 1,
            fields: [...existing, AdditionalField('userRoles', roles)],
          ),
        );
      }).toList();
    } catch (e) {
      debugPrint('[FaceAuth] _annotateUserRoles failed: $e');
      return individuals;
    }
  }

  /// Fetches all face auth events for [projectId] in a single API call and
  /// upserts them into the local DB so verification status shows offline.
  ///
  /// Old-format events where individualId = system user UUID are rewritten to
  /// the correct HCM UUID before storing, so the attendance dots lookup works.
  Future<void> _loadFaceAuthEventsForProject(
      String projectId, List<String> individualIds) async {
    debugPrint(
        '[FaceAuth] _loadFaceAuthEventsForProject: projectId=$projectId, ${individualIds.length} attendees');

    if (faceAuthEventRemoteRepository == null ||
        faceAuthEventLocalRepository == null) {
      debugPrint(
          '[FaceAuth] repositories not available for this project — skipping sync');
      return;
    }

    // Build reverse map: system user UUID → HCM individual UUID.
    final individuals = await individualLocalRepository.search(
      IndividualSearchModel(id: individualIds),
    );
    final userUuidToHcm = <String, String>{
      for (final ind in individuals)
        if (ind.id != null && ind.userUuid != null && ind.userUuid!.isNotEmpty)
          ind.userUuid!: ind.id!,
    };
    debugPrint('[FaceAuth] userUuid→HCM mapping: $userUuidToHcm');

    try {
      final allEvents = await faceAuthEventRemoteRepository!.search(
        FaceAuthEventSearchModel(projectId: projectId),
      );
      debugPrint(
          '[FaceAuth] projectId=$projectId → ${allEvents.length} total events');

      // Rewrite old-format events where individualId is a system user UUID.
      final normalizedEvents = allEvents.map((e) {
        final hcmId = userUuidToHcm[e.individualId];
        return hcmId != null ? e.copyWith(individualId: hcmId) : e;
      }).toList();

      if (normalizedEvents.isNotEmpty) {
        await faceAuthEventLocalRepository!.bulkCreate(normalizedEvents);
        debugPrint(
            '[FaceAuth] stored ${normalizedEvents.length} events locally');
      }
    } catch (e) {
      debugPrint('[FaceAuth] fetch for projectId=$projectId failed: $e');
    }
  }

  Future<void> _handleProjectSelection(
    ProjectSelectProjectEvent event,
    ProjectEmitter emit,
  ) async {
    emit(state.copyWith(loading: true, syncError: null));

    // Populate the runtime hierarchy from the selected project's
    // additionalDetails before any hierarchy-keyed work runs. Env fallback only
    // when the project payload lacks the field.
    final projectHierarchy = event.model.additionalDetails?.hierarchyType;
    DigitDataModelSingleton().setHierarchyType(
      (projectHierarchy != null && projectHierarchy.isNotEmpty)
          ? projectHierarchy
          : envConfig.variables.hierarchyType,
    );

    List<BoundaryModel> boundaries;
    List<BoundaryModel> fullBoundaryTree = [];
    try {
      try {
        if (context.loggedInUserRoles
            .where(
              (role) =>
                  role.code == RolesType.districtSupervisor.toValue() ||
                  role.code ==
                      RolesType.distributor
                          .toValue() || // NOTE: Distributor also fetches registers for getting his team members (Non-Mobile users)
                  role.code == RolesType.teamSupervisor.toValue() ||
                  role.code == RolesType.warehouseManager.toValue(),
            )
            .toList()
            .isNotEmpty) {
          final loggedInIndividualId = await localSecureStore.userIndividualId;
          reportSyncProgress('attendanceRegister');
          late final List<AttendanceRegisterModel> attendanceRegisters;

          if (context.loggedInUserRoles
              .where(
                (role) =>
                    role.code == RolesType.districtSupervisor.toValue() ||
                    role.code == RolesType.teamSupervisor.toValue() ||
                    role.code == RolesType.warehouseManager.toValue(),
              )
              .toList()
              .isNotEmpty) {
            attendanceRegisters = await attendanceRemoteRepository.search(
              AttendanceRegisterSearchModel(
                staffId: loggedInIndividualId,
                referenceId: event.model.id,
                localityCode: event.model.address?.boundary,
              ),
            );
          } else {
            attendanceRegisters = await attendanceRemoteRepository.search(
              AttendanceRegisterSearchModel(
                  attendeeId: loggedInIndividualId,
                  // Modified attendance search to fetch tagged attendees for non-mobile users
                  includeTaggedAttendees: true),
            );
          }
          await attendanceLocalRepository.bulkCreate(attendanceRegisters);
          for (final register in attendanceRegisters) {
            if (register.attendees != null &&
                (register.attendees ?? []).isNotEmpty) {
              try {
                reportSyncProgress('individual');
                final individuals = await individualRemoteRepository.search(
                  IndividualSearchModel(
                    id: register.attendees!
                        .map((e) => e.individualId!)
                        .toList(),
                  ),
                );
                // Stamp each individual's HCM user roles into
                // additionalFields so role filters work offline.
                final annotated = await _annotateUserRoles(individuals);
                await individualLocalRepository.bulkCreate(annotated);
                if (context.loggedInUserRoles
                    .where(
                      (role) =>
                          role.code == RolesType.districtSupervisor.toValue() ||
                          role.code == RolesType.teamSupervisor.toValue(),
                    )
                    .toList()
                    .isNotEmpty) {
                  final logs = await attendanceLogRemoteRepository.search(
                    AttendanceLogSearchModel(
                      registerId: register.id,
                    ),
                  );
                  List<AttendanceLogModel> updatedLogs =
                      await _updateLogsData(logs);
                  await attendanceLogLocalRepository.bulkCreate(updatedLogs);
                }
              } catch (_) {
                emit(state.copyWith(
                  projects: [],
                  loading: false,
                  syncError: ProjectSyncErrorType.attendance,
                ));
                return;
              }
            }
          }

          // Face-auth: pull face auth events per-attendee for supervisors so
          // verification status (attendance dots) shows offline before the
          // next sync.
          if (context.loggedInUserRoles.any((role) =>
              role.code == RolesType.districtSupervisor.toValue() ||
              role.code == RolesType.teamSupervisor.toValue())) {
            try {
              final attendeeIds = attendanceRegisters
                  .expand((r) => r.attendees ?? [])
                  .map((a) => a.individualId)
                  .where((id) => id != null && id.isNotEmpty)
                  .cast<String>()
                  .toSet()
                  .toList();
              if (attendeeIds.isNotEmpty) {
                await _loadFaceAuthEventsForProject(
                    event.model.id!, attendeeIds);
              }
            } catch (e) {
              debugPrint('[FaceAuth] _handleProjectSelection: error: $e');
            }
          }
        }
      } catch (_) {
        emit(state.copyWith(
          loading: false,
          syncError: ProjectSyncErrorType.attendance,
        ));
        return;
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
        final dashboardConfig = await isar.dashboardConfigSchemaLists
            .where()
            .filter()
            .dashboardConfigsIsNotNull()
            .dashboardConfigsIsNotEmpty()
            .findAll();
        final dashboardActionPath = Constants.getEndPoint(
            serviceRegistry: serviceRegistry,
            service: DashboardResponseModel.schemaName.toUpperCase(),
            action: ApiOperation.search.toValue(),
            entityName: DashboardResponseModel.schemaName);

        final filteredDashboardConfig = filterDashboardConfig(
            dashboardConfig.isNotEmpty
                ? dashboardConfig.first.dashboardConfigs
                : null,
            event.model.additionalDetails?.projectType?.code ?? "");

        if (filteredDashboardConfig.isNotEmpty &&
            filteredDashboardConfig.first?.enableDashboard == true &&
            filteredDashboardConfig.first?.charts != null) {
          final loggedInIndividualId = await localSecureStore.userIndividualId;
          final registers = await attendanceLocalRepository.search(
            AttendanceRegisterSearchModel(
              staffId: loggedInIndividualId,
              referenceId: event.model.id,
            ),
          );
          List<String> attendeesIndividualIds = [];
          for (var r in registers) {
            r.attendees?.where((a) => a.individualId != null).forEach((att) {
              attendeesIndividualIds.add(att.individualId.toString());
            });
          }
          final individuals =
              await individualLocalRepository.search(IndividualSearchModel(
            id: attendeesIndividualIds,
          ));
          final userUUIDList = individuals
              .where((ind) => ind.userUuid != null)
              .map((i) => i.userUuid.toString())
              .toList();
          await processDashboardConfig(
            dashboardConfig.first.dashboardConfigs
                    ?.where((config) =>
                        config.projectTypeId == event.model.projectTypeId ||
                        config.projectTypeCode == event.model.projectType)
                    .first
                    .charts ??
                [],
            startDate,
            endDate,
            isar,
            DateTime.now(),
            dashboardRemoteRepository,
            dashboardActionPath.trim().isNotEmpty
                ? dashboardActionPath
                : Constants.dashboardAnalyticsPath,
            envConfig.variables.tenantId,
            event.model.id,
            userUUIDList,
          );
        }
      } catch (e) {
        debugPrint(e.toString());
      }

      try {
        reportSyncProgress('formConfig');
        final formConfigs = await mdmsRepository.searchMDMS(
          envConfig.variables.mdmsApiPath,
          tenantId: envConfig.variables.tenantId,
          schemaCode: '${ModuleEnums.hcmAdminConsole.toValue()}.${MasterEnums.formConfig.toValue()}',
          filters: {'project': event.model.referenceID},
        );

        for (final config in formConfigs) {
          await enrichFormSchemasWithEnumsForForms(config);
        }
      } catch (e) {
        emit(
          state.copyWith(
            selectedProject: event.model,
            loading: false,
            syncError: ProjectSyncErrorType.appConfig,
          ),
        );
        if (kDebugMode) {
          debugPrint(e.toString());
        }
        return;
      }

      reportSyncProgress('projectType');
      final configResult = await mdmsRepository.searchRowVersions(
        envConfig.variables.mdmsApiPath,
        envConfig.variables.tenantId,
      );

      final projectType = await mdmsRepository.searchProjectType(
        envConfig.variables.mdmsApiPath,
        envConfig.variables.tenantId,
      );

      await mdmsRepository.writeToProjectTypeDB(
        projectType,
        isar,
      );

      String? additionalProjectTypeId =
          event.model.additionalDetails?.projectType?.id;

      final selectedProjectType = projectType.projectTypeWrapper?.projectTypes
          .where(
            (element) =>
                element.id ==
                (additionalProjectTypeId ?? event.model.projectTypeId),
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

      // Fetched once and reused for: (1) prefixing the scoped boundary
      // fetch below with the assigned boundary's real ancestor path, and
      // (2) _loadProjectFacilities' parent/child boundary-type lookup —
      // avoids sending this (potentially large) full-tree request twice.
      try {
        fullBoundaryTree = await boundaryRemoteRepository.search(
          BoundarySearchModel(),
        );
      } catch (e) {
        debugPrint('full boundary tree fetch failed: $e');
      }
      final ancestorPrefix = _ancestorPrefixFor(
        fullBoundaryTree,
        event.model.address?.boundary,
      );

      reportSyncProgress('boundary');
      if (rowversionList.firstOrNull?.version != serverVersion ||
          boundaryRefetched) {
        boundaries = await boundaryRemoteRepository.search(
          BoundarySearchModel(
            boundaryType: event.model.address?.boundaryType,
            codes: event.model.address?.boundary,
          ),
        );
        boundaries = _withAncestorPrefix(boundaries, ancestorPrefix);
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
        isar.writeTxnSync(() {
          isar.rowVersionLists.clearSync();

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
          boundaries = _withAncestorPrefix(boundaries, ancestorPrefix);
          if (boundaries.isEmpty) {
            emit(
              state.copyWith(
                selectedProject: event.model,
                loading: false,
                syncError: ProjectSyncErrorType.boundary,
              ),
            );
            return;
          }
        }
        await boundaryLocalRepository.bulkCreate(boundaries);
        LeastLevelBoundarySingleton()
            .setBoundary(boundaries: findLeastLevelBoundaries(boundaries));
        await localSecureStore.setSelectedProject(event.model);
        await localSecureStore.setSelectedProjectType(reqProjectType);
      }
      await localSecureStore.setProjectSetUpComplete(event.model.id, true);
    } catch (_) {
      emit(state.copyWith(
        selectedProject: event.model,
        projects: [],
        loading: false,
        syncError: ProjectSyncErrorType.boundary,
      ));
      return;
    }

    // Create useraction for device switch
    try {
      await _createUserActionForDeviceSwitch(event.model);
    } catch (error) {
      AppLogger.instance.error(
        title: 'ProjectBloc',
        message: '$error',
      );
    }

    // Load project facilities after project selection
    try {
      reportSyncProgress('projectFacility');
      await _loadProjectFacilities(event.model, prefetchedTree: fullBoundaryTree);
    } catch (_) {
      emit(state.copyWith(
        selectedProject: event.model,
        loading: false,
        syncError: ProjectSyncErrorType.projectFacilities,
      ));
      return;
    }

    try {
      // Trigger silent stock downsync after project facilities are loaded
      reportSyncProgress('stock');
      await _silentStockDownSync(event.model);
    } catch (_) {
      emit(state.copyWith(
        selectedProject: event.model,
        loading: false,
        syncError: ProjectSyncErrorType.stockDownsync,
      ));
      return;
    }

    final getSelectedProject = await localSecureStore.selectedProject;

    emit(state.copyWith(
      selectedProject: getSelectedProject,
      loading: false,
      syncError: null,
    ));
  }

  /// Silently downloads dispatched stock from server without UI dialogs.
  /// Runs in the background after project selection.
  Future<void> _silentStockDownSync(ProjectModel project) async {
    try {
      final localityKey = 'stock_${project.id}';
      final userObject = await localSecureStore.userRequestModel;
      if (userObject == null) return;

      final userRoles = userObject.roles.map((e) => e.code);

      final projectFacilities = await projectFacilityLocalRepository.search(
        ProjectFacilitySearchModel(projectId: [project.id]),
      );

      // Filter to only include facilities where facilityLevel is 'current'
      final currentFacilities = projectFacilities.where((pf) {
        final facilityLevel = pf.additionalFields?.fields
            .where((f) => f.key == 'facilityLevel')
            .firstOrNull
            ?.value;
        return facilityLevel == null || facilityLevel == 'current';
      }).toList();

      final projectResources = await projectResourceLocalRepository.search(
        ProjectResourceSearchModel(projectId: [project.id]),
      );
      final productVariantIds = projectResources
          .map((pr) => pr.resource.productVariantId)
          .whereType<String>()
          .toSet()
          .toList();

      List<String> receiverIds = [];
      if (userRoles.contains(RolesType.healthFacilitySupervisor.toValue())) {
        receiverIds = currentFacilities.map((e) => e.facilityId).toList();
      } else if (userRoles.contains(RolesType.warehouseManager.toValue())) {
        receiverIds = currentFacilities.map((e) => e.facilityId).toList();
      } else if (userRoles.contains(RolesType.communityDistributor.toValue()) ||
          userRoles.contains(RolesType.distributor.toValue())) {
        receiverIds = [userObject.uuid];
      }

      if (receiverIds.isEmpty) return;

      final stockSearchModel = StockSearchModel(
        receiverId: receiverIds.first,
        senderId: receiverIds.first,
        campaignNumber: project.referenceID,
      );

      final existingDownSyncData =
          await downSyncLocalRepository.search(DownsyncSearchModel(
        locality: localityKey,
      ));

      final lastSyncedTime = existingDownSyncData.isEmpty
          ? null
          : existingDownSyncData.first.lastSyncedTime;

      if (existingDownSyncData.isEmpty) {
        await downSyncLocalRepository.create(DownsyncModel(
          offset: 0,
          limit: 50,
          lastSyncedTime: lastSyncedTime,
          totalCount: 0,
          locality: localityKey,
        ));
      }

      final totalCount = await (stockRemoteRepository as StockRemoteRepository)
          .fetchTotalCount(
        stockSearchModel,
        offSet: 0,
        lastSyncedTime: lastSyncedTime,
        includeOnlyUpdatedByOthers: true,
      );

      if (totalCount <= 0) return;

      const batchSize = 50;
      int offset = 0;
      int syncedCount = 0;
      final currentSyncTime = DateTime.now().millisecondsSinceEpoch;

      while (syncedCount < totalCount) {
        final stockEntries = await stockRemoteRepository.search(
          stockSearchModel,
          offSet: offset,
          limit: batchSize,
          lastSyncedTime: lastSyncedTime,
          includeOnlyUpdatedByOthers: true,
        );

        if (stockEntries.isEmpty) break;

        await stockLocalRepository.bulkCreate(stockEntries);

        await downSyncLocalRepository.update(DownsyncModel(
          offset: 0,
          limit: batchSize,
          lastSyncedTime: currentSyncTime,
          totalCount: totalCount,
          locality: localityKey,
        ));

        offset += stockEntries.length;
        syncedCount += stockEntries.length;
      }

      await downSyncStockBalances(project.id,
          projectReferenceID: project.referenceID);

      // TODO: COMMENTING USER CREATION ON DOWNSYNC
      // await _createStockBalanceUserActions(
      //   project: project,
      //   receiverIds: receiverIds,
      //   productVariantIds: productVariantIds,
      //   userRoles: userRoles,
      //   userObject: userObject,
      // );

      debugPrint(
          'SILENT_STOCK_DOWNSYNC: Completed. Synced $syncedCount/$totalCount');
    } catch (e) {
      debugPrint('SILENT_STOCK_DOWNSYNC: Error - $e');
    }
  }

  Future<void> downSyncStockBalances(
    String projectId, {
    String? projectReferenceID,
  }) async {
    try {
      final userObject = await localSecureStore.userRequestModel;
      final userRoles = userObject?.roles.map((e) => e.code) ?? [];
      final isDistributor =
          userRoles.contains(RolesType.distributor.toValue()) ||
              userRoles.contains(RolesType.communityDistributor.toValue());

      final projectFacilities = await projectFacilityLocalRepository.search(
        ProjectFacilitySearchModel(projectId: [projectId]),
      );

      final projectResources = await projectResourceLocalRepository.search(
        ProjectResourceSearchModel(projectId: [projectId]),
      );

      final currentFacilities = projectFacilities.where((pf) {
        final facilityLevel = pf.additionalFields?.fields
            .where((f) => f.key == 'facilityLevel')
            .firstOrNull
            ?.value;
        return facilityLevel == null || facilityLevel == 'current';
      }).toList();

      List<String> facilityIds;
      if (isDistributor) {
        facilityIds = [userObject?.uuid ?? ''];
      } else {
        facilityIds = currentFacilities
            .map((e) => e.facilityId)
            .whereType<String>()
            .toSet()
            .toList();
      }

      final productVariantIds = projectResources
          .map((pr) => pr.resource.productVariantId)
          .whereType<String>()
          .toSet()
          .toList();

      if (facilityIds.isEmpty ||
          productVariantIds.isEmpty ||
          facilityIds.first.isEmpty) return;

      // Build balance keys for all facility × product variant combinations.
      // Includes the active compact shape, the intermediate readable shape
      // (pre-compaction, post-suffix), and the legacy shape (pre-suffix) so
      // server rows written by any prior version are not missed during
      // downsync.
      // projectReferenceID is passed explicitly: this code path runs during
      // project bloc startup, before FlowBuilderSingleton().selectedProject
      // is populated, so the singleton fallback would yield an empty suffix
      // and silently degrade the new-shape key to the legacy shape.
      final balanceKeys = <String>{};
      for (final facilityId in facilityIds) {
        for (final productVariantId in productVariantIds) {
          balanceKeys.add(generateBalanceKey(
            facilityId,
            productVariantId,
            projectReferenceID: projectReferenceID,
          ));
          balanceKeys.add(readableBalanceKey(
            facilityId,
            productVariantId,
            projectReferenceID: projectReferenceID,
          ));
          balanceKeys.add(legacyBalanceKey(facilityId, productVariantId));
        }
      }

      // Fetch from server
      final remoteBalances = await userActionRemoteRepository.search(
        UserActionSearchModel(clientReferenceId: balanceKeys.toList()),
      );

      if (remoteBalances.isEmpty) return;

      // For each fetched balance, create or update locally
      for (final remoteBalance in remoteBalances) {
        final existing = await userActionLocalRepository.search(
          UserActionSearchModel(
            clientReferenceId: [remoteBalance.clientReferenceId],
          ),
        );

        if (existing.isNotEmpty) {
          final localRow = existing.first;
          if (localRow.isSync != true) {
            // Local has a pending (unsynced) balance — usually a fresh
            // post-transaction value the user just produced. Two things must
            // happen:
            //  1. Do NOT overwrite the local balance — that would revert the
            //     user's transactions to the stale server value.
            //  2. Adopt the server's `id` and `rowVersion` so the queued
            //     upsync op becomes an UPDATE rather than a CREATE — without
            //     this, the upsync collides with the existing server row at
            //     the same clientReferenceId, the local change never reaches
            //     the server, and a permanent local/server drift remains.
            //
            // The local balance, timestamp, and isSync=false are preserved
            // so the upsync pipeline still picks up the row.
            if (localRow.id != remoteBalance.id ||
                localRow.rowVersion != remoteBalance.rowVersion) {
              await userActionLocalRepository.update(
                localRow.copyWith(
                  id: remoteBalance.id,
                  rowVersion: remoteBalance.rowVersion,
                ),
                createOpLog: false,
              );
            }
            continue;
          }

          await userActionLocalRepository.update(
            remoteBalance,
            createOpLog: false,
          );
        } else {
          await userActionLocalRepository.create(
            remoteBalance,
            createOpLog: false,
          );
        }
      }
    } catch (e) {
      debugPrint('Stock balance downsync error: $e');
    }
  }

  /// Creates or updates UserAction balance records after stock downsync.
  /// This ensures that balance records exist for all facility × product variant combinations
  /// based on the locally available stock data.
  Future<void> _createStockBalanceUserActions({
    required ProjectModel project,
    required List<String> receiverIds,
    required List<String> productVariantIds,
    required Iterable<String> userRoles,
    required UserRequestModel? userObject,
  }) async {
    try {
      final isDistributor =
          userRoles.contains(RolesType.distributor.toValue()) ||
              userRoles.contains(RolesType.communityDistributor.toValue());

      final projectFacilities = await projectFacilityLocalRepository.search(
        ProjectFacilitySearchModel(projectId: [project.id]),
      );

      final currentFacilities = projectFacilities.where((pf) {
        final facilityLevel = pf.additionalFields?.fields
            .where((f) => f.key == 'facilityLevel')
            .firstOrNull
            ?.value;
        return facilityLevel == null || facilityLevel == 'current';
      }).toList();

      List<String> facilityIds;
      if (isDistributor) {
        facilityIds = [userObject?.uuid ?? ''];
      } else {
        facilityIds = currentFacilities
            .map((e) => e.facilityId)
            .whereType<String>()
            .toSet()
            .toList();
      }

      if (facilityIds.isEmpty || facilityIds.first.isEmpty) return;
      if (productVariantIds.isEmpty) return;

      // Calculate balance for each facility × product variant combination
      for (final facilityId in facilityIds) {
        for (final productVariantId in productVariantIds) {
          // Get all stocks for this facility and product, scoped to the
          // current project via `referenceId`. Without this scope a facility
          // (or distributor userUuid) used across multiple projects has all
          // its stocks summed into every project's STOCK_BALANCE UserAction,
          // so accepting stock in one project inflates the balance shown in
          // the other. See stock_balance_card.dart's identical scope.
          final receivedStocks = await stockLocalRepository.search(
            StockSearchModel(
              receiverId: facilityId,
              referenceId: project.id,
            ),
          );
          final sentStocks = await stockLocalRepository.search(
            StockSearchModel(
              senderId: facilityId,
              referenceId: project.id,
            ),
          );

          final allStocksMap = <String, StockModel>{};
          for (final stock in receivedStocks) {
            if (stock.productVariantId == productVariantId) {
              allStocksMap[stock.clientReferenceId] = stock;
            }
          }
          for (final stock in sentStocks) {
            if (stock.productVariantId == productVariantId) {
              allStocksMap[stock.clientReferenceId] = stock;
            }
          }
          final allStocks = allStocksMap.values.toList();

          // Calculate the balance
          final metrics = StockCalculationUtils.calculateStockMetrics(
            stockList: allStocks,
            facilityId: facilityId,
            productId: productVariantId,
            isDistributor: isDistributor,
          );

          final balance = metrics['stockInHand'] ?? 0.0;
          final balanceKey = generateBalanceKey(facilityId, productVariantId);

          // Check if UserAction already exists
          final existingActions = await userActionLocalRepository.search(
            UserActionSearchModel(clientReferenceId: [balanceKey]),
          );

          final now = DateTime.now().millisecondsSinceEpoch;
          final loggedInUserUuid = userObject?.uuid ?? '';

          final balanceAction = UserActionModel(
            clientReferenceId: balanceKey,
            action: 'STOCK_BALANCE',
            projectId: project.id,
            boundaryCode: project.address?.boundary ?? "",
            latitude: 0.0,
            longitude: 0.0,
            locationAccuracy: 0.0,
            isSync: false,
            timestamp: now,
            id: existingActions.isNotEmpty ? existingActions.first.id : null,
            rowVersion: existingActions.isNotEmpty
                ? existingActions.first.rowVersion
                : null,
            tenantId: userObject?.tenantId ?? '',
            nonRecoverableError: false,
            additionalFields: UserActionAdditionalFields(
              version: 1,
              fields: [
                AdditionalField('balance', balance.toString()),
                AdditionalField('facilityId', facilityId),
                AdditionalField('productVariantId', productVariantId),
              ],
            ),
            auditDetails: existingActions.isNotEmpty
                ? existingActions.first.auditDetails
                : AuditDetails(createdBy: loggedInUserUuid, createdTime: now),
            clientAuditDetails: existingActions.isNotEmpty
                ? existingActions.first.clientAuditDetails
                : ClientAuditDetails(
                    createdBy: loggedInUserUuid,
                    createdTime: now,
                    lastModifiedBy: loggedInUserUuid,
                    lastModifiedTime: now,
                  ),
          );

          /// INFO: need to revisit as user action is getting create and update to server also
          if (existingActions.isNotEmpty) {
            await userActionLocalRepository.update(
              balanceAction,
              createOpLog: true,
            );
          } else {
            await userActionLocalRepository.create(
              balanceAction,
              createOpLog: true,
            );
          }

          debugPrint(
              'STOCK_BALANCE_INIT: Created/updated balance for $facilityId/$productVariantId = $balance');
        }
      }
    } catch (e) {
      debugPrint('STOCK_BALANCE_INIT: Error - $e');
    }
  }

  Future<void> storeSchema(dynamic schemaJson) async {
    final prefs = await SharedPreferences.getInstance();
    const schemaKey = 'app_config_schemas';

    // Get the unique name and version from schema
    final schemaName = schemaJson['name'];

    // Load existing schemas
    final existingSchemasRaw = prefs.getString(schemaKey);
    final Map<String, dynamic> existingSchemas =
        existingSchemasRaw != null ? json.decode(existingSchemasRaw) : {};

    final updatedEntry = {
      'data': schemaJson,
    };

    // Update the map
    existingSchemas[schemaName] = updatedEntry;

    // Save updated schemas
    await prefs.setString(schemaKey, json.encode(existingSchemas));
  }

  Future<void> enrichFormSchemasWithEnumsForForms(
    dynamic formConfigs,
  ) async {
    final flows = formConfigs['flows'] ?? [];

    // Collect unique schemaCodes referenced by any node in the MDMS-fetched
    // flows so we can pull the matching enum data (e.g. gender options,
    // filter options) and inline it into the config that gets persisted to
    // SharedPreferences.
    final Set<String> schemaCodes = {};
    for (final flow in flows) {
      _collectSchemaCodes(flow, schemaCodes);
    }

    if (schemaCodes.isEmpty) {
      await storeSchema(formConfigs);
      return;
    }

    // Fetch enum data per schemaCode via v2 calls
    final Map<String, List<dynamic>> enumsBySchemaCode = {};
    for (final schemaCode in schemaCodes) {
      final dataList = await mdmsRepository.searchMDMS(
        envConfig.variables.mdmsApiPath,
        tenantId: envConfig.variables.tenantId,
        schemaCode: schemaCode,
      );
      enumsBySchemaCode[schemaCode] = dataList;
    }

    // Recursively enrich every node whose schemaCode returned non-empty MDMS
    // data. The mutation lands on `formConfigs` in place, so storeSchema
    // below persists the enriched map.
    for (final flow in flows) {
      _applyEnumsToSchemaCodes(flow, enumsBySchemaCode);
    }

    await storeSchema(formConfigs);
  }

  void _collectSchemaCodes(dynamic node, Set<String> schemaCodes) {
    if (node is Map) {
      final schemaCode = node['schemaCode'];
      if (schemaCode is String && schemaCode.isNotEmpty) {
        final parts = schemaCode.split('.');
        if (parts.length == 2) {
          schemaCodes.add(schemaCode);
        }
      }
      for (final value in node.values) {
        _collectSchemaCodes(value, schemaCodes);
      }
    } else if (node is List) {
      for (final item in node) {
        _collectSchemaCodes(item, schemaCodes);
      }
    }
  }

  void _applyEnumsToSchemaCodes(
    dynamic node,
    Map<String, List<dynamic>> enumsBySchemaCode,
  ) {
    if (node is Map) {
      final schemaCode = node['schemaCode'];
      if (schemaCode is String && schemaCode.isNotEmpty) {
        final enumValues = enumsBySchemaCode[schemaCode];
        if (enumValues != null && enumValues.isNotEmpty) {
          node['enums'] = enumValues
              .map((e) => {
                    'code': e['code'],
                    'name': e['name'] ?? e['code'],
                  })
              .toList();
        }
      }
      for (final value in node.values) {
        _applyEnumsToSchemaCodes(value, enumsBySchemaCode);
      }
    } else if (node is List) {
      for (final item in node) {
        _applyEnumsToSchemaCodes(item, enumsBySchemaCode);
      }
    }
  }

  Future<void> _createUserActionForDeviceSwitch(ProjectModel project) async {
    final deviceSwitchReason = await localSecureStore.deviceSwitchReason;
    final existingDeviceToken = await localSecureStore.existingDeviceToken;
    try {
      if (deviceSwitchReason != null && existingDeviceToken != null) {
        final currentToken = context.currentRegisteredToken;
        if (currentToken != null) {
          await localSecureStore.setUserDeviceToken(currentToken);
        }

        UserActionModel userActionModel = UserActionModel(
            latitude: 0,
            longitude: 0,
            locationAccuracy: 0,
            clientReferenceId: IdGen.i.identifier,
            projectId: project.id,
            action: Constants.other,
            beneficiaryTag: Constants.deviceSwitch,
            tenantId: envConfig.variables.tenantId,
            boundaryCode: project.address?.boundary ?? Constants.deviceSwitch,
            auditDetails: AuditDetails(
              createdBy: context.loggedInUserUuid,
              createdTime: DateTime.now().millisecondsSinceEpoch,
              lastModifiedBy: context.loggedInUserUuid,
              lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
            ),
            clientAuditDetails: ClientAuditDetails(
              createdBy: context.loggedInUserUuid,
              createdTime: DateTime.now().millisecondsSinceEpoch,
              lastModifiedBy: context.loggedInUserUuid,
              lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
            ),
            additionalFields: UserActionAdditionalFields(version: 1, fields: [
              AdditionalField(Constants.deviceSwitchReason, deviceSwitchReason),
              AdditionalField(Constants.oldDeviceToken, existingDeviceToken),
              if (currentToken != null)
                AdditionalField(Constants.newDeviceToken, currentToken),
            ]));

        final serviceRegistry = await isar.serviceRegistrys.where().findAll();
        final apiEndPoint = Constants.getMultiLoginEndPoint(
          serviceRegistry: serviceRegistry,
          service: Constants.userActionService,
          action: ApiOperation.bulkCreate.toValue(),
          entityName: Constants.userActionEntity,
        );

        context.read<AuthBloc>().add(
              AuthEvent.switchDeviceUserAction(
                  userActionModel: userActionModel, apiEndPoint: apiEndPoint),
            );
      }
    } catch (error) {
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
    ProjectType? projectType,
    ProjectCycle? selectedCycle,
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
  facilities,
  productVariants,
  serviceDefinitions,
  boundary,
  appConfig,
  attendance,
  userAction,
  stockDownsync
}

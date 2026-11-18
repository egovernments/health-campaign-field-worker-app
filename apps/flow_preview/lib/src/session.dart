import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/data/local_store/no_sql/schema/entity_mapper_listener.dart';
import 'package:digit_flow_builder/utils/utils.dart';

/// Invented sample session for the preview. No real user, project or place.
///
/// The field worker app fills these singletons after login and project
/// selection; the preview fills them once at start-up with fixed sample
/// values so flows that read `{{singleton.*}}` or `__context:*` work.
class PreviewSession {
  static const tenantId = 'preview';
  static const userUuid = 'preview-user-0001';
  static const projectId = 'preview-project-0001';
  static const boundaryCode = 'PREVIEW_VILLAGE_1';

  static final project = ProjectModel(
    id: projectId,
    name: 'Preview campaign',
    referenceID: 'PREVIEW-CAMPAIGN',
    tenantId: tenantId,
  );

  static final boundary = BoundaryModel(
    code: boundaryCode,
    name: 'Preview village',
    label: 'Village',
    boundaryType: 'Village',
    tenantId: tenantId,
  );

  static final user = UserModel(
    uuid: userUuid,
    userName: 'preview.user',
    name: 'Preview User',
    mobileNumber: '9999999999',
    tenantId: tenantId,
  );

  static void apply({
    BeneficiaryType beneficiaryType = BeneficiaryType.household,
  }) {
    DigitDataModelSingleton().setData(
      syncDownRetryCount: 0,
      retryTimeInterval: 0,
      tenantId: tenantId,
      entityMapper: _PreviewEntityMapper(),
      errorDumpApiPath: '',
    );

    final flow = FlowBuilderSingleton()
      ..setTenantId(tenantId)
      ..setPersistenceConfiguration(
        persistenceConfiguration: PersistenceConfiguration.offlineFirst,
      )
      ..setBoundary(boundary: boundary);
    flow.setInitialData(
      loggedInUserUuid: userUuid,
      maxRadius: 5,
      projectId: projectId,
      selectedBeneficiaryType: beneficiaryType,
      projectType: null,
      selectedProject: project,
      loggedInUser: user,
      userRoles: const [
        {'code': 'DISTRIBUTOR', 'name': 'Distributor'},
        {'code': 'REGISTRAR', 'name': 'Registrar'},
      ],
      beneficiaryIdMinCount: 0,
    );
  }
}

/// Switches the tenant used by every request and record. digit_data_model's
/// remote repositories add `tenantId` from DigitDataModelSingleton, so this
/// must run right after sign-in, before projects are searched.
void useTenant(String tenantId) {
  DigitDataModelSingleton().setData(
    syncDownRetryCount: 0,
    retryTimeInterval: 0,
    tenantId: tenantId,
    entityMapper: _PreviewEntityMapper(),
    errorDumpApiPath: '',
  );
  FlowBuilderSingleton().setTenantId(tenantId);
}

/// Fills the singletons from a real sign-in, as the app does after login and
/// project selection (pages/home.dart: FlowBuilderSingleton().setInitialData
/// with context.selectedProject / selectedProjectType / boundary).
void applySignedInSession({
  required String tenantId,
  required String userUuid,
  required UserModel? user,
  required List<Map<String, dynamic>> roles,
  required ProjectModel project,
  required BoundaryModel? boundary,
}) {
  final projectType = project.additionalDetails?.projectType;
  DigitDataModelSingleton().setData(
    syncDownRetryCount: 0,
    retryTimeInterval: 0,
    tenantId: tenantId,
    entityMapper: _PreviewEntityMapper(),
    errorDumpApiPath: '',
  );
  final hierarchy = project.additionalDetails?.hierarchyType;
  if (hierarchy != null) DigitDataModelSingleton().setHierarchyType(hierarchy);
  final flow = FlowBuilderSingleton()
    ..setTenantId(tenantId)
    ..setPersistenceConfiguration(
      persistenceConfiguration: PersistenceConfiguration.offlineFirst,
    );
  if (boundary != null) flow.setBoundary(boundary: boundary);
  flow.setInitialData(
    loggedInUserUuid: userUuid,
    maxRadius: 5,
    projectId: project.id,
    selectedBeneficiaryType:
        projectType?.beneficiaryType ?? BeneficiaryType.household,
    projectType: projectType,
    selectedProject: project,
    loggedInUser: user,
    userRoles: roles,
    beneficiaryIdMinCount: 0,
  );
}

/// The preview never syncs, so oplog entries are never turned back into
/// entities. Kept only because DigitDataModelSingleton requires a mapper.
class _PreviewEntityMapper extends EntityMapperListener {
  @override
  EntityModel getEntityMappers(String entityType, String entityString) =>
      EntityModelMapper.fromJson(entityString);
}

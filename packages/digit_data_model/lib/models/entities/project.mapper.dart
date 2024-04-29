// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project.dart';

class ProjectSearchModelMapper extends SubClassMapperBase<ProjectSearchModel> {
  ProjectSearchModelMapper._();

  static ProjectSearchModelMapper? _instance;
  static ProjectSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectSearchModel';

  static String? _$id(ProjectSearchModel v) => v.id;
  static const Field<ProjectSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$projectTypeId(ProjectSearchModel v) => v.projectTypeId;
  static const Field<ProjectSearchModel, String> _f$projectTypeId =
      Field('projectTypeId', _$projectTypeId, opt: true);
  static String? _$projectNumber(ProjectSearchModel v) => v.projectNumber;
  static const Field<ProjectSearchModel, String> _f$projectNumber =
      Field('projectNumber', _$projectNumber, opt: true);
  static String? _$subProjectTypeId(ProjectSearchModel v) => v.subProjectTypeId;
  static const Field<ProjectSearchModel, String> _f$subProjectTypeId =
      Field('subProjectTypeId', _$subProjectTypeId, opt: true);
  static bool? _$isTaskEnabled(ProjectSearchModel v) => v.isTaskEnabled;
  static const Field<ProjectSearchModel, bool> _f$isTaskEnabled =
      Field('isTaskEnabled', _$isTaskEnabled, opt: true);
  static String? _$parent(ProjectSearchModel v) => v.parent;
  static const Field<ProjectSearchModel, String> _f$parent =
      Field('parent', _$parent, opt: true);
  static String? _$department(ProjectSearchModel v) => v.department;
  static const Field<ProjectSearchModel, String> _f$department =
      Field('department', _$department, opt: true);
  static String? _$referenceId(ProjectSearchModel v) => v.referenceId;
  static const Field<ProjectSearchModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$tenantId(ProjectSearchModel v) => v.tenantId;
  static const Field<ProjectSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$startDate(ProjectSearchModel v) => v.startDate;
  static const Field<ProjectSearchModel, int> _f$startDate =
      Field('startDate', _$startDate, opt: true);
  static int? _$endDate(ProjectSearchModel v) => v.endDate;
  static const Field<ProjectSearchModel, int> _f$endDate =
      Field('endDate', _$endDate, opt: true);
  static String? _$boundaryCode(ProjectSearchModel v) => v.boundaryCode;
  static const Field<ProjectSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(ProjectSearchModel v) => v.auditDetails;
  static const Field<ProjectSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(ProjectSearchModel v) =>
      v.additionalFields;
  static const Field<ProjectSearchModel, AdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);
  static DateTime? _$startDateTime(ProjectSearchModel v) => v.startDateTime;
  static const Field<ProjectSearchModel, DateTime> _f$startDateTime =
      Field('startDateTime', _$startDateTime, mode: FieldMode.member);
  static DateTime? _$endDateTime(ProjectSearchModel v) => v.endDateTime;
  static const Field<ProjectSearchModel, DateTime> _f$endDateTime =
      Field('endDateTime', _$endDateTime, mode: FieldMode.member);

  @override
  final MappableFields<ProjectSearchModel> fields = const {
    #id: _f$id,
    #projectTypeId: _f$projectTypeId,
    #projectNumber: _f$projectNumber,
    #subProjectTypeId: _f$subProjectTypeId,
    #isTaskEnabled: _f$isTaskEnabled,
    #parent: _f$parent,
    #department: _f$department,
    #referenceId: _f$referenceId,
    #tenantId: _f$tenantId,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #boundaryCode: _f$boundaryCode,
    #auditDetails: _f$auditDetails,
    #additionalFields: _f$additionalFields,
    #startDateTime: _f$startDateTime,
    #endDateTime: _f$endDateTime,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      EntitySearchModelMapper.ensureInitialized();

  static ProjectSearchModel _instantiate(DecodingData data) {
    return ProjectSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        projectTypeId: data.dec(_f$projectTypeId),
        projectNumber: data.dec(_f$projectNumber),
        subProjectTypeId: data.dec(_f$subProjectTypeId),
        isTaskEnabled: data.dec(_f$isTaskEnabled),
        parent: data.dec(_f$parent),
        department: data.dec(_f$department),
        referenceId: data.dec(_f$referenceId),
        tenantId: data.dec(_f$tenantId),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectSearchModel>(map);
  }

  static ProjectSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectSearchModel>(json);
  }
}

mixin ProjectSearchModelMappable {
  String toJson() {
    return ProjectSearchModelMapper.ensureInitialized()
        .encodeJson<ProjectSearchModel>(this as ProjectSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectSearchModelMapper.ensureInitialized()
        .encodeMap<ProjectSearchModel>(this as ProjectSearchModel);
  }

  ProjectSearchModelCopyWith<ProjectSearchModel, ProjectSearchModel,
          ProjectSearchModel>
      get copyWith => _ProjectSearchModelCopyWithImpl(
          this as ProjectSearchModel, $identity, $identity);
  @override
  String toString() {
    return ProjectSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectSearchModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectSearchModel, other));
  }

  @override
  int get hashCode {
    return ProjectSearchModelMapper.ensureInitialized()
        .hashValue(this as ProjectSearchModel);
  }
}

extension ProjectSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectSearchModel, $Out> {
  ProjectSearchModelCopyWith<$R, ProjectSearchModel, $Out>
      get $asProjectSearchModel =>
          $base.as((v, t, t2) => _ProjectSearchModelCopyWithImpl(v, t, t2));
}

abstract class ProjectSearchModelCopyWith<$R, $In extends ProjectSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      String? projectTypeId,
      String? projectNumber,
      String? subProjectTypeId,
      bool? isTaskEnabled,
      String? parent,
      String? department,
      String? referenceId,
      String? tenantId,
      int? startDate,
      int? endDate,
      String? boundaryCode});
  ProjectSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectSearchModel, $Out>
    implements ProjectSearchModelCopyWith<$R, ProjectSearchModel, $Out> {
  _ProjectSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectSearchModel> $mapper =
      ProjectSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? projectTypeId = $none,
          Object? projectNumber = $none,
          Object? subProjectTypeId = $none,
          Object? isTaskEnabled = $none,
          Object? parent = $none,
          Object? department = $none,
          Object? referenceId = $none,
          Object? tenantId = $none,
          Object? startDate = $none,
          Object? endDate = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (projectTypeId != $none) #projectTypeId: projectTypeId,
        if (projectNumber != $none) #projectNumber: projectNumber,
        if (subProjectTypeId != $none) #subProjectTypeId: subProjectTypeId,
        if (isTaskEnabled != $none) #isTaskEnabled: isTaskEnabled,
        if (parent != $none) #parent: parent,
        if (department != $none) #department: department,
        if (referenceId != $none) #referenceId: referenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  ProjectSearchModel $make(CopyWithData data) =>
      ProjectSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          projectTypeId: data.get(#projectTypeId, or: $value.projectTypeId),
          projectNumber: data.get(#projectNumber, or: $value.projectNumber),
          subProjectTypeId:
              data.get(#subProjectTypeId, or: $value.subProjectTypeId),
          isTaskEnabled: data.get(#isTaskEnabled, or: $value.isTaskEnabled),
          parent: data.get(#parent, or: $value.parent),
          department: data.get(#department, or: $value.department),
          referenceId: data.get(#referenceId, or: $value.referenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          startDate: data.get(#startDate, or: $value.startDate),
          endDate: data.get(#endDate, or: $value.endDate),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  ProjectSearchModelCopyWith<$R2, ProjectSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectSearchModelCopyWithImpl($value, $cast, t);
}

class ProjectModelMapper extends SubClassMapperBase<ProjectModel> {
  ProjectModelMapper._();

  static ProjectModelMapper? _instance;
  static ProjectModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectModel';

  static ProjectAdditionalFields? _$additionalFields(ProjectModel v) =>
      v.additionalFields;
  static const Field<ProjectModel, ProjectAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String _$id(ProjectModel v) => v.id;
  static const Field<ProjectModel, String> _f$id = Field('id', _$id);
  static String? _$projectTypeId(ProjectModel v) => v.projectTypeId;
  static const Field<ProjectModel, String> _f$projectTypeId =
      Field('projectTypeId', _$projectTypeId, opt: true);
  static String? _$projectNumber(ProjectModel v) => v.projectNumber;
  static const Field<ProjectModel, String> _f$projectNumber =
      Field('projectNumber', _$projectNumber, opt: true);
  static String? _$subProjectTypeId(ProjectModel v) => v.subProjectTypeId;
  static const Field<ProjectModel, String> _f$subProjectTypeId =
      Field('subProjectTypeId', _$subProjectTypeId, opt: true);
  static bool? _$isTaskEnabled(ProjectModel v) => v.isTaskEnabled;
  static const Field<ProjectModel, bool> _f$isTaskEnabled =
      Field('isTaskEnabled', _$isTaskEnabled, opt: true);
  static String? _$parent(ProjectModel v) => v.parent;
  static const Field<ProjectModel, String> _f$parent =
      Field('parent', _$parent, opt: true);
  static String _$name(ProjectModel v) => v.name;
  static const Field<ProjectModel, String> _f$name = Field('name', _$name);
  static String? _$department(ProjectModel v) => v.department;
  static const Field<ProjectModel, String> _f$department =
      Field('department', _$department, opt: true);
  static String? _$description(ProjectModel v) => v.description;
  static const Field<ProjectModel, String> _f$description =
      Field('description', _$description, opt: true);
  static String? _$referenceId(ProjectModel v) => v.referenceId;
  static const Field<ProjectModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$projectHierarchy(ProjectModel v) => v.projectHierarchy;
  static const Field<ProjectModel, String> _f$projectHierarchy =
      Field('projectHierarchy', _$projectHierarchy, opt: true);
  static bool? _$nonRecoverableError(ProjectModel v) => v.nonRecoverableError;
  static const Field<ProjectModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(ProjectModel v) => v.tenantId;
  static const Field<ProjectModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ProjectModel v) => v.rowVersion;
  static const Field<ProjectModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AddressModel? _$address(ProjectModel v) => v.address;
  static const Field<ProjectModel, AddressModel> _f$address =
      Field('address', _$address, opt: true);
  static List<TargetModel>? _$targets(ProjectModel v) => v.targets;
  static const Field<ProjectModel, List<TargetModel>> _f$targets =
      Field('targets', _$targets, opt: true);
  static List<DocumentModel>? _$documents(ProjectModel v) => v.documents;
  static const Field<ProjectModel, List<DocumentModel>> _f$documents =
      Field('documents', _$documents, opt: true);
  static int? _$startDate(ProjectModel v) => v.startDate;
  static const Field<ProjectModel, int> _f$startDate =
      Field('startDate', _$startDate, opt: true);
  static int? _$endDate(ProjectModel v) => v.endDate;
  static const Field<ProjectModel, int> _f$endDate =
      Field('endDate', _$endDate, opt: true);
  static AuditDetails? _$auditDetails(ProjectModel v) => v.auditDetails;
  static const Field<ProjectModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(ProjectModel v) =>
      v.clientAuditDetails;
  static const Field<ProjectModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(ProjectModel v) => v.isDeleted;
  static const Field<ProjectModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);
  static DateTime? _$startDateTime(ProjectModel v) => v.startDateTime;
  static const Field<ProjectModel, DateTime> _f$startDateTime =
      Field('startDateTime', _$startDateTime, mode: FieldMode.member);
  static DateTime? _$endDateTime(ProjectModel v) => v.endDateTime;
  static const Field<ProjectModel, DateTime> _f$endDateTime =
      Field('endDateTime', _$endDateTime, mode: FieldMode.member);

  @override
  final MappableFields<ProjectModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #projectTypeId: _f$projectTypeId,
    #projectNumber: _f$projectNumber,
    #subProjectTypeId: _f$subProjectTypeId,
    #isTaskEnabled: _f$isTaskEnabled,
    #parent: _f$parent,
    #name: _f$name,
    #department: _f$department,
    #description: _f$description,
    #referenceId: _f$referenceId,
    #projectHierarchy: _f$projectHierarchy,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #address: _f$address,
    #targets: _f$targets,
    #documents: _f$documents,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
    #isDeleted: _f$isDeleted,
    #startDateTime: _f$startDateTime,
    #endDateTime: _f$endDateTime,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      EntityModelMapper.ensureInitialized();

  static ProjectModel _instantiate(DecodingData data) {
    return ProjectModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        projectTypeId: data.dec(_f$projectTypeId),
        projectNumber: data.dec(_f$projectNumber),
        subProjectTypeId: data.dec(_f$subProjectTypeId),
        isTaskEnabled: data.dec(_f$isTaskEnabled),
        parent: data.dec(_f$parent),
        name: data.dec(_f$name),
        department: data.dec(_f$department),
        description: data.dec(_f$description),
        referenceId: data.dec(_f$referenceId),
        projectHierarchy: data.dec(_f$projectHierarchy),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        address: data.dec(_f$address),
        targets: data.dec(_f$targets),
        documents: data.dec(_f$documents),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectModel>(map);
  }

  static ProjectModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectModel>(json);
  }
}

mixin ProjectModelMappable {
  String toJson() {
    return ProjectModelMapper.ensureInitialized()
        .encodeJson<ProjectModel>(this as ProjectModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectModelMapper.ensureInitialized()
        .encodeMap<ProjectModel>(this as ProjectModel);
  }

  ProjectModelCopyWith<ProjectModel, ProjectModel, ProjectModel> get copyWith =>
      _ProjectModelCopyWithImpl(this as ProjectModel, $identity, $identity);
  @override
  String toString() {
    return ProjectModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectModel, other));
  }

  @override
  int get hashCode {
    return ProjectModelMapper.ensureInitialized()
        .hashValue(this as ProjectModel);
  }
}

extension ProjectModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectModel, $Out> {
  ProjectModelCopyWith<$R, ProjectModel, $Out> get $asProjectModel =>
      $base.as((v, t, t2) => _ProjectModelCopyWithImpl(v, t, t2));
}

abstract class ProjectModelCopyWith<$R, $In extends ProjectModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  ProjectAdditionalFieldsCopyWith<$R, ProjectAdditionalFields,
      ProjectAdditionalFields>? get additionalFields;
  AddressModelCopyWith<$R, AddressModel, AddressModel>? get address;
  ListCopyWith<$R, TargetModel,
      TargetModelCopyWith<$R, TargetModel, TargetModel>>? get targets;
  ListCopyWith<$R, DocumentModel,
      DocumentModelCopyWith<$R, DocumentModel, DocumentModel>>? get documents;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {ProjectAdditionalFields? additionalFields,
      String? id,
      String? projectTypeId,
      String? projectNumber,
      String? subProjectTypeId,
      bool? isTaskEnabled,
      String? parent,
      String? name,
      String? department,
      String? description,
      String? referenceId,
      String? projectHierarchy,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      AddressModel? address,
      List<TargetModel>? targets,
      List<DocumentModel>? documents,
      int? startDate,
      int? endDate,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  ProjectModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProjectModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectModel, $Out>
    implements ProjectModelCopyWith<$R, ProjectModel, $Out> {
  _ProjectModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectModel> $mapper =
      ProjectModelMapper.ensureInitialized();
  @override
  ProjectAdditionalFieldsCopyWith<$R, ProjectAdditionalFields,
          ProjectAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  AddressModelCopyWith<$R, AddressModel, AddressModel>? get address =>
      $value.address?.copyWith.$chain((v) => call(address: v));
  @override
  ListCopyWith<$R, TargetModel,
          TargetModelCopyWith<$R, TargetModel, TargetModel>>?
      get targets => $value.targets != null
          ? ListCopyWith($value.targets!, (v, t) => v.copyWith.$chain(t),
              (v) => call(targets: v))
          : null;
  @override
  ListCopyWith<$R, DocumentModel,
          DocumentModelCopyWith<$R, DocumentModel, DocumentModel>>?
      get documents => $value.documents != null
          ? ListCopyWith($value.documents!, (v, t) => v.copyWith.$chain(t),
              (v) => call(documents: v))
          : null;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  $R call(
          {Object? additionalFields = $none,
          String? id,
          Object? projectTypeId = $none,
          Object? projectNumber = $none,
          Object? subProjectTypeId = $none,
          Object? isTaskEnabled = $none,
          Object? parent = $none,
          String? name,
          Object? department = $none,
          Object? description = $none,
          Object? referenceId = $none,
          Object? projectHierarchy = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? address = $none,
          Object? targets = $none,
          Object? documents = $none,
          Object? startDate = $none,
          Object? endDate = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != null) #id: id,
        if (projectTypeId != $none) #projectTypeId: projectTypeId,
        if (projectNumber != $none) #projectNumber: projectNumber,
        if (subProjectTypeId != $none) #subProjectTypeId: subProjectTypeId,
        if (isTaskEnabled != $none) #isTaskEnabled: isTaskEnabled,
        if (parent != $none) #parent: parent,
        if (name != null) #name: name,
        if (department != $none) #department: department,
        if (description != $none) #description: description,
        if (referenceId != $none) #referenceId: referenceId,
        if (projectHierarchy != $none) #projectHierarchy: projectHierarchy,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (address != $none) #address: address,
        if (targets != $none) #targets: targets,
        if (documents != $none) #documents: documents,
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  ProjectModel $make(CopyWithData data) => ProjectModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      projectTypeId: data.get(#projectTypeId, or: $value.projectTypeId),
      projectNumber: data.get(#projectNumber, or: $value.projectNumber),
      subProjectTypeId:
          data.get(#subProjectTypeId, or: $value.subProjectTypeId),
      isTaskEnabled: data.get(#isTaskEnabled, or: $value.isTaskEnabled),
      parent: data.get(#parent, or: $value.parent),
      name: data.get(#name, or: $value.name),
      department: data.get(#department, or: $value.department),
      description: data.get(#description, or: $value.description),
      referenceId: data.get(#referenceId, or: $value.referenceId),
      projectHierarchy:
          data.get(#projectHierarchy, or: $value.projectHierarchy),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      address: data.get(#address, or: $value.address),
      targets: data.get(#targets, or: $value.targets),
      documents: data.get(#documents, or: $value.documents),
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  ProjectModelCopyWith<$R2, ProjectModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectModelCopyWithImpl($value, $cast, t);
}

class ProjectAdditionalFieldsMapper
    extends SubClassMapperBase<ProjectAdditionalFields> {
  ProjectAdditionalFieldsMapper._();

  static ProjectAdditionalFieldsMapper? _instance;
  static ProjectAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectAdditionalFields';

  static String _$schema(ProjectAdditionalFields v) => v.schema;
  static const Field<ProjectAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Project');
  static int _$version(ProjectAdditionalFields v) => v.version;
  static const Field<ProjectAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(ProjectAdditionalFields v) => v.fields;
  static const Field<ProjectAdditionalFields, List<AdditionalField>> _f$fields =
      Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<ProjectAdditionalFields> fields = const {
    #schema: _f$schema,
    #version: _f$version,
    #fields: _f$fields,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      AdditionalFieldsMapper.ensureInitialized();

  static ProjectAdditionalFields _instantiate(DecodingData data) {
    return ProjectAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectAdditionalFields>(map);
  }

  static ProjectAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectAdditionalFields>(json);
  }
}

mixin ProjectAdditionalFieldsMappable {
  String toJson() {
    return ProjectAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<ProjectAdditionalFields>(this as ProjectAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return ProjectAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<ProjectAdditionalFields>(this as ProjectAdditionalFields);
  }

  ProjectAdditionalFieldsCopyWith<ProjectAdditionalFields,
          ProjectAdditionalFields, ProjectAdditionalFields>
      get copyWith => _ProjectAdditionalFieldsCopyWithImpl(
          this as ProjectAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return ProjectAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as ProjectAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as ProjectAdditionalFields, other));
  }

  @override
  int get hashCode {
    return ProjectAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as ProjectAdditionalFields);
  }
}

extension ProjectAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectAdditionalFields, $Out> {
  ProjectAdditionalFieldsCopyWith<$R, ProjectAdditionalFields, $Out>
      get $asProjectAdditionalFields => $base
          .as((v, t, t2) => _ProjectAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class ProjectAdditionalFieldsCopyWith<
    $R,
    $In extends ProjectAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  ProjectAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectAdditionalFields, $Out>
    implements
        ProjectAdditionalFieldsCopyWith<$R, ProjectAdditionalFields, $Out> {
  _ProjectAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectAdditionalFields> $mapper =
      ProjectAdditionalFieldsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, AdditionalField,
          AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>>
      get fields => ListCopyWith($value.fields, (v, t) => v.copyWith.$chain(t),
          (v) => call(fields: v));
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields}) =>
      $apply(FieldCopyWithData({
        if (schema != null) #schema: schema,
        if (version != null) #version: version,
        if (fields != null) #fields: fields
      }));
  @override
  ProjectAdditionalFields $make(CopyWithData data) => ProjectAdditionalFields(
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version),
      fields: data.get(#fields, or: $value.fields));

  @override
  ProjectAdditionalFieldsCopyWith<$R2, ProjectAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectAdditionalFieldsCopyWithImpl($value, $cast, t);
}

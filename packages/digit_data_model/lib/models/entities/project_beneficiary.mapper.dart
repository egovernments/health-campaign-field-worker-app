// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project_beneficiary.dart';

class ProjectBeneficiarySearchModelMapper
    extends SubClassMapperBase<ProjectBeneficiarySearchModel> {
  ProjectBeneficiarySearchModelMapper._();

  static ProjectBeneficiarySearchModelMapper? _instance;
  static ProjectBeneficiarySearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectBeneficiarySearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectBeneficiarySearchModel';

  static List<String>? _$id(ProjectBeneficiarySearchModel v) => v.id;
  static const Field<ProjectBeneficiarySearchModel, List<String>> _f$id =
      Field('id', _$id, opt: true);
  static List<String>? _$projectId(ProjectBeneficiarySearchModel v) =>
      v.projectId;
  static const Field<ProjectBeneficiarySearchModel, List<String>> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static List<String>? _$beneficiaryId(ProjectBeneficiarySearchModel v) =>
      v.beneficiaryId;
  static const Field<ProjectBeneficiarySearchModel, List<String>>
      _f$beneficiaryId = Field('beneficiaryId', _$beneficiaryId, opt: true);
  static List<String>? _$tag(ProjectBeneficiarySearchModel v) => v.tag;
  static const Field<ProjectBeneficiarySearchModel, List<String>> _f$tag =
      Field('tag', _$tag, opt: true);
  static List<String>? _$beneficiaryClientReferenceId(
          ProjectBeneficiarySearchModel v) =>
      v.beneficiaryClientReferenceId;
  static const Field<ProjectBeneficiarySearchModel, List<String>>
      _f$beneficiaryClientReferenceId = Field(
          'beneficiaryClientReferenceId', _$beneficiaryClientReferenceId,
          opt: true);
  static DateTime? _$beneficiaryRegistrationDateLte(
          ProjectBeneficiarySearchModel v) =>
      v.beneficiaryRegistrationDateLte;
  static const Field<ProjectBeneficiarySearchModel, DateTime>
      _f$beneficiaryRegistrationDateLte = Field(
          'beneficiaryRegistrationDateLte', _$beneficiaryRegistrationDateLte,
          opt: true);
  static DateTime? _$beneficiaryRegistrationDateGte(
          ProjectBeneficiarySearchModel v) =>
      v.beneficiaryRegistrationDateGte;
  static const Field<ProjectBeneficiarySearchModel, DateTime>
      _f$beneficiaryRegistrationDateGte = Field(
          'beneficiaryRegistrationDateGte', _$beneficiaryRegistrationDateGte,
          opt: true);
  static int? _$offset(ProjectBeneficiarySearchModel v) => v.offset;
  static const Field<ProjectBeneficiarySearchModel, int> _f$offset =
      Field('offset', _$offset, opt: true);
  static int? _$limit(ProjectBeneficiarySearchModel v) => v.limit;
  static const Field<ProjectBeneficiarySearchModel, int> _f$limit =
      Field('limit', _$limit, opt: true);
  static List<String>? _$clientReferenceId(ProjectBeneficiarySearchModel v) =>
      v.clientReferenceId;
  static const Field<ProjectBeneficiarySearchModel, List<String>>
      _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$tenantId(ProjectBeneficiarySearchModel v) => v.tenantId;
  static const Field<ProjectBeneficiarySearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$dateOfRegistration(ProjectBeneficiarySearchModel v) =>
      v.dateOfRegistration;
  static const Field<ProjectBeneficiarySearchModel, int> _f$dateOfRegistration =
      Field('dateOfRegistration', _$dateOfRegistration, opt: true);
  static String? _$boundaryCode(ProjectBeneficiarySearchModel v) =>
      v.boundaryCode;
  static const Field<ProjectBeneficiarySearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(ProjectBeneficiarySearchModel v) =>
      v.auditDetails;
  static const Field<ProjectBeneficiarySearchModel, AuditDetails>
      _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(
          ProjectBeneficiarySearchModel v) =>
      v.additionalFields;
  static const Field<ProjectBeneficiarySearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);
  static DateTime? _$dateOfRegistrationTime(ProjectBeneficiarySearchModel v) =>
      v.dateOfRegistrationTime;
  static const Field<ProjectBeneficiarySearchModel, DateTime>
      _f$dateOfRegistrationTime = Field(
          'dateOfRegistrationTime', _$dateOfRegistrationTime,
          mode: FieldMode.member);

  @override
  final MappableFields<ProjectBeneficiarySearchModel> fields = const {
    #id: _f$id,
    #projectId: _f$projectId,
    #beneficiaryId: _f$beneficiaryId,
    #tag: _f$tag,
    #beneficiaryClientReferenceId: _f$beneficiaryClientReferenceId,
    #beneficiaryRegistrationDateLte: _f$beneficiaryRegistrationDateLte,
    #beneficiaryRegistrationDateGte: _f$beneficiaryRegistrationDateGte,
    #offset: _f$offset,
    #limit: _f$limit,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
    #dateOfRegistration: _f$dateOfRegistration,
    #boundaryCode: _f$boundaryCode,
    #auditDetails: _f$auditDetails,
    #additionalFields: _f$additionalFields,
    #dateOfRegistrationTime: _f$dateOfRegistrationTime,
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

  static ProjectBeneficiarySearchModel _instantiate(DecodingData data) {
    return ProjectBeneficiarySearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        projectId: data.dec(_f$projectId),
        beneficiaryId: data.dec(_f$beneficiaryId),
        tag: data.dec(_f$tag),
        beneficiaryClientReferenceId: data.dec(_f$beneficiaryClientReferenceId),
        beneficiaryRegistrationDateLte:
            data.dec(_f$beneficiaryRegistrationDateLte),
        beneficiaryRegistrationDateGte:
            data.dec(_f$beneficiaryRegistrationDateGte),
        offset: data.dec(_f$offset),
        limit: data.dec(_f$limit),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        dateOfRegistration: data.dec(_f$dateOfRegistration),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectBeneficiarySearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectBeneficiarySearchModel>(map);
  }

  static ProjectBeneficiarySearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectBeneficiarySearchModel>(json);
  }
}

mixin ProjectBeneficiarySearchModelMappable {
  String toJson() {
    return ProjectBeneficiarySearchModelMapper.ensureInitialized()
        .encodeJson<ProjectBeneficiarySearchModel>(
            this as ProjectBeneficiarySearchModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectBeneficiarySearchModelMapper.ensureInitialized()
        .encodeMap<ProjectBeneficiarySearchModel>(
            this as ProjectBeneficiarySearchModel);
  }

  ProjectBeneficiarySearchModelCopyWith<ProjectBeneficiarySearchModel,
          ProjectBeneficiarySearchModel, ProjectBeneficiarySearchModel>
      get copyWith => _ProjectBeneficiarySearchModelCopyWithImpl(
          this as ProjectBeneficiarySearchModel, $identity, $identity);
  @override
  String toString() {
    return ProjectBeneficiarySearchModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectBeneficiarySearchModel);
  }

  @override
  bool operator ==(Object other) {
    return ProjectBeneficiarySearchModelMapper.ensureInitialized()
        .equalsValue(this as ProjectBeneficiarySearchModel, other);
  }

  @override
  int get hashCode {
    return ProjectBeneficiarySearchModelMapper.ensureInitialized()
        .hashValue(this as ProjectBeneficiarySearchModel);
  }
}

extension ProjectBeneficiarySearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectBeneficiarySearchModel, $Out> {
  ProjectBeneficiarySearchModelCopyWith<$R, ProjectBeneficiarySearchModel, $Out>
      get $asProjectBeneficiarySearchModel => $base.as(
          (v, t, t2) => _ProjectBeneficiarySearchModelCopyWithImpl(v, t, t2));
}

abstract class ProjectBeneficiarySearchModelCopyWith<
    $R,
    $In extends ProjectBeneficiarySearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get projectId;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get beneficiaryId;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get tag;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get beneficiaryClientReferenceId;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  @override
  $R call(
      {List<String>? id,
      List<String>? projectId,
      List<String>? beneficiaryId,
      List<String>? tag,
      List<String>? beneficiaryClientReferenceId,
      DateTime? beneficiaryRegistrationDateLte,
      DateTime? beneficiaryRegistrationDateGte,
      int? offset,
      int? limit,
      List<String>? clientReferenceId,
      String? tenantId,
      int? dateOfRegistration,
      String? boundaryCode});
  ProjectBeneficiarySearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectBeneficiarySearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectBeneficiarySearchModel, $Out>
    implements
        ProjectBeneficiarySearchModelCopyWith<$R, ProjectBeneficiarySearchModel,
            $Out> {
  _ProjectBeneficiarySearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectBeneficiarySearchModel> $mapper =
      ProjectBeneficiarySearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id =>
      $value.id != null
          ? ListCopyWith($value.id!, (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(id: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get projectId =>
      $value.projectId != null
          ? ListCopyWith(
              $value.projectId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(projectId: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get beneficiaryId => $value.beneficiaryId != null
          ? ListCopyWith(
              $value.beneficiaryId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(beneficiaryId: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get tag =>
      $value.tag != null
          ? ListCopyWith($value.tag!, (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(tag: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get beneficiaryClientReferenceId =>
          $value.beneficiaryClientReferenceId != null
              ? ListCopyWith(
                  $value.beneficiaryClientReferenceId!,
                  (v, t) => ObjectCopyWith(v, $identity, t),
                  (v) => call(beneficiaryClientReferenceId: v))
              : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId => $value.clientReferenceId != null
          ? ListCopyWith(
              $value.clientReferenceId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(clientReferenceId: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? projectId = $none,
          Object? beneficiaryId = $none,
          Object? tag = $none,
          Object? beneficiaryClientReferenceId = $none,
          Object? beneficiaryRegistrationDateLte = $none,
          Object? beneficiaryRegistrationDateGte = $none,
          Object? offset = $none,
          Object? limit = $none,
          Object? clientReferenceId = $none,
          Object? tenantId = $none,
          Object? dateOfRegistration = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (projectId != $none) #projectId: projectId,
        if (beneficiaryId != $none) #beneficiaryId: beneficiaryId,
        if (tag != $none) #tag: tag,
        if (beneficiaryClientReferenceId != $none)
          #beneficiaryClientReferenceId: beneficiaryClientReferenceId,
        if (beneficiaryRegistrationDateLte != $none)
          #beneficiaryRegistrationDateLte: beneficiaryRegistrationDateLte,
        if (beneficiaryRegistrationDateGte != $none)
          #beneficiaryRegistrationDateGte: beneficiaryRegistrationDateGte,
        if (offset != $none) #offset: offset,
        if (limit != $none) #limit: limit,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (dateOfRegistration != $none)
          #dateOfRegistration: dateOfRegistration,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  ProjectBeneficiarySearchModel $make(CopyWithData data) =>
      ProjectBeneficiarySearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          projectId: data.get(#projectId, or: $value.projectId),
          beneficiaryId: data.get(#beneficiaryId, or: $value.beneficiaryId),
          tag: data.get(#tag, or: $value.tag),
          beneficiaryClientReferenceId: data.get(#beneficiaryClientReferenceId,
              or: $value.beneficiaryClientReferenceId),
          beneficiaryRegistrationDateLte: data.get(
              #beneficiaryRegistrationDateLte,
              or: $value.beneficiaryRegistrationDateLte),
          beneficiaryRegistrationDateGte: data.get(
              #beneficiaryRegistrationDateGte,
              or: $value.beneficiaryRegistrationDateGte),
          offset: data.get(#offset, or: $value.offset),
          limit: data.get(#limit, or: $value.limit),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          dateOfRegistration:
              data.get(#dateOfRegistration, or: $value.dateOfRegistration),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  ProjectBeneficiarySearchModelCopyWith<$R2, ProjectBeneficiarySearchModel,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectBeneficiarySearchModelCopyWithImpl($value, $cast, t);
}

class ProjectBeneficiaryModelMapper
    extends SubClassMapperBase<ProjectBeneficiaryModel> {
  ProjectBeneficiaryModelMapper._();

  static ProjectBeneficiaryModelMapper? _instance;
  static ProjectBeneficiaryModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectBeneficiaryModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectBeneficiaryModel';

  static ProjectBeneficiaryAdditionalFields? _$additionalFields(
          ProjectBeneficiaryModel v) =>
      v.additionalFields;
  static const Field<ProjectBeneficiaryModel,
          ProjectBeneficiaryAdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(ProjectBeneficiaryModel v) => v.id;
  static const Field<ProjectBeneficiaryModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$projectId(ProjectBeneficiaryModel v) => v.projectId;
  static const Field<ProjectBeneficiaryModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$beneficiaryId(ProjectBeneficiaryModel v) => v.beneficiaryId;
  static const Field<ProjectBeneficiaryModel, String> _f$beneficiaryId =
      Field('beneficiaryId', _$beneficiaryId, opt: true);
  static String? _$tag(ProjectBeneficiaryModel v) => v.tag;
  static const Field<ProjectBeneficiaryModel, String> _f$tag =
      Field('tag', _$tag, opt: true);
  static String? _$beneficiaryClientReferenceId(ProjectBeneficiaryModel v) =>
      v.beneficiaryClientReferenceId;
  static const Field<ProjectBeneficiaryModel, String>
      _f$beneficiaryClientReferenceId = Field(
          'beneficiaryClientReferenceId', _$beneficiaryClientReferenceId,
          opt: true);
  static bool? _$nonRecoverableError(ProjectBeneficiaryModel v) =>
      v.nonRecoverableError;
  static const Field<ProjectBeneficiaryModel, bool> _f$nonRecoverableError =
      Field('nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static String _$clientReferenceId(ProjectBeneficiaryModel v) =>
      v.clientReferenceId;
  static const Field<ProjectBeneficiaryModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$tenantId(ProjectBeneficiaryModel v) => v.tenantId;
  static const Field<ProjectBeneficiaryModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ProjectBeneficiaryModel v) => v.rowVersion;
  static const Field<ProjectBeneficiaryModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static int _$dateOfRegistration(ProjectBeneficiaryModel v) =>
      v.dateOfRegistration;
  static const Field<ProjectBeneficiaryModel, int> _f$dateOfRegistration =
      Field('dateOfRegistration', _$dateOfRegistration);
  static AuditDetails? _$auditDetails(ProjectBeneficiaryModel v) =>
      v.auditDetails;
  static const Field<ProjectBeneficiaryModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(ProjectBeneficiaryModel v) =>
      v.clientAuditDetails;
  static const Field<ProjectBeneficiaryModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(ProjectBeneficiaryModel v) => v.isDeleted;
  static const Field<ProjectBeneficiaryModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);
  static DateTime _$dateOfRegistrationTime(ProjectBeneficiaryModel v) =>
      v.dateOfRegistrationTime;
  static const Field<ProjectBeneficiaryModel, DateTime>
      _f$dateOfRegistrationTime = Field(
          'dateOfRegistrationTime', _$dateOfRegistrationTime,
          mode: FieldMode.member);

  @override
  final MappableFields<ProjectBeneficiaryModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #projectId: _f$projectId,
    #beneficiaryId: _f$beneficiaryId,
    #tag: _f$tag,
    #beneficiaryClientReferenceId: _f$beneficiaryClientReferenceId,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #dateOfRegistration: _f$dateOfRegistration,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
    #isDeleted: _f$isDeleted,
    #dateOfRegistrationTime: _f$dateOfRegistrationTime,
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

  static ProjectBeneficiaryModel _instantiate(DecodingData data) {
    return ProjectBeneficiaryModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        projectId: data.dec(_f$projectId),
        beneficiaryId: data.dec(_f$beneficiaryId),
        tag: data.dec(_f$tag),
        beneficiaryClientReferenceId: data.dec(_f$beneficiaryClientReferenceId),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        dateOfRegistration: data.dec(_f$dateOfRegistration),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectBeneficiaryModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectBeneficiaryModel>(map);
  }

  static ProjectBeneficiaryModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectBeneficiaryModel>(json);
  }
}

mixin ProjectBeneficiaryModelMappable {
  String toJson() {
    return ProjectBeneficiaryModelMapper.ensureInitialized()
        .encodeJson<ProjectBeneficiaryModel>(this as ProjectBeneficiaryModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectBeneficiaryModelMapper.ensureInitialized()
        .encodeMap<ProjectBeneficiaryModel>(this as ProjectBeneficiaryModel);
  }

  ProjectBeneficiaryModelCopyWith<ProjectBeneficiaryModel,
          ProjectBeneficiaryModel, ProjectBeneficiaryModel>
      get copyWith => _ProjectBeneficiaryModelCopyWithImpl(
          this as ProjectBeneficiaryModel, $identity, $identity);
  @override
  String toString() {
    return ProjectBeneficiaryModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectBeneficiaryModel);
  }

  @override
  bool operator ==(Object other) {
    return ProjectBeneficiaryModelMapper.ensureInitialized()
        .equalsValue(this as ProjectBeneficiaryModel, other);
  }

  @override
  int get hashCode {
    return ProjectBeneficiaryModelMapper.ensureInitialized()
        .hashValue(this as ProjectBeneficiaryModel);
  }
}

extension ProjectBeneficiaryModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectBeneficiaryModel, $Out> {
  ProjectBeneficiaryModelCopyWith<$R, ProjectBeneficiaryModel, $Out>
      get $asProjectBeneficiaryModel => $base
          .as((v, t, t2) => _ProjectBeneficiaryModelCopyWithImpl(v, t, t2));
}

abstract class ProjectBeneficiaryModelCopyWith<
    $R,
    $In extends ProjectBeneficiaryModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  ProjectBeneficiaryAdditionalFieldsCopyWith<
      $R,
      ProjectBeneficiaryAdditionalFields,
      ProjectBeneficiaryAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {ProjectBeneficiaryAdditionalFields? additionalFields,
      String? id,
      String? projectId,
      String? beneficiaryId,
      String? tag,
      String? beneficiaryClientReferenceId,
      bool? nonRecoverableError,
      String? clientReferenceId,
      String? tenantId,
      int? rowVersion,
      int? dateOfRegistration,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  ProjectBeneficiaryModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectBeneficiaryModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectBeneficiaryModel, $Out>
    implements
        ProjectBeneficiaryModelCopyWith<$R, ProjectBeneficiaryModel, $Out> {
  _ProjectBeneficiaryModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectBeneficiaryModel> $mapper =
      ProjectBeneficiaryModelMapper.ensureInitialized();
  @override
  ProjectBeneficiaryAdditionalFieldsCopyWith<
          $R,
          ProjectBeneficiaryAdditionalFields,
          ProjectBeneficiaryAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
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
          Object? id = $none,
          Object? projectId = $none,
          Object? beneficiaryId = $none,
          Object? tag = $none,
          Object? beneficiaryClientReferenceId = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          int? dateOfRegistration,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (projectId != $none) #projectId: projectId,
        if (beneficiaryId != $none) #beneficiaryId: beneficiaryId,
        if (tag != $none) #tag: tag,
        if (beneficiaryClientReferenceId != $none)
          #beneficiaryClientReferenceId: beneficiaryClientReferenceId,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (dateOfRegistration != null) #dateOfRegistration: dateOfRegistration,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  ProjectBeneficiaryModel $make(CopyWithData data) => ProjectBeneficiaryModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      projectId: data.get(#projectId, or: $value.projectId),
      beneficiaryId: data.get(#beneficiaryId, or: $value.beneficiaryId),
      tag: data.get(#tag, or: $value.tag),
      beneficiaryClientReferenceId: data.get(#beneficiaryClientReferenceId,
          or: $value.beneficiaryClientReferenceId),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      dateOfRegistration:
          data.get(#dateOfRegistration, or: $value.dateOfRegistration),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  ProjectBeneficiaryModelCopyWith<$R2, ProjectBeneficiaryModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectBeneficiaryModelCopyWithImpl($value, $cast, t);
}

class ProjectBeneficiaryAdditionalFieldsMapper
    extends SubClassMapperBase<ProjectBeneficiaryAdditionalFields> {
  ProjectBeneficiaryAdditionalFieldsMapper._();

  static ProjectBeneficiaryAdditionalFieldsMapper? _instance;
  static ProjectBeneficiaryAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectBeneficiaryAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectBeneficiaryAdditionalFields';

  static String _$schema(ProjectBeneficiaryAdditionalFields v) => v.schema;
  static const Field<ProjectBeneficiaryAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'ProjectBeneficiary');
  static int _$version(ProjectBeneficiaryAdditionalFields v) => v.version;
  static const Field<ProjectBeneficiaryAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(ProjectBeneficiaryAdditionalFields v) =>
      v.fields;
  static const Field<ProjectBeneficiaryAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<ProjectBeneficiaryAdditionalFields> fields = const {
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

  static ProjectBeneficiaryAdditionalFields _instantiate(DecodingData data) {
    return ProjectBeneficiaryAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectBeneficiaryAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<ProjectBeneficiaryAdditionalFields>(map);
  }

  static ProjectBeneficiaryAdditionalFields fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ProjectBeneficiaryAdditionalFields>(json);
  }
}

mixin ProjectBeneficiaryAdditionalFieldsMappable {
  String toJson() {
    return ProjectBeneficiaryAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<ProjectBeneficiaryAdditionalFields>(
            this as ProjectBeneficiaryAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return ProjectBeneficiaryAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<ProjectBeneficiaryAdditionalFields>(
            this as ProjectBeneficiaryAdditionalFields);
  }

  ProjectBeneficiaryAdditionalFieldsCopyWith<
          ProjectBeneficiaryAdditionalFields,
          ProjectBeneficiaryAdditionalFields,
          ProjectBeneficiaryAdditionalFields>
      get copyWith => _ProjectBeneficiaryAdditionalFieldsCopyWithImpl(
          this as ProjectBeneficiaryAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return ProjectBeneficiaryAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as ProjectBeneficiaryAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return ProjectBeneficiaryAdditionalFieldsMapper.ensureInitialized()
        .equalsValue(this as ProjectBeneficiaryAdditionalFields, other);
  }

  @override
  int get hashCode {
    return ProjectBeneficiaryAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as ProjectBeneficiaryAdditionalFields);
  }
}

extension ProjectBeneficiaryAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectBeneficiaryAdditionalFields, $Out> {
  ProjectBeneficiaryAdditionalFieldsCopyWith<$R,
          ProjectBeneficiaryAdditionalFields, $Out>
      get $asProjectBeneficiaryAdditionalFields => $base.as((v, t, t2) =>
          _ProjectBeneficiaryAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class ProjectBeneficiaryAdditionalFieldsCopyWith<
    $R,
    $In extends ProjectBeneficiaryAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  ProjectBeneficiaryAdditionalFieldsCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProjectBeneficiaryAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectBeneficiaryAdditionalFields, $Out>
    implements
        ProjectBeneficiaryAdditionalFieldsCopyWith<$R,
            ProjectBeneficiaryAdditionalFields, $Out> {
  _ProjectBeneficiaryAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectBeneficiaryAdditionalFields> $mapper =
      ProjectBeneficiaryAdditionalFieldsMapper.ensureInitialized();
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
  ProjectBeneficiaryAdditionalFields $make(CopyWithData data) =>
      ProjectBeneficiaryAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  ProjectBeneficiaryAdditionalFieldsCopyWith<$R2,
      ProjectBeneficiaryAdditionalFields, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectBeneficiaryAdditionalFieldsCopyWithImpl($value, $cast, t);
}

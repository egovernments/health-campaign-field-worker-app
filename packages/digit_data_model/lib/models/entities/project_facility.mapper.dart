// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project_facility.dart';

class ProjectFacilitySearchModelMapper
    extends SubClassMapperBase<ProjectFacilitySearchModel> {
  ProjectFacilitySearchModelMapper._();

  static ProjectFacilitySearchModelMapper? _instance;
  static ProjectFacilitySearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectFacilitySearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectFacilitySearchModel';

  static List<String>? _$id(ProjectFacilitySearchModel v) => v.id;
  static const Field<ProjectFacilitySearchModel, List<String>> _f$id =
      Field('id', _$id, opt: true);
  static List<String>? _$facilityId(ProjectFacilitySearchModel v) =>
      v.facilityId;
  static const Field<ProjectFacilitySearchModel, List<String>> _f$facilityId =
      Field('facilityId', _$facilityId, opt: true);
  static List<String>? _$projectId(ProjectFacilitySearchModel v) => v.projectId;
  static const Field<ProjectFacilitySearchModel, List<String>> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$tenantId(ProjectFacilitySearchModel v) => v.tenantId;
  static const Field<ProjectFacilitySearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(ProjectFacilitySearchModel v) => v.boundaryCode;
  static const Field<ProjectFacilitySearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(ProjectFacilitySearchModel v) =>
      v.auditDetails;
  static const Field<ProjectFacilitySearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(ProjectFacilitySearchModel v) =>
      v.additionalFields;
  static const Field<ProjectFacilitySearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<ProjectFacilitySearchModel> fields = const {
    #id: _f$id,
    #facilityId: _f$facilityId,
    #projectId: _f$projectId,
    #tenantId: _f$tenantId,
    #boundaryCode: _f$boundaryCode,
    #auditDetails: _f$auditDetails,
    #additionalFields: _f$additionalFields,
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

  static ProjectFacilitySearchModel _instantiate(DecodingData data) {
    return ProjectFacilitySearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        facilityId: data.dec(_f$facilityId),
        projectId: data.dec(_f$projectId),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectFacilitySearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectFacilitySearchModel>(map);
  }

  static ProjectFacilitySearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectFacilitySearchModel>(json);
  }
}

mixin ProjectFacilitySearchModelMappable {
  String toJson() {
    return ProjectFacilitySearchModelMapper.ensureInitialized()
        .encodeJson<ProjectFacilitySearchModel>(
            this as ProjectFacilitySearchModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectFacilitySearchModelMapper.ensureInitialized()
        .encodeMap<ProjectFacilitySearchModel>(
            this as ProjectFacilitySearchModel);
  }

  ProjectFacilitySearchModelCopyWith<ProjectFacilitySearchModel,
          ProjectFacilitySearchModel, ProjectFacilitySearchModel>
      get copyWith => _ProjectFacilitySearchModelCopyWithImpl(
          this as ProjectFacilitySearchModel, $identity, $identity);
  @override
  String toString() {
    return ProjectFacilitySearchModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectFacilitySearchModel);
  }

  @override
  bool operator ==(Object other) {
    return ProjectFacilitySearchModelMapper.ensureInitialized()
        .equalsValue(this as ProjectFacilitySearchModel, other);
  }

  @override
  int get hashCode {
    return ProjectFacilitySearchModelMapper.ensureInitialized()
        .hashValue(this as ProjectFacilitySearchModel);
  }
}

extension ProjectFacilitySearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectFacilitySearchModel, $Out> {
  ProjectFacilitySearchModelCopyWith<$R, ProjectFacilitySearchModel, $Out>
      get $asProjectFacilitySearchModel => $base
          .as((v, t, t2) => _ProjectFacilitySearchModelCopyWithImpl(v, t, t2));
}

abstract class ProjectFacilitySearchModelCopyWith<
    $R,
    $In extends ProjectFacilitySearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get facilityId;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get projectId;
  @override
  $R call(
      {List<String>? id,
      List<String>? facilityId,
      List<String>? projectId,
      String? tenantId,
      String? boundaryCode});
  ProjectFacilitySearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectFacilitySearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectFacilitySearchModel, $Out>
    implements
        ProjectFacilitySearchModelCopyWith<$R, ProjectFacilitySearchModel,
            $Out> {
  _ProjectFacilitySearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectFacilitySearchModel> $mapper =
      ProjectFacilitySearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id =>
      $value.id != null
          ? ListCopyWith($value.id!, (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(id: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get facilityId => $value.facilityId != null
          ? ListCopyWith(
              $value.facilityId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(facilityId: v))
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
  $R call(
          {Object? id = $none,
          Object? facilityId = $none,
          Object? projectId = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (facilityId != $none) #facilityId: facilityId,
        if (projectId != $none) #projectId: projectId,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  ProjectFacilitySearchModel $make(CopyWithData data) =>
      ProjectFacilitySearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          facilityId: data.get(#facilityId, or: $value.facilityId),
          projectId: data.get(#projectId, or: $value.projectId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  ProjectFacilitySearchModelCopyWith<$R2, ProjectFacilitySearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectFacilitySearchModelCopyWithImpl($value, $cast, t);
}

class ProjectFacilityModelMapper
    extends SubClassMapperBase<ProjectFacilityModel> {
  ProjectFacilityModelMapper._();

  static ProjectFacilityModelMapper? _instance;
  static ProjectFacilityModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectFacilityModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectFacilityModel';

  static ProjectFacilityAdditionalFields? _$additionalFields(
          ProjectFacilityModel v) =>
      v.additionalFields;
  static const Field<ProjectFacilityModel, ProjectFacilityAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String _$id(ProjectFacilityModel v) => v.id;
  static const Field<ProjectFacilityModel, String> _f$id = Field('id', _$id);
  static String _$facilityId(ProjectFacilityModel v) => v.facilityId;
  static const Field<ProjectFacilityModel, String> _f$facilityId =
      Field('facilityId', _$facilityId);
  static String _$projectId(ProjectFacilityModel v) => v.projectId;
  static const Field<ProjectFacilityModel, String> _f$projectId =
      Field('projectId', _$projectId);
  static bool? _$nonRecoverableError(ProjectFacilityModel v) =>
      v.nonRecoverableError;
  static const Field<ProjectFacilityModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(ProjectFacilityModel v) => v.tenantId;
  static const Field<ProjectFacilityModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ProjectFacilityModel v) => v.rowVersion;
  static const Field<ProjectFacilityModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(ProjectFacilityModel v) => v.auditDetails;
  static const Field<ProjectFacilityModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(ProjectFacilityModel v) =>
      v.clientAuditDetails;
  static const Field<ProjectFacilityModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(ProjectFacilityModel v) => v.isDeleted;
  static const Field<ProjectFacilityModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<ProjectFacilityModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #facilityId: _f$facilityId,
    #projectId: _f$projectId,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
    #isDeleted: _f$isDeleted,
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

  static ProjectFacilityModel _instantiate(DecodingData data) {
    return ProjectFacilityModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        facilityId: data.dec(_f$facilityId),
        projectId: data.dec(_f$projectId),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectFacilityModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectFacilityModel>(map);
  }

  static ProjectFacilityModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectFacilityModel>(json);
  }
}

mixin ProjectFacilityModelMappable {
  String toJson() {
    return ProjectFacilityModelMapper.ensureInitialized()
        .encodeJson<ProjectFacilityModel>(this as ProjectFacilityModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectFacilityModelMapper.ensureInitialized()
        .encodeMap<ProjectFacilityModel>(this as ProjectFacilityModel);
  }

  ProjectFacilityModelCopyWith<ProjectFacilityModel, ProjectFacilityModel,
          ProjectFacilityModel>
      get copyWith => _ProjectFacilityModelCopyWithImpl(
          this as ProjectFacilityModel, $identity, $identity);
  @override
  String toString() {
    return ProjectFacilityModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectFacilityModel);
  }

  @override
  bool operator ==(Object other) {
    return ProjectFacilityModelMapper.ensureInitialized()
        .equalsValue(this as ProjectFacilityModel, other);
  }

  @override
  int get hashCode {
    return ProjectFacilityModelMapper.ensureInitialized()
        .hashValue(this as ProjectFacilityModel);
  }
}

extension ProjectFacilityModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectFacilityModel, $Out> {
  ProjectFacilityModelCopyWith<$R, ProjectFacilityModel, $Out>
      get $asProjectFacilityModel =>
          $base.as((v, t, t2) => _ProjectFacilityModelCopyWithImpl(v, t, t2));
}

abstract class ProjectFacilityModelCopyWith<
    $R,
    $In extends ProjectFacilityModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  ProjectFacilityAdditionalFieldsCopyWith<$R, ProjectFacilityAdditionalFields,
      ProjectFacilityAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {ProjectFacilityAdditionalFields? additionalFields,
      String? id,
      String? facilityId,
      String? projectId,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  ProjectFacilityModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectFacilityModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectFacilityModel, $Out>
    implements ProjectFacilityModelCopyWith<$R, ProjectFacilityModel, $Out> {
  _ProjectFacilityModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectFacilityModel> $mapper =
      ProjectFacilityModelMapper.ensureInitialized();
  @override
  ProjectFacilityAdditionalFieldsCopyWith<$R, ProjectFacilityAdditionalFields,
          ProjectFacilityAdditionalFields>?
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
          String? id,
          String? facilityId,
          String? projectId,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != null) #id: id,
        if (facilityId != null) #facilityId: facilityId,
        if (projectId != null) #projectId: projectId,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  ProjectFacilityModel $make(CopyWithData data) => ProjectFacilityModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      facilityId: data.get(#facilityId, or: $value.facilityId),
      projectId: data.get(#projectId, or: $value.projectId),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  ProjectFacilityModelCopyWith<$R2, ProjectFacilityModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectFacilityModelCopyWithImpl($value, $cast, t);
}

class ProjectFacilityAdditionalFieldsMapper
    extends SubClassMapperBase<ProjectFacilityAdditionalFields> {
  ProjectFacilityAdditionalFieldsMapper._();

  static ProjectFacilityAdditionalFieldsMapper? _instance;
  static ProjectFacilityAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectFacilityAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectFacilityAdditionalFields';

  static String _$schema(ProjectFacilityAdditionalFields v) => v.schema;
  static const Field<ProjectFacilityAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'ProjectFacility');
  static int _$version(ProjectFacilityAdditionalFields v) => v.version;
  static const Field<ProjectFacilityAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(ProjectFacilityAdditionalFields v) =>
      v.fields;
  static const Field<ProjectFacilityAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<ProjectFacilityAdditionalFields> fields = const {
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

  static ProjectFacilityAdditionalFields _instantiate(DecodingData data) {
    return ProjectFacilityAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectFacilityAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectFacilityAdditionalFields>(map);
  }

  static ProjectFacilityAdditionalFields fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ProjectFacilityAdditionalFields>(json);
  }
}

mixin ProjectFacilityAdditionalFieldsMappable {
  String toJson() {
    return ProjectFacilityAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<ProjectFacilityAdditionalFields>(
            this as ProjectFacilityAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return ProjectFacilityAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<ProjectFacilityAdditionalFields>(
            this as ProjectFacilityAdditionalFields);
  }

  ProjectFacilityAdditionalFieldsCopyWith<ProjectFacilityAdditionalFields,
          ProjectFacilityAdditionalFields, ProjectFacilityAdditionalFields>
      get copyWith => _ProjectFacilityAdditionalFieldsCopyWithImpl(
          this as ProjectFacilityAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return ProjectFacilityAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as ProjectFacilityAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return ProjectFacilityAdditionalFieldsMapper.ensureInitialized()
        .equalsValue(this as ProjectFacilityAdditionalFields, other);
  }

  @override
  int get hashCode {
    return ProjectFacilityAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as ProjectFacilityAdditionalFields);
  }
}

extension ProjectFacilityAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectFacilityAdditionalFields, $Out> {
  ProjectFacilityAdditionalFieldsCopyWith<$R, ProjectFacilityAdditionalFields,
          $Out>
      get $asProjectFacilityAdditionalFields => $base.as(
          (v, t, t2) => _ProjectFacilityAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class ProjectFacilityAdditionalFieldsCopyWith<
    $R,
    $In extends ProjectFacilityAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  ProjectFacilityAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectFacilityAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectFacilityAdditionalFields, $Out>
    implements
        ProjectFacilityAdditionalFieldsCopyWith<$R,
            ProjectFacilityAdditionalFields, $Out> {
  _ProjectFacilityAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectFacilityAdditionalFields> $mapper =
      ProjectFacilityAdditionalFieldsMapper.ensureInitialized();
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
  ProjectFacilityAdditionalFields $make(CopyWithData data) =>
      ProjectFacilityAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  ProjectFacilityAdditionalFieldsCopyWith<$R2, ProjectFacilityAdditionalFields,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectFacilityAdditionalFieldsCopyWithImpl($value, $cast, t);
}

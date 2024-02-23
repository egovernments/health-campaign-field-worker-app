// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project_resource.dart';

class ProjectResourceSearchModelMapper
    extends SubClassMapperBase<ProjectResourceSearchModel> {
  ProjectResourceSearchModelMapper._();

  static ProjectResourceSearchModelMapper? _instance;
  static ProjectResourceSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectResourceSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectResourceSearchModel';

  static List<String>? _$id(ProjectResourceSearchModel v) => v.id;
  static const Field<ProjectResourceSearchModel, List<String>> _f$id =
      Field('id', _$id, opt: true);
  static String? _$projectId(ProjectResourceSearchModel v) => v.projectId;
  static const Field<ProjectResourceSearchModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$tenantId(ProjectResourceSearchModel v) => v.tenantId;
  static const Field<ProjectResourceSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(ProjectResourceSearchModel v) => v.boundaryCode;
  static const Field<ProjectResourceSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(ProjectResourceSearchModel v) =>
      v.auditDetails;
  static const Field<ProjectResourceSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(ProjectResourceSearchModel v) =>
      v.additionalFields;
  static const Field<ProjectResourceSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<ProjectResourceSearchModel> fields = const {
    #id: _f$id,
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

  static ProjectResourceSearchModel _instantiate(DecodingData data) {
    return ProjectResourceSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        projectId: data.dec(_f$projectId),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectResourceSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectResourceSearchModel>(map);
  }

  static ProjectResourceSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectResourceSearchModel>(json);
  }
}

mixin ProjectResourceSearchModelMappable {
  String toJson() {
    return ProjectResourceSearchModelMapper.ensureInitialized()
        .encodeJson<ProjectResourceSearchModel>(
            this as ProjectResourceSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectResourceSearchModelMapper.ensureInitialized()
        .encodeMap<ProjectResourceSearchModel>(
            this as ProjectResourceSearchModel);
  }

  ProjectResourceSearchModelCopyWith<ProjectResourceSearchModel,
          ProjectResourceSearchModel, ProjectResourceSearchModel>
      get copyWith => _ProjectResourceSearchModelCopyWithImpl(
          this as ProjectResourceSearchModel, $identity, $identity);
  @override
  String toString() {
    return ProjectResourceSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectResourceSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectResourceSearchModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectResourceSearchModel, other));
  }

  @override
  int get hashCode {
    return ProjectResourceSearchModelMapper.ensureInitialized()
        .hashValue(this as ProjectResourceSearchModel);
  }
}

extension ProjectResourceSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectResourceSearchModel, $Out> {
  ProjectResourceSearchModelCopyWith<$R, ProjectResourceSearchModel, $Out>
      get $asProjectResourceSearchModel => $base
          .as((v, t, t2) => _ProjectResourceSearchModelCopyWithImpl(v, t, t2));
}

abstract class ProjectResourceSearchModelCopyWith<
    $R,
    $In extends ProjectResourceSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id;
  @override
  $R call(
      {List<String>? id,
      String? projectId,
      String? tenantId,
      String? boundaryCode});
  ProjectResourceSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectResourceSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectResourceSearchModel, $Out>
    implements
        ProjectResourceSearchModelCopyWith<$R, ProjectResourceSearchModel,
            $Out> {
  _ProjectResourceSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectResourceSearchModel> $mapper =
      ProjectResourceSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id =>
      $value.id != null
          ? ListCopyWith($value.id!, (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(id: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? projectId = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (projectId != $none) #projectId: projectId,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  ProjectResourceSearchModel $make(CopyWithData data) =>
      ProjectResourceSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          projectId: data.get(#projectId, or: $value.projectId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  ProjectResourceSearchModelCopyWith<$R2, ProjectResourceSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectResourceSearchModelCopyWithImpl($value, $cast, t);
}

class ProjectResourceModelMapper
    extends SubClassMapperBase<ProjectResourceModel> {
  ProjectResourceModelMapper._();

  static ProjectResourceModelMapper? _instance;
  static ProjectResourceModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectResourceModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectResourceModel';

  static ProjectResourceAdditionalFields? _$additionalFields(
          ProjectResourceModel v) =>
      v.additionalFields;
  static const Field<ProjectResourceModel, ProjectResourceAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(ProjectResourceModel v) => v.id;
  static const Field<ProjectResourceModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$projectId(ProjectResourceModel v) => v.projectId;
  static const Field<ProjectResourceModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static bool? _$nonRecoverableError(ProjectResourceModel v) =>
      v.nonRecoverableError;
  static const Field<ProjectResourceModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(ProjectResourceModel v) => v.tenantId;
  static const Field<ProjectResourceModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ProjectResourceModel v) => v.rowVersion;
  static const Field<ProjectResourceModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static ProjectProductVariantModel _$resource(ProjectResourceModel v) =>
      v.resource;
  static const Field<ProjectResourceModel, ProjectProductVariantModel>
      _f$resource = Field('resource', _$resource);
  static AuditDetails? _$auditDetails(ProjectResourceModel v) => v.auditDetails;
  static const Field<ProjectResourceModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(ProjectResourceModel v) =>
      v.clientAuditDetails;
  static const Field<ProjectResourceModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(ProjectResourceModel v) => v.isDeleted;
  static const Field<ProjectResourceModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<ProjectResourceModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #projectId: _f$projectId,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #resource: _f$resource,
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

  static ProjectResourceModel _instantiate(DecodingData data) {
    return ProjectResourceModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        projectId: data.dec(_f$projectId),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        resource: data.dec(_f$resource),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectResourceModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectResourceModel>(map);
  }

  static ProjectResourceModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectResourceModel>(json);
  }
}

mixin ProjectResourceModelMappable {
  String toJson() {
    return ProjectResourceModelMapper.ensureInitialized()
        .encodeJson<ProjectResourceModel>(this as ProjectResourceModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectResourceModelMapper.ensureInitialized()
        .encodeMap<ProjectResourceModel>(this as ProjectResourceModel);
  }

  ProjectResourceModelCopyWith<ProjectResourceModel, ProjectResourceModel,
          ProjectResourceModel>
      get copyWith => _ProjectResourceModelCopyWithImpl(
          this as ProjectResourceModel, $identity, $identity);
  @override
  String toString() {
    return ProjectResourceModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectResourceModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectResourceModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectResourceModel, other));
  }

  @override
  int get hashCode {
    return ProjectResourceModelMapper.ensureInitialized()
        .hashValue(this as ProjectResourceModel);
  }
}

extension ProjectResourceModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectResourceModel, $Out> {
  ProjectResourceModelCopyWith<$R, ProjectResourceModel, $Out>
      get $asProjectResourceModel =>
          $base.as((v, t, t2) => _ProjectResourceModelCopyWithImpl(v, t, t2));
}

abstract class ProjectResourceModelCopyWith<
    $R,
    $In extends ProjectResourceModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  ProjectResourceAdditionalFieldsCopyWith<$R, ProjectResourceAdditionalFields,
      ProjectResourceAdditionalFields>? get additionalFields;
  ProjectProductVariantModelCopyWith<$R, ProjectProductVariantModel,
      ProjectProductVariantModel> get resource;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {ProjectResourceAdditionalFields? additionalFields,
      String? id,
      String? projectId,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      ProjectProductVariantModel? resource,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  ProjectResourceModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectResourceModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectResourceModel, $Out>
    implements ProjectResourceModelCopyWith<$R, ProjectResourceModel, $Out> {
  _ProjectResourceModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectResourceModel> $mapper =
      ProjectResourceModelMapper.ensureInitialized();
  @override
  ProjectResourceAdditionalFieldsCopyWith<$R, ProjectResourceAdditionalFields,
          ProjectResourceAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  ProjectProductVariantModelCopyWith<$R, ProjectProductVariantModel,
          ProjectProductVariantModel>
      get resource => $value.resource.copyWith.$chain((v) => call(resource: v));
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
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          ProjectProductVariantModel? resource,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (projectId != $none) #projectId: projectId,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (resource != null) #resource: resource,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  ProjectResourceModel $make(CopyWithData data) => ProjectResourceModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      projectId: data.get(#projectId, or: $value.projectId),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      resource: data.get(#resource, or: $value.resource),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  ProjectResourceModelCopyWith<$R2, ProjectResourceModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectResourceModelCopyWithImpl($value, $cast, t);
}

class ProjectResourceAdditionalFieldsMapper
    extends SubClassMapperBase<ProjectResourceAdditionalFields> {
  ProjectResourceAdditionalFieldsMapper._();

  static ProjectResourceAdditionalFieldsMapper? _instance;
  static ProjectResourceAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectResourceAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectResourceAdditionalFields';

  static String _$schema(ProjectResourceAdditionalFields v) => v.schema;
  static const Field<ProjectResourceAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'ProjectResource');
  static int _$version(ProjectResourceAdditionalFields v) => v.version;
  static const Field<ProjectResourceAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(ProjectResourceAdditionalFields v) =>
      v.fields;
  static const Field<ProjectResourceAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<ProjectResourceAdditionalFields> fields = const {
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

  static ProjectResourceAdditionalFields _instantiate(DecodingData data) {
    return ProjectResourceAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectResourceAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectResourceAdditionalFields>(map);
  }

  static ProjectResourceAdditionalFields fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ProjectResourceAdditionalFields>(json);
  }
}

mixin ProjectResourceAdditionalFieldsMappable {
  String toJson() {
    return ProjectResourceAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<ProjectResourceAdditionalFields>(
            this as ProjectResourceAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return ProjectResourceAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<ProjectResourceAdditionalFields>(
            this as ProjectResourceAdditionalFields);
  }

  ProjectResourceAdditionalFieldsCopyWith<ProjectResourceAdditionalFields,
          ProjectResourceAdditionalFields, ProjectResourceAdditionalFields>
      get copyWith => _ProjectResourceAdditionalFieldsCopyWithImpl(
          this as ProjectResourceAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return ProjectResourceAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as ProjectResourceAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectResourceAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as ProjectResourceAdditionalFields, other));
  }

  @override
  int get hashCode {
    return ProjectResourceAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as ProjectResourceAdditionalFields);
  }
}

extension ProjectResourceAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectResourceAdditionalFields, $Out> {
  ProjectResourceAdditionalFieldsCopyWith<$R, ProjectResourceAdditionalFields,
          $Out>
      get $asProjectResourceAdditionalFields => $base.as(
          (v, t, t2) => _ProjectResourceAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class ProjectResourceAdditionalFieldsCopyWith<
    $R,
    $In extends ProjectResourceAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  ProjectResourceAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectResourceAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectResourceAdditionalFields, $Out>
    implements
        ProjectResourceAdditionalFieldsCopyWith<$R,
            ProjectResourceAdditionalFields, $Out> {
  _ProjectResourceAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectResourceAdditionalFields> $mapper =
      ProjectResourceAdditionalFieldsMapper.ensureInitialized();
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
  ProjectResourceAdditionalFields $make(CopyWithData data) =>
      ProjectResourceAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  ProjectResourceAdditionalFieldsCopyWith<$R2, ProjectResourceAdditionalFields,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectResourceAdditionalFieldsCopyWithImpl($value, $cast, t);
}

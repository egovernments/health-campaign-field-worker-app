// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project_type.dart';

class ProjectTypeSearchModelMapper
    extends SubClassMapperBase<ProjectTypeSearchModel> {
  ProjectTypeSearchModelMapper._();

  static ProjectTypeSearchModelMapper? _instance;
  static ProjectTypeSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectTypeSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectTypeSearchModel';

  static List<String>? _$clientReferenceId(ProjectTypeSearchModel v) =>
      v.clientReferenceId;
  static const Field<ProjectTypeSearchModel, List<String>>
      _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$tenantId(ProjectTypeSearchModel v) => v.tenantId;
  static const Field<ProjectTypeSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(ProjectTypeSearchModel v) => v.boundaryCode;
  static const Field<ProjectTypeSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(ProjectTypeSearchModel v) =>
      v.auditDetails;
  static const Field<ProjectTypeSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(ProjectTypeSearchModel v) =>
      v.additionalFields;
  static const Field<ProjectTypeSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<ProjectTypeSearchModel> fields = const {
    #clientReferenceId: _f$clientReferenceId,
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

  static ProjectTypeSearchModel _instantiate(DecodingData data) {
    return ProjectTypeSearchModel.ignoreDeleted(
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectTypeSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectTypeSearchModel>(map);
  }

  static ProjectTypeSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectTypeSearchModel>(json);
  }
}

mixin ProjectTypeSearchModelMappable {
  String toJson() {
    return ProjectTypeSearchModelMapper.ensureInitialized()
        .encodeJson<ProjectTypeSearchModel>(this as ProjectTypeSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectTypeSearchModelMapper.ensureInitialized()
        .encodeMap<ProjectTypeSearchModel>(this as ProjectTypeSearchModel);
  }

  ProjectTypeSearchModelCopyWith<ProjectTypeSearchModel, ProjectTypeSearchModel,
          ProjectTypeSearchModel>
      get copyWith => _ProjectTypeSearchModelCopyWithImpl(
          this as ProjectTypeSearchModel, $identity, $identity);
  @override
  String toString() {
    return ProjectTypeSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectTypeSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectTypeSearchModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectTypeSearchModel, other));
  }

  @override
  int get hashCode {
    return ProjectTypeSearchModelMapper.ensureInitialized()
        .hashValue(this as ProjectTypeSearchModel);
  }
}

extension ProjectTypeSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectTypeSearchModel, $Out> {
  ProjectTypeSearchModelCopyWith<$R, ProjectTypeSearchModel, $Out>
      get $asProjectTypeSearchModel =>
          $base.as((v, t, t2) => _ProjectTypeSearchModelCopyWithImpl(v, t, t2));
}

abstract class ProjectTypeSearchModelCopyWith<
    $R,
    $In extends ProjectTypeSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  @override
  $R call(
      {List<String>? clientReferenceId,
      String? tenantId,
      String? boundaryCode});
  ProjectTypeSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectTypeSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectTypeSearchModel, $Out>
    implements
        ProjectTypeSearchModelCopyWith<$R, ProjectTypeSearchModel, $Out> {
  _ProjectTypeSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectTypeSearchModel> $mapper =
      ProjectTypeSearchModelMapper.ensureInitialized();
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
          {Object? clientReferenceId = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  ProjectTypeSearchModel $make(CopyWithData data) =>
      ProjectTypeSearchModel.ignoreDeleted(
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  ProjectTypeSearchModelCopyWith<$R2, ProjectTypeSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectTypeSearchModelCopyWithImpl($value, $cast, t);
}

class ProjectTypeModelMapper extends SubClassMapperBase<ProjectTypeModel> {
  ProjectTypeModelMapper._();

  static ProjectTypeModelMapper? _instance;
  static ProjectTypeModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectTypeModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectTypeModel';

  static ProjectTypeAdditionalFields? _$additionalFields(ProjectTypeModel v) =>
      v.additionalFields;
  static const Field<ProjectTypeModel, ProjectTypeAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(ProjectTypeModel v) => v.id;
  static const Field<ProjectTypeModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$name(ProjectTypeModel v) => v.name;
  static const Field<ProjectTypeModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$code(ProjectTypeModel v) => v.code;
  static const Field<ProjectTypeModel, String> _f$code =
      Field('code', _$code, opt: true);
  static String? _$group(ProjectTypeModel v) => v.group;
  static const Field<ProjectTypeModel, String> _f$group =
      Field('group', _$group, opt: true);
  static String? _$beneficiaryType(ProjectTypeModel v) => v.beneficiaryType;
  static const Field<ProjectTypeModel, String> _f$beneficiaryType =
      Field('beneficiaryType', _$beneficiaryType, opt: true);
  static List<String>? _$eligibilityCriteria(ProjectTypeModel v) =>
      v.eligibilityCriteria;
  static const Field<ProjectTypeModel, List<String>> _f$eligibilityCriteria =
      Field('eligibilityCriteria', _$eligibilityCriteria, opt: true);
  static List<String>? _$taskProcedure(ProjectTypeModel v) => v.taskProcedure;
  static const Field<ProjectTypeModel, List<String>> _f$taskProcedure =
      Field('taskProcedure', _$taskProcedure, opt: true);
  static bool? _$nonRecoverableError(ProjectTypeModel v) =>
      v.nonRecoverableError;
  static const Field<ProjectTypeModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String _$clientReferenceId(ProjectTypeModel v) => v.clientReferenceId;
  static const Field<ProjectTypeModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$tenantId(ProjectTypeModel v) => v.tenantId;
  static const Field<ProjectTypeModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ProjectTypeModel v) => v.rowVersion;
  static const Field<ProjectTypeModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static List<ProjectProductVariantModel>? _$resources(ProjectTypeModel v) =>
      v.resources;
  static const Field<ProjectTypeModel, List<ProjectProductVariantModel>>
      _f$resources = Field('resources', _$resources, opt: true);
  static AuditDetails? _$auditDetails(ProjectTypeModel v) => v.auditDetails;
  static const Field<ProjectTypeModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(ProjectTypeModel v) =>
      v.clientAuditDetails;
  static const Field<ProjectTypeModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(ProjectTypeModel v) => v.isDeleted;
  static const Field<ProjectTypeModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<ProjectTypeModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #name: _f$name,
    #code: _f$code,
    #group: _f$group,
    #beneficiaryType: _f$beneficiaryType,
    #eligibilityCriteria: _f$eligibilityCriteria,
    #taskProcedure: _f$taskProcedure,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #resources: _f$resources,
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

  static ProjectTypeModel _instantiate(DecodingData data) {
    return ProjectTypeModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        code: data.dec(_f$code),
        group: data.dec(_f$group),
        beneficiaryType: data.dec(_f$beneficiaryType),
        eligibilityCriteria: data.dec(_f$eligibilityCriteria),
        taskProcedure: data.dec(_f$taskProcedure),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        resources: data.dec(_f$resources),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectTypeModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectTypeModel>(map);
  }

  static ProjectTypeModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectTypeModel>(json);
  }
}

mixin ProjectTypeModelMappable {
  String toJson() {
    return ProjectTypeModelMapper.ensureInitialized()
        .encodeJson<ProjectTypeModel>(this as ProjectTypeModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectTypeModelMapper.ensureInitialized()
        .encodeMap<ProjectTypeModel>(this as ProjectTypeModel);
  }

  ProjectTypeModelCopyWith<ProjectTypeModel, ProjectTypeModel, ProjectTypeModel>
      get copyWith => _ProjectTypeModelCopyWithImpl(
          this as ProjectTypeModel, $identity, $identity);
  @override
  String toString() {
    return ProjectTypeModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectTypeModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectTypeModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectTypeModel, other));
  }

  @override
  int get hashCode {
    return ProjectTypeModelMapper.ensureInitialized()
        .hashValue(this as ProjectTypeModel);
  }
}

extension ProjectTypeModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectTypeModel, $Out> {
  ProjectTypeModelCopyWith<$R, ProjectTypeModel, $Out>
      get $asProjectTypeModel =>
          $base.as((v, t, t2) => _ProjectTypeModelCopyWithImpl(v, t, t2));
}

abstract class ProjectTypeModelCopyWith<$R, $In extends ProjectTypeModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  ProjectTypeAdditionalFieldsCopyWith<$R, ProjectTypeAdditionalFields,
      ProjectTypeAdditionalFields>? get additionalFields;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get eligibilityCriteria;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get taskProcedure;
  ListCopyWith<
      $R,
      ProjectProductVariantModel,
      ProjectProductVariantModelCopyWith<$R, ProjectProductVariantModel,
          ProjectProductVariantModel>>? get resources;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {ProjectTypeAdditionalFields? additionalFields,
      String? id,
      String? name,
      String? code,
      String? group,
      String? beneficiaryType,
      List<String>? eligibilityCriteria,
      List<String>? taskProcedure,
      bool? nonRecoverableError,
      String? clientReferenceId,
      String? tenantId,
      int? rowVersion,
      List<ProjectProductVariantModel>? resources,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  ProjectTypeModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectTypeModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectTypeModel, $Out>
    implements ProjectTypeModelCopyWith<$R, ProjectTypeModel, $Out> {
  _ProjectTypeModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectTypeModel> $mapper =
      ProjectTypeModelMapper.ensureInitialized();
  @override
  ProjectTypeAdditionalFieldsCopyWith<$R, ProjectTypeAdditionalFields,
          ProjectTypeAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get eligibilityCriteria => $value.eligibilityCriteria != null
          ? ListCopyWith(
              $value.eligibilityCriteria!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(eligibilityCriteria: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get taskProcedure => $value.taskProcedure != null
          ? ListCopyWith(
              $value.taskProcedure!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(taskProcedure: v))
          : null;
  @override
  ListCopyWith<
      $R,
      ProjectProductVariantModel,
      ProjectProductVariantModelCopyWith<$R, ProjectProductVariantModel,
          ProjectProductVariantModel>>? get resources =>
      $value.resources != null
          ? ListCopyWith($value.resources!, (v, t) => v.copyWith.$chain(t),
              (v) => call(resources: v))
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
          Object? id = $none,
          Object? name = $none,
          Object? code = $none,
          Object? group = $none,
          Object? beneficiaryType = $none,
          Object? eligibilityCriteria = $none,
          Object? taskProcedure = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? resources = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (name != $none) #name: name,
        if (code != $none) #code: code,
        if (group != $none) #group: group,
        if (beneficiaryType != $none) #beneficiaryType: beneficiaryType,
        if (eligibilityCriteria != $none)
          #eligibilityCriteria: eligibilityCriteria,
        if (taskProcedure != $none) #taskProcedure: taskProcedure,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (resources != $none) #resources: resources,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  ProjectTypeModel $make(CopyWithData data) => ProjectTypeModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      code: data.get(#code, or: $value.code),
      group: data.get(#group, or: $value.group),
      beneficiaryType: data.get(#beneficiaryType, or: $value.beneficiaryType),
      eligibilityCriteria:
          data.get(#eligibilityCriteria, or: $value.eligibilityCriteria),
      taskProcedure: data.get(#taskProcedure, or: $value.taskProcedure),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      resources: data.get(#resources, or: $value.resources),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  ProjectTypeModelCopyWith<$R2, ProjectTypeModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectTypeModelCopyWithImpl($value, $cast, t);
}

class ProjectTypeAdditionalFieldsMapper
    extends SubClassMapperBase<ProjectTypeAdditionalFields> {
  ProjectTypeAdditionalFieldsMapper._();

  static ProjectTypeAdditionalFieldsMapper? _instance;
  static ProjectTypeAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectTypeAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectTypeAdditionalFields';

  static String _$schema(ProjectTypeAdditionalFields v) => v.schema;
  static const Field<ProjectTypeAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'ProjectType');
  static int _$version(ProjectTypeAdditionalFields v) => v.version;
  static const Field<ProjectTypeAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(ProjectTypeAdditionalFields v) =>
      v.fields;
  static const Field<ProjectTypeAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<ProjectTypeAdditionalFields> fields = const {
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

  static ProjectTypeAdditionalFields _instantiate(DecodingData data) {
    return ProjectTypeAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectTypeAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectTypeAdditionalFields>(map);
  }

  static ProjectTypeAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectTypeAdditionalFields>(json);
  }
}

mixin ProjectTypeAdditionalFieldsMappable {
  String toJson() {
    return ProjectTypeAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<ProjectTypeAdditionalFields>(
            this as ProjectTypeAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return ProjectTypeAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<ProjectTypeAdditionalFields>(
            this as ProjectTypeAdditionalFields);
  }

  ProjectTypeAdditionalFieldsCopyWith<ProjectTypeAdditionalFields,
          ProjectTypeAdditionalFields, ProjectTypeAdditionalFields>
      get copyWith => _ProjectTypeAdditionalFieldsCopyWithImpl(
          this as ProjectTypeAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return ProjectTypeAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as ProjectTypeAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectTypeAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as ProjectTypeAdditionalFields, other));
  }

  @override
  int get hashCode {
    return ProjectTypeAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as ProjectTypeAdditionalFields);
  }
}

extension ProjectTypeAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectTypeAdditionalFields, $Out> {
  ProjectTypeAdditionalFieldsCopyWith<$R, ProjectTypeAdditionalFields, $Out>
      get $asProjectTypeAdditionalFields => $base
          .as((v, t, t2) => _ProjectTypeAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class ProjectTypeAdditionalFieldsCopyWith<
    $R,
    $In extends ProjectTypeAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  ProjectTypeAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectTypeAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectTypeAdditionalFields, $Out>
    implements
        ProjectTypeAdditionalFieldsCopyWith<$R, ProjectTypeAdditionalFields,
            $Out> {
  _ProjectTypeAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectTypeAdditionalFields> $mapper =
      ProjectTypeAdditionalFieldsMapper.ensureInitialized();
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
  ProjectTypeAdditionalFields $make(CopyWithData data) =>
      ProjectTypeAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  ProjectTypeAdditionalFieldsCopyWith<$R2, ProjectTypeAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectTypeAdditionalFieldsCopyWithImpl($value, $cast, t);
}

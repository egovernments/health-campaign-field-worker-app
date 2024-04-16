// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project_resource.dart';

class ProjectResourceSearchModelMapper
    extends ClassMapperBase<ProjectResourceSearchModel> {
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

  @override
  final MappableFields<ProjectResourceSearchModel> fields = const {
    #id: _f$id,
    #projectId: _f$projectId,
    #tenantId: _f$tenantId,
  };
  @override
  final bool ignoreNull = true;

  static ProjectResourceSearchModel _instantiate(DecodingData data) {
    return ProjectResourceSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        projectId: data.dec(_f$projectId),
        tenantId: data.dec(_f$tenantId));
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
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id;
  $R call({List<String>? id, String? projectId, String? tenantId});
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
          Object? tenantId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (projectId != $none) #projectId: projectId,
        if (tenantId != $none) #tenantId: tenantId
      }));
  @override
  ProjectResourceSearchModel $make(CopyWithData data) =>
      ProjectResourceSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          projectId: data.get(#projectId, or: $value.projectId),
          tenantId: data.get(#tenantId, or: $value.tenantId));

  @override
  ProjectResourceSearchModelCopyWith<$R2, ProjectResourceSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectResourceSearchModelCopyWithImpl($value, $cast, t);
}

class ProjectResourceModelMapper extends ClassMapperBase<ProjectResourceModel> {
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

  @override
  final MappableFields<ProjectResourceModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #projectId: _f$projectId,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #resource: _f$resource,
  };
  @override
  final bool ignoreNull = true;

  static ProjectResourceModel _instantiate(DecodingData data) {
    return ProjectResourceModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        projectId: data.dec(_f$projectId),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        resource: data.dec(_f$resource));
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
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ProjectResourceAdditionalFieldsCopyWith<$R, ProjectResourceAdditionalFields,
      ProjectResourceAdditionalFields>? get additionalFields;
  ProjectProductVariantModelCopyWith<$R, ProjectProductVariantModel,
      ProjectProductVariantModel> get resource;
  $R call(
      {ProjectResourceAdditionalFields? additionalFields,
      String? id,
      String? projectId,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      ProjectProductVariantModel? resource});
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
  $R call(
          {Object? additionalFields = $none,
          Object? id = $none,
          Object? projectId = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          ProjectProductVariantModel? resource}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (projectId != $none) #projectId: projectId,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (resource != null) #resource: resource
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
      resource: data.get(#resource, or: $value.resource));

  @override
  ProjectResourceModelCopyWith<$R2, ProjectResourceModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectResourceModelCopyWithImpl($value, $cast, t);
}

class ProjectResourceAdditionalFieldsMapper
    extends ClassMapperBase<ProjectResourceAdditionalFields> {
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

  @override
  final MappableFields<ProjectResourceAdditionalFields> fields = const {};
  @override
  final bool ignoreNull = true;

  static ProjectResourceAdditionalFields _instantiate(DecodingData data) {
    return ProjectResourceAdditionalFields();
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
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
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
  $R call() => $apply(FieldCopyWithData({}));
  @override
  ProjectResourceAdditionalFields $make(CopyWithData data) =>
      ProjectResourceAdditionalFields();

  @override
  ProjectResourceAdditionalFieldsCopyWith<$R2, ProjectResourceAdditionalFields,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectResourceAdditionalFieldsCopyWithImpl($value, $cast, t);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project_product_variant.dart';

class ProjectProductVariantSearchModelMapper
    extends SubClassMapperBase<ProjectProductVariantSearchModel> {
  ProjectProductVariantSearchModelMapper._();

  static ProjectProductVariantSearchModelMapper? _instance;
  static ProjectProductVariantSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectProductVariantSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectProductVariantSearchModel';

  static String? _$productVariantId(ProjectProductVariantSearchModel v) =>
      v.productVariantId;
  static const Field<ProjectProductVariantSearchModel, String>
      _f$productVariantId =
      Field('productVariantId', _$productVariantId, opt: true);
  static String? _$tenantId(ProjectProductVariantSearchModel v) => v.tenantId;
  static const Field<ProjectProductVariantSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(ProjectProductVariantSearchModel v) =>
      v.boundaryCode;
  static const Field<ProjectProductVariantSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(ProjectProductVariantSearchModel v) =>
      v.auditDetails;
  static const Field<ProjectProductVariantSearchModel, AuditDetails>
      _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(
          ProjectProductVariantSearchModel v) =>
      v.additionalFields;
  static const Field<ProjectProductVariantSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<ProjectProductVariantSearchModel> fields = const {
    #productVariantId: _f$productVariantId,
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

  static ProjectProductVariantSearchModel _instantiate(DecodingData data) {
    return ProjectProductVariantSearchModel.ignoreDeleted(
        productVariantId: data.dec(_f$productVariantId),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectProductVariantSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectProductVariantSearchModel>(map);
  }

  static ProjectProductVariantSearchModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ProjectProductVariantSearchModel>(json);
  }
}

mixin ProjectProductVariantSearchModelMappable {
  String toJson() {
    return ProjectProductVariantSearchModelMapper.ensureInitialized()
        .encodeJson<ProjectProductVariantSearchModel>(
            this as ProjectProductVariantSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectProductVariantSearchModelMapper.ensureInitialized()
        .encodeMap<ProjectProductVariantSearchModel>(
            this as ProjectProductVariantSearchModel);
  }

  ProjectProductVariantSearchModelCopyWith<ProjectProductVariantSearchModel,
          ProjectProductVariantSearchModel, ProjectProductVariantSearchModel>
      get copyWith => _ProjectProductVariantSearchModelCopyWithImpl(
          this as ProjectProductVariantSearchModel, $identity, $identity);
  @override
  String toString() {
    return ProjectProductVariantSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectProductVariantSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectProductVariantSearchModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectProductVariantSearchModel, other));
  }

  @override
  int get hashCode {
    return ProjectProductVariantSearchModelMapper.ensureInitialized()
        .hashValue(this as ProjectProductVariantSearchModel);
  }
}

extension ProjectProductVariantSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectProductVariantSearchModel, $Out> {
  ProjectProductVariantSearchModelCopyWith<$R, ProjectProductVariantSearchModel,
          $Out>
      get $asProjectProductVariantSearchModel => $base.as((v, t, t2) =>
          _ProjectProductVariantSearchModelCopyWithImpl(v, t, t2));
}

abstract class ProjectProductVariantSearchModelCopyWith<
    $R,
    $In extends ProjectProductVariantSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  @override
  $R call({String? productVariantId, String? tenantId, String? boundaryCode});
  ProjectProductVariantSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectProductVariantSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectProductVariantSearchModel, $Out>
    implements
        ProjectProductVariantSearchModelCopyWith<$R,
            ProjectProductVariantSearchModel, $Out> {
  _ProjectProductVariantSearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectProductVariantSearchModel> $mapper =
      ProjectProductVariantSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? productVariantId = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (productVariantId != $none) #productVariantId: productVariantId,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  ProjectProductVariantSearchModel $make(CopyWithData data) =>
      ProjectProductVariantSearchModel.ignoreDeleted(
          productVariantId:
              data.get(#productVariantId, or: $value.productVariantId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  ProjectProductVariantSearchModelCopyWith<$R2,
      ProjectProductVariantSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectProductVariantSearchModelCopyWithImpl($value, $cast, t);
}

class ProjectProductVariantModelMapper
    extends SubClassMapperBase<ProjectProductVariantModel> {
  ProjectProductVariantModelMapper._();

  static ProjectProductVariantModelMapper? _instance;
  static ProjectProductVariantModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectProductVariantModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectProductVariantModel';

  static ProjectProductVariantAdditionalFields? _$additionalFields(
          ProjectProductVariantModel v) =>
      v.additionalFields;
  static const Field<ProjectProductVariantModel,
          ProjectProductVariantAdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String _$productVariantId(ProjectProductVariantModel v) =>
      v.productVariantId;
  static const Field<ProjectProductVariantModel, String> _f$productVariantId =
      Field('productVariantId', _$productVariantId);
  static String? _$type(ProjectProductVariantModel v) => v.type;
  static const Field<ProjectProductVariantModel, String> _f$type =
      Field('type', _$type, opt: true);
  static bool? _$isBaseUnitVariant(ProjectProductVariantModel v) =>
      v.isBaseUnitVariant;
  static const Field<ProjectProductVariantModel, bool> _f$isBaseUnitVariant =
      Field('isBaseUnitVariant', _$isBaseUnitVariant, opt: true);
  static bool? _$nonRecoverableError(ProjectProductVariantModel v) =>
      v.nonRecoverableError;
  static const Field<ProjectProductVariantModel, bool> _f$nonRecoverableError =
      Field('nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static String? _$tenantId(ProjectProductVariantModel v) => v.tenantId;
  static const Field<ProjectProductVariantModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ProjectProductVariantModel v) => v.rowVersion;
  static const Field<ProjectProductVariantModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(ProjectProductVariantModel v) =>
      v.auditDetails;
  static const Field<ProjectProductVariantModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(
          ProjectProductVariantModel v) =>
      v.clientAuditDetails;
  static const Field<ProjectProductVariantModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(ProjectProductVariantModel v) => v.isDeleted;
  static const Field<ProjectProductVariantModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<ProjectProductVariantModel> fields = const {
    #additionalFields: _f$additionalFields,
    #productVariantId: _f$productVariantId,
    #type: _f$type,
    #isBaseUnitVariant: _f$isBaseUnitVariant,
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

  static ProjectProductVariantModel _instantiate(DecodingData data) {
    return ProjectProductVariantModel(
        additionalFields: data.dec(_f$additionalFields),
        productVariantId: data.dec(_f$productVariantId),
        type: data.dec(_f$type),
        isBaseUnitVariant: data.dec(_f$isBaseUnitVariant),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectProductVariantModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectProductVariantModel>(map);
  }

  static ProjectProductVariantModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectProductVariantModel>(json);
  }
}

mixin ProjectProductVariantModelMappable {
  String toJson() {
    return ProjectProductVariantModelMapper.ensureInitialized()
        .encodeJson<ProjectProductVariantModel>(
            this as ProjectProductVariantModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectProductVariantModelMapper.ensureInitialized()
        .encodeMap<ProjectProductVariantModel>(
            this as ProjectProductVariantModel);
  }

  ProjectProductVariantModelCopyWith<ProjectProductVariantModel,
          ProjectProductVariantModel, ProjectProductVariantModel>
      get copyWith => _ProjectProductVariantModelCopyWithImpl(
          this as ProjectProductVariantModel, $identity, $identity);
  @override
  String toString() {
    return ProjectProductVariantModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectProductVariantModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectProductVariantModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectProductVariantModel, other));
  }

  @override
  int get hashCode {
    return ProjectProductVariantModelMapper.ensureInitialized()
        .hashValue(this as ProjectProductVariantModel);
  }
}

extension ProjectProductVariantModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectProductVariantModel, $Out> {
  ProjectProductVariantModelCopyWith<$R, ProjectProductVariantModel, $Out>
      get $asProjectProductVariantModel => $base
          .as((v, t, t2) => _ProjectProductVariantModelCopyWithImpl(v, t, t2));
}

abstract class ProjectProductVariantModelCopyWith<
    $R,
    $In extends ProjectProductVariantModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  ProjectProductVariantAdditionalFieldsCopyWith<
      $R,
      ProjectProductVariantAdditionalFields,
      ProjectProductVariantAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {ProjectProductVariantAdditionalFields? additionalFields,
      String? productVariantId,
      String? type,
      bool? isBaseUnitVariant,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  ProjectProductVariantModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectProductVariantModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectProductVariantModel, $Out>
    implements
        ProjectProductVariantModelCopyWith<$R, ProjectProductVariantModel,
            $Out> {
  _ProjectProductVariantModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectProductVariantModel> $mapper =
      ProjectProductVariantModelMapper.ensureInitialized();
  @override
  ProjectProductVariantAdditionalFieldsCopyWith<
          $R,
          ProjectProductVariantAdditionalFields,
          ProjectProductVariantAdditionalFields>?
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
          String? productVariantId,
          Object? type = $none,
          Object? isBaseUnitVariant = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (productVariantId != null) #productVariantId: productVariantId,
        if (type != $none) #type: type,
        if (isBaseUnitVariant != $none) #isBaseUnitVariant: isBaseUnitVariant,
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
  ProjectProductVariantModel
      $make(CopyWithData data) =>
          ProjectProductVariantModel(
              additionalFields:
                  data.get(#additionalFields, or: $value.additionalFields),
              productVariantId:
                  data.get(#productVariantId, or: $value.productVariantId),
              type: data.get(#type, or: $value.type),
              isBaseUnitVariant:
                  data.get(#isBaseUnitVariant, or: $value.isBaseUnitVariant),
              nonRecoverableError: data.get(#nonRecoverableError,
                  or: $value.nonRecoverableError),
              tenantId: data.get(#tenantId, or: $value.tenantId),
              rowVersion: data.get(#rowVersion, or: $value.rowVersion),
              auditDetails: data.get(#auditDetails, or: $value.auditDetails),
              clientAuditDetails:
                  data.get(#clientAuditDetails, or: $value.clientAuditDetails),
              isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  ProjectProductVariantModelCopyWith<$R2, ProjectProductVariantModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectProductVariantModelCopyWithImpl($value, $cast, t);
}

class ProjectProductVariantAdditionalFieldsMapper
    extends SubClassMapperBase<ProjectProductVariantAdditionalFields> {
  ProjectProductVariantAdditionalFieldsMapper._();

  static ProjectProductVariantAdditionalFieldsMapper? _instance;
  static ProjectProductVariantAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectProductVariantAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectProductVariantAdditionalFields';

  static String _$schema(ProjectProductVariantAdditionalFields v) => v.schema;
  static const Field<ProjectProductVariantAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'ProjectProductVariant');
  static int _$version(ProjectProductVariantAdditionalFields v) => v.version;
  static const Field<ProjectProductVariantAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(
          ProjectProductVariantAdditionalFields v) =>
      v.fields;
  static const Field<ProjectProductVariantAdditionalFields,
          List<AdditionalField>> _f$fields =
      Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<ProjectProductVariantAdditionalFields> fields = const {
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

  static ProjectProductVariantAdditionalFields _instantiate(DecodingData data) {
    return ProjectProductVariantAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectProductVariantAdditionalFields fromMap(
      Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<ProjectProductVariantAdditionalFields>(map);
  }

  static ProjectProductVariantAdditionalFields fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ProjectProductVariantAdditionalFields>(json);
  }
}

mixin ProjectProductVariantAdditionalFieldsMappable {
  String toJson() {
    return ProjectProductVariantAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<ProjectProductVariantAdditionalFields>(
            this as ProjectProductVariantAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return ProjectProductVariantAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<ProjectProductVariantAdditionalFields>(
            this as ProjectProductVariantAdditionalFields);
  }

  ProjectProductVariantAdditionalFieldsCopyWith<
          ProjectProductVariantAdditionalFields,
          ProjectProductVariantAdditionalFields,
          ProjectProductVariantAdditionalFields>
      get copyWith => _ProjectProductVariantAdditionalFieldsCopyWithImpl(
          this as ProjectProductVariantAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return ProjectProductVariantAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as ProjectProductVariantAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectProductVariantAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(
                    this as ProjectProductVariantAdditionalFields, other));
  }

  @override
  int get hashCode {
    return ProjectProductVariantAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as ProjectProductVariantAdditionalFields);
  }
}

extension ProjectProductVariantAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectProductVariantAdditionalFields, $Out> {
  ProjectProductVariantAdditionalFieldsCopyWith<$R,
          ProjectProductVariantAdditionalFields, $Out>
      get $asProjectProductVariantAdditionalFields => $base.as((v, t, t2) =>
          _ProjectProductVariantAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class ProjectProductVariantAdditionalFieldsCopyWith<
    $R,
    $In extends ProjectProductVariantAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  ProjectProductVariantAdditionalFieldsCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProjectProductVariantAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectProductVariantAdditionalFields, $Out>
    implements
        ProjectProductVariantAdditionalFieldsCopyWith<$R,
            ProjectProductVariantAdditionalFields, $Out> {
  _ProjectProductVariantAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectProductVariantAdditionalFields> $mapper =
      ProjectProductVariantAdditionalFieldsMapper.ensureInitialized();
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
  ProjectProductVariantAdditionalFields $make(CopyWithData data) =>
      ProjectProductVariantAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  ProjectProductVariantAdditionalFieldsCopyWith<$R2,
      ProjectProductVariantAdditionalFields, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectProductVariantAdditionalFieldsCopyWithImpl($value, $cast, t);
}

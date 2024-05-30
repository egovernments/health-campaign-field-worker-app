// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'locality.dart';

class LocalitySearchModelMapper
    extends SubClassMapperBase<LocalitySearchModel> {
  LocalitySearchModelMapper._();

  static LocalitySearchModelMapper? _instance;
  static LocalitySearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocalitySearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalitySearchModel';

  static String? _$code(LocalitySearchModel v) => v.code;
  static const Field<LocalitySearchModel, String> _f$code =
      Field('code', _$code, opt: true);
  static String? _$name(LocalitySearchModel v) => v.name;
  static const Field<LocalitySearchModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$tenantId(LocalitySearchModel v) => v.tenantId;
  static const Field<LocalitySearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(LocalitySearchModel v) => v.boundaryCode;
  static const Field<LocalitySearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(LocalitySearchModel v) => v.auditDetails;
  static const Field<LocalitySearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(LocalitySearchModel v) =>
      v.additionalFields;
  static const Field<LocalitySearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<LocalitySearchModel> fields = const {
    #code: _f$code,
    #name: _f$name,
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

  static LocalitySearchModel _instantiate(DecodingData data) {
    return LocalitySearchModel.ignoreDeleted(
        code: data.dec(_f$code),
        name: data.dec(_f$name),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalitySearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalitySearchModel>(map);
  }

  static LocalitySearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<LocalitySearchModel>(json);
  }
}

mixin LocalitySearchModelMappable {
  String toJson() {
    return LocalitySearchModelMapper.ensureInitialized()
        .encodeJson<LocalitySearchModel>(this as LocalitySearchModel);
  }

  Map<String, dynamic> toMap() {
    return LocalitySearchModelMapper.ensureInitialized()
        .encodeMap<LocalitySearchModel>(this as LocalitySearchModel);
  }

  LocalitySearchModelCopyWith<LocalitySearchModel, LocalitySearchModel,
          LocalitySearchModel>
      get copyWith => _LocalitySearchModelCopyWithImpl(
          this as LocalitySearchModel, $identity, $identity);
  @override
  String toString() {
    return LocalitySearchModelMapper.ensureInitialized()
        .stringifyValue(this as LocalitySearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LocalitySearchModelMapper.ensureInitialized()
                .isValueEqual(this as LocalitySearchModel, other));
  }

  @override
  int get hashCode {
    return LocalitySearchModelMapper.ensureInitialized()
        .hashValue(this as LocalitySearchModel);
  }
}

extension LocalitySearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalitySearchModel, $Out> {
  LocalitySearchModelCopyWith<$R, LocalitySearchModel, $Out>
      get $asLocalitySearchModel =>
          $base.as((v, t, t2) => _LocalitySearchModelCopyWithImpl(v, t, t2));
}

abstract class LocalitySearchModelCopyWith<$R, $In extends LocalitySearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  @override
  $R call({String? code, String? name, String? tenantId, String? boundaryCode});
  LocalitySearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocalitySearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalitySearchModel, $Out>
    implements LocalitySearchModelCopyWith<$R, LocalitySearchModel, $Out> {
  _LocalitySearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalitySearchModel> $mapper =
      LocalitySearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? code = $none,
          Object? name = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (code != $none) #code: code,
        if (name != $none) #name: name,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  LocalitySearchModel $make(CopyWithData data) =>
      LocalitySearchModel.ignoreDeleted(
          code: data.get(#code, or: $value.code),
          name: data.get(#name, or: $value.name),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  LocalitySearchModelCopyWith<$R2, LocalitySearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LocalitySearchModelCopyWithImpl($value, $cast, t);
}

class LocalityModelMapper extends SubClassMapperBase<LocalityModel> {
  LocalityModelMapper._();

  static LocalityModelMapper? _instance;
  static LocalityModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocalityModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalityModel';

  static LocalityAdditionalFields? _$additionalFields(LocalityModel v) =>
      v.additionalFields;
  static const Field<LocalityModel, LocalityAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String _$code(LocalityModel v) => v.code;
  static const Field<LocalityModel, String> _f$code = Field('code', _$code);
  static String? _$name(LocalityModel v) => v.name;
  static const Field<LocalityModel, String> _f$name =
      Field('name', _$name, opt: true);
  static bool? _$nonRecoverableError(LocalityModel v) => v.nonRecoverableError;
  static const Field<LocalityModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(LocalityModel v) => v.tenantId;
  static const Field<LocalityModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(LocalityModel v) => v.rowVersion;
  static const Field<LocalityModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(LocalityModel v) => v.auditDetails;
  static const Field<LocalityModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(LocalityModel v) =>
      v.clientAuditDetails;
  static const Field<LocalityModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(LocalityModel v) => v.isDeleted;
  static const Field<LocalityModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<LocalityModel> fields = const {
    #additionalFields: _f$additionalFields,
    #code: _f$code,
    #name: _f$name,
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

  static LocalityModel _instantiate(DecodingData data) {
    return LocalityModel(
        additionalFields: data.dec(_f$additionalFields),
        code: data.dec(_f$code),
        name: data.dec(_f$name),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalityModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalityModel>(map);
  }

  static LocalityModel fromJson(String json) {
    return ensureInitialized().decodeJson<LocalityModel>(json);
  }
}

mixin LocalityModelMappable {
  String toJson() {
    return LocalityModelMapper.ensureInitialized()
        .encodeJson<LocalityModel>(this as LocalityModel);
  }

  Map<String, dynamic> toMap() {
    return LocalityModelMapper.ensureInitialized()
        .encodeMap<LocalityModel>(this as LocalityModel);
  }

  LocalityModelCopyWith<LocalityModel, LocalityModel, LocalityModel>
      get copyWith => _LocalityModelCopyWithImpl(
          this as LocalityModel, $identity, $identity);
  @override
  String toString() {
    return LocalityModelMapper.ensureInitialized()
        .stringifyValue(this as LocalityModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LocalityModelMapper.ensureInitialized()
                .isValueEqual(this as LocalityModel, other));
  }

  @override
  int get hashCode {
    return LocalityModelMapper.ensureInitialized()
        .hashValue(this as LocalityModel);
  }
}

extension LocalityModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalityModel, $Out> {
  LocalityModelCopyWith<$R, LocalityModel, $Out> get $asLocalityModel =>
      $base.as((v, t, t2) => _LocalityModelCopyWithImpl(v, t, t2));
}

abstract class LocalityModelCopyWith<$R, $In extends LocalityModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  LocalityAdditionalFieldsCopyWith<$R, LocalityAdditionalFields,
      LocalityAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {LocalityAdditionalFields? additionalFields,
      String? code,
      String? name,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  LocalityModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LocalityModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalityModel, $Out>
    implements LocalityModelCopyWith<$R, LocalityModel, $Out> {
  _LocalityModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalityModel> $mapper =
      LocalityModelMapper.ensureInitialized();
  @override
  LocalityAdditionalFieldsCopyWith<$R, LocalityAdditionalFields,
          LocalityAdditionalFields>?
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
          String? code,
          Object? name = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (code != null) #code: code,
        if (name != $none) #name: name,
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
  LocalityModel $make(CopyWithData data) => LocalityModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      code: data.get(#code, or: $value.code),
      name: data.get(#name, or: $value.name),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  LocalityModelCopyWith<$R2, LocalityModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LocalityModelCopyWithImpl($value, $cast, t);
}

class LocalityAdditionalFieldsMapper
    extends SubClassMapperBase<LocalityAdditionalFields> {
  LocalityAdditionalFieldsMapper._();

  static LocalityAdditionalFieldsMapper? _instance;
  static LocalityAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = LocalityAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalityAdditionalFields';

  static String _$schema(LocalityAdditionalFields v) => v.schema;
  static const Field<LocalityAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Locality');
  static int _$version(LocalityAdditionalFields v) => v.version;
  static const Field<LocalityAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(LocalityAdditionalFields v) => v.fields;
  static const Field<LocalityAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<LocalityAdditionalFields> fields = const {
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

  static LocalityAdditionalFields _instantiate(DecodingData data) {
    return LocalityAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalityAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalityAdditionalFields>(map);
  }

  static LocalityAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<LocalityAdditionalFields>(json);
  }
}

mixin LocalityAdditionalFieldsMappable {
  String toJson() {
    return LocalityAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<LocalityAdditionalFields>(this as LocalityAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return LocalityAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<LocalityAdditionalFields>(this as LocalityAdditionalFields);
  }

  LocalityAdditionalFieldsCopyWith<LocalityAdditionalFields,
          LocalityAdditionalFields, LocalityAdditionalFields>
      get copyWith => _LocalityAdditionalFieldsCopyWithImpl(
          this as LocalityAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return LocalityAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as LocalityAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LocalityAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as LocalityAdditionalFields, other));
  }

  @override
  int get hashCode {
    return LocalityAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as LocalityAdditionalFields);
  }
}

extension LocalityAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalityAdditionalFields, $Out> {
  LocalityAdditionalFieldsCopyWith<$R, LocalityAdditionalFields, $Out>
      get $asLocalityAdditionalFields => $base
          .as((v, t, t2) => _LocalityAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class LocalityAdditionalFieldsCopyWith<
    $R,
    $In extends LocalityAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  LocalityAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocalityAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalityAdditionalFields, $Out>
    implements
        LocalityAdditionalFieldsCopyWith<$R, LocalityAdditionalFields, $Out> {
  _LocalityAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalityAdditionalFields> $mapper =
      LocalityAdditionalFieldsMapper.ensureInitialized();
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
  LocalityAdditionalFields $make(CopyWithData data) => LocalityAdditionalFields(
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version),
      fields: data.get(#fields, or: $value.fields));

  @override
  LocalityAdditionalFieldsCopyWith<$R2, LocalityAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LocalityAdditionalFieldsCopyWithImpl($value, $cast, t);
}

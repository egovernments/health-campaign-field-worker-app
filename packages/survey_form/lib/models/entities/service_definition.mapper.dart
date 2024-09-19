// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'service_definition.dart';

class ServiceDefinitionSearchModelMapper
    extends SubClassMapperBase<ServiceDefinitionSearchModel> {
  ServiceDefinitionSearchModelMapper._();

  static ServiceDefinitionSearchModelMapper? _instance;
  static ServiceDefinitionSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ServiceDefinitionSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceDefinitionSearchModel';

  static String? _$id(ServiceDefinitionSearchModel v) => v.id;
  static const Field<ServiceDefinitionSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(ServiceDefinitionSearchModel v) => v.tenantId;
  static const Field<ServiceDefinitionSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static List<String>? _$code(ServiceDefinitionSearchModel v) => v.code;
  static const Field<ServiceDefinitionSearchModel, List<String>> _f$code =
      Field('code', _$code, opt: true);
  static bool? _$isActive(ServiceDefinitionSearchModel v) => v.isActive;
  static const Field<ServiceDefinitionSearchModel, bool> _f$isActive =
      Field('isActive', _$isActive, opt: true);
  static String? _$boundaryCode(ServiceDefinitionSearchModel v) =>
      v.boundaryCode;
  static const Field<ServiceDefinitionSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(ServiceDefinitionSearchModel v) =>
      v.auditDetails;
  static const Field<ServiceDefinitionSearchModel, AuditDetails>
      _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(ServiceDefinitionSearchModel v) =>
      v.additionalFields;
  static const Field<ServiceDefinitionSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<ServiceDefinitionSearchModel> fields = const {
    #id: _f$id,
    #tenantId: _f$tenantId,
    #code: _f$code,
    #isActive: _f$isActive,
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

  static ServiceDefinitionSearchModel _instantiate(DecodingData data) {
    return ServiceDefinitionSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        code: data.dec(_f$code),
        isActive: data.dec(_f$isActive),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceDefinitionSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServiceDefinitionSearchModel>(map);
  }

  static ServiceDefinitionSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<ServiceDefinitionSearchModel>(json);
  }
}

mixin ServiceDefinitionSearchModelMappable {
  String toJson() {
    return ServiceDefinitionSearchModelMapper.ensureInitialized()
        .encodeJson<ServiceDefinitionSearchModel>(
            this as ServiceDefinitionSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ServiceDefinitionSearchModelMapper.ensureInitialized()
        .encodeMap<ServiceDefinitionSearchModel>(
            this as ServiceDefinitionSearchModel);
  }

  ServiceDefinitionSearchModelCopyWith<ServiceDefinitionSearchModel,
          ServiceDefinitionSearchModel, ServiceDefinitionSearchModel>
      get copyWith => _ServiceDefinitionSearchModelCopyWithImpl(
          this as ServiceDefinitionSearchModel, $identity, $identity);
  @override
  String toString() {
    return ServiceDefinitionSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ServiceDefinitionSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ServiceDefinitionSearchModelMapper.ensureInitialized()
                .isValueEqual(this as ServiceDefinitionSearchModel, other));
  }

  @override
  int get hashCode {
    return ServiceDefinitionSearchModelMapper.ensureInitialized()
        .hashValue(this as ServiceDefinitionSearchModel);
  }
}

extension ServiceDefinitionSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceDefinitionSearchModel, $Out> {
  ServiceDefinitionSearchModelCopyWith<$R, ServiceDefinitionSearchModel, $Out>
      get $asServiceDefinitionSearchModel => $base.as(
          (v, t, t2) => _ServiceDefinitionSearchModelCopyWithImpl(v, t, t2));
}

abstract class ServiceDefinitionSearchModelCopyWith<
    $R,
    $In extends ServiceDefinitionSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get code;
  @override
  $R call(
      {String? id,
      String? tenantId,
      List<String>? code,
      bool? isActive,
      String? boundaryCode});
  ServiceDefinitionSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServiceDefinitionSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceDefinitionSearchModel, $Out>
    implements
        ServiceDefinitionSearchModelCopyWith<$R, ServiceDefinitionSearchModel,
            $Out> {
  _ServiceDefinitionSearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceDefinitionSearchModel> $mapper =
      ServiceDefinitionSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get code =>
      $value.code != null
          ? ListCopyWith($value.code!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(code: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? tenantId = $none,
          Object? code = $none,
          Object? isActive = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (code != $none) #code: code,
        if (isActive != $none) #isActive: isActive,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  ServiceDefinitionSearchModel $make(CopyWithData data) =>
      ServiceDefinitionSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          code: data.get(#code, or: $value.code),
          isActive: data.get(#isActive, or: $value.isActive),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  ServiceDefinitionSearchModelCopyWith<$R2, ServiceDefinitionSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ServiceDefinitionSearchModelCopyWithImpl($value, $cast, t);
}

class ServiceDefinitionModelMapper
    extends SubClassMapperBase<ServiceDefinitionModel> {
  ServiceDefinitionModelMapper._();

  static ServiceDefinitionModelMapper? _instance;
  static ServiceDefinitionModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServiceDefinitionModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceDefinitionModel';

  static ServiceDefinitionAdditionalFields? _$additionalFields(
          ServiceDefinitionModel v) =>
      v.additionalFields;
  static const Field<ServiceDefinitionModel, ServiceDefinitionAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(ServiceDefinitionModel v) => v.id;
  static const Field<ServiceDefinitionModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(ServiceDefinitionModel v) => v.tenantId;
  static const Field<ServiceDefinitionModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$code(ServiceDefinitionModel v) => v.code;
  static const Field<ServiceDefinitionModel, String> _f$code =
      Field('code', _$code, opt: true);
  static bool? _$isActive(ServiceDefinitionModel v) => v.isActive;
  static const Field<ServiceDefinitionModel, bool> _f$isActive =
      Field('isActive', _$isActive, opt: true);
  static bool? _$nonRecoverableError(ServiceDefinitionModel v) =>
      v.nonRecoverableError;
  static const Field<ServiceDefinitionModel, bool> _f$nonRecoverableError =
      Field('nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static int? _$rowVersion(ServiceDefinitionModel v) => v.rowVersion;
  static const Field<ServiceDefinitionModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static List<AttributesModel>? _$attributes(ServiceDefinitionModel v) =>
      v.attributes;
  static const Field<ServiceDefinitionModel, List<AttributesModel>>
      _f$attributes = Field('attributes', _$attributes, opt: true);
  static AuditDetails? _$auditDetails(ServiceDefinitionModel v) =>
      v.auditDetails;
  static const Field<ServiceDefinitionModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(ServiceDefinitionModel v) =>
      v.clientAuditDetails;
  static const Field<ServiceDefinitionModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(ServiceDefinitionModel v) => v.isDeleted;
  static const Field<ServiceDefinitionModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<ServiceDefinitionModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #tenantId: _f$tenantId,
    #code: _f$code,
    #isActive: _f$isActive,
    #nonRecoverableError: _f$nonRecoverableError,
    #rowVersion: _f$rowVersion,
    #attributes: _f$attributes,
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

  static ServiceDefinitionModel _instantiate(DecodingData data) {
    return ServiceDefinitionModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        code: data.dec(_f$code),
        isActive: data.dec(_f$isActive),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        rowVersion: data.dec(_f$rowVersion),
        attributes: data.dec(_f$attributes),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceDefinitionModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServiceDefinitionModel>(map);
  }

  static ServiceDefinitionModel fromJson(String json) {
    return ensureInitialized().decodeJson<ServiceDefinitionModel>(json);
  }
}

mixin ServiceDefinitionModelMappable {
  String toJson() {
    return ServiceDefinitionModelMapper.ensureInitialized()
        .encodeJson<ServiceDefinitionModel>(this as ServiceDefinitionModel);
  }

  Map<String, dynamic> toMap() {
    return ServiceDefinitionModelMapper.ensureInitialized()
        .encodeMap<ServiceDefinitionModel>(this as ServiceDefinitionModel);
  }

  ServiceDefinitionModelCopyWith<ServiceDefinitionModel, ServiceDefinitionModel,
          ServiceDefinitionModel>
      get copyWith => _ServiceDefinitionModelCopyWithImpl(
          this as ServiceDefinitionModel, $identity, $identity);
  @override
  String toString() {
    return ServiceDefinitionModelMapper.ensureInitialized()
        .stringifyValue(this as ServiceDefinitionModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ServiceDefinitionModelMapper.ensureInitialized()
                .isValueEqual(this as ServiceDefinitionModel, other));
  }

  @override
  int get hashCode {
    return ServiceDefinitionModelMapper.ensureInitialized()
        .hashValue(this as ServiceDefinitionModel);
  }
}

extension ServiceDefinitionModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceDefinitionModel, $Out> {
  ServiceDefinitionModelCopyWith<$R, ServiceDefinitionModel, $Out>
      get $asServiceDefinitionModel =>
          $base.as((v, t, t2) => _ServiceDefinitionModelCopyWithImpl(v, t, t2));
}

abstract class ServiceDefinitionModelCopyWith<
    $R,
    $In extends ServiceDefinitionModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  ServiceDefinitionAdditionalFieldsCopyWith<
      $R,
      ServiceDefinitionAdditionalFields,
      ServiceDefinitionAdditionalFields>? get additionalFields;
  ListCopyWith<$R, AttributesModel,
          AttributesModelCopyWith<$R, AttributesModel, AttributesModel>>?
      get attributes;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {ServiceDefinitionAdditionalFields? additionalFields,
      String? id,
      String? tenantId,
      String? code,
      bool? isActive,
      bool? nonRecoverableError,
      int? rowVersion,
      List<AttributesModel>? attributes,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  ServiceDefinitionModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServiceDefinitionModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceDefinitionModel, $Out>
    implements
        ServiceDefinitionModelCopyWith<$R, ServiceDefinitionModel, $Out> {
  _ServiceDefinitionModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceDefinitionModel> $mapper =
      ServiceDefinitionModelMapper.ensureInitialized();
  @override
  ServiceDefinitionAdditionalFieldsCopyWith<$R,
          ServiceDefinitionAdditionalFields, ServiceDefinitionAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  ListCopyWith<$R, AttributesModel,
          AttributesModelCopyWith<$R, AttributesModel, AttributesModel>>?
      get attributes => $value.attributes != null
          ? ListCopyWith($value.attributes!, (v, t) => v.copyWith.$chain(t),
              (v) => call(attributes: v))
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
          Object? tenantId = $none,
          Object? code = $none,
          Object? isActive = $none,
          Object? nonRecoverableError = $none,
          Object? rowVersion = $none,
          Object? attributes = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (code != $none) #code: code,
        if (isActive != $none) #isActive: isActive,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (attributes != $none) #attributes: attributes,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  ServiceDefinitionModel $make(CopyWithData data) => ServiceDefinitionModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      code: data.get(#code, or: $value.code),
      isActive: data.get(#isActive, or: $value.isActive),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      attributes: data.get(#attributes, or: $value.attributes),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  ServiceDefinitionModelCopyWith<$R2, ServiceDefinitionModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ServiceDefinitionModelCopyWithImpl($value, $cast, t);
}

class ServiceDefinitionAdditionalFieldsMapper
    extends SubClassMapperBase<ServiceDefinitionAdditionalFields> {
  ServiceDefinitionAdditionalFieldsMapper._();

  static ServiceDefinitionAdditionalFieldsMapper? _instance;
  static ServiceDefinitionAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ServiceDefinitionAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceDefinitionAdditionalFields';

  static String _$schema(ServiceDefinitionAdditionalFields v) => v.schema;
  static const Field<ServiceDefinitionAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'ServiceDefinition');
  static int _$version(ServiceDefinitionAdditionalFields v) => v.version;
  static const Field<ServiceDefinitionAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(ServiceDefinitionAdditionalFields v) =>
      v.fields;
  static const Field<ServiceDefinitionAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<ServiceDefinitionAdditionalFields> fields = const {
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

  static ServiceDefinitionAdditionalFields _instantiate(DecodingData data) {
    return ServiceDefinitionAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceDefinitionAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<ServiceDefinitionAdditionalFields>(map);
  }

  static ServiceDefinitionAdditionalFields fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ServiceDefinitionAdditionalFields>(json);
  }
}

mixin ServiceDefinitionAdditionalFieldsMappable {
  String toJson() {
    return ServiceDefinitionAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<ServiceDefinitionAdditionalFields>(
            this as ServiceDefinitionAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return ServiceDefinitionAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<ServiceDefinitionAdditionalFields>(
            this as ServiceDefinitionAdditionalFields);
  }

  ServiceDefinitionAdditionalFieldsCopyWith<ServiceDefinitionAdditionalFields,
          ServiceDefinitionAdditionalFields, ServiceDefinitionAdditionalFields>
      get copyWith => _ServiceDefinitionAdditionalFieldsCopyWithImpl(
          this as ServiceDefinitionAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return ServiceDefinitionAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as ServiceDefinitionAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ServiceDefinitionAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(
                    this as ServiceDefinitionAdditionalFields, other));
  }

  @override
  int get hashCode {
    return ServiceDefinitionAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as ServiceDefinitionAdditionalFields);
  }
}

extension ServiceDefinitionAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceDefinitionAdditionalFields, $Out> {
  ServiceDefinitionAdditionalFieldsCopyWith<$R,
          ServiceDefinitionAdditionalFields, $Out>
      get $asServiceDefinitionAdditionalFields => $base.as((v, t, t2) =>
          _ServiceDefinitionAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class ServiceDefinitionAdditionalFieldsCopyWith<
    $R,
    $In extends ServiceDefinitionAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  ServiceDefinitionAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServiceDefinitionAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceDefinitionAdditionalFields, $Out>
    implements
        ServiceDefinitionAdditionalFieldsCopyWith<$R,
            ServiceDefinitionAdditionalFields, $Out> {
  _ServiceDefinitionAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceDefinitionAdditionalFields> $mapper =
      ServiceDefinitionAdditionalFieldsMapper.ensureInitialized();
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
  ServiceDefinitionAdditionalFields $make(CopyWithData data) =>
      ServiceDefinitionAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  ServiceDefinitionAdditionalFieldsCopyWith<$R2,
      ServiceDefinitionAdditionalFields, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServiceDefinitionAdditionalFieldsCopyWithImpl($value, $cast, t);
}

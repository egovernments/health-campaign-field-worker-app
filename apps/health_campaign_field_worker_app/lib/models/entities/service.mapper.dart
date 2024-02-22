// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'service.dart';

class ServiceSearchModelMapper extends SubClassMapperBase<ServiceSearchModel> {
  ServiceSearchModelMapper._();

  static ServiceSearchModelMapper? _instance;
  static ServiceSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServiceSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceSearchModel';

  static String? _$id(ServiceSearchModel v) => v.id;
  static const Field<ServiceSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$clientId(ServiceSearchModel v) => v.clientId;
  static const Field<ServiceSearchModel, String> _f$clientId =
      Field('clientId', _$clientId, opt: true);
  static String? _$serviceDefId(ServiceSearchModel v) => v.serviceDefId;
  static const Field<ServiceSearchModel, String> _f$serviceDefId =
      Field('serviceDefId', _$serviceDefId, opt: true);
  static String? _$accountId(ServiceSearchModel v) => v.accountId;
  static const Field<ServiceSearchModel, String> _f$accountId =
      Field('accountId', _$accountId, opt: true);
  static String? _$createdAt(ServiceSearchModel v) => v.createdAt;
  static const Field<ServiceSearchModel, String> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static String? _$tenantId(ServiceSearchModel v) => v.tenantId;
  static const Field<ServiceSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(ServiceSearchModel v) => v.boundaryCode;
  static const Field<ServiceSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(ServiceSearchModel v) => v.auditDetails;
  static const Field<ServiceSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(ServiceSearchModel v) =>
      v.additionalFields;
  static const Field<ServiceSearchModel, AdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<ServiceSearchModel> fields = const {
    #id: _f$id,
    #clientId: _f$clientId,
    #serviceDefId: _f$serviceDefId,
    #accountId: _f$accountId,
    #createdAt: _f$createdAt,
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

  static ServiceSearchModel _instantiate(DecodingData data) {
    return ServiceSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        clientId: data.dec(_f$clientId),
        serviceDefId: data.dec(_f$serviceDefId),
        accountId: data.dec(_f$accountId),
        createdAt: data.dec(_f$createdAt),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServiceSearchModel>(map);
  }

  static ServiceSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<ServiceSearchModel>(json);
  }
}

mixin ServiceSearchModelMappable {
  String toJson() {
    return ServiceSearchModelMapper.ensureInitialized()
        .encodeJson<ServiceSearchModel>(this as ServiceSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ServiceSearchModelMapper.ensureInitialized()
        .encodeMap<ServiceSearchModel>(this as ServiceSearchModel);
  }

  ServiceSearchModelCopyWith<ServiceSearchModel, ServiceSearchModel,
          ServiceSearchModel>
      get copyWith => _ServiceSearchModelCopyWithImpl(
          this as ServiceSearchModel, $identity, $identity);
  @override
  String toString() {
    return ServiceSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ServiceSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ServiceSearchModelMapper.ensureInitialized()
                .isValueEqual(this as ServiceSearchModel, other));
  }

  @override
  int get hashCode {
    return ServiceSearchModelMapper.ensureInitialized()
        .hashValue(this as ServiceSearchModel);
  }
}

extension ServiceSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceSearchModel, $Out> {
  ServiceSearchModelCopyWith<$R, ServiceSearchModel, $Out>
      get $asServiceSearchModel =>
          $base.as((v, t, t2) => _ServiceSearchModelCopyWithImpl(v, t, t2));
}

abstract class ServiceSearchModelCopyWith<$R, $In extends ServiceSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      String? clientId,
      String? serviceDefId,
      String? accountId,
      String? createdAt,
      String? tenantId,
      String? boundaryCode});
  ServiceSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServiceSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceSearchModel, $Out>
    implements ServiceSearchModelCopyWith<$R, ServiceSearchModel, $Out> {
  _ServiceSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceSearchModel> $mapper =
      ServiceSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? clientId = $none,
          Object? serviceDefId = $none,
          Object? accountId = $none,
          Object? createdAt = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (clientId != $none) #clientId: clientId,
        if (serviceDefId != $none) #serviceDefId: serviceDefId,
        if (accountId != $none) #accountId: accountId,
        if (createdAt != $none) #createdAt: createdAt,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  ServiceSearchModel $make(CopyWithData data) =>
      ServiceSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          clientId: data.get(#clientId, or: $value.clientId),
          serviceDefId: data.get(#serviceDefId, or: $value.serviceDefId),
          accountId: data.get(#accountId, or: $value.accountId),
          createdAt: data.get(#createdAt, or: $value.createdAt),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  ServiceSearchModelCopyWith<$R2, ServiceSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServiceSearchModelCopyWithImpl($value, $cast, t);
}

class ServiceModelMapper extends SubClassMapperBase<ServiceModel> {
  ServiceModelMapper._();

  static ServiceModelMapper? _instance;
  static ServiceModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServiceModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceModel';

  static ServiceAdditionalFields? _$additionalFields(ServiceModel v) =>
      v.additionalFields;
  static const Field<ServiceModel, ServiceAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(ServiceModel v) => v.id;
  static const Field<ServiceModel, String> _f$id = Field('id', _$id, opt: true);
  static String _$clientId(ServiceModel v) => v.clientId;
  static const Field<ServiceModel, String> _f$clientId =
      Field('clientId', _$clientId);
  static String? _$serviceDefId(ServiceModel v) => v.serviceDefId;
  static const Field<ServiceModel, String> _f$serviceDefId =
      Field('serviceDefId', _$serviceDefId, opt: true);
  static bool? _$isActive(ServiceModel v) => v.isActive;
  static const Field<ServiceModel, bool> _f$isActive =
      Field('isActive', _$isActive, opt: true);
  static String? _$accountId(ServiceModel v) => v.accountId;
  static const Field<ServiceModel, String> _f$accountId =
      Field('accountId', _$accountId, opt: true);
  static String? _$additionalDetails(ServiceModel v) => v.additionalDetails;
  static const Field<ServiceModel, String> _f$additionalDetails =
      Field('additionalDetails', _$additionalDetails, opt: true);
  static String? _$createdAt(ServiceModel v) => v.createdAt;
  static const Field<ServiceModel, String> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static bool? _$nonRecoverableError(ServiceModel v) => v.nonRecoverableError;
  static const Field<ServiceModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(ServiceModel v) => v.tenantId;
  static const Field<ServiceModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ServiceModel v) => v.rowVersion;
  static const Field<ServiceModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static List<ServiceAttributesModel>? _$attributes(ServiceModel v) =>
      v.attributes;
  static const Field<ServiceModel, List<ServiceAttributesModel>> _f$attributes =
      Field('attributes', _$attributes, opt: true);
  static AuditDetails? _$auditDetails(ServiceModel v) => v.auditDetails;
  static const Field<ServiceModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(ServiceModel v) =>
      v.clientAuditDetails;
  static const Field<ServiceModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(ServiceModel v) => v.isDeleted;
  static const Field<ServiceModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<ServiceModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #clientId: _f$clientId,
    #serviceDefId: _f$serviceDefId,
    #isActive: _f$isActive,
    #accountId: _f$accountId,
    #additionalDetails: _f$additionalDetails,
    #createdAt: _f$createdAt,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
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

  static ServiceModel _instantiate(DecodingData data) {
    return ServiceModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        clientId: data.dec(_f$clientId),
        serviceDefId: data.dec(_f$serviceDefId),
        isActive: data.dec(_f$isActive),
        accountId: data.dec(_f$accountId),
        additionalDetails: data.dec(_f$additionalDetails),
        createdAt: data.dec(_f$createdAt),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        attributes: data.dec(_f$attributes),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServiceModel>(map);
  }

  static ServiceModel fromJson(String json) {
    return ensureInitialized().decodeJson<ServiceModel>(json);
  }
}

mixin ServiceModelMappable {
  String toJson() {
    return ServiceModelMapper.ensureInitialized()
        .encodeJson<ServiceModel>(this as ServiceModel);
  }

  Map<String, dynamic> toMap() {
    return ServiceModelMapper.ensureInitialized()
        .encodeMap<ServiceModel>(this as ServiceModel);
  }

  ServiceModelCopyWith<ServiceModel, ServiceModel, ServiceModel> get copyWith =>
      _ServiceModelCopyWithImpl(this as ServiceModel, $identity, $identity);
  @override
  String toString() {
    return ServiceModelMapper.ensureInitialized()
        .stringifyValue(this as ServiceModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ServiceModelMapper.ensureInitialized()
                .isValueEqual(this as ServiceModel, other));
  }

  @override
  int get hashCode {
    return ServiceModelMapper.ensureInitialized()
        .hashValue(this as ServiceModel);
  }
}

extension ServiceModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceModel, $Out> {
  ServiceModelCopyWith<$R, ServiceModel, $Out> get $asServiceModel =>
      $base.as((v, t, t2) => _ServiceModelCopyWithImpl(v, t, t2));
}

abstract class ServiceModelCopyWith<$R, $In extends ServiceModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  ServiceAdditionalFieldsCopyWith<$R, ServiceAdditionalFields,
      ServiceAdditionalFields>? get additionalFields;
  ListCopyWith<
      $R,
      ServiceAttributesModel,
      ServiceAttributesModelCopyWith<$R, ServiceAttributesModel,
          ServiceAttributesModel>>? get attributes;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {ServiceAdditionalFields? additionalFields,
      String? id,
      String? clientId,
      String? serviceDefId,
      bool? isActive,
      String? accountId,
      String? additionalDetails,
      String? createdAt,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      List<ServiceAttributesModel>? attributes,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  ServiceModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ServiceModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceModel, $Out>
    implements ServiceModelCopyWith<$R, ServiceModel, $Out> {
  _ServiceModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceModel> $mapper =
      ServiceModelMapper.ensureInitialized();
  @override
  ServiceAdditionalFieldsCopyWith<$R, ServiceAdditionalFields,
          ServiceAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  ListCopyWith<
      $R,
      ServiceAttributesModel,
      ServiceAttributesModelCopyWith<$R, ServiceAttributesModel,
          ServiceAttributesModel>>? get attributes => $value.attributes != null
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
          String? clientId,
          Object? serviceDefId = $none,
          Object? isActive = $none,
          Object? accountId = $none,
          Object? additionalDetails = $none,
          Object? createdAt = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? attributes = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (clientId != null) #clientId: clientId,
        if (serviceDefId != $none) #serviceDefId: serviceDefId,
        if (isActive != $none) #isActive: isActive,
        if (accountId != $none) #accountId: accountId,
        if (additionalDetails != $none) #additionalDetails: additionalDetails,
        if (createdAt != $none) #createdAt: createdAt,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (attributes != $none) #attributes: attributes,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  ServiceModel $make(CopyWithData data) => ServiceModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      clientId: data.get(#clientId, or: $value.clientId),
      serviceDefId: data.get(#serviceDefId, or: $value.serviceDefId),
      isActive: data.get(#isActive, or: $value.isActive),
      accountId: data.get(#accountId, or: $value.accountId),
      additionalDetails:
          data.get(#additionalDetails, or: $value.additionalDetails),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      attributes: data.get(#attributes, or: $value.attributes),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  ServiceModelCopyWith<$R2, ServiceModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServiceModelCopyWithImpl($value, $cast, t);
}

class ServiceAdditionalFieldsMapper
    extends SubClassMapperBase<ServiceAdditionalFields> {
  ServiceAdditionalFieldsMapper._();

  static ServiceAdditionalFieldsMapper? _instance;
  static ServiceAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ServiceAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceAdditionalFields';

  static String _$schema(ServiceAdditionalFields v) => v.schema;
  static const Field<ServiceAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Service');
  static int _$version(ServiceAdditionalFields v) => v.version;
  static const Field<ServiceAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(ServiceAdditionalFields v) => v.fields;
  static const Field<ServiceAdditionalFields, List<AdditionalField>> _f$fields =
      Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<ServiceAdditionalFields> fields = const {
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

  static ServiceAdditionalFields _instantiate(DecodingData data) {
    return ServiceAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServiceAdditionalFields>(map);
  }

  static ServiceAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<ServiceAdditionalFields>(json);
  }
}

mixin ServiceAdditionalFieldsMappable {
  String toJson() {
    return ServiceAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<ServiceAdditionalFields>(this as ServiceAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return ServiceAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<ServiceAdditionalFields>(this as ServiceAdditionalFields);
  }

  ServiceAdditionalFieldsCopyWith<ServiceAdditionalFields,
          ServiceAdditionalFields, ServiceAdditionalFields>
      get copyWith => _ServiceAdditionalFieldsCopyWithImpl(
          this as ServiceAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return ServiceAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as ServiceAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ServiceAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as ServiceAdditionalFields, other));
  }

  @override
  int get hashCode {
    return ServiceAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as ServiceAdditionalFields);
  }
}

extension ServiceAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceAdditionalFields, $Out> {
  ServiceAdditionalFieldsCopyWith<$R, ServiceAdditionalFields, $Out>
      get $asServiceAdditionalFields => $base
          .as((v, t, t2) => _ServiceAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class ServiceAdditionalFieldsCopyWith<
    $R,
    $In extends ServiceAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  ServiceAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServiceAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceAdditionalFields, $Out>
    implements
        ServiceAdditionalFieldsCopyWith<$R, ServiceAdditionalFields, $Out> {
  _ServiceAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceAdditionalFields> $mapper =
      ServiceAdditionalFieldsMapper.ensureInitialized();
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
  ServiceAdditionalFields $make(CopyWithData data) => ServiceAdditionalFields(
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version),
      fields: data.get(#fields, or: $value.fields));

  @override
  ServiceAdditionalFieldsCopyWith<$R2, ServiceAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ServiceAdditionalFieldsCopyWithImpl($value, $cast, t);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'service_attributes.dart';

class ServiceAttributesSearchModelMapper
    extends SubClassMapperBase<ServiceAttributesSearchModel> {
  ServiceAttributesSearchModelMapper._();

  static ServiceAttributesSearchModelMapper? _instance;
  static ServiceAttributesSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ServiceAttributesSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceAttributesSearchModel';

  static List<String>? _$clientReferenceId(ServiceAttributesSearchModel v) =>
      v.clientReferenceId;
  static const Field<ServiceAttributesSearchModel, List<String>>
      _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$tenantId(ServiceAttributesSearchModel v) => v.tenantId;
  static const Field<ServiceAttributesSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(ServiceAttributesSearchModel v) =>
      v.boundaryCode;
  static const Field<ServiceAttributesSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(ServiceAttributesSearchModel v) =>
      v.auditDetails;
  static const Field<ServiceAttributesSearchModel, AuditDetails>
      _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(ServiceAttributesSearchModel v) =>
      v.additionalFields;
  static const Field<ServiceAttributesSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<ServiceAttributesSearchModel> fields = const {
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

  static ServiceAttributesSearchModel _instantiate(DecodingData data) {
    return ServiceAttributesSearchModel.ignoreDeleted(
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceAttributesSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServiceAttributesSearchModel>(map);
  }

  static ServiceAttributesSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<ServiceAttributesSearchModel>(json);
  }
}

mixin ServiceAttributesSearchModelMappable {
  String toJson() {
    return ServiceAttributesSearchModelMapper.ensureInitialized()
        .encodeJson<ServiceAttributesSearchModel>(
            this as ServiceAttributesSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ServiceAttributesSearchModelMapper.ensureInitialized()
        .encodeMap<ServiceAttributesSearchModel>(
            this as ServiceAttributesSearchModel);
  }

  ServiceAttributesSearchModelCopyWith<ServiceAttributesSearchModel,
          ServiceAttributesSearchModel, ServiceAttributesSearchModel>
      get copyWith => _ServiceAttributesSearchModelCopyWithImpl(
          this as ServiceAttributesSearchModel, $identity, $identity);
  @override
  String toString() {
    return ServiceAttributesSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ServiceAttributesSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ServiceAttributesSearchModelMapper.ensureInitialized()
                .isValueEqual(this as ServiceAttributesSearchModel, other));
  }

  @override
  int get hashCode {
    return ServiceAttributesSearchModelMapper.ensureInitialized()
        .hashValue(this as ServiceAttributesSearchModel);
  }
}

extension ServiceAttributesSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceAttributesSearchModel, $Out> {
  ServiceAttributesSearchModelCopyWith<$R, ServiceAttributesSearchModel, $Out>
      get $asServiceAttributesSearchModel => $base.as(
          (v, t, t2) => _ServiceAttributesSearchModelCopyWithImpl(v, t, t2));
}

abstract class ServiceAttributesSearchModelCopyWith<
    $R,
    $In extends ServiceAttributesSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  @override
  $R call(
      {List<String>? clientReferenceId,
      String? tenantId,
      String? boundaryCode});
  ServiceAttributesSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServiceAttributesSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceAttributesSearchModel, $Out>
    implements
        ServiceAttributesSearchModelCopyWith<$R, ServiceAttributesSearchModel,
            $Out> {
  _ServiceAttributesSearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceAttributesSearchModel> $mapper =
      ServiceAttributesSearchModelMapper.ensureInitialized();
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
  ServiceAttributesSearchModel $make(CopyWithData data) =>
      ServiceAttributesSearchModel.ignoreDeleted(
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  ServiceAttributesSearchModelCopyWith<$R2, ServiceAttributesSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ServiceAttributesSearchModelCopyWithImpl($value, $cast, t);
}

class ServiceAttributesModelMapper
    extends SubClassMapperBase<ServiceAttributesModel> {
  ServiceAttributesModelMapper._();

  static ServiceAttributesModelMapper? _instance;
  static ServiceAttributesModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServiceAttributesModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceAttributesModel';

  static ServiceAttributesAdditionalFields? _$additionalFields(
          ServiceAttributesModel v) =>
      v.additionalFields;
  static const Field<ServiceAttributesModel, ServiceAttributesAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$attributeCode(ServiceAttributesModel v) => v.attributeCode;
  static const Field<ServiceAttributesModel, String> _f$attributeCode =
      Field('attributeCode', _$attributeCode, opt: true);
  static dynamic _$value(ServiceAttributesModel v) => v.value;
  static const Field<ServiceAttributesModel, dynamic> _f$value =
      Field('value', _$value, opt: true);
  static String? _$dataType(ServiceAttributesModel v) => v.dataType;
  static const Field<ServiceAttributesModel, String> _f$dataType =
      Field('dataType', _$dataType, opt: true);
  static String? _$referenceId(ServiceAttributesModel v) => v.referenceId;
  static const Field<ServiceAttributesModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static dynamic _$additionalDetails(ServiceAttributesModel v) =>
      v.additionalDetails;
  static const Field<ServiceAttributesModel, dynamic> _f$additionalDetails =
      Field('additionalDetails', _$additionalDetails, opt: true);
  static bool? _$nonRecoverableError(ServiceAttributesModel v) =>
      v.nonRecoverableError;
  static const Field<ServiceAttributesModel, bool> _f$nonRecoverableError =
      Field('nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static String _$clientReferenceId(ServiceAttributesModel v) =>
      v.clientReferenceId;
  static const Field<ServiceAttributesModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$tenantId(ServiceAttributesModel v) => v.tenantId;
  static const Field<ServiceAttributesModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ServiceAttributesModel v) => v.rowVersion;
  static const Field<ServiceAttributesModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(ServiceAttributesModel v) =>
      v.auditDetails;
  static const Field<ServiceAttributesModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(ServiceAttributesModel v) =>
      v.clientAuditDetails;
  static const Field<ServiceAttributesModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(ServiceAttributesModel v) => v.isDeleted;
  static const Field<ServiceAttributesModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<ServiceAttributesModel> fields = const {
    #additionalFields: _f$additionalFields,
    #attributeCode: _f$attributeCode,
    #value: _f$value,
    #dataType: _f$dataType,
    #referenceId: _f$referenceId,
    #additionalDetails: _f$additionalDetails,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
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

  static ServiceAttributesModel _instantiate(DecodingData data) {
    return ServiceAttributesModel(
        additionalFields: data.dec(_f$additionalFields),
        attributeCode: data.dec(_f$attributeCode),
        value: data.dec(_f$value),
        dataType: data.dec(_f$dataType),
        referenceId: data.dec(_f$referenceId),
        additionalDetails: data.dec(_f$additionalDetails),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceAttributesModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServiceAttributesModel>(map);
  }

  static ServiceAttributesModel fromJson(String json) {
    return ensureInitialized().decodeJson<ServiceAttributesModel>(json);
  }
}

mixin ServiceAttributesModelMappable {
  String toJson() {
    return ServiceAttributesModelMapper.ensureInitialized()
        .encodeJson<ServiceAttributesModel>(this as ServiceAttributesModel);
  }

  Map<String, dynamic> toMap() {
    return ServiceAttributesModelMapper.ensureInitialized()
        .encodeMap<ServiceAttributesModel>(this as ServiceAttributesModel);
  }

  ServiceAttributesModelCopyWith<ServiceAttributesModel, ServiceAttributesModel,
          ServiceAttributesModel>
      get copyWith => _ServiceAttributesModelCopyWithImpl(
          this as ServiceAttributesModel, $identity, $identity);
  @override
  String toString() {
    return ServiceAttributesModelMapper.ensureInitialized()
        .stringifyValue(this as ServiceAttributesModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ServiceAttributesModelMapper.ensureInitialized()
                .isValueEqual(this as ServiceAttributesModel, other));
  }

  @override
  int get hashCode {
    return ServiceAttributesModelMapper.ensureInitialized()
        .hashValue(this as ServiceAttributesModel);
  }
}

extension ServiceAttributesModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceAttributesModel, $Out> {
  ServiceAttributesModelCopyWith<$R, ServiceAttributesModel, $Out>
      get $asServiceAttributesModel =>
          $base.as((v, t, t2) => _ServiceAttributesModelCopyWithImpl(v, t, t2));
}

abstract class ServiceAttributesModelCopyWith<
    $R,
    $In extends ServiceAttributesModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  ServiceAttributesAdditionalFieldsCopyWith<
      $R,
      ServiceAttributesAdditionalFields,
      ServiceAttributesAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {ServiceAttributesAdditionalFields? additionalFields,
      String? attributeCode,
      dynamic value,
      String? dataType,
      String? referenceId,
      dynamic additionalDetails,
      bool? nonRecoverableError,
      String? clientReferenceId,
      String? tenantId,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  ServiceAttributesModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServiceAttributesModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceAttributesModel, $Out>
    implements
        ServiceAttributesModelCopyWith<$R, ServiceAttributesModel, $Out> {
  _ServiceAttributesModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceAttributesModel> $mapper =
      ServiceAttributesModelMapper.ensureInitialized();
  @override
  ServiceAttributesAdditionalFieldsCopyWith<$R,
          ServiceAttributesAdditionalFields, ServiceAttributesAdditionalFields>?
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
          Object? attributeCode = $none,
          Object? value = $none,
          Object? dataType = $none,
          Object? referenceId = $none,
          Object? additionalDetails = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (attributeCode != $none) #attributeCode: attributeCode,
        if (value != $none) #value: value,
        if (dataType != $none) #dataType: dataType,
        if (referenceId != $none) #referenceId: referenceId,
        if (additionalDetails != $none) #additionalDetails: additionalDetails,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  ServiceAttributesModel $make(CopyWithData data) => ServiceAttributesModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      attributeCode: data.get(#attributeCode, or: $value.attributeCode),
      value: data.get(#value, or: $value.value),
      dataType: data.get(#dataType, or: $value.dataType),
      referenceId: data.get(#referenceId, or: $value.referenceId),
      additionalDetails:
          data.get(#additionalDetails, or: $value.additionalDetails),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  ServiceAttributesModelCopyWith<$R2, ServiceAttributesModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ServiceAttributesModelCopyWithImpl($value, $cast, t);
}

class ServiceAttributesAdditionalFieldsMapper
    extends SubClassMapperBase<ServiceAttributesAdditionalFields> {
  ServiceAttributesAdditionalFieldsMapper._();

  static ServiceAttributesAdditionalFieldsMapper? _instance;
  static ServiceAttributesAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ServiceAttributesAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServiceAttributesAdditionalFields';

  static String _$schema(ServiceAttributesAdditionalFields v) => v.schema;
  static const Field<ServiceAttributesAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'ServiceAttributes');
  static int _$version(ServiceAttributesAdditionalFields v) => v.version;
  static const Field<ServiceAttributesAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(ServiceAttributesAdditionalFields v) =>
      v.fields;
  static const Field<ServiceAttributesAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<ServiceAttributesAdditionalFields> fields = const {
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

  static ServiceAttributesAdditionalFields _instantiate(DecodingData data) {
    return ServiceAttributesAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static ServiceAttributesAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<ServiceAttributesAdditionalFields>(map);
  }

  static ServiceAttributesAdditionalFields fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ServiceAttributesAdditionalFields>(json);
  }
}

mixin ServiceAttributesAdditionalFieldsMappable {
  String toJson() {
    return ServiceAttributesAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<ServiceAttributesAdditionalFields>(
            this as ServiceAttributesAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return ServiceAttributesAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<ServiceAttributesAdditionalFields>(
            this as ServiceAttributesAdditionalFields);
  }

  ServiceAttributesAdditionalFieldsCopyWith<ServiceAttributesAdditionalFields,
          ServiceAttributesAdditionalFields, ServiceAttributesAdditionalFields>
      get copyWith => _ServiceAttributesAdditionalFieldsCopyWithImpl(
          this as ServiceAttributesAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return ServiceAttributesAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as ServiceAttributesAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ServiceAttributesAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(
                    this as ServiceAttributesAdditionalFields, other));
  }

  @override
  int get hashCode {
    return ServiceAttributesAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as ServiceAttributesAdditionalFields);
  }
}

extension ServiceAttributesAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServiceAttributesAdditionalFields, $Out> {
  ServiceAttributesAdditionalFieldsCopyWith<$R,
          ServiceAttributesAdditionalFields, $Out>
      get $asServiceAttributesAdditionalFields => $base.as((v, t, t2) =>
          _ServiceAttributesAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class ServiceAttributesAdditionalFieldsCopyWith<
    $R,
    $In extends ServiceAttributesAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  ServiceAttributesAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServiceAttributesAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServiceAttributesAdditionalFields, $Out>
    implements
        ServiceAttributesAdditionalFieldsCopyWith<$R,
            ServiceAttributesAdditionalFields, $Out> {
  _ServiceAttributesAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServiceAttributesAdditionalFields> $mapper =
      ServiceAttributesAdditionalFieldsMapper.ensureInitialized();
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
  ServiceAttributesAdditionalFields $make(CopyWithData data) =>
      ServiceAttributesAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  ServiceAttributesAdditionalFieldsCopyWith<$R2,
      ServiceAttributesAdditionalFields, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServiceAttributesAdditionalFieldsCopyWithImpl($value, $cast, t);
}

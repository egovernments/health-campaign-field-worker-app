// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'identifier.dart';

class IdentifierSearchModelMapper
    extends SubClassMapperBase<IdentifierSearchModel> {
  IdentifierSearchModelMapper._();

  static IdentifierSearchModelMapper? _instance;
  static IdentifierSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IdentifierSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'IdentifierSearchModel';

  static String? _$id(IdentifierSearchModel v) => v.id;
  static const Field<IdentifierSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$identifierType(IdentifierSearchModel v) => v.identifierType;
  static const Field<IdentifierSearchModel, String> _f$identifierType =
      Field('identifierType', _$identifierType, opt: true);
  static String? _$identifierId(IdentifierSearchModel v) => v.identifierId;
  static const Field<IdentifierSearchModel, String> _f$identifierId =
      Field('identifierId', _$identifierId, opt: true);
  static List<String>? _$clientReferenceId(IdentifierSearchModel v) =>
      v.clientReferenceId;
  static const Field<IdentifierSearchModel, List<String>> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$tenantId(IdentifierSearchModel v) => v.tenantId;
  static const Field<IdentifierSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(IdentifierSearchModel v) => v.boundaryCode;
  static const Field<IdentifierSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(IdentifierSearchModel v) =>
      v.auditDetails;
  static const Field<IdentifierSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(IdentifierSearchModel v) =>
      v.additionalFields;
  static const Field<IdentifierSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<IdentifierSearchModel> fields = const {
    #id: _f$id,
    #identifierType: _f$identifierType,
    #identifierId: _f$identifierId,
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

  static IdentifierSearchModel _instantiate(DecodingData data) {
    return IdentifierSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        identifierType: data.dec(_f$identifierType),
        identifierId: data.dec(_f$identifierId),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static IdentifierSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IdentifierSearchModel>(map);
  }

  static IdentifierSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<IdentifierSearchModel>(json);
  }
}

mixin IdentifierSearchModelMappable {
  String toJson() {
    return IdentifierSearchModelMapper.ensureInitialized()
        .encodeJson<IdentifierSearchModel>(this as IdentifierSearchModel);
  }

  Map<String, dynamic> toMap() {
    return IdentifierSearchModelMapper.ensureInitialized()
        .encodeMap<IdentifierSearchModel>(this as IdentifierSearchModel);
  }

  IdentifierSearchModelCopyWith<IdentifierSearchModel, IdentifierSearchModel,
          IdentifierSearchModel>
      get copyWith => _IdentifierSearchModelCopyWithImpl(
          this as IdentifierSearchModel, $identity, $identity);
  @override
  String toString() {
    return IdentifierSearchModelMapper.ensureInitialized()
        .stringifyValue(this as IdentifierSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return IdentifierSearchModelMapper.ensureInitialized()
        .equalsValue(this as IdentifierSearchModel, other);
  }

  @override
  int get hashCode {
    return IdentifierSearchModelMapper.ensureInitialized()
        .hashValue(this as IdentifierSearchModel);
  }
}

extension IdentifierSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IdentifierSearchModel, $Out> {
  IdentifierSearchModelCopyWith<$R, IdentifierSearchModel, $Out>
      get $asIdentifierSearchModel =>
          $base.as((v, t, t2) => _IdentifierSearchModelCopyWithImpl(v, t, t2));
}

abstract class IdentifierSearchModelCopyWith<
    $R,
    $In extends IdentifierSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  @override
  $R call(
      {String? id,
      String? identifierType,
      String? identifierId,
      List<String>? clientReferenceId,
      String? tenantId,
      String? boundaryCode});
  IdentifierSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IdentifierSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IdentifierSearchModel, $Out>
    implements IdentifierSearchModelCopyWith<$R, IdentifierSearchModel, $Out> {
  _IdentifierSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IdentifierSearchModel> $mapper =
      IdentifierSearchModelMapper.ensureInitialized();
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
          Object? identifierType = $none,
          Object? identifierId = $none,
          Object? clientReferenceId = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (identifierType != $none) #identifierType: identifierType,
        if (identifierId != $none) #identifierId: identifierId,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  IdentifierSearchModel $make(CopyWithData data) =>
      IdentifierSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          identifierType: data.get(#identifierType, or: $value.identifierType),
          identifierId: data.get(#identifierId, or: $value.identifierId),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  IdentifierSearchModelCopyWith<$R2, IdentifierSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _IdentifierSearchModelCopyWithImpl($value, $cast, t);
}

class IdentifierModelMapper extends SubClassMapperBase<IdentifierModel> {
  IdentifierModelMapper._();

  static IdentifierModelMapper? _instance;
  static IdentifierModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IdentifierModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'IdentifierModel';

  static IdentifierAdditionalFields? _$additionalFields(IdentifierModel v) =>
      v.additionalFields;
  static const Field<IdentifierModel, IdentifierAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(IdentifierModel v) => v.id;
  static const Field<IdentifierModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$identifierType(IdentifierModel v) => v.identifierType;
  static const Field<IdentifierModel, String> _f$identifierType =
      Field('identifierType', _$identifierType, opt: true);
  static String? _$identifierId(IdentifierModel v) => v.identifierId;
  static const Field<IdentifierModel, String> _f$identifierId =
      Field('identifierId', _$identifierId, opt: true);
  static bool? _$nonRecoverableError(IdentifierModel v) =>
      v.nonRecoverableError;
  static const Field<IdentifierModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String _$clientReferenceId(IdentifierModel v) => v.clientReferenceId;
  static const Field<IdentifierModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$tenantId(IdentifierModel v) => v.tenantId;
  static const Field<IdentifierModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(IdentifierModel v) => v.rowVersion;
  static const Field<IdentifierModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(IdentifierModel v) => v.auditDetails;
  static const Field<IdentifierModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(IdentifierModel v) =>
      v.clientAuditDetails;
  static const Field<IdentifierModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(IdentifierModel v) => v.isDeleted;
  static const Field<IdentifierModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<IdentifierModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #identifierType: _f$identifierType,
    #identifierId: _f$identifierId,
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

  static IdentifierModel _instantiate(DecodingData data) {
    return IdentifierModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        identifierType: data.dec(_f$identifierType),
        identifierId: data.dec(_f$identifierId),
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

  static IdentifierModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IdentifierModel>(map);
  }

  static IdentifierModel fromJson(String json) {
    return ensureInitialized().decodeJson<IdentifierModel>(json);
  }
}

mixin IdentifierModelMappable {
  String toJson() {
    return IdentifierModelMapper.ensureInitialized()
        .encodeJson<IdentifierModel>(this as IdentifierModel);
  }

  Map<String, dynamic> toMap() {
    return IdentifierModelMapper.ensureInitialized()
        .encodeMap<IdentifierModel>(this as IdentifierModel);
  }

  IdentifierModelCopyWith<IdentifierModel, IdentifierModel, IdentifierModel>
      get copyWith => _IdentifierModelCopyWithImpl(
          this as IdentifierModel, $identity, $identity);
  @override
  String toString() {
    return IdentifierModelMapper.ensureInitialized()
        .stringifyValue(this as IdentifierModel);
  }

  @override
  bool operator ==(Object other) {
    return IdentifierModelMapper.ensureInitialized()
        .equalsValue(this as IdentifierModel, other);
  }

  @override
  int get hashCode {
    return IdentifierModelMapper.ensureInitialized()
        .hashValue(this as IdentifierModel);
  }
}

extension IdentifierModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IdentifierModel, $Out> {
  IdentifierModelCopyWith<$R, IdentifierModel, $Out> get $asIdentifierModel =>
      $base.as((v, t, t2) => _IdentifierModelCopyWithImpl(v, t, t2));
}

abstract class IdentifierModelCopyWith<$R, $In extends IdentifierModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  IdentifierAdditionalFieldsCopyWith<$R, IdentifierAdditionalFields,
      IdentifierAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {IdentifierAdditionalFields? additionalFields,
      String? id,
      String? identifierType,
      String? identifierId,
      bool? nonRecoverableError,
      String? clientReferenceId,
      String? tenantId,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  IdentifierModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IdentifierModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IdentifierModel, $Out>
    implements IdentifierModelCopyWith<$R, IdentifierModel, $Out> {
  _IdentifierModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IdentifierModel> $mapper =
      IdentifierModelMapper.ensureInitialized();
  @override
  IdentifierAdditionalFieldsCopyWith<$R, IdentifierAdditionalFields,
          IdentifierAdditionalFields>?
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
          Object? identifierType = $none,
          Object? identifierId = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (identifierType != $none) #identifierType: identifierType,
        if (identifierId != $none) #identifierId: identifierId,
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
  IdentifierModel $make(CopyWithData data) => IdentifierModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      identifierType: data.get(#identifierType, or: $value.identifierType),
      identifierId: data.get(#identifierId, or: $value.identifierId),
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
  IdentifierModelCopyWith<$R2, IdentifierModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IdentifierModelCopyWithImpl($value, $cast, t);
}

class IdentifierAdditionalFieldsMapper
    extends SubClassMapperBase<IdentifierAdditionalFields> {
  IdentifierAdditionalFieldsMapper._();

  static IdentifierAdditionalFieldsMapper? _instance;
  static IdentifierAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = IdentifierAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'IdentifierAdditionalFields';

  static String _$schema(IdentifierAdditionalFields v) => v.schema;
  static const Field<IdentifierAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Identifier');
  static int _$version(IdentifierAdditionalFields v) => v.version;
  static const Field<IdentifierAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(IdentifierAdditionalFields v) =>
      v.fields;
  static const Field<IdentifierAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<IdentifierAdditionalFields> fields = const {
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

  static IdentifierAdditionalFields _instantiate(DecodingData data) {
    return IdentifierAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static IdentifierAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IdentifierAdditionalFields>(map);
  }

  static IdentifierAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<IdentifierAdditionalFields>(json);
  }
}

mixin IdentifierAdditionalFieldsMappable {
  String toJson() {
    return IdentifierAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<IdentifierAdditionalFields>(
            this as IdentifierAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return IdentifierAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<IdentifierAdditionalFields>(
            this as IdentifierAdditionalFields);
  }

  IdentifierAdditionalFieldsCopyWith<IdentifierAdditionalFields,
          IdentifierAdditionalFields, IdentifierAdditionalFields>
      get copyWith => _IdentifierAdditionalFieldsCopyWithImpl(
          this as IdentifierAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return IdentifierAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as IdentifierAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return IdentifierAdditionalFieldsMapper.ensureInitialized()
        .equalsValue(this as IdentifierAdditionalFields, other);
  }

  @override
  int get hashCode {
    return IdentifierAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as IdentifierAdditionalFields);
  }
}

extension IdentifierAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IdentifierAdditionalFields, $Out> {
  IdentifierAdditionalFieldsCopyWith<$R, IdentifierAdditionalFields, $Out>
      get $asIdentifierAdditionalFields => $base
          .as((v, t, t2) => _IdentifierAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class IdentifierAdditionalFieldsCopyWith<
    $R,
    $In extends IdentifierAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  IdentifierAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IdentifierAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IdentifierAdditionalFields, $Out>
    implements
        IdentifierAdditionalFieldsCopyWith<$R, IdentifierAdditionalFields,
            $Out> {
  _IdentifierAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IdentifierAdditionalFields> $mapper =
      IdentifierAdditionalFieldsMapper.ensureInitialized();
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
  IdentifierAdditionalFields $make(CopyWithData data) =>
      IdentifierAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  IdentifierAdditionalFieldsCopyWith<$R2, IdentifierAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _IdentifierAdditionalFieldsCopyWithImpl($value, $cast, t);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'name.dart';

class NameSearchModelMapper extends SubClassMapperBase<NameSearchModel> {
  NameSearchModelMapper._();

  static NameSearchModelMapper? _instance;
  static NameSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NameSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NameSearchModel';

  static String? _$id(NameSearchModel v) => v.id;
  static const Field<NameSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static int? _$offset(NameSearchModel v) => v.offset;
  static const Field<NameSearchModel, int> _f$offset =
      Field('offset', _$offset, opt: true);
  static int? _$limit(NameSearchModel v) => v.limit;
  static const Field<NameSearchModel, int> _f$limit =
      Field('limit', _$limit, opt: true);
  static String? _$givenName(NameSearchModel v) => v.givenName;
  static const Field<NameSearchModel, String> _f$givenName =
      Field('givenName', _$givenName, opt: true);
  static String? _$familyName(NameSearchModel v) => v.familyName;
  static const Field<NameSearchModel, String> _f$familyName =
      Field('familyName', _$familyName, opt: true);
  static String? _$otherNames(NameSearchModel v) => v.otherNames;
  static const Field<NameSearchModel, String> _f$otherNames =
      Field('otherNames', _$otherNames, opt: true);
  static String? _$tenantId(NameSearchModel v) => v.tenantId;
  static const Field<NameSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(NameSearchModel v) => v.boundaryCode;
  static const Field<NameSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(NameSearchModel v) => v.auditDetails;
  static const Field<NameSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(NameSearchModel v) =>
      v.additionalFields;
  static const Field<NameSearchModel, AdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<NameSearchModel> fields = const {
    #id: _f$id,
    #offset: _f$offset,
    #limit: _f$limit,
    #givenName: _f$givenName,
    #familyName: _f$familyName,
    #otherNames: _f$otherNames,
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

  static NameSearchModel _instantiate(DecodingData data) {
    return NameSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        offset: data.dec(_f$offset),
        limit: data.dec(_f$limit),
        givenName: data.dec(_f$givenName),
        familyName: data.dec(_f$familyName),
        otherNames: data.dec(_f$otherNames),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static NameSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NameSearchModel>(map);
  }

  static NameSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<NameSearchModel>(json);
  }
}

mixin NameSearchModelMappable {
  String toJson() {
    return NameSearchModelMapper.ensureInitialized()
        .encodeJson<NameSearchModel>(this as NameSearchModel);
  }

  Map<String, dynamic> toMap() {
    return NameSearchModelMapper.ensureInitialized()
        .encodeMap<NameSearchModel>(this as NameSearchModel);
  }

  NameSearchModelCopyWith<NameSearchModel, NameSearchModel, NameSearchModel>
      get copyWith => _NameSearchModelCopyWithImpl(
          this as NameSearchModel, $identity, $identity);
  @override
  String toString() {
    return NameSearchModelMapper.ensureInitialized()
        .stringifyValue(this as NameSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return NameSearchModelMapper.ensureInitialized()
        .equalsValue(this as NameSearchModel, other);
  }

  @override
  int get hashCode {
    return NameSearchModelMapper.ensureInitialized()
        .hashValue(this as NameSearchModel);
  }
}

extension NameSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NameSearchModel, $Out> {
  NameSearchModelCopyWith<$R, NameSearchModel, $Out> get $asNameSearchModel =>
      $base.as((v, t, t2) => _NameSearchModelCopyWithImpl(v, t, t2));
}

abstract class NameSearchModelCopyWith<$R, $In extends NameSearchModel, $Out>
    implements EntitySearchModelCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      int? offset,
      int? limit,
      String? givenName,
      String? familyName,
      String? otherNames,
      String? tenantId,
      String? boundaryCode});
  NameSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NameSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NameSearchModel, $Out>
    implements NameSearchModelCopyWith<$R, NameSearchModel, $Out> {
  _NameSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NameSearchModel> $mapper =
      NameSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? offset = $none,
          Object? limit = $none,
          Object? givenName = $none,
          Object? familyName = $none,
          Object? otherNames = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (offset != $none) #offset: offset,
        if (limit != $none) #limit: limit,
        if (givenName != $none) #givenName: givenName,
        if (familyName != $none) #familyName: familyName,
        if (otherNames != $none) #otherNames: otherNames,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  NameSearchModel $make(CopyWithData data) => NameSearchModel.ignoreDeleted(
      id: data.get(#id, or: $value.id),
      offset: data.get(#offset, or: $value.offset),
      limit: data.get(#limit, or: $value.limit),
      givenName: data.get(#givenName, or: $value.givenName),
      familyName: data.get(#familyName, or: $value.familyName),
      otherNames: data.get(#otherNames, or: $value.otherNames),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  NameSearchModelCopyWith<$R2, NameSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NameSearchModelCopyWithImpl($value, $cast, t);
}

class NameModelMapper extends SubClassMapperBase<NameModel> {
  NameModelMapper._();

  static NameModelMapper? _instance;
  static NameModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NameModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NameModel';

  static NameAdditionalFields? _$additionalFields(NameModel v) =>
      v.additionalFields;
  static const Field<NameModel, NameAdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(NameModel v) => v.id;
  static const Field<NameModel, String> _f$id = Field('id', _$id, opt: true);
  static String? _$individualClientReferenceId(NameModel v) =>
      v.individualClientReferenceId;
  static const Field<NameModel, String> _f$individualClientReferenceId = Field(
      'individualClientReferenceId', _$individualClientReferenceId,
      opt: true);
  static String? _$givenName(NameModel v) => v.givenName;
  static const Field<NameModel, String> _f$givenName =
      Field('givenName', _$givenName, opt: true);
  static String? _$familyName(NameModel v) => v.familyName;
  static const Field<NameModel, String> _f$familyName =
      Field('familyName', _$familyName, opt: true);
  static String? _$otherNames(NameModel v) => v.otherNames;
  static const Field<NameModel, String> _f$otherNames =
      Field('otherNames', _$otherNames, opt: true);
  static bool? _$nonRecoverableError(NameModel v) => v.nonRecoverableError;
  static const Field<NameModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(NameModel v) => v.tenantId;
  static const Field<NameModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(NameModel v) => v.rowVersion;
  static const Field<NameModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(NameModel v) => v.auditDetails;
  static const Field<NameModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(NameModel v) =>
      v.clientAuditDetails;
  static const Field<NameModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(NameModel v) => v.isDeleted;
  static const Field<NameModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<NameModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #individualClientReferenceId: _f$individualClientReferenceId,
    #givenName: _f$givenName,
    #familyName: _f$familyName,
    #otherNames: _f$otherNames,
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

  static NameModel _instantiate(DecodingData data) {
    return NameModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        individualClientReferenceId: data.dec(_f$individualClientReferenceId),
        givenName: data.dec(_f$givenName),
        familyName: data.dec(_f$familyName),
        otherNames: data.dec(_f$otherNames),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static NameModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NameModel>(map);
  }

  static NameModel fromJson(String json) {
    return ensureInitialized().decodeJson<NameModel>(json);
  }
}

mixin NameModelMappable {
  String toJson() {
    return NameModelMapper.ensureInitialized()
        .encodeJson<NameModel>(this as NameModel);
  }

  Map<String, dynamic> toMap() {
    return NameModelMapper.ensureInitialized()
        .encodeMap<NameModel>(this as NameModel);
  }

  NameModelCopyWith<NameModel, NameModel, NameModel> get copyWith =>
      _NameModelCopyWithImpl(this as NameModel, $identity, $identity);
  @override
  String toString() {
    return NameModelMapper.ensureInitialized()
        .stringifyValue(this as NameModel);
  }

  @override
  bool operator ==(Object other) {
    return NameModelMapper.ensureInitialized()
        .equalsValue(this as NameModel, other);
  }

  @override
  int get hashCode {
    return NameModelMapper.ensureInitialized().hashValue(this as NameModel);
  }
}

extension NameModelValueCopy<$R, $Out> on ObjectCopyWith<$R, NameModel, $Out> {
  NameModelCopyWith<$R, NameModel, $Out> get $asNameModel =>
      $base.as((v, t, t2) => _NameModelCopyWithImpl(v, t, t2));
}

abstract class NameModelCopyWith<$R, $In extends NameModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  NameAdditionalFieldsCopyWith<$R, NameAdditionalFields, NameAdditionalFields>?
      get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {NameAdditionalFields? additionalFields,
      String? id,
      String? individualClientReferenceId,
      String? givenName,
      String? familyName,
      String? otherNames,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  NameModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NameModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NameModel, $Out>
    implements NameModelCopyWith<$R, NameModel, $Out> {
  _NameModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NameModel> $mapper =
      NameModelMapper.ensureInitialized();
  @override
  NameAdditionalFieldsCopyWith<$R, NameAdditionalFields, NameAdditionalFields>?
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
          Object? individualClientReferenceId = $none,
          Object? givenName = $none,
          Object? familyName = $none,
          Object? otherNames = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (individualClientReferenceId != $none)
          #individualClientReferenceId: individualClientReferenceId,
        if (givenName != $none) #givenName: givenName,
        if (familyName != $none) #familyName: familyName,
        if (otherNames != $none) #otherNames: otherNames,
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
  NameModel $make(CopyWithData data) => NameModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      individualClientReferenceId: data.get(#individualClientReferenceId,
          or: $value.individualClientReferenceId),
      givenName: data.get(#givenName, or: $value.givenName),
      familyName: data.get(#familyName, or: $value.familyName),
      otherNames: data.get(#otherNames, or: $value.otherNames),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  NameModelCopyWith<$R2, NameModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NameModelCopyWithImpl($value, $cast, t);
}

class NameAdditionalFieldsMapper
    extends SubClassMapperBase<NameAdditionalFields> {
  NameAdditionalFieldsMapper._();

  static NameAdditionalFieldsMapper? _instance;
  static NameAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NameAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NameAdditionalFields';

  static String _$schema(NameAdditionalFields v) => v.schema;
  static const Field<NameAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Name');
  static int _$version(NameAdditionalFields v) => v.version;
  static const Field<NameAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(NameAdditionalFields v) => v.fields;
  static const Field<NameAdditionalFields, List<AdditionalField>> _f$fields =
      Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<NameAdditionalFields> fields = const {
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

  static NameAdditionalFields _instantiate(DecodingData data) {
    return NameAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static NameAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NameAdditionalFields>(map);
  }

  static NameAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<NameAdditionalFields>(json);
  }
}

mixin NameAdditionalFieldsMappable {
  String toJson() {
    return NameAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<NameAdditionalFields>(this as NameAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return NameAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<NameAdditionalFields>(this as NameAdditionalFields);
  }

  NameAdditionalFieldsCopyWith<NameAdditionalFields, NameAdditionalFields,
          NameAdditionalFields>
      get copyWith => _NameAdditionalFieldsCopyWithImpl(
          this as NameAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return NameAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as NameAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return NameAdditionalFieldsMapper.ensureInitialized()
        .equalsValue(this as NameAdditionalFields, other);
  }

  @override
  int get hashCode {
    return NameAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as NameAdditionalFields);
  }
}

extension NameAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NameAdditionalFields, $Out> {
  NameAdditionalFieldsCopyWith<$R, NameAdditionalFields, $Out>
      get $asNameAdditionalFields =>
          $base.as((v, t, t2) => _NameAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class NameAdditionalFieldsCopyWith<
    $R,
    $In extends NameAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  NameAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NameAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NameAdditionalFields, $Out>
    implements NameAdditionalFieldsCopyWith<$R, NameAdditionalFields, $Out> {
  _NameAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NameAdditionalFields> $mapper =
      NameAdditionalFieldsMapper.ensureInitialized();
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
  NameAdditionalFields $make(CopyWithData data) => NameAdditionalFields(
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version),
      fields: data.get(#fields, or: $value.fields));

  @override
  NameAdditionalFieldsCopyWith<$R2, NameAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _NameAdditionalFieldsCopyWithImpl($value, $cast, t);
}

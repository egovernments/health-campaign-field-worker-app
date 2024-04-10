// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'facility.dart';

class FacilitySearchModelMapper
    extends SubClassMapperBase<FacilitySearchModel> {
  FacilitySearchModelMapper._();

  static FacilitySearchModelMapper? _instance;
  static FacilitySearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FacilitySearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FacilitySearchModel';

  static List<String>? _$id(FacilitySearchModel v) => v.id;
  static const Field<FacilitySearchModel, List<String>> _f$id =
      Field('id', _$id, opt: true);
  static String? _$name(FacilitySearchModel v) => v.name;
  static const Field<FacilitySearchModel, String> _f$name =
      Field('name', _$name, opt: true);
  static bool? _$isPermanent(FacilitySearchModel v) => v.isPermanent;
  static const Field<FacilitySearchModel, bool> _f$isPermanent =
      Field('isPermanent', _$isPermanent, opt: true);
  static String? _$usage(FacilitySearchModel v) => v.usage;
  static const Field<FacilitySearchModel, String> _f$usage =
      Field('usage', _$usage, opt: true);
  static int? _$storageCapacity(FacilitySearchModel v) => v.storageCapacity;
  static const Field<FacilitySearchModel, int> _f$storageCapacity =
      Field('storageCapacity', _$storageCapacity, opt: true);
  static String? _$tenantId(FacilitySearchModel v) => v.tenantId;
  static const Field<FacilitySearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(FacilitySearchModel v) => v.boundaryCode;
  static const Field<FacilitySearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(FacilitySearchModel v) => v.auditDetails;
  static const Field<FacilitySearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(FacilitySearchModel v) =>
      v.additionalFields;
  static const Field<FacilitySearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<FacilitySearchModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #isPermanent: _f$isPermanent,
    #usage: _f$usage,
    #storageCapacity: _f$storageCapacity,
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

  static FacilitySearchModel _instantiate(DecodingData data) {
    return FacilitySearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        isPermanent: data.dec(_f$isPermanent),
        usage: data.dec(_f$usage),
        storageCapacity: data.dec(_f$storageCapacity),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static FacilitySearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FacilitySearchModel>(map);
  }

  static FacilitySearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<FacilitySearchModel>(json);
  }
}

mixin FacilitySearchModelMappable {
  String toJson() {
    return FacilitySearchModelMapper.ensureInitialized()
        .encodeJson<FacilitySearchModel>(this as FacilitySearchModel);
  }

  Map<String, dynamic> toMap() {
    return FacilitySearchModelMapper.ensureInitialized()
        .encodeMap<FacilitySearchModel>(this as FacilitySearchModel);
  }

  FacilitySearchModelCopyWith<FacilitySearchModel, FacilitySearchModel,
          FacilitySearchModel>
      get copyWith => _FacilitySearchModelCopyWithImpl(
          this as FacilitySearchModel, $identity, $identity);
  @override
  String toString() {
    return FacilitySearchModelMapper.ensureInitialized()
        .stringifyValue(this as FacilitySearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FacilitySearchModelMapper.ensureInitialized()
                .isValueEqual(this as FacilitySearchModel, other));
  }

  @override
  int get hashCode {
    return FacilitySearchModelMapper.ensureInitialized()
        .hashValue(this as FacilitySearchModel);
  }
}

extension FacilitySearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FacilitySearchModel, $Out> {
  FacilitySearchModelCopyWith<$R, FacilitySearchModel, $Out>
      get $asFacilitySearchModel =>
          $base.as((v, t, t2) => _FacilitySearchModelCopyWithImpl(v, t, t2));
}

abstract class FacilitySearchModelCopyWith<$R, $In extends FacilitySearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id;
  @override
  $R call(
      {List<String>? id,
      String? name,
      bool? isPermanent,
      String? usage,
      int? storageCapacity,
      String? tenantId,
      String? boundaryCode});
  FacilitySearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FacilitySearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FacilitySearchModel, $Out>
    implements FacilitySearchModelCopyWith<$R, FacilitySearchModel, $Out> {
  _FacilitySearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FacilitySearchModel> $mapper =
      FacilitySearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id =>
      $value.id != null
          ? ListCopyWith($value.id!, (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(id: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? name = $none,
          Object? isPermanent = $none,
          Object? usage = $none,
          Object? storageCapacity = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != $none) #name: name,
        if (isPermanent != $none) #isPermanent: isPermanent,
        if (usage != $none) #usage: usage,
        if (storageCapacity != $none) #storageCapacity: storageCapacity,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  FacilitySearchModel $make(CopyWithData data) =>
      FacilitySearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          name: data.get(#name, or: $value.name),
          isPermanent: data.get(#isPermanent, or: $value.isPermanent),
          usage: data.get(#usage, or: $value.usage),
          storageCapacity:
              data.get(#storageCapacity, or: $value.storageCapacity),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  FacilitySearchModelCopyWith<$R2, FacilitySearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _FacilitySearchModelCopyWithImpl($value, $cast, t);
}

class FacilityModelMapper extends SubClassMapperBase<FacilityModel> {
  FacilityModelMapper._();

  static FacilityModelMapper? _instance;
  static FacilityModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FacilityModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FacilityModel';

  static FacilityAdditionalFields? _$additionalFields(FacilityModel v) =>
      v.additionalFields;
  static const Field<FacilityModel, FacilityAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String _$id(FacilityModel v) => v.id;
  static const Field<FacilityModel, String> _f$id = Field('id', _$id);
  static String? _$name(FacilityModel v) => v.name;
  static const Field<FacilityModel, String> _f$name =
      Field('name', _$name, opt: true);
  static bool? _$isPermanent(FacilityModel v) => v.isPermanent;
  static const Field<FacilityModel, bool> _f$isPermanent =
      Field('isPermanent', _$isPermanent, opt: true);
  static String? _$usage(FacilityModel v) => v.usage;
  static const Field<FacilityModel, String> _f$usage =
      Field('usage', _$usage, opt: true);
  static int? _$storageCapacity(FacilityModel v) => v.storageCapacity;
  static const Field<FacilityModel, int> _f$storageCapacity =
      Field('storageCapacity', _$storageCapacity, opt: true);
  static bool? _$nonRecoverableError(FacilityModel v) => v.nonRecoverableError;
  static const Field<FacilityModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(FacilityModel v) => v.tenantId;
  static const Field<FacilityModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(FacilityModel v) => v.rowVersion;
  static const Field<FacilityModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AddressModel? _$address(FacilityModel v) => v.address;
  static const Field<FacilityModel, AddressModel> _f$address =
      Field('address', _$address, opt: true);
  static AuditDetails? _$auditDetails(FacilityModel v) => v.auditDetails;
  static const Field<FacilityModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(FacilityModel v) =>
      v.clientAuditDetails;
  static const Field<FacilityModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(FacilityModel v) => v.isDeleted;
  static const Field<FacilityModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<FacilityModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #name: _f$name,
    #isPermanent: _f$isPermanent,
    #usage: _f$usage,
    #storageCapacity: _f$storageCapacity,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #address: _f$address,
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

  static FacilityModel _instantiate(DecodingData data) {
    return FacilityModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        isPermanent: data.dec(_f$isPermanent),
        usage: data.dec(_f$usage),
        storageCapacity: data.dec(_f$storageCapacity),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        address: data.dec(_f$address),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static FacilityModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FacilityModel>(map);
  }

  static FacilityModel fromJson(String json) {
    return ensureInitialized().decodeJson<FacilityModel>(json);
  }
}

mixin FacilityModelMappable {
  String toJson() {
    return FacilityModelMapper.ensureInitialized()
        .encodeJson<FacilityModel>(this as FacilityModel);
  }

  Map<String, dynamic> toMap() {
    return FacilityModelMapper.ensureInitialized()
        .encodeMap<FacilityModel>(this as FacilityModel);
  }

  FacilityModelCopyWith<FacilityModel, FacilityModel, FacilityModel>
      get copyWith => _FacilityModelCopyWithImpl(
          this as FacilityModel, $identity, $identity);
  @override
  String toString() {
    return FacilityModelMapper.ensureInitialized()
        .stringifyValue(this as FacilityModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FacilityModelMapper.ensureInitialized()
                .isValueEqual(this as FacilityModel, other));
  }

  @override
  int get hashCode {
    return FacilityModelMapper.ensureInitialized()
        .hashValue(this as FacilityModel);
  }
}

extension FacilityModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FacilityModel, $Out> {
  FacilityModelCopyWith<$R, FacilityModel, $Out> get $asFacilityModel =>
      $base.as((v, t, t2) => _FacilityModelCopyWithImpl(v, t, t2));
}

abstract class FacilityModelCopyWith<$R, $In extends FacilityModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  FacilityAdditionalFieldsCopyWith<$R, FacilityAdditionalFields,
      FacilityAdditionalFields>? get additionalFields;
  AddressModelCopyWith<$R, AddressModel, AddressModel>? get address;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {FacilityAdditionalFields? additionalFields,
      String? id,
      String? name,
      bool? isPermanent,
      String? usage,
      int? storageCapacity,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      AddressModel? address,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  FacilityModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FacilityModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FacilityModel, $Out>
    implements FacilityModelCopyWith<$R, FacilityModel, $Out> {
  _FacilityModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FacilityModel> $mapper =
      FacilityModelMapper.ensureInitialized();
  @override
  FacilityAdditionalFieldsCopyWith<$R, FacilityAdditionalFields,
          FacilityAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  AddressModelCopyWith<$R, AddressModel, AddressModel>? get address =>
      $value.address?.copyWith.$chain((v) => call(address: v));
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
          String? id,
          Object? name = $none,
          Object? isPermanent = $none,
          Object? usage = $none,
          Object? storageCapacity = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? address = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != null) #id: id,
        if (name != $none) #name: name,
        if (isPermanent != $none) #isPermanent: isPermanent,
        if (usage != $none) #usage: usage,
        if (storageCapacity != $none) #storageCapacity: storageCapacity,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (address != $none) #address: address,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  FacilityModel $make(CopyWithData data) => FacilityModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      isPermanent: data.get(#isPermanent, or: $value.isPermanent),
      usage: data.get(#usage, or: $value.usage),
      storageCapacity: data.get(#storageCapacity, or: $value.storageCapacity),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      address: data.get(#address, or: $value.address),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  FacilityModelCopyWith<$R2, FacilityModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FacilityModelCopyWithImpl($value, $cast, t);
}

class FacilityAdditionalFieldsMapper
    extends SubClassMapperBase<FacilityAdditionalFields> {
  FacilityAdditionalFieldsMapper._();

  static FacilityAdditionalFieldsMapper? _instance;
  static FacilityAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = FacilityAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FacilityAdditionalFields';

  static String _$schema(FacilityAdditionalFields v) => v.schema;
  static const Field<FacilityAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Facility');
  static int _$version(FacilityAdditionalFields v) => v.version;
  static const Field<FacilityAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(FacilityAdditionalFields v) => v.fields;
  static const Field<FacilityAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<FacilityAdditionalFields> fields = const {
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

  static FacilityAdditionalFields _instantiate(DecodingData data) {
    return FacilityAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static FacilityAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FacilityAdditionalFields>(map);
  }

  static FacilityAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<FacilityAdditionalFields>(json);
  }
}

mixin FacilityAdditionalFieldsMappable {
  String toJson() {
    return FacilityAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<FacilityAdditionalFields>(this as FacilityAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return FacilityAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<FacilityAdditionalFields>(this as FacilityAdditionalFields);
  }

  FacilityAdditionalFieldsCopyWith<FacilityAdditionalFields,
          FacilityAdditionalFields, FacilityAdditionalFields>
      get copyWith => _FacilityAdditionalFieldsCopyWithImpl(
          this as FacilityAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return FacilityAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as FacilityAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FacilityAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as FacilityAdditionalFields, other));
  }

  @override
  int get hashCode {
    return FacilityAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as FacilityAdditionalFields);
  }
}

extension FacilityAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FacilityAdditionalFields, $Out> {
  FacilityAdditionalFieldsCopyWith<$R, FacilityAdditionalFields, $Out>
      get $asFacilityAdditionalFields => $base
          .as((v, t, t2) => _FacilityAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class FacilityAdditionalFieldsCopyWith<
    $R,
    $In extends FacilityAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  FacilityAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FacilityAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FacilityAdditionalFields, $Out>
    implements
        FacilityAdditionalFieldsCopyWith<$R, FacilityAdditionalFields, $Out> {
  _FacilityAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FacilityAdditionalFields> $mapper =
      FacilityAdditionalFieldsMapper.ensureInitialized();
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
  FacilityAdditionalFields $make(CopyWithData data) => FacilityAdditionalFields(
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version),
      fields: data.get(#fields, or: $value.fields));

  @override
  FacilityAdditionalFieldsCopyWith<$R2, FacilityAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _FacilityAdditionalFieldsCopyWithImpl($value, $cast, t);
}

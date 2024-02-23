// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'data_model.dart';

class EntityModelMapper extends ClassMapperBase<EntityModel> {
  EntityModelMapper._();

  static EntityModelMapper? _instance;
  static EntityModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EntityModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'EntityModel';

  static AuditDetails? _$auditDetails(EntityModel v) => v.auditDetails;
  static const Field<EntityModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(EntityModel v) =>
      v.clientAuditDetails;
  static const Field<EntityModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(EntityModel v) => v.isDeleted;
  static const Field<EntityModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<EntityModel> fields = const {
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
    #isDeleted: _f$isDeleted,
  };

  static EntityModel _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('EntityModel');
  }

  @override
  final Function instantiate = _instantiate;

  static EntityModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EntityModel>(map);
  }

  static EntityModel fromJson(String json) {
    return ensureInitialized().decodeJson<EntityModel>(json);
  }
}

mixin EntityModelMappable {
  String toJson();
  Map<String, dynamic> toMap();
  EntityModelCopyWith<EntityModel, EntityModel, EntityModel> get copyWith;
}

abstract class EntityModelCopyWith<$R, $In extends EntityModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  $R call({AuditDetails? auditDetails, bool? isDeleted});
  EntityModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class AuditDetailsMapper extends ClassMapperBase<AuditDetails> {
  AuditDetailsMapper._();

  static AuditDetailsMapper? _instance;
  static AuditDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuditDetailsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AuditDetails';

  static String _$createdBy(AuditDetails v) => v.createdBy;
  static const Field<AuditDetails, String> _f$createdBy =
      Field('createdBy', _$createdBy);
  static int _$createdTime(AuditDetails v) => v.createdTime;
  static const Field<AuditDetails, int> _f$createdTime =
      Field('createdTime', _$createdTime);
  static String _$lastModifiedBy(AuditDetails v) => v.lastModifiedBy;
  static const Field<AuditDetails, String> _f$lastModifiedBy =
      Field('lastModifiedBy', _$lastModifiedBy, opt: true);
  static int _$lastModifiedTime(AuditDetails v) => v.lastModifiedTime;
  static const Field<AuditDetails, int> _f$lastModifiedTime =
      Field('lastModifiedTime', _$lastModifiedTime, opt: true);

  @override
  final MappableFields<AuditDetails> fields = const {
    #createdBy: _f$createdBy,
    #createdTime: _f$createdTime,
    #lastModifiedBy: _f$lastModifiedBy,
    #lastModifiedTime: _f$lastModifiedTime,
  };

  static AuditDetails _instantiate(DecodingData data) {
    return AuditDetails(
        createdBy: data.dec(_f$createdBy),
        createdTime: data.dec(_f$createdTime),
        lastModifiedBy: data.dec(_f$lastModifiedBy),
        lastModifiedTime: data.dec(_f$lastModifiedTime));
  }

  @override
  final Function instantiate = _instantiate;

  static AuditDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuditDetails>(map);
  }

  static AuditDetails fromJson(String json) {
    return ensureInitialized().decodeJson<AuditDetails>(json);
  }
}

mixin AuditDetailsMappable {
  String toJson() {
    return AuditDetailsMapper.ensureInitialized()
        .encodeJson<AuditDetails>(this as AuditDetails);
  }

  Map<String, dynamic> toMap() {
    return AuditDetailsMapper.ensureInitialized()
        .encodeMap<AuditDetails>(this as AuditDetails);
  }

  AuditDetailsCopyWith<AuditDetails, AuditDetails, AuditDetails> get copyWith =>
      _AuditDetailsCopyWithImpl(this as AuditDetails, $identity, $identity);
  @override
  String toString() {
    return AuditDetailsMapper.ensureInitialized()
        .stringifyValue(this as AuditDetails);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AuditDetailsMapper.ensureInitialized()
                .isValueEqual(this as AuditDetails, other));
  }

  @override
  int get hashCode {
    return AuditDetailsMapper.ensureInitialized()
        .hashValue(this as AuditDetails);
  }
}

extension AuditDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AuditDetails, $Out> {
  AuditDetailsCopyWith<$R, AuditDetails, $Out> get $asAuditDetails =>
      $base.as((v, t, t2) => _AuditDetailsCopyWithImpl(v, t, t2));
}

abstract class AuditDetailsCopyWith<$R, $In extends AuditDetails, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? createdBy,
      int? createdTime,
      String? lastModifiedBy,
      int? lastModifiedTime});
  AuditDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuditDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuditDetails, $Out>
    implements AuditDetailsCopyWith<$R, AuditDetails, $Out> {
  _AuditDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuditDetails> $mapper =
      AuditDetailsMapper.ensureInitialized();
  @override
  $R call(
          {String? createdBy,
          int? createdTime,
          Object? lastModifiedBy = $none,
          Object? lastModifiedTime = $none}) =>
      $apply(FieldCopyWithData({
        if (createdBy != null) #createdBy: createdBy,
        if (createdTime != null) #createdTime: createdTime,
        if (lastModifiedBy != $none) #lastModifiedBy: lastModifiedBy,
        if (lastModifiedTime != $none) #lastModifiedTime: lastModifiedTime
      }));
  @override
  AuditDetails $make(CopyWithData data) => AuditDetails(
      createdBy: data.get(#createdBy, or: $value.createdBy),
      createdTime: data.get(#createdTime, or: $value.createdTime),
      lastModifiedBy: data.get(#lastModifiedBy, or: $value.lastModifiedBy),
      lastModifiedTime:
          data.get(#lastModifiedTime, or: $value.lastModifiedTime));

  @override
  AuditDetailsCopyWith<$R2, AuditDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AuditDetailsCopyWithImpl($value, $cast, t);
}

class AdditionalFieldsMapper extends ClassMapperBase<AdditionalFields> {
  AdditionalFieldsMapper._();

  static AdditionalFieldsMapper? _instance;
  static AdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AdditionalFields';

  static String _$schema(AdditionalFields v) => v.schema;
  static const Field<AdditionalFields, String> _f$schema =
      Field('schema', _$schema);
  static int _$version(AdditionalFields v) => v.version;
  static const Field<AdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(AdditionalFields v) => v.fields;
  static const Field<AdditionalFields, List<AdditionalField>> _f$fields =
      Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<AdditionalFields> fields = const {
    #schema: _f$schema,
    #version: _f$version,
    #fields: _f$fields,
  };

  static AdditionalFields _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('AdditionalFields');
  }

  @override
  final Function instantiate = _instantiate;

  static AdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdditionalFields>(map);
  }

  static AdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<AdditionalFields>(json);
  }
}

mixin AdditionalFieldsMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AdditionalFieldsCopyWith<AdditionalFields, AdditionalFields, AdditionalFields>
      get copyWith;
}

abstract class AdditionalFieldsCopyWith<$R, $In extends AdditionalFields, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? schema, int? version});
  AdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class AdditionalFieldMapper extends ClassMapperBase<AdditionalField> {
  AdditionalFieldMapper._();

  static AdditionalFieldMapper? _instance;
  static AdditionalFieldMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdditionalFieldMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AdditionalField';

  static String _$key(AdditionalField v) => v.key;
  static const Field<AdditionalField, String> _f$key = Field('key', _$key);
  static dynamic _$value(AdditionalField v) => v.value;
  static const Field<AdditionalField, dynamic> _f$value =
      Field('value', _$value);

  @override
  final MappableFields<AdditionalField> fields = const {
    #key: _f$key,
    #value: _f$value,
  };

  static AdditionalField _instantiate(DecodingData data) {
    return AdditionalField(data.dec(_f$key), data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static AdditionalField fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdditionalField>(map);
  }

  static AdditionalField fromJson(String json) {
    return ensureInitialized().decodeJson<AdditionalField>(json);
  }
}

mixin AdditionalFieldMappable {
  String toJson() {
    return AdditionalFieldMapper.ensureInitialized()
        .encodeJson<AdditionalField>(this as AdditionalField);
  }

  Map<String, dynamic> toMap() {
    return AdditionalFieldMapper.ensureInitialized()
        .encodeMap<AdditionalField>(this as AdditionalField);
  }

  AdditionalFieldCopyWith<AdditionalField, AdditionalField, AdditionalField>
      get copyWith => _AdditionalFieldCopyWithImpl(
          this as AdditionalField, $identity, $identity);
  @override
  String toString() {
    return AdditionalFieldMapper.ensureInitialized()
        .stringifyValue(this as AdditionalField);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AdditionalFieldMapper.ensureInitialized()
                .isValueEqual(this as AdditionalField, other));
  }

  @override
  int get hashCode {
    return AdditionalFieldMapper.ensureInitialized()
        .hashValue(this as AdditionalField);
  }
}

extension AdditionalFieldValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdditionalField, $Out> {
  AdditionalFieldCopyWith<$R, AdditionalField, $Out> get $asAdditionalField =>
      $base.as((v, t, t2) => _AdditionalFieldCopyWithImpl(v, t, t2));
}

abstract class AdditionalFieldCopyWith<$R, $In extends AdditionalField, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? key, dynamic value});
  AdditionalFieldCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AdditionalFieldCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdditionalField, $Out>
    implements AdditionalFieldCopyWith<$R, AdditionalField, $Out> {
  _AdditionalFieldCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdditionalField> $mapper =
      AdditionalFieldMapper.ensureInitialized();
  @override
  $R call({String? key, Object? value = $none}) => $apply(FieldCopyWithData(
      {if (key != null) #key: key, if (value != $none) #value: value}));
  @override
  AdditionalField $make(CopyWithData data) => AdditionalField(
      data.get(#key, or: $value.key), data.get(#value, or: $value.value));

  @override
  AdditionalFieldCopyWith<$R2, AdditionalField, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AdditionalFieldCopyWithImpl($value, $cast, t);
}

class ClientAuditDetailsMapper extends ClassMapperBase<ClientAuditDetails> {
  ClientAuditDetailsMapper._();

  static ClientAuditDetailsMapper? _instance;
  static ClientAuditDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClientAuditDetailsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ClientAuditDetails';

  static String _$createdBy(ClientAuditDetails v) => v.createdBy;
  static const Field<ClientAuditDetails, String> _f$createdBy =
      Field('createdBy', _$createdBy);
  static int _$createdTime(ClientAuditDetails v) => v.createdTime;
  static const Field<ClientAuditDetails, int> _f$createdTime =
      Field('createdTime', _$createdTime);
  static String _$lastModifiedBy(ClientAuditDetails v) => v.lastModifiedBy;
  static const Field<ClientAuditDetails, String> _f$lastModifiedBy =
      Field('lastModifiedBy', _$lastModifiedBy, opt: true);
  static int? _$lastModifiedTime(ClientAuditDetails v) => v.lastModifiedTime;
  static const Field<ClientAuditDetails, int> _f$lastModifiedTime =
      Field('lastModifiedTime', _$lastModifiedTime, opt: true);

  @override
  final MappableFields<ClientAuditDetails> fields = const {
    #createdBy: _f$createdBy,
    #createdTime: _f$createdTime,
    #lastModifiedBy: _f$lastModifiedBy,
    #lastModifiedTime: _f$lastModifiedTime,
  };

  static ClientAuditDetails _instantiate(DecodingData data) {
    return ClientAuditDetails(
        createdBy: data.dec(_f$createdBy),
        createdTime: data.dec(_f$createdTime),
        lastModifiedBy: data.dec(_f$lastModifiedBy),
        lastModifiedTime: data.dec(_f$lastModifiedTime));
  }

  @override
  final Function instantiate = _instantiate;

  static ClientAuditDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClientAuditDetails>(map);
  }

  static ClientAuditDetails fromJson(String json) {
    return ensureInitialized().decodeJson<ClientAuditDetails>(json);
  }
}

mixin ClientAuditDetailsMappable {
  String toJson() {
    return ClientAuditDetailsMapper.ensureInitialized()
        .encodeJson<ClientAuditDetails>(this as ClientAuditDetails);
  }

  Map<String, dynamic> toMap() {
    return ClientAuditDetailsMapper.ensureInitialized()
        .encodeMap<ClientAuditDetails>(this as ClientAuditDetails);
  }

  ClientAuditDetailsCopyWith<ClientAuditDetails, ClientAuditDetails,
          ClientAuditDetails>
      get copyWith => _ClientAuditDetailsCopyWithImpl(
          this as ClientAuditDetails, $identity, $identity);
  @override
  String toString() {
    return ClientAuditDetailsMapper.ensureInitialized()
        .stringifyValue(this as ClientAuditDetails);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ClientAuditDetailsMapper.ensureInitialized()
                .isValueEqual(this as ClientAuditDetails, other));
  }

  @override
  int get hashCode {
    return ClientAuditDetailsMapper.ensureInitialized()
        .hashValue(this as ClientAuditDetails);
  }
}

extension ClientAuditDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClientAuditDetails, $Out> {
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, $Out>
      get $asClientAuditDetails =>
          $base.as((v, t, t2) => _ClientAuditDetailsCopyWithImpl(v, t, t2));
}

abstract class ClientAuditDetailsCopyWith<$R, $In extends ClientAuditDetails,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? createdBy,
      int? createdTime,
      String? lastModifiedBy,
      int? lastModifiedTime});
  ClientAuditDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ClientAuditDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClientAuditDetails, $Out>
    implements ClientAuditDetailsCopyWith<$R, ClientAuditDetails, $Out> {
  _ClientAuditDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClientAuditDetails> $mapper =
      ClientAuditDetailsMapper.ensureInitialized();
  @override
  $R call(
          {String? createdBy,
          int? createdTime,
          Object? lastModifiedBy = $none,
          Object? lastModifiedTime = $none}) =>
      $apply(FieldCopyWithData({
        if (createdBy != null) #createdBy: createdBy,
        if (createdTime != null) #createdTime: createdTime,
        if (lastModifiedBy != $none) #lastModifiedBy: lastModifiedBy,
        if (lastModifiedTime != $none) #lastModifiedTime: lastModifiedTime
      }));
  @override
  ClientAuditDetails $make(CopyWithData data) => ClientAuditDetails(
      createdBy: data.get(#createdBy, or: $value.createdBy),
      createdTime: data.get(#createdTime, or: $value.createdTime),
      lastModifiedBy: data.get(#lastModifiedBy, or: $value.lastModifiedBy),
      lastModifiedTime:
          data.get(#lastModifiedTime, or: $value.lastModifiedTime));

  @override
  ClientAuditDetailsCopyWith<$R2, ClientAuditDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ClientAuditDetailsCopyWithImpl($value, $cast, t);
}

class EntitySearchModelMapper extends ClassMapperBase<EntitySearchModel> {
  EntitySearchModelMapper._();

  static EntitySearchModelMapper? _instance;
  static EntitySearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EntitySearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'EntitySearchModel';

  static String? _$boundaryCode(EntitySearchModel v) => v.boundaryCode;
  static const Field<EntitySearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(EntitySearchModel v) => v.auditDetails;
  static const Field<EntitySearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static AdditionalFields? _$additionalFields(EntitySearchModel v) =>
      v.additionalFields;
  static const Field<EntitySearchModel, AdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);

  @override
  final MappableFields<EntitySearchModel> fields = const {
    #boundaryCode: _f$boundaryCode,
    #auditDetails: _f$auditDetails,
    #additionalFields: _f$additionalFields,
  };
  @override
  final bool ignoreNull = true;

  static EntitySearchModel _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('EntitySearchModel');
  }

  @override
  final Function instantiate = _instantiate;

  static EntitySearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EntitySearchModel>(map);
  }

  static EntitySearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<EntitySearchModel>(json);
  }
}

mixin EntitySearchModelMappable {
  String toJson();
  Map<String, dynamic> toMap();
  EntitySearchModelCopyWith<EntitySearchModel, EntitySearchModel,
      EntitySearchModel> get copyWith;
}

abstract class EntitySearchModelCopyWith<$R, $In extends EntitySearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  EntitySearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

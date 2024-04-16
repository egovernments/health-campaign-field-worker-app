// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hcm_inventory_facility.dart';

class HcmInventoryFacilitySearchModelMapper
    extends SubClassMapperBase<HcmInventoryFacilitySearchModel> {
  HcmInventoryFacilitySearchModelMapper._();

  static HcmInventoryFacilitySearchModelMapper? _instance;
  static HcmInventoryFacilitySearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HcmInventoryFacilitySearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HcmInventoryFacilitySearchModel';

  static InventoryFacilitySearchModel? _$facilitySearchModel(
          HcmInventoryFacilitySearchModel v) =>
      v.facilitySearchModel;
  static const Field<HcmInventoryFacilitySearchModel,
          InventoryFacilitySearchModel> _f$facilitySearchModel =
      Field('facilitySearchModel', _$facilitySearchModel, opt: true);
  static String? _$boundaryCode(HcmInventoryFacilitySearchModel v) =>
      v.boundaryCode;
  static const Field<HcmInventoryFacilitySearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(HcmInventoryFacilitySearchModel v) =>
      v.auditDetails;
  static const Field<HcmInventoryFacilitySearchModel, AuditDetails>
      _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(
          HcmInventoryFacilitySearchModel v) =>
      v.additionalFields;
  static const Field<HcmInventoryFacilitySearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<HcmInventoryFacilitySearchModel> fields = const {
    #facilitySearchModel: _f$facilitySearchModel,
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

  static HcmInventoryFacilitySearchModel _instantiate(DecodingData data) {
    return HcmInventoryFacilitySearchModel.ignoreDeleted(
        facilitySearchModel: data.dec(_f$facilitySearchModel),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmInventoryFacilitySearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HcmInventoryFacilitySearchModel>(map);
  }

  static HcmInventoryFacilitySearchModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<HcmInventoryFacilitySearchModel>(json);
  }
}

mixin HcmInventoryFacilitySearchModelMappable {
  String toJson() {
    return HcmInventoryFacilitySearchModelMapper.ensureInitialized()
        .encodeJson<HcmInventoryFacilitySearchModel>(
            this as HcmInventoryFacilitySearchModel);
  }

  Map<String, dynamic> toMap() {
    return HcmInventoryFacilitySearchModelMapper.ensureInitialized()
        .encodeMap<HcmInventoryFacilitySearchModel>(
            this as HcmInventoryFacilitySearchModel);
  }

  HcmInventoryFacilitySearchModelCopyWith<HcmInventoryFacilitySearchModel,
          HcmInventoryFacilitySearchModel, HcmInventoryFacilitySearchModel>
      get copyWith => _HcmInventoryFacilitySearchModelCopyWithImpl(
          this as HcmInventoryFacilitySearchModel, $identity, $identity);
  @override
  String toString() {
    return HcmInventoryFacilitySearchModelMapper.ensureInitialized()
        .stringifyValue(this as HcmInventoryFacilitySearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HcmInventoryFacilitySearchModelMapper.ensureInitialized()
                .isValueEqual(this as HcmInventoryFacilitySearchModel, other));
  }

  @override
  int get hashCode {
    return HcmInventoryFacilitySearchModelMapper.ensureInitialized()
        .hashValue(this as HcmInventoryFacilitySearchModel);
  }
}

extension HcmInventoryFacilitySearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmInventoryFacilitySearchModel, $Out> {
  HcmInventoryFacilitySearchModelCopyWith<$R, HcmInventoryFacilitySearchModel,
          $Out>
      get $asHcmInventoryFacilitySearchModel => $base.as(
          (v, t, t2) => _HcmInventoryFacilitySearchModelCopyWithImpl(v, t, t2));
}

abstract class HcmInventoryFacilitySearchModelCopyWith<
    $R,
    $In extends HcmInventoryFacilitySearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  InventoryFacilitySearchModelCopyWith<$R, InventoryFacilitySearchModel,
      InventoryFacilitySearchModel>? get facilitySearchModel;
  @override
  $R call(
      {InventoryFacilitySearchModel? facilitySearchModel,
      String? boundaryCode});
  HcmInventoryFacilitySearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HcmInventoryFacilitySearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmInventoryFacilitySearchModel, $Out>
    implements
        HcmInventoryFacilitySearchModelCopyWith<$R,
            HcmInventoryFacilitySearchModel, $Out> {
  _HcmInventoryFacilitySearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmInventoryFacilitySearchModel> $mapper =
      HcmInventoryFacilitySearchModelMapper.ensureInitialized();
  @override
  InventoryFacilitySearchModelCopyWith<$R, InventoryFacilitySearchModel,
          InventoryFacilitySearchModel>?
      get facilitySearchModel => $value.facilitySearchModel?.copyWith
          .$chain((v) => call(facilitySearchModel: v));
  @override
  $R call(
          {Object? facilitySearchModel = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (facilitySearchModel != $none)
          #facilitySearchModel: facilitySearchModel,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  HcmInventoryFacilitySearchModel $make(CopyWithData data) =>
      HcmInventoryFacilitySearchModel.ignoreDeleted(
          facilitySearchModel:
              data.get(#facilitySearchModel, or: $value.facilitySearchModel),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  HcmInventoryFacilitySearchModelCopyWith<$R2, HcmInventoryFacilitySearchModel,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HcmInventoryFacilitySearchModelCopyWithImpl($value, $cast, t);
}

class HcmInventoryFacilityModelMapper
    extends SubClassMapperBase<HcmInventoryFacilityModel> {
  HcmInventoryFacilityModelMapper._();

  static HcmInventoryFacilityModelMapper? _instance;
  static HcmInventoryFacilityModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HcmInventoryFacilityModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HcmInventoryFacilityModel';

  static FacilityAdditionalFields? _$additionalFields(
          HcmInventoryFacilityModel v) =>
      v.additionalFields;
  static const Field<HcmInventoryFacilityModel, FacilityAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static InventoryFacilityModel? _$facilityModel(HcmInventoryFacilityModel v) =>
      v.facilityModel;
  static const Field<HcmInventoryFacilityModel, InventoryFacilityModel>
      _f$facilityModel = Field('facilityModel', _$facilityModel, opt: true);
  static AddressModel? _$address(HcmInventoryFacilityModel v) => v.address;
  static const Field<HcmInventoryFacilityModel, AddressModel> _f$address =
      Field('address', _$address, opt: true);
  static AuditDetails? _$auditDetails(HcmInventoryFacilityModel v) =>
      v.auditDetails;
  static const Field<HcmInventoryFacilityModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(
          HcmInventoryFacilityModel v) =>
      v.clientAuditDetails;
  static const Field<HcmInventoryFacilityModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(HcmInventoryFacilityModel v) => v.isDeleted;
  static const Field<HcmInventoryFacilityModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<HcmInventoryFacilityModel> fields = const {
    #additionalFields: _f$additionalFields,
    #facilityModel: _f$facilityModel,
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

  static HcmInventoryFacilityModel _instantiate(DecodingData data) {
    return HcmInventoryFacilityModel(
        additionalFields: data.dec(_f$additionalFields),
        facilityModel: data.dec(_f$facilityModel),
        address: data.dec(_f$address),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmInventoryFacilityModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HcmInventoryFacilityModel>(map);
  }

  static HcmInventoryFacilityModel fromJson(String json) {
    return ensureInitialized().decodeJson<HcmInventoryFacilityModel>(json);
  }
}

mixin HcmInventoryFacilityModelMappable {
  String toJson() {
    return HcmInventoryFacilityModelMapper.ensureInitialized()
        .encodeJson<HcmInventoryFacilityModel>(
            this as HcmInventoryFacilityModel);
  }

  Map<String, dynamic> toMap() {
    return HcmInventoryFacilityModelMapper.ensureInitialized()
        .encodeMap<HcmInventoryFacilityModel>(
            this as HcmInventoryFacilityModel);
  }

  HcmInventoryFacilityModelCopyWith<HcmInventoryFacilityModel,
          HcmInventoryFacilityModel, HcmInventoryFacilityModel>
      get copyWith => _HcmInventoryFacilityModelCopyWithImpl(
          this as HcmInventoryFacilityModel, $identity, $identity);
  @override
  String toString() {
    return HcmInventoryFacilityModelMapper.ensureInitialized()
        .stringifyValue(this as HcmInventoryFacilityModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HcmInventoryFacilityModelMapper.ensureInitialized()
                .isValueEqual(this as HcmInventoryFacilityModel, other));
  }

  @override
  int get hashCode {
    return HcmInventoryFacilityModelMapper.ensureInitialized()
        .hashValue(this as HcmInventoryFacilityModel);
  }
}

extension HcmInventoryFacilityModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmInventoryFacilityModel, $Out> {
  HcmInventoryFacilityModelCopyWith<$R, HcmInventoryFacilityModel, $Out>
      get $asHcmInventoryFacilityModel => $base
          .as((v, t, t2) => _HcmInventoryFacilityModelCopyWithImpl(v, t, t2));
}

abstract class HcmInventoryFacilityModelCopyWith<
    $R,
    $In extends HcmInventoryFacilityModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  FacilityAdditionalFieldsCopyWith<$R, FacilityAdditionalFields,
      FacilityAdditionalFields>? get additionalFields;
  InventoryFacilityModelCopyWith<$R, InventoryFacilityModel,
      InventoryFacilityModel>? get facilityModel;
  AddressModelCopyWith<$R, AddressModel, AddressModel>? get address;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {FacilityAdditionalFields? additionalFields,
      InventoryFacilityModel? facilityModel,
      AddressModel? address,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  HcmInventoryFacilityModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HcmInventoryFacilityModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmInventoryFacilityModel, $Out>
    implements
        HcmInventoryFacilityModelCopyWith<$R, HcmInventoryFacilityModel, $Out> {
  _HcmInventoryFacilityModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmInventoryFacilityModel> $mapper =
      HcmInventoryFacilityModelMapper.ensureInitialized();
  @override
  FacilityAdditionalFieldsCopyWith<$R, FacilityAdditionalFields,
          FacilityAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  InventoryFacilityModelCopyWith<$R, InventoryFacilityModel,
          InventoryFacilityModel>?
      get facilityModel =>
          $value.facilityModel?.copyWith.$chain((v) => call(facilityModel: v));
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
          Object? facilityModel = $none,
          Object? address = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (facilityModel != $none) #facilityModel: facilityModel,
        if (address != $none) #address: address,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  HcmInventoryFacilityModel $make(CopyWithData data) =>
      HcmInventoryFacilityModel(
          additionalFields:
              data.get(#additionalFields, or: $value.additionalFields),
          facilityModel: data.get(#facilityModel, or: $value.facilityModel),
          address: data.get(#address, or: $value.address),
          auditDetails: data.get(#auditDetails, or: $value.auditDetails),
          clientAuditDetails:
              data.get(#clientAuditDetails, or: $value.clientAuditDetails),
          isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  HcmInventoryFacilityModelCopyWith<$R2, HcmInventoryFacilityModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HcmInventoryFacilityModelCopyWithImpl($value, $cast, t);
}

class HcmInventoryFacilityAdditionalFieldsMapper
    extends SubClassMapperBase<HcmInventoryFacilityAdditionalFields> {
  HcmInventoryFacilityAdditionalFieldsMapper._();

  static HcmInventoryFacilityAdditionalFieldsMapper? _instance;
  static HcmInventoryFacilityAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HcmInventoryFacilityAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HcmInventoryFacilityAdditionalFields';

  static String _$schema(HcmInventoryFacilityAdditionalFields v) => v.schema;
  static const Field<HcmInventoryFacilityAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'HcmInventoryFacility');
  static int _$version(HcmInventoryFacilityAdditionalFields v) => v.version;
  static const Field<HcmInventoryFacilityAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(
          HcmInventoryFacilityAdditionalFields v) =>
      v.fields;
  static const Field<HcmInventoryFacilityAdditionalFields,
          List<AdditionalField>> _f$fields =
      Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<HcmInventoryFacilityAdditionalFields> fields = const {
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

  static HcmInventoryFacilityAdditionalFields _instantiate(DecodingData data) {
    return HcmInventoryFacilityAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmInventoryFacilityAdditionalFields fromMap(
      Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<HcmInventoryFacilityAdditionalFields>(map);
  }

  static HcmInventoryFacilityAdditionalFields fromJson(String json) {
    return ensureInitialized()
        .decodeJson<HcmInventoryFacilityAdditionalFields>(json);
  }
}

mixin HcmInventoryFacilityAdditionalFieldsMappable {
  String toJson() {
    return HcmInventoryFacilityAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<HcmInventoryFacilityAdditionalFields>(
            this as HcmInventoryFacilityAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return HcmInventoryFacilityAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<HcmInventoryFacilityAdditionalFields>(
            this as HcmInventoryFacilityAdditionalFields);
  }

  HcmInventoryFacilityAdditionalFieldsCopyWith<
          HcmInventoryFacilityAdditionalFields,
          HcmInventoryFacilityAdditionalFields,
          HcmInventoryFacilityAdditionalFields>
      get copyWith => _HcmInventoryFacilityAdditionalFieldsCopyWithImpl(
          this as HcmInventoryFacilityAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return HcmInventoryFacilityAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as HcmInventoryFacilityAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HcmInventoryFacilityAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(
                    this as HcmInventoryFacilityAdditionalFields, other));
  }

  @override
  int get hashCode {
    return HcmInventoryFacilityAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as HcmInventoryFacilityAdditionalFields);
  }
}

extension HcmInventoryFacilityAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmInventoryFacilityAdditionalFields, $Out> {
  HcmInventoryFacilityAdditionalFieldsCopyWith<$R,
          HcmInventoryFacilityAdditionalFields, $Out>
      get $asHcmInventoryFacilityAdditionalFields => $base.as((v, t, t2) =>
          _HcmInventoryFacilityAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class HcmInventoryFacilityAdditionalFieldsCopyWith<
    $R,
    $In extends HcmInventoryFacilityAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  HcmInventoryFacilityAdditionalFieldsCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HcmInventoryFacilityAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmInventoryFacilityAdditionalFields, $Out>
    implements
        HcmInventoryFacilityAdditionalFieldsCopyWith<$R,
            HcmInventoryFacilityAdditionalFields, $Out> {
  _HcmInventoryFacilityAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmInventoryFacilityAdditionalFields> $mapper =
      HcmInventoryFacilityAdditionalFieldsMapper.ensureInitialized();
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
  HcmInventoryFacilityAdditionalFields $make(CopyWithData data) =>
      HcmInventoryFacilityAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  HcmInventoryFacilityAdditionalFieldsCopyWith<$R2,
      HcmInventoryFacilityAdditionalFields, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HcmInventoryFacilityAdditionalFieldsCopyWithImpl($value, $cast, t);
}

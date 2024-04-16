// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hcm_hf_referral.dart';

class HcmHFReferralSearchModelMapper
    extends SubClassMapperBase<HcmHFReferralSearchModel> {
  HcmHFReferralSearchModelMapper._();

  static HcmHFReferralSearchModelMapper? _instance;
  static HcmHFReferralSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HcmHFReferralSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HcmHFReferralSearchModel';

  static HFReferralSearchModel? _$hFReferral(HcmHFReferralSearchModel v) =>
      v.hFReferral;
  static const Field<HcmHFReferralSearchModel, HFReferralSearchModel>
      _f$hFReferral = Field('hFReferral', _$hFReferral);
  static String? _$boundaryCode(HcmHFReferralSearchModel v) => v.boundaryCode;
  static const Field<HcmHFReferralSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(HcmHFReferralSearchModel v) =>
      v.auditDetails;
  static const Field<HcmHFReferralSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(HcmHFReferralSearchModel v) =>
      v.additionalFields;
  static const Field<HcmHFReferralSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<HcmHFReferralSearchModel> fields = const {
    #hFReferral: _f$hFReferral,
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

  static HcmHFReferralSearchModel _instantiate(DecodingData data) {
    return HcmHFReferralSearchModel.ignoreDeleted(data.dec(_f$hFReferral),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmHFReferralSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HcmHFReferralSearchModel>(map);
  }

  static HcmHFReferralSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<HcmHFReferralSearchModel>(json);
  }
}

mixin HcmHFReferralSearchModelMappable {
  String toJson() {
    return HcmHFReferralSearchModelMapper.ensureInitialized()
        .encodeJson<HcmHFReferralSearchModel>(this as HcmHFReferralSearchModel);
  }

  Map<String, dynamic> toMap() {
    return HcmHFReferralSearchModelMapper.ensureInitialized()
        .encodeMap<HcmHFReferralSearchModel>(this as HcmHFReferralSearchModel);
  }

  HcmHFReferralSearchModelCopyWith<HcmHFReferralSearchModel,
          HcmHFReferralSearchModel, HcmHFReferralSearchModel>
      get copyWith => _HcmHFReferralSearchModelCopyWithImpl(
          this as HcmHFReferralSearchModel, $identity, $identity);
  @override
  String toString() {
    return HcmHFReferralSearchModelMapper.ensureInitialized()
        .stringifyValue(this as HcmHFReferralSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HcmHFReferralSearchModelMapper.ensureInitialized()
                .isValueEqual(this as HcmHFReferralSearchModel, other));
  }

  @override
  int get hashCode {
    return HcmHFReferralSearchModelMapper.ensureInitialized()
        .hashValue(this as HcmHFReferralSearchModel);
  }
}

extension HcmHFReferralSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmHFReferralSearchModel, $Out> {
  HcmHFReferralSearchModelCopyWith<$R, HcmHFReferralSearchModel, $Out>
      get $asHcmHFReferralSearchModel => $base
          .as((v, t, t2) => _HcmHFReferralSearchModelCopyWithImpl(v, t, t2));
}

abstract class HcmHFReferralSearchModelCopyWith<
    $R,
    $In extends HcmHFReferralSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  HFReferralSearchModelCopyWith<$R, HFReferralSearchModel,
      HFReferralSearchModel>? get hFReferral;
  @override
  $R call({HFReferralSearchModel? hFReferral, String? boundaryCode});
  HcmHFReferralSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HcmHFReferralSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmHFReferralSearchModel, $Out>
    implements
        HcmHFReferralSearchModelCopyWith<$R, HcmHFReferralSearchModel, $Out> {
  _HcmHFReferralSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmHFReferralSearchModel> $mapper =
      HcmHFReferralSearchModelMapper.ensureInitialized();
  @override
  HFReferralSearchModelCopyWith<$R, HFReferralSearchModel,
          HFReferralSearchModel>?
      get hFReferral =>
          $value.hFReferral?.copyWith.$chain((v) => call(hFReferral: v));
  @override
  $R call({Object? hFReferral = $none, Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (hFReferral != $none) #hFReferral: hFReferral,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  HcmHFReferralSearchModel $make(CopyWithData data) =>
      HcmHFReferralSearchModel.ignoreDeleted(
          data.get(#hFReferral, or: $value.hFReferral),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  HcmHFReferralSearchModelCopyWith<$R2, HcmHFReferralSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HcmHFReferralSearchModelCopyWithImpl($value, $cast, t);
}

class HcmHFReferralModelMapper extends SubClassMapperBase<HcmHFReferralModel> {
  HcmHFReferralModelMapper._();

  static HcmHFReferralModelMapper? _instance;
  static HcmHFReferralModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HcmHFReferralModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HcmHFReferralModel';

  static HFReferralAdditionalFields? _$additionalFields(HcmHFReferralModel v) =>
      v.additionalFields;
  static const Field<HcmHFReferralModel, HFReferralAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static HFReferralModel? _$hFReferral(HcmHFReferralModel v) => v.hFReferral;
  static const Field<HcmHFReferralModel, HFReferralModel> _f$hFReferral =
      Field('hFReferral', _$hFReferral, opt: true);
  static AuditDetails? _$auditDetails(HcmHFReferralModel v) => v.auditDetails;
  static const Field<HcmHFReferralModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(HcmHFReferralModel v) =>
      v.clientAuditDetails;
  static const Field<HcmHFReferralModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(HcmHFReferralModel v) => v.isDeleted;
  static const Field<HcmHFReferralModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<HcmHFReferralModel> fields = const {
    #additionalFields: _f$additionalFields,
    #hFReferral: _f$hFReferral,
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

  static HcmHFReferralModel _instantiate(DecodingData data) {
    return HcmHFReferralModel(
        additionalFields: data.dec(_f$additionalFields),
        hFReferral: data.dec(_f$hFReferral),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmHFReferralModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HcmHFReferralModel>(map);
  }

  static HcmHFReferralModel fromJson(String json) {
    return ensureInitialized().decodeJson<HcmHFReferralModel>(json);
  }
}

mixin HcmHFReferralModelMappable {
  String toJson() {
    return HcmHFReferralModelMapper.ensureInitialized()
        .encodeJson<HcmHFReferralModel>(this as HcmHFReferralModel);
  }

  Map<String, dynamic> toMap() {
    return HcmHFReferralModelMapper.ensureInitialized()
        .encodeMap<HcmHFReferralModel>(this as HcmHFReferralModel);
  }

  HcmHFReferralModelCopyWith<HcmHFReferralModel, HcmHFReferralModel,
          HcmHFReferralModel>
      get copyWith => _HcmHFReferralModelCopyWithImpl(
          this as HcmHFReferralModel, $identity, $identity);
  @override
  String toString() {
    return HcmHFReferralModelMapper.ensureInitialized()
        .stringifyValue(this as HcmHFReferralModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HcmHFReferralModelMapper.ensureInitialized()
                .isValueEqual(this as HcmHFReferralModel, other));
  }

  @override
  int get hashCode {
    return HcmHFReferralModelMapper.ensureInitialized()
        .hashValue(this as HcmHFReferralModel);
  }
}

extension HcmHFReferralModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmHFReferralModel, $Out> {
  HcmHFReferralModelCopyWith<$R, HcmHFReferralModel, $Out>
      get $asHcmHFReferralModel =>
          $base.as((v, t, t2) => _HcmHFReferralModelCopyWithImpl(v, t, t2));
}

abstract class HcmHFReferralModelCopyWith<$R, $In extends HcmHFReferralModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  HFReferralAdditionalFieldsCopyWith<$R, HFReferralAdditionalFields,
      HFReferralAdditionalFields>? get additionalFields;
  HFReferralModelCopyWith<$R, HFReferralModel, HFReferralModel>? get hFReferral;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {HFReferralAdditionalFields? additionalFields,
      HFReferralModel? hFReferral,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  HcmHFReferralModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HcmHFReferralModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmHFReferralModel, $Out>
    implements HcmHFReferralModelCopyWith<$R, HcmHFReferralModel, $Out> {
  _HcmHFReferralModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmHFReferralModel> $mapper =
      HcmHFReferralModelMapper.ensureInitialized();
  @override
  HFReferralAdditionalFieldsCopyWith<$R, HFReferralAdditionalFields,
          HFReferralAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  HFReferralModelCopyWith<$R, HFReferralModel, HFReferralModel>?
      get hFReferral =>
          $value.hFReferral?.copyWith.$chain((v) => call(hFReferral: v));
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
          Object? hFReferral = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (hFReferral != $none) #hFReferral: hFReferral,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  HcmHFReferralModel $make(CopyWithData data) => HcmHFReferralModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      hFReferral: data.get(#hFReferral, or: $value.hFReferral),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  HcmHFReferralModelCopyWith<$R2, HcmHFReferralModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HcmHFReferralModelCopyWithImpl($value, $cast, t);
}

class HFReferralAdditionalFieldsMapper
    extends SubClassMapperBase<HFReferralAdditionalFields> {
  HFReferralAdditionalFieldsMapper._();

  static HFReferralAdditionalFieldsMapper? _instance;
  static HFReferralAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HFReferralAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HFReferralAdditionalFields';

  static String _$schema(HFReferralAdditionalFields v) => v.schema;
  static const Field<HFReferralAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'HFReferral');
  static int _$version(HFReferralAdditionalFields v) => v.version;
  static const Field<HFReferralAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(HFReferralAdditionalFields v) =>
      v.fields;
  static const Field<HFReferralAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<HFReferralAdditionalFields> fields = const {
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

  static HFReferralAdditionalFields _instantiate(DecodingData data) {
    return HFReferralAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static HFReferralAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HFReferralAdditionalFields>(map);
  }

  static HFReferralAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<HFReferralAdditionalFields>(json);
  }
}

mixin HFReferralAdditionalFieldsMappable {
  String toJson() {
    return HFReferralAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<HFReferralAdditionalFields>(
            this as HFReferralAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return HFReferralAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<HFReferralAdditionalFields>(
            this as HFReferralAdditionalFields);
  }

  HFReferralAdditionalFieldsCopyWith<HFReferralAdditionalFields,
          HFReferralAdditionalFields, HFReferralAdditionalFields>
      get copyWith => _HFReferralAdditionalFieldsCopyWithImpl(
          this as HFReferralAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return HFReferralAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as HFReferralAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HFReferralAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as HFReferralAdditionalFields, other));
  }

  @override
  int get hashCode {
    return HFReferralAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as HFReferralAdditionalFields);
  }
}

extension HFReferralAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HFReferralAdditionalFields, $Out> {
  HFReferralAdditionalFieldsCopyWith<$R, HFReferralAdditionalFields, $Out>
      get $asHFReferralAdditionalFields => $base
          .as((v, t, t2) => _HFReferralAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class HFReferralAdditionalFieldsCopyWith<
    $R,
    $In extends HFReferralAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  HFReferralAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HFReferralAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HFReferralAdditionalFields, $Out>
    implements
        HFReferralAdditionalFieldsCopyWith<$R, HFReferralAdditionalFields,
            $Out> {
  _HFReferralAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HFReferralAdditionalFields> $mapper =
      HFReferralAdditionalFieldsMapper.ensureInitialized();
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
  HFReferralAdditionalFields $make(CopyWithData data) =>
      HFReferralAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  HFReferralAdditionalFieldsCopyWith<$R2, HFReferralAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HFReferralAdditionalFieldsCopyWithImpl($value, $cast, t);
}

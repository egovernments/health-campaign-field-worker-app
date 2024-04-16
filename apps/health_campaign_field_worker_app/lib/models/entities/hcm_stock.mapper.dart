// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hcm_stock.dart';

class HcmStockSearchModelMapper
    extends SubClassMapperBase<HcmStockSearchModel> {
  HcmStockSearchModelMapper._();

  static HcmStockSearchModelMapper? _instance;
  static HcmStockSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HcmStockSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HcmStockSearchModel';

  static StockSearchModel? _$stock(HcmStockSearchModel v) => v.stock;
  static const Field<HcmStockSearchModel, StockSearchModel> _f$stock =
      Field('stock', _$stock);
  static String? _$boundaryCode(HcmStockSearchModel v) => v.boundaryCode;
  static const Field<HcmStockSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(HcmStockSearchModel v) => v.auditDetails;
  static const Field<HcmStockSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(HcmStockSearchModel v) =>
      v.additionalFields;
  static const Field<HcmStockSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<HcmStockSearchModel> fields = const {
    #stock: _f$stock,
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

  static HcmStockSearchModel _instantiate(DecodingData data) {
    return HcmStockSearchModel.ignoreDeleted(data.dec(_f$stock),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmStockSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HcmStockSearchModel>(map);
  }

  static HcmStockSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<HcmStockSearchModel>(json);
  }
}

mixin HcmStockSearchModelMappable {
  String toJson() {
    return HcmStockSearchModelMapper.ensureInitialized()
        .encodeJson<HcmStockSearchModel>(this as HcmStockSearchModel);
  }

  Map<String, dynamic> toMap() {
    return HcmStockSearchModelMapper.ensureInitialized()
        .encodeMap<HcmStockSearchModel>(this as HcmStockSearchModel);
  }

  HcmStockSearchModelCopyWith<HcmStockSearchModel, HcmStockSearchModel,
          HcmStockSearchModel>
      get copyWith => _HcmStockSearchModelCopyWithImpl(
          this as HcmStockSearchModel, $identity, $identity);
  @override
  String toString() {
    return HcmStockSearchModelMapper.ensureInitialized()
        .stringifyValue(this as HcmStockSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HcmStockSearchModelMapper.ensureInitialized()
                .isValueEqual(this as HcmStockSearchModel, other));
  }

  @override
  int get hashCode {
    return HcmStockSearchModelMapper.ensureInitialized()
        .hashValue(this as HcmStockSearchModel);
  }
}

extension HcmStockSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmStockSearchModel, $Out> {
  HcmStockSearchModelCopyWith<$R, HcmStockSearchModel, $Out>
      get $asHcmStockSearchModel =>
          $base.as((v, t, t2) => _HcmStockSearchModelCopyWithImpl(v, t, t2));
}

abstract class HcmStockSearchModelCopyWith<$R, $In extends HcmStockSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  StockSearchModelCopyWith<$R, StockSearchModel, StockSearchModel>? get stock;
  @override
  $R call({StockSearchModel? stock, String? boundaryCode});
  HcmStockSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HcmStockSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmStockSearchModel, $Out>
    implements HcmStockSearchModelCopyWith<$R, HcmStockSearchModel, $Out> {
  _HcmStockSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmStockSearchModel> $mapper =
      HcmStockSearchModelMapper.ensureInitialized();
  @override
  StockSearchModelCopyWith<$R, StockSearchModel, StockSearchModel>? get stock =>
      $value.stock?.copyWith.$chain((v) => call(stock: v));
  @override
  $R call({Object? stock = $none, Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (stock != $none) #stock: stock,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  HcmStockSearchModel $make(CopyWithData data) =>
      HcmStockSearchModel.ignoreDeleted(data.get(#stock, or: $value.stock),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  HcmStockSearchModelCopyWith<$R2, HcmStockSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HcmStockSearchModelCopyWithImpl($value, $cast, t);
}

class HcmStockModelMapper extends SubClassMapperBase<HcmStockModel> {
  HcmStockModelMapper._();

  static HcmStockModelMapper? _instance;
  static HcmStockModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HcmStockModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HcmStockModel';

  static StockAdditionalFields? _$additionalFields(HcmStockModel v) =>
      v.additionalFields;
  static const Field<HcmStockModel, StockAdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static StockModel? _$stock(HcmStockModel v) => v.stock;
  static const Field<HcmStockModel, StockModel> _f$stock =
      Field('stock', _$stock, opt: true);
  static AuditDetails? _$auditDetails(HcmStockModel v) => v.auditDetails;
  static const Field<HcmStockModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(HcmStockModel v) =>
      v.clientAuditDetails;
  static const Field<HcmStockModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(HcmStockModel v) => v.isDeleted;
  static const Field<HcmStockModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<HcmStockModel> fields = const {
    #additionalFields: _f$additionalFields,
    #stock: _f$stock,
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

  static HcmStockModel _instantiate(DecodingData data) {
    return HcmStockModel(
        additionalFields: data.dec(_f$additionalFields),
        stock: data.dec(_f$stock),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmStockModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HcmStockModel>(map);
  }

  static HcmStockModel fromJson(String json) {
    return ensureInitialized().decodeJson<HcmStockModel>(json);
  }
}

mixin HcmStockModelMappable {
  String toJson() {
    return HcmStockModelMapper.ensureInitialized()
        .encodeJson<HcmStockModel>(this as HcmStockModel);
  }

  Map<String, dynamic> toMap() {
    return HcmStockModelMapper.ensureInitialized()
        .encodeMap<HcmStockModel>(this as HcmStockModel);
  }

  HcmStockModelCopyWith<HcmStockModel, HcmStockModel, HcmStockModel>
      get copyWith => _HcmStockModelCopyWithImpl(
          this as HcmStockModel, $identity, $identity);
  @override
  String toString() {
    return HcmStockModelMapper.ensureInitialized()
        .stringifyValue(this as HcmStockModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HcmStockModelMapper.ensureInitialized()
                .isValueEqual(this as HcmStockModel, other));
  }

  @override
  int get hashCode {
    return HcmStockModelMapper.ensureInitialized()
        .hashValue(this as HcmStockModel);
  }
}

extension HcmStockModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmStockModel, $Out> {
  HcmStockModelCopyWith<$R, HcmStockModel, $Out> get $asHcmStockModel =>
      $base.as((v, t, t2) => _HcmStockModelCopyWithImpl(v, t, t2));
}

abstract class HcmStockModelCopyWith<$R, $In extends HcmStockModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  StockAdditionalFieldsCopyWith<$R, StockAdditionalFields,
      StockAdditionalFields>? get additionalFields;
  StockModelCopyWith<$R, StockModel, StockModel>? get stock;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {StockAdditionalFields? additionalFields,
      StockModel? stock,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  HcmStockModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HcmStockModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmStockModel, $Out>
    implements HcmStockModelCopyWith<$R, HcmStockModel, $Out> {
  _HcmStockModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmStockModel> $mapper =
      HcmStockModelMapper.ensureInitialized();
  @override
  StockAdditionalFieldsCopyWith<$R, StockAdditionalFields,
          StockAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  StockModelCopyWith<$R, StockModel, StockModel>? get stock =>
      $value.stock?.copyWith.$chain((v) => call(stock: v));
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
          Object? stock = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (stock != $none) #stock: stock,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  HcmStockModel $make(CopyWithData data) => HcmStockModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      stock: data.get(#stock, or: $value.stock),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  HcmStockModelCopyWith<$R2, HcmStockModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HcmStockModelCopyWithImpl($value, $cast, t);
}

class StockAdditionalFieldsMapper
    extends SubClassMapperBase<StockAdditionalFields> {
  StockAdditionalFieldsMapper._();

  static StockAdditionalFieldsMapper? _instance;
  static StockAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StockAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StockAdditionalFields';

  static String _$schema(StockAdditionalFields v) => v.schema;
  static const Field<StockAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Stock');
  static int _$version(StockAdditionalFields v) => v.version;
  static const Field<StockAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(StockAdditionalFields v) => v.fields;
  static const Field<StockAdditionalFields, List<AdditionalField>> _f$fields =
      Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<StockAdditionalFields> fields = const {
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

  static StockAdditionalFields _instantiate(DecodingData data) {
    return StockAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static StockAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StockAdditionalFields>(map);
  }

  static StockAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<StockAdditionalFields>(json);
  }
}

mixin StockAdditionalFieldsMappable {
  String toJson() {
    return StockAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<StockAdditionalFields>(this as StockAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return StockAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<StockAdditionalFields>(this as StockAdditionalFields);
  }

  StockAdditionalFieldsCopyWith<StockAdditionalFields, StockAdditionalFields,
          StockAdditionalFields>
      get copyWith => _StockAdditionalFieldsCopyWithImpl(
          this as StockAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return StockAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as StockAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StockAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as StockAdditionalFields, other));
  }

  @override
  int get hashCode {
    return StockAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as StockAdditionalFields);
  }
}

extension StockAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StockAdditionalFields, $Out> {
  StockAdditionalFieldsCopyWith<$R, StockAdditionalFields, $Out>
      get $asStockAdditionalFields =>
          $base.as((v, t, t2) => _StockAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class StockAdditionalFieldsCopyWith<
    $R,
    $In extends StockAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  StockAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StockAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StockAdditionalFields, $Out>
    implements StockAdditionalFieldsCopyWith<$R, StockAdditionalFields, $Out> {
  _StockAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StockAdditionalFields> $mapper =
      StockAdditionalFieldsMapper.ensureInitialized();
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
  StockAdditionalFields $make(CopyWithData data) => StockAdditionalFields(
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version),
      fields: data.get(#fields, or: $value.fields));

  @override
  StockAdditionalFieldsCopyWith<$R2, StockAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _StockAdditionalFieldsCopyWithImpl($value, $cast, t);
}

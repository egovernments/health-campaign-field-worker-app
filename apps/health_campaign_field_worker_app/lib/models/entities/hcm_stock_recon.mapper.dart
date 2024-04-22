// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hcm_stock_recon.dart';

class HcmStockReconciliationSearchModelMapper
    extends SubClassMapperBase<HcmStockReconciliationSearchModel> {
  HcmStockReconciliationSearchModelMapper._();

  static HcmStockReconciliationSearchModelMapper? _instance;
  static HcmStockReconciliationSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HcmStockReconciliationSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HcmStockReconciliationSearchModel';

  static StockReconciliationSearchModel? _$stockReconciliationSearchModel(
          HcmStockReconciliationSearchModel v) =>
      v.stockReconciliationSearchModel;
  static const Field<HcmStockReconciliationSearchModel,
          StockReconciliationSearchModel> _f$stockReconciliationSearchModel =
      Field('stockReconciliationSearchModel', _$stockReconciliationSearchModel,
          opt: true);
  static String? _$boundaryCode(HcmStockReconciliationSearchModel v) =>
      v.boundaryCode;
  static const Field<HcmStockReconciliationSearchModel, String>
      _f$boundaryCode = Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(HcmStockReconciliationSearchModel v) =>
      v.auditDetails;
  static const Field<HcmStockReconciliationSearchModel, AuditDetails>
      _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(
          HcmStockReconciliationSearchModel v) =>
      v.additionalFields;
  static const Field<HcmStockReconciliationSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<HcmStockReconciliationSearchModel> fields = const {
    #stockReconciliationSearchModel: _f$stockReconciliationSearchModel,
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

  static HcmStockReconciliationSearchModel _instantiate(DecodingData data) {
    return HcmStockReconciliationSearchModel.ignoreDeleted(
        stockReconciliationSearchModel:
            data.dec(_f$stockReconciliationSearchModel),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmStockReconciliationSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<HcmStockReconciliationSearchModel>(map);
  }

  static HcmStockReconciliationSearchModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<HcmStockReconciliationSearchModel>(json);
  }
}

mixin HcmStockReconciliationSearchModelMappable {
  String toJson() {
    return HcmStockReconciliationSearchModelMapper.ensureInitialized()
        .encodeJson<HcmStockReconciliationSearchModel>(
            this as HcmStockReconciliationSearchModel);
  }

  Map<String, dynamic> toMap() {
    return HcmStockReconciliationSearchModelMapper.ensureInitialized()
        .encodeMap<HcmStockReconciliationSearchModel>(
            this as HcmStockReconciliationSearchModel);
  }

  HcmStockReconciliationSearchModelCopyWith<HcmStockReconciliationSearchModel,
          HcmStockReconciliationSearchModel, HcmStockReconciliationSearchModel>
      get copyWith => _HcmStockReconciliationSearchModelCopyWithImpl(
          this as HcmStockReconciliationSearchModel, $identity, $identity);
  @override
  String toString() {
    return HcmStockReconciliationSearchModelMapper.ensureInitialized()
        .stringifyValue(this as HcmStockReconciliationSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HcmStockReconciliationSearchModelMapper.ensureInitialized()
                .isValueEqual(
                    this as HcmStockReconciliationSearchModel, other));
  }

  @override
  int get hashCode {
    return HcmStockReconciliationSearchModelMapper.ensureInitialized()
        .hashValue(this as HcmStockReconciliationSearchModel);
  }
}

extension HcmStockReconciliationSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmStockReconciliationSearchModel, $Out> {
  HcmStockReconciliationSearchModelCopyWith<$R,
          HcmStockReconciliationSearchModel, $Out>
      get $asHcmStockReconciliationSearchModel => $base.as((v, t, t2) =>
          _HcmStockReconciliationSearchModelCopyWithImpl(v, t, t2));
}

abstract class HcmStockReconciliationSearchModelCopyWith<
    $R,
    $In extends HcmStockReconciliationSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  StockReconciliationSearchModelCopyWith<$R, StockReconciliationSearchModel,
      StockReconciliationSearchModel>? get stockReconciliationSearchModel;
  @override
  $R call(
      {StockReconciliationSearchModel? stockReconciliationSearchModel,
      String? boundaryCode});
  HcmStockReconciliationSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HcmStockReconciliationSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmStockReconciliationSearchModel, $Out>
    implements
        HcmStockReconciliationSearchModelCopyWith<$R,
            HcmStockReconciliationSearchModel, $Out> {
  _HcmStockReconciliationSearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmStockReconciliationSearchModel> $mapper =
      HcmStockReconciliationSearchModelMapper.ensureInitialized();
  @override
  StockReconciliationSearchModelCopyWith<$R, StockReconciliationSearchModel,
          StockReconciliationSearchModel>?
      get stockReconciliationSearchModel =>
          $value.stockReconciliationSearchModel?.copyWith
              .$chain((v) => call(stockReconciliationSearchModel: v));
  @override
  $R call(
          {Object? stockReconciliationSearchModel = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (stockReconciliationSearchModel != $none)
          #stockReconciliationSearchModel: stockReconciliationSearchModel,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  HcmStockReconciliationSearchModel $make(CopyWithData data) =>
      HcmStockReconciliationSearchModel.ignoreDeleted(
          stockReconciliationSearchModel: data.get(
              #stockReconciliationSearchModel,
              or: $value.stockReconciliationSearchModel),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  HcmStockReconciliationSearchModelCopyWith<$R2,
      HcmStockReconciliationSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HcmStockReconciliationSearchModelCopyWithImpl($value, $cast, t);
}

class HcmStockReconciliationModelMapper
    extends SubClassMapperBase<HcmStockReconciliationModel> {
  HcmStockReconciliationModelMapper._();

  static HcmStockReconciliationModelMapper? _instance;
  static HcmStockReconciliationModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HcmStockReconciliationModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HcmStockReconciliationModel';

  static StockReconciliationAdditionalFields? _$additionalFields(
          HcmStockReconciliationModel v) =>
      v.additionalFields;
  static const Field<HcmStockReconciliationModel,
          StockReconciliationAdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static StockReconciliationModel? _$stockReconciliation(
          HcmStockReconciliationModel v) =>
      v.stockReconciliation;
  static const Field<HcmStockReconciliationModel, StockReconciliationModel>
      _f$stockReconciliation =
      Field('stockReconciliation', _$stockReconciliation, opt: true);
  static AuditDetails? _$auditDetails(HcmStockReconciliationModel v) =>
      v.auditDetails;
  static const Field<HcmStockReconciliationModel, AuditDetails>
      _f$auditDetails = Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(
          HcmStockReconciliationModel v) =>
      v.clientAuditDetails;
  static const Field<HcmStockReconciliationModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(HcmStockReconciliationModel v) => v.isDeleted;
  static const Field<HcmStockReconciliationModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<HcmStockReconciliationModel> fields = const {
    #additionalFields: _f$additionalFields,
    #stockReconciliation: _f$stockReconciliation,
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

  static HcmStockReconciliationModel _instantiate(DecodingData data) {
    return HcmStockReconciliationModel(
        additionalFields: data.dec(_f$additionalFields),
        stockReconciliation: data.dec(_f$stockReconciliation),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmStockReconciliationModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HcmStockReconciliationModel>(map);
  }

  static HcmStockReconciliationModel fromJson(String json) {
    return ensureInitialized().decodeJson<HcmStockReconciliationModel>(json);
  }
}

mixin HcmStockReconciliationModelMappable {
  String toJson() {
    return HcmStockReconciliationModelMapper.ensureInitialized()
        .encodeJson<HcmStockReconciliationModel>(
            this as HcmStockReconciliationModel);
  }

  Map<String, dynamic> toMap() {
    return HcmStockReconciliationModelMapper.ensureInitialized()
        .encodeMap<HcmStockReconciliationModel>(
            this as HcmStockReconciliationModel);
  }

  HcmStockReconciliationModelCopyWith<HcmStockReconciliationModel,
          HcmStockReconciliationModel, HcmStockReconciliationModel>
      get copyWith => _HcmStockReconciliationModelCopyWithImpl(
          this as HcmStockReconciliationModel, $identity, $identity);
  @override
  String toString() {
    return HcmStockReconciliationModelMapper.ensureInitialized()
        .stringifyValue(this as HcmStockReconciliationModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HcmStockReconciliationModelMapper.ensureInitialized()
                .isValueEqual(this as HcmStockReconciliationModel, other));
  }

  @override
  int get hashCode {
    return HcmStockReconciliationModelMapper.ensureInitialized()
        .hashValue(this as HcmStockReconciliationModel);
  }
}

extension HcmStockReconciliationModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmStockReconciliationModel, $Out> {
  HcmStockReconciliationModelCopyWith<$R, HcmStockReconciliationModel, $Out>
      get $asHcmStockReconciliationModel => $base
          .as((v, t, t2) => _HcmStockReconciliationModelCopyWithImpl(v, t, t2));
}

abstract class HcmStockReconciliationModelCopyWith<
    $R,
    $In extends HcmStockReconciliationModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  StockReconciliationAdditionalFieldsCopyWith<
      $R,
      StockReconciliationAdditionalFields,
      StockReconciliationAdditionalFields>? get additionalFields;
  StockReconciliationModelCopyWith<$R, StockReconciliationModel,
      StockReconciliationModel>? get stockReconciliation;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {StockReconciliationAdditionalFields? additionalFields,
      StockReconciliationModel? stockReconciliation,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  HcmStockReconciliationModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HcmStockReconciliationModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmStockReconciliationModel, $Out>
    implements
        HcmStockReconciliationModelCopyWith<$R, HcmStockReconciliationModel,
            $Out> {
  _HcmStockReconciliationModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmStockReconciliationModel> $mapper =
      HcmStockReconciliationModelMapper.ensureInitialized();
  @override
  StockReconciliationAdditionalFieldsCopyWith<
          $R,
          StockReconciliationAdditionalFields,
          StockReconciliationAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  StockReconciliationModelCopyWith<$R, StockReconciliationModel,
          StockReconciliationModel>?
      get stockReconciliation => $value.stockReconciliation?.copyWith
          .$chain((v) => call(stockReconciliation: v));
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
          Object? stockReconciliation = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (stockReconciliation != $none)
          #stockReconciliation: stockReconciliation,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  HcmStockReconciliationModel $make(CopyWithData data) =>
      HcmStockReconciliationModel(
          additionalFields:
              data.get(#additionalFields, or: $value.additionalFields),
          stockReconciliation:
              data.get(#stockReconciliation, or: $value.stockReconciliation),
          auditDetails: data.get(#auditDetails, or: $value.auditDetails),
          clientAuditDetails:
              data.get(#clientAuditDetails, or: $value.clientAuditDetails),
          isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  HcmStockReconciliationModelCopyWith<$R2, HcmStockReconciliationModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HcmStockReconciliationModelCopyWithImpl($value, $cast, t);
}

class StockReconciliationAdditionalFieldsMapper
    extends SubClassMapperBase<StockReconciliationAdditionalFields> {
  StockReconciliationAdditionalFieldsMapper._();

  static StockReconciliationAdditionalFieldsMapper? _instance;
  static StockReconciliationAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = StockReconciliationAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StockReconciliationAdditionalFields';

  static String _$schema(StockReconciliationAdditionalFields v) => v.schema;
  static const Field<StockReconciliationAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'StockReconciliation');
  static int _$version(StockReconciliationAdditionalFields v) => v.version;
  static const Field<StockReconciliationAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(
          StockReconciliationAdditionalFields v) =>
      v.fields;
  static const Field<StockReconciliationAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<StockReconciliationAdditionalFields> fields = const {
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

  static StockReconciliationAdditionalFields _instantiate(DecodingData data) {
    return StockReconciliationAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static StockReconciliationAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<StockReconciliationAdditionalFields>(map);
  }

  static StockReconciliationAdditionalFields fromJson(String json) {
    return ensureInitialized()
        .decodeJson<StockReconciliationAdditionalFields>(json);
  }
}

mixin StockReconciliationAdditionalFieldsMappable {
  String toJson() {
    return StockReconciliationAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<StockReconciliationAdditionalFields>(
            this as StockReconciliationAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return StockReconciliationAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<StockReconciliationAdditionalFields>(
            this as StockReconciliationAdditionalFields);
  }

  StockReconciliationAdditionalFieldsCopyWith<
          StockReconciliationAdditionalFields,
          StockReconciliationAdditionalFields,
          StockReconciliationAdditionalFields>
      get copyWith => _StockReconciliationAdditionalFieldsCopyWithImpl(
          this as StockReconciliationAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return StockReconciliationAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as StockReconciliationAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StockReconciliationAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(
                    this as StockReconciliationAdditionalFields, other));
  }

  @override
  int get hashCode {
    return StockReconciliationAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as StockReconciliationAdditionalFields);
  }
}

extension StockReconciliationAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StockReconciliationAdditionalFields, $Out> {
  StockReconciliationAdditionalFieldsCopyWith<$R,
          StockReconciliationAdditionalFields, $Out>
      get $asStockReconciliationAdditionalFields => $base.as((v, t, t2) =>
          _StockReconciliationAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class StockReconciliationAdditionalFieldsCopyWith<
    $R,
    $In extends StockReconciliationAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  StockReconciliationAdditionalFieldsCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StockReconciliationAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StockReconciliationAdditionalFields, $Out>
    implements
        StockReconciliationAdditionalFieldsCopyWith<$R,
            StockReconciliationAdditionalFields, $Out> {
  _StockReconciliationAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StockReconciliationAdditionalFields> $mapper =
      StockReconciliationAdditionalFieldsMapper.ensureInitialized();
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
  StockReconciliationAdditionalFields $make(CopyWithData data) =>
      StockReconciliationAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  StockReconciliationAdditionalFieldsCopyWith<$R2,
      StockReconciliationAdditionalFields, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StockReconciliationAdditionalFieldsCopyWithImpl($value, $cast, t);
}

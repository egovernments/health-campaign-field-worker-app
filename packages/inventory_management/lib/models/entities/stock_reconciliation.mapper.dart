// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'stock_reconciliation.dart';

class StockReconciliationSearchModelMapper
    extends ClassMapperBase<StockReconciliationSearchModel> {
  StockReconciliationSearchModelMapper._();

  static StockReconciliationSearchModelMapper? _instance;
  static StockReconciliationSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = StockReconciliationSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StockReconciliationSearchModel';

  static String? _$id(StockReconciliationSearchModel v) => v.id;
  static const Field<StockReconciliationSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(StockReconciliationSearchModel v) => v.tenantId;
  static const Field<StockReconciliationSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$facilityId(StockReconciliationSearchModel v) => v.facilityId;
  static const Field<StockReconciliationSearchModel, String> _f$facilityId =
      Field('facilityId', _$facilityId, opt: true);
  static String? _$productVariantId(StockReconciliationSearchModel v) =>
      v.productVariantId;
  static const Field<StockReconciliationSearchModel, String>
      _f$productVariantId =
      Field('productVariantId', _$productVariantId, opt: true);
  static List<String>? _$clientReferenceId(StockReconciliationSearchModel v) =>
      v.clientReferenceId;
  static const Field<StockReconciliationSearchModel, List<String>>
      _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static int? _$dateOfReconciliation(StockReconciliationSearchModel v) =>
      v.dateOfReconciliation;
  static const Field<StockReconciliationSearchModel, int>
      _f$dateOfReconciliation =
      Field('dateOfReconciliation', _$dateOfReconciliation, opt: true);
  static DateTime? _$dateOfReconciliationTime(
          StockReconciliationSearchModel v) =>
      v.dateOfReconciliationTime;
  static const Field<StockReconciliationSearchModel, DateTime>
      _f$dateOfReconciliationTime = Field(
          'dateOfReconciliationTime', _$dateOfReconciliationTime,
          mode: FieldMode.member);

  @override
  final MappableFields<StockReconciliationSearchModel> fields = const {
    #id: _f$id,
    #tenantId: _f$tenantId,
    #facilityId: _f$facilityId,
    #productVariantId: _f$productVariantId,
    #clientReferenceId: _f$clientReferenceId,
    #dateOfReconciliation: _f$dateOfReconciliation,
    #dateOfReconciliationTime: _f$dateOfReconciliationTime,
  };
  @override
  final bool ignoreNull = true;

  static StockReconciliationSearchModel _instantiate(DecodingData data) {
    return StockReconciliationSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        facilityId: data.dec(_f$facilityId),
        productVariantId: data.dec(_f$productVariantId),
        clientReferenceId: data.dec(_f$clientReferenceId),
        dateOfReconciliation: data.dec(_f$dateOfReconciliation));
  }

  @override
  final Function instantiate = _instantiate;

  static StockReconciliationSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StockReconciliationSearchModel>(map);
  }

  static StockReconciliationSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<StockReconciliationSearchModel>(json);
  }
}

mixin StockReconciliationSearchModelMappable {
  String toJson() {
    return StockReconciliationSearchModelMapper.ensureInitialized()
        .encodeJson<StockReconciliationSearchModel>(
            this as StockReconciliationSearchModel);
  }

  Map<String, dynamic> toMap() {
    return StockReconciliationSearchModelMapper.ensureInitialized()
        .encodeMap<StockReconciliationSearchModel>(
            this as StockReconciliationSearchModel);
  }

  StockReconciliationSearchModelCopyWith<StockReconciliationSearchModel,
          StockReconciliationSearchModel, StockReconciliationSearchModel>
      get copyWith => _StockReconciliationSearchModelCopyWithImpl(
          this as StockReconciliationSearchModel, $identity, $identity);
  @override
  String toString() {
    return StockReconciliationSearchModelMapper.ensureInitialized()
        .stringifyValue(this as StockReconciliationSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StockReconciliationSearchModelMapper.ensureInitialized()
                .isValueEqual(this as StockReconciliationSearchModel, other));
  }

  @override
  int get hashCode {
    return StockReconciliationSearchModelMapper.ensureInitialized()
        .hashValue(this as StockReconciliationSearchModel);
  }
}

extension StockReconciliationSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StockReconciliationSearchModel, $Out> {
  StockReconciliationSearchModelCopyWith<$R, StockReconciliationSearchModel,
          $Out>
      get $asStockReconciliationSearchModel => $base.as(
          (v, t, t2) => _StockReconciliationSearchModelCopyWithImpl(v, t, t2));
}

abstract class StockReconciliationSearchModelCopyWith<
    $R,
    $In extends StockReconciliationSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  $R call(
      {String? id,
      String? tenantId,
      String? facilityId,
      String? productVariantId,
      List<String>? clientReferenceId,
      int? dateOfReconciliation});
  StockReconciliationSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StockReconciliationSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StockReconciliationSearchModel, $Out>
    implements
        StockReconciliationSearchModelCopyWith<$R,
            StockReconciliationSearchModel, $Out> {
  _StockReconciliationSearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StockReconciliationSearchModel> $mapper =
      StockReconciliationSearchModelMapper.ensureInitialized();
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
          Object? tenantId = $none,
          Object? facilityId = $none,
          Object? productVariantId = $none,
          Object? clientReferenceId = $none,
          Object? dateOfReconciliation = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (facilityId != $none) #facilityId: facilityId,
        if (productVariantId != $none) #productVariantId: productVariantId,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (dateOfReconciliation != $none)
          #dateOfReconciliation: dateOfReconciliation
      }));
  @override
  StockReconciliationSearchModel $make(CopyWithData data) =>
      StockReconciliationSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          facilityId: data.get(#facilityId, or: $value.facilityId),
          productVariantId:
              data.get(#productVariantId, or: $value.productVariantId),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          dateOfReconciliation:
              data.get(#dateOfReconciliation, or: $value.dateOfReconciliation));

  @override
  StockReconciliationSearchModelCopyWith<$R2, StockReconciliationSearchModel,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StockReconciliationSearchModelCopyWithImpl($value, $cast, t);
}

class StockReconciliationModelMapper
    extends ClassMapperBase<StockReconciliationModel> {
  StockReconciliationModelMapper._();

  static StockReconciliationModelMapper? _instance;
  static StockReconciliationModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = StockReconciliationModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StockReconciliationModel';

  static String? _$id(StockReconciliationModel v) => v.id;
  static const Field<StockReconciliationModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(StockReconciliationModel v) => v.tenantId;
  static const Field<StockReconciliationModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$facilityId(StockReconciliationModel v) => v.facilityId;
  static const Field<StockReconciliationModel, String> _f$facilityId =
      Field('facilityId', _$facilityId, opt: true);
  static String? _$productVariantId(StockReconciliationModel v) =>
      v.productVariantId;
  static const Field<StockReconciliationModel, String> _f$productVariantId =
      Field('productVariantId', _$productVariantId, opt: true);
  static String? _$referenceId(StockReconciliationModel v) => v.referenceId;
  static const Field<StockReconciliationModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$referenceIdType(StockReconciliationModel v) =>
      v.referenceIdType;
  static const Field<StockReconciliationModel, String> _f$referenceIdType =
      Field('referenceIdType', _$referenceIdType, opt: true);
  static int? _$physicalCount(StockReconciliationModel v) => v.physicalCount;
  static const Field<StockReconciliationModel, int> _f$physicalCount =
      Field('physicalCount', _$physicalCount, opt: true);
  static int? _$calculatedCount(StockReconciliationModel v) =>
      v.calculatedCount;
  static const Field<StockReconciliationModel, int> _f$calculatedCount =
      Field('calculatedCount', _$calculatedCount, opt: true);
  static String? _$commentsOnReconciliation(StockReconciliationModel v) =>
      v.commentsOnReconciliation;
  static const Field<StockReconciliationModel, String>
      _f$commentsOnReconciliation =
      Field('commentsOnReconciliation', _$commentsOnReconciliation, opt: true);
  static bool? _$nonRecoverableError(StockReconciliationModel v) =>
      v.nonRecoverableError;
  static const Field<StockReconciliationModel, bool> _f$nonRecoverableError =
      Field('nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static String _$clientReferenceId(StockReconciliationModel v) =>
      v.clientReferenceId;
  static const Field<StockReconciliationModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static int? _$rowVersion(StockReconciliationModel v) => v.rowVersion;
  static const Field<StockReconciliationModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static int _$dateOfReconciliation(StockReconciliationModel v) =>
      v.dateOfReconciliation;
  static const Field<StockReconciliationModel, int> _f$dateOfReconciliation =
      Field('dateOfReconciliation', _$dateOfReconciliation);
  static DateTime _$dateOfReconciliationTime(StockReconciliationModel v) =>
      v.dateOfReconciliationTime;
  static const Field<StockReconciliationModel, DateTime>
      _f$dateOfReconciliationTime = Field(
          'dateOfReconciliationTime', _$dateOfReconciliationTime,
          mode: FieldMode.member);

  @override
  final MappableFields<StockReconciliationModel> fields = const {
    #id: _f$id,
    #tenantId: _f$tenantId,
    #facilityId: _f$facilityId,
    #productVariantId: _f$productVariantId,
    #referenceId: _f$referenceId,
    #referenceIdType: _f$referenceIdType,
    #physicalCount: _f$physicalCount,
    #calculatedCount: _f$calculatedCount,
    #commentsOnReconciliation: _f$commentsOnReconciliation,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
    #rowVersion: _f$rowVersion,
    #dateOfReconciliation: _f$dateOfReconciliation,
    #dateOfReconciliationTime: _f$dateOfReconciliationTime,
  };
  @override
  final bool ignoreNull = true;

  static StockReconciliationModel _instantiate(DecodingData data) {
    return StockReconciliationModel(
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        facilityId: data.dec(_f$facilityId),
        productVariantId: data.dec(_f$productVariantId),
        referenceId: data.dec(_f$referenceId),
        referenceIdType: data.dec(_f$referenceIdType),
        physicalCount: data.dec(_f$physicalCount),
        calculatedCount: data.dec(_f$calculatedCount),
        commentsOnReconciliation: data.dec(_f$commentsOnReconciliation),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        rowVersion: data.dec(_f$rowVersion),
        dateOfReconciliation: data.dec(_f$dateOfReconciliation));
  }

  @override
  final Function instantiate = _instantiate;

  static StockReconciliationModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StockReconciliationModel>(map);
  }

  static StockReconciliationModel fromJson(String json) {
    return ensureInitialized().decodeJson<StockReconciliationModel>(json);
  }
}

mixin StockReconciliationModelMappable {
  String toJson() {
    return StockReconciliationModelMapper.ensureInitialized()
        .encodeJson<StockReconciliationModel>(this as StockReconciliationModel);
  }

  Map<String, dynamic> toMap() {
    return StockReconciliationModelMapper.ensureInitialized()
        .encodeMap<StockReconciliationModel>(this as StockReconciliationModel);
  }

  StockReconciliationModelCopyWith<StockReconciliationModel,
          StockReconciliationModel, StockReconciliationModel>
      get copyWith => _StockReconciliationModelCopyWithImpl(
          this as StockReconciliationModel, $identity, $identity);
  @override
  String toString() {
    return StockReconciliationModelMapper.ensureInitialized()
        .stringifyValue(this as StockReconciliationModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StockReconciliationModelMapper.ensureInitialized()
                .isValueEqual(this as StockReconciliationModel, other));
  }

  @override
  int get hashCode {
    return StockReconciliationModelMapper.ensureInitialized()
        .hashValue(this as StockReconciliationModel);
  }
}

extension StockReconciliationModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StockReconciliationModel, $Out> {
  StockReconciliationModelCopyWith<$R, StockReconciliationModel, $Out>
      get $asStockReconciliationModel => $base
          .as((v, t, t2) => _StockReconciliationModelCopyWithImpl(v, t, t2));
}

abstract class StockReconciliationModelCopyWith<
    $R,
    $In extends StockReconciliationModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? tenantId,
      String? facilityId,
      String? productVariantId,
      String? referenceId,
      String? referenceIdType,
      int? physicalCount,
      int? calculatedCount,
      String? commentsOnReconciliation,
      bool? nonRecoverableError,
      String? clientReferenceId,
      int? rowVersion,
      int? dateOfReconciliation});
  StockReconciliationModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StockReconciliationModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StockReconciliationModel, $Out>
    implements
        StockReconciliationModelCopyWith<$R, StockReconciliationModel, $Out> {
  _StockReconciliationModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StockReconciliationModel> $mapper =
      StockReconciliationModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? tenantId = $none,
          Object? facilityId = $none,
          Object? productVariantId = $none,
          Object? referenceId = $none,
          Object? referenceIdType = $none,
          Object? physicalCount = $none,
          Object? calculatedCount = $none,
          Object? commentsOnReconciliation = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? rowVersion = $none,
          int? dateOfReconciliation}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (facilityId != $none) #facilityId: facilityId,
        if (productVariantId != $none) #productVariantId: productVariantId,
        if (referenceId != $none) #referenceId: referenceId,
        if (referenceIdType != $none) #referenceIdType: referenceIdType,
        if (physicalCount != $none) #physicalCount: physicalCount,
        if (calculatedCount != $none) #calculatedCount: calculatedCount,
        if (commentsOnReconciliation != $none)
          #commentsOnReconciliation: commentsOnReconciliation,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (dateOfReconciliation != null)
          #dateOfReconciliation: dateOfReconciliation
      }));
  @override
  StockReconciliationModel $make(CopyWithData data) => StockReconciliationModel(
      id: data.get(#id, or: $value.id),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      facilityId: data.get(#facilityId, or: $value.facilityId),
      productVariantId:
          data.get(#productVariantId, or: $value.productVariantId),
      referenceId: data.get(#referenceId, or: $value.referenceId),
      referenceIdType: data.get(#referenceIdType, or: $value.referenceIdType),
      physicalCount: data.get(#physicalCount, or: $value.physicalCount),
      calculatedCount: data.get(#calculatedCount, or: $value.calculatedCount),
      commentsOnReconciliation: data.get(#commentsOnReconciliation,
          or: $value.commentsOnReconciliation),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      dateOfReconciliation:
          data.get(#dateOfReconciliation, or: $value.dateOfReconciliation));

  @override
  StockReconciliationModelCopyWith<$R2, StockReconciliationModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _StockReconciliationModelCopyWithImpl($value, $cast, t);
}

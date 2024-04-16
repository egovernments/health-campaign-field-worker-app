// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product_variant.dart';

class ProductVariantSearchModelMapper
    extends ClassMapperBase<ProductVariantSearchModel> {
  ProductVariantSearchModelMapper._();

  static ProductVariantSearchModelMapper? _instance;
  static ProductVariantSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProductVariantSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductVariantSearchModel';

  static List<String>? _$id(ProductVariantSearchModel v) => v.id;
  static const Field<ProductVariantSearchModel, List<String>> _f$id =
      Field('id', _$id, opt: true);
  static String? _$productId(ProductVariantSearchModel v) => v.productId;
  static const Field<ProductVariantSearchModel, String> _f$productId =
      Field('productId', _$productId, opt: true);
  static String? _$sku(ProductVariantSearchModel v) => v.sku;
  static const Field<ProductVariantSearchModel, String> _f$sku =
      Field('sku', _$sku, opt: true);
  static String? _$variation(ProductVariantSearchModel v) => v.variation;
  static const Field<ProductVariantSearchModel, String> _f$variation =
      Field('variation', _$variation, opt: true);
  static String? _$tenantId(ProductVariantSearchModel v) => v.tenantId;
  static const Field<ProductVariantSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);

  @override
  final MappableFields<ProductVariantSearchModel> fields = const {
    #id: _f$id,
    #productId: _f$productId,
    #sku: _f$sku,
    #variation: _f$variation,
    #tenantId: _f$tenantId,
  };
  @override
  final bool ignoreNull = true;

  static ProductVariantSearchModel _instantiate(DecodingData data) {
    return ProductVariantSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        productId: data.dec(_f$productId),
        sku: data.dec(_f$sku),
        variation: data.dec(_f$variation),
        tenantId: data.dec(_f$tenantId));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductVariantSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductVariantSearchModel>(map);
  }

  static ProductVariantSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProductVariantSearchModel>(json);
  }
}

mixin ProductVariantSearchModelMappable {
  String toJson() {
    return ProductVariantSearchModelMapper.ensureInitialized()
        .encodeJson<ProductVariantSearchModel>(
            this as ProductVariantSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ProductVariantSearchModelMapper.ensureInitialized()
        .encodeMap<ProductVariantSearchModel>(
            this as ProductVariantSearchModel);
  }

  ProductVariantSearchModelCopyWith<ProductVariantSearchModel,
          ProductVariantSearchModel, ProductVariantSearchModel>
      get copyWith => _ProductVariantSearchModelCopyWithImpl(
          this as ProductVariantSearchModel, $identity, $identity);
  @override
  String toString() {
    return ProductVariantSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ProductVariantSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProductVariantSearchModelMapper.ensureInitialized()
                .isValueEqual(this as ProductVariantSearchModel, other));
  }

  @override
  int get hashCode {
    return ProductVariantSearchModelMapper.ensureInitialized()
        .hashValue(this as ProductVariantSearchModel);
  }
}

extension ProductVariantSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductVariantSearchModel, $Out> {
  ProductVariantSearchModelCopyWith<$R, ProductVariantSearchModel, $Out>
      get $asProductVariantSearchModel => $base
          .as((v, t, t2) => _ProductVariantSearchModelCopyWithImpl(v, t, t2));
}

abstract class ProductVariantSearchModelCopyWith<
    $R,
    $In extends ProductVariantSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id;
  $R call(
      {List<String>? id,
      String? productId,
      String? sku,
      String? variation,
      String? tenantId});
  ProductVariantSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProductVariantSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductVariantSearchModel, $Out>
    implements
        ProductVariantSearchModelCopyWith<$R, ProductVariantSearchModel, $Out> {
  _ProductVariantSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductVariantSearchModel> $mapper =
      ProductVariantSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id =>
      $value.id != null
          ? ListCopyWith($value.id!, (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(id: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? productId = $none,
          Object? sku = $none,
          Object? variation = $none,
          Object? tenantId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (productId != $none) #productId: productId,
        if (sku != $none) #sku: sku,
        if (variation != $none) #variation: variation,
        if (tenantId != $none) #tenantId: tenantId
      }));
  @override
  ProductVariantSearchModel $make(CopyWithData data) =>
      ProductVariantSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          productId: data.get(#productId, or: $value.productId),
          sku: data.get(#sku, or: $value.sku),
          variation: data.get(#variation, or: $value.variation),
          tenantId: data.get(#tenantId, or: $value.tenantId));

  @override
  ProductVariantSearchModelCopyWith<$R2, ProductVariantSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProductVariantSearchModelCopyWithImpl($value, $cast, t);
}

class ProductVariantModelMapper extends ClassMapperBase<ProductVariantModel> {
  ProductVariantModelMapper._();

  static ProductVariantModelMapper? _instance;
  static ProductVariantModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductVariantModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductVariantModel';

  static String _$id(ProductVariantModel v) => v.id;
  static const Field<ProductVariantModel, String> _f$id = Field('id', _$id);
  static String? _$productId(ProductVariantModel v) => v.productId;
  static const Field<ProductVariantModel, String> _f$productId =
      Field('productId', _$productId, opt: true);
  static String? _$sku(ProductVariantModel v) => v.sku;
  static const Field<ProductVariantModel, String> _f$sku =
      Field('sku', _$sku, opt: true);
  static String? _$variation(ProductVariantModel v) => v.variation;
  static const Field<ProductVariantModel, String> _f$variation =
      Field('variation', _$variation, opt: true);
  static bool? _$nonRecoverableError(ProductVariantModel v) =>
      v.nonRecoverableError;
  static const Field<ProductVariantModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(ProductVariantModel v) => v.tenantId;
  static const Field<ProductVariantModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ProductVariantModel v) => v.rowVersion;
  static const Field<ProductVariantModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);

  @override
  final MappableFields<ProductVariantModel> fields = const {
    #id: _f$id,
    #productId: _f$productId,
    #sku: _f$sku,
    #variation: _f$variation,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
  };
  @override
  final bool ignoreNull = true;

  static ProductVariantModel _instantiate(DecodingData data) {
    return ProductVariantModel(
        id: data.dec(_f$id),
        productId: data.dec(_f$productId),
        sku: data.dec(_f$sku),
        variation: data.dec(_f$variation),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductVariantModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductVariantModel>(map);
  }

  static ProductVariantModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProductVariantModel>(json);
  }
}

mixin ProductVariantModelMappable {
  String toJson() {
    return ProductVariantModelMapper.ensureInitialized()
        .encodeJson<ProductVariantModel>(this as ProductVariantModel);
  }

  Map<String, dynamic> toMap() {
    return ProductVariantModelMapper.ensureInitialized()
        .encodeMap<ProductVariantModel>(this as ProductVariantModel);
  }

  ProductVariantModelCopyWith<ProductVariantModel, ProductVariantModel,
          ProductVariantModel>
      get copyWith => _ProductVariantModelCopyWithImpl(
          this as ProductVariantModel, $identity, $identity);
  @override
  String toString() {
    return ProductVariantModelMapper.ensureInitialized()
        .stringifyValue(this as ProductVariantModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProductVariantModelMapper.ensureInitialized()
                .isValueEqual(this as ProductVariantModel, other));
  }

  @override
  int get hashCode {
    return ProductVariantModelMapper.ensureInitialized()
        .hashValue(this as ProductVariantModel);
  }
}

extension ProductVariantModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductVariantModel, $Out> {
  ProductVariantModelCopyWith<$R, ProductVariantModel, $Out>
      get $asProductVariantModel =>
          $base.as((v, t, t2) => _ProductVariantModelCopyWithImpl(v, t, t2));
}

abstract class ProductVariantModelCopyWith<$R, $In extends ProductVariantModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? productId,
      String? sku,
      String? variation,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion});
  ProductVariantModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProductVariantModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductVariantModel, $Out>
    implements ProductVariantModelCopyWith<$R, ProductVariantModel, $Out> {
  _ProductVariantModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductVariantModel> $mapper =
      ProductVariantModelMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          Object? productId = $none,
          Object? sku = $none,
          Object? variation = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (productId != $none) #productId: productId,
        if (sku != $none) #sku: sku,
        if (variation != $none) #variation: variation,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion
      }));
  @override
  ProductVariantModel $make(CopyWithData data) => ProductVariantModel(
      id: data.get(#id, or: $value.id),
      productId: data.get(#productId, or: $value.productId),
      sku: data.get(#sku, or: $value.sku),
      variation: data.get(#variation, or: $value.variation),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion));

  @override
  ProductVariantModelCopyWith<$R2, ProductVariantModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProductVariantModelCopyWithImpl($value, $cast, t);
}

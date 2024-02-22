// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product_variant.dart';

class ProductVariantSearchModelMapper
    extends SubClassMapperBase<ProductVariantSearchModel> {
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
  static String? _$boundaryCode(ProductVariantSearchModel v) => v.boundaryCode;
  static const Field<ProductVariantSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(ProductVariantSearchModel v) =>
      v.auditDetails;
  static const Field<ProductVariantSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(ProductVariantSearchModel v) =>
      v.additionalFields;
  static const Field<ProductVariantSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<ProductVariantSearchModel> fields = const {
    #id: _f$id,
    #productId: _f$productId,
    #sku: _f$sku,
    #variation: _f$variation,
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

  static ProductVariantSearchModel _instantiate(DecodingData data) {
    return ProductVariantSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        productId: data.dec(_f$productId),
        sku: data.dec(_f$sku),
        variation: data.dec(_f$variation),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
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
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id;
  @override
  $R call(
      {List<String>? id,
      String? productId,
      String? sku,
      String? variation,
      String? tenantId,
      String? boundaryCode});
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
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (productId != $none) #productId: productId,
        if (sku != $none) #sku: sku,
        if (variation != $none) #variation: variation,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  ProductVariantSearchModel $make(CopyWithData data) =>
      ProductVariantSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          productId: data.get(#productId, or: $value.productId),
          sku: data.get(#sku, or: $value.sku),
          variation: data.get(#variation, or: $value.variation),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  ProductVariantSearchModelCopyWith<$R2, ProductVariantSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProductVariantSearchModelCopyWithImpl($value, $cast, t);
}

class ProductVariantModelMapper
    extends SubClassMapperBase<ProductVariantModel> {
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

  static ProductVariantAdditionalFields? _$additionalFields(
          ProductVariantModel v) =>
      v.additionalFields;
  static const Field<ProductVariantModel, ProductVariantAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
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
  static AuditDetails? _$auditDetails(ProductVariantModel v) => v.auditDetails;
  static const Field<ProductVariantModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(ProductVariantModel v) =>
      v.clientAuditDetails;
  static const Field<ProductVariantModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(ProductVariantModel v) => v.isDeleted;
  static const Field<ProductVariantModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<ProductVariantModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #productId: _f$productId,
    #sku: _f$sku,
    #variation: _f$variation,
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

  static ProductVariantModel _instantiate(DecodingData data) {
    return ProductVariantModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        productId: data.dec(_f$productId),
        sku: data.dec(_f$sku),
        variation: data.dec(_f$variation),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
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
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  ProductVariantAdditionalFieldsCopyWith<$R, ProductVariantAdditionalFields,
      ProductVariantAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {ProductVariantAdditionalFields? additionalFields,
      String? id,
      String? productId,
      String? sku,
      String? variation,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
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
  ProductVariantAdditionalFieldsCopyWith<$R, ProductVariantAdditionalFields,
          ProductVariantAdditionalFields>?
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
          String? id,
          Object? productId = $none,
          Object? sku = $none,
          Object? variation = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != null) #id: id,
        if (productId != $none) #productId: productId,
        if (sku != $none) #sku: sku,
        if (variation != $none) #variation: variation,
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
  ProductVariantModel $make(CopyWithData data) => ProductVariantModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      productId: data.get(#productId, or: $value.productId),
      sku: data.get(#sku, or: $value.sku),
      variation: data.get(#variation, or: $value.variation),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  ProductVariantModelCopyWith<$R2, ProductVariantModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProductVariantModelCopyWithImpl($value, $cast, t);
}

class ProductVariantAdditionalFieldsMapper
    extends SubClassMapperBase<ProductVariantAdditionalFields> {
  ProductVariantAdditionalFieldsMapper._();

  static ProductVariantAdditionalFieldsMapper? _instance;
  static ProductVariantAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProductVariantAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductVariantAdditionalFields';

  static String _$schema(ProductVariantAdditionalFields v) => v.schema;
  static const Field<ProductVariantAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'ProductVariant');
  static int _$version(ProductVariantAdditionalFields v) => v.version;
  static const Field<ProductVariantAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(ProductVariantAdditionalFields v) =>
      v.fields;
  static const Field<ProductVariantAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<ProductVariantAdditionalFields> fields = const {
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

  static ProductVariantAdditionalFields _instantiate(DecodingData data) {
    return ProductVariantAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductVariantAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductVariantAdditionalFields>(map);
  }

  static ProductVariantAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<ProductVariantAdditionalFields>(json);
  }
}

mixin ProductVariantAdditionalFieldsMappable {
  String toJson() {
    return ProductVariantAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<ProductVariantAdditionalFields>(
            this as ProductVariantAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return ProductVariantAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<ProductVariantAdditionalFields>(
            this as ProductVariantAdditionalFields);
  }

  ProductVariantAdditionalFieldsCopyWith<ProductVariantAdditionalFields,
          ProductVariantAdditionalFields, ProductVariantAdditionalFields>
      get copyWith => _ProductVariantAdditionalFieldsCopyWithImpl(
          this as ProductVariantAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return ProductVariantAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as ProductVariantAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProductVariantAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as ProductVariantAdditionalFields, other));
  }

  @override
  int get hashCode {
    return ProductVariantAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as ProductVariantAdditionalFields);
  }
}

extension ProductVariantAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductVariantAdditionalFields, $Out> {
  ProductVariantAdditionalFieldsCopyWith<$R, ProductVariantAdditionalFields,
          $Out>
      get $asProductVariantAdditionalFields => $base.as(
          (v, t, t2) => _ProductVariantAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class ProductVariantAdditionalFieldsCopyWith<
    $R,
    $In extends ProductVariantAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  ProductVariantAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProductVariantAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductVariantAdditionalFields, $Out>
    implements
        ProductVariantAdditionalFieldsCopyWith<$R,
            ProductVariantAdditionalFields, $Out> {
  _ProductVariantAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductVariantAdditionalFields> $mapper =
      ProductVariantAdditionalFieldsMapper.ensureInitialized();
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
  ProductVariantAdditionalFields $make(CopyWithData data) =>
      ProductVariantAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  ProductVariantAdditionalFieldsCopyWith<$R2, ProductVariantAdditionalFields,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProductVariantAdditionalFieldsCopyWithImpl($value, $cast, t);
}

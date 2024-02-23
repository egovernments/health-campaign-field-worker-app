// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product.dart';

class ProductSearchModelMapper extends SubClassMapperBase<ProductSearchModel> {
  ProductSearchModelMapper._();

  static ProductSearchModelMapper? _instance;
  static ProductSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductSearchModel';

  static String? _$id(ProductSearchModel v) => v.id;
  static const Field<ProductSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$type(ProductSearchModel v) => v.type;
  static const Field<ProductSearchModel, String> _f$type =
      Field('type', _$type, opt: true);
  static String? _$name(ProductSearchModel v) => v.name;
  static const Field<ProductSearchModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$manufacturer(ProductSearchModel v) => v.manufacturer;
  static const Field<ProductSearchModel, String> _f$manufacturer =
      Field('manufacturer', _$manufacturer, opt: true);
  static List<String>? _$clientReferenceId(ProductSearchModel v) =>
      v.clientReferenceId;
  static const Field<ProductSearchModel, List<String>> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$tenantId(ProductSearchModel v) => v.tenantId;
  static const Field<ProductSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(ProductSearchModel v) => v.boundaryCode;
  static const Field<ProductSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(ProductSearchModel v) => v.auditDetails;
  static const Field<ProductSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(ProductSearchModel v) =>
      v.additionalFields;
  static const Field<ProductSearchModel, AdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<ProductSearchModel> fields = const {
    #id: _f$id,
    #type: _f$type,
    #name: _f$name,
    #manufacturer: _f$manufacturer,
    #clientReferenceId: _f$clientReferenceId,
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

  static ProductSearchModel _instantiate(DecodingData data) {
    return ProductSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        type: data.dec(_f$type),
        name: data.dec(_f$name),
        manufacturer: data.dec(_f$manufacturer),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductSearchModel>(map);
  }

  static ProductSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProductSearchModel>(json);
  }
}

mixin ProductSearchModelMappable {
  String toJson() {
    return ProductSearchModelMapper.ensureInitialized()
        .encodeJson<ProductSearchModel>(this as ProductSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ProductSearchModelMapper.ensureInitialized()
        .encodeMap<ProductSearchModel>(this as ProductSearchModel);
  }

  ProductSearchModelCopyWith<ProductSearchModel, ProductSearchModel,
          ProductSearchModel>
      get copyWith => _ProductSearchModelCopyWithImpl(
          this as ProductSearchModel, $identity, $identity);
  @override
  String toString() {
    return ProductSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ProductSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProductSearchModelMapper.ensureInitialized()
                .isValueEqual(this as ProductSearchModel, other));
  }

  @override
  int get hashCode {
    return ProductSearchModelMapper.ensureInitialized()
        .hashValue(this as ProductSearchModel);
  }
}

extension ProductSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductSearchModel, $Out> {
  ProductSearchModelCopyWith<$R, ProductSearchModel, $Out>
      get $asProductSearchModel =>
          $base.as((v, t, t2) => _ProductSearchModelCopyWithImpl(v, t, t2));
}

abstract class ProductSearchModelCopyWith<$R, $In extends ProductSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  @override
  $R call(
      {String? id,
      String? type,
      String? name,
      String? manufacturer,
      List<String>? clientReferenceId,
      String? tenantId,
      String? boundaryCode});
  ProductSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProductSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductSearchModel, $Out>
    implements ProductSearchModelCopyWith<$R, ProductSearchModel, $Out> {
  _ProductSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductSearchModel> $mapper =
      ProductSearchModelMapper.ensureInitialized();
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
          Object? type = $none,
          Object? name = $none,
          Object? manufacturer = $none,
          Object? clientReferenceId = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (type != $none) #type: type,
        if (name != $none) #name: name,
        if (manufacturer != $none) #manufacturer: manufacturer,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  ProductSearchModel $make(CopyWithData data) =>
      ProductSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          type: data.get(#type, or: $value.type),
          name: data.get(#name, or: $value.name),
          manufacturer: data.get(#manufacturer, or: $value.manufacturer),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  ProductSearchModelCopyWith<$R2, ProductSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProductSearchModelCopyWithImpl($value, $cast, t);
}

class ProductModelMapper extends SubClassMapperBase<ProductModel> {
  ProductModelMapper._();

  static ProductModelMapper? _instance;
  static ProductModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductModel';

  static ProductAdditionalFields? _$additionalFields(ProductModel v) =>
      v.additionalFields;
  static const Field<ProductModel, ProductAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(ProductModel v) => v.id;
  static const Field<ProductModel, String> _f$id = Field('id', _$id, opt: true);
  static String? _$type(ProductModel v) => v.type;
  static const Field<ProductModel, String> _f$type =
      Field('type', _$type, opt: true);
  static String? _$name(ProductModel v) => v.name;
  static const Field<ProductModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$manufacturer(ProductModel v) => v.manufacturer;
  static const Field<ProductModel, String> _f$manufacturer =
      Field('manufacturer', _$manufacturer, opt: true);
  static bool? _$nonRecoverableError(ProductModel v) => v.nonRecoverableError;
  static const Field<ProductModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String _$clientReferenceId(ProductModel v) => v.clientReferenceId;
  static const Field<ProductModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$tenantId(ProductModel v) => v.tenantId;
  static const Field<ProductModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ProductModel v) => v.rowVersion;
  static const Field<ProductModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(ProductModel v) => v.auditDetails;
  static const Field<ProductModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(ProductModel v) =>
      v.clientAuditDetails;
  static const Field<ProductModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(ProductModel v) => v.isDeleted;
  static const Field<ProductModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<ProductModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #type: _f$type,
    #name: _f$name,
    #manufacturer: _f$manufacturer,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
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

  static ProductModel _instantiate(DecodingData data) {
    return ProductModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        type: data.dec(_f$type),
        name: data.dec(_f$name),
        manufacturer: data.dec(_f$manufacturer),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductModel>(map);
  }

  static ProductModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProductModel>(json);
  }
}

mixin ProductModelMappable {
  String toJson() {
    return ProductModelMapper.ensureInitialized()
        .encodeJson<ProductModel>(this as ProductModel);
  }

  Map<String, dynamic> toMap() {
    return ProductModelMapper.ensureInitialized()
        .encodeMap<ProductModel>(this as ProductModel);
  }

  ProductModelCopyWith<ProductModel, ProductModel, ProductModel> get copyWith =>
      _ProductModelCopyWithImpl(this as ProductModel, $identity, $identity);
  @override
  String toString() {
    return ProductModelMapper.ensureInitialized()
        .stringifyValue(this as ProductModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProductModelMapper.ensureInitialized()
                .isValueEqual(this as ProductModel, other));
  }

  @override
  int get hashCode {
    return ProductModelMapper.ensureInitialized()
        .hashValue(this as ProductModel);
  }
}

extension ProductModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductModel, $Out> {
  ProductModelCopyWith<$R, ProductModel, $Out> get $asProductModel =>
      $base.as((v, t, t2) => _ProductModelCopyWithImpl(v, t, t2));
}

abstract class ProductModelCopyWith<$R, $In extends ProductModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  ProductAdditionalFieldsCopyWith<$R, ProductAdditionalFields,
      ProductAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {ProductAdditionalFields? additionalFields,
      String? id,
      String? type,
      String? name,
      String? manufacturer,
      bool? nonRecoverableError,
      String? clientReferenceId,
      String? tenantId,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  ProductModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProductModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductModel, $Out>
    implements ProductModelCopyWith<$R, ProductModel, $Out> {
  _ProductModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductModel> $mapper =
      ProductModelMapper.ensureInitialized();
  @override
  ProductAdditionalFieldsCopyWith<$R, ProductAdditionalFields,
          ProductAdditionalFields>?
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
          Object? type = $none,
          Object? name = $none,
          Object? manufacturer = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (type != $none) #type: type,
        if (name != $none) #name: name,
        if (manufacturer != $none) #manufacturer: manufacturer,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  ProductModel $make(CopyWithData data) => ProductModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      type: data.get(#type, or: $value.type),
      name: data.get(#name, or: $value.name),
      manufacturer: data.get(#manufacturer, or: $value.manufacturer),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  ProductModelCopyWith<$R2, ProductModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProductModelCopyWithImpl($value, $cast, t);
}

class ProductAdditionalFieldsMapper
    extends SubClassMapperBase<ProductAdditionalFields> {
  ProductAdditionalFieldsMapper._();

  static ProductAdditionalFieldsMapper? _instance;
  static ProductAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProductAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductAdditionalFields';

  static String _$schema(ProductAdditionalFields v) => v.schema;
  static const Field<ProductAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Product');
  static int _$version(ProductAdditionalFields v) => v.version;
  static const Field<ProductAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(ProductAdditionalFields v) => v.fields;
  static const Field<ProductAdditionalFields, List<AdditionalField>> _f$fields =
      Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<ProductAdditionalFields> fields = const {
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

  static ProductAdditionalFields _instantiate(DecodingData data) {
    return ProductAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductAdditionalFields>(map);
  }

  static ProductAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<ProductAdditionalFields>(json);
  }
}

mixin ProductAdditionalFieldsMappable {
  String toJson() {
    return ProductAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<ProductAdditionalFields>(this as ProductAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return ProductAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<ProductAdditionalFields>(this as ProductAdditionalFields);
  }

  ProductAdditionalFieldsCopyWith<ProductAdditionalFields,
          ProductAdditionalFields, ProductAdditionalFields>
      get copyWith => _ProductAdditionalFieldsCopyWithImpl(
          this as ProductAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return ProductAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as ProductAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProductAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as ProductAdditionalFields, other));
  }

  @override
  int get hashCode {
    return ProductAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as ProductAdditionalFields);
  }
}

extension ProductAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductAdditionalFields, $Out> {
  ProductAdditionalFieldsCopyWith<$R, ProductAdditionalFields, $Out>
      get $asProductAdditionalFields => $base
          .as((v, t, t2) => _ProductAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class ProductAdditionalFieldsCopyWith<
    $R,
    $In extends ProductAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  ProductAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProductAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductAdditionalFields, $Out>
    implements
        ProductAdditionalFieldsCopyWith<$R, ProductAdditionalFields, $Out> {
  _ProductAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductAdditionalFields> $mapper =
      ProductAdditionalFieldsMapper.ensureInitialized();
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
  ProductAdditionalFields $make(CopyWithData data) => ProductAdditionalFields(
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version),
      fields: data.get(#fields, or: $value.fields));

  @override
  ProductAdditionalFieldsCopyWith<$R2, ProductAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProductAdditionalFieldsCopyWithImpl($value, $cast, t);
}

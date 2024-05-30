// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'attributes.dart';

class AttributesSearchModelMapper
    extends SubClassMapperBase<AttributesSearchModel> {
  AttributesSearchModelMapper._();

  static AttributesSearchModelMapper? _instance;
  static AttributesSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AttributesSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttributesSearchModel';

  static String? _$id(AttributesSearchModel v) => v.id;
  static const Field<AttributesSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$dataType(AttributesSearchModel v) => v.dataType;
  static const Field<AttributesSearchModel, String> _f$dataType =
      Field('dataType', _$dataType, opt: true);
  static String? _$referenceId(AttributesSearchModel v) => v.referenceId;
  static const Field<AttributesSearchModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$tenantId(AttributesSearchModel v) => v.tenantId;
  static const Field<AttributesSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$code(AttributesSearchModel v) => v.code;
  static const Field<AttributesSearchModel, String> _f$code =
      Field('code', _$code, opt: true);
  static String? _$isActive(AttributesSearchModel v) => v.isActive;
  static const Field<AttributesSearchModel, String> _f$isActive =
      Field('isActive', _$isActive, opt: true);
  static bool? _$required(AttributesSearchModel v) => v.required;
  static const Field<AttributesSearchModel, bool> _f$required =
      Field('required', _$required, opt: true);
  static String? _$regex(AttributesSearchModel v) => v.regex;
  static const Field<AttributesSearchModel, String> _f$regex =
      Field('regex', _$regex, opt: true);
  static int? _$order(AttributesSearchModel v) => v.order;
  static const Field<AttributesSearchModel, int> _f$order =
      Field('order', _$order, opt: true);
  static String? _$boundaryCode(AttributesSearchModel v) => v.boundaryCode;
  static const Field<AttributesSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(AttributesSearchModel v) =>
      v.auditDetails;
  static const Field<AttributesSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(AttributesSearchModel v) =>
      v.additionalFields;
  static const Field<AttributesSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<AttributesSearchModel> fields = const {
    #id: _f$id,
    #dataType: _f$dataType,
    #referenceId: _f$referenceId,
    #tenantId: _f$tenantId,
    #code: _f$code,
    #isActive: _f$isActive,
    #required: _f$required,
    #regex: _f$regex,
    #order: _f$order,
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

  static AttributesSearchModel _instantiate(DecodingData data) {
    return AttributesSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        dataType: data.dec(_f$dataType),
        referenceId: data.dec(_f$referenceId),
        tenantId: data.dec(_f$tenantId),
        code: data.dec(_f$code),
        isActive: data.dec(_f$isActive),
        required: data.dec(_f$required),
        regex: data.dec(_f$regex),
        order: data.dec(_f$order),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static AttributesSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttributesSearchModel>(map);
  }

  static AttributesSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<AttributesSearchModel>(json);
  }
}

mixin AttributesSearchModelMappable {
  String toJson() {
    return AttributesSearchModelMapper.ensureInitialized()
        .encodeJson<AttributesSearchModel>(this as AttributesSearchModel);
  }

  Map<String, dynamic> toMap() {
    return AttributesSearchModelMapper.ensureInitialized()
        .encodeMap<AttributesSearchModel>(this as AttributesSearchModel);
  }

  AttributesSearchModelCopyWith<AttributesSearchModel, AttributesSearchModel,
          AttributesSearchModel>
      get copyWith => _AttributesSearchModelCopyWithImpl(
          this as AttributesSearchModel, $identity, $identity);
  @override
  String toString() {
    return AttributesSearchModelMapper.ensureInitialized()
        .stringifyValue(this as AttributesSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttributesSearchModelMapper.ensureInitialized()
                .isValueEqual(this as AttributesSearchModel, other));
  }

  @override
  int get hashCode {
    return AttributesSearchModelMapper.ensureInitialized()
        .hashValue(this as AttributesSearchModel);
  }
}

extension AttributesSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttributesSearchModel, $Out> {
  AttributesSearchModelCopyWith<$R, AttributesSearchModel, $Out>
      get $asAttributesSearchModel =>
          $base.as((v, t, t2) => _AttributesSearchModelCopyWithImpl(v, t, t2));
}

abstract class AttributesSearchModelCopyWith<
    $R,
    $In extends AttributesSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      String? dataType,
      String? referenceId,
      String? tenantId,
      String? code,
      String? isActive,
      bool? required,
      String? regex,
      int? order,
      String? boundaryCode});
  AttributesSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AttributesSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttributesSearchModel, $Out>
    implements AttributesSearchModelCopyWith<$R, AttributesSearchModel, $Out> {
  _AttributesSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttributesSearchModel> $mapper =
      AttributesSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? dataType = $none,
          Object? referenceId = $none,
          Object? tenantId = $none,
          Object? code = $none,
          Object? isActive = $none,
          Object? required = $none,
          Object? regex = $none,
          Object? order = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (dataType != $none) #dataType: dataType,
        if (referenceId != $none) #referenceId: referenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (code != $none) #code: code,
        if (isActive != $none) #isActive: isActive,
        if (required != $none) #required: required,
        if (regex != $none) #regex: regex,
        if (order != $none) #order: order,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  AttributesSearchModel $make(CopyWithData data) =>
      AttributesSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          dataType: data.get(#dataType, or: $value.dataType),
          referenceId: data.get(#referenceId, or: $value.referenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          code: data.get(#code, or: $value.code),
          isActive: data.get(#isActive, or: $value.isActive),
          required: data.get(#required, or: $value.required),
          regex: data.get(#regex, or: $value.regex),
          order: data.get(#order, or: $value.order),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  AttributesSearchModelCopyWith<$R2, AttributesSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AttributesSearchModelCopyWithImpl($value, $cast, t);
}

class AttributesModelMapper extends SubClassMapperBase<AttributesModel> {
  AttributesModelMapper._();

  static AttributesModelMapper? _instance;
  static AttributesModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AttributesModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttributesModel';

  static AttributesAdditionalFields? _$additionalFields(AttributesModel v) =>
      v.additionalFields;
  static const Field<AttributesModel, AttributesAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(AttributesModel v) => v.id;
  static const Field<AttributesModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$dataType(AttributesModel v) => v.dataType;
  static const Field<AttributesModel, String> _f$dataType =
      Field('dataType', _$dataType, opt: true);
  static String? _$referenceId(AttributesModel v) => v.referenceId;
  static const Field<AttributesModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$tenantId(AttributesModel v) => v.tenantId;
  static const Field<AttributesModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$code(AttributesModel v) => v.code;
  static const Field<AttributesModel, String> _f$code =
      Field('code', _$code, opt: true);
  static List<String>? _$values(AttributesModel v) => v.values;
  static const Field<AttributesModel, List<String>> _f$values =
      Field('values', _$values, opt: true);
  static String? _$isActive(AttributesModel v) => v.isActive;
  static const Field<AttributesModel, String> _f$isActive =
      Field('isActive', _$isActive, opt: true);
  static bool? _$required(AttributesModel v) => v.required;
  static const Field<AttributesModel, bool> _f$required =
      Field('required', _$required, opt: true);
  static String? _$regex(AttributesModel v) => v.regex;
  static const Field<AttributesModel, String> _f$regex =
      Field('regex', _$regex, opt: true);
  static int? _$order(AttributesModel v) => v.order;
  static const Field<AttributesModel, int> _f$order =
      Field('order', _$order, opt: true);
  static bool? _$nonRecoverableError(AttributesModel v) =>
      v.nonRecoverableError;
  static const Field<AttributesModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static int? _$rowVersion(AttributesModel v) => v.rowVersion;
  static const Field<AttributesModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(AttributesModel v) => v.auditDetails;
  static const Field<AttributesModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(AttributesModel v) =>
      v.clientAuditDetails;
  static const Field<AttributesModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(AttributesModel v) => v.isDeleted;
  static const Field<AttributesModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<AttributesModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #dataType: _f$dataType,
    #referenceId: _f$referenceId,
    #tenantId: _f$tenantId,
    #code: _f$code,
    #values: _f$values,
    #isActive: _f$isActive,
    #required: _f$required,
    #regex: _f$regex,
    #order: _f$order,
    #nonRecoverableError: _f$nonRecoverableError,
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

  static AttributesModel _instantiate(DecodingData data) {
    return AttributesModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        dataType: data.dec(_f$dataType),
        referenceId: data.dec(_f$referenceId),
        tenantId: data.dec(_f$tenantId),
        code: data.dec(_f$code),
        values: data.dec(_f$values),
        isActive: data.dec(_f$isActive),
        required: data.dec(_f$required),
        regex: data.dec(_f$regex),
        order: data.dec(_f$order),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static AttributesModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttributesModel>(map);
  }

  static AttributesModel fromJson(String json) {
    return ensureInitialized().decodeJson<AttributesModel>(json);
  }
}

mixin AttributesModelMappable {
  String toJson() {
    return AttributesModelMapper.ensureInitialized()
        .encodeJson<AttributesModel>(this as AttributesModel);
  }

  Map<String, dynamic> toMap() {
    return AttributesModelMapper.ensureInitialized()
        .encodeMap<AttributesModel>(this as AttributesModel);
  }

  AttributesModelCopyWith<AttributesModel, AttributesModel, AttributesModel>
      get copyWith => _AttributesModelCopyWithImpl(
          this as AttributesModel, $identity, $identity);
  @override
  String toString() {
    return AttributesModelMapper.ensureInitialized()
        .stringifyValue(this as AttributesModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttributesModelMapper.ensureInitialized()
                .isValueEqual(this as AttributesModel, other));
  }

  @override
  int get hashCode {
    return AttributesModelMapper.ensureInitialized()
        .hashValue(this as AttributesModel);
  }
}

extension AttributesModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttributesModel, $Out> {
  AttributesModelCopyWith<$R, AttributesModel, $Out> get $asAttributesModel =>
      $base.as((v, t, t2) => _AttributesModelCopyWithImpl(v, t, t2));
}

abstract class AttributesModelCopyWith<$R, $In extends AttributesModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  AttributesAdditionalFieldsCopyWith<$R, AttributesAdditionalFields,
      AttributesAdditionalFields>? get additionalFields;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get values;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {AttributesAdditionalFields? additionalFields,
      String? id,
      String? dataType,
      String? referenceId,
      String? tenantId,
      String? code,
      List<String>? values,
      String? isActive,
      bool? required,
      String? regex,
      int? order,
      bool? nonRecoverableError,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  AttributesModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AttributesModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttributesModel, $Out>
    implements AttributesModelCopyWith<$R, AttributesModel, $Out> {
  _AttributesModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttributesModel> $mapper =
      AttributesModelMapper.ensureInitialized();
  @override
  AttributesAdditionalFieldsCopyWith<$R, AttributesAdditionalFields,
          AttributesAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get values =>
      $value.values != null
          ? ListCopyWith($value.values!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(values: v))
          : null;
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
          Object? dataType = $none,
          Object? referenceId = $none,
          Object? tenantId = $none,
          Object? code = $none,
          Object? values = $none,
          Object? isActive = $none,
          Object? required = $none,
          Object? regex = $none,
          Object? order = $none,
          Object? nonRecoverableError = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (dataType != $none) #dataType: dataType,
        if (referenceId != $none) #referenceId: referenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (code != $none) #code: code,
        if (values != $none) #values: values,
        if (isActive != $none) #isActive: isActive,
        if (required != $none) #required: required,
        if (regex != $none) #regex: regex,
        if (order != $none) #order: order,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  AttributesModel $make(CopyWithData data) => AttributesModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      dataType: data.get(#dataType, or: $value.dataType),
      referenceId: data.get(#referenceId, or: $value.referenceId),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      code: data.get(#code, or: $value.code),
      values: data.get(#values, or: $value.values),
      isActive: data.get(#isActive, or: $value.isActive),
      required: data.get(#required, or: $value.required),
      regex: data.get(#regex, or: $value.regex),
      order: data.get(#order, or: $value.order),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  AttributesModelCopyWith<$R2, AttributesModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AttributesModelCopyWithImpl($value, $cast, t);
}

class AttributesAdditionalFieldsMapper
    extends SubClassMapperBase<AttributesAdditionalFields> {
  AttributesAdditionalFieldsMapper._();

  static AttributesAdditionalFieldsMapper? _instance;
  static AttributesAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AttributesAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttributesAdditionalFields';

  static String _$schema(AttributesAdditionalFields v) => v.schema;
  static const Field<AttributesAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Attributes');
  static int _$version(AttributesAdditionalFields v) => v.version;
  static const Field<AttributesAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(AttributesAdditionalFields v) =>
      v.fields;
  static const Field<AttributesAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<AttributesAdditionalFields> fields = const {
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

  static AttributesAdditionalFields _instantiate(DecodingData data) {
    return AttributesAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static AttributesAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttributesAdditionalFields>(map);
  }

  static AttributesAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<AttributesAdditionalFields>(json);
  }
}

mixin AttributesAdditionalFieldsMappable {
  String toJson() {
    return AttributesAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<AttributesAdditionalFields>(
            this as AttributesAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return AttributesAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<AttributesAdditionalFields>(
            this as AttributesAdditionalFields);
  }

  AttributesAdditionalFieldsCopyWith<AttributesAdditionalFields,
          AttributesAdditionalFields, AttributesAdditionalFields>
      get copyWith => _AttributesAdditionalFieldsCopyWithImpl(
          this as AttributesAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return AttributesAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as AttributesAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttributesAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as AttributesAdditionalFields, other));
  }

  @override
  int get hashCode {
    return AttributesAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as AttributesAdditionalFields);
  }
}

extension AttributesAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttributesAdditionalFields, $Out> {
  AttributesAdditionalFieldsCopyWith<$R, AttributesAdditionalFields, $Out>
      get $asAttributesAdditionalFields => $base
          .as((v, t, t2) => _AttributesAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class AttributesAdditionalFieldsCopyWith<
    $R,
    $In extends AttributesAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  AttributesAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AttributesAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttributesAdditionalFields, $Out>
    implements
        AttributesAdditionalFieldsCopyWith<$R, AttributesAdditionalFields,
            $Out> {
  _AttributesAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttributesAdditionalFields> $mapper =
      AttributesAdditionalFieldsMapper.ensureInitialized();
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
  AttributesAdditionalFields $make(CopyWithData data) =>
      AttributesAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  AttributesAdditionalFieldsCopyWith<$R2, AttributesAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AttributesAdditionalFieldsCopyWithImpl($value, $cast, t);
}

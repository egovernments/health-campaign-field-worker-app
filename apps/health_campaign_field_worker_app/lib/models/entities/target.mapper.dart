// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'target.dart';

class TargetSearchModelMapper extends SubClassMapperBase<TargetSearchModel> {
  TargetSearchModelMapper._();

  static TargetSearchModelMapper? _instance;
  static TargetSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TargetSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TargetSearchModel';

  static String? _$tenantId(TargetSearchModel v) => v.tenantId;
  static const Field<TargetSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(TargetSearchModel v) => v.boundaryCode;
  static const Field<TargetSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(TargetSearchModel v) => v.auditDetails;
  static const Field<TargetSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(TargetSearchModel v) =>
      v.additionalFields;
  static const Field<TargetSearchModel, AdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<TargetSearchModel> fields = const {
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

  static TargetSearchModel _instantiate(DecodingData data) {
    return TargetSearchModel.ignoreDeleted(
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static TargetSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TargetSearchModel>(map);
  }

  static TargetSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<TargetSearchModel>(json);
  }
}

mixin TargetSearchModelMappable {
  String toJson() {
    return TargetSearchModelMapper.ensureInitialized()
        .encodeJson<TargetSearchModel>(this as TargetSearchModel);
  }

  Map<String, dynamic> toMap() {
    return TargetSearchModelMapper.ensureInitialized()
        .encodeMap<TargetSearchModel>(this as TargetSearchModel);
  }

  TargetSearchModelCopyWith<TargetSearchModel, TargetSearchModel,
          TargetSearchModel>
      get copyWith => _TargetSearchModelCopyWithImpl(
          this as TargetSearchModel, $identity, $identity);
  @override
  String toString() {
    return TargetSearchModelMapper.ensureInitialized()
        .stringifyValue(this as TargetSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TargetSearchModelMapper.ensureInitialized()
                .isValueEqual(this as TargetSearchModel, other));
  }

  @override
  int get hashCode {
    return TargetSearchModelMapper.ensureInitialized()
        .hashValue(this as TargetSearchModel);
  }
}

extension TargetSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TargetSearchModel, $Out> {
  TargetSearchModelCopyWith<$R, TargetSearchModel, $Out>
      get $asTargetSearchModel =>
          $base.as((v, t, t2) => _TargetSearchModelCopyWithImpl(v, t, t2));
}

abstract class TargetSearchModelCopyWith<$R, $In extends TargetSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  @override
  $R call({String? tenantId, String? boundaryCode});
  TargetSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TargetSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TargetSearchModel, $Out>
    implements TargetSearchModelCopyWith<$R, TargetSearchModel, $Out> {
  _TargetSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TargetSearchModel> $mapper =
      TargetSearchModelMapper.ensureInitialized();
  @override
  $R call({Object? tenantId = $none, Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  TargetSearchModel $make(CopyWithData data) => TargetSearchModel.ignoreDeleted(
      tenantId: data.get(#tenantId, or: $value.tenantId),
      boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  TargetSearchModelCopyWith<$R2, TargetSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TargetSearchModelCopyWithImpl($value, $cast, t);
}

class TargetModelMapper extends SubClassMapperBase<TargetModel> {
  TargetModelMapper._();

  static TargetModelMapper? _instance;
  static TargetModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TargetModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TargetModel';

  static TargetAdditionalFields? _$additionalFields(TargetModel v) =>
      v.additionalFields;
  static const Field<TargetModel, TargetAdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String _$id(TargetModel v) => v.id;
  static const Field<TargetModel, String> _f$id = Field('id', _$id);
  static String? _$clientReferenceId(TargetModel v) => v.clientReferenceId;
  static const Field<TargetModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static double? _$totalNo(TargetModel v) => v.totalNo;
  static const Field<TargetModel, double> _f$totalNo =
      Field('totalNo', _$totalNo, opt: true);
  static double? _$targetNo(TargetModel v) => v.targetNo;
  static const Field<TargetModel, double> _f$targetNo =
      Field('targetNo', _$targetNo, opt: true);
  static bool? _$nonRecoverableError(TargetModel v) => v.nonRecoverableError;
  static const Field<TargetModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(TargetModel v) => v.tenantId;
  static const Field<TargetModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(TargetModel v) => v.rowVersion;
  static const Field<TargetModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static BeneficiaryType? _$beneficiaryType(TargetModel v) => v.beneficiaryType;
  static const Field<TargetModel, BeneficiaryType> _f$beneficiaryType =
      Field('beneficiaryType', _$beneficiaryType, opt: true);
  static AuditDetails? _$auditDetails(TargetModel v) => v.auditDetails;
  static const Field<TargetModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(TargetModel v) =>
      v.clientAuditDetails;
  static const Field<TargetModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(TargetModel v) => v.isDeleted;
  static const Field<TargetModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<TargetModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #clientReferenceId: _f$clientReferenceId,
    #totalNo: _f$totalNo,
    #targetNo: _f$targetNo,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #beneficiaryType: _f$beneficiaryType,
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

  static TargetModel _instantiate(DecodingData data) {
    return TargetModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        clientReferenceId: data.dec(_f$clientReferenceId),
        totalNo: data.dec(_f$totalNo),
        targetNo: data.dec(_f$targetNo),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        beneficiaryType: data.dec(_f$beneficiaryType),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static TargetModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TargetModel>(map);
  }

  static TargetModel fromJson(String json) {
    return ensureInitialized().decodeJson<TargetModel>(json);
  }
}

mixin TargetModelMappable {
  String toJson() {
    return TargetModelMapper.ensureInitialized()
        .encodeJson<TargetModel>(this as TargetModel);
  }

  Map<String, dynamic> toMap() {
    return TargetModelMapper.ensureInitialized()
        .encodeMap<TargetModel>(this as TargetModel);
  }

  TargetModelCopyWith<TargetModel, TargetModel, TargetModel> get copyWith =>
      _TargetModelCopyWithImpl(this as TargetModel, $identity, $identity);
  @override
  String toString() {
    return TargetModelMapper.ensureInitialized()
        .stringifyValue(this as TargetModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TargetModelMapper.ensureInitialized()
                .isValueEqual(this as TargetModel, other));
  }

  @override
  int get hashCode {
    return TargetModelMapper.ensureInitialized().hashValue(this as TargetModel);
  }
}

extension TargetModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TargetModel, $Out> {
  TargetModelCopyWith<$R, TargetModel, $Out> get $asTargetModel =>
      $base.as((v, t, t2) => _TargetModelCopyWithImpl(v, t, t2));
}

abstract class TargetModelCopyWith<$R, $In extends TargetModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  TargetAdditionalFieldsCopyWith<$R, TargetAdditionalFields,
      TargetAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {TargetAdditionalFields? additionalFields,
      String? id,
      String? clientReferenceId,
      double? totalNo,
      double? targetNo,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      BeneficiaryType? beneficiaryType,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  TargetModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TargetModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TargetModel, $Out>
    implements TargetModelCopyWith<$R, TargetModel, $Out> {
  _TargetModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TargetModel> $mapper =
      TargetModelMapper.ensureInitialized();
  @override
  TargetAdditionalFieldsCopyWith<$R, TargetAdditionalFields,
          TargetAdditionalFields>?
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
          Object? clientReferenceId = $none,
          Object? totalNo = $none,
          Object? targetNo = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? beneficiaryType = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != null) #id: id,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (totalNo != $none) #totalNo: totalNo,
        if (targetNo != $none) #targetNo: targetNo,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (beneficiaryType != $none) #beneficiaryType: beneficiaryType,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  TargetModel $make(CopyWithData data) => TargetModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      totalNo: data.get(#totalNo, or: $value.totalNo),
      targetNo: data.get(#targetNo, or: $value.targetNo),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      beneficiaryType: data.get(#beneficiaryType, or: $value.beneficiaryType),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  TargetModelCopyWith<$R2, TargetModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TargetModelCopyWithImpl($value, $cast, t);
}

class TargetAdditionalFieldsMapper
    extends SubClassMapperBase<TargetAdditionalFields> {
  TargetAdditionalFieldsMapper._();

  static TargetAdditionalFieldsMapper? _instance;
  static TargetAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TargetAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TargetAdditionalFields';

  static String _$schema(TargetAdditionalFields v) => v.schema;
  static const Field<TargetAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Target');
  static int _$version(TargetAdditionalFields v) => v.version;
  static const Field<TargetAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(TargetAdditionalFields v) => v.fields;
  static const Field<TargetAdditionalFields, List<AdditionalField>> _f$fields =
      Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<TargetAdditionalFields> fields = const {
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

  static TargetAdditionalFields _instantiate(DecodingData data) {
    return TargetAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static TargetAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TargetAdditionalFields>(map);
  }

  static TargetAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<TargetAdditionalFields>(json);
  }
}

mixin TargetAdditionalFieldsMappable {
  String toJson() {
    return TargetAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<TargetAdditionalFields>(this as TargetAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return TargetAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<TargetAdditionalFields>(this as TargetAdditionalFields);
  }

  TargetAdditionalFieldsCopyWith<TargetAdditionalFields, TargetAdditionalFields,
          TargetAdditionalFields>
      get copyWith => _TargetAdditionalFieldsCopyWithImpl(
          this as TargetAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return TargetAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as TargetAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TargetAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as TargetAdditionalFields, other));
  }

  @override
  int get hashCode {
    return TargetAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as TargetAdditionalFields);
  }
}

extension TargetAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TargetAdditionalFields, $Out> {
  TargetAdditionalFieldsCopyWith<$R, TargetAdditionalFields, $Out>
      get $asTargetAdditionalFields =>
          $base.as((v, t, t2) => _TargetAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class TargetAdditionalFieldsCopyWith<
    $R,
    $In extends TargetAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  TargetAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TargetAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TargetAdditionalFields, $Out>
    implements
        TargetAdditionalFieldsCopyWith<$R, TargetAdditionalFields, $Out> {
  _TargetAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TargetAdditionalFields> $mapper =
      TargetAdditionalFieldsMapper.ensureInitialized();
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
  TargetAdditionalFields $make(CopyWithData data) => TargetAdditionalFields(
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version),
      fields: data.get(#fields, or: $value.fields));

  @override
  TargetAdditionalFieldsCopyWith<$R2, TargetAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TargetAdditionalFieldsCopyWithImpl($value, $cast, t);
}

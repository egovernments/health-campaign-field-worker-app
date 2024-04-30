// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'referral_recon_attributes.dart';

class ReferralReconAttributesSearchModelMapper
    extends ClassMapperBase<ReferralReconAttributesSearchModel> {
  ReferralReconAttributesSearchModelMapper._();

  static ReferralReconAttributesSearchModelMapper? _instance;
  static ReferralReconAttributesSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReferralReconAttributesSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ReferralReconAttributesSearchModel';

  static String? _$id(ReferralReconAttributesSearchModel v) => v.id;
  static const Field<ReferralReconAttributesSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$dataType(ReferralReconAttributesSearchModel v) => v.dataType;
  static const Field<ReferralReconAttributesSearchModel, String> _f$dataType =
      Field('dataType', _$dataType, opt: true);
  static String? _$referenceId(ReferralReconAttributesSearchModel v) =>
      v.referenceId;
  static const Field<ReferralReconAttributesSearchModel, String>
      _f$referenceId = Field('referenceId', _$referenceId, opt: true);
  static String? _$tenantId(ReferralReconAttributesSearchModel v) => v.tenantId;
  static const Field<ReferralReconAttributesSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$code(ReferralReconAttributesSearchModel v) => v.code;
  static const Field<ReferralReconAttributesSearchModel, String> _f$code =
      Field('code', _$code, opt: true);
  static String? _$isActive(ReferralReconAttributesSearchModel v) => v.isActive;
  static const Field<ReferralReconAttributesSearchModel, String> _f$isActive =
      Field('isActive', _$isActive, opt: true);
  static bool? _$required(ReferralReconAttributesSearchModel v) => v.required;
  static const Field<ReferralReconAttributesSearchModel, bool> _f$required =
      Field('required', _$required, opt: true);
  static String? _$regex(ReferralReconAttributesSearchModel v) => v.regex;
  static const Field<ReferralReconAttributesSearchModel, String> _f$regex =
      Field('regex', _$regex, opt: true);
  static int? _$order(ReferralReconAttributesSearchModel v) => v.order;
  static const Field<ReferralReconAttributesSearchModel, int> _f$order =
      Field('order', _$order, opt: true);

  @override
  final MappableFields<ReferralReconAttributesSearchModel> fields = const {
    #id: _f$id,
    #dataType: _f$dataType,
    #referenceId: _f$referenceId,
    #tenantId: _f$tenantId,
    #code: _f$code,
    #isActive: _f$isActive,
    #required: _f$required,
    #regex: _f$regex,
    #order: _f$order,
  };
  @override
  final bool ignoreNull = true;

  static ReferralReconAttributesSearchModel _instantiate(DecodingData data) {
    return ReferralReconAttributesSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        dataType: data.dec(_f$dataType),
        referenceId: data.dec(_f$referenceId),
        tenantId: data.dec(_f$tenantId),
        code: data.dec(_f$code),
        isActive: data.dec(_f$isActive),
        required: data.dec(_f$required),
        regex: data.dec(_f$regex),
        order: data.dec(_f$order));
  }

  @override
  final Function instantiate = _instantiate;

  static ReferralReconAttributesSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<ReferralReconAttributesSearchModel>(map);
  }

  static ReferralReconAttributesSearchModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ReferralReconAttributesSearchModel>(json);
  }
}

mixin ReferralReconAttributesSearchModelMappable {
  String toJson() {
    return ReferralReconAttributesSearchModelMapper.ensureInitialized()
        .encodeJson<ReferralReconAttributesSearchModel>(
            this as ReferralReconAttributesSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ReferralReconAttributesSearchModelMapper.ensureInitialized()
        .encodeMap<ReferralReconAttributesSearchModel>(
            this as ReferralReconAttributesSearchModel);
  }

  ReferralReconAttributesSearchModelCopyWith<
          ReferralReconAttributesSearchModel,
          ReferralReconAttributesSearchModel,
          ReferralReconAttributesSearchModel>
      get copyWith => _ReferralReconAttributesSearchModelCopyWithImpl(
          this as ReferralReconAttributesSearchModel, $identity, $identity);
  @override
  String toString() {
    return ReferralReconAttributesSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ReferralReconAttributesSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ReferralReconAttributesSearchModelMapper.ensureInitialized()
                .isValueEqual(
                    this as ReferralReconAttributesSearchModel, other));
  }

  @override
  int get hashCode {
    return ReferralReconAttributesSearchModelMapper.ensureInitialized()
        .hashValue(this as ReferralReconAttributesSearchModel);
  }
}

extension ReferralReconAttributesSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReferralReconAttributesSearchModel, $Out> {
  ReferralReconAttributesSearchModelCopyWith<$R,
          ReferralReconAttributesSearchModel, $Out>
      get $asReferralReconAttributesSearchModel => $base.as((v, t, t2) =>
          _ReferralReconAttributesSearchModelCopyWithImpl(v, t, t2));
}

abstract class ReferralReconAttributesSearchModelCopyWith<
    $R,
    $In extends ReferralReconAttributesSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? dataType,
      String? referenceId,
      String? tenantId,
      String? code,
      String? isActive,
      bool? required,
      String? regex,
      int? order});
  ReferralReconAttributesSearchModelCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReferralReconAttributesSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReferralReconAttributesSearchModel, $Out>
    implements
        ReferralReconAttributesSearchModelCopyWith<$R,
            ReferralReconAttributesSearchModel, $Out> {
  _ReferralReconAttributesSearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReferralReconAttributesSearchModel> $mapper =
      ReferralReconAttributesSearchModelMapper.ensureInitialized();
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
          Object? order = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (dataType != $none) #dataType: dataType,
        if (referenceId != $none) #referenceId: referenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (code != $none) #code: code,
        if (isActive != $none) #isActive: isActive,
        if (required != $none) #required: required,
        if (regex != $none) #regex: regex,
        if (order != $none) #order: order
      }));
  @override
  ReferralReconAttributesSearchModel $make(CopyWithData data) =>
      ReferralReconAttributesSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          dataType: data.get(#dataType, or: $value.dataType),
          referenceId: data.get(#referenceId, or: $value.referenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          code: data.get(#code, or: $value.code),
          isActive: data.get(#isActive, or: $value.isActive),
          required: data.get(#required, or: $value.required),
          regex: data.get(#regex, or: $value.regex),
          order: data.get(#order, or: $value.order));

  @override
  ReferralReconAttributesSearchModelCopyWith<$R2,
      ReferralReconAttributesSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ReferralReconAttributesSearchModelCopyWithImpl($value, $cast, t);
}

class ReferralReconAttributesModelMapper
    extends ClassMapperBase<ReferralReconAttributesModel> {
  ReferralReconAttributesModelMapper._();

  static ReferralReconAttributesModelMapper? _instance;
  static ReferralReconAttributesModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReferralReconAttributesModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ReferralReconAttributesModel';

  static String? _$id(ReferralReconAttributesModel v) => v.id;
  static const Field<ReferralReconAttributesModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$dataType(ReferralReconAttributesModel v) => v.dataType;
  static const Field<ReferralReconAttributesModel, String> _f$dataType =
      Field('dataType', _$dataType, opt: true);
  static String? _$referenceId(ReferralReconAttributesModel v) => v.referenceId;
  static const Field<ReferralReconAttributesModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$tenantId(ReferralReconAttributesModel v) => v.tenantId;
  static const Field<ReferralReconAttributesModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$code(ReferralReconAttributesModel v) => v.code;
  static const Field<ReferralReconAttributesModel, String> _f$code =
      Field('code', _$code, opt: true);
  static List<String>? _$values(ReferralReconAttributesModel v) => v.values;
  static const Field<ReferralReconAttributesModel, List<String>> _f$values =
      Field('values', _$values, opt: true);
  static String? _$isActive(ReferralReconAttributesModel v) => v.isActive;
  static const Field<ReferralReconAttributesModel, String> _f$isActive =
      Field('isActive', _$isActive, opt: true);
  static bool? _$required(ReferralReconAttributesModel v) => v.required;
  static const Field<ReferralReconAttributesModel, bool> _f$required =
      Field('required', _$required, opt: true);
  static String? _$regex(ReferralReconAttributesModel v) => v.regex;
  static const Field<ReferralReconAttributesModel, String> _f$regex =
      Field('regex', _$regex, opt: true);
  static int? _$order(ReferralReconAttributesModel v) => v.order;
  static const Field<ReferralReconAttributesModel, int> _f$order =
      Field('order', _$order, opt: true);
  static bool? _$nonRecoverableError(ReferralReconAttributesModel v) =>
      v.nonRecoverableError;
  static const Field<ReferralReconAttributesModel, bool>
      _f$nonRecoverableError = Field(
          'nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static int? _$rowVersion(ReferralReconAttributesModel v) => v.rowVersion;
  static const Field<ReferralReconAttributesModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);

  @override
  final MappableFields<ReferralReconAttributesModel> fields = const {
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
  };
  @override
  final bool ignoreNull = true;

  static ReferralReconAttributesModel _instantiate(DecodingData data) {
    return ReferralReconAttributesModel(
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
        rowVersion: data.dec(_f$rowVersion));
  }

  @override
  final Function instantiate = _instantiate;

  static ReferralReconAttributesModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReferralReconAttributesModel>(map);
  }

  static ReferralReconAttributesModel fromJson(String json) {
    return ensureInitialized().decodeJson<ReferralReconAttributesModel>(json);
  }
}

mixin ReferralReconAttributesModelMappable {
  String toJson() {
    return ReferralReconAttributesModelMapper.ensureInitialized()
        .encodeJson<ReferralReconAttributesModel>(
            this as ReferralReconAttributesModel);
  }

  Map<String, dynamic> toMap() {
    return ReferralReconAttributesModelMapper.ensureInitialized()
        .encodeMap<ReferralReconAttributesModel>(
            this as ReferralReconAttributesModel);
  }

  ReferralReconAttributesModelCopyWith<ReferralReconAttributesModel,
          ReferralReconAttributesModel, ReferralReconAttributesModel>
      get copyWith => _ReferralReconAttributesModelCopyWithImpl(
          this as ReferralReconAttributesModel, $identity, $identity);
  @override
  String toString() {
    return ReferralReconAttributesModelMapper.ensureInitialized()
        .stringifyValue(this as ReferralReconAttributesModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ReferralReconAttributesModelMapper.ensureInitialized()
                .isValueEqual(this as ReferralReconAttributesModel, other));
  }

  @override
  int get hashCode {
    return ReferralReconAttributesModelMapper.ensureInitialized()
        .hashValue(this as ReferralReconAttributesModel);
  }
}

extension ReferralReconAttributesModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReferralReconAttributesModel, $Out> {
  ReferralReconAttributesModelCopyWith<$R, ReferralReconAttributesModel, $Out>
      get $asReferralReconAttributesModel => $base.as(
          (v, t, t2) => _ReferralReconAttributesModelCopyWithImpl(v, t, t2));
}

abstract class ReferralReconAttributesModelCopyWith<
    $R,
    $In extends ReferralReconAttributesModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get values;
  $R call(
      {String? id,
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
      int? rowVersion});
  ReferralReconAttributesModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ReferralReconAttributesModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReferralReconAttributesModel, $Out>
    implements
        ReferralReconAttributesModelCopyWith<$R, ReferralReconAttributesModel,
            $Out> {
  _ReferralReconAttributesModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReferralReconAttributesModel> $mapper =
      ReferralReconAttributesModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get values =>
      $value.values != null
          ? ListCopyWith($value.values!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(values: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
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
          Object? rowVersion = $none}) =>
      $apply(FieldCopyWithData({
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
        if (rowVersion != $none) #rowVersion: rowVersion
      }));
  @override
  ReferralReconAttributesModel $make(CopyWithData data) =>
      ReferralReconAttributesModel(
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
          rowVersion: data.get(#rowVersion, or: $value.rowVersion));

  @override
  ReferralReconAttributesModelCopyWith<$R2, ReferralReconAttributesModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ReferralReconAttributesModelCopyWithImpl($value, $cast, t);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'referral_recon_service_definition.dart';

class ReferralReconServiceDefinitionSearchModelMapper
    extends ClassMapperBase<ReferralReconServiceDefinitionSearchModel> {
  ReferralReconServiceDefinitionSearchModelMapper._();

  static ReferralReconServiceDefinitionSearchModelMapper? _instance;
  static ReferralReconServiceDefinitionSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReferralReconServiceDefinitionSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ReferralReconServiceDefinitionSearchModel';

  static String? _$id(ReferralReconServiceDefinitionSearchModel v) => v.id;
  static const Field<ReferralReconServiceDefinitionSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(ReferralReconServiceDefinitionSearchModel v) =>
      v.tenantId;
  static const Field<ReferralReconServiceDefinitionSearchModel, String>
      _f$tenantId = Field('tenantId', _$tenantId, opt: true);
  static List<String>? _$code(ReferralReconServiceDefinitionSearchModel v) =>
      v.code;
  static const Field<ReferralReconServiceDefinitionSearchModel, List<String>>
      _f$code = Field('code', _$code, opt: true);
  static bool? _$isActive(ReferralReconServiceDefinitionSearchModel v) =>
      v.isActive;
  static const Field<ReferralReconServiceDefinitionSearchModel, bool>
      _f$isActive = Field('isActive', _$isActive, opt: true);

  @override
  final MappableFields<ReferralReconServiceDefinitionSearchModel> fields =
      const {
    #id: _f$id,
    #tenantId: _f$tenantId,
    #code: _f$code,
    #isActive: _f$isActive,
  };
  @override
  final bool ignoreNull = true;

  static ReferralReconServiceDefinitionSearchModel _instantiate(
      DecodingData data) {
    return ReferralReconServiceDefinitionSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        code: data.dec(_f$code),
        isActive: data.dec(_f$isActive));
  }

  @override
  final Function instantiate = _instantiate;

  static ReferralReconServiceDefinitionSearchModel fromMap(
      Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<ReferralReconServiceDefinitionSearchModel>(map);
  }

  static ReferralReconServiceDefinitionSearchModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ReferralReconServiceDefinitionSearchModel>(json);
  }
}

mixin ReferralReconServiceDefinitionSearchModelMappable {
  String toJson() {
    return ReferralReconServiceDefinitionSearchModelMapper.ensureInitialized()
        .encodeJson<ReferralReconServiceDefinitionSearchModel>(
            this as ReferralReconServiceDefinitionSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ReferralReconServiceDefinitionSearchModelMapper.ensureInitialized()
        .encodeMap<ReferralReconServiceDefinitionSearchModel>(
            this as ReferralReconServiceDefinitionSearchModel);
  }

  ReferralReconServiceDefinitionSearchModelCopyWith<
          ReferralReconServiceDefinitionSearchModel,
          ReferralReconServiceDefinitionSearchModel,
          ReferralReconServiceDefinitionSearchModel>
      get copyWith => _ReferralReconServiceDefinitionSearchModelCopyWithImpl(
          this as ReferralReconServiceDefinitionSearchModel,
          $identity,
          $identity);
  @override
  String toString() {
    return ReferralReconServiceDefinitionSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ReferralReconServiceDefinitionSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return ReferralReconServiceDefinitionSearchModelMapper.ensureInitialized()
        .equalsValue(this as ReferralReconServiceDefinitionSearchModel, other);
  }

  @override
  int get hashCode {
    return ReferralReconServiceDefinitionSearchModelMapper.ensureInitialized()
        .hashValue(this as ReferralReconServiceDefinitionSearchModel);
  }
}

extension ReferralReconServiceDefinitionSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReferralReconServiceDefinitionSearchModel, $Out> {
  ReferralReconServiceDefinitionSearchModelCopyWith<$R,
          ReferralReconServiceDefinitionSearchModel, $Out>
      get $asReferralReconServiceDefinitionSearchModel => $base.as((v, t, t2) =>
          _ReferralReconServiceDefinitionSearchModelCopyWithImpl(v, t, t2));
}

abstract class ReferralReconServiceDefinitionSearchModelCopyWith<
    $R,
    $In extends ReferralReconServiceDefinitionSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get code;
  $R call({String? id, String? tenantId, List<String>? code, bool? isActive});
  ReferralReconServiceDefinitionSearchModelCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReferralReconServiceDefinitionSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReferralReconServiceDefinitionSearchModel,
        $Out>
    implements
        ReferralReconServiceDefinitionSearchModelCopyWith<$R,
            ReferralReconServiceDefinitionSearchModel, $Out> {
  _ReferralReconServiceDefinitionSearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReferralReconServiceDefinitionSearchModel>
      $mapper =
      ReferralReconServiceDefinitionSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get code =>
      $value.code != null
          ? ListCopyWith($value.code!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(code: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? tenantId = $none,
          Object? code = $none,
          Object? isActive = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (code != $none) #code: code,
        if (isActive != $none) #isActive: isActive
      }));
  @override
  ReferralReconServiceDefinitionSearchModel $make(CopyWithData data) =>
      ReferralReconServiceDefinitionSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          code: data.get(#code, or: $value.code),
          isActive: data.get(#isActive, or: $value.isActive));

  @override
  ReferralReconServiceDefinitionSearchModelCopyWith<$R2,
      ReferralReconServiceDefinitionSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ReferralReconServiceDefinitionSearchModelCopyWithImpl($value, $cast, t);
}

class ReferralReconServiceDefinitionModelMapper
    extends ClassMapperBase<ReferralReconServiceDefinitionModel> {
  ReferralReconServiceDefinitionModelMapper._();

  static ReferralReconServiceDefinitionModelMapper? _instance;
  static ReferralReconServiceDefinitionModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReferralReconServiceDefinitionModelMapper._());
      ReferralReconAttributesModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ReferralReconServiceDefinitionModel';

  static String? _$id(ReferralReconServiceDefinitionModel v) => v.id;
  static const Field<ReferralReconServiceDefinitionModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(ReferralReconServiceDefinitionModel v) =>
      v.tenantId;
  static const Field<ReferralReconServiceDefinitionModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$code(ReferralReconServiceDefinitionModel v) => v.code;
  static const Field<ReferralReconServiceDefinitionModel, String> _f$code =
      Field('code', _$code, opt: true);
  static bool? _$isActive(ReferralReconServiceDefinitionModel v) => v.isActive;
  static const Field<ReferralReconServiceDefinitionModel, bool> _f$isActive =
      Field('isActive', _$isActive, opt: true);
  static bool? _$nonRecoverableError(ReferralReconServiceDefinitionModel v) =>
      v.nonRecoverableError;
  static const Field<ReferralReconServiceDefinitionModel, bool>
      _f$nonRecoverableError = Field(
          'nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static int? _$rowVersion(ReferralReconServiceDefinitionModel v) =>
      v.rowVersion;
  static const Field<ReferralReconServiceDefinitionModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static List<ReferralReconAttributesModel>? _$attributes(
          ReferralReconServiceDefinitionModel v) =>
      v.attributes;
  static const Field<ReferralReconServiceDefinitionModel,
          List<ReferralReconAttributesModel>> _f$attributes =
      Field('attributes', _$attributes, opt: true);

  @override
  final MappableFields<ReferralReconServiceDefinitionModel> fields = const {
    #id: _f$id,
    #tenantId: _f$tenantId,
    #code: _f$code,
    #isActive: _f$isActive,
    #nonRecoverableError: _f$nonRecoverableError,
    #rowVersion: _f$rowVersion,
    #attributes: _f$attributes,
  };
  @override
  final bool ignoreNull = true;

  static ReferralReconServiceDefinitionModel _instantiate(DecodingData data) {
    return ReferralReconServiceDefinitionModel(
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        code: data.dec(_f$code),
        isActive: data.dec(_f$isActive),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        rowVersion: data.dec(_f$rowVersion),
        attributes: data.dec(_f$attributes));
  }

  @override
  final Function instantiate = _instantiate;

  static ReferralReconServiceDefinitionModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<ReferralReconServiceDefinitionModel>(map);
  }

  static ReferralReconServiceDefinitionModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ReferralReconServiceDefinitionModel>(json);
  }
}

mixin ReferralReconServiceDefinitionModelMappable {
  String toJson() {
    return ReferralReconServiceDefinitionModelMapper.ensureInitialized()
        .encodeJson<ReferralReconServiceDefinitionModel>(
            this as ReferralReconServiceDefinitionModel);
  }

  Map<String, dynamic> toMap() {
    return ReferralReconServiceDefinitionModelMapper.ensureInitialized()
        .encodeMap<ReferralReconServiceDefinitionModel>(
            this as ReferralReconServiceDefinitionModel);
  }

  ReferralReconServiceDefinitionModelCopyWith<
          ReferralReconServiceDefinitionModel,
          ReferralReconServiceDefinitionModel,
          ReferralReconServiceDefinitionModel>
      get copyWith => _ReferralReconServiceDefinitionModelCopyWithImpl(
          this as ReferralReconServiceDefinitionModel, $identity, $identity);
  @override
  String toString() {
    return ReferralReconServiceDefinitionModelMapper.ensureInitialized()
        .stringifyValue(this as ReferralReconServiceDefinitionModel);
  }

  @override
  bool operator ==(Object other) {
    return ReferralReconServiceDefinitionModelMapper.ensureInitialized()
        .equalsValue(this as ReferralReconServiceDefinitionModel, other);
  }

  @override
  int get hashCode {
    return ReferralReconServiceDefinitionModelMapper.ensureInitialized()
        .hashValue(this as ReferralReconServiceDefinitionModel);
  }
}

extension ReferralReconServiceDefinitionModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReferralReconServiceDefinitionModel, $Out> {
  ReferralReconServiceDefinitionModelCopyWith<$R,
          ReferralReconServiceDefinitionModel, $Out>
      get $asReferralReconServiceDefinitionModel => $base.as((v, t, t2) =>
          _ReferralReconServiceDefinitionModelCopyWithImpl(v, t, t2));
}

abstract class ReferralReconServiceDefinitionModelCopyWith<
    $R,
    $In extends ReferralReconServiceDefinitionModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      ReferralReconAttributesModel,
      ReferralReconAttributesModelCopyWith<$R, ReferralReconAttributesModel,
          ReferralReconAttributesModel>>? get attributes;
  $R call(
      {String? id,
      String? tenantId,
      String? code,
      bool? isActive,
      bool? nonRecoverableError,
      int? rowVersion,
      List<ReferralReconAttributesModel>? attributes});
  ReferralReconServiceDefinitionModelCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReferralReconServiceDefinitionModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReferralReconServiceDefinitionModel, $Out>
    implements
        ReferralReconServiceDefinitionModelCopyWith<$R,
            ReferralReconServiceDefinitionModel, $Out> {
  _ReferralReconServiceDefinitionModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReferralReconServiceDefinitionModel> $mapper =
      ReferralReconServiceDefinitionModelMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      ReferralReconAttributesModel,
      ReferralReconAttributesModelCopyWith<$R, ReferralReconAttributesModel,
          ReferralReconAttributesModel>>? get attributes =>
      $value.attributes != null
          ? ListCopyWith($value.attributes!, (v, t) => v.copyWith.$chain(t),
              (v) => call(attributes: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? tenantId = $none,
          Object? code = $none,
          Object? isActive = $none,
          Object? nonRecoverableError = $none,
          Object? rowVersion = $none,
          Object? attributes = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (code != $none) #code: code,
        if (isActive != $none) #isActive: isActive,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (attributes != $none) #attributes: attributes
      }));
  @override
  ReferralReconServiceDefinitionModel $make(CopyWithData data) =>
      ReferralReconServiceDefinitionModel(
          id: data.get(#id, or: $value.id),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          code: data.get(#code, or: $value.code),
          isActive: data.get(#isActive, or: $value.isActive),
          nonRecoverableError:
              data.get(#nonRecoverableError, or: $value.nonRecoverableError),
          rowVersion: data.get(#rowVersion, or: $value.rowVersion),
          attributes: data.get(#attributes, or: $value.attributes));

  @override
  ReferralReconServiceDefinitionModelCopyWith<$R2,
      ReferralReconServiceDefinitionModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ReferralReconServiceDefinitionModelCopyWithImpl($value, $cast, t);
}

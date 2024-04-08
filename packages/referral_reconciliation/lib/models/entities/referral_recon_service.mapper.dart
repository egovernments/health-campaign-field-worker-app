// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'referral_recon_service.dart';

class ReferralReconServiceSearchModelMapper
    extends ClassMapperBase<ReferralReconServiceSearchModel> {
  ReferralReconServiceSearchModelMapper._();

  static ReferralReconServiceSearchModelMapper? _instance;
  static ReferralReconServiceSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReferralReconServiceSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ReferralReconServiceSearchModel';

  static String? _$id(ReferralReconServiceSearchModel v) => v.id;
  static const Field<ReferralReconServiceSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$clientId(ReferralReconServiceSearchModel v) => v.clientId;
  static const Field<ReferralReconServiceSearchModel, String> _f$clientId =
      Field('clientId', _$clientId, opt: true);
  static String? _$serviceDefId(ReferralReconServiceSearchModel v) =>
      v.serviceDefId;
  static const Field<ReferralReconServiceSearchModel, String> _f$serviceDefId =
      Field('serviceDefId', _$serviceDefId, opt: true);
  static String? _$accountId(ReferralReconServiceSearchModel v) => v.accountId;
  static const Field<ReferralReconServiceSearchModel, String> _f$accountId =
      Field('accountId', _$accountId, opt: true);
  static String? _$createdAt(ReferralReconServiceSearchModel v) => v.createdAt;
  static const Field<ReferralReconServiceSearchModel, String> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static String? _$tenantId(ReferralReconServiceSearchModel v) => v.tenantId;
  static const Field<ReferralReconServiceSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);

  @override
  final MappableFields<ReferralReconServiceSearchModel> fields = const {
    #id: _f$id,
    #clientId: _f$clientId,
    #serviceDefId: _f$serviceDefId,
    #accountId: _f$accountId,
    #createdAt: _f$createdAt,
    #tenantId: _f$tenantId,
  };
  @override
  final bool ignoreNull = true;

  static ReferralReconServiceSearchModel _instantiate(DecodingData data) {
    return ReferralReconServiceSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        clientId: data.dec(_f$clientId),
        serviceDefId: data.dec(_f$serviceDefId),
        accountId: data.dec(_f$accountId),
        createdAt: data.dec(_f$createdAt),
        tenantId: data.dec(_f$tenantId));
  }

  @override
  final Function instantiate = _instantiate;

  static ReferralReconServiceSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReferralReconServiceSearchModel>(map);
  }

  static ReferralReconServiceSearchModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ReferralReconServiceSearchModel>(json);
  }
}

mixin ReferralReconServiceSearchModelMappable {
  String toJson() {
    return ReferralReconServiceSearchModelMapper.ensureInitialized()
        .encodeJson<ReferralReconServiceSearchModel>(
            this as ReferralReconServiceSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ReferralReconServiceSearchModelMapper.ensureInitialized()
        .encodeMap<ReferralReconServiceSearchModel>(
            this as ReferralReconServiceSearchModel);
  }

  ReferralReconServiceSearchModelCopyWith<ReferralReconServiceSearchModel,
          ReferralReconServiceSearchModel, ReferralReconServiceSearchModel>
      get copyWith => _ReferralReconServiceSearchModelCopyWithImpl(
          this as ReferralReconServiceSearchModel, $identity, $identity);
  @override
  String toString() {
    return ReferralReconServiceSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ReferralReconServiceSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ReferralReconServiceSearchModelMapper.ensureInitialized()
                .isValueEqual(this as ReferralReconServiceSearchModel, other));
  }

  @override
  int get hashCode {
    return ReferralReconServiceSearchModelMapper.ensureInitialized()
        .hashValue(this as ReferralReconServiceSearchModel);
  }
}

extension ReferralReconServiceSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReferralReconServiceSearchModel, $Out> {
  ReferralReconServiceSearchModelCopyWith<$R, ReferralReconServiceSearchModel,
          $Out>
      get $asReferralReconServiceSearchModel => $base.as(
          (v, t, t2) => _ReferralReconServiceSearchModelCopyWithImpl(v, t, t2));
}

abstract class ReferralReconServiceSearchModelCopyWith<
    $R,
    $In extends ReferralReconServiceSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? clientId,
      String? serviceDefId,
      String? accountId,
      String? createdAt,
      String? tenantId});
  ReferralReconServiceSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ReferralReconServiceSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReferralReconServiceSearchModel, $Out>
    implements
        ReferralReconServiceSearchModelCopyWith<$R,
            ReferralReconServiceSearchModel, $Out> {
  _ReferralReconServiceSearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReferralReconServiceSearchModel> $mapper =
      ReferralReconServiceSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? clientId = $none,
          Object? serviceDefId = $none,
          Object? accountId = $none,
          Object? createdAt = $none,
          Object? tenantId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (clientId != $none) #clientId: clientId,
        if (serviceDefId != $none) #serviceDefId: serviceDefId,
        if (accountId != $none) #accountId: accountId,
        if (createdAt != $none) #createdAt: createdAt,
        if (tenantId != $none) #tenantId: tenantId
      }));
  @override
  ReferralReconServiceSearchModel $make(CopyWithData data) =>
      ReferralReconServiceSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          clientId: data.get(#clientId, or: $value.clientId),
          serviceDefId: data.get(#serviceDefId, or: $value.serviceDefId),
          accountId: data.get(#accountId, or: $value.accountId),
          createdAt: data.get(#createdAt, or: $value.createdAt),
          tenantId: data.get(#tenantId, or: $value.tenantId));

  @override
  ReferralReconServiceSearchModelCopyWith<$R2, ReferralReconServiceSearchModel,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ReferralReconServiceSearchModelCopyWithImpl($value, $cast, t);
}

class ReferralReconServiceModelMapper
    extends ClassMapperBase<ReferralReconServiceModel> {
  ReferralReconServiceModelMapper._();

  static ReferralReconServiceModelMapper? _instance;
  static ReferralReconServiceModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReferralReconServiceModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ReferralReconServiceModel';

  static String? _$id(ReferralReconServiceModel v) => v.id;
  static const Field<ReferralReconServiceModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String _$clientId(ReferralReconServiceModel v) => v.clientId;
  static const Field<ReferralReconServiceModel, String> _f$clientId =
      Field('clientId', _$clientId);
  static String? _$serviceDefId(ReferralReconServiceModel v) => v.serviceDefId;
  static const Field<ReferralReconServiceModel, String> _f$serviceDefId =
      Field('serviceDefId', _$serviceDefId, opt: true);
  static bool? _$isActive(ReferralReconServiceModel v) => v.isActive;
  static const Field<ReferralReconServiceModel, bool> _f$isActive =
      Field('isActive', _$isActive, opt: true);
  static String? _$accountId(ReferralReconServiceModel v) => v.accountId;
  static const Field<ReferralReconServiceModel, String> _f$accountId =
      Field('accountId', _$accountId, opt: true);
  static String? _$additionalDetails(ReferralReconServiceModel v) =>
      v.additionalDetails;
  static const Field<ReferralReconServiceModel, String> _f$additionalDetails =
      Field('additionalDetails', _$additionalDetails, opt: true);
  static String? _$createdAt(ReferralReconServiceModel v) => v.createdAt;
  static const Field<ReferralReconServiceModel, String> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static bool? _$nonRecoverableError(ReferralReconServiceModel v) =>
      v.nonRecoverableError;
  static const Field<ReferralReconServiceModel, bool> _f$nonRecoverableError =
      Field('nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static String? _$tenantId(ReferralReconServiceModel v) => v.tenantId;
  static const Field<ReferralReconServiceModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ReferralReconServiceModel v) => v.rowVersion;
  static const Field<ReferralReconServiceModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static List<ReferralReconServiceAttributesModel>? _$attributes(
          ReferralReconServiceModel v) =>
      v.attributes;
  static const Field<ReferralReconServiceModel,
          List<ReferralReconServiceAttributesModel>> _f$attributes =
      Field('attributes', _$attributes, opt: true);

  @override
  final MappableFields<ReferralReconServiceModel> fields = const {
    #id: _f$id,
    #clientId: _f$clientId,
    #serviceDefId: _f$serviceDefId,
    #isActive: _f$isActive,
    #accountId: _f$accountId,
    #additionalDetails: _f$additionalDetails,
    #createdAt: _f$createdAt,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #attributes: _f$attributes,
  };
  @override
  final bool ignoreNull = true;

  static ReferralReconServiceModel _instantiate(DecodingData data) {
    return ReferralReconServiceModel(
        id: data.dec(_f$id),
        clientId: data.dec(_f$clientId),
        serviceDefId: data.dec(_f$serviceDefId),
        isActive: data.dec(_f$isActive),
        accountId: data.dec(_f$accountId),
        additionalDetails: data.dec(_f$additionalDetails),
        createdAt: data.dec(_f$createdAt),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        attributes: data.dec(_f$attributes));
  }

  @override
  final Function instantiate = _instantiate;

  static ReferralReconServiceModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReferralReconServiceModel>(map);
  }

  static ReferralReconServiceModel fromJson(String json) {
    return ensureInitialized().decodeJson<ReferralReconServiceModel>(json);
  }
}

mixin ReferralReconServiceModelMappable {
  String toJson() {
    return ReferralReconServiceModelMapper.ensureInitialized()
        .encodeJson<ReferralReconServiceModel>(
            this as ReferralReconServiceModel);
  }

  Map<String, dynamic> toMap() {
    return ReferralReconServiceModelMapper.ensureInitialized()
        .encodeMap<ReferralReconServiceModel>(
            this as ReferralReconServiceModel);
  }

  ReferralReconServiceModelCopyWith<ReferralReconServiceModel,
          ReferralReconServiceModel, ReferralReconServiceModel>
      get copyWith => _ReferralReconServiceModelCopyWithImpl(
          this as ReferralReconServiceModel, $identity, $identity);
  @override
  String toString() {
    return ReferralReconServiceModelMapper.ensureInitialized()
        .stringifyValue(this as ReferralReconServiceModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ReferralReconServiceModelMapper.ensureInitialized()
                .isValueEqual(this as ReferralReconServiceModel, other));
  }

  @override
  int get hashCode {
    return ReferralReconServiceModelMapper.ensureInitialized()
        .hashValue(this as ReferralReconServiceModel);
  }
}

extension ReferralReconServiceModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReferralReconServiceModel, $Out> {
  ReferralReconServiceModelCopyWith<$R, ReferralReconServiceModel, $Out>
      get $asReferralReconServiceModel => $base
          .as((v, t, t2) => _ReferralReconServiceModelCopyWithImpl(v, t, t2));
}

abstract class ReferralReconServiceModelCopyWith<
    $R,
    $In extends ReferralReconServiceModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      ReferralReconServiceAttributesModel,
      ReferralReconServiceAttributesModelCopyWith<
          $R,
          ReferralReconServiceAttributesModel,
          ReferralReconServiceAttributesModel>>? get attributes;
  $R call(
      {String? id,
      String? clientId,
      String? serviceDefId,
      bool? isActive,
      String? accountId,
      String? additionalDetails,
      String? createdAt,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      List<ReferralReconServiceAttributesModel>? attributes});
  ReferralReconServiceModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ReferralReconServiceModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReferralReconServiceModel, $Out>
    implements
        ReferralReconServiceModelCopyWith<$R, ReferralReconServiceModel, $Out> {
  _ReferralReconServiceModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReferralReconServiceModel> $mapper =
      ReferralReconServiceModelMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      ReferralReconServiceAttributesModel,
      ReferralReconServiceAttributesModelCopyWith<
          $R,
          ReferralReconServiceAttributesModel,
          ReferralReconServiceAttributesModel>>? get attributes =>
      $value.attributes != null
          ? ListCopyWith($value.attributes!, (v, t) => v.copyWith.$chain(t),
              (v) => call(attributes: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          String? clientId,
          Object? serviceDefId = $none,
          Object? isActive = $none,
          Object? accountId = $none,
          Object? additionalDetails = $none,
          Object? createdAt = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? attributes = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (clientId != null) #clientId: clientId,
        if (serviceDefId != $none) #serviceDefId: serviceDefId,
        if (isActive != $none) #isActive: isActive,
        if (accountId != $none) #accountId: accountId,
        if (additionalDetails != $none) #additionalDetails: additionalDetails,
        if (createdAt != $none) #createdAt: createdAt,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (attributes != $none) #attributes: attributes
      }));
  @override
  ReferralReconServiceModel $make(CopyWithData data) =>
      ReferralReconServiceModel(
          id: data.get(#id, or: $value.id),
          clientId: data.get(#clientId, or: $value.clientId),
          serviceDefId: data.get(#serviceDefId, or: $value.serviceDefId),
          isActive: data.get(#isActive, or: $value.isActive),
          accountId: data.get(#accountId, or: $value.accountId),
          additionalDetails:
              data.get(#additionalDetails, or: $value.additionalDetails),
          createdAt: data.get(#createdAt, or: $value.createdAt),
          nonRecoverableError:
              data.get(#nonRecoverableError, or: $value.nonRecoverableError),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          rowVersion: data.get(#rowVersion, or: $value.rowVersion),
          attributes: data.get(#attributes, or: $value.attributes));

  @override
  ReferralReconServiceModelCopyWith<$R2, ReferralReconServiceModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ReferralReconServiceModelCopyWithImpl($value, $cast, t);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'referral_recon_service_attributes.dart';

class ReferralReconServiceAttributesSearchModelMapper
    extends ClassMapperBase<ReferralReconServiceAttributesSearchModel> {
  ReferralReconServiceAttributesSearchModelMapper._();

  static ReferralReconServiceAttributesSearchModelMapper? _instance;
  static ReferralReconServiceAttributesSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReferralReconServiceAttributesSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ReferralReconServiceAttributesSearchModel';

  static List<String>? _$clientReferenceId(
          ReferralReconServiceAttributesSearchModel v) =>
      v.clientReferenceId;
  static const Field<ReferralReconServiceAttributesSearchModel, List<String>>
      _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$tenantId(ReferralReconServiceAttributesSearchModel v) =>
      v.tenantId;
  static const Field<ReferralReconServiceAttributesSearchModel, String>
      _f$tenantId = Field('tenantId', _$tenantId, opt: true);

  @override
  final MappableFields<ReferralReconServiceAttributesSearchModel> fields =
      const {
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
  };
  @override
  final bool ignoreNull = true;

  static ReferralReconServiceAttributesSearchModel _instantiate(
      DecodingData data) {
    return ReferralReconServiceAttributesSearchModel.ignoreDeleted(
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId));
  }

  @override
  final Function instantiate = _instantiate;

  static ReferralReconServiceAttributesSearchModel fromMap(
      Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<ReferralReconServiceAttributesSearchModel>(map);
  }

  static ReferralReconServiceAttributesSearchModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ReferralReconServiceAttributesSearchModel>(json);
  }
}

mixin ReferralReconServiceAttributesSearchModelMappable {
  String toJson() {
    return ReferralReconServiceAttributesSearchModelMapper.ensureInitialized()
        .encodeJson<ReferralReconServiceAttributesSearchModel>(
            this as ReferralReconServiceAttributesSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ReferralReconServiceAttributesSearchModelMapper.ensureInitialized()
        .encodeMap<ReferralReconServiceAttributesSearchModel>(
            this as ReferralReconServiceAttributesSearchModel);
  }

  ReferralReconServiceAttributesSearchModelCopyWith<
          ReferralReconServiceAttributesSearchModel,
          ReferralReconServiceAttributesSearchModel,
          ReferralReconServiceAttributesSearchModel>
      get copyWith => _ReferralReconServiceAttributesSearchModelCopyWithImpl(
          this as ReferralReconServiceAttributesSearchModel,
          $identity,
          $identity);
  @override
  String toString() {
    return ReferralReconServiceAttributesSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ReferralReconServiceAttributesSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return ReferralReconServiceAttributesSearchModelMapper.ensureInitialized()
        .equalsValue(this as ReferralReconServiceAttributesSearchModel, other);
  }

  @override
  int get hashCode {
    return ReferralReconServiceAttributesSearchModelMapper.ensureInitialized()
        .hashValue(this as ReferralReconServiceAttributesSearchModel);
  }
}

extension ReferralReconServiceAttributesSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReferralReconServiceAttributesSearchModel, $Out> {
  ReferralReconServiceAttributesSearchModelCopyWith<$R,
          ReferralReconServiceAttributesSearchModel, $Out>
      get $asReferralReconServiceAttributesSearchModel => $base.as((v, t, t2) =>
          _ReferralReconServiceAttributesSearchModelCopyWithImpl(v, t, t2));
}

abstract class ReferralReconServiceAttributesSearchModelCopyWith<
    $R,
    $In extends ReferralReconServiceAttributesSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  $R call({List<String>? clientReferenceId, String? tenantId});
  ReferralReconServiceAttributesSearchModelCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReferralReconServiceAttributesSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReferralReconServiceAttributesSearchModel,
        $Out>
    implements
        ReferralReconServiceAttributesSearchModelCopyWith<$R,
            ReferralReconServiceAttributesSearchModel, $Out> {
  _ReferralReconServiceAttributesSearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReferralReconServiceAttributesSearchModel>
      $mapper =
      ReferralReconServiceAttributesSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId => $value.clientReferenceId != null
          ? ListCopyWith(
              $value.clientReferenceId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(clientReferenceId: v))
          : null;
  @override
  $R call({Object? clientReferenceId = $none, Object? tenantId = $none}) =>
      $apply(FieldCopyWithData({
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId
      }));
  @override
  ReferralReconServiceAttributesSearchModel $make(CopyWithData data) =>
      ReferralReconServiceAttributesSearchModel.ignoreDeleted(
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId));

  @override
  ReferralReconServiceAttributesSearchModelCopyWith<$R2,
      ReferralReconServiceAttributesSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ReferralReconServiceAttributesSearchModelCopyWithImpl($value, $cast, t);
}

class ReferralReconServiceAttributesModelMapper
    extends ClassMapperBase<ReferralReconServiceAttributesModel> {
  ReferralReconServiceAttributesModelMapper._();

  static ReferralReconServiceAttributesModelMapper? _instance;
  static ReferralReconServiceAttributesModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReferralReconServiceAttributesModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ReferralReconServiceAttributesModel';

  static String? _$attributeCode(ReferralReconServiceAttributesModel v) =>
      v.attributeCode;
  static const Field<ReferralReconServiceAttributesModel, String>
      _f$attributeCode = Field('attributeCode', _$attributeCode, opt: true);
  static dynamic _$value(ReferralReconServiceAttributesModel v) => v.value;
  static const Field<ReferralReconServiceAttributesModel, dynamic> _f$value =
      Field('value', _$value, opt: true);
  static String? _$dataType(ReferralReconServiceAttributesModel v) =>
      v.dataType;
  static const Field<ReferralReconServiceAttributesModel, String> _f$dataType =
      Field('dataType', _$dataType, opt: true);
  static String? _$referenceId(ReferralReconServiceAttributesModel v) =>
      v.referenceId;
  static const Field<ReferralReconServiceAttributesModel, String>
      _f$referenceId = Field('referenceId', _$referenceId, opt: true);
  static dynamic _$additionalDetails(ReferralReconServiceAttributesModel v) =>
      v.additionalDetails;
  static const Field<ReferralReconServiceAttributesModel, dynamic>
      _f$additionalDetails =
      Field('additionalDetails', _$additionalDetails, opt: true);
  static bool? _$nonRecoverableError(ReferralReconServiceAttributesModel v) =>
      v.nonRecoverableError;
  static const Field<ReferralReconServiceAttributesModel, bool>
      _f$nonRecoverableError = Field(
          'nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static String _$clientReferenceId(ReferralReconServiceAttributesModel v) =>
      v.clientReferenceId;
  static const Field<ReferralReconServiceAttributesModel, String>
      _f$clientReferenceId = Field('clientReferenceId', _$clientReferenceId);
  static String? _$tenantId(ReferralReconServiceAttributesModel v) =>
      v.tenantId;
  static const Field<ReferralReconServiceAttributesModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ReferralReconServiceAttributesModel v) =>
      v.rowVersion;
  static const Field<ReferralReconServiceAttributesModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);

  @override
  final MappableFields<ReferralReconServiceAttributesModel> fields = const {
    #attributeCode: _f$attributeCode,
    #value: _f$value,
    #dataType: _f$dataType,
    #referenceId: _f$referenceId,
    #additionalDetails: _f$additionalDetails,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
  };
  @override
  final bool ignoreNull = true;

  static ReferralReconServiceAttributesModel _instantiate(DecodingData data) {
    return ReferralReconServiceAttributesModel(
        attributeCode: data.dec(_f$attributeCode),
        value: data.dec(_f$value),
        dataType: data.dec(_f$dataType),
        referenceId: data.dec(_f$referenceId),
        additionalDetails: data.dec(_f$additionalDetails),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion));
  }

  @override
  final Function instantiate = _instantiate;

  static ReferralReconServiceAttributesModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<ReferralReconServiceAttributesModel>(map);
  }

  static ReferralReconServiceAttributesModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ReferralReconServiceAttributesModel>(json);
  }
}

mixin ReferralReconServiceAttributesModelMappable {
  String toJson() {
    return ReferralReconServiceAttributesModelMapper.ensureInitialized()
        .encodeJson<ReferralReconServiceAttributesModel>(
            this as ReferralReconServiceAttributesModel);
  }

  Map<String, dynamic> toMap() {
    return ReferralReconServiceAttributesModelMapper.ensureInitialized()
        .encodeMap<ReferralReconServiceAttributesModel>(
            this as ReferralReconServiceAttributesModel);
  }

  ReferralReconServiceAttributesModelCopyWith<
          ReferralReconServiceAttributesModel,
          ReferralReconServiceAttributesModel,
          ReferralReconServiceAttributesModel>
      get copyWith => _ReferralReconServiceAttributesModelCopyWithImpl(
          this as ReferralReconServiceAttributesModel, $identity, $identity);
  @override
  String toString() {
    return ReferralReconServiceAttributesModelMapper.ensureInitialized()
        .stringifyValue(this as ReferralReconServiceAttributesModel);
  }

  @override
  bool operator ==(Object other) {
    return ReferralReconServiceAttributesModelMapper.ensureInitialized()
        .equalsValue(this as ReferralReconServiceAttributesModel, other);
  }

  @override
  int get hashCode {
    return ReferralReconServiceAttributesModelMapper.ensureInitialized()
        .hashValue(this as ReferralReconServiceAttributesModel);
  }
}

extension ReferralReconServiceAttributesModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReferralReconServiceAttributesModel, $Out> {
  ReferralReconServiceAttributesModelCopyWith<$R,
          ReferralReconServiceAttributesModel, $Out>
      get $asReferralReconServiceAttributesModel => $base.as((v, t, t2) =>
          _ReferralReconServiceAttributesModelCopyWithImpl(v, t, t2));
}

abstract class ReferralReconServiceAttributesModelCopyWith<
    $R,
    $In extends ReferralReconServiceAttributesModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? attributeCode,
      dynamic value,
      String? dataType,
      String? referenceId,
      dynamic additionalDetails,
      bool? nonRecoverableError,
      String? clientReferenceId,
      String? tenantId,
      int? rowVersion});
  ReferralReconServiceAttributesModelCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReferralReconServiceAttributesModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReferralReconServiceAttributesModel, $Out>
    implements
        ReferralReconServiceAttributesModelCopyWith<$R,
            ReferralReconServiceAttributesModel, $Out> {
  _ReferralReconServiceAttributesModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReferralReconServiceAttributesModel> $mapper =
      ReferralReconServiceAttributesModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? attributeCode = $none,
          Object? value = $none,
          Object? dataType = $none,
          Object? referenceId = $none,
          Object? additionalDetails = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? tenantId = $none,
          Object? rowVersion = $none}) =>
      $apply(FieldCopyWithData({
        if (attributeCode != $none) #attributeCode: attributeCode,
        if (value != $none) #value: value,
        if (dataType != $none) #dataType: dataType,
        if (referenceId != $none) #referenceId: referenceId,
        if (additionalDetails != $none) #additionalDetails: additionalDetails,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion
      }));
  @override
  ReferralReconServiceAttributesModel $make(CopyWithData data) =>
      ReferralReconServiceAttributesModel(
          attributeCode: data.get(#attributeCode, or: $value.attributeCode),
          value: data.get(#value, or: $value.value),
          dataType: data.get(#dataType, or: $value.dataType),
          referenceId: data.get(#referenceId, or: $value.referenceId),
          additionalDetails:
              data.get(#additionalDetails, or: $value.additionalDetails),
          nonRecoverableError:
              data.get(#nonRecoverableError, or: $value.nonRecoverableError),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          rowVersion: data.get(#rowVersion, or: $value.rowVersion));

  @override
  ReferralReconServiceAttributesModelCopyWith<$R2,
      ReferralReconServiceAttributesModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ReferralReconServiceAttributesModelCopyWithImpl($value, $cast, t);
}

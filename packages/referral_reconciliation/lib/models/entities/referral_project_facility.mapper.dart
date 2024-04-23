// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'referral_project_facility.dart';

class ReferralProjectFacilitySearchModelMapper
    extends ClassMapperBase<ReferralProjectFacilitySearchModel> {
  ReferralProjectFacilitySearchModelMapper._();

  static ReferralProjectFacilitySearchModelMapper? _instance;
  static ReferralProjectFacilitySearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReferralProjectFacilitySearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ReferralProjectFacilitySearchModel';

  static String? _$id(ReferralProjectFacilitySearchModel v) => v.id;
  static const Field<ReferralProjectFacilitySearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static List<String>? _$facilityId(ReferralProjectFacilitySearchModel v) =>
      v.facilityId;
  static const Field<ReferralProjectFacilitySearchModel, List<String>>
      _f$facilityId = Field('facilityId', _$facilityId, opt: true);
  static List<String>? _$projectId(ReferralProjectFacilitySearchModel v) =>
      v.projectId;
  static const Field<ReferralProjectFacilitySearchModel, List<String>>
      _f$projectId = Field('projectId', _$projectId, opt: true);
  static String? _$tenantId(ReferralProjectFacilitySearchModel v) => v.tenantId;
  static const Field<ReferralProjectFacilitySearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);

  @override
  final MappableFields<ReferralProjectFacilitySearchModel> fields = const {
    #id: _f$id,
    #facilityId: _f$facilityId,
    #projectId: _f$projectId,
    #tenantId: _f$tenantId,
  };
  @override
  final bool ignoreNull = true;

  static ReferralProjectFacilitySearchModel _instantiate(DecodingData data) {
    return ReferralProjectFacilitySearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        facilityId: data.dec(_f$facilityId),
        projectId: data.dec(_f$projectId),
        tenantId: data.dec(_f$tenantId));
  }

  @override
  final Function instantiate = _instantiate;

  static ReferralProjectFacilitySearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<ReferralProjectFacilitySearchModel>(map);
  }

  static ReferralProjectFacilitySearchModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ReferralProjectFacilitySearchModel>(json);
  }
}

mixin ReferralProjectFacilitySearchModelMappable {
  String toJson() {
    return ReferralProjectFacilitySearchModelMapper.ensureInitialized()
        .encodeJson<ReferralProjectFacilitySearchModel>(
            this as ReferralProjectFacilitySearchModel);
  }

  Map<String, dynamic> toMap() {
    return ReferralProjectFacilitySearchModelMapper.ensureInitialized()
        .encodeMap<ReferralProjectFacilitySearchModel>(
            this as ReferralProjectFacilitySearchModel);
  }

  ReferralProjectFacilitySearchModelCopyWith<
          ReferralProjectFacilitySearchModel,
          ReferralProjectFacilitySearchModel,
          ReferralProjectFacilitySearchModel>
      get copyWith => _ReferralProjectFacilitySearchModelCopyWithImpl(
          this as ReferralProjectFacilitySearchModel, $identity, $identity);
  @override
  String toString() {
    return ReferralProjectFacilitySearchModelMapper.ensureInitialized()
        .stringifyValue(this as ReferralProjectFacilitySearchModel);
  }

  @override
  bool operator ==(Object other) {
    return ReferralProjectFacilitySearchModelMapper.ensureInitialized()
        .equalsValue(this as ReferralProjectFacilitySearchModel, other);
  }

  @override
  int get hashCode {
    return ReferralProjectFacilitySearchModelMapper.ensureInitialized()
        .hashValue(this as ReferralProjectFacilitySearchModel);
  }
}

extension ReferralProjectFacilitySearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReferralProjectFacilitySearchModel, $Out> {
  ReferralProjectFacilitySearchModelCopyWith<$R,
          ReferralProjectFacilitySearchModel, $Out>
      get $asReferralProjectFacilitySearchModel => $base.as((v, t, t2) =>
          _ReferralProjectFacilitySearchModelCopyWithImpl(v, t, t2));
}

abstract class ReferralProjectFacilitySearchModelCopyWith<
    $R,
    $In extends ReferralProjectFacilitySearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get facilityId;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get projectId;
  $R call(
      {String? id,
      List<String>? facilityId,
      List<String>? projectId,
      String? tenantId});
  ReferralProjectFacilitySearchModelCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReferralProjectFacilitySearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReferralProjectFacilitySearchModel, $Out>
    implements
        ReferralProjectFacilitySearchModelCopyWith<$R,
            ReferralProjectFacilitySearchModel, $Out> {
  _ReferralProjectFacilitySearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReferralProjectFacilitySearchModel> $mapper =
      ReferralProjectFacilitySearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get facilityId => $value.facilityId != null
          ? ListCopyWith(
              $value.facilityId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(facilityId: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get projectId =>
      $value.projectId != null
          ? ListCopyWith(
              $value.projectId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(projectId: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? facilityId = $none,
          Object? projectId = $none,
          Object? tenantId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (facilityId != $none) #facilityId: facilityId,
        if (projectId != $none) #projectId: projectId,
        if (tenantId != $none) #tenantId: tenantId
      }));
  @override
  ReferralProjectFacilitySearchModel $make(CopyWithData data) =>
      ReferralProjectFacilitySearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          facilityId: data.get(#facilityId, or: $value.facilityId),
          projectId: data.get(#projectId, or: $value.projectId),
          tenantId: data.get(#tenantId, or: $value.tenantId));

  @override
  ReferralProjectFacilitySearchModelCopyWith<$R2,
      ReferralProjectFacilitySearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ReferralProjectFacilitySearchModelCopyWithImpl($value, $cast, t);
}

class ReferralProjectFacilityModelMapper
    extends ClassMapperBase<ReferralProjectFacilityModel> {
  ReferralProjectFacilityModelMapper._();

  static ReferralProjectFacilityModelMapper? _instance;
  static ReferralProjectFacilityModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReferralProjectFacilityModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ReferralProjectFacilityModel';

  static String _$id(ReferralProjectFacilityModel v) => v.id;
  static const Field<ReferralProjectFacilityModel, String> _f$id =
      Field('id', _$id);
  static String? _$facilityId(ReferralProjectFacilityModel v) => v.facilityId;
  static const Field<ReferralProjectFacilityModel, String> _f$facilityId =
      Field('facilityId', _$facilityId, opt: true);
  static List<String>? _$projectId(ReferralProjectFacilityModel v) =>
      v.projectId;
  static const Field<ReferralProjectFacilityModel, List<String>> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static bool? _$nonRecoverableError(ReferralProjectFacilityModel v) =>
      v.nonRecoverableError;
  static const Field<ReferralProjectFacilityModel, bool>
      _f$nonRecoverableError = Field(
          'nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static String? _$tenantId(ReferralProjectFacilityModel v) => v.tenantId;
  static const Field<ReferralProjectFacilityModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ReferralProjectFacilityModel v) => v.rowVersion;
  static const Field<ReferralProjectFacilityModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);

  @override
  final MappableFields<ReferralProjectFacilityModel> fields = const {
    #id: _f$id,
    #facilityId: _f$facilityId,
    #projectId: _f$projectId,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
  };
  @override
  final bool ignoreNull = true;

  static ReferralProjectFacilityModel _instantiate(DecodingData data) {
    return ReferralProjectFacilityModel(
        id: data.dec(_f$id),
        facilityId: data.dec(_f$facilityId),
        projectId: data.dec(_f$projectId),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion));
  }

  @override
  final Function instantiate = _instantiate;

  static ReferralProjectFacilityModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReferralProjectFacilityModel>(map);
  }

  static ReferralProjectFacilityModel fromJson(String json) {
    return ensureInitialized().decodeJson<ReferralProjectFacilityModel>(json);
  }
}

mixin ReferralProjectFacilityModelMappable {
  String toJson() {
    return ReferralProjectFacilityModelMapper.ensureInitialized()
        .encodeJson<ReferralProjectFacilityModel>(
            this as ReferralProjectFacilityModel);
  }

  Map<String, dynamic> toMap() {
    return ReferralProjectFacilityModelMapper.ensureInitialized()
        .encodeMap<ReferralProjectFacilityModel>(
            this as ReferralProjectFacilityModel);
  }

  ReferralProjectFacilityModelCopyWith<ReferralProjectFacilityModel,
          ReferralProjectFacilityModel, ReferralProjectFacilityModel>
      get copyWith => _ReferralProjectFacilityModelCopyWithImpl(
          this as ReferralProjectFacilityModel, $identity, $identity);
  @override
  String toString() {
    return ReferralProjectFacilityModelMapper.ensureInitialized()
        .stringifyValue(this as ReferralProjectFacilityModel);
  }

  @override
  bool operator ==(Object other) {
    return ReferralProjectFacilityModelMapper.ensureInitialized()
        .equalsValue(this as ReferralProjectFacilityModel, other);
  }

  @override
  int get hashCode {
    return ReferralProjectFacilityModelMapper.ensureInitialized()
        .hashValue(this as ReferralProjectFacilityModel);
  }
}

extension ReferralProjectFacilityModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReferralProjectFacilityModel, $Out> {
  ReferralProjectFacilityModelCopyWith<$R, ReferralProjectFacilityModel, $Out>
      get $asReferralProjectFacilityModel => $base.as(
          (v, t, t2) => _ReferralProjectFacilityModelCopyWithImpl(v, t, t2));
}

abstract class ReferralProjectFacilityModelCopyWith<
    $R,
    $In extends ReferralProjectFacilityModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get projectId;
  $R call(
      {String? id,
      String? facilityId,
      List<String>? projectId,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion});
  ReferralProjectFacilityModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ReferralProjectFacilityModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReferralProjectFacilityModel, $Out>
    implements
        ReferralProjectFacilityModelCopyWith<$R, ReferralProjectFacilityModel,
            $Out> {
  _ReferralProjectFacilityModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReferralProjectFacilityModel> $mapper =
      ReferralProjectFacilityModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get projectId =>
      $value.projectId != null
          ? ListCopyWith(
              $value.projectId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(projectId: v))
          : null;
  @override
  $R call(
          {String? id,
          Object? facilityId = $none,
          Object? projectId = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (facilityId != $none) #facilityId: facilityId,
        if (projectId != $none) #projectId: projectId,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion
      }));
  @override
  ReferralProjectFacilityModel $make(CopyWithData data) =>
      ReferralProjectFacilityModel(
          id: data.get(#id, or: $value.id),
          facilityId: data.get(#facilityId, or: $value.facilityId),
          projectId: data.get(#projectId, or: $value.projectId),
          nonRecoverableError:
              data.get(#nonRecoverableError, or: $value.nonRecoverableError),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          rowVersion: data.get(#rowVersion, or: $value.rowVersion));

  @override
  ReferralProjectFacilityModelCopyWith<$R2, ReferralProjectFacilityModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ReferralProjectFacilityModelCopyWithImpl($value, $cast, t);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'h_f_referral.dart';

class HFReferralSearchModelMapper
    extends ClassMapperBase<HFReferralSearchModel> {
  HFReferralSearchModelMapper._();

  static HFReferralSearchModelMapper? _instance;
  static HFReferralSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HFReferralSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HFReferralSearchModel';

  static String? _$id(HFReferralSearchModel v) => v.id;
  static const Field<HFReferralSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(HFReferralSearchModel v) => v.tenantId;
  static const Field<HFReferralSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$name(HFReferralSearchModel v) => v.name;
  static const Field<HFReferralSearchModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$projectId(HFReferralSearchModel v) => v.projectId;
  static const Field<HFReferralSearchModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$projectFacilityId(HFReferralSearchModel v) =>
      v.projectFacilityId;
  static const Field<HFReferralSearchModel, String> _f$projectFacilityId =
      Field('projectFacilityId', _$projectFacilityId, opt: true);
  static String? _$symptomSurveyId(HFReferralSearchModel v) =>
      v.symptomSurveyId;
  static const Field<HFReferralSearchModel, String> _f$symptomSurveyId =
      Field('symptomSurveyId', _$symptomSurveyId, opt: true);
  static String? _$beneficiaryId(HFReferralSearchModel v) => v.beneficiaryId;
  static const Field<HFReferralSearchModel, String> _f$beneficiaryId =
      Field('beneficiaryId', _$beneficiaryId, opt: true);
  static String? _$referralCode(HFReferralSearchModel v) => v.referralCode;
  static const Field<HFReferralSearchModel, String> _f$referralCode =
      Field('referralCode', _$referralCode, opt: true);
  static String? _$nationalLevelId(HFReferralSearchModel v) =>
      v.nationalLevelId;
  static const Field<HFReferralSearchModel, String> _f$nationalLevelId =
      Field('nationalLevelId', _$nationalLevelId, opt: true);
  static String? _$symptom(HFReferralSearchModel v) => v.symptom;
  static const Field<HFReferralSearchModel, String> _f$symptom =
      Field('symptom', _$symptom, opt: true);
  static List<String>? _$clientReferenceId(HFReferralSearchModel v) =>
      v.clientReferenceId;
  static const Field<HFReferralSearchModel, List<String>> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);

  @override
  final MappableFields<HFReferralSearchModel> fields = const {
    #id: _f$id,
    #tenantId: _f$tenantId,
    #name: _f$name,
    #projectId: _f$projectId,
    #projectFacilityId: _f$projectFacilityId,
    #symptomSurveyId: _f$symptomSurveyId,
    #beneficiaryId: _f$beneficiaryId,
    #referralCode: _f$referralCode,
    #nationalLevelId: _f$nationalLevelId,
    #symptom: _f$symptom,
    #clientReferenceId: _f$clientReferenceId,
  };
  @override
  final bool ignoreNull = true;

  static HFReferralSearchModel _instantiate(DecodingData data) {
    return HFReferralSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        name: data.dec(_f$name),
        projectId: data.dec(_f$projectId),
        projectFacilityId: data.dec(_f$projectFacilityId),
        symptomSurveyId: data.dec(_f$symptomSurveyId),
        beneficiaryId: data.dec(_f$beneficiaryId),
        referralCode: data.dec(_f$referralCode),
        nationalLevelId: data.dec(_f$nationalLevelId),
        symptom: data.dec(_f$symptom),
        clientReferenceId: data.dec(_f$clientReferenceId));
  }

  @override
  final Function instantiate = _instantiate;

  static HFReferralSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HFReferralSearchModel>(map);
  }

  static HFReferralSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<HFReferralSearchModel>(json);
  }
}

mixin HFReferralSearchModelMappable {
  String toJson() {
    return HFReferralSearchModelMapper.ensureInitialized()
        .encodeJson<HFReferralSearchModel>(this as HFReferralSearchModel);
  }

  Map<String, dynamic> toMap() {
    return HFReferralSearchModelMapper.ensureInitialized()
        .encodeMap<HFReferralSearchModel>(this as HFReferralSearchModel);
  }

  HFReferralSearchModelCopyWith<HFReferralSearchModel, HFReferralSearchModel,
          HFReferralSearchModel>
      get copyWith => _HFReferralSearchModelCopyWithImpl(
          this as HFReferralSearchModel, $identity, $identity);
  @override
  String toString() {
    return HFReferralSearchModelMapper.ensureInitialized()
        .stringifyValue(this as HFReferralSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return HFReferralSearchModelMapper.ensureInitialized()
        .equalsValue(this as HFReferralSearchModel, other);
  }

  @override
  int get hashCode {
    return HFReferralSearchModelMapper.ensureInitialized()
        .hashValue(this as HFReferralSearchModel);
  }
}

extension HFReferralSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HFReferralSearchModel, $Out> {
  HFReferralSearchModelCopyWith<$R, HFReferralSearchModel, $Out>
      get $asHFReferralSearchModel =>
          $base.as((v, t, t2) => _HFReferralSearchModelCopyWithImpl(v, t, t2));
}

abstract class HFReferralSearchModelCopyWith<
    $R,
    $In extends HFReferralSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  $R call(
      {String? id,
      String? tenantId,
      String? name,
      String? projectId,
      String? projectFacilityId,
      String? symptomSurveyId,
      String? beneficiaryId,
      String? referralCode,
      String? nationalLevelId,
      String? symptom,
      List<String>? clientReferenceId});
  HFReferralSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HFReferralSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HFReferralSearchModel, $Out>
    implements HFReferralSearchModelCopyWith<$R, HFReferralSearchModel, $Out> {
  _HFReferralSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HFReferralSearchModel> $mapper =
      HFReferralSearchModelMapper.ensureInitialized();
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
          Object? tenantId = $none,
          Object? name = $none,
          Object? projectId = $none,
          Object? projectFacilityId = $none,
          Object? symptomSurveyId = $none,
          Object? beneficiaryId = $none,
          Object? referralCode = $none,
          Object? nationalLevelId = $none,
          Object? symptom = $none,
          Object? clientReferenceId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (name != $none) #name: name,
        if (projectId != $none) #projectId: projectId,
        if (projectFacilityId != $none) #projectFacilityId: projectFacilityId,
        if (symptomSurveyId != $none) #symptomSurveyId: symptomSurveyId,
        if (beneficiaryId != $none) #beneficiaryId: beneficiaryId,
        if (referralCode != $none) #referralCode: referralCode,
        if (nationalLevelId != $none) #nationalLevelId: nationalLevelId,
        if (symptom != $none) #symptom: symptom,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId
      }));
  @override
  HFReferralSearchModel $make(
          CopyWithData data) =>
      HFReferralSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          name: data.get(#name, or: $value.name),
          projectId: data.get(#projectId, or: $value.projectId),
          projectFacilityId:
              data.get(#projectFacilityId, or: $value.projectFacilityId),
          symptomSurveyId:
              data.get(#symptomSurveyId, or: $value.symptomSurveyId),
          beneficiaryId: data.get(#beneficiaryId, or: $value.beneficiaryId),
          referralCode: data.get(#referralCode, or: $value.referralCode),
          nationalLevelId:
              data.get(#nationalLevelId, or: $value.nationalLevelId),
          symptom: data.get(#symptom, or: $value.symptom),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId));

  @override
  HFReferralSearchModelCopyWith<$R2, HFReferralSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HFReferralSearchModelCopyWithImpl($value, $cast, t);
}

class HFReferralModelMapper extends ClassMapperBase<HFReferralModel> {
  HFReferralModelMapper._();

  static HFReferralModelMapper? _instance;
  static HFReferralModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HFReferralModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HFReferralModel';

  static String? _$id(HFReferralModel v) => v.id;
  static const Field<HFReferralModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(HFReferralModel v) => v.tenantId;
  static const Field<HFReferralModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$name(HFReferralModel v) => v.name;
  static const Field<HFReferralModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$projectId(HFReferralModel v) => v.projectId;
  static const Field<HFReferralModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$projectFacilityId(HFReferralModel v) => v.projectFacilityId;
  static const Field<HFReferralModel, String> _f$projectFacilityId =
      Field('projectFacilityId', _$projectFacilityId, opt: true);
  static String? _$symptomSurveyId(HFReferralModel v) => v.symptomSurveyId;
  static const Field<HFReferralModel, String> _f$symptomSurveyId =
      Field('symptomSurveyId', _$symptomSurveyId, opt: true);
  static String? _$beneficiaryId(HFReferralModel v) => v.beneficiaryId;
  static const Field<HFReferralModel, String> _f$beneficiaryId =
      Field('beneficiaryId', _$beneficiaryId, opt: true);
  static String? _$referralCode(HFReferralModel v) => v.referralCode;
  static const Field<HFReferralModel, String> _f$referralCode =
      Field('referralCode', _$referralCode, opt: true);
  static String? _$nationalLevelId(HFReferralModel v) => v.nationalLevelId;
  static const Field<HFReferralModel, String> _f$nationalLevelId =
      Field('nationalLevelId', _$nationalLevelId, opt: true);
  static String? _$symptom(HFReferralModel v) => v.symptom;
  static const Field<HFReferralModel, String> _f$symptom =
      Field('symptom', _$symptom, opt: true);
  static bool? _$nonRecoverableError(HFReferralModel v) =>
      v.nonRecoverableError;
  static const Field<HFReferralModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String _$clientReferenceId(HFReferralModel v) => v.clientReferenceId;
  static const Field<HFReferralModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static int? _$rowVersion(HFReferralModel v) => v.rowVersion;
  static const Field<HFReferralModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);

  @override
  final MappableFields<HFReferralModel> fields = const {
    #id: _f$id,
    #tenantId: _f$tenantId,
    #name: _f$name,
    #projectId: _f$projectId,
    #projectFacilityId: _f$projectFacilityId,
    #symptomSurveyId: _f$symptomSurveyId,
    #beneficiaryId: _f$beneficiaryId,
    #referralCode: _f$referralCode,
    #nationalLevelId: _f$nationalLevelId,
    #symptom: _f$symptom,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
    #rowVersion: _f$rowVersion,
  };
  @override
  final bool ignoreNull = true;

  static HFReferralModel _instantiate(DecodingData data) {
    return HFReferralModel(
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        name: data.dec(_f$name),
        projectId: data.dec(_f$projectId),
        projectFacilityId: data.dec(_f$projectFacilityId),
        symptomSurveyId: data.dec(_f$symptomSurveyId),
        beneficiaryId: data.dec(_f$beneficiaryId),
        referralCode: data.dec(_f$referralCode),
        nationalLevelId: data.dec(_f$nationalLevelId),
        symptom: data.dec(_f$symptom),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        rowVersion: data.dec(_f$rowVersion));
  }

  @override
  final Function instantiate = _instantiate;

  static HFReferralModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HFReferralModel>(map);
  }

  static HFReferralModel fromJson(String json) {
    return ensureInitialized().decodeJson<HFReferralModel>(json);
  }
}

mixin HFReferralModelMappable {
  String toJson() {
    return HFReferralModelMapper.ensureInitialized()
        .encodeJson<HFReferralModel>(this as HFReferralModel);
  }

  Map<String, dynamic> toMap() {
    return HFReferralModelMapper.ensureInitialized()
        .encodeMap<HFReferralModel>(this as HFReferralModel);
  }

  HFReferralModelCopyWith<HFReferralModel, HFReferralModel, HFReferralModel>
      get copyWith => _HFReferralModelCopyWithImpl(
          this as HFReferralModel, $identity, $identity);
  @override
  String toString() {
    return HFReferralModelMapper.ensureInitialized()
        .stringifyValue(this as HFReferralModel);
  }

  @override
  bool operator ==(Object other) {
    return HFReferralModelMapper.ensureInitialized()
        .equalsValue(this as HFReferralModel, other);
  }

  @override
  int get hashCode {
    return HFReferralModelMapper.ensureInitialized()
        .hashValue(this as HFReferralModel);
  }
}

extension HFReferralModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HFReferralModel, $Out> {
  HFReferralModelCopyWith<$R, HFReferralModel, $Out> get $asHFReferralModel =>
      $base.as((v, t, t2) => _HFReferralModelCopyWithImpl(v, t, t2));
}

abstract class HFReferralModelCopyWith<$R, $In extends HFReferralModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? tenantId,
      String? name,
      String? projectId,
      String? projectFacilityId,
      String? symptomSurveyId,
      String? beneficiaryId,
      String? referralCode,
      String? nationalLevelId,
      String? symptom,
      bool? nonRecoverableError,
      String? clientReferenceId,
      int? rowVersion});
  HFReferralModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HFReferralModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HFReferralModel, $Out>
    implements HFReferralModelCopyWith<$R, HFReferralModel, $Out> {
  _HFReferralModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HFReferralModel> $mapper =
      HFReferralModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? tenantId = $none,
          Object? name = $none,
          Object? projectId = $none,
          Object? projectFacilityId = $none,
          Object? symptomSurveyId = $none,
          Object? beneficiaryId = $none,
          Object? referralCode = $none,
          Object? nationalLevelId = $none,
          Object? symptom = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? rowVersion = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (name != $none) #name: name,
        if (projectId != $none) #projectId: projectId,
        if (projectFacilityId != $none) #projectFacilityId: projectFacilityId,
        if (symptomSurveyId != $none) #symptomSurveyId: symptomSurveyId,
        if (beneficiaryId != $none) #beneficiaryId: beneficiaryId,
        if (referralCode != $none) #referralCode: referralCode,
        if (nationalLevelId != $none) #nationalLevelId: nationalLevelId,
        if (symptom != $none) #symptom: symptom,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (rowVersion != $none) #rowVersion: rowVersion
      }));
  @override
  HFReferralModel $make(CopyWithData data) => HFReferralModel(
      id: data.get(#id, or: $value.id),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      name: data.get(#name, or: $value.name),
      projectId: data.get(#projectId, or: $value.projectId),
      projectFacilityId:
          data.get(#projectFacilityId, or: $value.projectFacilityId),
      symptomSurveyId: data.get(#symptomSurveyId, or: $value.symptomSurveyId),
      beneficiaryId: data.get(#beneficiaryId, or: $value.beneficiaryId),
      referralCode: data.get(#referralCode, or: $value.referralCode),
      nationalLevelId: data.get(#nationalLevelId, or: $value.nationalLevelId),
      symptom: data.get(#symptom, or: $value.symptom),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion));

  @override
  HFReferralModelCopyWith<$R2, HFReferralModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HFReferralModelCopyWithImpl($value, $cast, t);
}

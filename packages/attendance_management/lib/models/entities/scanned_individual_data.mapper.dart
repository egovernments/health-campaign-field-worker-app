// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'scanned_individual_data.dart';

class ScannedIndividualDataModelMapper
    extends ClassMapperBase<ScannedIndividualDataModel> {
  ScannedIndividualDataModelMapper._();

  static ScannedIndividualDataModelMapper? _instance;
  static ScannedIndividualDataModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ScannedIndividualDataModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ScannedIndividualDataModel';

  static String? _$individualId(ScannedIndividualDataModel v) => v.individualId;
  static const Field<ScannedIndividualDataModel, String> _f$individualId =
      Field('individualId', _$individualId, opt: true);
  static int? _$qrCreatedTime(ScannedIndividualDataModel v) => v.qrCreatedTime;
  static const Field<ScannedIndividualDataModel, int> _f$qrCreatedTime =
      Field('qrCreatedTime', _$qrCreatedTime, opt: true);
  static String? _$name(ScannedIndividualDataModel v) => v.name;
  static const Field<ScannedIndividualDataModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$locality(ScannedIndividualDataModel v) => v.locality;
  static const Field<ScannedIndividualDataModel, String> _f$locality =
      Field('locality', _$locality, opt: true);
  static int? _$age(ScannedIndividualDataModel v) => v.age;
  static const Field<ScannedIndividualDataModel, int> _f$age =
      Field('age', _$age, opt: true);

  @override
  final MappableFields<ScannedIndividualDataModel> fields = const {
    #individualId: _f$individualId,
    #qrCreatedTime: _f$qrCreatedTime,
    #name: _f$name,
    #locality: _f$locality,
    #age: _f$age,
  };

  static ScannedIndividualDataModel _instantiate(DecodingData data) {
    return ScannedIndividualDataModel(
        individualId: data.dec(_f$individualId),
        qrCreatedTime: data.dec(_f$qrCreatedTime),
        name: data.dec(_f$name),
        locality: data.dec(_f$locality),
        age: data.dec(_f$age));
  }

  @override
  final Function instantiate = _instantiate;

  static ScannedIndividualDataModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ScannedIndividualDataModel>(map);
  }

  static ScannedIndividualDataModel fromJson(String json) {
    return ensureInitialized().decodeJson<ScannedIndividualDataModel>(json);
  }
}

mixin ScannedIndividualDataModelMappable {
  String toJson() {
    return ScannedIndividualDataModelMapper.ensureInitialized()
        .encodeJson<ScannedIndividualDataModel>(
            this as ScannedIndividualDataModel);
  }

  Map<String, dynamic> toMap() {
    return ScannedIndividualDataModelMapper.ensureInitialized()
        .encodeMap<ScannedIndividualDataModel>(
            this as ScannedIndividualDataModel);
  }

  ScannedIndividualDataModelCopyWith<ScannedIndividualDataModel,
          ScannedIndividualDataModel, ScannedIndividualDataModel>
      get copyWith => _ScannedIndividualDataModelCopyWithImpl(
          this as ScannedIndividualDataModel, $identity, $identity);
  @override
  String toString() {
    return ScannedIndividualDataModelMapper.ensureInitialized()
        .stringifyValue(this as ScannedIndividualDataModel);
  }

  @override
  bool operator ==(Object other) {
    return ScannedIndividualDataModelMapper.ensureInitialized()
        .equalsValue(this as ScannedIndividualDataModel, other);
  }

  @override
  int get hashCode {
    return ScannedIndividualDataModelMapper.ensureInitialized()
        .hashValue(this as ScannedIndividualDataModel);
  }
}

extension ScannedIndividualDataModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ScannedIndividualDataModel, $Out> {
  ScannedIndividualDataModelCopyWith<$R, ScannedIndividualDataModel, $Out>
      get $asScannedIndividualDataModel => $base
          .as((v, t, t2) => _ScannedIndividualDataModelCopyWithImpl(v, t, t2));
}

abstract class ScannedIndividualDataModelCopyWith<
    $R,
    $In extends ScannedIndividualDataModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? individualId,
      int? qrCreatedTime,
      String? name,
      String? locality,
      int? age});
  ScannedIndividualDataModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ScannedIndividualDataModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ScannedIndividualDataModel, $Out>
    implements
        ScannedIndividualDataModelCopyWith<$R, ScannedIndividualDataModel,
            $Out> {
  _ScannedIndividualDataModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ScannedIndividualDataModel> $mapper =
      ScannedIndividualDataModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? individualId = $none,
          Object? qrCreatedTime = $none,
          Object? name = $none,
          Object? locality = $none,
          Object? age = $none}) =>
      $apply(FieldCopyWithData({
        if (individualId != $none) #individualId: individualId,
        if (qrCreatedTime != $none) #qrCreatedTime: qrCreatedTime,
        if (name != $none) #name: name,
        if (locality != $none) #locality: locality,
        if (age != $none) #age: age
      }));
  @override
  ScannedIndividualDataModel $make(CopyWithData data) =>
      ScannedIndividualDataModel(
          individualId: data.get(#individualId, or: $value.individualId),
          qrCreatedTime: data.get(#qrCreatedTime, or: $value.qrCreatedTime),
          name: data.get(#name, or: $value.name),
          locality: data.get(#locality, or: $value.locality),
          age: data.get(#age, or: $value.age));

  @override
  ScannedIndividualDataModelCopyWith<$R2, ScannedIndividualDataModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ScannedIndividualDataModelCopyWithImpl($value, $cast, t);
}

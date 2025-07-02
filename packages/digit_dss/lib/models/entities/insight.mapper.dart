// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'insight.dart';

class InsightModelMapper extends ClassMapperBase<InsightModel> {
  InsightModelMapper._();

  static InsightModelMapper? _instance;
  static InsightModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InsightModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'InsightModel';

  static String? _$colorCode(InsightModel v) => v.colorCode;
  static const Field<InsightModel, String> _f$colorCode =
      Field('colorCode', _$colorCode, opt: true);
  static String? _$indicator(InsightModel v) => v.indicator;
  static const Field<InsightModel, String> _f$indicator =
      Field('indicator', _$indicator, opt: true);
  static String? _$name(InsightModel v) => v.name;
  static const Field<InsightModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$value(InsightModel v) => v.value;
  static const Field<InsightModel, String> _f$value =
      Field('value', _$value, opt: true);
  static String? _$chartType(InsightModel v) => v.chartType;
  static const Field<InsightModel, String> _f$chartType =
      Field('chartType', _$chartType, opt: true);
  static String? _$visualizationCode(InsightModel v) => v.visualizationCode;
  static const Field<InsightModel, String> _f$visualizationCode =
      Field('visualizationCode', _$visualizationCode, opt: true);
  static String? _$projectId(InsightModel v) => v.projectId;
  static const Field<InsightModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);

  @override
  final MappableFields<InsightModel> fields = const {
    #colorCode: _f$colorCode,
    #indicator: _f$indicator,
    #name: _f$name,
    #value: _f$value,
    #chartType: _f$chartType,
    #visualizationCode: _f$visualizationCode,
    #projectId: _f$projectId,
  };
  @override
  final bool ignoreNull = true;

  static InsightModel _instantiate(DecodingData data) {
    return InsightModel(
        colorCode: data.dec(_f$colorCode),
        indicator: data.dec(_f$indicator),
        name: data.dec(_f$name),
        value: data.dec(_f$value),
        chartType: data.dec(_f$chartType),
        visualizationCode: data.dec(_f$visualizationCode),
        projectId: data.dec(_f$projectId));
  }

  @override
  final Function instantiate = _instantiate;

  static InsightModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InsightModel>(map);
  }

  static InsightModel fromJson(String json) {
    return ensureInitialized().decodeJson<InsightModel>(json);
  }
}

mixin InsightModelMappable {
  String toJson() {
    return InsightModelMapper.ensureInitialized()
        .encodeJson<InsightModel>(this as InsightModel);
  }

  Map<String, dynamic> toMap() {
    return InsightModelMapper.ensureInitialized()
        .encodeMap<InsightModel>(this as InsightModel);
  }

  InsightModelCopyWith<InsightModel, InsightModel, InsightModel> get copyWith =>
      _InsightModelCopyWithImpl(this as InsightModel, $identity, $identity);
  @override
  String toString() {
    return InsightModelMapper.ensureInitialized()
        .stringifyValue(this as InsightModel);
  }

  @override
  bool operator ==(Object other) {
    return InsightModelMapper.ensureInitialized()
        .equalsValue(this as InsightModel, other);
  }

  @override
  int get hashCode {
    return InsightModelMapper.ensureInitialized()
        .hashValue(this as InsightModel);
  }
}

extension InsightModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, InsightModel, $Out> {
  InsightModelCopyWith<$R, InsightModel, $Out> get $asInsightModel =>
      $base.as((v, t, t2) => _InsightModelCopyWithImpl(v, t, t2));
}

abstract class InsightModelCopyWith<$R, $In extends InsightModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? colorCode,
      String? indicator,
      String? name,
      String? value,
      String? chartType,
      String? visualizationCode,
      String? projectId});
  InsightModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _InsightModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InsightModel, $Out>
    implements InsightModelCopyWith<$R, InsightModel, $Out> {
  _InsightModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InsightModel> $mapper =
      InsightModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? colorCode = $none,
          Object? indicator = $none,
          Object? name = $none,
          Object? value = $none,
          Object? chartType = $none,
          Object? visualizationCode = $none,
          Object? projectId = $none}) =>
      $apply(FieldCopyWithData({
        if (colorCode != $none) #colorCode: colorCode,
        if (indicator != $none) #indicator: indicator,
        if (name != $none) #name: name,
        if (value != $none) #value: value,
        if (chartType != $none) #chartType: chartType,
        if (visualizationCode != $none) #visualizationCode: visualizationCode,
        if (projectId != $none) #projectId: projectId
      }));
  @override
  InsightModel $make(CopyWithData data) => InsightModel(
      colorCode: data.get(#colorCode, or: $value.colorCode),
      indicator: data.get(#indicator, or: $value.indicator),
      name: data.get(#name, or: $value.name),
      value: data.get(#value, or: $value.value),
      chartType: data.get(#chartType, or: $value.chartType),
      visualizationCode:
          data.get(#visualizationCode, or: $value.visualizationCode),
      projectId: data.get(#projectId, or: $value.projectId));

  @override
  InsightModelCopyWith<$R2, InsightModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _InsightModelCopyWithImpl($value, $cast, t);
}

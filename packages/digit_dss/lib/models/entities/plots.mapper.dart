// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'plots.dart';

class DashboardPlotModelMapper extends ClassMapperBase<DashboardPlotModel> {
  DashboardPlotModelMapper._();

  static DashboardPlotModelMapper? _instance;
  static DashboardPlotModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DashboardPlotModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DashboardPlotModel';

  static String? _$strValue(DashboardPlotModel v) => v.strValue;
  static const Field<DashboardPlotModel, String> _f$strValue =
      Field('strValue', _$strValue, opt: true);
  static String? _$label(DashboardPlotModel v) => v.label;
  static const Field<DashboardPlotModel, String> _f$label =
      Field('label', _$label, opt: true);
  static String? _$name(DashboardPlotModel v) => v.name;
  static const Field<DashboardPlotModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$value(DashboardPlotModel v) => v.value;
  static const Field<DashboardPlotModel, String> _f$value =
      Field('value', _$value, opt: true);
  static String? _$symbol(DashboardPlotModel v) => v.symbol;
  static const Field<DashboardPlotModel, String> _f$symbol =
      Field('symbol', _$symbol, opt: true);
  static String? _$projectId(DashboardPlotModel v) => v.projectId;
  static const Field<DashboardPlotModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$chartType(DashboardPlotModel v) => v.chartType;
  static const Field<DashboardPlotModel, String> _f$chartType =
      Field('chartType', _$chartType, opt: true);
  static String? _$visualizationCode(DashboardPlotModel v) =>
      v.visualizationCode;
  static const Field<DashboardPlotModel, String> _f$visualizationCode =
      Field('visualizationCode', _$visualizationCode, opt: true);

  @override
  final MappableFields<DashboardPlotModel> fields = const {
    #strValue: _f$strValue,
    #label: _f$label,
    #name: _f$name,
    #value: _f$value,
    #symbol: _f$symbol,
    #projectId: _f$projectId,
    #chartType: _f$chartType,
    #visualizationCode: _f$visualizationCode,
  };
  @override
  final bool ignoreNull = true;

  static DashboardPlotModel _instantiate(DecodingData data) {
    return DashboardPlotModel(
        strValue: data.dec(_f$strValue),
        label: data.dec(_f$label),
        name: data.dec(_f$name),
        value: data.dec(_f$value),
        symbol: data.dec(_f$symbol),
        projectId: data.dec(_f$projectId),
        chartType: data.dec(_f$chartType),
        visualizationCode: data.dec(_f$visualizationCode));
  }

  @override
  final Function instantiate = _instantiate;

  static DashboardPlotModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DashboardPlotModel>(map);
  }

  static DashboardPlotModel fromJson(String json) {
    return ensureInitialized().decodeJson<DashboardPlotModel>(json);
  }
}

mixin DashboardPlotModelMappable {
  String toJson() {
    return DashboardPlotModelMapper.ensureInitialized()
        .encodeJson<DashboardPlotModel>(this as DashboardPlotModel);
  }

  Map<String, dynamic> toMap() {
    return DashboardPlotModelMapper.ensureInitialized()
        .encodeMap<DashboardPlotModel>(this as DashboardPlotModel);
  }

  DashboardPlotModelCopyWith<DashboardPlotModel, DashboardPlotModel,
          DashboardPlotModel>
      get copyWith => _DashboardPlotModelCopyWithImpl(
          this as DashboardPlotModel, $identity, $identity);
  @override
  String toString() {
    return DashboardPlotModelMapper.ensureInitialized()
        .stringifyValue(this as DashboardPlotModel);
  }

  @override
  bool operator ==(Object other) {
    return DashboardPlotModelMapper.ensureInitialized()
        .equalsValue(this as DashboardPlotModel, other);
  }

  @override
  int get hashCode {
    return DashboardPlotModelMapper.ensureInitialized()
        .hashValue(this as DashboardPlotModel);
  }
}

extension DashboardPlotModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DashboardPlotModel, $Out> {
  DashboardPlotModelCopyWith<$R, DashboardPlotModel, $Out>
      get $asDashboardPlotModel =>
          $base.as((v, t, t2) => _DashboardPlotModelCopyWithImpl(v, t, t2));
}

abstract class DashboardPlotModelCopyWith<$R, $In extends DashboardPlotModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? strValue,
      String? label,
      String? name,
      String? value,
      String? symbol,
      String? projectId,
      String? chartType,
      String? visualizationCode});
  DashboardPlotModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DashboardPlotModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DashboardPlotModel, $Out>
    implements DashboardPlotModelCopyWith<$R, DashboardPlotModel, $Out> {
  _DashboardPlotModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DashboardPlotModel> $mapper =
      DashboardPlotModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? strValue = $none,
          Object? label = $none,
          Object? name = $none,
          Object? value = $none,
          Object? symbol = $none,
          Object? projectId = $none,
          Object? chartType = $none,
          Object? visualizationCode = $none}) =>
      $apply(FieldCopyWithData({
        if (strValue != $none) #strValue: strValue,
        if (label != $none) #label: label,
        if (name != $none) #name: name,
        if (value != $none) #value: value,
        if (symbol != $none) #symbol: symbol,
        if (projectId != $none) #projectId: projectId,
        if (chartType != $none) #chartType: chartType,
        if (visualizationCode != $none) #visualizationCode: visualizationCode
      }));
  @override
  DashboardPlotModel $make(CopyWithData data) => DashboardPlotModel(
      strValue: data.get(#strValue, or: $value.strValue),
      label: data.get(#label, or: $value.label),
      name: data.get(#name, or: $value.name),
      value: data.get(#value, or: $value.value),
      symbol: data.get(#symbol, or: $value.symbol),
      projectId: data.get(#projectId, or: $value.projectId),
      chartType: data.get(#chartType, or: $value.chartType),
      visualizationCode:
          data.get(#visualizationCode, or: $value.visualizationCode));

  @override
  DashboardPlotModelCopyWith<$R2, DashboardPlotModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DashboardPlotModelCopyWithImpl($value, $cast, t);
}

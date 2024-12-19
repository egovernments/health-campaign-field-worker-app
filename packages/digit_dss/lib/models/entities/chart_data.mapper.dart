// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chart_data.dart';

class DashboardChartDataModelMapper
    extends ClassMapperBase<DashboardChartDataModel> {
  DashboardChartDataModelMapper._();

  static DashboardChartDataModelMapper? _instance;
  static DashboardChartDataModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = DashboardChartDataModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DashboardChartDataModel';

  static String? _$headerName(DashboardChartDataModel v) => v.headerName;
  static const Field<DashboardChartDataModel, String> _f$headerName =
      Field('headerName', _$headerName, opt: true);
  static String? _$headerSymbol(DashboardChartDataModel v) => v.headerSymbol;
  static const Field<DashboardChartDataModel, String> _f$headerSymbol =
      Field('headerSymbol', _$headerSymbol, opt: true);
  static String? _$headerValue(DashboardChartDataModel v) => v.headerValue;
  static const Field<DashboardChartDataModel, String> _f$headerValue =
      Field('headerValue', _$headerValue, opt: true);
  static String? _$projectId(DashboardChartDataModel v) => v.projectId;
  static const Field<DashboardChartDataModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$chartType(DashboardChartDataModel v) => v.chartType;
  static const Field<DashboardChartDataModel, String> _f$chartType =
      Field('chartType', _$chartType, opt: true);
  static String? _$visualizationCode(DashboardChartDataModel v) =>
      v.visualizationCode;
  static const Field<DashboardChartDataModel, String> _f$visualizationCode =
      Field('visualizationCode', _$visualizationCode, opt: true);
  static InsightModel? _$insight(DashboardChartDataModel v) => v.insight;
  static const Field<DashboardChartDataModel, InsightModel> _f$insight =
      Field('insight', _$insight, opt: true);
  static List<DashboardPlotModel>? _$plots(DashboardChartDataModel v) =>
      v.plots;
  static const Field<DashboardChartDataModel, List<DashboardPlotModel>>
      _f$plots = Field('plots', _$plots, opt: true);

  @override
  final MappableFields<DashboardChartDataModel> fields = const {
    #headerName: _f$headerName,
    #headerSymbol: _f$headerSymbol,
    #headerValue: _f$headerValue,
    #projectId: _f$projectId,
    #chartType: _f$chartType,
    #visualizationCode: _f$visualizationCode,
    #insight: _f$insight,
    #plots: _f$plots,
  };
  @override
  final bool ignoreNull = true;

  static DashboardChartDataModel _instantiate(DecodingData data) {
    return DashboardChartDataModel(
        headerName: data.dec(_f$headerName),
        headerSymbol: data.dec(_f$headerSymbol),
        headerValue: data.dec(_f$headerValue),
        projectId: data.dec(_f$projectId),
        chartType: data.dec(_f$chartType),
        visualizationCode: data.dec(_f$visualizationCode),
        insight: data.dec(_f$insight),
        plots: data.dec(_f$plots));
  }

  @override
  final Function instantiate = _instantiate;

  static DashboardChartDataModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DashboardChartDataModel>(map);
  }

  static DashboardChartDataModel fromJson(String json) {
    return ensureInitialized().decodeJson<DashboardChartDataModel>(json);
  }
}

mixin DashboardChartDataModelMappable {
  String toJson() {
    return DashboardChartDataModelMapper.ensureInitialized()
        .encodeJson<DashboardChartDataModel>(this as DashboardChartDataModel);
  }

  Map<String, dynamic> toMap() {
    return DashboardChartDataModelMapper.ensureInitialized()
        .encodeMap<DashboardChartDataModel>(this as DashboardChartDataModel);
  }

  DashboardChartDataModelCopyWith<DashboardChartDataModel,
          DashboardChartDataModel, DashboardChartDataModel>
      get copyWith => _DashboardChartDataModelCopyWithImpl(
          this as DashboardChartDataModel, $identity, $identity);
  @override
  String toString() {
    return DashboardChartDataModelMapper.ensureInitialized()
        .stringifyValue(this as DashboardChartDataModel);
  }

  @override
  bool operator ==(Object other) {
    return DashboardChartDataModelMapper.ensureInitialized()
        .equalsValue(this as DashboardChartDataModel, other);
  }

  @override
  int get hashCode {
    return DashboardChartDataModelMapper.ensureInitialized()
        .hashValue(this as DashboardChartDataModel);
  }
}

extension DashboardChartDataModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DashboardChartDataModel, $Out> {
  DashboardChartDataModelCopyWith<$R, DashboardChartDataModel, $Out>
      get $asDashboardChartDataModel => $base
          .as((v, t, t2) => _DashboardChartDataModelCopyWithImpl(v, t, t2));
}

abstract class DashboardChartDataModelCopyWith<
    $R,
    $In extends DashboardChartDataModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  InsightModelCopyWith<$R, InsightModel, InsightModel>? get insight;
  ListCopyWith<
      $R,
      DashboardPlotModel,
      DashboardPlotModelCopyWith<$R, DashboardPlotModel,
          DashboardPlotModel>>? get plots;
  $R call(
      {String? headerName,
      String? headerSymbol,
      String? headerValue,
      String? projectId,
      String? chartType,
      String? visualizationCode,
      InsightModel? insight,
      List<DashboardPlotModel>? plots});
  DashboardChartDataModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DashboardChartDataModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DashboardChartDataModel, $Out>
    implements
        DashboardChartDataModelCopyWith<$R, DashboardChartDataModel, $Out> {
  _DashboardChartDataModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DashboardChartDataModel> $mapper =
      DashboardChartDataModelMapper.ensureInitialized();
  @override
  InsightModelCopyWith<$R, InsightModel, InsightModel>? get insight =>
      $value.insight?.copyWith.$chain((v) => call(insight: v));
  @override
  ListCopyWith<
      $R,
      DashboardPlotModel,
      DashboardPlotModelCopyWith<$R, DashboardPlotModel,
          DashboardPlotModel>>? get plots => $value.plots != null
      ? ListCopyWith(
          $value.plots!, (v, t) => v.copyWith.$chain(t), (v) => call(plots: v))
      : null;
  @override
  $R call(
          {Object? headerName = $none,
          Object? headerSymbol = $none,
          Object? headerValue = $none,
          Object? projectId = $none,
          Object? chartType = $none,
          Object? visualizationCode = $none,
          Object? insight = $none,
          Object? plots = $none}) =>
      $apply(FieldCopyWithData({
        if (headerName != $none) #headerName: headerName,
        if (headerSymbol != $none) #headerSymbol: headerSymbol,
        if (headerValue != $none) #headerValue: headerValue,
        if (projectId != $none) #projectId: projectId,
        if (chartType != $none) #chartType: chartType,
        if (visualizationCode != $none) #visualizationCode: visualizationCode,
        if (insight != $none) #insight: insight,
        if (plots != $none) #plots: plots
      }));
  @override
  DashboardChartDataModel $make(CopyWithData data) => DashboardChartDataModel(
      headerName: data.get(#headerName, or: $value.headerName),
      headerSymbol: data.get(#headerSymbol, or: $value.headerSymbol),
      headerValue: data.get(#headerValue, or: $value.headerValue),
      projectId: data.get(#projectId, or: $value.projectId),
      chartType: data.get(#chartType, or: $value.chartType),
      visualizationCode:
          data.get(#visualizationCode, or: $value.visualizationCode),
      insight: data.get(#insight, or: $value.insight),
      plots: data.get(#plots, or: $value.plots));

  @override
  DashboardChartDataModelCopyWith<$R2, DashboardChartDataModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DashboardChartDataModelCopyWithImpl($value, $cast, t);
}

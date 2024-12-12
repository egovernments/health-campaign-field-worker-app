// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'dashboard_response_model.dart';

class DashboardResponseSearchModelMapper
    extends ClassMapperBase<DashboardResponseSearchModel> {
  DashboardResponseSearchModelMapper._();

  static DashboardResponseSearchModelMapper? _instance;
  static DashboardResponseSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = DashboardResponseSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DashboardResponseSearchModel';

  static String? _$projectId(DashboardResponseSearchModel v) => v.projectId;
  static const Field<DashboardResponseSearchModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$visualizationCode(DashboardResponseSearchModel v) =>
      v.visualizationCode;
  static const Field<DashboardResponseSearchModel, String>
      _f$visualizationCode =
      Field('visualizationCode', _$visualizationCode, opt: true);
  static String? _$chartType(DashboardResponseSearchModel v) => v.chartType;
  static const Field<DashboardResponseSearchModel, String> _f$chartType =
      Field('chartType', _$chartType, opt: true);
  static String? _$date(DashboardResponseSearchModel v) => v.date;
  static const Field<DashboardResponseSearchModel, String> _f$date =
      Field('date', _$date, opt: true);

  @override
  final MappableFields<DashboardResponseSearchModel> fields = const {
    #projectId: _f$projectId,
    #visualizationCode: _f$visualizationCode,
    #chartType: _f$chartType,
    #date: _f$date,
  };
  @override
  final bool ignoreNull = true;

  static DashboardResponseSearchModel _instantiate(DecodingData data) {
    return DashboardResponseSearchModel(
        projectId: data.dec(_f$projectId),
        visualizationCode: data.dec(_f$visualizationCode),
        chartType: data.dec(_f$chartType),
        date: data.dec(_f$date));
  }

  @override
  final Function instantiate = _instantiate;

  static DashboardResponseSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DashboardResponseSearchModel>(map);
  }

  static DashboardResponseSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<DashboardResponseSearchModel>(json);
  }
}

mixin DashboardResponseSearchModelMappable {
  String toJson() {
    return DashboardResponseSearchModelMapper.ensureInitialized()
        .encodeJson<DashboardResponseSearchModel>(
            this as DashboardResponseSearchModel);
  }

  Map<String, dynamic> toMap() {
    return DashboardResponseSearchModelMapper.ensureInitialized()
        .encodeMap<DashboardResponseSearchModel>(
            this as DashboardResponseSearchModel);
  }

  DashboardResponseSearchModelCopyWith<DashboardResponseSearchModel,
          DashboardResponseSearchModel, DashboardResponseSearchModel>
      get copyWith => _DashboardResponseSearchModelCopyWithImpl(
          this as DashboardResponseSearchModel, $identity, $identity);
  @override
  String toString() {
    return DashboardResponseSearchModelMapper.ensureInitialized()
        .stringifyValue(this as DashboardResponseSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return DashboardResponseSearchModelMapper.ensureInitialized()
        .equalsValue(this as DashboardResponseSearchModel, other);
  }

  @override
  int get hashCode {
    return DashboardResponseSearchModelMapper.ensureInitialized()
        .hashValue(this as DashboardResponseSearchModel);
  }
}

extension DashboardResponseSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DashboardResponseSearchModel, $Out> {
  DashboardResponseSearchModelCopyWith<$R, DashboardResponseSearchModel, $Out>
      get $asDashboardResponseSearchModel => $base.as(
          (v, t, t2) => _DashboardResponseSearchModelCopyWithImpl(v, t, t2));
}

abstract class DashboardResponseSearchModelCopyWith<
    $R,
    $In extends DashboardResponseSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? projectId,
      String? visualizationCode,
      String? chartType,
      String? date});
  DashboardResponseSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DashboardResponseSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DashboardResponseSearchModel, $Out>
    implements
        DashboardResponseSearchModelCopyWith<$R, DashboardResponseSearchModel,
            $Out> {
  _DashboardResponseSearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DashboardResponseSearchModel> $mapper =
      DashboardResponseSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? projectId = $none,
          Object? visualizationCode = $none,
          Object? chartType = $none,
          Object? date = $none}) =>
      $apply(FieldCopyWithData({
        if (projectId != $none) #projectId: projectId,
        if (visualizationCode != $none) #visualizationCode: visualizationCode,
        if (chartType != $none) #chartType: chartType,
        if (date != $none) #date: date
      }));
  @override
  DashboardResponseSearchModel $make(CopyWithData data) =>
      DashboardResponseSearchModel(
          projectId: data.get(#projectId, or: $value.projectId),
          visualizationCode:
              data.get(#visualizationCode, or: $value.visualizationCode),
          chartType: data.get(#chartType, or: $value.chartType),
          date: data.get(#date, or: $value.date));

  @override
  DashboardResponseSearchModelCopyWith<$R2, DashboardResponseSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DashboardResponseSearchModelCopyWithImpl($value, $cast, t);
}

class DashboardResponseModelMapper
    extends ClassMapperBase<DashboardResponseModel> {
  DashboardResponseModelMapper._();

  static DashboardResponseModelMapper? _instance;
  static DashboardResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DashboardResponseModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DashboardResponseModel';

  static String? _$drillDownChartId(DashboardResponseModel v) =>
      v.drillDownChartId;
  static const Field<DashboardResponseModel, String> _f$drillDownChartId =
      Field('drillDownChartId', _$drillDownChartId, opt: true);
  static bool? _$showLabel(DashboardResponseModel v) => v.showLabel;
  static const Field<DashboardResponseModel, bool> _f$showLabel =
      Field('showLabel', _$showLabel, opt: true);
  static bool? _$hideInsights(DashboardResponseModel v) => v.hideInsights;
  static const Field<DashboardResponseModel, bool> _f$hideInsights =
      Field('hideInsights', _$hideInsights, opt: true);
  static bool? _$hideHeaderDenomination(DashboardResponseModel v) =>
      v.hideHeaderDenomination;
  static const Field<DashboardResponseModel, bool> _f$hideHeaderDenomination =
      Field('hideHeaderDenomination', _$hideHeaderDenomination, opt: true);
  static String? _$projectId(DashboardResponseModel v) => v.projectId;
  static const Field<DashboardResponseModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$chartType(DashboardResponseModel v) => v.chartType;
  static const Field<DashboardResponseModel, String> _f$chartType =
      Field('chartType', _$chartType, opt: true);
  static String? _$visualizationCode(DashboardResponseModel v) =>
      v.visualizationCode;
  static const Field<DashboardResponseModel, String> _f$visualizationCode =
      Field('visualizationCode', _$visualizationCode, opt: true);
  static List<DashboardChartDataModel>? _$data(DashboardResponseModel v) =>
      v.data;
  static const Field<DashboardResponseModel, List<DashboardChartDataModel>>
      _f$data = Field('data', _$data, opt: true);

  @override
  final MappableFields<DashboardResponseModel> fields = const {
    #drillDownChartId: _f$drillDownChartId,
    #showLabel: _f$showLabel,
    #hideInsights: _f$hideInsights,
    #hideHeaderDenomination: _f$hideHeaderDenomination,
    #projectId: _f$projectId,
    #chartType: _f$chartType,
    #visualizationCode: _f$visualizationCode,
    #data: _f$data,
  };
  @override
  final bool ignoreNull = true;

  static DashboardResponseModel _instantiate(DecodingData data) {
    return DashboardResponseModel(
        drillDownChartId: data.dec(_f$drillDownChartId),
        showLabel: data.dec(_f$showLabel),
        hideInsights: data.dec(_f$hideInsights),
        hideHeaderDenomination: data.dec(_f$hideHeaderDenomination),
        projectId: data.dec(_f$projectId),
        chartType: data.dec(_f$chartType),
        visualizationCode: data.dec(_f$visualizationCode),
        data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static DashboardResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DashboardResponseModel>(map);
  }

  static DashboardResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<DashboardResponseModel>(json);
  }
}

mixin DashboardResponseModelMappable {
  String toJson() {
    return DashboardResponseModelMapper.ensureInitialized()
        .encodeJson<DashboardResponseModel>(this as DashboardResponseModel);
  }

  Map<String, dynamic> toMap() {
    return DashboardResponseModelMapper.ensureInitialized()
        .encodeMap<DashboardResponseModel>(this as DashboardResponseModel);
  }

  DashboardResponseModelCopyWith<DashboardResponseModel, DashboardResponseModel,
          DashboardResponseModel>
      get copyWith => _DashboardResponseModelCopyWithImpl(
          this as DashboardResponseModel, $identity, $identity);
  @override
  String toString() {
    return DashboardResponseModelMapper.ensureInitialized()
        .stringifyValue(this as DashboardResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return DashboardResponseModelMapper.ensureInitialized()
        .equalsValue(this as DashboardResponseModel, other);
  }

  @override
  int get hashCode {
    return DashboardResponseModelMapper.ensureInitialized()
        .hashValue(this as DashboardResponseModel);
  }
}

extension DashboardResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DashboardResponseModel, $Out> {
  DashboardResponseModelCopyWith<$R, DashboardResponseModel, $Out>
      get $asDashboardResponseModel =>
          $base.as((v, t, t2) => _DashboardResponseModelCopyWithImpl(v, t, t2));
}

abstract class DashboardResponseModelCopyWith<
    $R,
    $In extends DashboardResponseModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      DashboardChartDataModel,
      DashboardChartDataModelCopyWith<$R, DashboardChartDataModel,
          DashboardChartDataModel>>? get data;
  $R call(
      {String? drillDownChartId,
      bool? showLabel,
      bool? hideInsights,
      bool? hideHeaderDenomination,
      String? projectId,
      String? chartType,
      String? visualizationCode,
      List<DashboardChartDataModel>? data});
  DashboardResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DashboardResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DashboardResponseModel, $Out>
    implements
        DashboardResponseModelCopyWith<$R, DashboardResponseModel, $Out> {
  _DashboardResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DashboardResponseModel> $mapper =
      DashboardResponseModelMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      DashboardChartDataModel,
      DashboardChartDataModelCopyWith<$R, DashboardChartDataModel,
          DashboardChartDataModel>>? get data => $value.data != null
      ? ListCopyWith(
          $value.data!, (v, t) => v.copyWith.$chain(t), (v) => call(data: v))
      : null;
  @override
  $R call(
          {Object? drillDownChartId = $none,
          Object? showLabel = $none,
          Object? hideInsights = $none,
          Object? hideHeaderDenomination = $none,
          Object? projectId = $none,
          Object? chartType = $none,
          Object? visualizationCode = $none,
          Object? data = $none}) =>
      $apply(FieldCopyWithData({
        if (drillDownChartId != $none) #drillDownChartId: drillDownChartId,
        if (showLabel != $none) #showLabel: showLabel,
        if (hideInsights != $none) #hideInsights: hideInsights,
        if (hideHeaderDenomination != $none)
          #hideHeaderDenomination: hideHeaderDenomination,
        if (projectId != $none) #projectId: projectId,
        if (chartType != $none) #chartType: chartType,
        if (visualizationCode != $none) #visualizationCode: visualizationCode,
        if (data != $none) #data: data
      }));
  @override
  DashboardResponseModel $make(CopyWithData data) => DashboardResponseModel(
      drillDownChartId:
          data.get(#drillDownChartId, or: $value.drillDownChartId),
      showLabel: data.get(#showLabel, or: $value.showLabel),
      hideInsights: data.get(#hideInsights, or: $value.hideInsights),
      hideHeaderDenomination:
          data.get(#hideHeaderDenomination, or: $value.hideHeaderDenomination),
      projectId: data.get(#projectId, or: $value.projectId),
      chartType: data.get(#chartType, or: $value.chartType),
      visualizationCode:
          data.get(#visualizationCode, or: $value.visualizationCode),
      data: data.get(#data, or: $value.data));

  @override
  DashboardResponseModelCopyWith<$R2, DashboardResponseModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DashboardResponseModelCopyWithImpl($value, $cast, t);
}

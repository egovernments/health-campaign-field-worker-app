// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'dashboard_request.dart';

class DashboardRequestModelMapper
    extends ClassMapperBase<DashboardRequestModel> {
  DashboardRequestModelMapper._();

  static DashboardRequestModelMapper? _instance;
  static DashboardRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DashboardRequestModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DashboardRequestModel';

  static AggregationRequestDto _$aggregationRequestDto(
          DashboardRequestModel v) =>
      v.aggregationRequestDto;
  static const Field<DashboardRequestModel, AggregationRequestDto>
      _f$aggregationRequestDto =
      Field('aggregationRequestDto', _$aggregationRequestDto);
  static DSSHeaders _$headers(DashboardRequestModel v) => v.headers;
  static const Field<DashboardRequestModel, DSSHeaders> _f$headers =
      Field('headers', _$headers);

  @override
  final MappableFields<DashboardRequestModel> fields = const {
    #aggregationRequestDto: _f$aggregationRequestDto,
    #headers: _f$headers,
  };
  @override
  final bool ignoreNull = true;

  static DashboardRequestModel _instantiate(DecodingData data) {
    return DashboardRequestModel(
        aggregationRequestDto: data.dec(_f$aggregationRequestDto),
        headers: data.dec(_f$headers));
  }

  @override
  final Function instantiate = _instantiate;

  static DashboardRequestModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DashboardRequestModel>(map);
  }

  static DashboardRequestModel fromJson(String json) {
    return ensureInitialized().decodeJson<DashboardRequestModel>(json);
  }
}

mixin DashboardRequestModelMappable {
  String toJson() {
    return DashboardRequestModelMapper.ensureInitialized()
        .encodeJson<DashboardRequestModel>(this as DashboardRequestModel);
  }

  Map<String, dynamic> toMap() {
    return DashboardRequestModelMapper.ensureInitialized()
        .encodeMap<DashboardRequestModel>(this as DashboardRequestModel);
  }

  DashboardRequestModelCopyWith<DashboardRequestModel, DashboardRequestModel,
          DashboardRequestModel>
      get copyWith => _DashboardRequestModelCopyWithImpl(
          this as DashboardRequestModel, $identity, $identity);
  @override
  String toString() {
    return DashboardRequestModelMapper.ensureInitialized()
        .stringifyValue(this as DashboardRequestModel);
  }

  @override
  bool operator ==(Object other) {
    return DashboardRequestModelMapper.ensureInitialized()
        .equalsValue(this as DashboardRequestModel, other);
  }

  @override
  int get hashCode {
    return DashboardRequestModelMapper.ensureInitialized()
        .hashValue(this as DashboardRequestModel);
  }
}

extension DashboardRequestModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DashboardRequestModel, $Out> {
  DashboardRequestModelCopyWith<$R, DashboardRequestModel, $Out>
      get $asDashboardRequestModel =>
          $base.as((v, t, t2) => _DashboardRequestModelCopyWithImpl(v, t, t2));
}

abstract class DashboardRequestModelCopyWith<
    $R,
    $In extends DashboardRequestModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  AggregationRequestDtoCopyWith<$R, AggregationRequestDto,
      AggregationRequestDto> get aggregationRequestDto;
  DSSHeadersCopyWith<$R, DSSHeaders, DSSHeaders> get headers;
  $R call({AggregationRequestDto? aggregationRequestDto, DSSHeaders? headers});
  DashboardRequestModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DashboardRequestModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DashboardRequestModel, $Out>
    implements DashboardRequestModelCopyWith<$R, DashboardRequestModel, $Out> {
  _DashboardRequestModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DashboardRequestModel> $mapper =
      DashboardRequestModelMapper.ensureInitialized();
  @override
  AggregationRequestDtoCopyWith<$R, AggregationRequestDto,
          AggregationRequestDto>
      get aggregationRequestDto => $value.aggregationRequestDto.copyWith
          .$chain((v) => call(aggregationRequestDto: v));
  @override
  DSSHeadersCopyWith<$R, DSSHeaders, DSSHeaders> get headers =>
      $value.headers.copyWith.$chain((v) => call(headers: v));
  @override
  $R call(
          {AggregationRequestDto? aggregationRequestDto,
          DSSHeaders? headers}) =>
      $apply(FieldCopyWithData({
        if (aggregationRequestDto != null)
          #aggregationRequestDto: aggregationRequestDto,
        if (headers != null) #headers: headers
      }));
  @override
  DashboardRequestModel $make(CopyWithData data) => DashboardRequestModel(
      aggregationRequestDto:
          data.get(#aggregationRequestDto, or: $value.aggregationRequestDto),
      headers: data.get(#headers, or: $value.headers));

  @override
  DashboardRequestModelCopyWith<$R2, DashboardRequestModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DashboardRequestModelCopyWithImpl($value, $cast, t);
}

class AggregationRequestDtoMapper
    extends ClassMapperBase<AggregationRequestDto> {
  AggregationRequestDtoMapper._();

  static AggregationRequestDtoMapper? _instance;
  static AggregationRequestDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AggregationRequestDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AggregationRequestDto';

  static String _$visualizationCode(AggregationRequestDto v) =>
      v.visualizationCode;
  static const Field<AggregationRequestDto, String> _f$visualizationCode =
      Field('visualizationCode', _$visualizationCode);
  static String _$visualizationType(AggregationRequestDto v) =>
      v.visualizationType;
  static const Field<AggregationRequestDto, String> _f$visualizationType =
      Field('visualizationType', _$visualizationType);
  static Map<dynamic, dynamic>? _$filters(AggregationRequestDto v) => v.filters;
  static const Field<AggregationRequestDto, Map<dynamic, dynamic>> _f$filters =
      Field('filters', _$filters, opt: true);
  static RequestDate? _$requestDate(AggregationRequestDto v) => v.requestDate;
  static const Field<AggregationRequestDto, RequestDate> _f$requestDate =
      Field('requestDate', _$requestDate, opt: true);
  static String? _$moduleLevel(AggregationRequestDto v) => v.moduleLevel;
  static const Field<AggregationRequestDto, String> _f$moduleLevel =
      Field('moduleLevel', _$moduleLevel, opt: true);
  static String? _$queryType(AggregationRequestDto v) => v.queryType;
  static const Field<AggregationRequestDto, String> _f$queryType =
      Field('queryType', _$queryType, opt: true);

  @override
  final MappableFields<AggregationRequestDto> fields = const {
    #visualizationCode: _f$visualizationCode,
    #visualizationType: _f$visualizationType,
    #filters: _f$filters,
    #requestDate: _f$requestDate,
    #moduleLevel: _f$moduleLevel,
    #queryType: _f$queryType,
  };
  @override
  final bool ignoreNull = true;

  static AggregationRequestDto _instantiate(DecodingData data) {
    return AggregationRequestDto(
        visualizationCode: data.dec(_f$visualizationCode),
        visualizationType: data.dec(_f$visualizationType),
        filters: data.dec(_f$filters),
        requestDate: data.dec(_f$requestDate),
        moduleLevel: data.dec(_f$moduleLevel),
        queryType: data.dec(_f$queryType));
  }

  @override
  final Function instantiate = _instantiate;

  static AggregationRequestDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AggregationRequestDto>(map);
  }

  static AggregationRequestDto fromJson(String json) {
    return ensureInitialized().decodeJson<AggregationRequestDto>(json);
  }
}

mixin AggregationRequestDtoMappable {
  String toJson() {
    return AggregationRequestDtoMapper.ensureInitialized()
        .encodeJson<AggregationRequestDto>(this as AggregationRequestDto);
  }

  Map<String, dynamic> toMap() {
    return AggregationRequestDtoMapper.ensureInitialized()
        .encodeMap<AggregationRequestDto>(this as AggregationRequestDto);
  }

  AggregationRequestDtoCopyWith<AggregationRequestDto, AggregationRequestDto,
          AggregationRequestDto>
      get copyWith => _AggregationRequestDtoCopyWithImpl(
          this as AggregationRequestDto, $identity, $identity);
  @override
  String toString() {
    return AggregationRequestDtoMapper.ensureInitialized()
        .stringifyValue(this as AggregationRequestDto);
  }

  @override
  bool operator ==(Object other) {
    return AggregationRequestDtoMapper.ensureInitialized()
        .equalsValue(this as AggregationRequestDto, other);
  }

  @override
  int get hashCode {
    return AggregationRequestDtoMapper.ensureInitialized()
        .hashValue(this as AggregationRequestDto);
  }
}

extension AggregationRequestDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AggregationRequestDto, $Out> {
  AggregationRequestDtoCopyWith<$R, AggregationRequestDto, $Out>
      get $asAggregationRequestDto =>
          $base.as((v, t, t2) => _AggregationRequestDtoCopyWithImpl(v, t, t2));
}

abstract class AggregationRequestDtoCopyWith<
    $R,
    $In extends AggregationRequestDto,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, dynamic, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get filters;
  RequestDateCopyWith<$R, RequestDate, RequestDate>? get requestDate;
  $R call(
      {String? visualizationCode,
      String? visualizationType,
      Map<dynamic, dynamic>? filters,
      RequestDate? requestDate,
      String? moduleLevel,
      String? queryType});
  AggregationRequestDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AggregationRequestDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AggregationRequestDto, $Out>
    implements AggregationRequestDtoCopyWith<$R, AggregationRequestDto, $Out> {
  _AggregationRequestDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AggregationRequestDto> $mapper =
      AggregationRequestDtoMapper.ensureInitialized();
  @override
  MapCopyWith<$R, dynamic, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get filters => $value.filters != null
          ? MapCopyWith(
              $value.filters!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(filters: v))
          : null;
  @override
  RequestDateCopyWith<$R, RequestDate, RequestDate>? get requestDate =>
      $value.requestDate?.copyWith.$chain((v) => call(requestDate: v));
  @override
  $R call(
          {String? visualizationCode,
          String? visualizationType,
          Object? filters = $none,
          Object? requestDate = $none,
          Object? moduleLevel = $none,
          Object? queryType = $none}) =>
      $apply(FieldCopyWithData({
        if (visualizationCode != null) #visualizationCode: visualizationCode,
        if (visualizationType != null) #visualizationType: visualizationType,
        if (filters != $none) #filters: filters,
        if (requestDate != $none) #requestDate: requestDate,
        if (moduleLevel != $none) #moduleLevel: moduleLevel,
        if (queryType != $none) #queryType: queryType
      }));
  @override
  AggregationRequestDto $make(CopyWithData data) => AggregationRequestDto(
      visualizationCode:
          data.get(#visualizationCode, or: $value.visualizationCode),
      visualizationType:
          data.get(#visualizationType, or: $value.visualizationType),
      filters: data.get(#filters, or: $value.filters),
      requestDate: data.get(#requestDate, or: $value.requestDate),
      moduleLevel: data.get(#moduleLevel, or: $value.moduleLevel),
      queryType: data.get(#queryType, or: $value.queryType));

  @override
  AggregationRequestDtoCopyWith<$R2, AggregationRequestDto, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AggregationRequestDtoCopyWithImpl($value, $cast, t);
}

class RequestDateMapper extends ClassMapperBase<RequestDate> {
  RequestDateMapper._();

  static RequestDateMapper? _instance;
  static RequestDateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RequestDateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RequestDate';

  static int? _$startDate(RequestDate v) => v.startDate;
  static const Field<RequestDate, int> _f$startDate =
      Field('startDate', _$startDate, opt: true);
  static int? _$endDate(RequestDate v) => v.endDate;
  static const Field<RequestDate, int> _f$endDate =
      Field('endDate', _$endDate, opt: true);
  static String? _$title(RequestDate v) => v.title;
  static const Field<RequestDate, String> _f$title =
      Field('title', _$title, opt: true);
  static String? _$interval(RequestDate v) => v.interval;
  static const Field<RequestDate, String> _f$interval =
      Field('interval', _$interval, opt: true);

  @override
  final MappableFields<RequestDate> fields = const {
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #title: _f$title,
    #interval: _f$interval,
  };
  @override
  final bool ignoreNull = true;

  static RequestDate _instantiate(DecodingData data) {
    return RequestDate(
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        title: data.dec(_f$title),
        interval: data.dec(_f$interval));
  }

  @override
  final Function instantiate = _instantiate;

  static RequestDate fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RequestDate>(map);
  }

  static RequestDate fromJson(String json) {
    return ensureInitialized().decodeJson<RequestDate>(json);
  }
}

mixin RequestDateMappable {
  String toJson() {
    return RequestDateMapper.ensureInitialized()
        .encodeJson<RequestDate>(this as RequestDate);
  }

  Map<String, dynamic> toMap() {
    return RequestDateMapper.ensureInitialized()
        .encodeMap<RequestDate>(this as RequestDate);
  }

  RequestDateCopyWith<RequestDate, RequestDate, RequestDate> get copyWith =>
      _RequestDateCopyWithImpl(this as RequestDate, $identity, $identity);
  @override
  String toString() {
    return RequestDateMapper.ensureInitialized()
        .stringifyValue(this as RequestDate);
  }

  @override
  bool operator ==(Object other) {
    return RequestDateMapper.ensureInitialized()
        .equalsValue(this as RequestDate, other);
  }

  @override
  int get hashCode {
    return RequestDateMapper.ensureInitialized().hashValue(this as RequestDate);
  }
}

extension RequestDateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RequestDate, $Out> {
  RequestDateCopyWith<$R, RequestDate, $Out> get $asRequestDate =>
      $base.as((v, t, t2) => _RequestDateCopyWithImpl(v, t, t2));
}

abstract class RequestDateCopyWith<$R, $In extends RequestDate, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? startDate, int? endDate, String? title, String? interval});
  RequestDateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RequestDateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RequestDate, $Out>
    implements RequestDateCopyWith<$R, RequestDate, $Out> {
  _RequestDateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RequestDate> $mapper =
      RequestDateMapper.ensureInitialized();
  @override
  $R call(
          {Object? startDate = $none,
          Object? endDate = $none,
          Object? title = $none,
          Object? interval = $none}) =>
      $apply(FieldCopyWithData({
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate,
        if (title != $none) #title: title,
        if (interval != $none) #interval: interval
      }));
  @override
  RequestDate $make(CopyWithData data) => RequestDate(
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate),
      title: data.get(#title, or: $value.title),
      interval: data.get(#interval, or: $value.interval));

  @override
  RequestDateCopyWith<$R2, RequestDate, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RequestDateCopyWithImpl($value, $cast, t);
}

class DSSHeadersMapper extends ClassMapperBase<DSSHeaders> {
  DSSHeadersMapper._();

  static DSSHeadersMapper? _instance;
  static DSSHeadersMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DSSHeadersMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DSSHeaders';

  static String? _$tenantId(DSSHeaders v) => v.tenantId;
  static const Field<DSSHeaders, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);

  @override
  final MappableFields<DSSHeaders> fields = const {
    #tenantId: _f$tenantId,
  };
  @override
  final bool ignoreNull = true;

  static DSSHeaders _instantiate(DecodingData data) {
    return DSSHeaders(tenantId: data.dec(_f$tenantId));
  }

  @override
  final Function instantiate = _instantiate;

  static DSSHeaders fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DSSHeaders>(map);
  }

  static DSSHeaders fromJson(String json) {
    return ensureInitialized().decodeJson<DSSHeaders>(json);
  }
}

mixin DSSHeadersMappable {
  String toJson() {
    return DSSHeadersMapper.ensureInitialized()
        .encodeJson<DSSHeaders>(this as DSSHeaders);
  }

  Map<String, dynamic> toMap() {
    return DSSHeadersMapper.ensureInitialized()
        .encodeMap<DSSHeaders>(this as DSSHeaders);
  }

  DSSHeadersCopyWith<DSSHeaders, DSSHeaders, DSSHeaders> get copyWith =>
      _DSSHeadersCopyWithImpl(this as DSSHeaders, $identity, $identity);
  @override
  String toString() {
    return DSSHeadersMapper.ensureInitialized()
        .stringifyValue(this as DSSHeaders);
  }

  @override
  bool operator ==(Object other) {
    return DSSHeadersMapper.ensureInitialized()
        .equalsValue(this as DSSHeaders, other);
  }

  @override
  int get hashCode {
    return DSSHeadersMapper.ensureInitialized().hashValue(this as DSSHeaders);
  }
}

extension DSSHeadersValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DSSHeaders, $Out> {
  DSSHeadersCopyWith<$R, DSSHeaders, $Out> get $asDSSHeaders =>
      $base.as((v, t, t2) => _DSSHeadersCopyWithImpl(v, t, t2));
}

abstract class DSSHeadersCopyWith<$R, $In extends DSSHeaders, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? tenantId});
  DSSHeadersCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DSSHeadersCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DSSHeaders, $Out>
    implements DSSHeadersCopyWith<$R, DSSHeaders, $Out> {
  _DSSHeadersCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DSSHeaders> $mapper =
      DSSHeadersMapper.ensureInitialized();
  @override
  $R call({Object? tenantId = $none}) =>
      $apply(FieldCopyWithData({if (tenantId != $none) #tenantId: tenantId}));
  @override
  DSSHeaders $make(CopyWithData data) =>
      DSSHeaders(tenantId: data.get(#tenantId, or: $value.tenantId));

  @override
  DSSHeadersCopyWith<$R2, DSSHeaders, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DSSHeadersCopyWithImpl($value, $cast, t);
}

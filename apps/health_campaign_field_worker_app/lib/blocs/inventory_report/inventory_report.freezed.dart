// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'inventory_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InventoryReportEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InventoryReportType reportType) loadStockData,
    required TResult Function() loadStockReconciliationData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportType reportType)? loadStockData,
    TResult? Function()? loadStockReconciliationData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InventoryReportType reportType)? loadStockData,
    TResult Function()? loadStockReconciliationData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InventoryReportLoadStockDataEvent value)
        loadStockData,
    required TResult Function(
            InventoryReportLoadStockReconciliationDataEvent value)
        loadStockReconciliationData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportLoadStockDataEvent value)? loadStockData,
    TResult? Function(InventoryReportLoadStockReconciliationDataEvent value)?
        loadStockReconciliationData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryReportLoadStockDataEvent value)? loadStockData,
    TResult Function(InventoryReportLoadStockReconciliationDataEvent value)?
        loadStockReconciliationData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryReportEventCopyWith<$Res> {
  factory $InventoryReportEventCopyWith(InventoryReportEvent value,
          $Res Function(InventoryReportEvent) then) =
      _$InventoryReportEventCopyWithImpl<$Res, InventoryReportEvent>;
}

/// @nodoc
class _$InventoryReportEventCopyWithImpl<$Res,
        $Val extends InventoryReportEvent>
    implements $InventoryReportEventCopyWith<$Res> {
  _$InventoryReportEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InventoryReportLoadStockDataEventCopyWith<$Res> {
  factory _$$InventoryReportLoadStockDataEventCopyWith(
          _$InventoryReportLoadStockDataEvent value,
          $Res Function(_$InventoryReportLoadStockDataEvent) then) =
      __$$InventoryReportLoadStockDataEventCopyWithImpl<$Res>;
  @useResult
  $Res call({InventoryReportType reportType});
}

/// @nodoc
class __$$InventoryReportLoadStockDataEventCopyWithImpl<$Res>
    extends _$InventoryReportEventCopyWithImpl<$Res,
        _$InventoryReportLoadStockDataEvent>
    implements _$$InventoryReportLoadStockDataEventCopyWith<$Res> {
  __$$InventoryReportLoadStockDataEventCopyWithImpl(
      _$InventoryReportLoadStockDataEvent _value,
      $Res Function(_$InventoryReportLoadStockDataEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportType = null,
  }) {
    return _then(_$InventoryReportLoadStockDataEvent(
      reportType: null == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as InventoryReportType,
    ));
  }
}

/// @nodoc

class _$InventoryReportLoadStockDataEvent
    implements InventoryReportLoadStockDataEvent {
  const _$InventoryReportLoadStockDataEvent({required this.reportType});

  @override
  final InventoryReportType reportType;

  @override
  String toString() {
    return 'InventoryReportEvent.loadStockData(reportType: $reportType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryReportLoadStockDataEvent &&
            (identical(other.reportType, reportType) ||
                other.reportType == reportType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reportType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryReportLoadStockDataEventCopyWith<
          _$InventoryReportLoadStockDataEvent>
      get copyWith => __$$InventoryReportLoadStockDataEventCopyWithImpl<
          _$InventoryReportLoadStockDataEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InventoryReportType reportType) loadStockData,
    required TResult Function() loadStockReconciliationData,
  }) {
    return loadStockData(reportType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportType reportType)? loadStockData,
    TResult? Function()? loadStockReconciliationData,
  }) {
    return loadStockData?.call(reportType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InventoryReportType reportType)? loadStockData,
    TResult Function()? loadStockReconciliationData,
    required TResult orElse(),
  }) {
    if (loadStockData != null) {
      return loadStockData(reportType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InventoryReportLoadStockDataEvent value)
        loadStockData,
    required TResult Function(
            InventoryReportLoadStockReconciliationDataEvent value)
        loadStockReconciliationData,
  }) {
    return loadStockData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportLoadStockDataEvent value)? loadStockData,
    TResult? Function(InventoryReportLoadStockReconciliationDataEvent value)?
        loadStockReconciliationData,
  }) {
    return loadStockData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryReportLoadStockDataEvent value)? loadStockData,
    TResult Function(InventoryReportLoadStockReconciliationDataEvent value)?
        loadStockReconciliationData,
    required TResult orElse(),
  }) {
    if (loadStockData != null) {
      return loadStockData(this);
    }
    return orElse();
  }
}

abstract class InventoryReportLoadStockDataEvent
    implements InventoryReportEvent {
  const factory InventoryReportLoadStockDataEvent(
          {required final InventoryReportType reportType}) =
      _$InventoryReportLoadStockDataEvent;

  InventoryReportType get reportType;
  @JsonKey(ignore: true)
  _$$InventoryReportLoadStockDataEventCopyWith<
          _$InventoryReportLoadStockDataEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InventoryReportLoadStockReconciliationDataEventCopyWith<
    $Res> {
  factory _$$InventoryReportLoadStockReconciliationDataEventCopyWith(
          _$InventoryReportLoadStockReconciliationDataEvent value,
          $Res Function(_$InventoryReportLoadStockReconciliationDataEvent)
              then) =
      __$$InventoryReportLoadStockReconciliationDataEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InventoryReportLoadStockReconciliationDataEventCopyWithImpl<$Res>
    extends _$InventoryReportEventCopyWithImpl<$Res,
        _$InventoryReportLoadStockReconciliationDataEvent>
    implements
        _$$InventoryReportLoadStockReconciliationDataEventCopyWith<$Res> {
  __$$InventoryReportLoadStockReconciliationDataEventCopyWithImpl(
      _$InventoryReportLoadStockReconciliationDataEvent _value,
      $Res Function(_$InventoryReportLoadStockReconciliationDataEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InventoryReportLoadStockReconciliationDataEvent
    implements InventoryReportLoadStockReconciliationDataEvent {
  const _$InventoryReportLoadStockReconciliationDataEvent();

  @override
  String toString() {
    return 'InventoryReportEvent.loadStockReconciliationData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryReportLoadStockReconciliationDataEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InventoryReportType reportType) loadStockData,
    required TResult Function() loadStockReconciliationData,
  }) {
    return loadStockReconciliationData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportType reportType)? loadStockData,
    TResult? Function()? loadStockReconciliationData,
  }) {
    return loadStockReconciliationData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InventoryReportType reportType)? loadStockData,
    TResult Function()? loadStockReconciliationData,
    required TResult orElse(),
  }) {
    if (loadStockReconciliationData != null) {
      return loadStockReconciliationData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InventoryReportLoadStockDataEvent value)
        loadStockData,
    required TResult Function(
            InventoryReportLoadStockReconciliationDataEvent value)
        loadStockReconciliationData,
  }) {
    return loadStockReconciliationData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportLoadStockDataEvent value)? loadStockData,
    TResult? Function(InventoryReportLoadStockReconciliationDataEvent value)?
        loadStockReconciliationData,
  }) {
    return loadStockReconciliationData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryReportLoadStockDataEvent value)? loadStockData,
    TResult Function(InventoryReportLoadStockReconciliationDataEvent value)?
        loadStockReconciliationData,
    required TResult orElse(),
  }) {
    if (loadStockReconciliationData != null) {
      return loadStockReconciliationData(this);
    }
    return orElse();
  }
}

abstract class InventoryReportLoadStockReconciliationDataEvent
    implements InventoryReportEvent {
  const factory InventoryReportLoadStockReconciliationDataEvent() =
      _$InventoryReportLoadStockReconciliationDataEvent;
}

/// @nodoc
mixin _$InventoryReportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Map<String, List<StockModel>> stockData) stock,
    required TResult Function(Map<String, List<StockReconciliationModel>> data)
        stockReconciliation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Map<String, List<StockModel>> stockData)? stock,
    TResult? Function(Map<String, List<StockReconciliationModel>> data)?
        stockReconciliation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<String, List<StockModel>> stockData)? stock,
    TResult Function(Map<String, List<StockReconciliationModel>> data)?
        stockReconciliation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InventoryReportLoadingState value) loading,
    required TResult Function(InventoryReportStockState value) stock,
    required TResult Function(InventoryReportStockReconciliationState value)
        stockReconciliation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportLoadingState value)? loading,
    TResult? Function(InventoryReportStockState value)? stock,
    TResult? Function(InventoryReportStockReconciliationState value)?
        stockReconciliation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryReportLoadingState value)? loading,
    TResult Function(InventoryReportStockState value)? stock,
    TResult Function(InventoryReportStockReconciliationState value)?
        stockReconciliation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryReportStateCopyWith<$Res> {
  factory $InventoryReportStateCopyWith(InventoryReportState value,
          $Res Function(InventoryReportState) then) =
      _$InventoryReportStateCopyWithImpl<$Res, InventoryReportState>;
}

/// @nodoc
class _$InventoryReportStateCopyWithImpl<$Res,
        $Val extends InventoryReportState>
    implements $InventoryReportStateCopyWith<$Res> {
  _$InventoryReportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InventoryReportLoadingStateCopyWith<$Res> {
  factory _$$InventoryReportLoadingStateCopyWith(
          _$InventoryReportLoadingState value,
          $Res Function(_$InventoryReportLoadingState) then) =
      __$$InventoryReportLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InventoryReportLoadingStateCopyWithImpl<$Res>
    extends _$InventoryReportStateCopyWithImpl<$Res,
        _$InventoryReportLoadingState>
    implements _$$InventoryReportLoadingStateCopyWith<$Res> {
  __$$InventoryReportLoadingStateCopyWithImpl(
      _$InventoryReportLoadingState _value,
      $Res Function(_$InventoryReportLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InventoryReportLoadingState implements InventoryReportLoadingState {
  const _$InventoryReportLoadingState();

  @override
  String toString() {
    return 'InventoryReportState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryReportLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Map<String, List<StockModel>> stockData) stock,
    required TResult Function(Map<String, List<StockReconciliationModel>> data)
        stockReconciliation,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Map<String, List<StockModel>> stockData)? stock,
    TResult? Function(Map<String, List<StockReconciliationModel>> data)?
        stockReconciliation,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<String, List<StockModel>> stockData)? stock,
    TResult Function(Map<String, List<StockReconciliationModel>> data)?
        stockReconciliation,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InventoryReportLoadingState value) loading,
    required TResult Function(InventoryReportStockState value) stock,
    required TResult Function(InventoryReportStockReconciliationState value)
        stockReconciliation,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportLoadingState value)? loading,
    TResult? Function(InventoryReportStockState value)? stock,
    TResult? Function(InventoryReportStockReconciliationState value)?
        stockReconciliation,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryReportLoadingState value)? loading,
    TResult Function(InventoryReportStockState value)? stock,
    TResult Function(InventoryReportStockReconciliationState value)?
        stockReconciliation,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class InventoryReportLoadingState implements InventoryReportState {
  const factory InventoryReportLoadingState() = _$InventoryReportLoadingState;
}

/// @nodoc
abstract class _$$InventoryReportStockStateCopyWith<$Res> {
  factory _$$InventoryReportStockStateCopyWith(
          _$InventoryReportStockState value,
          $Res Function(_$InventoryReportStockState) then) =
      __$$InventoryReportStockStateCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, List<StockModel>> stockData});
}

/// @nodoc
class __$$InventoryReportStockStateCopyWithImpl<$Res>
    extends _$InventoryReportStateCopyWithImpl<$Res,
        _$InventoryReportStockState>
    implements _$$InventoryReportStockStateCopyWith<$Res> {
  __$$InventoryReportStockStateCopyWithImpl(_$InventoryReportStockState _value,
      $Res Function(_$InventoryReportStockState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stockData = null,
  }) {
    return _then(_$InventoryReportStockState(
      stockData: null == stockData
          ? _value._stockData
          : stockData // ignore: cast_nullable_to_non_nullable
              as Map<String, List<StockModel>>,
    ));
  }
}

/// @nodoc

class _$InventoryReportStockState implements InventoryReportStockState {
  const _$InventoryReportStockState(
      {final Map<String, List<StockModel>> stockData = const {}})
      : _stockData = stockData;

  final Map<String, List<StockModel>> _stockData;
  @override
  @JsonKey()
  Map<String, List<StockModel>> get stockData {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stockData);
  }

  @override
  String toString() {
    return 'InventoryReportState.stock(stockData: $stockData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryReportStockState &&
            const DeepCollectionEquality()
                .equals(other._stockData, _stockData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_stockData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryReportStockStateCopyWith<_$InventoryReportStockState>
      get copyWith => __$$InventoryReportStockStateCopyWithImpl<
          _$InventoryReportStockState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Map<String, List<StockModel>> stockData) stock,
    required TResult Function(Map<String, List<StockReconciliationModel>> data)
        stockReconciliation,
  }) {
    return stock(stockData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Map<String, List<StockModel>> stockData)? stock,
    TResult? Function(Map<String, List<StockReconciliationModel>> data)?
        stockReconciliation,
  }) {
    return stock?.call(stockData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<String, List<StockModel>> stockData)? stock,
    TResult Function(Map<String, List<StockReconciliationModel>> data)?
        stockReconciliation,
    required TResult orElse(),
  }) {
    if (stock != null) {
      return stock(stockData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InventoryReportLoadingState value) loading,
    required TResult Function(InventoryReportStockState value) stock,
    required TResult Function(InventoryReportStockReconciliationState value)
        stockReconciliation,
  }) {
    return stock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportLoadingState value)? loading,
    TResult? Function(InventoryReportStockState value)? stock,
    TResult? Function(InventoryReportStockReconciliationState value)?
        stockReconciliation,
  }) {
    return stock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryReportLoadingState value)? loading,
    TResult Function(InventoryReportStockState value)? stock,
    TResult Function(InventoryReportStockReconciliationState value)?
        stockReconciliation,
    required TResult orElse(),
  }) {
    if (stock != null) {
      return stock(this);
    }
    return orElse();
  }
}

abstract class InventoryReportStockState implements InventoryReportState {
  const factory InventoryReportStockState(
          {final Map<String, List<StockModel>> stockData}) =
      _$InventoryReportStockState;

  Map<String, List<StockModel>> get stockData;
  @JsonKey(ignore: true)
  _$$InventoryReportStockStateCopyWith<_$InventoryReportStockState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InventoryReportStockReconciliationStateCopyWith<$Res> {
  factory _$$InventoryReportStockReconciliationStateCopyWith(
          _$InventoryReportStockReconciliationState value,
          $Res Function(_$InventoryReportStockReconciliationState) then) =
      __$$InventoryReportStockReconciliationStateCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, List<StockReconciliationModel>> data});
}

/// @nodoc
class __$$InventoryReportStockReconciliationStateCopyWithImpl<$Res>
    extends _$InventoryReportStateCopyWithImpl<$Res,
        _$InventoryReportStockReconciliationState>
    implements _$$InventoryReportStockReconciliationStateCopyWith<$Res> {
  __$$InventoryReportStockReconciliationStateCopyWithImpl(
      _$InventoryReportStockReconciliationState _value,
      $Res Function(_$InventoryReportStockReconciliationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$InventoryReportStockReconciliationState(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, List<StockReconciliationModel>>,
    ));
  }
}

/// @nodoc

class _$InventoryReportStockReconciliationState
    implements InventoryReportStockReconciliationState {
  const _$InventoryReportStockReconciliationState(
      {final Map<String, List<StockReconciliationModel>> data = const {}})
      : _data = data;

  final Map<String, List<StockReconciliationModel>> _data;
  @override
  @JsonKey()
  Map<String, List<StockReconciliationModel>> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'InventoryReportState.stockReconciliation(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryReportStockReconciliationState &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryReportStockReconciliationStateCopyWith<
          _$InventoryReportStockReconciliationState>
      get copyWith => __$$InventoryReportStockReconciliationStateCopyWithImpl<
          _$InventoryReportStockReconciliationState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Map<String, List<StockModel>> stockData) stock,
    required TResult Function(Map<String, List<StockReconciliationModel>> data)
        stockReconciliation,
  }) {
    return stockReconciliation(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Map<String, List<StockModel>> stockData)? stock,
    TResult? Function(Map<String, List<StockReconciliationModel>> data)?
        stockReconciliation,
  }) {
    return stockReconciliation?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<String, List<StockModel>> stockData)? stock,
    TResult Function(Map<String, List<StockReconciliationModel>> data)?
        stockReconciliation,
    required TResult orElse(),
  }) {
    if (stockReconciliation != null) {
      return stockReconciliation(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InventoryReportLoadingState value) loading,
    required TResult Function(InventoryReportStockState value) stock,
    required TResult Function(InventoryReportStockReconciliationState value)
        stockReconciliation,
  }) {
    return stockReconciliation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportLoadingState value)? loading,
    TResult? Function(InventoryReportStockState value)? stock,
    TResult? Function(InventoryReportStockReconciliationState value)?
        stockReconciliation,
  }) {
    return stockReconciliation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryReportLoadingState value)? loading,
    TResult Function(InventoryReportStockState value)? stock,
    TResult Function(InventoryReportStockReconciliationState value)?
        stockReconciliation,
    required TResult orElse(),
  }) {
    if (stockReconciliation != null) {
      return stockReconciliation(this);
    }
    return orElse();
  }
}

abstract class InventoryReportStockReconciliationState
    implements InventoryReportState {
  const factory InventoryReportStockReconciliationState(
          {final Map<String, List<StockReconciliationModel>> data}) =
      _$InventoryReportStockReconciliationState;

  Map<String, List<StockReconciliationModel>> get data;
  @JsonKey(ignore: true)
  _$$InventoryReportStockReconciliationStateCopyWith<
          _$InventoryReportStockReconciliationState>
      get copyWith => throw _privateConstructorUsedError;
}

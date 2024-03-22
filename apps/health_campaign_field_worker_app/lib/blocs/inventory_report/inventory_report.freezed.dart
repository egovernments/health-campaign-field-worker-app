// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InventoryReportEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InventoryReportType reportType, String facilityId,
            String productVariantId)
        loadStockData,
    required TResult Function(String facilityId, String productVariantId)
        loadStockReconciliationData,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportType reportType, String facilityId,
            String productVariantId)?
        loadStockData,
    TResult? Function(String facilityId, String productVariantId)?
        loadStockReconciliationData,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InventoryReportType reportType, String facilityId,
            String productVariantId)?
        loadStockData,
    TResult Function(String facilityId, String productVariantId)?
        loadStockReconciliationData,
    TResult Function()? loading,
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
    required TResult Function(InventoryReportLoadingEvent value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportLoadStockDataEvent value)? loadStockData,
    TResult? Function(InventoryReportLoadStockReconciliationDataEvent value)?
        loadStockReconciliationData,
    TResult? Function(InventoryReportLoadingEvent value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryReportLoadStockDataEvent value)? loadStockData,
    TResult Function(InventoryReportLoadStockReconciliationDataEvent value)?
        loadStockReconciliationData,
    TResult Function(InventoryReportLoadingEvent value)? loading,
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
abstract class _$$InventoryReportLoadStockDataEventImplCopyWith<$Res> {
  factory _$$InventoryReportLoadStockDataEventImplCopyWith(
          _$InventoryReportLoadStockDataEventImpl value,
          $Res Function(_$InventoryReportLoadStockDataEventImpl) then) =
      __$$InventoryReportLoadStockDataEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {InventoryReportType reportType,
      String facilityId,
      String productVariantId});
}

/// @nodoc
class __$$InventoryReportLoadStockDataEventImplCopyWithImpl<$Res>
    extends _$InventoryReportEventCopyWithImpl<$Res,
        _$InventoryReportLoadStockDataEventImpl>
    implements _$$InventoryReportLoadStockDataEventImplCopyWith<$Res> {
  __$$InventoryReportLoadStockDataEventImplCopyWithImpl(
      _$InventoryReportLoadStockDataEventImpl _value,
      $Res Function(_$InventoryReportLoadStockDataEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportType = null,
    Object? facilityId = null,
    Object? productVariantId = null,
  }) {
    return _then(_$InventoryReportLoadStockDataEventImpl(
      reportType: null == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as InventoryReportType,
      facilityId: null == facilityId
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as String,
      productVariantId: null == productVariantId
          ? _value.productVariantId
          : productVariantId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InventoryReportLoadStockDataEventImpl
    implements InventoryReportLoadStockDataEvent {
  const _$InventoryReportLoadStockDataEventImpl(
      {required this.reportType,
      required this.facilityId,
      required this.productVariantId});

  @override
  final InventoryReportType reportType;
  @override
  final String facilityId;
  @override
  final String productVariantId;

  @override
  String toString() {
    return 'InventoryReportEvent.loadStockData(reportType: $reportType, facilityId: $facilityId, productVariantId: $productVariantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryReportLoadStockDataEventImpl &&
            (identical(other.reportType, reportType) ||
                other.reportType == reportType) &&
            (identical(other.facilityId, facilityId) ||
                other.facilityId == facilityId) &&
            (identical(other.productVariantId, productVariantId) ||
                other.productVariantId == productVariantId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, reportType, facilityId, productVariantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryReportLoadStockDataEventImplCopyWith<
          _$InventoryReportLoadStockDataEventImpl>
      get copyWith => __$$InventoryReportLoadStockDataEventImplCopyWithImpl<
          _$InventoryReportLoadStockDataEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InventoryReportType reportType, String facilityId,
            String productVariantId)
        loadStockData,
    required TResult Function(String facilityId, String productVariantId)
        loadStockReconciliationData,
    required TResult Function() loading,
  }) {
    return loadStockData(reportType, facilityId, productVariantId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportType reportType, String facilityId,
            String productVariantId)?
        loadStockData,
    TResult? Function(String facilityId, String productVariantId)?
        loadStockReconciliationData,
    TResult? Function()? loading,
  }) {
    return loadStockData?.call(reportType, facilityId, productVariantId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InventoryReportType reportType, String facilityId,
            String productVariantId)?
        loadStockData,
    TResult Function(String facilityId, String productVariantId)?
        loadStockReconciliationData,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loadStockData != null) {
      return loadStockData(reportType, facilityId, productVariantId);
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
    required TResult Function(InventoryReportLoadingEvent value) loading,
  }) {
    return loadStockData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportLoadStockDataEvent value)? loadStockData,
    TResult? Function(InventoryReportLoadStockReconciliationDataEvent value)?
        loadStockReconciliationData,
    TResult? Function(InventoryReportLoadingEvent value)? loading,
  }) {
    return loadStockData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryReportLoadStockDataEvent value)? loadStockData,
    TResult Function(InventoryReportLoadStockReconciliationDataEvent value)?
        loadStockReconciliationData,
    TResult Function(InventoryReportLoadingEvent value)? loading,
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
          {required final InventoryReportType reportType,
          required final String facilityId,
          required final String productVariantId}) =
      _$InventoryReportLoadStockDataEventImpl;

  InventoryReportType get reportType;
  String get facilityId;
  String get productVariantId;
  @JsonKey(ignore: true)
  _$$InventoryReportLoadStockDataEventImplCopyWith<
          _$InventoryReportLoadStockDataEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InventoryReportLoadStockReconciliationDataEventImplCopyWith<
    $Res> {
  factory _$$InventoryReportLoadStockReconciliationDataEventImplCopyWith(
          _$InventoryReportLoadStockReconciliationDataEventImpl value,
          $Res Function(_$InventoryReportLoadStockReconciliationDataEventImpl)
              then) =
      __$$InventoryReportLoadStockReconciliationDataEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String facilityId, String productVariantId});
}

/// @nodoc
class __$$InventoryReportLoadStockReconciliationDataEventImplCopyWithImpl<$Res>
    extends _$InventoryReportEventCopyWithImpl<$Res,
        _$InventoryReportLoadStockReconciliationDataEventImpl>
    implements
        _$$InventoryReportLoadStockReconciliationDataEventImplCopyWith<$Res> {
  __$$InventoryReportLoadStockReconciliationDataEventImplCopyWithImpl(
      _$InventoryReportLoadStockReconciliationDataEventImpl _value,
      $Res Function(_$InventoryReportLoadStockReconciliationDataEventImpl)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilityId = null,
    Object? productVariantId = null,
  }) {
    return _then(_$InventoryReportLoadStockReconciliationDataEventImpl(
      facilityId: null == facilityId
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as String,
      productVariantId: null == productVariantId
          ? _value.productVariantId
          : productVariantId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InventoryReportLoadStockReconciliationDataEventImpl
    implements InventoryReportLoadStockReconciliationDataEvent {
  const _$InventoryReportLoadStockReconciliationDataEventImpl(
      {required this.facilityId, required this.productVariantId});

  @override
  final String facilityId;
  @override
  final String productVariantId;

  @override
  String toString() {
    return 'InventoryReportEvent.loadStockReconciliationData(facilityId: $facilityId, productVariantId: $productVariantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryReportLoadStockReconciliationDataEventImpl &&
            (identical(other.facilityId, facilityId) ||
                other.facilityId == facilityId) &&
            (identical(other.productVariantId, productVariantId) ||
                other.productVariantId == productVariantId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, facilityId, productVariantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryReportLoadStockReconciliationDataEventImplCopyWith<
          _$InventoryReportLoadStockReconciliationDataEventImpl>
      get copyWith =>
          __$$InventoryReportLoadStockReconciliationDataEventImplCopyWithImpl<
                  _$InventoryReportLoadStockReconciliationDataEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InventoryReportType reportType, String facilityId,
            String productVariantId)
        loadStockData,
    required TResult Function(String facilityId, String productVariantId)
        loadStockReconciliationData,
    required TResult Function() loading,
  }) {
    return loadStockReconciliationData(facilityId, productVariantId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportType reportType, String facilityId,
            String productVariantId)?
        loadStockData,
    TResult? Function(String facilityId, String productVariantId)?
        loadStockReconciliationData,
    TResult? Function()? loading,
  }) {
    return loadStockReconciliationData?.call(facilityId, productVariantId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InventoryReportType reportType, String facilityId,
            String productVariantId)?
        loadStockData,
    TResult Function(String facilityId, String productVariantId)?
        loadStockReconciliationData,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loadStockReconciliationData != null) {
      return loadStockReconciliationData(facilityId, productVariantId);
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
    required TResult Function(InventoryReportLoadingEvent value) loading,
  }) {
    return loadStockReconciliationData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportLoadStockDataEvent value)? loadStockData,
    TResult? Function(InventoryReportLoadStockReconciliationDataEvent value)?
        loadStockReconciliationData,
    TResult? Function(InventoryReportLoadingEvent value)? loading,
  }) {
    return loadStockReconciliationData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryReportLoadStockDataEvent value)? loadStockData,
    TResult Function(InventoryReportLoadStockReconciliationDataEvent value)?
        loadStockReconciliationData,
    TResult Function(InventoryReportLoadingEvent value)? loading,
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
  const factory InventoryReportLoadStockReconciliationDataEvent(
          {required final String facilityId,
          required final String productVariantId}) =
      _$InventoryReportLoadStockReconciliationDataEventImpl;

  String get facilityId;
  String get productVariantId;
  @JsonKey(ignore: true)
  _$$InventoryReportLoadStockReconciliationDataEventImplCopyWith<
          _$InventoryReportLoadStockReconciliationDataEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InventoryReportLoadingEventImplCopyWith<$Res> {
  factory _$$InventoryReportLoadingEventImplCopyWith(
          _$InventoryReportLoadingEventImpl value,
          $Res Function(_$InventoryReportLoadingEventImpl) then) =
      __$$InventoryReportLoadingEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InventoryReportLoadingEventImplCopyWithImpl<$Res>
    extends _$InventoryReportEventCopyWithImpl<$Res,
        _$InventoryReportLoadingEventImpl>
    implements _$$InventoryReportLoadingEventImplCopyWith<$Res> {
  __$$InventoryReportLoadingEventImplCopyWithImpl(
      _$InventoryReportLoadingEventImpl _value,
      $Res Function(_$InventoryReportLoadingEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InventoryReportLoadingEventImpl implements InventoryReportLoadingEvent {
  const _$InventoryReportLoadingEventImpl();

  @override
  String toString() {
    return 'InventoryReportEvent.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryReportLoadingEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InventoryReportType reportType, String facilityId,
            String productVariantId)
        loadStockData,
    required TResult Function(String facilityId, String productVariantId)
        loadStockReconciliationData,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportType reportType, String facilityId,
            String productVariantId)?
        loadStockData,
    TResult? Function(String facilityId, String productVariantId)?
        loadStockReconciliationData,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InventoryReportType reportType, String facilityId,
            String productVariantId)?
        loadStockData,
    TResult Function(String facilityId, String productVariantId)?
        loadStockReconciliationData,
    TResult Function()? loading,
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
    required TResult Function(InventoryReportLoadStockDataEvent value)
        loadStockData,
    required TResult Function(
            InventoryReportLoadStockReconciliationDataEvent value)
        loadStockReconciliationData,
    required TResult Function(InventoryReportLoadingEvent value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportLoadStockDataEvent value)? loadStockData,
    TResult? Function(InventoryReportLoadStockReconciliationDataEvent value)?
        loadStockReconciliationData,
    TResult? Function(InventoryReportLoadingEvent value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryReportLoadStockDataEvent value)? loadStockData,
    TResult Function(InventoryReportLoadStockReconciliationDataEvent value)?
        loadStockReconciliationData,
    TResult Function(InventoryReportLoadingEvent value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class InventoryReportLoadingEvent implements InventoryReportEvent {
  const factory InventoryReportLoadingEvent() =
      _$InventoryReportLoadingEventImpl;
}

/// @nodoc
mixin _$InventoryReportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Map<String, List<StockModel>> stockData) stock,
    required TResult Function(Map<String, List<StockReconciliationModel>> data)
        stockReconciliation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Map<String, List<StockModel>> stockData)? stock,
    TResult? Function(Map<String, List<StockReconciliationModel>> data)?
        stockReconciliation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Map<String, List<StockModel>> stockData)? stock,
    TResult Function(Map<String, List<StockReconciliationModel>> data)?
        stockReconciliation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InventoryReportLoadingState value) loading,
    required TResult Function(InventoryReportEmptyState value) empty,
    required TResult Function(InventoryReportStockState value) stock,
    required TResult Function(InventoryReportStockReconciliationState value)
        stockReconciliation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportLoadingState value)? loading,
    TResult? Function(InventoryReportEmptyState value)? empty,
    TResult? Function(InventoryReportStockState value)? stock,
    TResult? Function(InventoryReportStockReconciliationState value)?
        stockReconciliation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryReportLoadingState value)? loading,
    TResult Function(InventoryReportEmptyState value)? empty,
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
abstract class _$$InventoryReportLoadingStateImplCopyWith<$Res> {
  factory _$$InventoryReportLoadingStateImplCopyWith(
          _$InventoryReportLoadingStateImpl value,
          $Res Function(_$InventoryReportLoadingStateImpl) then) =
      __$$InventoryReportLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InventoryReportLoadingStateImplCopyWithImpl<$Res>
    extends _$InventoryReportStateCopyWithImpl<$Res,
        _$InventoryReportLoadingStateImpl>
    implements _$$InventoryReportLoadingStateImplCopyWith<$Res> {
  __$$InventoryReportLoadingStateImplCopyWithImpl(
      _$InventoryReportLoadingStateImpl _value,
      $Res Function(_$InventoryReportLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InventoryReportLoadingStateImpl implements InventoryReportLoadingState {
  const _$InventoryReportLoadingStateImpl();

  @override
  String toString() {
    return 'InventoryReportState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryReportLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
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
    TResult? Function()? empty,
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
    TResult Function()? empty,
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
    required TResult Function(InventoryReportEmptyState value) empty,
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
    TResult? Function(InventoryReportEmptyState value)? empty,
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
    TResult Function(InventoryReportEmptyState value)? empty,
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
  const factory InventoryReportLoadingState() =
      _$InventoryReportLoadingStateImpl;
}

/// @nodoc
abstract class _$$InventoryReportEmptyStateImplCopyWith<$Res> {
  factory _$$InventoryReportEmptyStateImplCopyWith(
          _$InventoryReportEmptyStateImpl value,
          $Res Function(_$InventoryReportEmptyStateImpl) then) =
      __$$InventoryReportEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InventoryReportEmptyStateImplCopyWithImpl<$Res>
    extends _$InventoryReportStateCopyWithImpl<$Res,
        _$InventoryReportEmptyStateImpl>
    implements _$$InventoryReportEmptyStateImplCopyWith<$Res> {
  __$$InventoryReportEmptyStateImplCopyWithImpl(
      _$InventoryReportEmptyStateImpl _value,
      $Res Function(_$InventoryReportEmptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InventoryReportEmptyStateImpl implements InventoryReportEmptyState {
  const _$InventoryReportEmptyStateImpl();

  @override
  String toString() {
    return 'InventoryReportState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryReportEmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Map<String, List<StockModel>> stockData) stock,
    required TResult Function(Map<String, List<StockReconciliationModel>> data)
        stockReconciliation,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Map<String, List<StockModel>> stockData)? stock,
    TResult? Function(Map<String, List<StockReconciliationModel>> data)?
        stockReconciliation,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Map<String, List<StockModel>> stockData)? stock,
    TResult Function(Map<String, List<StockReconciliationModel>> data)?
        stockReconciliation,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InventoryReportLoadingState value) loading,
    required TResult Function(InventoryReportEmptyState value) empty,
    required TResult Function(InventoryReportStockState value) stock,
    required TResult Function(InventoryReportStockReconciliationState value)
        stockReconciliation,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryReportLoadingState value)? loading,
    TResult? Function(InventoryReportEmptyState value)? empty,
    TResult? Function(InventoryReportStockState value)? stock,
    TResult? Function(InventoryReportStockReconciliationState value)?
        stockReconciliation,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryReportLoadingState value)? loading,
    TResult Function(InventoryReportEmptyState value)? empty,
    TResult Function(InventoryReportStockState value)? stock,
    TResult Function(InventoryReportStockReconciliationState value)?
        stockReconciliation,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class InventoryReportEmptyState implements InventoryReportState {
  const factory InventoryReportEmptyState() = _$InventoryReportEmptyStateImpl;
}

/// @nodoc
abstract class _$$InventoryReportStockStateImplCopyWith<$Res> {
  factory _$$InventoryReportStockStateImplCopyWith(
          _$InventoryReportStockStateImpl value,
          $Res Function(_$InventoryReportStockStateImpl) then) =
      __$$InventoryReportStockStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, List<StockModel>> stockData});
}

/// @nodoc
class __$$InventoryReportStockStateImplCopyWithImpl<$Res>
    extends _$InventoryReportStateCopyWithImpl<$Res,
        _$InventoryReportStockStateImpl>
    implements _$$InventoryReportStockStateImplCopyWith<$Res> {
  __$$InventoryReportStockStateImplCopyWithImpl(
      _$InventoryReportStockStateImpl _value,
      $Res Function(_$InventoryReportStockStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stockData = null,
  }) {
    return _then(_$InventoryReportStockStateImpl(
      stockData: null == stockData
          ? _value._stockData
          : stockData // ignore: cast_nullable_to_non_nullable
              as Map<String, List<StockModel>>,
    ));
  }
}

/// @nodoc

class _$InventoryReportStockStateImpl implements InventoryReportStockState {
  const _$InventoryReportStockStateImpl(
      {final Map<String, List<StockModel>> stockData = const {}})
      : _stockData = stockData;

  final Map<String, List<StockModel>> _stockData;
  @override
  @JsonKey()
  Map<String, List<StockModel>> get stockData {
    if (_stockData is EqualUnmodifiableMapView) return _stockData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stockData);
  }

  @override
  String toString() {
    return 'InventoryReportState.stock(stockData: $stockData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryReportStockStateImpl &&
            const DeepCollectionEquality()
                .equals(other._stockData, _stockData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_stockData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryReportStockStateImplCopyWith<_$InventoryReportStockStateImpl>
      get copyWith => __$$InventoryReportStockStateImplCopyWithImpl<
          _$InventoryReportStockStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
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
    TResult? Function()? empty,
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
    TResult Function()? empty,
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
    required TResult Function(InventoryReportEmptyState value) empty,
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
    TResult? Function(InventoryReportEmptyState value)? empty,
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
    TResult Function(InventoryReportEmptyState value)? empty,
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
      _$InventoryReportStockStateImpl;

  Map<String, List<StockModel>> get stockData;
  @JsonKey(ignore: true)
  _$$InventoryReportStockStateImplCopyWith<_$InventoryReportStockStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InventoryReportStockReconciliationStateImplCopyWith<$Res> {
  factory _$$InventoryReportStockReconciliationStateImplCopyWith(
          _$InventoryReportStockReconciliationStateImpl value,
          $Res Function(_$InventoryReportStockReconciliationStateImpl) then) =
      __$$InventoryReportStockReconciliationStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, List<StockReconciliationModel>> data});
}

/// @nodoc
class __$$InventoryReportStockReconciliationStateImplCopyWithImpl<$Res>
    extends _$InventoryReportStateCopyWithImpl<$Res,
        _$InventoryReportStockReconciliationStateImpl>
    implements _$$InventoryReportStockReconciliationStateImplCopyWith<$Res> {
  __$$InventoryReportStockReconciliationStateImplCopyWithImpl(
      _$InventoryReportStockReconciliationStateImpl _value,
      $Res Function(_$InventoryReportStockReconciliationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$InventoryReportStockReconciliationStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, List<StockReconciliationModel>>,
    ));
  }
}

/// @nodoc

class _$InventoryReportStockReconciliationStateImpl
    implements InventoryReportStockReconciliationState {
  const _$InventoryReportStockReconciliationStateImpl(
      {final Map<String, List<StockReconciliationModel>> data = const {}})
      : _data = data;

  final Map<String, List<StockReconciliationModel>> _data;
  @override
  @JsonKey()
  Map<String, List<StockReconciliationModel>> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'InventoryReportState.stockReconciliation(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryReportStockReconciliationStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryReportStockReconciliationStateImplCopyWith<
          _$InventoryReportStockReconciliationStateImpl>
      get copyWith =>
          __$$InventoryReportStockReconciliationStateImplCopyWithImpl<
              _$InventoryReportStockReconciliationStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
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
    TResult? Function()? empty,
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
    TResult Function()? empty,
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
    required TResult Function(InventoryReportEmptyState value) empty,
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
    TResult? Function(InventoryReportEmptyState value)? empty,
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
    TResult Function(InventoryReportEmptyState value)? empty,
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
      _$InventoryReportStockReconciliationStateImpl;

  Map<String, List<StockReconciliationModel>> get data;
  @JsonKey(ignore: true)
  _$$InventoryReportStockReconciliationStateImplCopyWith<
          _$InventoryReportStockReconciliationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

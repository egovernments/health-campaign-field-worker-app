// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'performance_summary_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PerformanceSummaryReportEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadData,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadData,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadData,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformanceSummaryReportLoadDataEvent value)
        loadData,
    required TResult Function(PerformanceSummaryReportLoadingEvent value)
        loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformanceSummaryReportLoadDataEvent value)? loadData,
    TResult? Function(PerformanceSummaryReportLoadingEvent value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformanceSummaryReportLoadDataEvent value)? loadData,
    TResult Function(PerformanceSummaryReportLoadingEvent value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceSummaryReportEventCopyWith<$Res> {
  factory $PerformanceSummaryReportEventCopyWith(
          PerformanceSummaryReportEvent value,
          $Res Function(PerformanceSummaryReportEvent) then) =
      _$PerformanceSummaryReportEventCopyWithImpl<$Res,
          PerformanceSummaryReportEvent>;
}

/// @nodoc
class _$PerformanceSummaryReportEventCopyWithImpl<$Res,
        $Val extends PerformanceSummaryReportEvent>
    implements $PerformanceSummaryReportEventCopyWith<$Res> {
  _$PerformanceSummaryReportEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PerformanceSummaryReportLoadDataEventImplCopyWith<$Res> {
  factory _$$PerformanceSummaryReportLoadDataEventImplCopyWith(
          _$PerformanceSummaryReportLoadDataEventImpl value,
          $Res Function(_$PerformanceSummaryReportLoadDataEventImpl) then) =
      __$$PerformanceSummaryReportLoadDataEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$PerformanceSummaryReportLoadDataEventImplCopyWithImpl<$Res>
    extends _$PerformanceSummaryReportEventCopyWithImpl<$Res,
        _$PerformanceSummaryReportLoadDataEventImpl>
    implements _$$PerformanceSummaryReportLoadDataEventImplCopyWith<$Res> {
  __$$PerformanceSummaryReportLoadDataEventImplCopyWithImpl(
      _$PerformanceSummaryReportLoadDataEventImpl _value,
      $Res Function(_$PerformanceSummaryReportLoadDataEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$PerformanceSummaryReportLoadDataEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PerformanceSummaryReportLoadDataEventImpl
    implements PerformanceSummaryReportLoadDataEvent {
  const _$PerformanceSummaryReportLoadDataEventImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'PerformanceSummaryReportEvent.loadData(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceSummaryReportLoadDataEventImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceSummaryReportLoadDataEventImplCopyWith<
          _$PerformanceSummaryReportLoadDataEventImpl>
      get copyWith => __$$PerformanceSummaryReportLoadDataEventImplCopyWithImpl<
          _$PerformanceSummaryReportLoadDataEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadData,
    required TResult Function() loading,
  }) {
    return loadData(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadData,
    TResult? Function()? loading,
  }) {
    return loadData?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadData,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformanceSummaryReportLoadDataEvent value)
        loadData,
    required TResult Function(PerformanceSummaryReportLoadingEvent value)
        loading,
  }) {
    return loadData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformanceSummaryReportLoadDataEvent value)? loadData,
    TResult? Function(PerformanceSummaryReportLoadingEvent value)? loading,
  }) {
    return loadData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformanceSummaryReportLoadDataEvent value)? loadData,
    TResult Function(PerformanceSummaryReportLoadingEvent value)? loading,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData(this);
    }
    return orElse();
  }
}

abstract class PerformanceSummaryReportLoadDataEvent
    implements PerformanceSummaryReportEvent {
  const factory PerformanceSummaryReportLoadDataEvent(
          {required final String userId}) =
      _$PerformanceSummaryReportLoadDataEventImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$PerformanceSummaryReportLoadDataEventImplCopyWith<
          _$PerformanceSummaryReportLoadDataEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PerformanceSummaryReportLoadingEventImplCopyWith<$Res> {
  factory _$$PerformanceSummaryReportLoadingEventImplCopyWith(
          _$PerformanceSummaryReportLoadingEventImpl value,
          $Res Function(_$PerformanceSummaryReportLoadingEventImpl) then) =
      __$$PerformanceSummaryReportLoadingEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PerformanceSummaryReportLoadingEventImplCopyWithImpl<$Res>
    extends _$PerformanceSummaryReportEventCopyWithImpl<$Res,
        _$PerformanceSummaryReportLoadingEventImpl>
    implements _$$PerformanceSummaryReportLoadingEventImplCopyWith<$Res> {
  __$$PerformanceSummaryReportLoadingEventImplCopyWithImpl(
      _$PerformanceSummaryReportLoadingEventImpl _value,
      $Res Function(_$PerformanceSummaryReportLoadingEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PerformanceSummaryReportLoadingEventImpl
    implements PerformanceSummaryReportLoadingEvent {
  const _$PerformanceSummaryReportLoadingEventImpl();

  @override
  String toString() {
    return 'PerformanceSummaryReportEvent.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceSummaryReportLoadingEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadData,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadData,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadData,
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
    required TResult Function(PerformanceSummaryReportLoadDataEvent value)
        loadData,
    required TResult Function(PerformanceSummaryReportLoadingEvent value)
        loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformanceSummaryReportLoadDataEvent value)? loadData,
    TResult? Function(PerformanceSummaryReportLoadingEvent value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformanceSummaryReportLoadDataEvent value)? loadData,
    TResult Function(PerformanceSummaryReportLoadingEvent value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PerformanceSummaryReportLoadingEvent
    implements PerformanceSummaryReportEvent {
  const factory PerformanceSummaryReportLoadingEvent() =
      _$PerformanceSummaryReportLoadingEventImpl;
}

/// @nodoc
mixin _$PerformanceSummaryReportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Map<String, PerformanceSummary> summaryData)
        summaryData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Map<String, PerformanceSummary> summaryData)? summaryData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Map<String, PerformanceSummary> summaryData)? summaryData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformanceSummaryReportLoadingState value)
        loading,
    required TResult Function(PerformanceSummaryReportEmptyState value) empty,
    required TResult Function(PerformanceSummaryReportSummaryDataState value)
        summaryData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformanceSummaryReportLoadingState value)? loading,
    TResult? Function(PerformanceSummaryReportEmptyState value)? empty,
    TResult? Function(PerformanceSummaryReportSummaryDataState value)?
        summaryData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformanceSummaryReportLoadingState value)? loading,
    TResult Function(PerformanceSummaryReportEmptyState value)? empty,
    TResult Function(PerformanceSummaryReportSummaryDataState value)?
        summaryData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceSummaryReportStateCopyWith<$Res> {
  factory $PerformanceSummaryReportStateCopyWith(
          PerformanceSummaryReportState value,
          $Res Function(PerformanceSummaryReportState) then) =
      _$PerformanceSummaryReportStateCopyWithImpl<$Res,
          PerformanceSummaryReportState>;
}

/// @nodoc
class _$PerformanceSummaryReportStateCopyWithImpl<$Res,
        $Val extends PerformanceSummaryReportState>
    implements $PerformanceSummaryReportStateCopyWith<$Res> {
  _$PerformanceSummaryReportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PerformanceSummaryReportLoadingStateImplCopyWith<$Res> {
  factory _$$PerformanceSummaryReportLoadingStateImplCopyWith(
          _$PerformanceSummaryReportLoadingStateImpl value,
          $Res Function(_$PerformanceSummaryReportLoadingStateImpl) then) =
      __$$PerformanceSummaryReportLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PerformanceSummaryReportLoadingStateImplCopyWithImpl<$Res>
    extends _$PerformanceSummaryReportStateCopyWithImpl<$Res,
        _$PerformanceSummaryReportLoadingStateImpl>
    implements _$$PerformanceSummaryReportLoadingStateImplCopyWith<$Res> {
  __$$PerformanceSummaryReportLoadingStateImplCopyWithImpl(
      _$PerformanceSummaryReportLoadingStateImpl _value,
      $Res Function(_$PerformanceSummaryReportLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PerformanceSummaryReportLoadingStateImpl
    implements PerformanceSummaryReportLoadingState {
  const _$PerformanceSummaryReportLoadingStateImpl();

  @override
  String toString() {
    return 'PerformanceSummaryReportState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceSummaryReportLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Map<String, PerformanceSummary> summaryData)
        summaryData,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Map<String, PerformanceSummary> summaryData)? summaryData,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Map<String, PerformanceSummary> summaryData)? summaryData,
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
    required TResult Function(PerformanceSummaryReportLoadingState value)
        loading,
    required TResult Function(PerformanceSummaryReportEmptyState value) empty,
    required TResult Function(PerformanceSummaryReportSummaryDataState value)
        summaryData,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformanceSummaryReportLoadingState value)? loading,
    TResult? Function(PerformanceSummaryReportEmptyState value)? empty,
    TResult? Function(PerformanceSummaryReportSummaryDataState value)?
        summaryData,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformanceSummaryReportLoadingState value)? loading,
    TResult Function(PerformanceSummaryReportEmptyState value)? empty,
    TResult Function(PerformanceSummaryReportSummaryDataState value)?
        summaryData,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PerformanceSummaryReportLoadingState
    implements PerformanceSummaryReportState {
  const factory PerformanceSummaryReportLoadingState() =
      _$PerformanceSummaryReportLoadingStateImpl;
}

/// @nodoc
abstract class _$$PerformanceSummaryReportEmptyStateImplCopyWith<$Res> {
  factory _$$PerformanceSummaryReportEmptyStateImplCopyWith(
          _$PerformanceSummaryReportEmptyStateImpl value,
          $Res Function(_$PerformanceSummaryReportEmptyStateImpl) then) =
      __$$PerformanceSummaryReportEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PerformanceSummaryReportEmptyStateImplCopyWithImpl<$Res>
    extends _$PerformanceSummaryReportStateCopyWithImpl<$Res,
        _$PerformanceSummaryReportEmptyStateImpl>
    implements _$$PerformanceSummaryReportEmptyStateImplCopyWith<$Res> {
  __$$PerformanceSummaryReportEmptyStateImplCopyWithImpl(
      _$PerformanceSummaryReportEmptyStateImpl _value,
      $Res Function(_$PerformanceSummaryReportEmptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PerformanceSummaryReportEmptyStateImpl
    implements PerformanceSummaryReportEmptyState {
  const _$PerformanceSummaryReportEmptyStateImpl();

  @override
  String toString() {
    return 'PerformanceSummaryReportState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceSummaryReportEmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Map<String, PerformanceSummary> summaryData)
        summaryData,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Map<String, PerformanceSummary> summaryData)? summaryData,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Map<String, PerformanceSummary> summaryData)? summaryData,
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
    required TResult Function(PerformanceSummaryReportLoadingState value)
        loading,
    required TResult Function(PerformanceSummaryReportEmptyState value) empty,
    required TResult Function(PerformanceSummaryReportSummaryDataState value)
        summaryData,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformanceSummaryReportLoadingState value)? loading,
    TResult? Function(PerformanceSummaryReportEmptyState value)? empty,
    TResult? Function(PerformanceSummaryReportSummaryDataState value)?
        summaryData,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformanceSummaryReportLoadingState value)? loading,
    TResult Function(PerformanceSummaryReportEmptyState value)? empty,
    TResult Function(PerformanceSummaryReportSummaryDataState value)?
        summaryData,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class PerformanceSummaryReportEmptyState
    implements PerformanceSummaryReportState {
  const factory PerformanceSummaryReportEmptyState() =
      _$PerformanceSummaryReportEmptyStateImpl;
}

/// @nodoc
abstract class _$$PerformanceSummaryReportSummaryDataStateImplCopyWith<$Res> {
  factory _$$PerformanceSummaryReportSummaryDataStateImplCopyWith(
          _$PerformanceSummaryReportSummaryDataStateImpl value,
          $Res Function(_$PerformanceSummaryReportSummaryDataStateImpl) then) =
      __$$PerformanceSummaryReportSummaryDataStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, PerformanceSummary> summaryData});
}

/// @nodoc
class __$$PerformanceSummaryReportSummaryDataStateImplCopyWithImpl<$Res>
    extends _$PerformanceSummaryReportStateCopyWithImpl<$Res,
        _$PerformanceSummaryReportSummaryDataStateImpl>
    implements _$$PerformanceSummaryReportSummaryDataStateImplCopyWith<$Res> {
  __$$PerformanceSummaryReportSummaryDataStateImplCopyWithImpl(
      _$PerformanceSummaryReportSummaryDataStateImpl _value,
      $Res Function(_$PerformanceSummaryReportSummaryDataStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summaryData = null,
  }) {
    return _then(_$PerformanceSummaryReportSummaryDataStateImpl(
      summaryData: null == summaryData
          ? _value._summaryData
          : summaryData // ignore: cast_nullable_to_non_nullable
              as Map<String, PerformanceSummary>,
    ));
  }
}

/// @nodoc

class _$PerformanceSummaryReportSummaryDataStateImpl
    implements PerformanceSummaryReportSummaryDataState {
  const _$PerformanceSummaryReportSummaryDataStateImpl(
      {final Map<String, PerformanceSummary> summaryData = const {}})
      : _summaryData = summaryData;

  final Map<String, PerformanceSummary> _summaryData;
  @override
  @JsonKey()
  Map<String, PerformanceSummary> get summaryData {
    if (_summaryData is EqualUnmodifiableMapView) return _summaryData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_summaryData);
  }

  @override
  String toString() {
    return 'PerformanceSummaryReportState.summaryData(summaryData: $summaryData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceSummaryReportSummaryDataStateImpl &&
            const DeepCollectionEquality()
                .equals(other._summaryData, _summaryData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_summaryData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceSummaryReportSummaryDataStateImplCopyWith<
          _$PerformanceSummaryReportSummaryDataStateImpl>
      get copyWith =>
          __$$PerformanceSummaryReportSummaryDataStateImplCopyWithImpl<
              _$PerformanceSummaryReportSummaryDataStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Map<String, PerformanceSummary> summaryData)
        summaryData,
  }) {
    return summaryData(this.summaryData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Map<String, PerformanceSummary> summaryData)? summaryData,
  }) {
    return summaryData?.call(this.summaryData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Map<String, PerformanceSummary> summaryData)? summaryData,
    required TResult orElse(),
  }) {
    if (summaryData != null) {
      return summaryData(this.summaryData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformanceSummaryReportLoadingState value)
        loading,
    required TResult Function(PerformanceSummaryReportEmptyState value) empty,
    required TResult Function(PerformanceSummaryReportSummaryDataState value)
        summaryData,
  }) {
    return summaryData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PerformanceSummaryReportLoadingState value)? loading,
    TResult? Function(PerformanceSummaryReportEmptyState value)? empty,
    TResult? Function(PerformanceSummaryReportSummaryDataState value)?
        summaryData,
  }) {
    return summaryData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformanceSummaryReportLoadingState value)? loading,
    TResult Function(PerformanceSummaryReportEmptyState value)? empty,
    TResult Function(PerformanceSummaryReportSummaryDataState value)?
        summaryData,
    required TResult orElse(),
  }) {
    if (summaryData != null) {
      return summaryData(this);
    }
    return orElse();
  }
}

abstract class PerformanceSummaryReportSummaryDataState
    implements PerformanceSummaryReportState {
  const factory PerformanceSummaryReportSummaryDataState(
          {final Map<String, PerformanceSummary> summaryData}) =
      _$PerformanceSummaryReportSummaryDataStateImpl;

  Map<String, PerformanceSummary> get summaryData;
  @JsonKey(ignore: true)
  _$$PerformanceSummaryReportSummaryDataStateImplCopyWith<
          _$PerformanceSummaryReportSummaryDataStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

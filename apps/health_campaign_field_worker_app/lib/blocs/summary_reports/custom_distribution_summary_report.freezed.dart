// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_distribution_summary_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomDistributionSummaryReportEvent {
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
    required TResult Function(
            CustomDistributionSummaryReportLoadDataEvent value)
        loadData,
    required TResult Function(CustomDistributionSummaryReportLoadingEvent value)
        loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomDistributionSummaryReportLoadDataEvent value)?
        loadData,
    TResult? Function(CustomDistributionSummaryReportLoadingEvent value)?
        loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomDistributionSummaryReportLoadDataEvent value)?
        loadData,
    TResult Function(CustomDistributionSummaryReportLoadingEvent value)?
        loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomDistributionSummaryReportEventCopyWith<$Res> {
  factory $CustomDistributionSummaryReportEventCopyWith(
          CustomDistributionSummaryReportEvent value,
          $Res Function(CustomDistributionSummaryReportEvent) then) =
      _$CustomDistributionSummaryReportEventCopyWithImpl<$Res,
          CustomDistributionSummaryReportEvent>;
}

/// @nodoc
class _$CustomDistributionSummaryReportEventCopyWithImpl<$Res,
        $Val extends CustomDistributionSummaryReportEvent>
    implements $CustomDistributionSummaryReportEventCopyWith<$Res> {
  _$CustomDistributionSummaryReportEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CustomDistributionSummaryReportLoadDataEventImplCopyWith<
    $Res> {
  factory _$$CustomDistributionSummaryReportLoadDataEventImplCopyWith(
          _$CustomDistributionSummaryReportLoadDataEventImpl value,
          $Res Function(_$CustomDistributionSummaryReportLoadDataEventImpl)
              then) =
      __$$CustomDistributionSummaryReportLoadDataEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$CustomDistributionSummaryReportLoadDataEventImplCopyWithImpl<$Res>
    extends _$CustomDistributionSummaryReportEventCopyWithImpl<$Res,
        _$CustomDistributionSummaryReportLoadDataEventImpl>
    implements
        _$$CustomDistributionSummaryReportLoadDataEventImplCopyWith<$Res> {
  __$$CustomDistributionSummaryReportLoadDataEventImplCopyWithImpl(
      _$CustomDistributionSummaryReportLoadDataEventImpl _value,
      $Res Function(_$CustomDistributionSummaryReportLoadDataEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$CustomDistributionSummaryReportLoadDataEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomDistributionSummaryReportLoadDataEventImpl
    implements CustomDistributionSummaryReportLoadDataEvent {
  const _$CustomDistributionSummaryReportLoadDataEventImpl(
      {required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'CustomDistributionSummaryReportEvent.loadData(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomDistributionSummaryReportLoadDataEventImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomDistributionSummaryReportLoadDataEventImplCopyWith<
          _$CustomDistributionSummaryReportLoadDataEventImpl>
      get copyWith =>
          __$$CustomDistributionSummaryReportLoadDataEventImplCopyWithImpl<
                  _$CustomDistributionSummaryReportLoadDataEventImpl>(
              this, _$identity);

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
    required TResult Function(
            CustomDistributionSummaryReportLoadDataEvent value)
        loadData,
    required TResult Function(CustomDistributionSummaryReportLoadingEvent value)
        loading,
  }) {
    return loadData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomDistributionSummaryReportLoadDataEvent value)?
        loadData,
    TResult? Function(CustomDistributionSummaryReportLoadingEvent value)?
        loading,
  }) {
    return loadData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomDistributionSummaryReportLoadDataEvent value)?
        loadData,
    TResult Function(CustomDistributionSummaryReportLoadingEvent value)?
        loading,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData(this);
    }
    return orElse();
  }
}

abstract class CustomDistributionSummaryReportLoadDataEvent
    implements CustomDistributionSummaryReportEvent {
  const factory CustomDistributionSummaryReportLoadDataEvent(
          {required final String userId}) =
      _$CustomDistributionSummaryReportLoadDataEventImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$CustomDistributionSummaryReportLoadDataEventImplCopyWith<
          _$CustomDistributionSummaryReportLoadDataEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomDistributionSummaryReportLoadingEventImplCopyWith<
    $Res> {
  factory _$$CustomDistributionSummaryReportLoadingEventImplCopyWith(
          _$CustomDistributionSummaryReportLoadingEventImpl value,
          $Res Function(_$CustomDistributionSummaryReportLoadingEventImpl)
              then) =
      __$$CustomDistributionSummaryReportLoadingEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CustomDistributionSummaryReportLoadingEventImplCopyWithImpl<$Res>
    extends _$CustomDistributionSummaryReportEventCopyWithImpl<$Res,
        _$CustomDistributionSummaryReportLoadingEventImpl>
    implements
        _$$CustomDistributionSummaryReportLoadingEventImplCopyWith<$Res> {
  __$$CustomDistributionSummaryReportLoadingEventImplCopyWithImpl(
      _$CustomDistributionSummaryReportLoadingEventImpl _value,
      $Res Function(_$CustomDistributionSummaryReportLoadingEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CustomDistributionSummaryReportLoadingEventImpl
    implements CustomDistributionSummaryReportLoadingEvent {
  const _$CustomDistributionSummaryReportLoadingEventImpl();

  @override
  String toString() {
    return 'CustomDistributionSummaryReportEvent.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomDistributionSummaryReportLoadingEventImpl);
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
    required TResult Function(
            CustomDistributionSummaryReportLoadDataEvent value)
        loadData,
    required TResult Function(CustomDistributionSummaryReportLoadingEvent value)
        loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomDistributionSummaryReportLoadDataEvent value)?
        loadData,
    TResult? Function(CustomDistributionSummaryReportLoadingEvent value)?
        loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomDistributionSummaryReportLoadDataEvent value)?
        loadData,
    TResult Function(CustomDistributionSummaryReportLoadingEvent value)?
        loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CustomDistributionSummaryReportLoadingEvent
    implements CustomDistributionSummaryReportEvent {
  const factory CustomDistributionSummaryReportLoadingEvent() =
      _$CustomDistributionSummaryReportLoadingEventImpl;
}

/// @nodoc
mixin _$CustomDistributionSummaryReportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Map<String, Map<String, int>> summaryData)
        summaryData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Map<String, Map<String, int>> summaryData)? summaryData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Map<String, Map<String, int>> summaryData)? summaryData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CustomDistributionSummaryReportLoadingState value)
        loading,
    required TResult Function(CustomDistributionSummaryReportEmptyState value)
        empty,
    required TResult Function(
            CustomDistributionSummaryReportSummaryDataState value)
        summaryData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomDistributionSummaryReportLoadingState value)?
        loading,
    TResult? Function(CustomDistributionSummaryReportEmptyState value)? empty,
    TResult? Function(CustomDistributionSummaryReportSummaryDataState value)?
        summaryData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomDistributionSummaryReportLoadingState value)?
        loading,
    TResult Function(CustomDistributionSummaryReportEmptyState value)? empty,
    TResult Function(CustomDistributionSummaryReportSummaryDataState value)?
        summaryData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomDistributionSummaryReportStateCopyWith<$Res> {
  factory $CustomDistributionSummaryReportStateCopyWith(
          CustomDistributionSummaryReportState value,
          $Res Function(CustomDistributionSummaryReportState) then) =
      _$CustomDistributionSummaryReportStateCopyWithImpl<$Res,
          CustomDistributionSummaryReportState>;
}

/// @nodoc
class _$CustomDistributionSummaryReportStateCopyWithImpl<$Res,
        $Val extends CustomDistributionSummaryReportState>
    implements $CustomDistributionSummaryReportStateCopyWith<$Res> {
  _$CustomDistributionSummaryReportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CustomDistributionSummaryReportLoadingStateImplCopyWith<
    $Res> {
  factory _$$CustomDistributionSummaryReportLoadingStateImplCopyWith(
          _$CustomDistributionSummaryReportLoadingStateImpl value,
          $Res Function(_$CustomDistributionSummaryReportLoadingStateImpl)
              then) =
      __$$CustomDistributionSummaryReportLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CustomDistributionSummaryReportLoadingStateImplCopyWithImpl<$Res>
    extends _$CustomDistributionSummaryReportStateCopyWithImpl<$Res,
        _$CustomDistributionSummaryReportLoadingStateImpl>
    implements
        _$$CustomDistributionSummaryReportLoadingStateImplCopyWith<$Res> {
  __$$CustomDistributionSummaryReportLoadingStateImplCopyWithImpl(
      _$CustomDistributionSummaryReportLoadingStateImpl _value,
      $Res Function(_$CustomDistributionSummaryReportLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CustomDistributionSummaryReportLoadingStateImpl
    implements CustomDistributionSummaryReportLoadingState {
  const _$CustomDistributionSummaryReportLoadingStateImpl();

  @override
  String toString() {
    return 'CustomDistributionSummaryReportState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomDistributionSummaryReportLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Map<String, Map<String, int>> summaryData)
        summaryData,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Map<String, Map<String, int>> summaryData)? summaryData,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Map<String, Map<String, int>> summaryData)? summaryData,
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
    required TResult Function(CustomDistributionSummaryReportLoadingState value)
        loading,
    required TResult Function(CustomDistributionSummaryReportEmptyState value)
        empty,
    required TResult Function(
            CustomDistributionSummaryReportSummaryDataState value)
        summaryData,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomDistributionSummaryReportLoadingState value)?
        loading,
    TResult? Function(CustomDistributionSummaryReportEmptyState value)? empty,
    TResult? Function(CustomDistributionSummaryReportSummaryDataState value)?
        summaryData,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomDistributionSummaryReportLoadingState value)?
        loading,
    TResult Function(CustomDistributionSummaryReportEmptyState value)? empty,
    TResult Function(CustomDistributionSummaryReportSummaryDataState value)?
        summaryData,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CustomDistributionSummaryReportLoadingState
    implements CustomDistributionSummaryReportState {
  const factory CustomDistributionSummaryReportLoadingState() =
      _$CustomDistributionSummaryReportLoadingStateImpl;
}

/// @nodoc
abstract class _$$CustomDistributionSummaryReportEmptyStateImplCopyWith<$Res> {
  factory _$$CustomDistributionSummaryReportEmptyStateImplCopyWith(
          _$CustomDistributionSummaryReportEmptyStateImpl value,
          $Res Function(_$CustomDistributionSummaryReportEmptyStateImpl) then) =
      __$$CustomDistributionSummaryReportEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CustomDistributionSummaryReportEmptyStateImplCopyWithImpl<$Res>
    extends _$CustomDistributionSummaryReportStateCopyWithImpl<$Res,
        _$CustomDistributionSummaryReportEmptyStateImpl>
    implements _$$CustomDistributionSummaryReportEmptyStateImplCopyWith<$Res> {
  __$$CustomDistributionSummaryReportEmptyStateImplCopyWithImpl(
      _$CustomDistributionSummaryReportEmptyStateImpl _value,
      $Res Function(_$CustomDistributionSummaryReportEmptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CustomDistributionSummaryReportEmptyStateImpl
    implements CustomDistributionSummaryReportEmptyState {
  const _$CustomDistributionSummaryReportEmptyStateImpl();

  @override
  String toString() {
    return 'CustomDistributionSummaryReportState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomDistributionSummaryReportEmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Map<String, Map<String, int>> summaryData)
        summaryData,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Map<String, Map<String, int>> summaryData)? summaryData,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Map<String, Map<String, int>> summaryData)? summaryData,
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
    required TResult Function(CustomDistributionSummaryReportLoadingState value)
        loading,
    required TResult Function(CustomDistributionSummaryReportEmptyState value)
        empty,
    required TResult Function(
            CustomDistributionSummaryReportSummaryDataState value)
        summaryData,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomDistributionSummaryReportLoadingState value)?
        loading,
    TResult? Function(CustomDistributionSummaryReportEmptyState value)? empty,
    TResult? Function(CustomDistributionSummaryReportSummaryDataState value)?
        summaryData,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomDistributionSummaryReportLoadingState value)?
        loading,
    TResult Function(CustomDistributionSummaryReportEmptyState value)? empty,
    TResult Function(CustomDistributionSummaryReportSummaryDataState value)?
        summaryData,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class CustomDistributionSummaryReportEmptyState
    implements CustomDistributionSummaryReportState {
  const factory CustomDistributionSummaryReportEmptyState() =
      _$CustomDistributionSummaryReportEmptyStateImpl;
}

/// @nodoc
abstract class _$$CustomDistributionSummaryReportSummaryDataStateImplCopyWith<
    $Res> {
  factory _$$CustomDistributionSummaryReportSummaryDataStateImplCopyWith(
          _$CustomDistributionSummaryReportSummaryDataStateImpl value,
          $Res Function(_$CustomDistributionSummaryReportSummaryDataStateImpl)
              then) =
      __$$CustomDistributionSummaryReportSummaryDataStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, Map<String, int>> summaryData});
}

/// @nodoc
class __$$CustomDistributionSummaryReportSummaryDataStateImplCopyWithImpl<$Res>
    extends _$CustomDistributionSummaryReportStateCopyWithImpl<$Res,
        _$CustomDistributionSummaryReportSummaryDataStateImpl>
    implements
        _$$CustomDistributionSummaryReportSummaryDataStateImplCopyWith<$Res> {
  __$$CustomDistributionSummaryReportSummaryDataStateImplCopyWithImpl(
      _$CustomDistributionSummaryReportSummaryDataStateImpl _value,
      $Res Function(_$CustomDistributionSummaryReportSummaryDataStateImpl)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summaryData = null,
  }) {
    return _then(_$CustomDistributionSummaryReportSummaryDataStateImpl(
      summaryData: null == summaryData
          ? _value._summaryData
          : summaryData // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>,
    ));
  }
}

/// @nodoc

class _$CustomDistributionSummaryReportSummaryDataStateImpl
    implements CustomDistributionSummaryReportSummaryDataState {
  const _$CustomDistributionSummaryReportSummaryDataStateImpl(
      {final Map<String, Map<String, int>> summaryData = const {}})
      : _summaryData = summaryData;

  final Map<String, Map<String, int>> _summaryData;
  @override
  @JsonKey()
  Map<String, Map<String, int>> get summaryData {
    if (_summaryData is EqualUnmodifiableMapView) return _summaryData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_summaryData);
  }

  @override
  String toString() {
    return 'CustomDistributionSummaryReportState.summaryData(summaryData: $summaryData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomDistributionSummaryReportSummaryDataStateImpl &&
            const DeepCollectionEquality()
                .equals(other._summaryData, _summaryData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_summaryData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomDistributionSummaryReportSummaryDataStateImplCopyWith<
          _$CustomDistributionSummaryReportSummaryDataStateImpl>
      get copyWith =>
          __$$CustomDistributionSummaryReportSummaryDataStateImplCopyWithImpl<
                  _$CustomDistributionSummaryReportSummaryDataStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Map<String, Map<String, int>> summaryData)
        summaryData,
  }) {
    return summaryData(this.summaryData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Map<String, Map<String, int>> summaryData)? summaryData,
  }) {
    return summaryData?.call(this.summaryData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Map<String, Map<String, int>> summaryData)? summaryData,
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
    required TResult Function(CustomDistributionSummaryReportLoadingState value)
        loading,
    required TResult Function(CustomDistributionSummaryReportEmptyState value)
        empty,
    required TResult Function(
            CustomDistributionSummaryReportSummaryDataState value)
        summaryData,
  }) {
    return summaryData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomDistributionSummaryReportLoadingState value)?
        loading,
    TResult? Function(CustomDistributionSummaryReportEmptyState value)? empty,
    TResult? Function(CustomDistributionSummaryReportSummaryDataState value)?
        summaryData,
  }) {
    return summaryData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomDistributionSummaryReportLoadingState value)?
        loading,
    TResult Function(CustomDistributionSummaryReportEmptyState value)? empty,
    TResult Function(CustomDistributionSummaryReportSummaryDataState value)?
        summaryData,
    required TResult orElse(),
  }) {
    if (summaryData != null) {
      return summaryData(this);
    }
    return orElse();
  }
}

abstract class CustomDistributionSummaryReportSummaryDataState
    implements CustomDistributionSummaryReportState {
  const factory CustomDistributionSummaryReportSummaryDataState(
          {final Map<String, Map<String, int>> summaryData}) =
      _$CustomDistributionSummaryReportSummaryDataStateImpl;

  Map<String, Map<String, int>> get summaryData;
  @JsonKey(ignore: true)
  _$$CustomDistributionSummaryReportSummaryDataStateImplCopyWith<
          _$CustomDistributionSummaryReportSummaryDataStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

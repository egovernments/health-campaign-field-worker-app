// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_enumeration_summary_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomEnumerationSummaryReportEvent {
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
    required TResult Function(CustomEnumerationSummaryReportLoadDataEvent value)
        loadData,
    required TResult Function(CustomEnumerationSummaryReportLoadingEvent value)
        loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomEnumerationSummaryReportLoadDataEvent value)?
        loadData,
    TResult? Function(CustomEnumerationSummaryReportLoadingEvent value)?
        loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomEnumerationSummaryReportLoadDataEvent value)?
        loadData,
    TResult Function(CustomEnumerationSummaryReportLoadingEvent value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomEnumerationSummaryReportEventCopyWith<$Res> {
  factory $CustomEnumerationSummaryReportEventCopyWith(
          CustomEnumerationSummaryReportEvent value,
          $Res Function(CustomEnumerationSummaryReportEvent) then) =
      _$CustomEnumerationSummaryReportEventCopyWithImpl<$Res,
          CustomEnumerationSummaryReportEvent>;
}

/// @nodoc
class _$CustomEnumerationSummaryReportEventCopyWithImpl<$Res,
        $Val extends CustomEnumerationSummaryReportEvent>
    implements $CustomEnumerationSummaryReportEventCopyWith<$Res> {
  _$CustomEnumerationSummaryReportEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CustomEnumerationSummaryReportLoadDataEventImplCopyWith<
    $Res> {
  factory _$$CustomEnumerationSummaryReportLoadDataEventImplCopyWith(
          _$CustomEnumerationSummaryReportLoadDataEventImpl value,
          $Res Function(_$CustomEnumerationSummaryReportLoadDataEventImpl)
              then) =
      __$$CustomEnumerationSummaryReportLoadDataEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$CustomEnumerationSummaryReportLoadDataEventImplCopyWithImpl<$Res>
    extends _$CustomEnumerationSummaryReportEventCopyWithImpl<$Res,
        _$CustomEnumerationSummaryReportLoadDataEventImpl>
    implements
        _$$CustomEnumerationSummaryReportLoadDataEventImplCopyWith<$Res> {
  __$$CustomEnumerationSummaryReportLoadDataEventImplCopyWithImpl(
      _$CustomEnumerationSummaryReportLoadDataEventImpl _value,
      $Res Function(_$CustomEnumerationSummaryReportLoadDataEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$CustomEnumerationSummaryReportLoadDataEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomEnumerationSummaryReportLoadDataEventImpl
    implements CustomEnumerationSummaryReportLoadDataEvent {
  const _$CustomEnumerationSummaryReportLoadDataEventImpl(
      {required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'CustomEnumerationSummaryReportEvent.loadData(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomEnumerationSummaryReportLoadDataEventImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomEnumerationSummaryReportLoadDataEventImplCopyWith<
          _$CustomEnumerationSummaryReportLoadDataEventImpl>
      get copyWith =>
          __$$CustomEnumerationSummaryReportLoadDataEventImplCopyWithImpl<
                  _$CustomEnumerationSummaryReportLoadDataEventImpl>(
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
    required TResult Function(CustomEnumerationSummaryReportLoadDataEvent value)
        loadData,
    required TResult Function(CustomEnumerationSummaryReportLoadingEvent value)
        loading,
  }) {
    return loadData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomEnumerationSummaryReportLoadDataEvent value)?
        loadData,
    TResult? Function(CustomEnumerationSummaryReportLoadingEvent value)?
        loading,
  }) {
    return loadData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomEnumerationSummaryReportLoadDataEvent value)?
        loadData,
    TResult Function(CustomEnumerationSummaryReportLoadingEvent value)? loading,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData(this);
    }
    return orElse();
  }
}

abstract class CustomEnumerationSummaryReportLoadDataEvent
    implements CustomEnumerationSummaryReportEvent {
  const factory CustomEnumerationSummaryReportLoadDataEvent(
          {required final String userId}) =
      _$CustomEnumerationSummaryReportLoadDataEventImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$CustomEnumerationSummaryReportLoadDataEventImplCopyWith<
          _$CustomEnumerationSummaryReportLoadDataEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomEnumerationSummaryReportLoadingEventImplCopyWith<$Res> {
  factory _$$CustomEnumerationSummaryReportLoadingEventImplCopyWith(
          _$CustomEnumerationSummaryReportLoadingEventImpl value,
          $Res Function(_$CustomEnumerationSummaryReportLoadingEventImpl)
              then) =
      __$$CustomEnumerationSummaryReportLoadingEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CustomEnumerationSummaryReportLoadingEventImplCopyWithImpl<$Res>
    extends _$CustomEnumerationSummaryReportEventCopyWithImpl<$Res,
        _$CustomEnumerationSummaryReportLoadingEventImpl>
    implements _$$CustomEnumerationSummaryReportLoadingEventImplCopyWith<$Res> {
  __$$CustomEnumerationSummaryReportLoadingEventImplCopyWithImpl(
      _$CustomEnumerationSummaryReportLoadingEventImpl _value,
      $Res Function(_$CustomEnumerationSummaryReportLoadingEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CustomEnumerationSummaryReportLoadingEventImpl
    implements CustomEnumerationSummaryReportLoadingEvent {
  const _$CustomEnumerationSummaryReportLoadingEventImpl();

  @override
  String toString() {
    return 'CustomEnumerationSummaryReportEvent.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomEnumerationSummaryReportLoadingEventImpl);
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
    required TResult Function(CustomEnumerationSummaryReportLoadDataEvent value)
        loadData,
    required TResult Function(CustomEnumerationSummaryReportLoadingEvent value)
        loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomEnumerationSummaryReportLoadDataEvent value)?
        loadData,
    TResult? Function(CustomEnumerationSummaryReportLoadingEvent value)?
        loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomEnumerationSummaryReportLoadDataEvent value)?
        loadData,
    TResult Function(CustomEnumerationSummaryReportLoadingEvent value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CustomEnumerationSummaryReportLoadingEvent
    implements CustomEnumerationSummaryReportEvent {
  const factory CustomEnumerationSummaryReportLoadingEvent() =
      _$CustomEnumerationSummaryReportLoadingEventImpl;
}

/// @nodoc
mixin _$CustomEnumerationSummaryReportState {
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
    required TResult Function(CustomEnumerationSummaryReportLoadingState value)
        loading,
    required TResult Function(CustomEnumerationSummaryReportEmptyState value)
        empty,
    required TResult Function(
            CustomEnumerationSummaryReportSummaryDataState value)
        summaryData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomEnumerationSummaryReportLoadingState value)?
        loading,
    TResult? Function(CustomEnumerationSummaryReportEmptyState value)? empty,
    TResult? Function(CustomEnumerationSummaryReportSummaryDataState value)?
        summaryData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomEnumerationSummaryReportLoadingState value)? loading,
    TResult Function(CustomEnumerationSummaryReportEmptyState value)? empty,
    TResult Function(CustomEnumerationSummaryReportSummaryDataState value)?
        summaryData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomEnumerationSummaryReportStateCopyWith<$Res> {
  factory $CustomEnumerationSummaryReportStateCopyWith(
          CustomEnumerationSummaryReportState value,
          $Res Function(CustomEnumerationSummaryReportState) then) =
      _$CustomEnumerationSummaryReportStateCopyWithImpl<$Res,
          CustomEnumerationSummaryReportState>;
}

/// @nodoc
class _$CustomEnumerationSummaryReportStateCopyWithImpl<$Res,
        $Val extends CustomEnumerationSummaryReportState>
    implements $CustomEnumerationSummaryReportStateCopyWith<$Res> {
  _$CustomEnumerationSummaryReportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CustomEnumerationSummaryReportLoadingStateImplCopyWith<$Res> {
  factory _$$CustomEnumerationSummaryReportLoadingStateImplCopyWith(
          _$CustomEnumerationSummaryReportLoadingStateImpl value,
          $Res Function(_$CustomEnumerationSummaryReportLoadingStateImpl)
              then) =
      __$$CustomEnumerationSummaryReportLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CustomEnumerationSummaryReportLoadingStateImplCopyWithImpl<$Res>
    extends _$CustomEnumerationSummaryReportStateCopyWithImpl<$Res,
        _$CustomEnumerationSummaryReportLoadingStateImpl>
    implements _$$CustomEnumerationSummaryReportLoadingStateImplCopyWith<$Res> {
  __$$CustomEnumerationSummaryReportLoadingStateImplCopyWithImpl(
      _$CustomEnumerationSummaryReportLoadingStateImpl _value,
      $Res Function(_$CustomEnumerationSummaryReportLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CustomEnumerationSummaryReportLoadingStateImpl
    implements CustomEnumerationSummaryReportLoadingState {
  const _$CustomEnumerationSummaryReportLoadingStateImpl();

  @override
  String toString() {
    return 'CustomEnumerationSummaryReportState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomEnumerationSummaryReportLoadingStateImpl);
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
    required TResult Function(CustomEnumerationSummaryReportLoadingState value)
        loading,
    required TResult Function(CustomEnumerationSummaryReportEmptyState value)
        empty,
    required TResult Function(
            CustomEnumerationSummaryReportSummaryDataState value)
        summaryData,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomEnumerationSummaryReportLoadingState value)?
        loading,
    TResult? Function(CustomEnumerationSummaryReportEmptyState value)? empty,
    TResult? Function(CustomEnumerationSummaryReportSummaryDataState value)?
        summaryData,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomEnumerationSummaryReportLoadingState value)? loading,
    TResult Function(CustomEnumerationSummaryReportEmptyState value)? empty,
    TResult Function(CustomEnumerationSummaryReportSummaryDataState value)?
        summaryData,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CustomEnumerationSummaryReportLoadingState
    implements CustomEnumerationSummaryReportState {
  const factory CustomEnumerationSummaryReportLoadingState() =
      _$CustomEnumerationSummaryReportLoadingStateImpl;
}

/// @nodoc
abstract class _$$CustomEnumerationSummaryReportEmptyStateImplCopyWith<$Res> {
  factory _$$CustomEnumerationSummaryReportEmptyStateImplCopyWith(
          _$CustomEnumerationSummaryReportEmptyStateImpl value,
          $Res Function(_$CustomEnumerationSummaryReportEmptyStateImpl) then) =
      __$$CustomEnumerationSummaryReportEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CustomEnumerationSummaryReportEmptyStateImplCopyWithImpl<$Res>
    extends _$CustomEnumerationSummaryReportStateCopyWithImpl<$Res,
        _$CustomEnumerationSummaryReportEmptyStateImpl>
    implements _$$CustomEnumerationSummaryReportEmptyStateImplCopyWith<$Res> {
  __$$CustomEnumerationSummaryReportEmptyStateImplCopyWithImpl(
      _$CustomEnumerationSummaryReportEmptyStateImpl _value,
      $Res Function(_$CustomEnumerationSummaryReportEmptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CustomEnumerationSummaryReportEmptyStateImpl
    implements CustomEnumerationSummaryReportEmptyState {
  const _$CustomEnumerationSummaryReportEmptyStateImpl();

  @override
  String toString() {
    return 'CustomEnumerationSummaryReportState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomEnumerationSummaryReportEmptyStateImpl);
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
    required TResult Function(CustomEnumerationSummaryReportLoadingState value)
        loading,
    required TResult Function(CustomEnumerationSummaryReportEmptyState value)
        empty,
    required TResult Function(
            CustomEnumerationSummaryReportSummaryDataState value)
        summaryData,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomEnumerationSummaryReportLoadingState value)?
        loading,
    TResult? Function(CustomEnumerationSummaryReportEmptyState value)? empty,
    TResult? Function(CustomEnumerationSummaryReportSummaryDataState value)?
        summaryData,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomEnumerationSummaryReportLoadingState value)? loading,
    TResult Function(CustomEnumerationSummaryReportEmptyState value)? empty,
    TResult Function(CustomEnumerationSummaryReportSummaryDataState value)?
        summaryData,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class CustomEnumerationSummaryReportEmptyState
    implements CustomEnumerationSummaryReportState {
  const factory CustomEnumerationSummaryReportEmptyState() =
      _$CustomEnumerationSummaryReportEmptyStateImpl;
}

/// @nodoc
abstract class _$$CustomEnumerationSummaryReportSummaryDataStateImplCopyWith<
    $Res> {
  factory _$$CustomEnumerationSummaryReportSummaryDataStateImplCopyWith(
          _$CustomEnumerationSummaryReportSummaryDataStateImpl value,
          $Res Function(_$CustomEnumerationSummaryReportSummaryDataStateImpl)
              then) =
      __$$CustomEnumerationSummaryReportSummaryDataStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, Map<String, int>> summaryData});
}

/// @nodoc
class __$$CustomEnumerationSummaryReportSummaryDataStateImplCopyWithImpl<$Res>
    extends _$CustomEnumerationSummaryReportStateCopyWithImpl<$Res,
        _$CustomEnumerationSummaryReportSummaryDataStateImpl>
    implements
        _$$CustomEnumerationSummaryReportSummaryDataStateImplCopyWith<$Res> {
  __$$CustomEnumerationSummaryReportSummaryDataStateImplCopyWithImpl(
      _$CustomEnumerationSummaryReportSummaryDataStateImpl _value,
      $Res Function(_$CustomEnumerationSummaryReportSummaryDataStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summaryData = null,
  }) {
    return _then(_$CustomEnumerationSummaryReportSummaryDataStateImpl(
      summaryData: null == summaryData
          ? _value._summaryData
          : summaryData // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>,
    ));
  }
}

/// @nodoc

class _$CustomEnumerationSummaryReportSummaryDataStateImpl
    implements CustomEnumerationSummaryReportSummaryDataState {
  const _$CustomEnumerationSummaryReportSummaryDataStateImpl(
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
    return 'CustomEnumerationSummaryReportState.summaryData(summaryData: $summaryData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomEnumerationSummaryReportSummaryDataStateImpl &&
            const DeepCollectionEquality()
                .equals(other._summaryData, _summaryData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_summaryData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomEnumerationSummaryReportSummaryDataStateImplCopyWith<
          _$CustomEnumerationSummaryReportSummaryDataStateImpl>
      get copyWith =>
          __$$CustomEnumerationSummaryReportSummaryDataStateImplCopyWithImpl<
                  _$CustomEnumerationSummaryReportSummaryDataStateImpl>(
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
    required TResult Function(CustomEnumerationSummaryReportLoadingState value)
        loading,
    required TResult Function(CustomEnumerationSummaryReportEmptyState value)
        empty,
    required TResult Function(
            CustomEnumerationSummaryReportSummaryDataState value)
        summaryData,
  }) {
    return summaryData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomEnumerationSummaryReportLoadingState value)?
        loading,
    TResult? Function(CustomEnumerationSummaryReportEmptyState value)? empty,
    TResult? Function(CustomEnumerationSummaryReportSummaryDataState value)?
        summaryData,
  }) {
    return summaryData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomEnumerationSummaryReportLoadingState value)? loading,
    TResult Function(CustomEnumerationSummaryReportEmptyState value)? empty,
    TResult Function(CustomEnumerationSummaryReportSummaryDataState value)?
        summaryData,
    required TResult orElse(),
  }) {
    if (summaryData != null) {
      return summaryData(this);
    }
    return orElse();
  }
}

abstract class CustomEnumerationSummaryReportSummaryDataState
    implements CustomEnumerationSummaryReportState {
  const factory CustomEnumerationSummaryReportSummaryDataState(
          {final Map<String, Map<String, int>> summaryData}) =
      _$CustomEnumerationSummaryReportSummaryDataStateImpl;

  Map<String, Map<String, int>> get summaryData;
  @JsonKey(ignore: true)
  _$$CustomEnumerationSummaryReportSummaryDataStateImplCopyWith<
          _$CustomEnumerationSummaryReportSummaryDataStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

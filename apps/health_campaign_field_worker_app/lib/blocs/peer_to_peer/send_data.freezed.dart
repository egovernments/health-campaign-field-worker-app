// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeviceConnectionEvent {
  Map<String, dynamic> get entities => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> entities) sendEntities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> entities)? sendEntities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> entities)? sendEntities,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendEntitiesEvent value) sendEntities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendEntitiesEvent value)? sendEntities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendEntitiesEvent value)? sendEntities,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceConnectionEventCopyWith<DeviceConnectionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceConnectionEventCopyWith<$Res> {
  factory $DeviceConnectionEventCopyWith(DeviceConnectionEvent value,
          $Res Function(DeviceConnectionEvent) then) =
      _$DeviceConnectionEventCopyWithImpl<$Res, DeviceConnectionEvent>;
  @useResult
  $Res call({Map<String, dynamic> entities});
}

/// @nodoc
class _$DeviceConnectionEventCopyWithImpl<$Res,
        $Val extends DeviceConnectionEvent>
    implements $DeviceConnectionEventCopyWith<$Res> {
  _$DeviceConnectionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entities = null,
  }) {
    return _then(_value.copyWith(
      entities: null == entities
          ? _value.entities
          : entities // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendEntitiesEventImplCopyWith<$Res>
    implements $DeviceConnectionEventCopyWith<$Res> {
  factory _$$SendEntitiesEventImplCopyWith(_$SendEntitiesEventImpl value,
          $Res Function(_$SendEntitiesEventImpl) then) =
      __$$SendEntitiesEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> entities});
}

/// @nodoc
class __$$SendEntitiesEventImplCopyWithImpl<$Res>
    extends _$DeviceConnectionEventCopyWithImpl<$Res, _$SendEntitiesEventImpl>
    implements _$$SendEntitiesEventImplCopyWith<$Res> {
  __$$SendEntitiesEventImplCopyWithImpl(_$SendEntitiesEventImpl _value,
      $Res Function(_$SendEntitiesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entities = null,
  }) {
    return _then(_$SendEntitiesEventImpl(
      null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$SendEntitiesEventImpl implements SendEntitiesEvent {
  const _$SendEntitiesEventImpl(final Map<String, dynamic> entities)
      : _entities = entities;

  final Map<String, dynamic> _entities;
  @override
  Map<String, dynamic> get entities {
    if (_entities is EqualUnmodifiableMapView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_entities);
  }

  @override
  String toString() {
    return 'DeviceConnectionEvent.sendEntities(entities: $entities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendEntitiesEventImpl &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendEntitiesEventImplCopyWith<_$SendEntitiesEventImpl> get copyWith =>
      __$$SendEntitiesEventImplCopyWithImpl<_$SendEntitiesEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> entities) sendEntities,
  }) {
    return sendEntities(entities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> entities)? sendEntities,
  }) {
    return sendEntities?.call(entities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> entities)? sendEntities,
    required TResult orElse(),
  }) {
    if (sendEntities != null) {
      return sendEntities(entities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendEntitiesEvent value) sendEntities,
  }) {
    return sendEntities(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendEntitiesEvent value)? sendEntities,
  }) {
    return sendEntities?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendEntitiesEvent value)? sendEntities,
    required TResult orElse(),
  }) {
    if (sendEntities != null) {
      return sendEntities(this);
    }
    return orElse();
  }
}

abstract class SendEntitiesEvent implements DeviceConnectionEvent {
  const factory SendEntitiesEvent(final Map<String, dynamic> entities) =
      _$SendEntitiesEventImpl;

  @override
  Map<String, dynamic> get entities;
  @override
  @JsonKey(ignore: true)
  _$$SendEntitiesEventImplCopyWith<_$SendEntitiesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeviceConnectionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(double progress) sending,
    required TResult Function() completed,
    required TResult Function(String error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(double progress)? sending,
    TResult? Function()? completed,
    TResult? Function(String error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(double progress)? sending,
    TResult Function()? completed,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceConnectionInitial value) initial,
    required TResult Function(DeviceConnectionLoading value) loading,
    required TResult Function(DeviceConnectionSending value) sending,
    required TResult Function(DeviceConnectionCompleted value) completed,
    required TResult Function(DeviceConnectionFailed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceConnectionInitial value)? initial,
    TResult? Function(DeviceConnectionLoading value)? loading,
    TResult? Function(DeviceConnectionSending value)? sending,
    TResult? Function(DeviceConnectionCompleted value)? completed,
    TResult? Function(DeviceConnectionFailed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceConnectionInitial value)? initial,
    TResult Function(DeviceConnectionLoading value)? loading,
    TResult Function(DeviceConnectionSending value)? sending,
    TResult Function(DeviceConnectionCompleted value)? completed,
    TResult Function(DeviceConnectionFailed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceConnectionStateCopyWith<$Res> {
  factory $DeviceConnectionStateCopyWith(DeviceConnectionState value,
          $Res Function(DeviceConnectionState) then) =
      _$DeviceConnectionStateCopyWithImpl<$Res, DeviceConnectionState>;
}

/// @nodoc
class _$DeviceConnectionStateCopyWithImpl<$Res,
        $Val extends DeviceConnectionState>
    implements $DeviceConnectionStateCopyWith<$Res> {
  _$DeviceConnectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DeviceConnectionInitialImplCopyWith<$Res> {
  factory _$$DeviceConnectionInitialImplCopyWith(
          _$DeviceConnectionInitialImpl value,
          $Res Function(_$DeviceConnectionInitialImpl) then) =
      __$$DeviceConnectionInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeviceConnectionInitialImplCopyWithImpl<$Res>
    extends _$DeviceConnectionStateCopyWithImpl<$Res,
        _$DeviceConnectionInitialImpl>
    implements _$$DeviceConnectionInitialImplCopyWith<$Res> {
  __$$DeviceConnectionInitialImplCopyWithImpl(
      _$DeviceConnectionInitialImpl _value,
      $Res Function(_$DeviceConnectionInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeviceConnectionInitialImpl implements DeviceConnectionInitial {
  const _$DeviceConnectionInitialImpl();

  @override
  String toString() {
    return 'DeviceConnectionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceConnectionInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(double progress) sending,
    required TResult Function() completed,
    required TResult Function(String error) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(double progress)? sending,
    TResult? Function()? completed,
    TResult? Function(String error)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(double progress)? sending,
    TResult Function()? completed,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceConnectionInitial value) initial,
    required TResult Function(DeviceConnectionLoading value) loading,
    required TResult Function(DeviceConnectionSending value) sending,
    required TResult Function(DeviceConnectionCompleted value) completed,
    required TResult Function(DeviceConnectionFailed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceConnectionInitial value)? initial,
    TResult? Function(DeviceConnectionLoading value)? loading,
    TResult? Function(DeviceConnectionSending value)? sending,
    TResult? Function(DeviceConnectionCompleted value)? completed,
    TResult? Function(DeviceConnectionFailed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceConnectionInitial value)? initial,
    TResult Function(DeviceConnectionLoading value)? loading,
    TResult Function(DeviceConnectionSending value)? sending,
    TResult Function(DeviceConnectionCompleted value)? completed,
    TResult Function(DeviceConnectionFailed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DeviceConnectionInitial implements DeviceConnectionState {
  const factory DeviceConnectionInitial() = _$DeviceConnectionInitialImpl;
}

/// @nodoc
abstract class _$$DeviceConnectionLoadingImplCopyWith<$Res> {
  factory _$$DeviceConnectionLoadingImplCopyWith(
          _$DeviceConnectionLoadingImpl value,
          $Res Function(_$DeviceConnectionLoadingImpl) then) =
      __$$DeviceConnectionLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeviceConnectionLoadingImplCopyWithImpl<$Res>
    extends _$DeviceConnectionStateCopyWithImpl<$Res,
        _$DeviceConnectionLoadingImpl>
    implements _$$DeviceConnectionLoadingImplCopyWith<$Res> {
  __$$DeviceConnectionLoadingImplCopyWithImpl(
      _$DeviceConnectionLoadingImpl _value,
      $Res Function(_$DeviceConnectionLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeviceConnectionLoadingImpl implements DeviceConnectionLoading {
  const _$DeviceConnectionLoadingImpl();

  @override
  String toString() {
    return 'DeviceConnectionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceConnectionLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(double progress) sending,
    required TResult Function() completed,
    required TResult Function(String error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(double progress)? sending,
    TResult? Function()? completed,
    TResult? Function(String error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(double progress)? sending,
    TResult Function()? completed,
    TResult Function(String error)? failed,
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
    required TResult Function(DeviceConnectionInitial value) initial,
    required TResult Function(DeviceConnectionLoading value) loading,
    required TResult Function(DeviceConnectionSending value) sending,
    required TResult Function(DeviceConnectionCompleted value) completed,
    required TResult Function(DeviceConnectionFailed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceConnectionInitial value)? initial,
    TResult? Function(DeviceConnectionLoading value)? loading,
    TResult? Function(DeviceConnectionSending value)? sending,
    TResult? Function(DeviceConnectionCompleted value)? completed,
    TResult? Function(DeviceConnectionFailed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceConnectionInitial value)? initial,
    TResult Function(DeviceConnectionLoading value)? loading,
    TResult Function(DeviceConnectionSending value)? sending,
    TResult Function(DeviceConnectionCompleted value)? completed,
    TResult Function(DeviceConnectionFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DeviceConnectionLoading implements DeviceConnectionState {
  const factory DeviceConnectionLoading() = _$DeviceConnectionLoadingImpl;
}

/// @nodoc
abstract class _$$DeviceConnectionSendingImplCopyWith<$Res> {
  factory _$$DeviceConnectionSendingImplCopyWith(
          _$DeviceConnectionSendingImpl value,
          $Res Function(_$DeviceConnectionSendingImpl) then) =
      __$$DeviceConnectionSendingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double progress});
}

/// @nodoc
class __$$DeviceConnectionSendingImplCopyWithImpl<$Res>
    extends _$DeviceConnectionStateCopyWithImpl<$Res,
        _$DeviceConnectionSendingImpl>
    implements _$$DeviceConnectionSendingImplCopyWith<$Res> {
  __$$DeviceConnectionSendingImplCopyWithImpl(
      _$DeviceConnectionSendingImpl _value,
      $Res Function(_$DeviceConnectionSendingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
  }) {
    return _then(_$DeviceConnectionSendingImpl(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$DeviceConnectionSendingImpl implements DeviceConnectionSending {
  const _$DeviceConnectionSendingImpl({required this.progress});

  @override
  final double progress;

  @override
  String toString() {
    return 'DeviceConnectionState.sending(progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceConnectionSendingImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceConnectionSendingImplCopyWith<_$DeviceConnectionSendingImpl>
      get copyWith => __$$DeviceConnectionSendingImplCopyWithImpl<
          _$DeviceConnectionSendingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(double progress) sending,
    required TResult Function() completed,
    required TResult Function(String error) failed,
  }) {
    return sending(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(double progress)? sending,
    TResult? Function()? completed,
    TResult? Function(String error)? failed,
  }) {
    return sending?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(double progress)? sending,
    TResult Function()? completed,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceConnectionInitial value) initial,
    required TResult Function(DeviceConnectionLoading value) loading,
    required TResult Function(DeviceConnectionSending value) sending,
    required TResult Function(DeviceConnectionCompleted value) completed,
    required TResult Function(DeviceConnectionFailed value) failed,
  }) {
    return sending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceConnectionInitial value)? initial,
    TResult? Function(DeviceConnectionLoading value)? loading,
    TResult? Function(DeviceConnectionSending value)? sending,
    TResult? Function(DeviceConnectionCompleted value)? completed,
    TResult? Function(DeviceConnectionFailed value)? failed,
  }) {
    return sending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceConnectionInitial value)? initial,
    TResult Function(DeviceConnectionLoading value)? loading,
    TResult Function(DeviceConnectionSending value)? sending,
    TResult Function(DeviceConnectionCompleted value)? completed,
    TResult Function(DeviceConnectionFailed value)? failed,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending(this);
    }
    return orElse();
  }
}

abstract class DeviceConnectionSending implements DeviceConnectionState {
  const factory DeviceConnectionSending({required final double progress}) =
      _$DeviceConnectionSendingImpl;

  double get progress;
  @JsonKey(ignore: true)
  _$$DeviceConnectionSendingImplCopyWith<_$DeviceConnectionSendingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceConnectionCompletedImplCopyWith<$Res> {
  factory _$$DeviceConnectionCompletedImplCopyWith(
          _$DeviceConnectionCompletedImpl value,
          $Res Function(_$DeviceConnectionCompletedImpl) then) =
      __$$DeviceConnectionCompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeviceConnectionCompletedImplCopyWithImpl<$Res>
    extends _$DeviceConnectionStateCopyWithImpl<$Res,
        _$DeviceConnectionCompletedImpl>
    implements _$$DeviceConnectionCompletedImplCopyWith<$Res> {
  __$$DeviceConnectionCompletedImplCopyWithImpl(
      _$DeviceConnectionCompletedImpl _value,
      $Res Function(_$DeviceConnectionCompletedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeviceConnectionCompletedImpl implements DeviceConnectionCompleted {
  const _$DeviceConnectionCompletedImpl();

  @override
  String toString() {
    return 'DeviceConnectionState.completed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceConnectionCompletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(double progress) sending,
    required TResult Function() completed,
    required TResult Function(String error) failed,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(double progress)? sending,
    TResult? Function()? completed,
    TResult? Function(String error)? failed,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(double progress)? sending,
    TResult Function()? completed,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceConnectionInitial value) initial,
    required TResult Function(DeviceConnectionLoading value) loading,
    required TResult Function(DeviceConnectionSending value) sending,
    required TResult Function(DeviceConnectionCompleted value) completed,
    required TResult Function(DeviceConnectionFailed value) failed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceConnectionInitial value)? initial,
    TResult? Function(DeviceConnectionLoading value)? loading,
    TResult? Function(DeviceConnectionSending value)? sending,
    TResult? Function(DeviceConnectionCompleted value)? completed,
    TResult? Function(DeviceConnectionFailed value)? failed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceConnectionInitial value)? initial,
    TResult Function(DeviceConnectionLoading value)? loading,
    TResult Function(DeviceConnectionSending value)? sending,
    TResult Function(DeviceConnectionCompleted value)? completed,
    TResult Function(DeviceConnectionFailed value)? failed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class DeviceConnectionCompleted implements DeviceConnectionState {
  const factory DeviceConnectionCompleted() = _$DeviceConnectionCompletedImpl;
}

/// @nodoc
abstract class _$$DeviceConnectionFailedImplCopyWith<$Res> {
  factory _$$DeviceConnectionFailedImplCopyWith(
          _$DeviceConnectionFailedImpl value,
          $Res Function(_$DeviceConnectionFailedImpl) then) =
      __$$DeviceConnectionFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$DeviceConnectionFailedImplCopyWithImpl<$Res>
    extends _$DeviceConnectionStateCopyWithImpl<$Res,
        _$DeviceConnectionFailedImpl>
    implements _$$DeviceConnectionFailedImplCopyWith<$Res> {
  __$$DeviceConnectionFailedImplCopyWithImpl(
      _$DeviceConnectionFailedImpl _value,
      $Res Function(_$DeviceConnectionFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$DeviceConnectionFailedImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeviceConnectionFailedImpl implements DeviceConnectionFailed {
  const _$DeviceConnectionFailedImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'DeviceConnectionState.failed(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceConnectionFailedImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceConnectionFailedImplCopyWith<_$DeviceConnectionFailedImpl>
      get copyWith => __$$DeviceConnectionFailedImplCopyWithImpl<
          _$DeviceConnectionFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(double progress) sending,
    required TResult Function() completed,
    required TResult Function(String error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(double progress)? sending,
    TResult? Function()? completed,
    TResult? Function(String error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(double progress)? sending,
    TResult Function()? completed,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceConnectionInitial value) initial,
    required TResult Function(DeviceConnectionLoading value) loading,
    required TResult Function(DeviceConnectionSending value) sending,
    required TResult Function(DeviceConnectionCompleted value) completed,
    required TResult Function(DeviceConnectionFailed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceConnectionInitial value)? initial,
    TResult? Function(DeviceConnectionLoading value)? loading,
    TResult? Function(DeviceConnectionSending value)? sending,
    TResult? Function(DeviceConnectionCompleted value)? completed,
    TResult? Function(DeviceConnectionFailed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceConnectionInitial value)? initial,
    TResult Function(DeviceConnectionLoading value)? loading,
    TResult Function(DeviceConnectionSending value)? sending,
    TResult Function(DeviceConnectionCompleted value)? completed,
    TResult Function(DeviceConnectionFailed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class DeviceConnectionFailed implements DeviceConnectionState {
  const factory DeviceConnectionFailed({required final String error}) =
      _$DeviceConnectionFailedImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$DeviceConnectionFailedImplCopyWith<_$DeviceConnectionFailedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

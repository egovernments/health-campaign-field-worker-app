// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EntityCreateEvent {
  List<Object> get entities => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Object> entities) create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Object> entities)? create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Object> entities)? create,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EntityCreateCreateEvent value) create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EntityCreateCreateEvent value)? create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EntityCreateCreateEvent value)? create,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EntityCreateEventCopyWith<EntityCreateEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityCreateEventCopyWith<$Res> {
  factory $EntityCreateEventCopyWith(
          EntityCreateEvent value, $Res Function(EntityCreateEvent) then) =
      _$EntityCreateEventCopyWithImpl<$Res, EntityCreateEvent>;
  @useResult
  $Res call({List<Object> entities});
}

/// @nodoc
class _$EntityCreateEventCopyWithImpl<$Res, $Val extends EntityCreateEvent>
    implements $EntityCreateEventCopyWith<$Res> {
  _$EntityCreateEventCopyWithImpl(this._value, this._then);

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
              as List<Object>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntityCreateCreateEventImplCopyWith<$Res>
    implements $EntityCreateEventCopyWith<$Res> {
  factory _$$EntityCreateCreateEventImplCopyWith(
          _$EntityCreateCreateEventImpl value,
          $Res Function(_$EntityCreateCreateEventImpl) then) =
      __$$EntityCreateCreateEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Object> entities});
}

/// @nodoc
class __$$EntityCreateCreateEventImplCopyWithImpl<$Res>
    extends _$EntityCreateEventCopyWithImpl<$Res, _$EntityCreateCreateEventImpl>
    implements _$$EntityCreateCreateEventImplCopyWith<$Res> {
  __$$EntityCreateCreateEventImplCopyWithImpl(
      _$EntityCreateCreateEventImpl _value,
      $Res Function(_$EntityCreateCreateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entities = null,
  }) {
    return _then(_$EntityCreateCreateEventImpl(
      entities: null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<Object>,
    ));
  }
}

/// @nodoc

class _$EntityCreateCreateEventImpl implements EntityCreateCreateEvent {
  const _$EntityCreateCreateEventImpl({required final List<Object> entities})
      : _entities = entities;

  final List<Object> _entities;
  @override
  List<Object> get entities {
    if (_entities is EqualUnmodifiableListView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entities);
  }

  @override
  String toString() {
    return 'EntityCreateEvent.create(entities: $entities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntityCreateCreateEventImpl &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntityCreateCreateEventImplCopyWith<_$EntityCreateCreateEventImpl>
      get copyWith => __$$EntityCreateCreateEventImplCopyWithImpl<
          _$EntityCreateCreateEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Object> entities) create,
  }) {
    return create(entities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Object> entities)? create,
  }) {
    return create?.call(entities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Object> entities)? create,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(entities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EntityCreateCreateEvent value) create,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EntityCreateCreateEvent value)? create,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EntityCreateCreateEvent value)? create,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class EntityCreateCreateEvent implements EntityCreateEvent {
  const factory EntityCreateCreateEvent(
      {required final List<Object> entities}) = _$EntityCreateCreateEventImpl;

  @override
  List<Object> get entities;
  @override
  @JsonKey(ignore: true)
  _$$EntityCreateCreateEventImplCopyWith<_$EntityCreateCreateEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EntityCreateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function() loading,
    required TResult Function() persisted,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function()? loading,
    TResult? Function()? persisted,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function()? loading,
    TResult Function()? persisted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EntityCreateInitialState value) create,
    required TResult Function(EntityCreateLoadingState value) loading,
    required TResult Function(EntityCreatePersistedState value) persisted,
    required TResult Function(EntityCreateErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EntityCreateInitialState value)? create,
    TResult? Function(EntityCreateLoadingState value)? loading,
    TResult? Function(EntityCreatePersistedState value)? persisted,
    TResult? Function(EntityCreateErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EntityCreateInitialState value)? create,
    TResult Function(EntityCreateLoadingState value)? loading,
    TResult Function(EntityCreatePersistedState value)? persisted,
    TResult Function(EntityCreateErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityCreateStateCopyWith<$Res> {
  factory $EntityCreateStateCopyWith(
          EntityCreateState value, $Res Function(EntityCreateState) then) =
      _$EntityCreateStateCopyWithImpl<$Res, EntityCreateState>;
}

/// @nodoc
class _$EntityCreateStateCopyWithImpl<$Res, $Val extends EntityCreateState>
    implements $EntityCreateStateCopyWith<$Res> {
  _$EntityCreateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EntityCreateInitialStateImplCopyWith<$Res> {
  factory _$$EntityCreateInitialStateImplCopyWith(
          _$EntityCreateInitialStateImpl value,
          $Res Function(_$EntityCreateInitialStateImpl) then) =
      __$$EntityCreateInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EntityCreateInitialStateImplCopyWithImpl<$Res>
    extends _$EntityCreateStateCopyWithImpl<$Res,
        _$EntityCreateInitialStateImpl>
    implements _$$EntityCreateInitialStateImplCopyWith<$Res> {
  __$$EntityCreateInitialStateImplCopyWithImpl(
      _$EntityCreateInitialStateImpl _value,
      $Res Function(_$EntityCreateInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EntityCreateInitialStateImpl implements EntityCreateInitialState {
  const _$EntityCreateInitialStateImpl();

  @override
  String toString() {
    return 'EntityCreateState.create()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntityCreateInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function() loading,
    required TResult Function() persisted,
    required TResult Function(String message) error,
  }) {
    return create();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function()? loading,
    TResult? Function()? persisted,
    TResult? Function(String message)? error,
  }) {
    return create?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function()? loading,
    TResult Function()? persisted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EntityCreateInitialState value) create,
    required TResult Function(EntityCreateLoadingState value) loading,
    required TResult Function(EntityCreatePersistedState value) persisted,
    required TResult Function(EntityCreateErrorState value) error,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EntityCreateInitialState value)? create,
    TResult? Function(EntityCreateLoadingState value)? loading,
    TResult? Function(EntityCreatePersistedState value)? persisted,
    TResult? Function(EntityCreateErrorState value)? error,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EntityCreateInitialState value)? create,
    TResult Function(EntityCreateLoadingState value)? loading,
    TResult Function(EntityCreatePersistedState value)? persisted,
    TResult Function(EntityCreateErrorState value)? error,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class EntityCreateInitialState implements EntityCreateState {
  const factory EntityCreateInitialState() = _$EntityCreateInitialStateImpl;
}

/// @nodoc
abstract class _$$EntityCreateLoadingStateImplCopyWith<$Res> {
  factory _$$EntityCreateLoadingStateImplCopyWith(
          _$EntityCreateLoadingStateImpl value,
          $Res Function(_$EntityCreateLoadingStateImpl) then) =
      __$$EntityCreateLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EntityCreateLoadingStateImplCopyWithImpl<$Res>
    extends _$EntityCreateStateCopyWithImpl<$Res,
        _$EntityCreateLoadingStateImpl>
    implements _$$EntityCreateLoadingStateImplCopyWith<$Res> {
  __$$EntityCreateLoadingStateImplCopyWithImpl(
      _$EntityCreateLoadingStateImpl _value,
      $Res Function(_$EntityCreateLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EntityCreateLoadingStateImpl implements EntityCreateLoadingState {
  const _$EntityCreateLoadingStateImpl();

  @override
  String toString() {
    return 'EntityCreateState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntityCreateLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function() loading,
    required TResult Function() persisted,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function()? loading,
    TResult? Function()? persisted,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function()? loading,
    TResult Function()? persisted,
    TResult Function(String message)? error,
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
    required TResult Function(EntityCreateInitialState value) create,
    required TResult Function(EntityCreateLoadingState value) loading,
    required TResult Function(EntityCreatePersistedState value) persisted,
    required TResult Function(EntityCreateErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EntityCreateInitialState value)? create,
    TResult? Function(EntityCreateLoadingState value)? loading,
    TResult? Function(EntityCreatePersistedState value)? persisted,
    TResult? Function(EntityCreateErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EntityCreateInitialState value)? create,
    TResult Function(EntityCreateLoadingState value)? loading,
    TResult Function(EntityCreatePersistedState value)? persisted,
    TResult Function(EntityCreateErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EntityCreateLoadingState implements EntityCreateState {
  const factory EntityCreateLoadingState() = _$EntityCreateLoadingStateImpl;
}

/// @nodoc
abstract class _$$EntityCreatePersistedStateImplCopyWith<$Res> {
  factory _$$EntityCreatePersistedStateImplCopyWith(
          _$EntityCreatePersistedStateImpl value,
          $Res Function(_$EntityCreatePersistedStateImpl) then) =
      __$$EntityCreatePersistedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EntityCreatePersistedStateImplCopyWithImpl<$Res>
    extends _$EntityCreateStateCopyWithImpl<$Res,
        _$EntityCreatePersistedStateImpl>
    implements _$$EntityCreatePersistedStateImplCopyWith<$Res> {
  __$$EntityCreatePersistedStateImplCopyWithImpl(
      _$EntityCreatePersistedStateImpl _value,
      $Res Function(_$EntityCreatePersistedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EntityCreatePersistedStateImpl implements EntityCreatePersistedState {
  const _$EntityCreatePersistedStateImpl();

  @override
  String toString() {
    return 'EntityCreateState.persisted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntityCreatePersistedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function() loading,
    required TResult Function() persisted,
    required TResult Function(String message) error,
  }) {
    return persisted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function()? loading,
    TResult? Function()? persisted,
    TResult? Function(String message)? error,
  }) {
    return persisted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function()? loading,
    TResult Function()? persisted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (persisted != null) {
      return persisted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EntityCreateInitialState value) create,
    required TResult Function(EntityCreateLoadingState value) loading,
    required TResult Function(EntityCreatePersistedState value) persisted,
    required TResult Function(EntityCreateErrorState value) error,
  }) {
    return persisted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EntityCreateInitialState value)? create,
    TResult? Function(EntityCreateLoadingState value)? loading,
    TResult? Function(EntityCreatePersistedState value)? persisted,
    TResult? Function(EntityCreateErrorState value)? error,
  }) {
    return persisted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EntityCreateInitialState value)? create,
    TResult Function(EntityCreateLoadingState value)? loading,
    TResult Function(EntityCreatePersistedState value)? persisted,
    TResult Function(EntityCreateErrorState value)? error,
    required TResult orElse(),
  }) {
    if (persisted != null) {
      return persisted(this);
    }
    return orElse();
  }
}

abstract class EntityCreatePersistedState implements EntityCreateState {
  const factory EntityCreatePersistedState() = _$EntityCreatePersistedStateImpl;
}

/// @nodoc
abstract class _$$EntityCreateErrorStateImplCopyWith<$Res> {
  factory _$$EntityCreateErrorStateImplCopyWith(
          _$EntityCreateErrorStateImpl value,
          $Res Function(_$EntityCreateErrorStateImpl) then) =
      __$$EntityCreateErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$EntityCreateErrorStateImplCopyWithImpl<$Res>
    extends _$EntityCreateStateCopyWithImpl<$Res, _$EntityCreateErrorStateImpl>
    implements _$$EntityCreateErrorStateImplCopyWith<$Res> {
  __$$EntityCreateErrorStateImplCopyWithImpl(
      _$EntityCreateErrorStateImpl _value,
      $Res Function(_$EntityCreateErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$EntityCreateErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EntityCreateErrorStateImpl implements EntityCreateErrorState {
  const _$EntityCreateErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'EntityCreateState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntityCreateErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntityCreateErrorStateImplCopyWith<_$EntityCreateErrorStateImpl>
      get copyWith => __$$EntityCreateErrorStateImplCopyWithImpl<
          _$EntityCreateErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function() loading,
    required TResult Function() persisted,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function()? loading,
    TResult? Function()? persisted,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function()? loading,
    TResult Function()? persisted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EntityCreateInitialState value) create,
    required TResult Function(EntityCreateLoadingState value) loading,
    required TResult Function(EntityCreatePersistedState value) persisted,
    required TResult Function(EntityCreateErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EntityCreateInitialState value)? create,
    TResult? Function(EntityCreateLoadingState value)? loading,
    TResult? Function(EntityCreatePersistedState value)? persisted,
    TResult? Function(EntityCreateErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EntityCreateInitialState value)? create,
    TResult Function(EntityCreateLoadingState value)? loading,
    TResult Function(EntityCreatePersistedState value)? persisted,
    TResult Function(EntityCreateErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class EntityCreateErrorState implements EntityCreateState {
  const factory EntityCreateErrorState(final String message) =
      _$EntityCreateErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$EntityCreateErrorStateImplCopyWith<_$EntityCreateErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

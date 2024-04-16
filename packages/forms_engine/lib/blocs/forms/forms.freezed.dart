// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forms.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FormsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() createMapping,
    required TResult Function(SchemaObject object) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? createMapping,
    TResult? Function(SchemaObject object)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? createMapping,
    TResult Function(SchemaObject object)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsCreateMappingEvent value) createMapping,
    required TResult Function(FormsUpdateEvent value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormsLoadEvent value)? load,
    TResult? Function(FormsCreateMappingEvent value)? createMapping,
    TResult? Function(FormsUpdateEvent value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormsLoadEvent value)? load,
    TResult Function(FormsCreateMappingEvent value)? createMapping,
    TResult Function(FormsUpdateEvent value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormsEventCopyWith<$Res> {
  factory $FormsEventCopyWith(
          FormsEvent value, $Res Function(FormsEvent) then) =
      _$FormsEventCopyWithImpl<$Res, FormsEvent>;
}

/// @nodoc
class _$FormsEventCopyWithImpl<$Res, $Val extends FormsEvent>
    implements $FormsEventCopyWith<$Res> {
  _$FormsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FormsLoadEventImplCopyWith<$Res> {
  factory _$$FormsLoadEventImplCopyWith(_$FormsLoadEventImpl value,
          $Res Function(_$FormsLoadEventImpl) then) =
      __$$FormsLoadEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FormsLoadEventImplCopyWithImpl<$Res>
    extends _$FormsEventCopyWithImpl<$Res, _$FormsLoadEventImpl>
    implements _$$FormsLoadEventImplCopyWith<$Res> {
  __$$FormsLoadEventImplCopyWithImpl(
      _$FormsLoadEventImpl _value, $Res Function(_$FormsLoadEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FormsLoadEventImpl implements FormsLoadEvent {
  const _$FormsLoadEventImpl();

  @override
  String toString() {
    return 'FormsEvent.load()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FormsLoadEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() createMapping,
    required TResult Function(SchemaObject object) update,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? createMapping,
    TResult? Function(SchemaObject object)? update,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? createMapping,
    TResult Function(SchemaObject object)? update,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsCreateMappingEvent value) createMapping,
    required TResult Function(FormsUpdateEvent value) update,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormsLoadEvent value)? load,
    TResult? Function(FormsCreateMappingEvent value)? createMapping,
    TResult? Function(FormsUpdateEvent value)? update,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormsLoadEvent value)? load,
    TResult Function(FormsCreateMappingEvent value)? createMapping,
    TResult Function(FormsUpdateEvent value)? update,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class FormsLoadEvent implements FormsEvent {
  const factory FormsLoadEvent() = _$FormsLoadEventImpl;
}

/// @nodoc
abstract class _$$FormsCreateMappingEventImplCopyWith<$Res> {
  factory _$$FormsCreateMappingEventImplCopyWith(
          _$FormsCreateMappingEventImpl value,
          $Res Function(_$FormsCreateMappingEventImpl) then) =
      __$$FormsCreateMappingEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FormsCreateMappingEventImplCopyWithImpl<$Res>
    extends _$FormsEventCopyWithImpl<$Res, _$FormsCreateMappingEventImpl>
    implements _$$FormsCreateMappingEventImplCopyWith<$Res> {
  __$$FormsCreateMappingEventImplCopyWithImpl(
      _$FormsCreateMappingEventImpl _value,
      $Res Function(_$FormsCreateMappingEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FormsCreateMappingEventImpl implements FormsCreateMappingEvent {
  const _$FormsCreateMappingEventImpl();

  @override
  String toString() {
    return 'FormsEvent.createMapping()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsCreateMappingEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() createMapping,
    required TResult Function(SchemaObject object) update,
  }) {
    return createMapping();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? createMapping,
    TResult? Function(SchemaObject object)? update,
  }) {
    return createMapping?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? createMapping,
    TResult Function(SchemaObject object)? update,
    required TResult orElse(),
  }) {
    if (createMapping != null) {
      return createMapping();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsCreateMappingEvent value) createMapping,
    required TResult Function(FormsUpdateEvent value) update,
  }) {
    return createMapping(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormsLoadEvent value)? load,
    TResult? Function(FormsCreateMappingEvent value)? createMapping,
    TResult? Function(FormsUpdateEvent value)? update,
  }) {
    return createMapping?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormsLoadEvent value)? load,
    TResult Function(FormsCreateMappingEvent value)? createMapping,
    TResult Function(FormsUpdateEvent value)? update,
    required TResult orElse(),
  }) {
    if (createMapping != null) {
      return createMapping(this);
    }
    return orElse();
  }
}

abstract class FormsCreateMappingEvent implements FormsEvent {
  const factory FormsCreateMappingEvent() = _$FormsCreateMappingEventImpl;
}

/// @nodoc
abstract class _$$FormsUpdateEventImplCopyWith<$Res> {
  factory _$$FormsUpdateEventImplCopyWith(_$FormsUpdateEventImpl value,
          $Res Function(_$FormsUpdateEventImpl) then) =
      __$$FormsUpdateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SchemaObject object});

  $SchemaObjectCopyWith<$Res> get object;
}

/// @nodoc
class __$$FormsUpdateEventImplCopyWithImpl<$Res>
    extends _$FormsEventCopyWithImpl<$Res, _$FormsUpdateEventImpl>
    implements _$$FormsUpdateEventImplCopyWith<$Res> {
  __$$FormsUpdateEventImplCopyWithImpl(_$FormsUpdateEventImpl _value,
      $Res Function(_$FormsUpdateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
  }) {
    return _then(_$FormsUpdateEventImpl(
      null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as SchemaObject,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SchemaObjectCopyWith<$Res> get object {
    return $SchemaObjectCopyWith<$Res>(_value.object, (value) {
      return _then(_value.copyWith(object: value));
    });
  }
}

/// @nodoc

class _$FormsUpdateEventImpl implements FormsUpdateEvent {
  const _$FormsUpdateEventImpl(this.object);

  @override
  final SchemaObject object;

  @override
  String toString() {
    return 'FormsEvent.update(object: $object)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsUpdateEventImpl &&
            (identical(other.object, object) || other.object == object));
  }

  @override
  int get hashCode => Object.hash(runtimeType, object);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsUpdateEventImplCopyWith<_$FormsUpdateEventImpl> get copyWith =>
      __$$FormsUpdateEventImplCopyWithImpl<_$FormsUpdateEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() createMapping,
    required TResult Function(SchemaObject object) update,
  }) {
    return update(object);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? createMapping,
    TResult? Function(SchemaObject object)? update,
  }) {
    return update?.call(object);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? createMapping,
    TResult Function(SchemaObject object)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(object);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsCreateMappingEvent value) createMapping,
    required TResult Function(FormsUpdateEvent value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormsLoadEvent value)? load,
    TResult? Function(FormsCreateMappingEvent value)? createMapping,
    TResult? Function(FormsUpdateEvent value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormsLoadEvent value)? load,
    TResult Function(FormsCreateMappingEvent value)? createMapping,
    TResult Function(FormsUpdateEvent value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class FormsUpdateEvent implements FormsEvent {
  const factory FormsUpdateEvent(final SchemaObject object) =
      _$FormsUpdateEventImpl;

  SchemaObject get object;
  @JsonKey(ignore: true)
  _$$FormsUpdateEventImplCopyWith<_$FormsUpdateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FormsState {
  SchemaObject? get schema => throw _privateConstructorUsedError;
  Map<String, dynamic>? get savedProperties =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormsStateCopyWith<FormsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormsStateCopyWith<$Res> {
  factory $FormsStateCopyWith(
          FormsState value, $Res Function(FormsState) then) =
      _$FormsStateCopyWithImpl<$Res, FormsState>;
  @useResult
  $Res call({SchemaObject? schema, Map<String, dynamic>? savedProperties});

  $SchemaObjectCopyWith<$Res>? get schema;
}

/// @nodoc
class _$FormsStateCopyWithImpl<$Res, $Val extends FormsState>
    implements $FormsStateCopyWith<$Res> {
  _$FormsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schema = freezed,
    Object? savedProperties = freezed,
  }) {
    return _then(_value.copyWith(
      schema: freezed == schema
          ? _value.schema
          : schema // ignore: cast_nullable_to_non_nullable
              as SchemaObject?,
      savedProperties: freezed == savedProperties
          ? _value.savedProperties
          : savedProperties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SchemaObjectCopyWith<$Res>? get schema {
    if (_value.schema == null) {
      return null;
    }

    return $SchemaObjectCopyWith<$Res>(_value.schema!, (value) {
      return _then(_value.copyWith(schema: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FormsStateImplCopyWith<$Res>
    implements $FormsStateCopyWith<$Res> {
  factory _$$FormsStateImplCopyWith(
          _$FormsStateImpl value, $Res Function(_$FormsStateImpl) then) =
      __$$FormsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SchemaObject? schema, Map<String, dynamic>? savedProperties});

  @override
  $SchemaObjectCopyWith<$Res>? get schema;
}

/// @nodoc
class __$$FormsStateImplCopyWithImpl<$Res>
    extends _$FormsStateCopyWithImpl<$Res, _$FormsStateImpl>
    implements _$$FormsStateImplCopyWith<$Res> {
  __$$FormsStateImplCopyWithImpl(
      _$FormsStateImpl _value, $Res Function(_$FormsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schema = freezed,
    Object? savedProperties = freezed,
  }) {
    return _then(_$FormsStateImpl(
      schema: freezed == schema
          ? _value.schema
          : schema // ignore: cast_nullable_to_non_nullable
              as SchemaObject?,
      savedProperties: freezed == savedProperties
          ? _value._savedProperties
          : savedProperties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$FormsStateImpl implements _FormsState {
  const _$FormsStateImpl(
      {this.schema, final Map<String, dynamic>? savedProperties})
      : _savedProperties = savedProperties;

  @override
  final SchemaObject? schema;
  final Map<String, dynamic>? _savedProperties;
  @override
  Map<String, dynamic>? get savedProperties {
    final value = _savedProperties;
    if (value == null) return null;
    if (_savedProperties is EqualUnmodifiableMapView) return _savedProperties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'FormsState(schema: $schema, savedProperties: $savedProperties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsStateImpl &&
            (identical(other.schema, schema) || other.schema == schema) &&
            const DeepCollectionEquality()
                .equals(other._savedProperties, _savedProperties));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schema,
      const DeepCollectionEquality().hash(_savedProperties));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsStateImplCopyWith<_$FormsStateImpl> get copyWith =>
      __$$FormsStateImplCopyWithImpl<_$FormsStateImpl>(this, _$identity);
}

abstract class _FormsState implements FormsState {
  const factory _FormsState(
      {final SchemaObject? schema,
      final Map<String, dynamic>? savedProperties}) = _$FormsStateImpl;

  @override
  SchemaObject? get schema;
  @override
  Map<String, dynamic>? get savedProperties;
  @override
  @JsonKey(ignore: true)
  _$$FormsStateImplCopyWith<_$FormsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

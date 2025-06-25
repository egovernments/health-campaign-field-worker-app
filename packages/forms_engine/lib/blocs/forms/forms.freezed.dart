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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String schema) load,
    required TResult Function() createMapping,
    required TResult Function(SchemaObject object) update,
    required TResult Function(String key, dynamic value) updateField,
    required TResult Function(String key) clearField,
    required TResult Function(String pageKey) clearPage,
    required TResult Function() clearForm,
    required TResult Function(SchemaObject object) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String schema)? load,
    TResult? Function()? createMapping,
    TResult? Function(SchemaObject object)? update,
    TResult? Function(String key, dynamic value)? updateField,
    TResult? Function(String key)? clearField,
    TResult? Function(String pageKey)? clearPage,
    TResult? Function()? clearForm,
    TResult? Function(SchemaObject object)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String schema)? load,
    TResult Function()? createMapping,
    TResult Function(SchemaObject object)? update,
    TResult Function(String key, dynamic value)? updateField,
    TResult Function(String key)? clearField,
    TResult Function(String pageKey)? clearPage,
    TResult Function()? clearForm,
    TResult Function(SchemaObject object)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsCreateMappingEvent value) createMapping,
    required TResult Function(FormsUpdateEvent value) update,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsClearFieldEvent value) clearField,
    required TResult Function(FormsClearPageEvent value) clearPage,
    required TResult Function(FormsClearFormEvent value) clearForm,
    required TResult Function(FormsSubmitEvent value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormsLoadEvent value)? load,
    TResult? Function(FormsCreateMappingEvent value)? createMapping,
    TResult? Function(FormsUpdateEvent value)? update,
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsClearFieldEvent value)? clearField,
    TResult? Function(FormsClearPageEvent value)? clearPage,
    TResult? Function(FormsClearFormEvent value)? clearForm,
    TResult? Function(FormsSubmitEvent value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormsLoadEvent value)? load,
    TResult Function(FormsCreateMappingEvent value)? createMapping,
    TResult Function(FormsUpdateEvent value)? update,
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsClearFieldEvent value)? clearField,
    TResult Function(FormsClearPageEvent value)? clearPage,
    TResult Function(FormsClearFormEvent value)? clearForm,
    TResult Function(FormsSubmitEvent value)? submit,
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
  @useResult
  $Res call({String schema});
}

/// @nodoc
class __$$FormsLoadEventImplCopyWithImpl<$Res>
    extends _$FormsEventCopyWithImpl<$Res, _$FormsLoadEventImpl>
    implements _$$FormsLoadEventImplCopyWith<$Res> {
  __$$FormsLoadEventImplCopyWithImpl(
      _$FormsLoadEventImpl _value, $Res Function(_$FormsLoadEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schema = null,
  }) {
    return _then(_$FormsLoadEventImpl(
      schema: null == schema
          ? _value.schema
          : schema // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FormsLoadEventImpl implements FormsLoadEvent {
  const _$FormsLoadEventImpl({required this.schema});

  @override
  final String schema;

  @override
  String toString() {
    return 'FormsEvent.load(schema: $schema)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsLoadEventImpl &&
            (identical(other.schema, schema) || other.schema == schema));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schema);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsLoadEventImplCopyWith<_$FormsLoadEventImpl> get copyWith =>
      __$$FormsLoadEventImplCopyWithImpl<_$FormsLoadEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String schema) load,
    required TResult Function() createMapping,
    required TResult Function(SchemaObject object) update,
    required TResult Function(String key, dynamic value) updateField,
    required TResult Function(String key) clearField,
    required TResult Function(String pageKey) clearPage,
    required TResult Function() clearForm,
    required TResult Function(SchemaObject object) submit,
  }) {
    return load(schema);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String schema)? load,
    TResult? Function()? createMapping,
    TResult? Function(SchemaObject object)? update,
    TResult? Function(String key, dynamic value)? updateField,
    TResult? Function(String key)? clearField,
    TResult? Function(String pageKey)? clearPage,
    TResult? Function()? clearForm,
    TResult? Function(SchemaObject object)? submit,
  }) {
    return load?.call(schema);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String schema)? load,
    TResult Function()? createMapping,
    TResult Function(SchemaObject object)? update,
    TResult Function(String key, dynamic value)? updateField,
    TResult Function(String key)? clearField,
    TResult Function(String pageKey)? clearPage,
    TResult Function()? clearForm,
    TResult Function(SchemaObject object)? submit,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(schema);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsCreateMappingEvent value) createMapping,
    required TResult Function(FormsUpdateEvent value) update,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsClearFieldEvent value) clearField,
    required TResult Function(FormsClearPageEvent value) clearPage,
    required TResult Function(FormsClearFormEvent value) clearForm,
    required TResult Function(FormsSubmitEvent value) submit,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormsLoadEvent value)? load,
    TResult? Function(FormsCreateMappingEvent value)? createMapping,
    TResult? Function(FormsUpdateEvent value)? update,
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsClearFieldEvent value)? clearField,
    TResult? Function(FormsClearPageEvent value)? clearPage,
    TResult? Function(FormsClearFormEvent value)? clearForm,
    TResult? Function(FormsSubmitEvent value)? submit,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormsLoadEvent value)? load,
    TResult Function(FormsCreateMappingEvent value)? createMapping,
    TResult Function(FormsUpdateEvent value)? update,
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsClearFieldEvent value)? clearField,
    TResult Function(FormsClearPageEvent value)? clearPage,
    TResult Function(FormsClearFormEvent value)? clearForm,
    TResult Function(FormsSubmitEvent value)? submit,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class FormsLoadEvent implements FormsEvent {
  const factory FormsLoadEvent({required final String schema}) =
      _$FormsLoadEventImpl;

  String get schema;
  @JsonKey(ignore: true)
  _$$FormsLoadEventImplCopyWith<_$FormsLoadEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(String schema) load,
    required TResult Function() createMapping,
    required TResult Function(SchemaObject object) update,
    required TResult Function(String key, dynamic value) updateField,
    required TResult Function(String key) clearField,
    required TResult Function(String pageKey) clearPage,
    required TResult Function() clearForm,
    required TResult Function(SchemaObject object) submit,
  }) {
    return createMapping();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String schema)? load,
    TResult? Function()? createMapping,
    TResult? Function(SchemaObject object)? update,
    TResult? Function(String key, dynamic value)? updateField,
    TResult? Function(String key)? clearField,
    TResult? Function(String pageKey)? clearPage,
    TResult? Function()? clearForm,
    TResult? Function(SchemaObject object)? submit,
  }) {
    return createMapping?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String schema)? load,
    TResult Function()? createMapping,
    TResult Function(SchemaObject object)? update,
    TResult Function(String key, dynamic value)? updateField,
    TResult Function(String key)? clearField,
    TResult Function(String pageKey)? clearPage,
    TResult Function()? clearForm,
    TResult Function(SchemaObject object)? submit,
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
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsClearFieldEvent value) clearField,
    required TResult Function(FormsClearPageEvent value) clearPage,
    required TResult Function(FormsClearFormEvent value) clearForm,
    required TResult Function(FormsSubmitEvent value) submit,
  }) {
    return createMapping(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormsLoadEvent value)? load,
    TResult? Function(FormsCreateMappingEvent value)? createMapping,
    TResult? Function(FormsUpdateEvent value)? update,
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsClearFieldEvent value)? clearField,
    TResult? Function(FormsClearPageEvent value)? clearPage,
    TResult? Function(FormsClearFormEvent value)? clearForm,
    TResult? Function(FormsSubmitEvent value)? submit,
  }) {
    return createMapping?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormsLoadEvent value)? load,
    TResult Function(FormsCreateMappingEvent value)? createMapping,
    TResult Function(FormsUpdateEvent value)? update,
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsClearFieldEvent value)? clearField,
    TResult Function(FormsClearPageEvent value)? clearPage,
    TResult Function(FormsClearFormEvent value)? clearForm,
    TResult Function(FormsSubmitEvent value)? submit,
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
    required TResult Function(String schema) load,
    required TResult Function() createMapping,
    required TResult Function(SchemaObject object) update,
    required TResult Function(String key, dynamic value) updateField,
    required TResult Function(String key) clearField,
    required TResult Function(String pageKey) clearPage,
    required TResult Function() clearForm,
    required TResult Function(SchemaObject object) submit,
  }) {
    return update(object);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String schema)? load,
    TResult? Function()? createMapping,
    TResult? Function(SchemaObject object)? update,
    TResult? Function(String key, dynamic value)? updateField,
    TResult? Function(String key)? clearField,
    TResult? Function(String pageKey)? clearPage,
    TResult? Function()? clearForm,
    TResult? Function(SchemaObject object)? submit,
  }) {
    return update?.call(object);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String schema)? load,
    TResult Function()? createMapping,
    TResult Function(SchemaObject object)? update,
    TResult Function(String key, dynamic value)? updateField,
    TResult Function(String key)? clearField,
    TResult Function(String pageKey)? clearPage,
    TResult Function()? clearForm,
    TResult Function(SchemaObject object)? submit,
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
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsClearFieldEvent value) clearField,
    required TResult Function(FormsClearPageEvent value) clearPage,
    required TResult Function(FormsClearFormEvent value) clearForm,
    required TResult Function(FormsSubmitEvent value) submit,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormsLoadEvent value)? load,
    TResult? Function(FormsCreateMappingEvent value)? createMapping,
    TResult? Function(FormsUpdateEvent value)? update,
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsClearFieldEvent value)? clearField,
    TResult? Function(FormsClearPageEvent value)? clearPage,
    TResult? Function(FormsClearFormEvent value)? clearForm,
    TResult? Function(FormsSubmitEvent value)? submit,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormsLoadEvent value)? load,
    TResult Function(FormsCreateMappingEvent value)? createMapping,
    TResult Function(FormsUpdateEvent value)? update,
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsClearFieldEvent value)? clearField,
    TResult Function(FormsClearPageEvent value)? clearPage,
    TResult Function(FormsClearFormEvent value)? clearForm,
    TResult Function(FormsSubmitEvent value)? submit,
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
abstract class _$$FormsUpdateFieldEventImplCopyWith<$Res> {
  factory _$$FormsUpdateFieldEventImplCopyWith(
          _$FormsUpdateFieldEventImpl value,
          $Res Function(_$FormsUpdateFieldEventImpl) then) =
      __$$FormsUpdateFieldEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String key, dynamic value});
}

/// @nodoc
class __$$FormsUpdateFieldEventImplCopyWithImpl<$Res>
    extends _$FormsEventCopyWithImpl<$Res, _$FormsUpdateFieldEventImpl>
    implements _$$FormsUpdateFieldEventImplCopyWith<$Res> {
  __$$FormsUpdateFieldEventImplCopyWithImpl(_$FormsUpdateFieldEventImpl _value,
      $Res Function(_$FormsUpdateFieldEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = freezed,
  }) {
    return _then(_$FormsUpdateFieldEventImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$FormsUpdateFieldEventImpl implements FormsUpdateFieldEvent {
  const _$FormsUpdateFieldEventImpl({required this.key, required this.value});

  @override
  final String key;
  @override
  final dynamic value;

  @override
  String toString() {
    return 'FormsEvent.updateField(key: $key, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsUpdateFieldEventImpl &&
            (identical(other.key, key) || other.key == key) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, key, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsUpdateFieldEventImplCopyWith<_$FormsUpdateFieldEventImpl>
      get copyWith => __$$FormsUpdateFieldEventImplCopyWithImpl<
          _$FormsUpdateFieldEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String schema) load,
    required TResult Function() createMapping,
    required TResult Function(SchemaObject object) update,
    required TResult Function(String key, dynamic value) updateField,
    required TResult Function(String key) clearField,
    required TResult Function(String pageKey) clearPage,
    required TResult Function() clearForm,
    required TResult Function(SchemaObject object) submit,
  }) {
    return updateField(key, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String schema)? load,
    TResult? Function()? createMapping,
    TResult? Function(SchemaObject object)? update,
    TResult? Function(String key, dynamic value)? updateField,
    TResult? Function(String key)? clearField,
    TResult? Function(String pageKey)? clearPage,
    TResult? Function()? clearForm,
    TResult? Function(SchemaObject object)? submit,
  }) {
    return updateField?.call(key, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String schema)? load,
    TResult Function()? createMapping,
    TResult Function(SchemaObject object)? update,
    TResult Function(String key, dynamic value)? updateField,
    TResult Function(String key)? clearField,
    TResult Function(String pageKey)? clearPage,
    TResult Function()? clearForm,
    TResult Function(SchemaObject object)? submit,
    required TResult orElse(),
  }) {
    if (updateField != null) {
      return updateField(key, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsCreateMappingEvent value) createMapping,
    required TResult Function(FormsUpdateEvent value) update,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsClearFieldEvent value) clearField,
    required TResult Function(FormsClearPageEvent value) clearPage,
    required TResult Function(FormsClearFormEvent value) clearForm,
    required TResult Function(FormsSubmitEvent value) submit,
  }) {
    return updateField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormsLoadEvent value)? load,
    TResult? Function(FormsCreateMappingEvent value)? createMapping,
    TResult? Function(FormsUpdateEvent value)? update,
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsClearFieldEvent value)? clearField,
    TResult? Function(FormsClearPageEvent value)? clearPage,
    TResult? Function(FormsClearFormEvent value)? clearForm,
    TResult? Function(FormsSubmitEvent value)? submit,
  }) {
    return updateField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormsLoadEvent value)? load,
    TResult Function(FormsCreateMappingEvent value)? createMapping,
    TResult Function(FormsUpdateEvent value)? update,
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsClearFieldEvent value)? clearField,
    TResult Function(FormsClearPageEvent value)? clearPage,
    TResult Function(FormsClearFormEvent value)? clearForm,
    TResult Function(FormsSubmitEvent value)? submit,
    required TResult orElse(),
  }) {
    if (updateField != null) {
      return updateField(this);
    }
    return orElse();
  }
}

abstract class FormsUpdateFieldEvent implements FormsEvent {
  const factory FormsUpdateFieldEvent(
      {required final String key,
      required final dynamic value}) = _$FormsUpdateFieldEventImpl;

  String get key;
  dynamic get value;
  @JsonKey(ignore: true)
  _$$FormsUpdateFieldEventImplCopyWith<_$FormsUpdateFieldEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormsClearFieldEventImplCopyWith<$Res> {
  factory _$$FormsClearFieldEventImplCopyWith(_$FormsClearFieldEventImpl value,
          $Res Function(_$FormsClearFieldEventImpl) then) =
      __$$FormsClearFieldEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String key});
}

/// @nodoc
class __$$FormsClearFieldEventImplCopyWithImpl<$Res>
    extends _$FormsEventCopyWithImpl<$Res, _$FormsClearFieldEventImpl>
    implements _$$FormsClearFieldEventImplCopyWith<$Res> {
  __$$FormsClearFieldEventImplCopyWithImpl(_$FormsClearFieldEventImpl _value,
      $Res Function(_$FormsClearFieldEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
  }) {
    return _then(_$FormsClearFieldEventImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FormsClearFieldEventImpl implements FormsClearFieldEvent {
  const _$FormsClearFieldEventImpl({required this.key});

  @override
  final String key;

  @override
  String toString() {
    return 'FormsEvent.clearField(key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsClearFieldEventImpl &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsClearFieldEventImplCopyWith<_$FormsClearFieldEventImpl>
      get copyWith =>
          __$$FormsClearFieldEventImplCopyWithImpl<_$FormsClearFieldEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String schema) load,
    required TResult Function() createMapping,
    required TResult Function(SchemaObject object) update,
    required TResult Function(String key, dynamic value) updateField,
    required TResult Function(String key) clearField,
    required TResult Function(String pageKey) clearPage,
    required TResult Function() clearForm,
    required TResult Function(SchemaObject object) submit,
  }) {
    return clearField(key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String schema)? load,
    TResult? Function()? createMapping,
    TResult? Function(SchemaObject object)? update,
    TResult? Function(String key, dynamic value)? updateField,
    TResult? Function(String key)? clearField,
    TResult? Function(String pageKey)? clearPage,
    TResult? Function()? clearForm,
    TResult? Function(SchemaObject object)? submit,
  }) {
    return clearField?.call(key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String schema)? load,
    TResult Function()? createMapping,
    TResult Function(SchemaObject object)? update,
    TResult Function(String key, dynamic value)? updateField,
    TResult Function(String key)? clearField,
    TResult Function(String pageKey)? clearPage,
    TResult Function()? clearForm,
    TResult Function(SchemaObject object)? submit,
    required TResult orElse(),
  }) {
    if (clearField != null) {
      return clearField(key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsCreateMappingEvent value) createMapping,
    required TResult Function(FormsUpdateEvent value) update,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsClearFieldEvent value) clearField,
    required TResult Function(FormsClearPageEvent value) clearPage,
    required TResult Function(FormsClearFormEvent value) clearForm,
    required TResult Function(FormsSubmitEvent value) submit,
  }) {
    return clearField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormsLoadEvent value)? load,
    TResult? Function(FormsCreateMappingEvent value)? createMapping,
    TResult? Function(FormsUpdateEvent value)? update,
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsClearFieldEvent value)? clearField,
    TResult? Function(FormsClearPageEvent value)? clearPage,
    TResult? Function(FormsClearFormEvent value)? clearForm,
    TResult? Function(FormsSubmitEvent value)? submit,
  }) {
    return clearField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormsLoadEvent value)? load,
    TResult Function(FormsCreateMappingEvent value)? createMapping,
    TResult Function(FormsUpdateEvent value)? update,
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsClearFieldEvent value)? clearField,
    TResult Function(FormsClearPageEvent value)? clearPage,
    TResult Function(FormsClearFormEvent value)? clearForm,
    TResult Function(FormsSubmitEvent value)? submit,
    required TResult orElse(),
  }) {
    if (clearField != null) {
      return clearField(this);
    }
    return orElse();
  }
}

abstract class FormsClearFieldEvent implements FormsEvent {
  const factory FormsClearFieldEvent({required final String key}) =
      _$FormsClearFieldEventImpl;

  String get key;
  @JsonKey(ignore: true)
  _$$FormsClearFieldEventImplCopyWith<_$FormsClearFieldEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormsClearPageEventImplCopyWith<$Res> {
  factory _$$FormsClearPageEventImplCopyWith(_$FormsClearPageEventImpl value,
          $Res Function(_$FormsClearPageEventImpl) then) =
      __$$FormsClearPageEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pageKey});
}

/// @nodoc
class __$$FormsClearPageEventImplCopyWithImpl<$Res>
    extends _$FormsEventCopyWithImpl<$Res, _$FormsClearPageEventImpl>
    implements _$$FormsClearPageEventImplCopyWith<$Res> {
  __$$FormsClearPageEventImplCopyWithImpl(_$FormsClearPageEventImpl _value,
      $Res Function(_$FormsClearPageEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageKey = null,
  }) {
    return _then(_$FormsClearPageEventImpl(
      pageKey: null == pageKey
          ? _value.pageKey
          : pageKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FormsClearPageEventImpl implements FormsClearPageEvent {
  const _$FormsClearPageEventImpl({required this.pageKey});

  @override
  final String pageKey;

  @override
  String toString() {
    return 'FormsEvent.clearPage(pageKey: $pageKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsClearPageEventImpl &&
            (identical(other.pageKey, pageKey) || other.pageKey == pageKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsClearPageEventImplCopyWith<_$FormsClearPageEventImpl> get copyWith =>
      __$$FormsClearPageEventImplCopyWithImpl<_$FormsClearPageEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String schema) load,
    required TResult Function() createMapping,
    required TResult Function(SchemaObject object) update,
    required TResult Function(String key, dynamic value) updateField,
    required TResult Function(String key) clearField,
    required TResult Function(String pageKey) clearPage,
    required TResult Function() clearForm,
    required TResult Function(SchemaObject object) submit,
  }) {
    return clearPage(pageKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String schema)? load,
    TResult? Function()? createMapping,
    TResult? Function(SchemaObject object)? update,
    TResult? Function(String key, dynamic value)? updateField,
    TResult? Function(String key)? clearField,
    TResult? Function(String pageKey)? clearPage,
    TResult? Function()? clearForm,
    TResult? Function(SchemaObject object)? submit,
  }) {
    return clearPage?.call(pageKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String schema)? load,
    TResult Function()? createMapping,
    TResult Function(SchemaObject object)? update,
    TResult Function(String key, dynamic value)? updateField,
    TResult Function(String key)? clearField,
    TResult Function(String pageKey)? clearPage,
    TResult Function()? clearForm,
    TResult Function(SchemaObject object)? submit,
    required TResult orElse(),
  }) {
    if (clearPage != null) {
      return clearPage(pageKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsCreateMappingEvent value) createMapping,
    required TResult Function(FormsUpdateEvent value) update,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsClearFieldEvent value) clearField,
    required TResult Function(FormsClearPageEvent value) clearPage,
    required TResult Function(FormsClearFormEvent value) clearForm,
    required TResult Function(FormsSubmitEvent value) submit,
  }) {
    return clearPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormsLoadEvent value)? load,
    TResult? Function(FormsCreateMappingEvent value)? createMapping,
    TResult? Function(FormsUpdateEvent value)? update,
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsClearFieldEvent value)? clearField,
    TResult? Function(FormsClearPageEvent value)? clearPage,
    TResult? Function(FormsClearFormEvent value)? clearForm,
    TResult? Function(FormsSubmitEvent value)? submit,
  }) {
    return clearPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormsLoadEvent value)? load,
    TResult Function(FormsCreateMappingEvent value)? createMapping,
    TResult Function(FormsUpdateEvent value)? update,
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsClearFieldEvent value)? clearField,
    TResult Function(FormsClearPageEvent value)? clearPage,
    TResult Function(FormsClearFormEvent value)? clearForm,
    TResult Function(FormsSubmitEvent value)? submit,
    required TResult orElse(),
  }) {
    if (clearPage != null) {
      return clearPage(this);
    }
    return orElse();
  }
}

abstract class FormsClearPageEvent implements FormsEvent {
  const factory FormsClearPageEvent({required final String pageKey}) =
      _$FormsClearPageEventImpl;

  String get pageKey;
  @JsonKey(ignore: true)
  _$$FormsClearPageEventImplCopyWith<_$FormsClearPageEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormsClearFormEventImplCopyWith<$Res> {
  factory _$$FormsClearFormEventImplCopyWith(_$FormsClearFormEventImpl value,
          $Res Function(_$FormsClearFormEventImpl) then) =
      __$$FormsClearFormEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FormsClearFormEventImplCopyWithImpl<$Res>
    extends _$FormsEventCopyWithImpl<$Res, _$FormsClearFormEventImpl>
    implements _$$FormsClearFormEventImplCopyWith<$Res> {
  __$$FormsClearFormEventImplCopyWithImpl(_$FormsClearFormEventImpl _value,
      $Res Function(_$FormsClearFormEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FormsClearFormEventImpl implements FormsClearFormEvent {
  const _$FormsClearFormEventImpl();

  @override
  String toString() {
    return 'FormsEvent.clearForm()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsClearFormEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String schema) load,
    required TResult Function() createMapping,
    required TResult Function(SchemaObject object) update,
    required TResult Function(String key, dynamic value) updateField,
    required TResult Function(String key) clearField,
    required TResult Function(String pageKey) clearPage,
    required TResult Function() clearForm,
    required TResult Function(SchemaObject object) submit,
  }) {
    return clearForm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String schema)? load,
    TResult? Function()? createMapping,
    TResult? Function(SchemaObject object)? update,
    TResult? Function(String key, dynamic value)? updateField,
    TResult? Function(String key)? clearField,
    TResult? Function(String pageKey)? clearPage,
    TResult? Function()? clearForm,
    TResult? Function(SchemaObject object)? submit,
  }) {
    return clearForm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String schema)? load,
    TResult Function()? createMapping,
    TResult Function(SchemaObject object)? update,
    TResult Function(String key, dynamic value)? updateField,
    TResult Function(String key)? clearField,
    TResult Function(String pageKey)? clearPage,
    TResult Function()? clearForm,
    TResult Function(SchemaObject object)? submit,
    required TResult orElse(),
  }) {
    if (clearForm != null) {
      return clearForm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsCreateMappingEvent value) createMapping,
    required TResult Function(FormsUpdateEvent value) update,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsClearFieldEvent value) clearField,
    required TResult Function(FormsClearPageEvent value) clearPage,
    required TResult Function(FormsClearFormEvent value) clearForm,
    required TResult Function(FormsSubmitEvent value) submit,
  }) {
    return clearForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormsLoadEvent value)? load,
    TResult? Function(FormsCreateMappingEvent value)? createMapping,
    TResult? Function(FormsUpdateEvent value)? update,
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsClearFieldEvent value)? clearField,
    TResult? Function(FormsClearPageEvent value)? clearPage,
    TResult? Function(FormsClearFormEvent value)? clearForm,
    TResult? Function(FormsSubmitEvent value)? submit,
  }) {
    return clearForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormsLoadEvent value)? load,
    TResult Function(FormsCreateMappingEvent value)? createMapping,
    TResult Function(FormsUpdateEvent value)? update,
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsClearFieldEvent value)? clearField,
    TResult Function(FormsClearPageEvent value)? clearPage,
    TResult Function(FormsClearFormEvent value)? clearForm,
    TResult Function(FormsSubmitEvent value)? submit,
    required TResult orElse(),
  }) {
    if (clearForm != null) {
      return clearForm(this);
    }
    return orElse();
  }
}

abstract class FormsClearFormEvent implements FormsEvent {
  const factory FormsClearFormEvent() = _$FormsClearFormEventImpl;
}

/// @nodoc
abstract class _$$FormsSubmitEventImplCopyWith<$Res> {
  factory _$$FormsSubmitEventImplCopyWith(_$FormsSubmitEventImpl value,
          $Res Function(_$FormsSubmitEventImpl) then) =
      __$$FormsSubmitEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SchemaObject object});

  $SchemaObjectCopyWith<$Res> get object;
}

/// @nodoc
class __$$FormsSubmitEventImplCopyWithImpl<$Res>
    extends _$FormsEventCopyWithImpl<$Res, _$FormsSubmitEventImpl>
    implements _$$FormsSubmitEventImplCopyWith<$Res> {
  __$$FormsSubmitEventImplCopyWithImpl(_$FormsSubmitEventImpl _value,
      $Res Function(_$FormsSubmitEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
  }) {
    return _then(_$FormsSubmitEventImpl(
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

class _$FormsSubmitEventImpl implements FormsSubmitEvent {
  const _$FormsSubmitEventImpl(this.object);

  @override
  final SchemaObject object;

  @override
  String toString() {
    return 'FormsEvent.submit(object: $object)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsSubmitEventImpl &&
            (identical(other.object, object) || other.object == object));
  }

  @override
  int get hashCode => Object.hash(runtimeType, object);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsSubmitEventImplCopyWith<_$FormsSubmitEventImpl> get copyWith =>
      __$$FormsSubmitEventImplCopyWithImpl<_$FormsSubmitEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String schema) load,
    required TResult Function() createMapping,
    required TResult Function(SchemaObject object) update,
    required TResult Function(String key, dynamic value) updateField,
    required TResult Function(String key) clearField,
    required TResult Function(String pageKey) clearPage,
    required TResult Function() clearForm,
    required TResult Function(SchemaObject object) submit,
  }) {
    return submit(object);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String schema)? load,
    TResult? Function()? createMapping,
    TResult? Function(SchemaObject object)? update,
    TResult? Function(String key, dynamic value)? updateField,
    TResult? Function(String key)? clearField,
    TResult? Function(String pageKey)? clearPage,
    TResult? Function()? clearForm,
    TResult? Function(SchemaObject object)? submit,
  }) {
    return submit?.call(object);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String schema)? load,
    TResult Function()? createMapping,
    TResult Function(SchemaObject object)? update,
    TResult Function(String key, dynamic value)? updateField,
    TResult Function(String key)? clearField,
    TResult Function(String pageKey)? clearPage,
    TResult Function()? clearForm,
    TResult Function(SchemaObject object)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(object);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsCreateMappingEvent value) createMapping,
    required TResult Function(FormsUpdateEvent value) update,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsClearFieldEvent value) clearField,
    required TResult Function(FormsClearPageEvent value) clearPage,
    required TResult Function(FormsClearFormEvent value) clearForm,
    required TResult Function(FormsSubmitEvent value) submit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormsLoadEvent value)? load,
    TResult? Function(FormsCreateMappingEvent value)? createMapping,
    TResult? Function(FormsUpdateEvent value)? update,
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsClearFieldEvent value)? clearField,
    TResult? Function(FormsClearPageEvent value)? clearPage,
    TResult? Function(FormsClearFormEvent value)? clearForm,
    TResult? Function(FormsSubmitEvent value)? submit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormsLoadEvent value)? load,
    TResult Function(FormsCreateMappingEvent value)? createMapping,
    TResult Function(FormsUpdateEvent value)? update,
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsClearFieldEvent value)? clearField,
    TResult Function(FormsClearPageEvent value)? clearPage,
    TResult Function(FormsClearFormEvent value)? clearForm,
    TResult Function(FormsSubmitEvent value)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class FormsSubmitEvent implements FormsEvent {
  const factory FormsSubmitEvent(final SchemaObject object) =
      _$FormsSubmitEventImpl;

  SchemaObject get object;
  @JsonKey(ignore: true)
  _$$FormsSubmitEventImplCopyWith<_$FormsSubmitEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FormsState {
  SchemaObject? get schema => throw _privateConstructorUsedError;
  Map<String, dynamic>? get formData => throw _privateConstructorUsedError;
  SchemaObject? get initialSchema => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SchemaObject? schema, Map<String, dynamic>? formData,
            SchemaObject? initialSchema)
        $default, {
    required TResult Function(SchemaObject? schema,
            Map<String, dynamic> formData, SchemaObject? initialSchema)
        formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(SchemaObject? schema, Map<String, dynamic>? formData,
            SchemaObject? initialSchema)?
        $default, {
    TResult? Function(SchemaObject? schema, Map<String, dynamic> formData,
            SchemaObject? initialSchema)?
        formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SchemaObject? schema, Map<String, dynamic>? formData,
            SchemaObject? initialSchema)?
        $default, {
    TResult Function(SchemaObject? schema, Map<String, dynamic> formData,
            SchemaObject? initialSchema)?
        formSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FormsState value) $default, {
    required TResult Function(FormsSubmittedState value) formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FormsState value)? $default, {
    TResult? Function(FormsSubmittedState value)? formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FormsState value)? $default, {
    TResult Function(FormsSubmittedState value)? formSubmitted,
    required TResult orElse(),
  }) =>
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
  $Res call(
      {SchemaObject? schema,
      Map<String, dynamic> formData,
      SchemaObject? initialSchema});

  $SchemaObjectCopyWith<$Res>? get schema;
  $SchemaObjectCopyWith<$Res>? get initialSchema;
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
    Object? formData = null,
    Object? initialSchema = freezed,
  }) {
    return _then(_value.copyWith(
      schema: freezed == schema
          ? _value.schema
          : schema // ignore: cast_nullable_to_non_nullable
              as SchemaObject?,
      formData: null == formData
          ? _value.formData!
          : formData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      initialSchema: freezed == initialSchema
          ? _value.initialSchema
          : initialSchema // ignore: cast_nullable_to_non_nullable
              as SchemaObject?,
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

  @override
  @pragma('vm:prefer-inline')
  $SchemaObjectCopyWith<$Res>? get initialSchema {
    if (_value.initialSchema == null) {
      return null;
    }

    return $SchemaObjectCopyWith<$Res>(_value.initialSchema!, (value) {
      return _then(_value.copyWith(initialSchema: value) as $Val);
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
  $Res call(
      {SchemaObject? schema,
      Map<String, dynamic>? formData,
      SchemaObject? initialSchema});

  @override
  $SchemaObjectCopyWith<$Res>? get schema;
  @override
  $SchemaObjectCopyWith<$Res>? get initialSchema;
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
    Object? formData = freezed,
    Object? initialSchema = freezed,
  }) {
    return _then(_$FormsStateImpl(
      schema: freezed == schema
          ? _value.schema
          : schema // ignore: cast_nullable_to_non_nullable
              as SchemaObject?,
      formData: freezed == formData
          ? _value._formData
          : formData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      initialSchema: freezed == initialSchema
          ? _value.initialSchema
          : initialSchema // ignore: cast_nullable_to_non_nullable
              as SchemaObject?,
    ));
  }
}

/// @nodoc

class _$FormsStateImpl implements _FormsState {
  const _$FormsStateImpl(
      {this.schema, final Map<String, dynamic>? formData, this.initialSchema})
      : _formData = formData;

  @override
  final SchemaObject? schema;
  final Map<String, dynamic>? _formData;
  @override
  Map<String, dynamic>? get formData {
    final value = _formData;
    if (value == null) return null;
    if (_formData is EqualUnmodifiableMapView) return _formData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final SchemaObject? initialSchema;

  @override
  String toString() {
    return 'FormsState(schema: $schema, formData: $formData, initialSchema: $initialSchema)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsStateImpl &&
            (identical(other.schema, schema) || other.schema == schema) &&
            const DeepCollectionEquality().equals(other._formData, _formData) &&
            (identical(other.initialSchema, initialSchema) ||
                other.initialSchema == initialSchema));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schema,
      const DeepCollectionEquality().hash(_formData), initialSchema);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsStateImplCopyWith<_$FormsStateImpl> get copyWith =>
      __$$FormsStateImplCopyWithImpl<_$FormsStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SchemaObject? schema, Map<String, dynamic>? formData,
            SchemaObject? initialSchema)
        $default, {
    required TResult Function(SchemaObject? schema,
            Map<String, dynamic> formData, SchemaObject? initialSchema)
        formSubmitted,
  }) {
    return $default(schema, formData, initialSchema);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(SchemaObject? schema, Map<String, dynamic>? formData,
            SchemaObject? initialSchema)?
        $default, {
    TResult? Function(SchemaObject? schema, Map<String, dynamic> formData,
            SchemaObject? initialSchema)?
        formSubmitted,
  }) {
    return $default?.call(schema, formData, initialSchema);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SchemaObject? schema, Map<String, dynamic>? formData,
            SchemaObject? initialSchema)?
        $default, {
    TResult Function(SchemaObject? schema, Map<String, dynamic> formData,
            SchemaObject? initialSchema)?
        formSubmitted,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(schema, formData, initialSchema);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FormsState value) $default, {
    required TResult Function(FormsSubmittedState value) formSubmitted,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FormsState value)? $default, {
    TResult? Function(FormsSubmittedState value)? formSubmitted,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FormsState value)? $default, {
    TResult Function(FormsSubmittedState value)? formSubmitted,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _FormsState implements FormsState {
  const factory _FormsState(
      {final SchemaObject? schema,
      final Map<String, dynamic>? formData,
      final SchemaObject? initialSchema}) = _$FormsStateImpl;

  @override
  SchemaObject? get schema;
  @override
  Map<String, dynamic>? get formData;
  @override
  SchemaObject? get initialSchema;
  @override
  @JsonKey(ignore: true)
  _$$FormsStateImplCopyWith<_$FormsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormsSubmittedStateImplCopyWith<$Res>
    implements $FormsStateCopyWith<$Res> {
  factory _$$FormsSubmittedStateImplCopyWith(_$FormsSubmittedStateImpl value,
          $Res Function(_$FormsSubmittedStateImpl) then) =
      __$$FormsSubmittedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SchemaObject? schema,
      Map<String, dynamic> formData,
      SchemaObject? initialSchema});

  @override
  $SchemaObjectCopyWith<$Res>? get schema;
  @override
  $SchemaObjectCopyWith<$Res>? get initialSchema;
}

/// @nodoc
class __$$FormsSubmittedStateImplCopyWithImpl<$Res>
    extends _$FormsStateCopyWithImpl<$Res, _$FormsSubmittedStateImpl>
    implements _$$FormsSubmittedStateImplCopyWith<$Res> {
  __$$FormsSubmittedStateImplCopyWithImpl(_$FormsSubmittedStateImpl _value,
      $Res Function(_$FormsSubmittedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schema = freezed,
    Object? formData = null,
    Object? initialSchema = freezed,
  }) {
    return _then(_$FormsSubmittedStateImpl(
      schema: freezed == schema
          ? _value.schema
          : schema // ignore: cast_nullable_to_non_nullable
              as SchemaObject?,
      formData: null == formData
          ? _value._formData
          : formData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      initialSchema: freezed == initialSchema
          ? _value.initialSchema
          : initialSchema // ignore: cast_nullable_to_non_nullable
              as SchemaObject?,
    ));
  }
}

/// @nodoc

class _$FormsSubmittedStateImpl implements FormsSubmittedState {
  const _$FormsSubmittedStateImpl(
      {this.schema,
      required final Map<String, dynamic> formData,
      this.initialSchema})
      : _formData = formData;

  @override
  final SchemaObject? schema;
  final Map<String, dynamic> _formData;
  @override
  Map<String, dynamic> get formData {
    if (_formData is EqualUnmodifiableMapView) return _formData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_formData);
  }

  @override
  final SchemaObject? initialSchema;

  @override
  String toString() {
    return 'FormsState.formSubmitted(schema: $schema, formData: $formData, initialSchema: $initialSchema)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsSubmittedStateImpl &&
            (identical(other.schema, schema) || other.schema == schema) &&
            const DeepCollectionEquality().equals(other._formData, _formData) &&
            (identical(other.initialSchema, initialSchema) ||
                other.initialSchema == initialSchema));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schema,
      const DeepCollectionEquality().hash(_formData), initialSchema);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsSubmittedStateImplCopyWith<_$FormsSubmittedStateImpl> get copyWith =>
      __$$FormsSubmittedStateImplCopyWithImpl<_$FormsSubmittedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SchemaObject? schema, Map<String, dynamic>? formData,
            SchemaObject? initialSchema)
        $default, {
    required TResult Function(SchemaObject? schema,
            Map<String, dynamic> formData, SchemaObject? initialSchema)
        formSubmitted,
  }) {
    return formSubmitted(schema, formData, initialSchema);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(SchemaObject? schema, Map<String, dynamic>? formData,
            SchemaObject? initialSchema)?
        $default, {
    TResult? Function(SchemaObject? schema, Map<String, dynamic> formData,
            SchemaObject? initialSchema)?
        formSubmitted,
  }) {
    return formSubmitted?.call(schema, formData, initialSchema);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SchemaObject? schema, Map<String, dynamic>? formData,
            SchemaObject? initialSchema)?
        $default, {
    TResult Function(SchemaObject? schema, Map<String, dynamic> formData,
            SchemaObject? initialSchema)?
        formSubmitted,
    required TResult orElse(),
  }) {
    if (formSubmitted != null) {
      return formSubmitted(schema, formData, initialSchema);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FormsState value) $default, {
    required TResult Function(FormsSubmittedState value) formSubmitted,
  }) {
    return formSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FormsState value)? $default, {
    TResult? Function(FormsSubmittedState value)? formSubmitted,
  }) {
    return formSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FormsState value)? $default, {
    TResult Function(FormsSubmittedState value)? formSubmitted,
    required TResult orElse(),
  }) {
    if (formSubmitted != null) {
      return formSubmitted(this);
    }
    return orElse();
  }
}

abstract class FormsSubmittedState implements FormsState {
  const factory FormsSubmittedState(
      {final SchemaObject? schema,
      required final Map<String, dynamic> formData,
      final SchemaObject? initialSchema}) = _$FormsSubmittedStateImpl;

  @override
  SchemaObject? get schema;
  @override
  Map<String, dynamic> get formData;
  @override
  SchemaObject? get initialSchema;
  @override
  @JsonKey(ignore: true)
  _$$FormsSubmittedStateImplCopyWith<_$FormsSubmittedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

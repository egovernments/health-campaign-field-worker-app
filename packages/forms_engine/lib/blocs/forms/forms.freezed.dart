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
    required TResult Function(List<String> schemas) load,
    required TResult Function(String schemaKey, String key, dynamic value)
        updateField,
    required TResult Function(SchemaObject schema, String schemaKey) update,
    required TResult Function(String schemaKey, String key) clearField,
    required TResult Function(String schemaKey, String pageKey) clearPage,
    required TResult Function(String schemaKey) clearForm,
    required TResult Function(String schemaKey, bool isEdit) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> schemas)? load,
    TResult? Function(String schemaKey, String key, dynamic value)? updateField,
    TResult? Function(SchemaObject schema, String schemaKey)? update,
    TResult? Function(String schemaKey, String key)? clearField,
    TResult? Function(String schemaKey, String pageKey)? clearPage,
    TResult? Function(String schemaKey)? clearForm,
    TResult? Function(String schemaKey, bool isEdit)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> schemas)? load,
    TResult Function(String schemaKey, String key, dynamic value)? updateField,
    TResult Function(SchemaObject schema, String schemaKey)? update,
    TResult Function(String schemaKey, String key)? clearField,
    TResult Function(String schemaKey, String pageKey)? clearPage,
    TResult Function(String schemaKey)? clearForm,
    TResult Function(String schemaKey, bool isEdit)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsUpdateEvent value) update,
    required TResult Function(FormsClearFieldEvent value) clearField,
    required TResult Function(FormsClearPageEvent value) clearPage,
    required TResult Function(FormsClearFormEvent value) clearForm,
    required TResult Function(FormsSubmitEvent value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormsLoadEvent value)? load,
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsUpdateEvent value)? update,
    TResult? Function(FormsClearFieldEvent value)? clearField,
    TResult? Function(FormsClearPageEvent value)? clearPage,
    TResult? Function(FormsClearFormEvent value)? clearForm,
    TResult? Function(FormsSubmitEvent value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormsLoadEvent value)? load,
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsUpdateEvent value)? update,
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
  $Res call({List<String> schemas});
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
    Object? schemas = null,
  }) {
    return _then(_$FormsLoadEventImpl(
      schemas: null == schemas
          ? _value._schemas
          : schemas // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$FormsLoadEventImpl implements FormsLoadEvent {
  const _$FormsLoadEventImpl({required final List<String> schemas})
      : _schemas = schemas;

  final List<String> _schemas;
  @override
  List<String> get schemas {
    if (_schemas is EqualUnmodifiableListView) return _schemas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schemas);
  }

  @override
  String toString() {
    return 'FormsEvent.load(schemas: $schemas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsLoadEventImpl &&
            const DeepCollectionEquality().equals(other._schemas, _schemas));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_schemas));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsLoadEventImplCopyWith<_$FormsLoadEventImpl> get copyWith =>
      __$$FormsLoadEventImplCopyWithImpl<_$FormsLoadEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> schemas) load,
    required TResult Function(String schemaKey, String key, dynamic value)
        updateField,
    required TResult Function(SchemaObject schema, String schemaKey) update,
    required TResult Function(String schemaKey, String key) clearField,
    required TResult Function(String schemaKey, String pageKey) clearPage,
    required TResult Function(String schemaKey) clearForm,
    required TResult Function(String schemaKey, bool isEdit) submit,
  }) {
    return load(schemas);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> schemas)? load,
    TResult? Function(String schemaKey, String key, dynamic value)? updateField,
    TResult? Function(SchemaObject schema, String schemaKey)? update,
    TResult? Function(String schemaKey, String key)? clearField,
    TResult? Function(String schemaKey, String pageKey)? clearPage,
    TResult? Function(String schemaKey)? clearForm,
    TResult? Function(String schemaKey, bool isEdit)? submit,
  }) {
    return load?.call(schemas);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> schemas)? load,
    TResult Function(String schemaKey, String key, dynamic value)? updateField,
    TResult Function(SchemaObject schema, String schemaKey)? update,
    TResult Function(String schemaKey, String key)? clearField,
    TResult Function(String schemaKey, String pageKey)? clearPage,
    TResult Function(String schemaKey)? clearForm,
    TResult Function(String schemaKey, bool isEdit)? submit,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(schemas);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsUpdateEvent value) update,
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
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsUpdateEvent value)? update,
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
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsUpdateEvent value)? update,
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
  const factory FormsLoadEvent({required final List<String> schemas}) =
      _$FormsLoadEventImpl;

  List<String> get schemas;
  @JsonKey(ignore: true)
  _$$FormsLoadEventImplCopyWith<_$FormsLoadEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormsUpdateFieldEventImplCopyWith<$Res> {
  factory _$$FormsUpdateFieldEventImplCopyWith(
          _$FormsUpdateFieldEventImpl value,
          $Res Function(_$FormsUpdateFieldEventImpl) then) =
      __$$FormsUpdateFieldEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String schemaKey, String key, dynamic value});
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
    Object? schemaKey = null,
    Object? key = null,
    Object? value = freezed,
  }) {
    return _then(_$FormsUpdateFieldEventImpl(
      schemaKey: null == schemaKey
          ? _value.schemaKey
          : schemaKey // ignore: cast_nullable_to_non_nullable
              as String,
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
  const _$FormsUpdateFieldEventImpl(
      {required this.schemaKey, required this.key, required this.value});

  @override
  final String schemaKey;
  @override
  final String key;
  @override
  final dynamic value;

  @override
  String toString() {
    return 'FormsEvent.updateField(schemaKey: $schemaKey, key: $key, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsUpdateFieldEventImpl &&
            (identical(other.schemaKey, schemaKey) ||
                other.schemaKey == schemaKey) &&
            (identical(other.key, key) || other.key == key) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, schemaKey, key, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsUpdateFieldEventImplCopyWith<_$FormsUpdateFieldEventImpl>
      get copyWith => __$$FormsUpdateFieldEventImplCopyWithImpl<
          _$FormsUpdateFieldEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> schemas) load,
    required TResult Function(String schemaKey, String key, dynamic value)
        updateField,
    required TResult Function(SchemaObject schema, String schemaKey) update,
    required TResult Function(String schemaKey, String key) clearField,
    required TResult Function(String schemaKey, String pageKey) clearPage,
    required TResult Function(String schemaKey) clearForm,
    required TResult Function(String schemaKey, bool isEdit) submit,
  }) {
    return updateField(schemaKey, key, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> schemas)? load,
    TResult? Function(String schemaKey, String key, dynamic value)? updateField,
    TResult? Function(SchemaObject schema, String schemaKey)? update,
    TResult? Function(String schemaKey, String key)? clearField,
    TResult? Function(String schemaKey, String pageKey)? clearPage,
    TResult? Function(String schemaKey)? clearForm,
    TResult? Function(String schemaKey, bool isEdit)? submit,
  }) {
    return updateField?.call(schemaKey, key, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> schemas)? load,
    TResult Function(String schemaKey, String key, dynamic value)? updateField,
    TResult Function(SchemaObject schema, String schemaKey)? update,
    TResult Function(String schemaKey, String key)? clearField,
    TResult Function(String schemaKey, String pageKey)? clearPage,
    TResult Function(String schemaKey)? clearForm,
    TResult Function(String schemaKey, bool isEdit)? submit,
    required TResult orElse(),
  }) {
    if (updateField != null) {
      return updateField(schemaKey, key, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsUpdateEvent value) update,
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
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsUpdateEvent value)? update,
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
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsUpdateEvent value)? update,
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
      {required final String schemaKey,
      required final String key,
      required final dynamic value}) = _$FormsUpdateFieldEventImpl;

  String get schemaKey;
  String get key;
  dynamic get value;
  @JsonKey(ignore: true)
  _$$FormsUpdateFieldEventImplCopyWith<_$FormsUpdateFieldEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormsUpdateEventImplCopyWith<$Res> {
  factory _$$FormsUpdateEventImplCopyWith(_$FormsUpdateEventImpl value,
          $Res Function(_$FormsUpdateEventImpl) then) =
      __$$FormsUpdateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SchemaObject schema, String schemaKey});

  $SchemaObjectCopyWith<$Res> get schema;
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
    Object? schema = null,
    Object? schemaKey = null,
  }) {
    return _then(_$FormsUpdateEventImpl(
      schema: null == schema
          ? _value.schema
          : schema // ignore: cast_nullable_to_non_nullable
              as SchemaObject,
      schemaKey: null == schemaKey
          ? _value.schemaKey
          : schemaKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SchemaObjectCopyWith<$Res> get schema {
    return $SchemaObjectCopyWith<$Res>(_value.schema, (value) {
      return _then(_value.copyWith(schema: value));
    });
  }
}

/// @nodoc

class _$FormsUpdateEventImpl implements FormsUpdateEvent {
  const _$FormsUpdateEventImpl({required this.schema, required this.schemaKey});

  @override
  final SchemaObject schema;
  @override
  final String schemaKey;

  @override
  String toString() {
    return 'FormsEvent.update(schema: $schema, schemaKey: $schemaKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsUpdateEventImpl &&
            (identical(other.schema, schema) || other.schema == schema) &&
            (identical(other.schemaKey, schemaKey) ||
                other.schemaKey == schemaKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schema, schemaKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsUpdateEventImplCopyWith<_$FormsUpdateEventImpl> get copyWith =>
      __$$FormsUpdateEventImplCopyWithImpl<_$FormsUpdateEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> schemas) load,
    required TResult Function(String schemaKey, String key, dynamic value)
        updateField,
    required TResult Function(SchemaObject schema, String schemaKey) update,
    required TResult Function(String schemaKey, String key) clearField,
    required TResult Function(String schemaKey, String pageKey) clearPage,
    required TResult Function(String schemaKey) clearForm,
    required TResult Function(String schemaKey, bool isEdit) submit,
  }) {
    return update(schema, schemaKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> schemas)? load,
    TResult? Function(String schemaKey, String key, dynamic value)? updateField,
    TResult? Function(SchemaObject schema, String schemaKey)? update,
    TResult? Function(String schemaKey, String key)? clearField,
    TResult? Function(String schemaKey, String pageKey)? clearPage,
    TResult? Function(String schemaKey)? clearForm,
    TResult? Function(String schemaKey, bool isEdit)? submit,
  }) {
    return update?.call(schema, schemaKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> schemas)? load,
    TResult Function(String schemaKey, String key, dynamic value)? updateField,
    TResult Function(SchemaObject schema, String schemaKey)? update,
    TResult Function(String schemaKey, String key)? clearField,
    TResult Function(String schemaKey, String pageKey)? clearPage,
    TResult Function(String schemaKey)? clearForm,
    TResult Function(String schemaKey, bool isEdit)? submit,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(schema, schemaKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsUpdateEvent value) update,
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
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsUpdateEvent value)? update,
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
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsUpdateEvent value)? update,
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
  const factory FormsUpdateEvent(
      {required final SchemaObject schema,
      required final String schemaKey}) = _$FormsUpdateEventImpl;

  SchemaObject get schema;
  String get schemaKey;
  @JsonKey(ignore: true)
  _$$FormsUpdateEventImplCopyWith<_$FormsUpdateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormsClearFieldEventImplCopyWith<$Res> {
  factory _$$FormsClearFieldEventImplCopyWith(_$FormsClearFieldEventImpl value,
          $Res Function(_$FormsClearFieldEventImpl) then) =
      __$$FormsClearFieldEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String schemaKey, String key});
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
    Object? schemaKey = null,
    Object? key = null,
  }) {
    return _then(_$FormsClearFieldEventImpl(
      schemaKey: null == schemaKey
          ? _value.schemaKey
          : schemaKey // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FormsClearFieldEventImpl implements FormsClearFieldEvent {
  const _$FormsClearFieldEventImpl(
      {required this.schemaKey, required this.key});

  @override
  final String schemaKey;
  @override
  final String key;

  @override
  String toString() {
    return 'FormsEvent.clearField(schemaKey: $schemaKey, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsClearFieldEventImpl &&
            (identical(other.schemaKey, schemaKey) ||
                other.schemaKey == schemaKey) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schemaKey, key);

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
    required TResult Function(List<String> schemas) load,
    required TResult Function(String schemaKey, String key, dynamic value)
        updateField,
    required TResult Function(SchemaObject schema, String schemaKey) update,
    required TResult Function(String schemaKey, String key) clearField,
    required TResult Function(String schemaKey, String pageKey) clearPage,
    required TResult Function(String schemaKey) clearForm,
    required TResult Function(String schemaKey, bool isEdit) submit,
  }) {
    return clearField(schemaKey, key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> schemas)? load,
    TResult? Function(String schemaKey, String key, dynamic value)? updateField,
    TResult? Function(SchemaObject schema, String schemaKey)? update,
    TResult? Function(String schemaKey, String key)? clearField,
    TResult? Function(String schemaKey, String pageKey)? clearPage,
    TResult? Function(String schemaKey)? clearForm,
    TResult? Function(String schemaKey, bool isEdit)? submit,
  }) {
    return clearField?.call(schemaKey, key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> schemas)? load,
    TResult Function(String schemaKey, String key, dynamic value)? updateField,
    TResult Function(SchemaObject schema, String schemaKey)? update,
    TResult Function(String schemaKey, String key)? clearField,
    TResult Function(String schemaKey, String pageKey)? clearPage,
    TResult Function(String schemaKey)? clearForm,
    TResult Function(String schemaKey, bool isEdit)? submit,
    required TResult orElse(),
  }) {
    if (clearField != null) {
      return clearField(schemaKey, key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsUpdateEvent value) update,
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
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsUpdateEvent value)? update,
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
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsUpdateEvent value)? update,
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
  const factory FormsClearFieldEvent(
      {required final String schemaKey,
      required final String key}) = _$FormsClearFieldEventImpl;

  String get schemaKey;
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
  $Res call({String schemaKey, String pageKey});
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
    Object? schemaKey = null,
    Object? pageKey = null,
  }) {
    return _then(_$FormsClearPageEventImpl(
      schemaKey: null == schemaKey
          ? _value.schemaKey
          : schemaKey // ignore: cast_nullable_to_non_nullable
              as String,
      pageKey: null == pageKey
          ? _value.pageKey
          : pageKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FormsClearPageEventImpl implements FormsClearPageEvent {
  const _$FormsClearPageEventImpl(
      {required this.schemaKey, required this.pageKey});

  @override
  final String schemaKey;
  @override
  final String pageKey;

  @override
  String toString() {
    return 'FormsEvent.clearPage(schemaKey: $schemaKey, pageKey: $pageKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsClearPageEventImpl &&
            (identical(other.schemaKey, schemaKey) ||
                other.schemaKey == schemaKey) &&
            (identical(other.pageKey, pageKey) || other.pageKey == pageKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schemaKey, pageKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsClearPageEventImplCopyWith<_$FormsClearPageEventImpl> get copyWith =>
      __$$FormsClearPageEventImplCopyWithImpl<_$FormsClearPageEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> schemas) load,
    required TResult Function(String schemaKey, String key, dynamic value)
        updateField,
    required TResult Function(SchemaObject schema, String schemaKey) update,
    required TResult Function(String schemaKey, String key) clearField,
    required TResult Function(String schemaKey, String pageKey) clearPage,
    required TResult Function(String schemaKey) clearForm,
    required TResult Function(String schemaKey, bool isEdit) submit,
  }) {
    return clearPage(schemaKey, pageKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> schemas)? load,
    TResult? Function(String schemaKey, String key, dynamic value)? updateField,
    TResult? Function(SchemaObject schema, String schemaKey)? update,
    TResult? Function(String schemaKey, String key)? clearField,
    TResult? Function(String schemaKey, String pageKey)? clearPage,
    TResult? Function(String schemaKey)? clearForm,
    TResult? Function(String schemaKey, bool isEdit)? submit,
  }) {
    return clearPage?.call(schemaKey, pageKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> schemas)? load,
    TResult Function(String schemaKey, String key, dynamic value)? updateField,
    TResult Function(SchemaObject schema, String schemaKey)? update,
    TResult Function(String schemaKey, String key)? clearField,
    TResult Function(String schemaKey, String pageKey)? clearPage,
    TResult Function(String schemaKey)? clearForm,
    TResult Function(String schemaKey, bool isEdit)? submit,
    required TResult orElse(),
  }) {
    if (clearPage != null) {
      return clearPage(schemaKey, pageKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsUpdateEvent value) update,
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
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsUpdateEvent value)? update,
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
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsUpdateEvent value)? update,
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
  const factory FormsClearPageEvent(
      {required final String schemaKey,
      required final String pageKey}) = _$FormsClearPageEventImpl;

  String get schemaKey;
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
  @useResult
  $Res call({String schemaKey});
}

/// @nodoc
class __$$FormsClearFormEventImplCopyWithImpl<$Res>
    extends _$FormsEventCopyWithImpl<$Res, _$FormsClearFormEventImpl>
    implements _$$FormsClearFormEventImplCopyWith<$Res> {
  __$$FormsClearFormEventImplCopyWithImpl(_$FormsClearFormEventImpl _value,
      $Res Function(_$FormsClearFormEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schemaKey = null,
  }) {
    return _then(_$FormsClearFormEventImpl(
      schemaKey: null == schemaKey
          ? _value.schemaKey
          : schemaKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FormsClearFormEventImpl implements FormsClearFormEvent {
  const _$FormsClearFormEventImpl({required this.schemaKey});

  @override
  final String schemaKey;

  @override
  String toString() {
    return 'FormsEvent.clearForm(schemaKey: $schemaKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsClearFormEventImpl &&
            (identical(other.schemaKey, schemaKey) ||
                other.schemaKey == schemaKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schemaKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsClearFormEventImplCopyWith<_$FormsClearFormEventImpl> get copyWith =>
      __$$FormsClearFormEventImplCopyWithImpl<_$FormsClearFormEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> schemas) load,
    required TResult Function(String schemaKey, String key, dynamic value)
        updateField,
    required TResult Function(SchemaObject schema, String schemaKey) update,
    required TResult Function(String schemaKey, String key) clearField,
    required TResult Function(String schemaKey, String pageKey) clearPage,
    required TResult Function(String schemaKey) clearForm,
    required TResult Function(String schemaKey, bool isEdit) submit,
  }) {
    return clearForm(schemaKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> schemas)? load,
    TResult? Function(String schemaKey, String key, dynamic value)? updateField,
    TResult? Function(SchemaObject schema, String schemaKey)? update,
    TResult? Function(String schemaKey, String key)? clearField,
    TResult? Function(String schemaKey, String pageKey)? clearPage,
    TResult? Function(String schemaKey)? clearForm,
    TResult? Function(String schemaKey, bool isEdit)? submit,
  }) {
    return clearForm?.call(schemaKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> schemas)? load,
    TResult Function(String schemaKey, String key, dynamic value)? updateField,
    TResult Function(SchemaObject schema, String schemaKey)? update,
    TResult Function(String schemaKey, String key)? clearField,
    TResult Function(String schemaKey, String pageKey)? clearPage,
    TResult Function(String schemaKey)? clearForm,
    TResult Function(String schemaKey, bool isEdit)? submit,
    required TResult orElse(),
  }) {
    if (clearForm != null) {
      return clearForm(schemaKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsUpdateEvent value) update,
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
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsUpdateEvent value)? update,
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
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsUpdateEvent value)? update,
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
  const factory FormsClearFormEvent({required final String schemaKey}) =
      _$FormsClearFormEventImpl;

  String get schemaKey;
  @JsonKey(ignore: true)
  _$$FormsClearFormEventImplCopyWith<_$FormsClearFormEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormsSubmitEventImplCopyWith<$Res> {
  factory _$$FormsSubmitEventImplCopyWith(_$FormsSubmitEventImpl value,
          $Res Function(_$FormsSubmitEventImpl) then) =
      __$$FormsSubmitEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String schemaKey, bool isEdit});
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
    Object? schemaKey = null,
    Object? isEdit = null,
  }) {
    return _then(_$FormsSubmitEventImpl(
      schemaKey: null == schemaKey
          ? _value.schemaKey
          : schemaKey // ignore: cast_nullable_to_non_nullable
              as String,
      isEdit: null == isEdit
          ? _value.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FormsSubmitEventImpl implements FormsSubmitEvent {
  const _$FormsSubmitEventImpl({required this.schemaKey, this.isEdit = false});

  @override
  final String schemaKey;
  @override
  @JsonKey()
  final bool isEdit;

  @override
  String toString() {
    return 'FormsEvent.submit(schemaKey: $schemaKey, isEdit: $isEdit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsSubmitEventImpl &&
            (identical(other.schemaKey, schemaKey) ||
                other.schemaKey == schemaKey) &&
            (identical(other.isEdit, isEdit) || other.isEdit == isEdit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schemaKey, isEdit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsSubmitEventImplCopyWith<_$FormsSubmitEventImpl> get copyWith =>
      __$$FormsSubmitEventImplCopyWithImpl<_$FormsSubmitEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> schemas) load,
    required TResult Function(String schemaKey, String key, dynamic value)
        updateField,
    required TResult Function(SchemaObject schema, String schemaKey) update,
    required TResult Function(String schemaKey, String key) clearField,
    required TResult Function(String schemaKey, String pageKey) clearPage,
    required TResult Function(String schemaKey) clearForm,
    required TResult Function(String schemaKey, bool isEdit) submit,
  }) {
    return submit(schemaKey, isEdit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> schemas)? load,
    TResult? Function(String schemaKey, String key, dynamic value)? updateField,
    TResult? Function(SchemaObject schema, String schemaKey)? update,
    TResult? Function(String schemaKey, String key)? clearField,
    TResult? Function(String schemaKey, String pageKey)? clearPage,
    TResult? Function(String schemaKey)? clearForm,
    TResult? Function(String schemaKey, bool isEdit)? submit,
  }) {
    return submit?.call(schemaKey, isEdit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> schemas)? load,
    TResult Function(String schemaKey, String key, dynamic value)? updateField,
    TResult Function(SchemaObject schema, String schemaKey)? update,
    TResult Function(String schemaKey, String key)? clearField,
    TResult Function(String schemaKey, String pageKey)? clearPage,
    TResult Function(String schemaKey)? clearForm,
    TResult Function(String schemaKey, bool isEdit)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(schemaKey, isEdit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsUpdateEvent value) update,
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
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsUpdateEvent value)? update,
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
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsUpdateEvent value)? update,
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
  const factory FormsSubmitEvent(
      {required final String schemaKey,
      final bool isEdit}) = _$FormsSubmitEventImpl;

  String get schemaKey;
  bool get isEdit;
  @JsonKey(ignore: true)
  _$$FormsSubmitEventImplCopyWith<_$FormsSubmitEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FormsState {
  Map<String, SchemaObject> get cachedSchemas =>
      throw _privateConstructorUsedError;
  Map<String, SchemaObject> get initialSchemas =>
      throw _privateConstructorUsedError;
  String? get activeSchemaKey => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas, String? activeSchemaKey)
        $default, {
    required TResult Function(
            SchemaObject schema,
            Map<String, Map<String, dynamic>> formData,
            Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas,
            bool isEdit,
            String? activeSchemaKey)
        formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas, String? activeSchemaKey)?
        $default, {
    TResult? Function(
            SchemaObject schema,
            Map<String, Map<String, dynamic>> formData,
            Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas,
            bool isEdit,
            String? activeSchemaKey)?
        formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas, String? activeSchemaKey)?
        $default, {
    TResult Function(
            SchemaObject schema,
            Map<String, Map<String, dynamic>> formData,
            Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas,
            bool isEdit,
            String? activeSchemaKey)?
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
      {Map<String, SchemaObject> cachedSchemas,
      Map<String, SchemaObject> initialSchemas,
      String? activeSchemaKey});
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
    Object? cachedSchemas = null,
    Object? initialSchemas = null,
    Object? activeSchemaKey = freezed,
  }) {
    return _then(_value.copyWith(
      cachedSchemas: null == cachedSchemas
          ? _value.cachedSchemas
          : cachedSchemas // ignore: cast_nullable_to_non_nullable
              as Map<String, SchemaObject>,
      initialSchemas: null == initialSchemas
          ? _value.initialSchemas
          : initialSchemas // ignore: cast_nullable_to_non_nullable
              as Map<String, SchemaObject>,
      activeSchemaKey: freezed == activeSchemaKey
          ? _value.activeSchemaKey
          : activeSchemaKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      {Map<String, SchemaObject> cachedSchemas,
      Map<String, SchemaObject> initialSchemas,
      String? activeSchemaKey});
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
    Object? cachedSchemas = null,
    Object? initialSchemas = null,
    Object? activeSchemaKey = freezed,
  }) {
    return _then(_$FormsStateImpl(
      cachedSchemas: null == cachedSchemas
          ? _value._cachedSchemas
          : cachedSchemas // ignore: cast_nullable_to_non_nullable
              as Map<String, SchemaObject>,
      initialSchemas: null == initialSchemas
          ? _value._initialSchemas
          : initialSchemas // ignore: cast_nullable_to_non_nullable
              as Map<String, SchemaObject>,
      activeSchemaKey: freezed == activeSchemaKey
          ? _value.activeSchemaKey
          : activeSchemaKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FormsStateImpl implements _FormsState {
  const _$FormsStateImpl(
      {final Map<String, SchemaObject> cachedSchemas = const {},
      final Map<String, SchemaObject> initialSchemas = const {},
      this.activeSchemaKey})
      : _cachedSchemas = cachedSchemas,
        _initialSchemas = initialSchemas;

  final Map<String, SchemaObject> _cachedSchemas;
  @override
  @JsonKey()
  Map<String, SchemaObject> get cachedSchemas {
    if (_cachedSchemas is EqualUnmodifiableMapView) return _cachedSchemas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cachedSchemas);
  }

  final Map<String, SchemaObject> _initialSchemas;
  @override
  @JsonKey()
  Map<String, SchemaObject> get initialSchemas {
    if (_initialSchemas is EqualUnmodifiableMapView) return _initialSchemas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_initialSchemas);
  }

  @override
  final String? activeSchemaKey;

  @override
  String toString() {
    return 'FormsState(cachedSchemas: $cachedSchemas, initialSchemas: $initialSchemas, activeSchemaKey: $activeSchemaKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._cachedSchemas, _cachedSchemas) &&
            const DeepCollectionEquality()
                .equals(other._initialSchemas, _initialSchemas) &&
            (identical(other.activeSchemaKey, activeSchemaKey) ||
                other.activeSchemaKey == activeSchemaKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cachedSchemas),
      const DeepCollectionEquality().hash(_initialSchemas),
      activeSchemaKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsStateImplCopyWith<_$FormsStateImpl> get copyWith =>
      __$$FormsStateImplCopyWithImpl<_$FormsStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas, String? activeSchemaKey)
        $default, {
    required TResult Function(
            SchemaObject schema,
            Map<String, Map<String, dynamic>> formData,
            Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas,
            bool isEdit,
            String? activeSchemaKey)
        formSubmitted,
  }) {
    return $default(cachedSchemas, initialSchemas, activeSchemaKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas, String? activeSchemaKey)?
        $default, {
    TResult? Function(
            SchemaObject schema,
            Map<String, Map<String, dynamic>> formData,
            Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas,
            bool isEdit,
            String? activeSchemaKey)?
        formSubmitted,
  }) {
    return $default?.call(cachedSchemas, initialSchemas, activeSchemaKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas, String? activeSchemaKey)?
        $default, {
    TResult Function(
            SchemaObject schema,
            Map<String, Map<String, dynamic>> formData,
            Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas,
            bool isEdit,
            String? activeSchemaKey)?
        formSubmitted,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(cachedSchemas, initialSchemas, activeSchemaKey);
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
      {final Map<String, SchemaObject> cachedSchemas,
      final Map<String, SchemaObject> initialSchemas,
      final String? activeSchemaKey}) = _$FormsStateImpl;

  @override
  Map<String, SchemaObject> get cachedSchemas;
  @override
  Map<String, SchemaObject> get initialSchemas;
  @override
  String? get activeSchemaKey;
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
      {SchemaObject schema,
      Map<String, Map<String, dynamic>> formData,
      Map<String, SchemaObject> cachedSchemas,
      Map<String, SchemaObject> initialSchemas,
      bool isEdit,
      String? activeSchemaKey});

  $SchemaObjectCopyWith<$Res> get schema;
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
    Object? schema = null,
    Object? formData = null,
    Object? cachedSchemas = null,
    Object? initialSchemas = null,
    Object? isEdit = null,
    Object? activeSchemaKey = freezed,
  }) {
    return _then(_$FormsSubmittedStateImpl(
      schema: null == schema
          ? _value.schema
          : schema // ignore: cast_nullable_to_non_nullable
              as SchemaObject,
      formData: null == formData
          ? _value._formData
          : formData // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, dynamic>>,
      cachedSchemas: null == cachedSchemas
          ? _value._cachedSchemas
          : cachedSchemas // ignore: cast_nullable_to_non_nullable
              as Map<String, SchemaObject>,
      initialSchemas: null == initialSchemas
          ? _value._initialSchemas
          : initialSchemas // ignore: cast_nullable_to_non_nullable
              as Map<String, SchemaObject>,
      isEdit: null == isEdit
          ? _value.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      activeSchemaKey: freezed == activeSchemaKey
          ? _value.activeSchemaKey
          : activeSchemaKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SchemaObjectCopyWith<$Res> get schema {
    return $SchemaObjectCopyWith<$Res>(_value.schema, (value) {
      return _then(_value.copyWith(schema: value));
    });
  }
}

/// @nodoc

class _$FormsSubmittedStateImpl implements FormsSubmittedState {
  const _$FormsSubmittedStateImpl(
      {required this.schema,
      required final Map<String, Map<String, dynamic>> formData,
      required final Map<String, SchemaObject> cachedSchemas,
      required final Map<String, SchemaObject> initialSchemas,
      required this.isEdit,
      this.activeSchemaKey})
      : _formData = formData,
        _cachedSchemas = cachedSchemas,
        _initialSchemas = initialSchemas;

  @override
  final SchemaObject schema;
  final Map<String, Map<String, dynamic>> _formData;
  @override
  Map<String, Map<String, dynamic>> get formData {
    if (_formData is EqualUnmodifiableMapView) return _formData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_formData);
  }

  final Map<String, SchemaObject> _cachedSchemas;
  @override
  Map<String, SchemaObject> get cachedSchemas {
    if (_cachedSchemas is EqualUnmodifiableMapView) return _cachedSchemas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cachedSchemas);
  }

  final Map<String, SchemaObject> _initialSchemas;
  @override
  Map<String, SchemaObject> get initialSchemas {
    if (_initialSchemas is EqualUnmodifiableMapView) return _initialSchemas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_initialSchemas);
  }

  @override
  final bool isEdit;
  @override
  final String? activeSchemaKey;

  @override
  String toString() {
    return 'FormsState.formSubmitted(schema: $schema, formData: $formData, cachedSchemas: $cachedSchemas, initialSchemas: $initialSchemas, isEdit: $isEdit, activeSchemaKey: $activeSchemaKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormsSubmittedStateImpl &&
            (identical(other.schema, schema) || other.schema == schema) &&
            const DeepCollectionEquality().equals(other._formData, _formData) &&
            const DeepCollectionEquality()
                .equals(other._cachedSchemas, _cachedSchemas) &&
            const DeepCollectionEquality()
                .equals(other._initialSchemas, _initialSchemas) &&
            (identical(other.isEdit, isEdit) || other.isEdit == isEdit) &&
            (identical(other.activeSchemaKey, activeSchemaKey) ||
                other.activeSchemaKey == activeSchemaKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      schema,
      const DeepCollectionEquality().hash(_formData),
      const DeepCollectionEquality().hash(_cachedSchemas),
      const DeepCollectionEquality().hash(_initialSchemas),
      isEdit,
      activeSchemaKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormsSubmittedStateImplCopyWith<_$FormsSubmittedStateImpl> get copyWith =>
      __$$FormsSubmittedStateImplCopyWithImpl<_$FormsSubmittedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas, String? activeSchemaKey)
        $default, {
    required TResult Function(
            SchemaObject schema,
            Map<String, Map<String, dynamic>> formData,
            Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas,
            bool isEdit,
            String? activeSchemaKey)
        formSubmitted,
  }) {
    return formSubmitted(schema, formData, cachedSchemas, initialSchemas,
        isEdit, activeSchemaKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas, String? activeSchemaKey)?
        $default, {
    TResult? Function(
            SchemaObject schema,
            Map<String, Map<String, dynamic>> formData,
            Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas,
            bool isEdit,
            String? activeSchemaKey)?
        formSubmitted,
  }) {
    return formSubmitted?.call(schema, formData, cachedSchemas, initialSchemas,
        isEdit, activeSchemaKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas, String? activeSchemaKey)?
        $default, {
    TResult Function(
            SchemaObject schema,
            Map<String, Map<String, dynamic>> formData,
            Map<String, SchemaObject> cachedSchemas,
            Map<String, SchemaObject> initialSchemas,
            bool isEdit,
            String? activeSchemaKey)?
        formSubmitted,
    required TResult orElse(),
  }) {
    if (formSubmitted != null) {
      return formSubmitted(schema, formData, cachedSchemas, initialSchemas,
          isEdit, activeSchemaKey);
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
      {required final SchemaObject schema,
      required final Map<String, Map<String, dynamic>> formData,
      required final Map<String, SchemaObject> cachedSchemas,
      required final Map<String, SchemaObject> initialSchemas,
      required final bool isEdit,
      final String? activeSchemaKey}) = _$FormsSubmittedStateImpl;

  SchemaObject get schema;
  Map<String, Map<String, dynamic>> get formData;
  @override
  Map<String, SchemaObject> get cachedSchemas;
  @override
  Map<String, SchemaObject> get initialSchemas;
  bool get isEdit;
  @override
  String? get activeSchemaKey;
  @override
  @JsonKey(ignore: true)
  _$$FormsSubmittedStateImplCopyWith<_$FormsSubmittedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

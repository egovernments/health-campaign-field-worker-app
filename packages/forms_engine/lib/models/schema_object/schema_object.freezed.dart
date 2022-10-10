// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schema_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SchemaObject _$SchemaObjectFromJson(Map<String, dynamic> json) {
  return _SchemaObject.fromJson(json);
}

/// @nodoc
mixin _$SchemaObject {
  String get name => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  PropertySchema get schema => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchemaObjectCopyWith<SchemaObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchemaObjectCopyWith<$Res> {
  factory $SchemaObjectCopyWith(
          SchemaObject value, $Res Function(SchemaObject) then) =
      _$SchemaObjectCopyWithImpl<$Res>;
  $Res call({String name, int version, PropertySchema schema});

  $PropertySchemaCopyWith<$Res> get schema;
}

/// @nodoc
class _$SchemaObjectCopyWithImpl<$Res> implements $SchemaObjectCopyWith<$Res> {
  _$SchemaObjectCopyWithImpl(this._value, this._then);

  final SchemaObject _value;
  // ignore: unused_field
  final $Res Function(SchemaObject) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? version = freezed,
    Object? schema = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      schema: schema == freezed
          ? _value.schema
          : schema // ignore: cast_nullable_to_non_nullable
              as PropertySchema,
    ));
  }

  @override
  $PropertySchemaCopyWith<$Res> get schema {
    return $PropertySchemaCopyWith<$Res>(_value.schema, (value) {
      return _then(_value.copyWith(schema: value));
    });
  }
}

/// @nodoc
abstract class _$$_SchemaObjectCopyWith<$Res>
    implements $SchemaObjectCopyWith<$Res> {
  factory _$$_SchemaObjectCopyWith(
          _$_SchemaObject value, $Res Function(_$_SchemaObject) then) =
      __$$_SchemaObjectCopyWithImpl<$Res>;
  @override
  $Res call({String name, int version, PropertySchema schema});

  @override
  $PropertySchemaCopyWith<$Res> get schema;
}

/// @nodoc
class __$$_SchemaObjectCopyWithImpl<$Res>
    extends _$SchemaObjectCopyWithImpl<$Res>
    implements _$$_SchemaObjectCopyWith<$Res> {
  __$$_SchemaObjectCopyWithImpl(
      _$_SchemaObject _value, $Res Function(_$_SchemaObject) _then)
      : super(_value, (v) => _then(v as _$_SchemaObject));

  @override
  _$_SchemaObject get _value => super._value as _$_SchemaObject;

  @override
  $Res call({
    Object? name = freezed,
    Object? version = freezed,
    Object? schema = freezed,
  }) {
    return _then(_$_SchemaObject(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      schema: schema == freezed
          ? _value.schema
          : schema // ignore: cast_nullable_to_non_nullable
              as PropertySchema,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SchemaObject implements _SchemaObject {
  const _$_SchemaObject(
      {required this.name, required this.version, required this.schema});

  factory _$_SchemaObject.fromJson(Map<String, dynamic> json) =>
      _$$_SchemaObjectFromJson(json);

  @override
  final String name;
  @override
  final int version;
  @override
  final PropertySchema schema;

  @override
  String toString() {
    return 'SchemaObject(name: $name, version: $version, schema: $schema)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SchemaObject &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.schema, schema));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(schema));

  @JsonKey(ignore: true)
  @override
  _$$_SchemaObjectCopyWith<_$_SchemaObject> get copyWith =>
      __$$_SchemaObjectCopyWithImpl<_$_SchemaObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SchemaObjectToJson(
      this,
    );
  }
}

abstract class _SchemaObject implements SchemaObject {
  const factory _SchemaObject(
      {required final String name,
      required final int version,
      required final PropertySchema schema}) = _$_SchemaObject;

  factory _SchemaObject.fromJson(Map<String, dynamic> json) =
      _$_SchemaObject.fromJson;

  @override
  String get name;
  @override
  int get version;
  @override
  PropertySchema get schema;
  @override
  @JsonKey(ignore: true)
  _$$_SchemaObjectCopyWith<_$_SchemaObject> get copyWith =>
      throw _privateConstructorUsedError;
}

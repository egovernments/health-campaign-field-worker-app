// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'additional_fields_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdditionalFieldsModel _$AdditionalFieldsModelFromJson(
    Map<String, dynamic> json) {
  return _AdditionalFieldsModel.fromJson(json);
}

/// @nodoc
mixin _$AdditionalFieldsModel {
  String get schema => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  List<AdditionalFieldsObjectModel> get fields =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdditionalFieldsModelCopyWith<AdditionalFieldsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalFieldsModelCopyWith<$Res> {
  factory $AdditionalFieldsModelCopyWith(AdditionalFieldsModel value,
          $Res Function(AdditionalFieldsModel) then) =
      _$AdditionalFieldsModelCopyWithImpl<$Res>;
  $Res call(
      {String schema, int version, List<AdditionalFieldsObjectModel> fields});
}

/// @nodoc
class _$AdditionalFieldsModelCopyWithImpl<$Res>
    implements $AdditionalFieldsModelCopyWith<$Res> {
  _$AdditionalFieldsModelCopyWithImpl(this._value, this._then);

  final AdditionalFieldsModel _value;
  // ignore: unused_field
  final $Res Function(AdditionalFieldsModel) _then;

  @override
  $Res call({
    Object? schema = freezed,
    Object? version = freezed,
    Object? fields = freezed,
  }) {
    return _then(_value.copyWith(
      schema: schema == freezed
          ? _value.schema
          : schema // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      fields: fields == freezed
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<AdditionalFieldsObjectModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_AdditionalFieldsModelCopyWith<$Res>
    implements $AdditionalFieldsModelCopyWith<$Res> {
  factory _$$_AdditionalFieldsModelCopyWith(_$_AdditionalFieldsModel value,
          $Res Function(_$_AdditionalFieldsModel) then) =
      __$$_AdditionalFieldsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String schema, int version, List<AdditionalFieldsObjectModel> fields});
}

/// @nodoc
class __$$_AdditionalFieldsModelCopyWithImpl<$Res>
    extends _$AdditionalFieldsModelCopyWithImpl<$Res>
    implements _$$_AdditionalFieldsModelCopyWith<$Res> {
  __$$_AdditionalFieldsModelCopyWithImpl(_$_AdditionalFieldsModel _value,
      $Res Function(_$_AdditionalFieldsModel) _then)
      : super(_value, (v) => _then(v as _$_AdditionalFieldsModel));

  @override
  _$_AdditionalFieldsModel get _value =>
      super._value as _$_AdditionalFieldsModel;

  @override
  $Res call({
    Object? schema = freezed,
    Object? version = freezed,
    Object? fields = freezed,
  }) {
    return _then(_$_AdditionalFieldsModel(
      schema: schema == freezed
          ? _value.schema
          : schema // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      fields: fields == freezed
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<AdditionalFieldsObjectModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_AdditionalFieldsModel implements _AdditionalFieldsModel {
  const _$_AdditionalFieldsModel(
      {required this.schema,
      required this.version,
      required final List<AdditionalFieldsObjectModel> fields})
      : _fields = fields;

  factory _$_AdditionalFieldsModel.fromJson(Map<String, dynamic> json) =>
      _$$_AdditionalFieldsModelFromJson(json);

  @override
  final String schema;
  @override
  final int version;
  final List<AdditionalFieldsObjectModel> _fields;
  @override
  List<AdditionalFieldsObjectModel> get fields {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  String toString() {
    return 'AdditionalFieldsModel(schema: $schema, version: $version, fields: $fields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdditionalFieldsModel &&
            const DeepCollectionEquality().equals(other.schema, schema) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(schema),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(_fields));

  @JsonKey(ignore: true)
  @override
  _$$_AdditionalFieldsModelCopyWith<_$_AdditionalFieldsModel> get copyWith =>
      __$$_AdditionalFieldsModelCopyWithImpl<_$_AdditionalFieldsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdditionalFieldsModelToJson(
      this,
    );
  }
}

abstract class _AdditionalFieldsModel implements AdditionalFieldsModel {
  const factory _AdditionalFieldsModel(
          {required final String schema,
          required final int version,
          required final List<AdditionalFieldsObjectModel> fields}) =
      _$_AdditionalFieldsModel;

  factory _AdditionalFieldsModel.fromJson(Map<String, dynamic> json) =
      _$_AdditionalFieldsModel.fromJson;

  @override
  String get schema;
  @override
  int get version;
  @override
  List<AdditionalFieldsObjectModel> get fields;
  @override
  @JsonKey(ignore: true)
  _$$_AdditionalFieldsModelCopyWith<_$_AdditionalFieldsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AdditionalFieldsObjectModel _$AdditionalFieldsObjectModelFromJson(
    Map<String, dynamic> json) {
  return _AdditionalFieldsObjectModel.fromJson(json);
}

/// @nodoc
mixin _$AdditionalFieldsObjectModel {
  String get key => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdditionalFieldsObjectModelCopyWith<AdditionalFieldsObjectModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalFieldsObjectModelCopyWith<$Res> {
  factory $AdditionalFieldsObjectModelCopyWith(
          AdditionalFieldsObjectModel value,
          $Res Function(AdditionalFieldsObjectModel) then) =
      _$AdditionalFieldsObjectModelCopyWithImpl<$Res>;
  $Res call({String key, String value});
}

/// @nodoc
class _$AdditionalFieldsObjectModelCopyWithImpl<$Res>
    implements $AdditionalFieldsObjectModelCopyWith<$Res> {
  _$AdditionalFieldsObjectModelCopyWithImpl(this._value, this._then);

  final AdditionalFieldsObjectModel _value;
  // ignore: unused_field
  final $Res Function(AdditionalFieldsObjectModel) _then;

  @override
  $Res call({
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AdditionalFieldsObjectModelCopyWith<$Res>
    implements $AdditionalFieldsObjectModelCopyWith<$Res> {
  factory _$$_AdditionalFieldsObjectModelCopyWith(
          _$_AdditionalFieldsObjectModel value,
          $Res Function(_$_AdditionalFieldsObjectModel) then) =
      __$$_AdditionalFieldsObjectModelCopyWithImpl<$Res>;
  @override
  $Res call({String key, String value});
}

/// @nodoc
class __$$_AdditionalFieldsObjectModelCopyWithImpl<$Res>
    extends _$AdditionalFieldsObjectModelCopyWithImpl<$Res>
    implements _$$_AdditionalFieldsObjectModelCopyWith<$Res> {
  __$$_AdditionalFieldsObjectModelCopyWithImpl(
      _$_AdditionalFieldsObjectModel _value,
      $Res Function(_$_AdditionalFieldsObjectModel) _then)
      : super(_value, (v) => _then(v as _$_AdditionalFieldsObjectModel));

  @override
  _$_AdditionalFieldsObjectModel get _value =>
      super._value as _$_AdditionalFieldsObjectModel;

  @override
  $Res call({
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_AdditionalFieldsObjectModel(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdditionalFieldsObjectModel implements _AdditionalFieldsObjectModel {
  const _$_AdditionalFieldsObjectModel(
      {required this.key, required this.value});

  factory _$_AdditionalFieldsObjectModel.fromJson(Map<String, dynamic> json) =>
      _$$_AdditionalFieldsObjectModelFromJson(json);

  @override
  final String key;
  @override
  final String value;

  @override
  String toString() {
    return 'AdditionalFieldsObjectModel(key: $key, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdditionalFieldsObjectModel &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_AdditionalFieldsObjectModelCopyWith<_$_AdditionalFieldsObjectModel>
      get copyWith => __$$_AdditionalFieldsObjectModelCopyWithImpl<
          _$_AdditionalFieldsObjectModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdditionalFieldsObjectModelToJson(
      this,
    );
  }
}

abstract class _AdditionalFieldsObjectModel
    implements AdditionalFieldsObjectModel {
  const factory _AdditionalFieldsObjectModel(
      {required final String key,
      required final String value}) = _$_AdditionalFieldsObjectModel;

  factory _AdditionalFieldsObjectModel.fromJson(Map<String, dynamic> json) =
      _$_AdditionalFieldsObjectModel.fromJson;

  @override
  String get key;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_AdditionalFieldsObjectModelCopyWith<_$_AdditionalFieldsObjectModel>
      get copyWith => throw _privateConstructorUsedError;
}

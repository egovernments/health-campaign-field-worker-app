// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'property_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PropertySchema _$PropertySchemaFromJson(Map<String, dynamic> json) {
  return _PropertySchema.fromJson(json);
}

/// @nodoc
mixin _$PropertySchema {
  @JsonKey(name: 'type')
  PropertySchemaType get type => throw _privateConstructorUsedError;
  Map<String, PropertySchema>? get properties =>
      throw _privateConstructorUsedError;
  List<String>? get required => throw _privateConstructorUsedError;
  List<String>? get enums => throw _privateConstructorUsedError;
  PropertySchemaFormat? get format => throw _privateConstructorUsedError;
  DateFormatValue? get firstDate => throw _privateConstructorUsedError;
  DateFormatValue? get lastDate => throw _privateConstructorUsedError;
  int? get minLength => throw _privateConstructorUsedError;
  int? get maxLength => throw _privateConstructorUsedError;
  String? get hint => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PropertySchemaCopyWith<PropertySchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertySchemaCopyWith<$Res> {
  factory $PropertySchemaCopyWith(
          PropertySchema value, $Res Function(PropertySchema) then) =
      _$PropertySchemaCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'type') PropertySchemaType type,
      Map<String, PropertySchema>? properties,
      List<String>? required,
      List<String>? enums,
      PropertySchemaFormat? format,
      DateFormatValue? firstDate,
      DateFormatValue? lastDate,
      int? minLength,
      int? maxLength,
      String? hint,
      String? label,
      dynamic value});

  $DateFormatValueCopyWith<$Res>? get firstDate;
  $DateFormatValueCopyWith<$Res>? get lastDate;
}

/// @nodoc
class _$PropertySchemaCopyWithImpl<$Res>
    implements $PropertySchemaCopyWith<$Res> {
  _$PropertySchemaCopyWithImpl(this._value, this._then);

  final PropertySchema _value;
  // ignore: unused_field
  final $Res Function(PropertySchema) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? properties = freezed,
    Object? required = freezed,
    Object? enums = freezed,
    Object? format = freezed,
    Object? firstDate = freezed,
    Object? lastDate = freezed,
    Object? minLength = freezed,
    Object? maxLength = freezed,
    Object? hint = freezed,
    Object? label = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PropertySchemaType,
      properties: properties == freezed
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, PropertySchema>?,
      required: required == freezed
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      enums: enums == freezed
          ? _value.enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      format: format == freezed
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as PropertySchemaFormat?,
      firstDate: firstDate == freezed
          ? _value.firstDate
          : firstDate // ignore: cast_nullable_to_non_nullable
              as DateFormatValue?,
      lastDate: lastDate == freezed
          ? _value.lastDate
          : lastDate // ignore: cast_nullable_to_non_nullable
              as DateFormatValue?,
      minLength: minLength == freezed
          ? _value.minLength
          : minLength // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLength: maxLength == freezed
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int?,
      hint: hint == freezed
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  @override
  $DateFormatValueCopyWith<$Res>? get firstDate {
    if (_value.firstDate == null) {
      return null;
    }

    return $DateFormatValueCopyWith<$Res>(_value.firstDate!, (value) {
      return _then(_value.copyWith(firstDate: value));
    });
  }

  @override
  $DateFormatValueCopyWith<$Res>? get lastDate {
    if (_value.lastDate == null) {
      return null;
    }

    return $DateFormatValueCopyWith<$Res>(_value.lastDate!, (value) {
      return _then(_value.copyWith(lastDate: value));
    });
  }
}

/// @nodoc
abstract class _$$_PropertySchemaCopyWith<$Res>
    implements $PropertySchemaCopyWith<$Res> {
  factory _$$_PropertySchemaCopyWith(
          _$_PropertySchema value, $Res Function(_$_PropertySchema) then) =
      __$$_PropertySchemaCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'type') PropertySchemaType type,
      Map<String, PropertySchema>? properties,
      List<String>? required,
      List<String>? enums,
      PropertySchemaFormat? format,
      DateFormatValue? firstDate,
      DateFormatValue? lastDate,
      int? minLength,
      int? maxLength,
      String? hint,
      String? label,
      dynamic value});

  @override
  $DateFormatValueCopyWith<$Res>? get firstDate;
  @override
  $DateFormatValueCopyWith<$Res>? get lastDate;
}

/// @nodoc
class __$$_PropertySchemaCopyWithImpl<$Res>
    extends _$PropertySchemaCopyWithImpl<$Res>
    implements _$$_PropertySchemaCopyWith<$Res> {
  __$$_PropertySchemaCopyWithImpl(
      _$_PropertySchema _value, $Res Function(_$_PropertySchema) _then)
      : super(_value, (v) => _then(v as _$_PropertySchema));

  @override
  _$_PropertySchema get _value => super._value as _$_PropertySchema;

  @override
  $Res call({
    Object? type = freezed,
    Object? properties = freezed,
    Object? required = freezed,
    Object? enums = freezed,
    Object? format = freezed,
    Object? firstDate = freezed,
    Object? lastDate = freezed,
    Object? minLength = freezed,
    Object? maxLength = freezed,
    Object? hint = freezed,
    Object? label = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_PropertySchema(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PropertySchemaType,
      properties: properties == freezed
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, PropertySchema>?,
      required: required == freezed
          ? _value._required
          : required // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      enums: enums == freezed
          ? _value._enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      format: format == freezed
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as PropertySchemaFormat?,
      firstDate: firstDate == freezed
          ? _value.firstDate
          : firstDate // ignore: cast_nullable_to_non_nullable
              as DateFormatValue?,
      lastDate: lastDate == freezed
          ? _value.lastDate
          : lastDate // ignore: cast_nullable_to_non_nullable
              as DateFormatValue?,
      minLength: minLength == freezed
          ? _value.minLength
          : minLength // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLength: maxLength == freezed
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int?,
      hint: hint == freezed
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_PropertySchema implements _PropertySchema {
  const _$_PropertySchema(
      {@JsonKey(name: 'type') required this.type,
      final Map<String, PropertySchema>? properties,
      final List<String>? required,
      final List<String>? enums,
      this.format,
      this.firstDate,
      this.lastDate,
      this.minLength,
      this.maxLength,
      this.hint,
      this.label,
      this.value})
      : _properties = properties,
        _required = required,
        _enums = enums;

  factory _$_PropertySchema.fromJson(Map<String, dynamic> json) =>
      _$$_PropertySchemaFromJson(json);

  @override
  @JsonKey(name: 'type')
  final PropertySchemaType type;
  final Map<String, PropertySchema>? _properties;
  @override
  Map<String, PropertySchema>? get properties {
    final value = _properties;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<String>? _required;
  @override
  List<String>? get required {
    final value = _required;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _enums;
  @override
  List<String>? get enums {
    final value = _enums;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PropertySchemaFormat? format;
  @override
  final DateFormatValue? firstDate;
  @override
  final DateFormatValue? lastDate;
  @override
  final int? minLength;
  @override
  final int? maxLength;
  @override
  final String? hint;
  @override
  final String? label;
  @override
  final dynamic value;

  @override
  String toString() {
    return 'PropertySchema(type: $type, properties: $properties, required: $required, enums: $enums, format: $format, firstDate: $firstDate, lastDate: $lastDate, minLength: $minLength, maxLength: $maxLength, hint: $hint, label: $label, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PropertySchema &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            const DeepCollectionEquality().equals(other._required, _required) &&
            const DeepCollectionEquality().equals(other._enums, _enums) &&
            const DeepCollectionEquality().equals(other.format, format) &&
            const DeepCollectionEquality().equals(other.firstDate, firstDate) &&
            const DeepCollectionEquality().equals(other.lastDate, lastDate) &&
            const DeepCollectionEquality().equals(other.minLength, minLength) &&
            const DeepCollectionEquality().equals(other.maxLength, maxLength) &&
            const DeepCollectionEquality().equals(other.hint, hint) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(_properties),
      const DeepCollectionEquality().hash(_required),
      const DeepCollectionEquality().hash(_enums),
      const DeepCollectionEquality().hash(format),
      const DeepCollectionEquality().hash(firstDate),
      const DeepCollectionEquality().hash(lastDate),
      const DeepCollectionEquality().hash(minLength),
      const DeepCollectionEquality().hash(maxLength),
      const DeepCollectionEquality().hash(hint),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_PropertySchemaCopyWith<_$_PropertySchema> get copyWith =>
      __$$_PropertySchemaCopyWithImpl<_$_PropertySchema>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PropertySchemaToJson(
      this,
    );
  }
}

abstract class _PropertySchema implements PropertySchema {
  const factory _PropertySchema(
      {@JsonKey(name: 'type') required final PropertySchemaType type,
      final Map<String, PropertySchema>? properties,
      final List<String>? required,
      final List<String>? enums,
      final PropertySchemaFormat? format,
      final DateFormatValue? firstDate,
      final DateFormatValue? lastDate,
      final int? minLength,
      final int? maxLength,
      final String? hint,
      final String? label,
      final dynamic value}) = _$_PropertySchema;

  factory _PropertySchema.fromJson(Map<String, dynamic> json) =
      _$_PropertySchema.fromJson;

  @override
  @JsonKey(name: 'type')
  PropertySchemaType get type;
  @override
  Map<String, PropertySchema>? get properties;
  @override
  List<String>? get required;
  @override
  List<String>? get enums;
  @override
  PropertySchemaFormat? get format;
  @override
  DateFormatValue? get firstDate;
  @override
  DateFormatValue? get lastDate;
  @override
  int? get minLength;
  @override
  int? get maxLength;
  @override
  String? get hint;
  @override
  String? get label;
  @override
  dynamic get value;
  @override
  @JsonKey(ignore: true)
  _$$_PropertySchemaCopyWith<_$_PropertySchema> get copyWith =>
      throw _privateConstructorUsedError;
}

DateFormatValue _$DateFormatValueFromJson(Map<String, dynamic> json) {
  return _DateFormatValue.fromJson(json);
}

/// @nodoc
mixin _$DateFormatValue {
  String get value => throw _privateConstructorUsedError;
  String get format => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DateFormatValueCopyWith<DateFormatValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateFormatValueCopyWith<$Res> {
  factory $DateFormatValueCopyWith(
          DateFormatValue value, $Res Function(DateFormatValue) then) =
      _$DateFormatValueCopyWithImpl<$Res>;
  $Res call({String value, String format});
}

/// @nodoc
class _$DateFormatValueCopyWithImpl<$Res>
    implements $DateFormatValueCopyWith<$Res> {
  _$DateFormatValueCopyWithImpl(this._value, this._then);

  final DateFormatValue _value;
  // ignore: unused_field
  final $Res Function(DateFormatValue) _then;

  @override
  $Res call({
    Object? value = freezed,
    Object? format = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      format: format == freezed
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DateFormatValueCopyWith<$Res>
    implements $DateFormatValueCopyWith<$Res> {
  factory _$$_DateFormatValueCopyWith(
          _$_DateFormatValue value, $Res Function(_$_DateFormatValue) then) =
      __$$_DateFormatValueCopyWithImpl<$Res>;
  @override
  $Res call({String value, String format});
}

/// @nodoc
class __$$_DateFormatValueCopyWithImpl<$Res>
    extends _$DateFormatValueCopyWithImpl<$Res>
    implements _$$_DateFormatValueCopyWith<$Res> {
  __$$_DateFormatValueCopyWithImpl(
      _$_DateFormatValue _value, $Res Function(_$_DateFormatValue) _then)
      : super(_value, (v) => _then(v as _$_DateFormatValue));

  @override
  _$_DateFormatValue get _value => super._value as _$_DateFormatValue;

  @override
  $Res call({
    Object? value = freezed,
    Object? format = freezed,
  }) {
    return _then(_$_DateFormatValue(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      format: format == freezed
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DateFormatValue extends _DateFormatValue {
  const _$_DateFormatValue({required this.value, this.format = 'yyyy-MM-dd'})
      : super._();

  factory _$_DateFormatValue.fromJson(Map<String, dynamic> json) =>
      _$$_DateFormatValueFromJson(json);

  @override
  final String value;
  @override
  @JsonKey()
  final String format;

  @override
  String toString() {
    return 'DateFormatValue(value: $value, format: $format)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DateFormatValue &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.format, format));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(format));

  @JsonKey(ignore: true)
  @override
  _$$_DateFormatValueCopyWith<_$_DateFormatValue> get copyWith =>
      __$$_DateFormatValueCopyWithImpl<_$_DateFormatValue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DateFormatValueToJson(
      this,
    );
  }
}

abstract class _DateFormatValue extends DateFormatValue {
  const factory _DateFormatValue(
      {required final String value, final String format}) = _$_DateFormatValue;
  const _DateFormatValue._() : super._();

  factory _DateFormatValue.fromJson(Map<String, dynamic> json) =
      _$_DateFormatValue.fromJson;

  @override
  String get value;
  @override
  String get format;
  @override
  @JsonKey(ignore: true)
  _$$_DateFormatValueCopyWith<_$_DateFormatValue> get copyWith =>
      throw _privateConstructorUsedError;
}

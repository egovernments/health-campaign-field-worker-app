// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PropertySchema _$PropertySchemaFromJson(Map<String, dynamic> json) {
  return _PropertySchema.fromJson(json);
}

/// @nodoc
mixin _$PropertySchema {
  @JsonKey(name: 'type')
  PropertySchemaType get type => throw _privateConstructorUsedError;
  bool? get readonly => throw _privateConstructorUsedError;
  bool? get displayOnly => throw _privateConstructorUsedError;
  Map<String, PropertySchema>? get properties =>
      throw _privateConstructorUsedError;
  List<String>? get required => throw _privateConstructorUsedError;
  List<String>? get enums => throw _privateConstructorUsedError;
  PropertySchemaFormat? get format => throw _privateConstructorUsedError;
  DateFormatValue? get firstDate => throw _privateConstructorUsedError;
  DateFormatValue? get lastDate => throw _privateConstructorUsedError;
  int? get minLength => throw _privateConstructorUsedError;
  int? get maxLength => throw _privateConstructorUsedError;
  num? get maximum => throw _privateConstructorUsedError;
  num? get minimum => throw _privateConstructorUsedError;
  String? get hint => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  DisplayBehavior? get displayBehavior => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PropertySchemaCopyWith<PropertySchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertySchemaCopyWith<$Res> {
  factory $PropertySchemaCopyWith(
          PropertySchema value, $Res Function(PropertySchema) then) =
      _$PropertySchemaCopyWithImpl<$Res, PropertySchema>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type') PropertySchemaType type,
      bool? readonly,
      bool? displayOnly,
      Map<String, PropertySchema>? properties,
      List<String>? required,
      List<String>? enums,
      PropertySchemaFormat? format,
      DateFormatValue? firstDate,
      DateFormatValue? lastDate,
      int? minLength,
      int? maxLength,
      num? maximum,
      num? minimum,
      String? hint,
      String? label,
      dynamic value,
      DisplayBehavior? displayBehavior});

  $DateFormatValueCopyWith<$Res>? get firstDate;
  $DateFormatValueCopyWith<$Res>? get lastDate;
  $DisplayBehaviorCopyWith<$Res>? get displayBehavior;
}

/// @nodoc
class _$PropertySchemaCopyWithImpl<$Res, $Val extends PropertySchema>
    implements $PropertySchemaCopyWith<$Res> {
  _$PropertySchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? readonly = freezed,
    Object? displayOnly = freezed,
    Object? properties = freezed,
    Object? required = freezed,
    Object? enums = freezed,
    Object? format = freezed,
    Object? firstDate = freezed,
    Object? lastDate = freezed,
    Object? minLength = freezed,
    Object? maxLength = freezed,
    Object? maximum = freezed,
    Object? minimum = freezed,
    Object? hint = freezed,
    Object? label = freezed,
    Object? value = freezed,
    Object? displayBehavior = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PropertySchemaType,
      readonly: freezed == readonly
          ? _value.readonly
          : readonly // ignore: cast_nullable_to_non_nullable
              as bool?,
      displayOnly: freezed == displayOnly
          ? _value.displayOnly
          : displayOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      properties: freezed == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, PropertySchema>?,
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      enums: freezed == enums
          ? _value.enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as PropertySchemaFormat?,
      firstDate: freezed == firstDate
          ? _value.firstDate
          : firstDate // ignore: cast_nullable_to_non_nullable
              as DateFormatValue?,
      lastDate: freezed == lastDate
          ? _value.lastDate
          : lastDate // ignore: cast_nullable_to_non_nullable
              as DateFormatValue?,
      minLength: freezed == minLength
          ? _value.minLength
          : minLength // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLength: freezed == maxLength
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int?,
      maximum: freezed == maximum
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as num?,
      minimum: freezed == minimum
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as num?,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      displayBehavior: freezed == displayBehavior
          ? _value.displayBehavior
          : displayBehavior // ignore: cast_nullable_to_non_nullable
              as DisplayBehavior?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DateFormatValueCopyWith<$Res>? get firstDate {
    if (_value.firstDate == null) {
      return null;
    }

    return $DateFormatValueCopyWith<$Res>(_value.firstDate!, (value) {
      return _then(_value.copyWith(firstDate: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DateFormatValueCopyWith<$Res>? get lastDate {
    if (_value.lastDate == null) {
      return null;
    }

    return $DateFormatValueCopyWith<$Res>(_value.lastDate!, (value) {
      return _then(_value.copyWith(lastDate: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DisplayBehaviorCopyWith<$Res>? get displayBehavior {
    if (_value.displayBehavior == null) {
      return null;
    }

    return $DisplayBehaviorCopyWith<$Res>(_value.displayBehavior!, (value) {
      return _then(_value.copyWith(displayBehavior: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PropertySchemaImplCopyWith<$Res>
    implements $PropertySchemaCopyWith<$Res> {
  factory _$$PropertySchemaImplCopyWith(_$PropertySchemaImpl value,
          $Res Function(_$PropertySchemaImpl) then) =
      __$$PropertySchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type') PropertySchemaType type,
      bool? readonly,
      bool? displayOnly,
      Map<String, PropertySchema>? properties,
      List<String>? required,
      List<String>? enums,
      PropertySchemaFormat? format,
      DateFormatValue? firstDate,
      DateFormatValue? lastDate,
      int? minLength,
      int? maxLength,
      num? maximum,
      num? minimum,
      String? hint,
      String? label,
      dynamic value,
      DisplayBehavior? displayBehavior});

  @override
  $DateFormatValueCopyWith<$Res>? get firstDate;
  @override
  $DateFormatValueCopyWith<$Res>? get lastDate;
  @override
  $DisplayBehaviorCopyWith<$Res>? get displayBehavior;
}

/// @nodoc
class __$$PropertySchemaImplCopyWithImpl<$Res>
    extends _$PropertySchemaCopyWithImpl<$Res, _$PropertySchemaImpl>
    implements _$$PropertySchemaImplCopyWith<$Res> {
  __$$PropertySchemaImplCopyWithImpl(
      _$PropertySchemaImpl _value, $Res Function(_$PropertySchemaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? readonly = freezed,
    Object? displayOnly = freezed,
    Object? properties = freezed,
    Object? required = freezed,
    Object? enums = freezed,
    Object? format = freezed,
    Object? firstDate = freezed,
    Object? lastDate = freezed,
    Object? minLength = freezed,
    Object? maxLength = freezed,
    Object? maximum = freezed,
    Object? minimum = freezed,
    Object? hint = freezed,
    Object? label = freezed,
    Object? value = freezed,
    Object? displayBehavior = freezed,
  }) {
    return _then(_$PropertySchemaImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PropertySchemaType,
      readonly: freezed == readonly
          ? _value.readonly
          : readonly // ignore: cast_nullable_to_non_nullable
              as bool?,
      displayOnly: freezed == displayOnly
          ? _value.displayOnly
          : displayOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      properties: freezed == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, PropertySchema>?,
      required: freezed == required
          ? _value._required
          : required // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      enums: freezed == enums
          ? _value._enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as PropertySchemaFormat?,
      firstDate: freezed == firstDate
          ? _value.firstDate
          : firstDate // ignore: cast_nullable_to_non_nullable
              as DateFormatValue?,
      lastDate: freezed == lastDate
          ? _value.lastDate
          : lastDate // ignore: cast_nullable_to_non_nullable
              as DateFormatValue?,
      minLength: freezed == minLength
          ? _value.minLength
          : minLength // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLength: freezed == maxLength
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int?,
      maximum: freezed == maximum
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as num?,
      minimum: freezed == minimum
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as num?,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      displayBehavior: freezed == displayBehavior
          ? _value.displayBehavior
          : displayBehavior // ignore: cast_nullable_to_non_nullable
              as DisplayBehavior?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$PropertySchemaImpl implements _PropertySchema {
  const _$PropertySchemaImpl(
      {@JsonKey(name: 'type') required this.type,
      this.readonly,
      this.displayOnly,
      final Map<String, PropertySchema>? properties,
      final List<String>? required,
      final List<String>? enums,
      this.format,
      this.firstDate,
      this.lastDate,
      this.minLength,
      this.maxLength,
      this.maximum,
      this.minimum,
      this.hint,
      this.label,
      this.value,
      this.displayBehavior})
      : _properties = properties,
        _required = required,
        _enums = enums;

  factory _$PropertySchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertySchemaImplFromJson(json);

  @override
  @JsonKey(name: 'type')
  final PropertySchemaType type;
  @override
  final bool? readonly;
  @override
  final bool? displayOnly;
  final Map<String, PropertySchema>? _properties;
  @override
  Map<String, PropertySchema>? get properties {
    final value = _properties;
    if (value == null) return null;
    if (_properties is EqualUnmodifiableMapView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<String>? _required;
  @override
  List<String>? get required {
    final value = _required;
    if (value == null) return null;
    if (_required is EqualUnmodifiableListView) return _required;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _enums;
  @override
  List<String>? get enums {
    final value = _enums;
    if (value == null) return null;
    if (_enums is EqualUnmodifiableListView) return _enums;
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
  final num? maximum;
  @override
  final num? minimum;
  @override
  final String? hint;
  @override
  final String? label;
  @override
  final dynamic value;
  @override
  final DisplayBehavior? displayBehavior;

  @override
  String toString() {
    return 'PropertySchema(type: $type, readonly: $readonly, displayOnly: $displayOnly, properties: $properties, required: $required, enums: $enums, format: $format, firstDate: $firstDate, lastDate: $lastDate, minLength: $minLength, maxLength: $maxLength, maximum: $maximum, minimum: $minimum, hint: $hint, label: $label, value: $value, displayBehavior: $displayBehavior)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertySchemaImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.readonly, readonly) ||
                other.readonly == readonly) &&
            (identical(other.displayOnly, displayOnly) ||
                other.displayOnly == displayOnly) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            const DeepCollectionEquality().equals(other._required, _required) &&
            const DeepCollectionEquality().equals(other._enums, _enums) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.firstDate, firstDate) ||
                other.firstDate == firstDate) &&
            (identical(other.lastDate, lastDate) ||
                other.lastDate == lastDate) &&
            (identical(other.minLength, minLength) ||
                other.minLength == minLength) &&
            (identical(other.maxLength, maxLength) ||
                other.maxLength == maxLength) &&
            (identical(other.maximum, maximum) || other.maximum == maximum) &&
            (identical(other.minimum, minimum) || other.minimum == minimum) &&
            (identical(other.hint, hint) || other.hint == hint) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.displayBehavior, displayBehavior) ||
                other.displayBehavior == displayBehavior));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      readonly,
      displayOnly,
      const DeepCollectionEquality().hash(_properties),
      const DeepCollectionEquality().hash(_required),
      const DeepCollectionEquality().hash(_enums),
      format,
      firstDate,
      lastDate,
      minLength,
      maxLength,
      maximum,
      minimum,
      hint,
      label,
      const DeepCollectionEquality().hash(value),
      displayBehavior);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertySchemaImplCopyWith<_$PropertySchemaImpl> get copyWith =>
      __$$PropertySchemaImplCopyWithImpl<_$PropertySchemaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertySchemaImplToJson(
      this,
    );
  }
}

abstract class _PropertySchema implements PropertySchema {
  const factory _PropertySchema(
      {@JsonKey(name: 'type') required final PropertySchemaType type,
      final bool? readonly,
      final bool? displayOnly,
      final Map<String, PropertySchema>? properties,
      final List<String>? required,
      final List<String>? enums,
      final PropertySchemaFormat? format,
      final DateFormatValue? firstDate,
      final DateFormatValue? lastDate,
      final int? minLength,
      final int? maxLength,
      final num? maximum,
      final num? minimum,
      final String? hint,
      final String? label,
      final dynamic value,
      final DisplayBehavior? displayBehavior}) = _$PropertySchemaImpl;

  factory _PropertySchema.fromJson(Map<String, dynamic> json) =
      _$PropertySchemaImpl.fromJson;

  @override
  @JsonKey(name: 'type')
  PropertySchemaType get type;
  @override
  bool? get readonly;
  @override
  bool? get displayOnly;
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
  num? get maximum;
  @override
  num? get minimum;
  @override
  String? get hint;
  @override
  String? get label;
  @override
  dynamic get value;
  @override
  DisplayBehavior? get displayBehavior;
  @override
  @JsonKey(ignore: true)
  _$$PropertySchemaImplCopyWith<_$PropertySchemaImpl> get copyWith =>
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
      _$DateFormatValueCopyWithImpl<$Res, DateFormatValue>;
  @useResult
  $Res call({String value, String format});
}

/// @nodoc
class _$DateFormatValueCopyWithImpl<$Res, $Val extends DateFormatValue>
    implements $DateFormatValueCopyWith<$Res> {
  _$DateFormatValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? format = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateFormatValueImplCopyWith<$Res>
    implements $DateFormatValueCopyWith<$Res> {
  factory _$$DateFormatValueImplCopyWith(_$DateFormatValueImpl value,
          $Res Function(_$DateFormatValueImpl) then) =
      __$$DateFormatValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String format});
}

/// @nodoc
class __$$DateFormatValueImplCopyWithImpl<$Res>
    extends _$DateFormatValueCopyWithImpl<$Res, _$DateFormatValueImpl>
    implements _$$DateFormatValueImplCopyWith<$Res> {
  __$$DateFormatValueImplCopyWithImpl(
      _$DateFormatValueImpl _value, $Res Function(_$DateFormatValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? format = null,
  }) {
    return _then(_$DateFormatValueImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DateFormatValueImpl extends _DateFormatValue {
  const _$DateFormatValueImpl({required this.value, this.format = 'yyyy-MM-dd'})
      : super._();

  factory _$DateFormatValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$DateFormatValueImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateFormatValueImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.format, format) || other.format == format));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, format);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateFormatValueImplCopyWith<_$DateFormatValueImpl> get copyWith =>
      __$$DateFormatValueImplCopyWithImpl<_$DateFormatValueImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DateFormatValueImplToJson(
      this,
    );
  }
}

abstract class _DateFormatValue extends DateFormatValue {
  const factory _DateFormatValue(
      {required final String value,
      final String format}) = _$DateFormatValueImpl;
  const _DateFormatValue._() : super._();

  factory _DateFormatValue.fromJson(Map<String, dynamic> json) =
      _$DateFormatValueImpl.fromJson;

  @override
  String get value;
  @override
  String get format;
  @override
  @JsonKey(ignore: true)
  _$$DateFormatValueImplCopyWith<_$DateFormatValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DisplayBehavior _$DisplayBehaviorFromJson(Map<String, dynamic> json) {
  return _DisplayBehavior.fromJson(json);
}

/// @nodoc
mixin _$DisplayBehavior {
  FormulaBehavior get behavior => throw _privateConstructorUsedError;
  List<String>? get oneOf => throw _privateConstructorUsedError;
  List<String>? get allOf => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisplayBehaviorCopyWith<DisplayBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplayBehaviorCopyWith<$Res> {
  factory $DisplayBehaviorCopyWith(
          DisplayBehavior value, $Res Function(DisplayBehavior) then) =
      _$DisplayBehaviorCopyWithImpl<$Res, DisplayBehavior>;
  @useResult
  $Res call(
      {FormulaBehavior behavior, List<String>? oneOf, List<String>? allOf});
}

/// @nodoc
class _$DisplayBehaviorCopyWithImpl<$Res, $Val extends DisplayBehavior>
    implements $DisplayBehaviorCopyWith<$Res> {
  _$DisplayBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? behavior = null,
    Object? oneOf = freezed,
    Object? allOf = freezed,
  }) {
    return _then(_value.copyWith(
      behavior: null == behavior
          ? _value.behavior
          : behavior // ignore: cast_nullable_to_non_nullable
              as FormulaBehavior,
      oneOf: freezed == oneOf
          ? _value.oneOf
          : oneOf // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      allOf: freezed == allOf
          ? _value.allOf
          : allOf // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisplayBehaviorImplCopyWith<$Res>
    implements $DisplayBehaviorCopyWith<$Res> {
  factory _$$DisplayBehaviorImplCopyWith(_$DisplayBehaviorImpl value,
          $Res Function(_$DisplayBehaviorImpl) then) =
      __$$DisplayBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormulaBehavior behavior, List<String>? oneOf, List<String>? allOf});
}

/// @nodoc
class __$$DisplayBehaviorImplCopyWithImpl<$Res>
    extends _$DisplayBehaviorCopyWithImpl<$Res, _$DisplayBehaviorImpl>
    implements _$$DisplayBehaviorImplCopyWith<$Res> {
  __$$DisplayBehaviorImplCopyWithImpl(
      _$DisplayBehaviorImpl _value, $Res Function(_$DisplayBehaviorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? behavior = null,
    Object? oneOf = freezed,
    Object? allOf = freezed,
  }) {
    return _then(_$DisplayBehaviorImpl(
      behavior: null == behavior
          ? _value.behavior
          : behavior // ignore: cast_nullable_to_non_nullable
              as FormulaBehavior,
      oneOf: freezed == oneOf
          ? _value._oneOf
          : oneOf // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      allOf: freezed == allOf
          ? _value._allOf
          : allOf // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DisplayBehaviorImpl implements _DisplayBehavior {
  const _$DisplayBehaviorImpl(
      {required this.behavior,
      final List<String>? oneOf,
      final List<String>? allOf})
      : _oneOf = oneOf,
        _allOf = allOf;

  factory _$DisplayBehaviorImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisplayBehaviorImplFromJson(json);

  @override
  final FormulaBehavior behavior;
  final List<String>? _oneOf;
  @override
  List<String>? get oneOf {
    final value = _oneOf;
    if (value == null) return null;
    if (_oneOf is EqualUnmodifiableListView) return _oneOf;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _allOf;
  @override
  List<String>? get allOf {
    final value = _allOf;
    if (value == null) return null;
    if (_allOf is EqualUnmodifiableListView) return _allOf;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DisplayBehavior(behavior: $behavior, oneOf: $oneOf, allOf: $allOf)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplayBehaviorImpl &&
            (identical(other.behavior, behavior) ||
                other.behavior == behavior) &&
            const DeepCollectionEquality().equals(other._oneOf, _oneOf) &&
            const DeepCollectionEquality().equals(other._allOf, _allOf));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      behavior,
      const DeepCollectionEquality().hash(_oneOf),
      const DeepCollectionEquality().hash(_allOf));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplayBehaviorImplCopyWith<_$DisplayBehaviorImpl> get copyWith =>
      __$$DisplayBehaviorImplCopyWithImpl<_$DisplayBehaviorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisplayBehaviorImplToJson(
      this,
    );
  }
}

abstract class _DisplayBehavior implements DisplayBehavior {
  const factory _DisplayBehavior(
      {required final FormulaBehavior behavior,
      final List<String>? oneOf,
      final List<String>? allOf}) = _$DisplayBehaviorImpl;

  factory _DisplayBehavior.fromJson(Map<String, dynamic> json) =
      _$DisplayBehaviorImpl.fromJson;

  @override
  FormulaBehavior get behavior;
  @override
  List<String>? get oneOf;
  @override
  List<String>? get allOf;
  @override
  @JsonKey(ignore: true)
  _$$DisplayBehaviorImplCopyWith<_$DisplayBehaviorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

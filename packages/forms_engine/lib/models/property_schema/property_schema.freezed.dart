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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PropertySchema _$PropertySchemaFromJson(Map<String, dynamic> json) {
  return _PropertySchema.fromJson(json);
}

/// @nodoc
mixin _$PropertySchema {
  @JsonKey(name: 'type', unknownEnumValue: PropertySchemaType.string)
  PropertySchemaType get type => throw _privateConstructorUsedError;
  bool? get readonly => throw _privateConstructorUsedError;
  bool? get displayOnly => throw _privateConstructorUsedError;
  bool? get hidden => throw _privateConstructorUsedError;
  Map<String, PropertySchema>? get properties =>
      throw _privateConstructorUsedError;
  List<Option>? get enums => throw _privateConstructorUsedError;
  String? get schemaCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'format', unknownEnumValue: PropertySchemaFormat.text)
  PropertySchemaFormat? get format => throw _privateConstructorUsedError;
  DateFormatValue? get firstDate => throw _privateConstructorUsedError;
  DateFormatValue? get lastDate => throw _privateConstructorUsedError;
  int? get minValue => throw _privateConstructorUsedError;
  int? get maxValue => throw _privateConstructorUsedError;
  int? get minLength => throw _privateConstructorUsedError;
  int? get maxLength => throw _privateConstructorUsedError;
  String? get helpText => throw _privateConstructorUsedError;
  String? get tooltipText => throw _privateConstructorUsedError;
  String? get innerLabel => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  DisplayBehavior? get displayBehavior => throw _privateConstructorUsedError;
  Map<String, dynamic>? get conditions => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  String? get actionLabel => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<ValidationRule>? get validations => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'type', unknownEnumValue: PropertySchemaType.string)
      PropertySchemaType type,
      bool? readonly,
      bool? displayOnly,
      bool? hidden,
      Map<String, PropertySchema>? properties,
      List<Option>? enums,
      String? schemaCode,
      @JsonKey(name: 'format', unknownEnumValue: PropertySchemaFormat.text)
      PropertySchemaFormat? format,
      DateFormatValue? firstDate,
      DateFormatValue? lastDate,
      int? minValue,
      int? maxValue,
      int? minLength,
      int? maxLength,
      String? helpText,
      String? tooltipText,
      String? innerLabel,
      String? label,
      dynamic value,
      DisplayBehavior? displayBehavior,
      Map<String, dynamic>? conditions,
      int? order,
      String? actionLabel,
      String? description,
      List<ValidationRule>? validations});

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
    Object? hidden = freezed,
    Object? properties = freezed,
    Object? enums = freezed,
    Object? schemaCode = freezed,
    Object? format = freezed,
    Object? firstDate = freezed,
    Object? lastDate = freezed,
    Object? minValue = freezed,
    Object? maxValue = freezed,
    Object? minLength = freezed,
    Object? maxLength = freezed,
    Object? helpText = freezed,
    Object? tooltipText = freezed,
    Object? innerLabel = freezed,
    Object? label = freezed,
    Object? value = freezed,
    Object? displayBehavior = freezed,
    Object? conditions = freezed,
    Object? order = freezed,
    Object? actionLabel = freezed,
    Object? description = freezed,
    Object? validations = freezed,
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
      hidden: freezed == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      properties: freezed == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, PropertySchema>?,
      enums: freezed == enums
          ? _value.enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<Option>?,
      schemaCode: freezed == schemaCode
          ? _value.schemaCode
          : schemaCode // ignore: cast_nullable_to_non_nullable
              as String?,
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
      minValue: freezed == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as int?,
      maxValue: freezed == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as int?,
      minLength: freezed == minLength
          ? _value.minLength
          : minLength // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLength: freezed == maxLength
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int?,
      helpText: freezed == helpText
          ? _value.helpText
          : helpText // ignore: cast_nullable_to_non_nullable
              as String?,
      tooltipText: freezed == tooltipText
          ? _value.tooltipText
          : tooltipText // ignore: cast_nullable_to_non_nullable
              as String?,
      innerLabel: freezed == innerLabel
          ? _value.innerLabel
          : innerLabel // ignore: cast_nullable_to_non_nullable
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
      conditions: freezed == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      actionLabel: freezed == actionLabel
          ? _value.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      validations: freezed == validations
          ? _value.validations
          : validations // ignore: cast_nullable_to_non_nullable
              as List<ValidationRule>?,
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
      {@JsonKey(name: 'type', unknownEnumValue: PropertySchemaType.string)
      PropertySchemaType type,
      bool? readonly,
      bool? displayOnly,
      bool? hidden,
      Map<String, PropertySchema>? properties,
      List<Option>? enums,
      String? schemaCode,
      @JsonKey(name: 'format', unknownEnumValue: PropertySchemaFormat.text)
      PropertySchemaFormat? format,
      DateFormatValue? firstDate,
      DateFormatValue? lastDate,
      int? minValue,
      int? maxValue,
      int? minLength,
      int? maxLength,
      String? helpText,
      String? tooltipText,
      String? innerLabel,
      String? label,
      dynamic value,
      DisplayBehavior? displayBehavior,
      Map<String, dynamic>? conditions,
      int? order,
      String? actionLabel,
      String? description,
      List<ValidationRule>? validations});

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
    Object? hidden = freezed,
    Object? properties = freezed,
    Object? enums = freezed,
    Object? schemaCode = freezed,
    Object? format = freezed,
    Object? firstDate = freezed,
    Object? lastDate = freezed,
    Object? minValue = freezed,
    Object? maxValue = freezed,
    Object? minLength = freezed,
    Object? maxLength = freezed,
    Object? helpText = freezed,
    Object? tooltipText = freezed,
    Object? innerLabel = freezed,
    Object? label = freezed,
    Object? value = freezed,
    Object? displayBehavior = freezed,
    Object? conditions = freezed,
    Object? order = freezed,
    Object? actionLabel = freezed,
    Object? description = freezed,
    Object? validations = freezed,
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
      hidden: freezed == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      properties: freezed == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, PropertySchema>?,
      enums: freezed == enums
          ? _value._enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<Option>?,
      schemaCode: freezed == schemaCode
          ? _value.schemaCode
          : schemaCode // ignore: cast_nullable_to_non_nullable
              as String?,
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
      minValue: freezed == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as int?,
      maxValue: freezed == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as int?,
      minLength: freezed == minLength
          ? _value.minLength
          : minLength // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLength: freezed == maxLength
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int?,
      helpText: freezed == helpText
          ? _value.helpText
          : helpText // ignore: cast_nullable_to_non_nullable
              as String?,
      tooltipText: freezed == tooltipText
          ? _value.tooltipText
          : tooltipText // ignore: cast_nullable_to_non_nullable
              as String?,
      innerLabel: freezed == innerLabel
          ? _value.innerLabel
          : innerLabel // ignore: cast_nullable_to_non_nullable
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
      conditions: freezed == conditions
          ? _value._conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      actionLabel: freezed == actionLabel
          ? _value.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      validations: freezed == validations
          ? _value._validations
          : validations // ignore: cast_nullable_to_non_nullable
              as List<ValidationRule>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$PropertySchemaImpl implements _PropertySchema {
  const _$PropertySchemaImpl(
      {@JsonKey(name: 'type', unknownEnumValue: PropertySchemaType.string)
      required this.type,
      this.readonly,
      this.displayOnly,
      this.hidden,
      final Map<String, PropertySchema>? properties,
      final List<Option>? enums,
      this.schemaCode,
      @JsonKey(name: 'format', unknownEnumValue: PropertySchemaFormat.text)
      this.format,
      this.firstDate,
      this.lastDate,
      this.minValue,
      this.maxValue,
      this.minLength,
      this.maxLength,
      this.helpText,
      this.tooltipText,
      this.innerLabel,
      this.label,
      this.value,
      this.displayBehavior,
      final Map<String, dynamic>? conditions,
      this.order,
      this.actionLabel,
      this.description,
      final List<ValidationRule>? validations})
      : _properties = properties,
        _enums = enums,
        _conditions = conditions,
        _validations = validations;

  factory _$PropertySchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertySchemaImplFromJson(json);

  @override
  @JsonKey(name: 'type', unknownEnumValue: PropertySchemaType.string)
  final PropertySchemaType type;
  @override
  final bool? readonly;
  @override
  final bool? displayOnly;
  @override
  final bool? hidden;
  final Map<String, PropertySchema>? _properties;
  @override
  Map<String, PropertySchema>? get properties {
    final value = _properties;
    if (value == null) return null;
    if (_properties is EqualUnmodifiableMapView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Option>? _enums;
  @override
  List<Option>? get enums {
    final value = _enums;
    if (value == null) return null;
    if (_enums is EqualUnmodifiableListView) return _enums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? schemaCode;
  @override
  @JsonKey(name: 'format', unknownEnumValue: PropertySchemaFormat.text)
  final PropertySchemaFormat? format;
  @override
  final DateFormatValue? firstDate;
  @override
  final DateFormatValue? lastDate;
  @override
  final int? minValue;
  @override
  final int? maxValue;
  @override
  final int? minLength;
  @override
  final int? maxLength;
  @override
  final String? helpText;
  @override
  final String? tooltipText;
  @override
  final String? innerLabel;
  @override
  final String? label;
  @override
  final dynamic value;
  @override
  final DisplayBehavior? displayBehavior;
  final Map<String, dynamic>? _conditions;
  @override
  Map<String, dynamic>? get conditions {
    final value = _conditions;
    if (value == null) return null;
    if (_conditions is EqualUnmodifiableMapView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final int? order;
  @override
  final String? actionLabel;
  @override
  final String? description;
  final List<ValidationRule>? _validations;
  @override
  List<ValidationRule>? get validations {
    final value = _validations;
    if (value == null) return null;
    if (_validations is EqualUnmodifiableListView) return _validations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PropertySchema(type: $type, readonly: $readonly, displayOnly: $displayOnly, hidden: $hidden, properties: $properties, enums: $enums, schemaCode: $schemaCode, format: $format, firstDate: $firstDate, lastDate: $lastDate, minValue: $minValue, maxValue: $maxValue, minLength: $minLength, maxLength: $maxLength, helpText: $helpText, tooltipText: $tooltipText, innerLabel: $innerLabel, label: $label, value: $value, displayBehavior: $displayBehavior, conditions: $conditions, order: $order, actionLabel: $actionLabel, description: $description, validations: $validations)';
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
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            const DeepCollectionEquality().equals(other._enums, _enums) &&
            (identical(other.schemaCode, schemaCode) ||
                other.schemaCode == schemaCode) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.firstDate, firstDate) ||
                other.firstDate == firstDate) &&
            (identical(other.lastDate, lastDate) ||
                other.lastDate == lastDate) &&
            (identical(other.minValue, minValue) ||
                other.minValue == minValue) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue) &&
            (identical(other.minLength, minLength) ||
                other.minLength == minLength) &&
            (identical(other.maxLength, maxLength) ||
                other.maxLength == maxLength) &&
            (identical(other.helpText, helpText) ||
                other.helpText == helpText) &&
            (identical(other.tooltipText, tooltipText) ||
                other.tooltipText == tooltipText) &&
            (identical(other.innerLabel, innerLabel) ||
                other.innerLabel == innerLabel) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.displayBehavior, displayBehavior) ||
                other.displayBehavior == displayBehavior) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.actionLabel, actionLabel) ||
                other.actionLabel == actionLabel) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._validations, _validations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        type,
        readonly,
        displayOnly,
        hidden,
        const DeepCollectionEquality().hash(_properties),
        const DeepCollectionEquality().hash(_enums),
        schemaCode,
        format,
        firstDate,
        lastDate,
        minValue,
        maxValue,
        minLength,
        maxLength,
        helpText,
        tooltipText,
        innerLabel,
        label,
        const DeepCollectionEquality().hash(value),
        displayBehavior,
        const DeepCollectionEquality().hash(_conditions),
        order,
        actionLabel,
        description,
        const DeepCollectionEquality().hash(_validations)
      ]);

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
      {@JsonKey(name: 'type', unknownEnumValue: PropertySchemaType.string)
      required final PropertySchemaType type,
      final bool? readonly,
      final bool? displayOnly,
      final bool? hidden,
      final Map<String, PropertySchema>? properties,
      final List<Option>? enums,
      final String? schemaCode,
      @JsonKey(name: 'format', unknownEnumValue: PropertySchemaFormat.text)
      final PropertySchemaFormat? format,
      final DateFormatValue? firstDate,
      final DateFormatValue? lastDate,
      final int? minValue,
      final int? maxValue,
      final int? minLength,
      final int? maxLength,
      final String? helpText,
      final String? tooltipText,
      final String? innerLabel,
      final String? label,
      final dynamic value,
      final DisplayBehavior? displayBehavior,
      final Map<String, dynamic>? conditions,
      final int? order,
      final String? actionLabel,
      final String? description,
      final List<ValidationRule>? validations}) = _$PropertySchemaImpl;

  factory _PropertySchema.fromJson(Map<String, dynamic> json) =
      _$PropertySchemaImpl.fromJson;

  @override
  @JsonKey(name: 'type', unknownEnumValue: PropertySchemaType.string)
  PropertySchemaType get type;
  @override
  bool? get readonly;
  @override
  bool? get displayOnly;
  @override
  bool? get hidden;
  @override
  Map<String, PropertySchema>? get properties;
  @override
  List<Option>? get enums;
  @override
  String? get schemaCode;
  @override
  @JsonKey(name: 'format', unknownEnumValue: PropertySchemaFormat.text)
  PropertySchemaFormat? get format;
  @override
  DateFormatValue? get firstDate;
  @override
  DateFormatValue? get lastDate;
  @override
  int? get minValue;
  @override
  int? get maxValue;
  @override
  int? get minLength;
  @override
  int? get maxLength;
  @override
  String? get helpText;
  @override
  String? get tooltipText;
  @override
  String? get innerLabel;
  @override
  String? get label;
  @override
  dynamic get value;
  @override
  DisplayBehavior? get displayBehavior;
  @override
  Map<String, dynamic>? get conditions;
  @override
  int? get order;
  @override
  String? get actionLabel;
  @override
  String? get description;
  @override
  List<ValidationRule>? get validations;
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

ValidationRule _$ValidationRuleFromJson(Map<String, dynamic> json) {
  return _ValidationRule.fromJson(json);
}

/// @nodoc
mixin _$ValidationRule {
  String get type => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidationRuleCopyWith<ValidationRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationRuleCopyWith<$Res> {
  factory $ValidationRuleCopyWith(
          ValidationRule value, $Res Function(ValidationRule) then) =
      _$ValidationRuleCopyWithImpl<$Res, ValidationRule>;
  @useResult
  $Res call({String type, dynamic value, String? message});
}

/// @nodoc
class _$ValidationRuleCopyWithImpl<$Res, $Val extends ValidationRule>
    implements $ValidationRuleCopyWith<$Res> {
  _$ValidationRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValidationRuleImplCopyWith<$Res>
    implements $ValidationRuleCopyWith<$Res> {
  factory _$$ValidationRuleImplCopyWith(_$ValidationRuleImpl value,
          $Res Function(_$ValidationRuleImpl) then) =
      __$$ValidationRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, dynamic value, String? message});
}

/// @nodoc
class __$$ValidationRuleImplCopyWithImpl<$Res>
    extends _$ValidationRuleCopyWithImpl<$Res, _$ValidationRuleImpl>
    implements _$$ValidationRuleImplCopyWith<$Res> {
  __$$ValidationRuleImplCopyWithImpl(
      _$ValidationRuleImpl _value, $Res Function(_$ValidationRuleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ValidationRuleImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidationRuleImpl implements _ValidationRule {
  const _$ValidationRuleImpl({required this.type, this.value, this.message});

  factory _$ValidationRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidationRuleImplFromJson(json);

  @override
  final String type;
  @override
  final dynamic value;
  @override
  final String? message;

  @override
  String toString() {
    return 'ValidationRule(type: $type, value: $value, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationRuleImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(value), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationRuleImplCopyWith<_$ValidationRuleImpl> get copyWith =>
      __$$ValidationRuleImplCopyWithImpl<_$ValidationRuleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidationRuleImplToJson(
      this,
    );
  }
}

abstract class _ValidationRule implements ValidationRule {
  const factory _ValidationRule(
      {required final String type,
      final dynamic value,
      final String? message}) = _$ValidationRuleImpl;

  factory _ValidationRule.fromJson(Map<String, dynamic> json) =
      _$ValidationRuleImpl.fromJson;

  @override
  String get type;
  @override
  dynamic get value;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ValidationRuleImplCopyWith<_$ValidationRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Option _$OptionFromJson(Map<String, dynamic> json) {
  return _Option.fromJson(json);
}

/// @nodoc
mixin _$Option {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionCopyWith<Option> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionCopyWith<$Res> {
  factory $OptionCopyWith(Option value, $Res Function(Option) then) =
      _$OptionCopyWithImpl<$Res, Option>;
  @useResult
  $Res call({String code, String name});
}

/// @nodoc
class _$OptionCopyWithImpl<$Res, $Val extends Option>
    implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionImplCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$$OptionImplCopyWith(
          _$OptionImpl value, $Res Function(_$OptionImpl) then) =
      __$$OptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name});
}

/// @nodoc
class __$$OptionImplCopyWithImpl<$Res>
    extends _$OptionCopyWithImpl<$Res, _$OptionImpl>
    implements _$$OptionImplCopyWith<$Res> {
  __$$OptionImplCopyWithImpl(
      _$OptionImpl _value, $Res Function(_$OptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_$OptionImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionImpl implements _Option {
  const _$OptionImpl({required this.code, required this.name});

  factory _$OptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionImplFromJson(json);

  @override
  final String code;
  @override
  final String name;

  @override
  String toString() {
    return 'Option(code: $code, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
      __$$OptionImplCopyWithImpl<_$OptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionImplToJson(
      this,
    );
  }
}

abstract class _Option implements Option {
  const factory _Option(
      {required final String code, required final String name}) = _$OptionImpl;

  factory _Option.fromJson(Map<String, dynamic> json) = _$OptionImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
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

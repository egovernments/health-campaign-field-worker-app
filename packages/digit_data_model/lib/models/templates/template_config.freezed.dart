// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TemplateConfig _$TemplateConfigFromJson(Map<String, dynamic> json) {
  return _TemplateConfig.fromJson(json);
}

/// @nodoc
mixin _$TemplateConfig {
  String get type => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  Map<String, TemplateProperty>? get properties =>
      throw _privateConstructorUsedError;
  Map<String, bool>? get features => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _navigateToConfigOrNull)
  NavigateToConfig? get navigateTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateConfigCopyWith<TemplateConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateConfigCopyWith<$Res> {
  factory $TemplateConfigCopyWith(
          TemplateConfig value, $Res Function(TemplateConfig) then) =
      _$TemplateConfigCopyWithImpl<$Res, TemplateConfig>;
  @useResult
  $Res call(
      {String type,
      String label,
      String? description,
      int order,
      Map<String, TemplateProperty>? properties,
      Map<String, bool>? features,
      @JsonKey(fromJson: _navigateToConfigOrNull)
      NavigateToConfig? navigateTo});

  $NavigateToConfigCopyWith<$Res>? get navigateTo;
}

/// @nodoc
class _$TemplateConfigCopyWithImpl<$Res, $Val extends TemplateConfig>
    implements $TemplateConfigCopyWith<$Res> {
  _$TemplateConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? label = null,
    Object? description = freezed,
    Object? order = null,
    Object? properties = freezed,
    Object? features = freezed,
    Object? navigateTo = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      properties: freezed == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, TemplateProperty>?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      navigateTo: freezed == navigateTo
          ? _value.navigateTo
          : navigateTo // ignore: cast_nullable_to_non_nullable
              as NavigateToConfig?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NavigateToConfigCopyWith<$Res>? get navigateTo {
    if (_value.navigateTo == null) {
      return null;
    }

    return $NavigateToConfigCopyWith<$Res>(_value.navigateTo!, (value) {
      return _then(_value.copyWith(navigateTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TemplateConfigImplCopyWith<$Res>
    implements $TemplateConfigCopyWith<$Res> {
  factory _$$TemplateConfigImplCopyWith(_$TemplateConfigImpl value,
          $Res Function(_$TemplateConfigImpl) then) =
      __$$TemplateConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      String label,
      String? description,
      int order,
      Map<String, TemplateProperty>? properties,
      Map<String, bool>? features,
      @JsonKey(fromJson: _navigateToConfigOrNull)
      NavigateToConfig? navigateTo});

  @override
  $NavigateToConfigCopyWith<$Res>? get navigateTo;
}

/// @nodoc
class __$$TemplateConfigImplCopyWithImpl<$Res>
    extends _$TemplateConfigCopyWithImpl<$Res, _$TemplateConfigImpl>
    implements _$$TemplateConfigImplCopyWith<$Res> {
  __$$TemplateConfigImplCopyWithImpl(
      _$TemplateConfigImpl _value, $Res Function(_$TemplateConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? label = null,
    Object? description = freezed,
    Object? order = null,
    Object? properties = freezed,
    Object? features = freezed,
    Object? navigateTo = freezed,
  }) {
    return _then(_$TemplateConfigImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      properties: freezed == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, TemplateProperty>?,
      features: freezed == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      navigateTo: freezed == navigateTo
          ? _value.navigateTo
          : navigateTo // ignore: cast_nullable_to_non_nullable
              as NavigateToConfig?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateConfigImpl implements _TemplateConfig {
  const _$TemplateConfigImpl(
      {required this.type,
      required this.label,
      this.description,
      required this.order,
      final Map<String, TemplateProperty>? properties,
      final Map<String, bool>? features,
      @JsonKey(fromJson: _navigateToConfigOrNull) this.navigateTo})
      : _properties = properties,
        _features = features;

  factory _$TemplateConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateConfigImplFromJson(json);

  @override
  final String type;
  @override
  final String label;
  @override
  final String? description;
  @override
  final int order;
  final Map<String, TemplateProperty>? _properties;
  @override
  Map<String, TemplateProperty>? get properties {
    final value = _properties;
    if (value == null) return null;
    if (_properties is EqualUnmodifiableMapView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, bool>? _features;
  @override
  Map<String, bool>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableMapView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(fromJson: _navigateToConfigOrNull)
  final NavigateToConfig? navigateTo;

  @override
  String toString() {
    return 'TemplateConfig(type: $type, label: $label, description: $description, order: $order, properties: $properties, features: $features, navigateTo: $navigateTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateConfigImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.order, order) || other.order == order) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.navigateTo, navigateTo) ||
                other.navigateTo == navigateTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      label,
      description,
      order,
      const DeepCollectionEquality().hash(_properties),
      const DeepCollectionEquality().hash(_features),
      navigateTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateConfigImplCopyWith<_$TemplateConfigImpl> get copyWith =>
      __$$TemplateConfigImplCopyWithImpl<_$TemplateConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateConfigImplToJson(
      this,
    );
  }
}

abstract class _TemplateConfig implements TemplateConfig {
  const factory _TemplateConfig(
      {required final String type,
      required final String label,
      final String? description,
      required final int order,
      final Map<String, TemplateProperty>? properties,
      final Map<String, bool>? features,
      @JsonKey(fromJson: _navigateToConfigOrNull)
      final NavigateToConfig? navigateTo}) = _$TemplateConfigImpl;

  factory _TemplateConfig.fromJson(Map<String, dynamic> json) =
      _$TemplateConfigImpl.fromJson;

  @override
  String get type;
  @override
  String get label;
  @override
  String? get description;
  @override
  int get order;
  @override
  Map<String, TemplateProperty>? get properties;
  @override
  Map<String, bool>? get features;
  @override
  @JsonKey(fromJson: _navigateToConfigOrNull)
  NavigateToConfig? get navigateTo;
  @override
  @JsonKey(ignore: true)
  _$$TemplateConfigImplCopyWith<_$TemplateConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TemplateProperty _$TemplatePropertyFromJson(Map<String, dynamic> json) {
  return _TemplateProperty.fromJson(json);
}

/// @nodoc
mixin _$TemplateProperty {
  String get type => throw _privateConstructorUsedError;
  String get format => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  bool? get hidden => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  bool? get readOnly => throw _privateConstructorUsedError;
  bool? get autoEnable => throw _privateConstructorUsedError;
  List<dynamic>? get validations => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get enums => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplatePropertyCopyWith<TemplateProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplatePropertyCopyWith<$Res> {
  factory $TemplatePropertyCopyWith(
          TemplateProperty value, $Res Function(TemplateProperty) then) =
      _$TemplatePropertyCopyWithImpl<$Res, TemplateProperty>;
  @useResult
  $Res call(
      {String type,
      String format,
      String label,
      dynamic value,
      bool? hidden,
      int? order,
      bool? readOnly,
      bool? autoEnable,
      List<dynamic>? validations,
      List<Map<String, dynamic>>? enums});
}

/// @nodoc
class _$TemplatePropertyCopyWithImpl<$Res, $Val extends TemplateProperty>
    implements $TemplatePropertyCopyWith<$Res> {
  _$TemplatePropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? format = null,
    Object? label = null,
    Object? value = freezed,
    Object? hidden = freezed,
    Object? order = freezed,
    Object? readOnly = freezed,
    Object? autoEnable = freezed,
    Object? validations = freezed,
    Object? enums = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hidden: freezed == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      readOnly: freezed == readOnly
          ? _value.readOnly
          : readOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      autoEnable: freezed == autoEnable
          ? _value.autoEnable
          : autoEnable // ignore: cast_nullable_to_non_nullable
              as bool?,
      validations: freezed == validations
          ? _value.validations
          : validations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      enums: freezed == enums
          ? _value.enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplatePropertyImplCopyWith<$Res>
    implements $TemplatePropertyCopyWith<$Res> {
  factory _$$TemplatePropertyImplCopyWith(_$TemplatePropertyImpl value,
          $Res Function(_$TemplatePropertyImpl) then) =
      __$$TemplatePropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      String format,
      String label,
      dynamic value,
      bool? hidden,
      int? order,
      bool? readOnly,
      bool? autoEnable,
      List<dynamic>? validations,
      List<Map<String, dynamic>>? enums});
}

/// @nodoc
class __$$TemplatePropertyImplCopyWithImpl<$Res>
    extends _$TemplatePropertyCopyWithImpl<$Res, _$TemplatePropertyImpl>
    implements _$$TemplatePropertyImplCopyWith<$Res> {
  __$$TemplatePropertyImplCopyWithImpl(_$TemplatePropertyImpl _value,
      $Res Function(_$TemplatePropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? format = null,
    Object? label = null,
    Object? value = freezed,
    Object? hidden = freezed,
    Object? order = freezed,
    Object? readOnly = freezed,
    Object? autoEnable = freezed,
    Object? validations = freezed,
    Object? enums = freezed,
  }) {
    return _then(_$TemplatePropertyImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hidden: freezed == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      readOnly: freezed == readOnly
          ? _value.readOnly
          : readOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      autoEnable: freezed == autoEnable
          ? _value.autoEnable
          : autoEnable // ignore: cast_nullable_to_non_nullable
              as bool?,
      validations: freezed == validations
          ? _value._validations
          : validations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      enums: freezed == enums
          ? _value._enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplatePropertyImpl implements _TemplateProperty {
  const _$TemplatePropertyImpl(
      {required this.type,
      required this.format,
      required this.label,
      this.value,
      this.hidden,
      this.order,
      this.readOnly,
      this.autoEnable,
      final List<dynamic>? validations,
      final List<Map<String, dynamic>>? enums})
      : _validations = validations,
        _enums = enums;

  factory _$TemplatePropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplatePropertyImplFromJson(json);

  @override
  final String type;
  @override
  final String format;
  @override
  final String label;
  @override
  final dynamic value;
  @override
  final bool? hidden;
  @override
  final int? order;
  @override
  final bool? readOnly;
  @override
  final bool? autoEnable;
  final List<dynamic>? _validations;
  @override
  List<dynamic>? get validations {
    final value = _validations;
    if (value == null) return null;
    if (_validations is EqualUnmodifiableListView) return _validations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Map<String, dynamic>>? _enums;
  @override
  List<Map<String, dynamic>>? get enums {
    final value = _enums;
    if (value == null) return null;
    if (_enums is EqualUnmodifiableListView) return _enums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TemplateProperty(type: $type, format: $format, label: $label, value: $value, hidden: $hidden, order: $order, readOnly: $readOnly, autoEnable: $autoEnable, validations: $validations, enums: $enums)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplatePropertyImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.readOnly, readOnly) ||
                other.readOnly == readOnly) &&
            (identical(other.autoEnable, autoEnable) ||
                other.autoEnable == autoEnable) &&
            const DeepCollectionEquality()
                .equals(other._validations, _validations) &&
            const DeepCollectionEquality().equals(other._enums, _enums));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      format,
      label,
      const DeepCollectionEquality().hash(value),
      hidden,
      order,
      readOnly,
      autoEnable,
      const DeepCollectionEquality().hash(_validations),
      const DeepCollectionEquality().hash(_enums));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplatePropertyImplCopyWith<_$TemplatePropertyImpl> get copyWith =>
      __$$TemplatePropertyImplCopyWithImpl<_$TemplatePropertyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplatePropertyImplToJson(
      this,
    );
  }
}

abstract class _TemplateProperty implements TemplateProperty {
  const factory _TemplateProperty(
      {required final String type,
      required final String format,
      required final String label,
      final dynamic value,
      final bool? hidden,
      final int? order,
      final bool? readOnly,
      final bool? autoEnable,
      final List<dynamic>? validations,
      final List<Map<String, dynamic>>? enums}) = _$TemplatePropertyImpl;

  factory _TemplateProperty.fromJson(Map<String, dynamic> json) =
      _$TemplatePropertyImpl.fromJson;

  @override
  String get type;
  @override
  String get format;
  @override
  String get label;
  @override
  dynamic get value;
  @override
  bool? get hidden;
  @override
  int? get order;
  @override
  bool? get readOnly;
  @override
  bool? get autoEnable;
  @override
  List<dynamic>? get validations;
  @override
  List<Map<String, dynamic>>? get enums;
  @override
  @JsonKey(ignore: true)
  _$$TemplatePropertyImplCopyWith<_$TemplatePropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NavigateToConfig _$NavigateToConfigFromJson(Map<String, dynamic> json) {
  return _NavigateToConfig.fromJson(json);
}

/// @nodoc
mixin _$NavigateToConfig {
  String get type => throw _privateConstructorUsedError; // "template" or "form"
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NavigateToConfigCopyWith<NavigateToConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigateToConfigCopyWith<$Res> {
  factory $NavigateToConfigCopyWith(
          NavigateToConfig value, $Res Function(NavigateToConfig) then) =
      _$NavigateToConfigCopyWithImpl<$Res, NavigateToConfig>;
  @useResult
  $Res call({String type, String name});
}

/// @nodoc
class _$NavigateToConfigCopyWithImpl<$Res, $Val extends NavigateToConfig>
    implements $NavigateToConfigCopyWith<$Res> {
  _$NavigateToConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavigateToConfigImplCopyWith<$Res>
    implements $NavigateToConfigCopyWith<$Res> {
  factory _$$NavigateToConfigImplCopyWith(_$NavigateToConfigImpl value,
          $Res Function(_$NavigateToConfigImpl) then) =
      __$$NavigateToConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String name});
}

/// @nodoc
class __$$NavigateToConfigImplCopyWithImpl<$Res>
    extends _$NavigateToConfigCopyWithImpl<$Res, _$NavigateToConfigImpl>
    implements _$$NavigateToConfigImplCopyWith<$Res> {
  __$$NavigateToConfigImplCopyWithImpl(_$NavigateToConfigImpl _value,
      $Res Function(_$NavigateToConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
  }) {
    return _then(_$NavigateToConfigImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
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
class _$NavigateToConfigImpl implements _NavigateToConfig {
  const _$NavigateToConfigImpl({required this.type, required this.name});

  factory _$NavigateToConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$NavigateToConfigImplFromJson(json);

  @override
  final String type;
// "template" or "form"
  @override
  final String name;

  @override
  String toString() {
    return 'NavigateToConfig(type: $type, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigateToConfigImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigateToConfigImplCopyWith<_$NavigateToConfigImpl> get copyWith =>
      __$$NavigateToConfigImplCopyWithImpl<_$NavigateToConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NavigateToConfigImplToJson(
      this,
    );
  }
}

abstract class _NavigateToConfig implements NavigateToConfig {
  const factory _NavigateToConfig(
      {required final String type,
      required final String name}) = _$NavigateToConfigImpl;

  factory _NavigateToConfig.fromJson(Map<String, dynamic> json) =
      _$NavigateToConfigImpl.fromJson;

  @override
  String get type;
  @override // "template" or "form"
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$NavigateToConfigImplCopyWith<_$NavigateToConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

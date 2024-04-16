// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schema_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SchemaObject _$SchemaObjectFromJson(Map<String, dynamic> json) {
  return _SchemaObject.fromJson(json);
}

/// @nodoc
mixin _$SchemaObject {
  String get name => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  Map<String, PropertySchema> get pages => throw _privateConstructorUsedError;
  List<ActionSchema>? get actionSchema => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchemaObjectCopyWith<SchemaObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchemaObjectCopyWith<$Res> {
  factory $SchemaObjectCopyWith(
          SchemaObject value, $Res Function(SchemaObject) then) =
      _$SchemaObjectCopyWithImpl<$Res, SchemaObject>;
  @useResult
  $Res call(
      {String name,
      int version,
      Map<String, PropertySchema> pages,
      List<ActionSchema>? actionSchema});
}

/// @nodoc
class _$SchemaObjectCopyWithImpl<$Res, $Val extends SchemaObject>
    implements $SchemaObjectCopyWith<$Res> {
  _$SchemaObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? version = null,
    Object? pages = null,
    Object? actionSchema = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as Map<String, PropertySchema>,
      actionSchema: freezed == actionSchema
          ? _value.actionSchema
          : actionSchema // ignore: cast_nullable_to_non_nullable
              as List<ActionSchema>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SchemaObjectImplCopyWith<$Res>
    implements $SchemaObjectCopyWith<$Res> {
  factory _$$SchemaObjectImplCopyWith(
          _$SchemaObjectImpl value, $Res Function(_$SchemaObjectImpl) then) =
      __$$SchemaObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int version,
      Map<String, PropertySchema> pages,
      List<ActionSchema>? actionSchema});
}

/// @nodoc
class __$$SchemaObjectImplCopyWithImpl<$Res>
    extends _$SchemaObjectCopyWithImpl<$Res, _$SchemaObjectImpl>
    implements _$$SchemaObjectImplCopyWith<$Res> {
  __$$SchemaObjectImplCopyWithImpl(
      _$SchemaObjectImpl _value, $Res Function(_$SchemaObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? version = null,
    Object? pages = null,
    Object? actionSchema = freezed,
  }) {
    return _then(_$SchemaObjectImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value._pages
          : pages // ignore: cast_nullable_to_non_nullable
              as Map<String, PropertySchema>,
      actionSchema: freezed == actionSchema
          ? _value._actionSchema
          : actionSchema // ignore: cast_nullable_to_non_nullable
              as List<ActionSchema>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$SchemaObjectImpl implements _SchemaObject {
  const _$SchemaObjectImpl(
      {required this.name,
      required this.version,
      final Map<String, PropertySchema> pages = const {},
      final List<ActionSchema>? actionSchema})
      : _pages = pages,
        _actionSchema = actionSchema;

  factory _$SchemaObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$SchemaObjectImplFromJson(json);

  @override
  final String name;
  @override
  final int version;
  final Map<String, PropertySchema> _pages;
  @override
  @JsonKey()
  Map<String, PropertySchema> get pages {
    if (_pages is EqualUnmodifiableMapView) return _pages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pages);
  }

  final List<ActionSchema>? _actionSchema;
  @override
  List<ActionSchema>? get actionSchema {
    final value = _actionSchema;
    if (value == null) return null;
    if (_actionSchema is EqualUnmodifiableListView) return _actionSchema;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SchemaObject(name: $name, version: $version, pages: $pages, actionSchema: $actionSchema)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchemaObjectImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._pages, _pages) &&
            const DeepCollectionEquality()
                .equals(other._actionSchema, _actionSchema));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      version,
      const DeepCollectionEquality().hash(_pages),
      const DeepCollectionEquality().hash(_actionSchema));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SchemaObjectImplCopyWith<_$SchemaObjectImpl> get copyWith =>
      __$$SchemaObjectImplCopyWithImpl<_$SchemaObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SchemaObjectImplToJson(
      this,
    );
  }
}

abstract class _SchemaObject implements SchemaObject {
  const factory _SchemaObject(
      {required final String name,
      required final int version,
      final Map<String, PropertySchema> pages,
      final List<ActionSchema>? actionSchema}) = _$SchemaObjectImpl;

  factory _SchemaObject.fromJson(Map<String, dynamic> json) =
      _$SchemaObjectImpl.fromJson;

  @override
  String get name;
  @override
  int get version;
  @override
  Map<String, PropertySchema> get pages;
  @override
  List<ActionSchema>? get actionSchema;
  @override
  @JsonKey(ignore: true)
  _$$SchemaObjectImplCopyWith<_$SchemaObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActionSchema _$ActionSchemaFromJson(Map<String, dynamic> json) {
  return _ActionSchema.fromJson(json);
}

/// @nodoc
mixin _$ActionSchema {
  String get name => throw _privateConstructorUsedError;
  String get buttonName => throw _privateConstructorUsedError;
  ButtonType get buttonType => throw _privateConstructorUsedError;
  List<ActionItemSchema> get actionItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActionSchemaCopyWith<ActionSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionSchemaCopyWith<$Res> {
  factory $ActionSchemaCopyWith(
          ActionSchema value, $Res Function(ActionSchema) then) =
      _$ActionSchemaCopyWithImpl<$Res, ActionSchema>;
  @useResult
  $Res call(
      {String name,
      String buttonName,
      ButtonType buttonType,
      List<ActionItemSchema> actionItems});
}

/// @nodoc
class _$ActionSchemaCopyWithImpl<$Res, $Val extends ActionSchema>
    implements $ActionSchemaCopyWith<$Res> {
  _$ActionSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? buttonName = null,
    Object? buttonType = null,
    Object? actionItems = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      buttonName: null == buttonName
          ? _value.buttonName
          : buttonName // ignore: cast_nullable_to_non_nullable
              as String,
      buttonType: null == buttonType
          ? _value.buttonType
          : buttonType // ignore: cast_nullable_to_non_nullable
              as ButtonType,
      actionItems: null == actionItems
          ? _value.actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<ActionItemSchema>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionSchemaImplCopyWith<$Res>
    implements $ActionSchemaCopyWith<$Res> {
  factory _$$ActionSchemaImplCopyWith(
          _$ActionSchemaImpl value, $Res Function(_$ActionSchemaImpl) then) =
      __$$ActionSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String buttonName,
      ButtonType buttonType,
      List<ActionItemSchema> actionItems});
}

/// @nodoc
class __$$ActionSchemaImplCopyWithImpl<$Res>
    extends _$ActionSchemaCopyWithImpl<$Res, _$ActionSchemaImpl>
    implements _$$ActionSchemaImplCopyWith<$Res> {
  __$$ActionSchemaImplCopyWithImpl(
      _$ActionSchemaImpl _value, $Res Function(_$ActionSchemaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? buttonName = null,
    Object? buttonType = null,
    Object? actionItems = null,
  }) {
    return _then(_$ActionSchemaImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      buttonName: null == buttonName
          ? _value.buttonName
          : buttonName // ignore: cast_nullable_to_non_nullable
              as String,
      buttonType: null == buttonType
          ? _value.buttonType
          : buttonType // ignore: cast_nullable_to_non_nullable
              as ButtonType,
      actionItems: null == actionItems
          ? _value._actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<ActionItemSchema>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ActionSchemaImpl implements _ActionSchema {
  const _$ActionSchemaImpl(
      {required this.name,
      required this.buttonName,
      this.buttonType = ButtonType.elevated,
      required final List<ActionItemSchema> actionItems})
      : _actionItems = actionItems;

  factory _$ActionSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionSchemaImplFromJson(json);

  @override
  final String name;
  @override
  final String buttonName;
  @override
  @JsonKey()
  final ButtonType buttonType;
  final List<ActionItemSchema> _actionItems;
  @override
  List<ActionItemSchema> get actionItems {
    if (_actionItems is EqualUnmodifiableListView) return _actionItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionItems);
  }

  @override
  String toString() {
    return 'ActionSchema(name: $name, buttonName: $buttonName, buttonType: $buttonType, actionItems: $actionItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionSchemaImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.buttonName, buttonName) ||
                other.buttonName == buttonName) &&
            (identical(other.buttonType, buttonType) ||
                other.buttonType == buttonType) &&
            const DeepCollectionEquality()
                .equals(other._actionItems, _actionItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, buttonName, buttonType,
      const DeepCollectionEquality().hash(_actionItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionSchemaImplCopyWith<_$ActionSchemaImpl> get copyWith =>
      __$$ActionSchemaImplCopyWithImpl<_$ActionSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionSchemaImplToJson(
      this,
    );
  }
}

abstract class _ActionSchema implements ActionSchema {
  const factory _ActionSchema(
      {required final String name,
      required final String buttonName,
      final ButtonType buttonType,
      required final List<ActionItemSchema> actionItems}) = _$ActionSchemaImpl;

  factory _ActionSchema.fromJson(Map<String, dynamic> json) =
      _$ActionSchemaImpl.fromJson;

  @override
  String get name;
  @override
  String get buttonName;
  @override
  ButtonType get buttonType;
  @override
  List<ActionItemSchema> get actionItems;
  @override
  @JsonKey(ignore: true)
  _$$ActionSchemaImplCopyWith<_$ActionSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActionItemSchema _$ActionItemSchemaFromJson(Map<String, dynamic> json) {
  return _ActionItemSchema.fromJson(json);
}

/// @nodoc
mixin _$ActionItemSchema {
  ActionType get type => throw _privateConstructorUsedError;
  UrlSchema? get urlSchema => throw _privateConstructorUsedError;
  RoutingSchema? get routingSchema => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActionItemSchemaCopyWith<ActionItemSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionItemSchemaCopyWith<$Res> {
  factory $ActionItemSchemaCopyWith(
          ActionItemSchema value, $Res Function(ActionItemSchema) then) =
      _$ActionItemSchemaCopyWithImpl<$Res, ActionItemSchema>;
  @useResult
  $Res call(
      {ActionType type, UrlSchema? urlSchema, RoutingSchema? routingSchema});

  $UrlSchemaCopyWith<$Res>? get urlSchema;
  $RoutingSchemaCopyWith<$Res>? get routingSchema;
}

/// @nodoc
class _$ActionItemSchemaCopyWithImpl<$Res, $Val extends ActionItemSchema>
    implements $ActionItemSchemaCopyWith<$Res> {
  _$ActionItemSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? urlSchema = freezed,
    Object? routingSchema = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActionType,
      urlSchema: freezed == urlSchema
          ? _value.urlSchema
          : urlSchema // ignore: cast_nullable_to_non_nullable
              as UrlSchema?,
      routingSchema: freezed == routingSchema
          ? _value.routingSchema
          : routingSchema // ignore: cast_nullable_to_non_nullable
              as RoutingSchema?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UrlSchemaCopyWith<$Res>? get urlSchema {
    if (_value.urlSchema == null) {
      return null;
    }

    return $UrlSchemaCopyWith<$Res>(_value.urlSchema!, (value) {
      return _then(_value.copyWith(urlSchema: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RoutingSchemaCopyWith<$Res>? get routingSchema {
    if (_value.routingSchema == null) {
      return null;
    }

    return $RoutingSchemaCopyWith<$Res>(_value.routingSchema!, (value) {
      return _then(_value.copyWith(routingSchema: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActionItemSchemaImplCopyWith<$Res>
    implements $ActionItemSchemaCopyWith<$Res> {
  factory _$$ActionItemSchemaImplCopyWith(_$ActionItemSchemaImpl value,
          $Res Function(_$ActionItemSchemaImpl) then) =
      __$$ActionItemSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ActionType type, UrlSchema? urlSchema, RoutingSchema? routingSchema});

  @override
  $UrlSchemaCopyWith<$Res>? get urlSchema;
  @override
  $RoutingSchemaCopyWith<$Res>? get routingSchema;
}

/// @nodoc
class __$$ActionItemSchemaImplCopyWithImpl<$Res>
    extends _$ActionItemSchemaCopyWithImpl<$Res, _$ActionItemSchemaImpl>
    implements _$$ActionItemSchemaImplCopyWith<$Res> {
  __$$ActionItemSchemaImplCopyWithImpl(_$ActionItemSchemaImpl _value,
      $Res Function(_$ActionItemSchemaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? urlSchema = freezed,
    Object? routingSchema = freezed,
  }) {
    return _then(_$ActionItemSchemaImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActionType,
      urlSchema: freezed == urlSchema
          ? _value.urlSchema
          : urlSchema // ignore: cast_nullable_to_non_nullable
              as UrlSchema?,
      routingSchema: freezed == routingSchema
          ? _value.routingSchema
          : routingSchema // ignore: cast_nullable_to_non_nullable
              as RoutingSchema?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$ActionItemSchemaImpl implements _ActionItemSchema {
  const _$ActionItemSchemaImpl(
      {required this.type, this.urlSchema, this.routingSchema});

  factory _$ActionItemSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionItemSchemaImplFromJson(json);

  @override
  final ActionType type;
  @override
  final UrlSchema? urlSchema;
  @override
  final RoutingSchema? routingSchema;

  @override
  String toString() {
    return 'ActionItemSchema(type: $type, urlSchema: $urlSchema, routingSchema: $routingSchema)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionItemSchemaImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.urlSchema, urlSchema) ||
                other.urlSchema == urlSchema) &&
            (identical(other.routingSchema, routingSchema) ||
                other.routingSchema == routingSchema));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, urlSchema, routingSchema);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionItemSchemaImplCopyWith<_$ActionItemSchemaImpl> get copyWith =>
      __$$ActionItemSchemaImplCopyWithImpl<_$ActionItemSchemaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionItemSchemaImplToJson(
      this,
    );
  }
}

abstract class _ActionItemSchema implements ActionItemSchema {
  const factory _ActionItemSchema(
      {required final ActionType type,
      final UrlSchema? urlSchema,
      final RoutingSchema? routingSchema}) = _$ActionItemSchemaImpl;

  factory _ActionItemSchema.fromJson(Map<String, dynamic> json) =
      _$ActionItemSchemaImpl.fromJson;

  @override
  ActionType get type;
  @override
  UrlSchema? get urlSchema;
  @override
  RoutingSchema? get routingSchema;
  @override
  @JsonKey(ignore: true)
  _$$ActionItemSchemaImplCopyWith<_$ActionItemSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UrlSchema _$UrlSchemaFromJson(Map<String, dynamic> json) {
  return _UrlSchema.fromJson(json);
}

/// @nodoc
mixin _$UrlSchema {
  String get method => throw _privateConstructorUsedError;
  String get urlSchema => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UrlSchemaCopyWith<UrlSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UrlSchemaCopyWith<$Res> {
  factory $UrlSchemaCopyWith(UrlSchema value, $Res Function(UrlSchema) then) =
      _$UrlSchemaCopyWithImpl<$Res, UrlSchema>;
  @useResult
  $Res call({String method, String urlSchema});
}

/// @nodoc
class _$UrlSchemaCopyWithImpl<$Res, $Val extends UrlSchema>
    implements $UrlSchemaCopyWith<$Res> {
  _$UrlSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? urlSchema = null,
  }) {
    return _then(_value.copyWith(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      urlSchema: null == urlSchema
          ? _value.urlSchema
          : urlSchema // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UrlSchemaImplCopyWith<$Res>
    implements $UrlSchemaCopyWith<$Res> {
  factory _$$UrlSchemaImplCopyWith(
          _$UrlSchemaImpl value, $Res Function(_$UrlSchemaImpl) then) =
      __$$UrlSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String method, String urlSchema});
}

/// @nodoc
class __$$UrlSchemaImplCopyWithImpl<$Res>
    extends _$UrlSchemaCopyWithImpl<$Res, _$UrlSchemaImpl>
    implements _$$UrlSchemaImplCopyWith<$Res> {
  __$$UrlSchemaImplCopyWithImpl(
      _$UrlSchemaImpl _value, $Res Function(_$UrlSchemaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? urlSchema = null,
  }) {
    return _then(_$UrlSchemaImpl(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      urlSchema: null == urlSchema
          ? _value.urlSchema
          : urlSchema // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UrlSchemaImpl implements _UrlSchema {
  const _$UrlSchemaImpl({required this.method, required this.urlSchema});

  factory _$UrlSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$UrlSchemaImplFromJson(json);

  @override
  final String method;
  @override
  final String urlSchema;

  @override
  String toString() {
    return 'UrlSchema(method: $method, urlSchema: $urlSchema)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UrlSchemaImpl &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.urlSchema, urlSchema) ||
                other.urlSchema == urlSchema));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, method, urlSchema);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UrlSchemaImplCopyWith<_$UrlSchemaImpl> get copyWith =>
      __$$UrlSchemaImplCopyWithImpl<_$UrlSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UrlSchemaImplToJson(
      this,
    );
  }
}

abstract class _UrlSchema implements UrlSchema {
  const factory _UrlSchema(
      {required final String method,
      required final String urlSchema}) = _$UrlSchemaImpl;

  factory _UrlSchema.fromJson(Map<String, dynamic> json) =
      _$UrlSchemaImpl.fromJson;

  @override
  String get method;
  @override
  String get urlSchema;
  @override
  @JsonKey(ignore: true)
  _$$UrlSchemaImplCopyWith<_$UrlSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoutingSchema _$RoutingSchemaFromJson(Map<String, dynamic> json) {
  return _RoutingSchema.fromJson(json);
}

/// @nodoc
mixin _$RoutingSchema {
  String get destination => throw _privateConstructorUsedError;
  PropertySchema? get propertySchema => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoutingSchemaCopyWith<RoutingSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutingSchemaCopyWith<$Res> {
  factory $RoutingSchemaCopyWith(
          RoutingSchema value, $Res Function(RoutingSchema) then) =
      _$RoutingSchemaCopyWithImpl<$Res, RoutingSchema>;
  @useResult
  $Res call({String destination, PropertySchema? propertySchema});

  $PropertySchemaCopyWith<$Res>? get propertySchema;
}

/// @nodoc
class _$RoutingSchemaCopyWithImpl<$Res, $Val extends RoutingSchema>
    implements $RoutingSchemaCopyWith<$Res> {
  _$RoutingSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destination = null,
    Object? propertySchema = freezed,
  }) {
    return _then(_value.copyWith(
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      propertySchema: freezed == propertySchema
          ? _value.propertySchema
          : propertySchema // ignore: cast_nullable_to_non_nullable
              as PropertySchema?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PropertySchemaCopyWith<$Res>? get propertySchema {
    if (_value.propertySchema == null) {
      return null;
    }

    return $PropertySchemaCopyWith<$Res>(_value.propertySchema!, (value) {
      return _then(_value.copyWith(propertySchema: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoutingSchemaImplCopyWith<$Res>
    implements $RoutingSchemaCopyWith<$Res> {
  factory _$$RoutingSchemaImplCopyWith(
          _$RoutingSchemaImpl value, $Res Function(_$RoutingSchemaImpl) then) =
      __$$RoutingSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String destination, PropertySchema? propertySchema});

  @override
  $PropertySchemaCopyWith<$Res>? get propertySchema;
}

/// @nodoc
class __$$RoutingSchemaImplCopyWithImpl<$Res>
    extends _$RoutingSchemaCopyWithImpl<$Res, _$RoutingSchemaImpl>
    implements _$$RoutingSchemaImplCopyWith<$Res> {
  __$$RoutingSchemaImplCopyWithImpl(
      _$RoutingSchemaImpl _value, $Res Function(_$RoutingSchemaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destination = null,
    Object? propertySchema = freezed,
  }) {
    return _then(_$RoutingSchemaImpl(
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      propertySchema: freezed == propertySchema
          ? _value.propertySchema
          : propertySchema // ignore: cast_nullable_to_non_nullable
              as PropertySchema?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RoutingSchemaImpl implements _RoutingSchema {
  const _$RoutingSchemaImpl({required this.destination, this.propertySchema});

  factory _$RoutingSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoutingSchemaImplFromJson(json);

  @override
  final String destination;
  @override
  final PropertySchema? propertySchema;

  @override
  String toString() {
    return 'RoutingSchema(destination: $destination, propertySchema: $propertySchema)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutingSchemaImpl &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.propertySchema, propertySchema) ||
                other.propertySchema == propertySchema));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, destination, propertySchema);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutingSchemaImplCopyWith<_$RoutingSchemaImpl> get copyWith =>
      __$$RoutingSchemaImplCopyWithImpl<_$RoutingSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoutingSchemaImplToJson(
      this,
    );
  }
}

abstract class _RoutingSchema implements RoutingSchema {
  const factory _RoutingSchema(
      {required final String destination,
      final PropertySchema? propertySchema}) = _$RoutingSchemaImpl;

  factory _RoutingSchema.fromJson(Map<String, dynamic> json) =
      _$RoutingSchemaImpl.fromJson;

  @override
  String get destination;
  @override
  PropertySchema? get propertySchema;
  @override
  @JsonKey(ignore: true)
  _$$RoutingSchemaImplCopyWith<_$RoutingSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

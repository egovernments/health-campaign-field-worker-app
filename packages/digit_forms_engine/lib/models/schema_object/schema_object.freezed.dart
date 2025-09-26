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
  bool get summary => throw _privateConstructorUsedError;
  SummaryItem? get summaryDetails => throw _privateConstructorUsedError;
  Map<String, PropertySchema> get pages => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _showAlertOrNull)
  ShowAlertPopUp? get showAlertPopUp => throw _privateConstructorUsedError;
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
      bool summary,
      SummaryItem? summaryDetails,
      Map<String, PropertySchema> pages,
      @JsonKey(fromJson: _showAlertOrNull) ShowAlertPopUp? showAlertPopUp,
      List<ActionSchema>? actionSchema});

  $SummaryItemCopyWith<$Res>? get summaryDetails;
  $ShowAlertPopUpCopyWith<$Res>? get showAlertPopUp;
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
    Object? summary = null,
    Object? summaryDetails = freezed,
    Object? pages = null,
    Object? showAlertPopUp = freezed,
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
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as bool,
      summaryDetails: freezed == summaryDetails
          ? _value.summaryDetails
          : summaryDetails // ignore: cast_nullable_to_non_nullable
              as SummaryItem?,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as Map<String, PropertySchema>,
      showAlertPopUp: freezed == showAlertPopUp
          ? _value.showAlertPopUp
          : showAlertPopUp // ignore: cast_nullable_to_non_nullable
              as ShowAlertPopUp?,
      actionSchema: freezed == actionSchema
          ? _value.actionSchema
          : actionSchema // ignore: cast_nullable_to_non_nullable
              as List<ActionSchema>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SummaryItemCopyWith<$Res>? get summaryDetails {
    if (_value.summaryDetails == null) {
      return null;
    }

    return $SummaryItemCopyWith<$Res>(_value.summaryDetails!, (value) {
      return _then(_value.copyWith(summaryDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShowAlertPopUpCopyWith<$Res>? get showAlertPopUp {
    if (_value.showAlertPopUp == null) {
      return null;
    }

    return $ShowAlertPopUpCopyWith<$Res>(_value.showAlertPopUp!, (value) {
      return _then(_value.copyWith(showAlertPopUp: value) as $Val);
    });
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
      bool summary,
      SummaryItem? summaryDetails,
      Map<String, PropertySchema> pages,
      @JsonKey(fromJson: _showAlertOrNull) ShowAlertPopUp? showAlertPopUp,
      List<ActionSchema>? actionSchema});

  @override
  $SummaryItemCopyWith<$Res>? get summaryDetails;
  @override
  $ShowAlertPopUpCopyWith<$Res>? get showAlertPopUp;
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
    Object? summary = null,
    Object? summaryDetails = freezed,
    Object? pages = null,
    Object? showAlertPopUp = freezed,
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
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as bool,
      summaryDetails: freezed == summaryDetails
          ? _value.summaryDetails
          : summaryDetails // ignore: cast_nullable_to_non_nullable
              as SummaryItem?,
      pages: null == pages
          ? _value._pages
          : pages // ignore: cast_nullable_to_non_nullable
              as Map<String, PropertySchema>,
      showAlertPopUp: freezed == showAlertPopUp
          ? _value.showAlertPopUp
          : showAlertPopUp // ignore: cast_nullable_to_non_nullable
              as ShowAlertPopUp?,
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
      this.summary = false,
      this.summaryDetails,
      final Map<String, PropertySchema> pages = const {},
      @JsonKey(fromJson: _showAlertOrNull) this.showAlertPopUp,
      final List<ActionSchema>? actionSchema})
      : _pages = pages,
        _actionSchema = actionSchema;

  factory _$SchemaObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$SchemaObjectImplFromJson(json);

  @override
  final String name;
  @override
  final int version;
  @override
  @JsonKey()
  final bool summary;
  @override
  final SummaryItem? summaryDetails;
  final Map<String, PropertySchema> _pages;
  @override
  @JsonKey()
  Map<String, PropertySchema> get pages {
    if (_pages is EqualUnmodifiableMapView) return _pages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pages);
  }

  @override
  @JsonKey(fromJson: _showAlertOrNull)
  final ShowAlertPopUp? showAlertPopUp;
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
    return 'SchemaObject(name: $name, version: $version, summary: $summary, summaryDetails: $summaryDetails, pages: $pages, showAlertPopUp: $showAlertPopUp, actionSchema: $actionSchema)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchemaObjectImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.summaryDetails, summaryDetails) ||
                other.summaryDetails == summaryDetails) &&
            const DeepCollectionEquality().equals(other._pages, _pages) &&
            (identical(other.showAlertPopUp, showAlertPopUp) ||
                other.showAlertPopUp == showAlertPopUp) &&
            const DeepCollectionEquality()
                .equals(other._actionSchema, _actionSchema));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      version,
      summary,
      summaryDetails,
      const DeepCollectionEquality().hash(_pages),
      showAlertPopUp,
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
      final bool summary,
      final SummaryItem? summaryDetails,
      final Map<String, PropertySchema> pages,
      @JsonKey(fromJson: _showAlertOrNull) final ShowAlertPopUp? showAlertPopUp,
      final List<ActionSchema>? actionSchema}) = _$SchemaObjectImpl;

  factory _SchemaObject.fromJson(Map<String, dynamic> json) =
      _$SchemaObjectImpl.fromJson;

  @override
  String get name;
  @override
  int get version;
  @override
  bool get summary;
  @override
  SummaryItem? get summaryDetails;
  @override
  Map<String, PropertySchema> get pages;
  @override
  @JsonKey(fromJson: _showAlertOrNull)
  ShowAlertPopUp? get showAlertPopUp;
  @override
  List<ActionSchema>? get actionSchema;
  @override
  @JsonKey(ignore: true)
  _$$SchemaObjectImplCopyWith<_$SchemaObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SummaryItem _$SummaryItemFromJson(Map<String, dynamic> json) {
  return _SummaryItem.fromJson(json);
}

/// @nodoc
mixin _$SummaryItem {
  String get heading => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get show => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SummaryItemCopyWith<SummaryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryItemCopyWith<$Res> {
  factory $SummaryItemCopyWith(
          SummaryItem value, $Res Function(SummaryItem) then) =
      _$SummaryItemCopyWithImpl<$Res, SummaryItem>;
  @useResult
  $Res call({String heading, String? description, bool show});
}

/// @nodoc
class _$SummaryItemCopyWithImpl<$Res, $Val extends SummaryItem>
    implements $SummaryItemCopyWith<$Res> {
  _$SummaryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heading = null,
    Object? description = freezed,
    Object? show = null,
  }) {
    return _then(_value.copyWith(
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummaryItemImplCopyWith<$Res>
    implements $SummaryItemCopyWith<$Res> {
  factory _$$SummaryItemImplCopyWith(
          _$SummaryItemImpl value, $Res Function(_$SummaryItemImpl) then) =
      __$$SummaryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String heading, String? description, bool show});
}

/// @nodoc
class __$$SummaryItemImplCopyWithImpl<$Res>
    extends _$SummaryItemCopyWithImpl<$Res, _$SummaryItemImpl>
    implements _$$SummaryItemImplCopyWith<$Res> {
  __$$SummaryItemImplCopyWithImpl(
      _$SummaryItemImpl _value, $Res Function(_$SummaryItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heading = null,
    Object? description = freezed,
    Object? show = null,
  }) {
    return _then(_$SummaryItemImpl(
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryItemImpl implements _SummaryItem {
  const _$SummaryItemImpl(
      {required this.heading, this.description, this.show = false});

  factory _$SummaryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryItemImplFromJson(json);

  @override
  final String heading;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool show;

  @override
  String toString() {
    return 'SummaryItem(heading: $heading, description: $description, show: $show)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryItemImpl &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.show, show) || other.show == show));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, heading, description, show);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryItemImplCopyWith<_$SummaryItemImpl> get copyWith =>
      __$$SummaryItemImplCopyWithImpl<_$SummaryItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryItemImplToJson(
      this,
    );
  }
}

abstract class _SummaryItem implements SummaryItem {
  const factory _SummaryItem(
      {required final String heading,
      final String? description,
      final bool show}) = _$SummaryItemImpl;

  factory _SummaryItem.fromJson(Map<String, dynamic> json) =
      _$SummaryItemImpl.fromJson;

  @override
  String get heading;
  @override
  String? get description;
  @override
  bool get show;
  @override
  @JsonKey(ignore: true)
  _$$SummaryItemImplCopyWith<_$SummaryItemImpl> get copyWith =>
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

ShowAlertPopUp _$ShowAlertPopUpFromJson(Map<String, dynamic> json) {
  return _ShowAlertPopUp.fromJson(json);
}

/// @nodoc
mixin _$ShowAlertPopUp {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError; // optional
  String get primaryActionLabel => throw _privateConstructorUsedError;
  String get secondaryActionLabel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowAlertPopUpCopyWith<ShowAlertPopUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowAlertPopUpCopyWith<$Res> {
  factory $ShowAlertPopUpCopyWith(
          ShowAlertPopUp value, $Res Function(ShowAlertPopUp) then) =
      _$ShowAlertPopUpCopyWithImpl<$Res, ShowAlertPopUp>;
  @useResult
  $Res call(
      {String title,
      String? description,
      String primaryActionLabel,
      String secondaryActionLabel});
}

/// @nodoc
class _$ShowAlertPopUpCopyWithImpl<$Res, $Val extends ShowAlertPopUp>
    implements $ShowAlertPopUpCopyWith<$Res> {
  _$ShowAlertPopUpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? primaryActionLabel = null,
    Object? secondaryActionLabel = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryActionLabel: null == primaryActionLabel
          ? _value.primaryActionLabel
          : primaryActionLabel // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryActionLabel: null == secondaryActionLabel
          ? _value.secondaryActionLabel
          : secondaryActionLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShowAlertPopUpImplCopyWith<$Res>
    implements $ShowAlertPopUpCopyWith<$Res> {
  factory _$$ShowAlertPopUpImplCopyWith(_$ShowAlertPopUpImpl value,
          $Res Function(_$ShowAlertPopUpImpl) then) =
      __$$ShowAlertPopUpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String? description,
      String primaryActionLabel,
      String secondaryActionLabel});
}

/// @nodoc
class __$$ShowAlertPopUpImplCopyWithImpl<$Res>
    extends _$ShowAlertPopUpCopyWithImpl<$Res, _$ShowAlertPopUpImpl>
    implements _$$ShowAlertPopUpImplCopyWith<$Res> {
  __$$ShowAlertPopUpImplCopyWithImpl(
      _$ShowAlertPopUpImpl _value, $Res Function(_$ShowAlertPopUpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? primaryActionLabel = null,
    Object? secondaryActionLabel = null,
  }) {
    return _then(_$ShowAlertPopUpImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryActionLabel: null == primaryActionLabel
          ? _value.primaryActionLabel
          : primaryActionLabel // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryActionLabel: null == secondaryActionLabel
          ? _value.secondaryActionLabel
          : secondaryActionLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShowAlertPopUpImpl implements _ShowAlertPopUp {
  const _$ShowAlertPopUpImpl(
      {required this.title,
      this.description,
      required this.primaryActionLabel,
      required this.secondaryActionLabel});

  factory _$ShowAlertPopUpImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShowAlertPopUpImplFromJson(json);

  @override
  final String title;
  @override
  final String? description;
// optional
  @override
  final String primaryActionLabel;
  @override
  final String secondaryActionLabel;

  @override
  String toString() {
    return 'ShowAlertPopUp(title: $title, description: $description, primaryActionLabel: $primaryActionLabel, secondaryActionLabel: $secondaryActionLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowAlertPopUpImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.primaryActionLabel, primaryActionLabel) ||
                other.primaryActionLabel == primaryActionLabel) &&
            (identical(other.secondaryActionLabel, secondaryActionLabel) ||
                other.secondaryActionLabel == secondaryActionLabel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description,
      primaryActionLabel, secondaryActionLabel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowAlertPopUpImplCopyWith<_$ShowAlertPopUpImpl> get copyWith =>
      __$$ShowAlertPopUpImplCopyWithImpl<_$ShowAlertPopUpImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShowAlertPopUpImplToJson(
      this,
    );
  }
}

abstract class _ShowAlertPopUp implements ShowAlertPopUp {
  const factory _ShowAlertPopUp(
      {required final String title,
      final String? description,
      required final String primaryActionLabel,
      required final String secondaryActionLabel}) = _$ShowAlertPopUpImpl;

  factory _ShowAlertPopUp.fromJson(Map<String, dynamic> json) =
      _$ShowAlertPopUpImpl.fromJson;

  @override
  String get title;
  @override
  String? get description;
  @override // optional
  String get primaryActionLabel;
  @override
  String get secondaryActionLabel;
  @override
  @JsonKey(ignore: true)
  _$$ShowAlertPopUpImplCopyWith<_$ShowAlertPopUpImpl> get copyWith =>
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

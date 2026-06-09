// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forms.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FormsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FormsEvent()';
  }
}

/// @nodoc
class $FormsEventCopyWith<$Res> {
  $FormsEventCopyWith(FormsEvent _, $Res Function(FormsEvent) __);
}

/// Adds pattern-matching-related methods to [FormsEvent].
extension FormsEventPatterns on FormsEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormsLoadEvent value)? load,
    TResult Function(FormsUpdateFieldEvent value)? updateField,
    TResult Function(FormsUpdateEvent value)? update,
    TResult Function(FormsClearPageEvent value)? clearPage,
    TResult Function(FormsClearFormEvent value)? clearForm,
    TResult Function(FormsSubmitEvent value)? submit,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FormsLoadEvent() when load != null:
        return load(_that);
      case FormsUpdateFieldEvent() when updateField != null:
        return updateField(_that);
      case FormsUpdateEvent() when update != null:
        return update(_that);
      case FormsClearPageEvent() when clearPage != null:
        return clearPage(_that);
      case FormsClearFormEvent() when clearForm != null:
        return clearForm(_that);
      case FormsSubmitEvent() when submit != null:
        return submit(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormsLoadEvent value) load,
    required TResult Function(FormsUpdateFieldEvent value) updateField,
    required TResult Function(FormsUpdateEvent value) update,
    required TResult Function(FormsClearPageEvent value) clearPage,
    required TResult Function(FormsClearFormEvent value) clearForm,
    required TResult Function(FormsSubmitEvent value) submit,
  }) {
    final _that = this;
    switch (_that) {
      case FormsLoadEvent():
        return load(_that);
      case FormsUpdateFieldEvent():
        return updateField(_that);
      case FormsUpdateEvent():
        return update(_that);
      case FormsClearPageEvent():
        return clearPage(_that);
      case FormsClearFormEvent():
        return clearForm(_that);
      case FormsSubmitEvent():
        return submit(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormsLoadEvent value)? load,
    TResult? Function(FormsUpdateFieldEvent value)? updateField,
    TResult? Function(FormsUpdateEvent value)? update,
    TResult? Function(FormsClearPageEvent value)? clearPage,
    TResult? Function(FormsClearFormEvent value)? clearForm,
    TResult? Function(FormsSubmitEvent value)? submit,
  }) {
    final _that = this;
    switch (_that) {
      case FormsLoadEvent() when load != null:
        return load(_that);
      case FormsUpdateFieldEvent() when updateField != null:
        return updateField(_that);
      case FormsUpdateEvent() when update != null:
        return update(_that);
      case FormsClearPageEvent() when clearPage != null:
        return clearPage(_that);
      case FormsClearFormEvent() when clearForm != null:
        return clearForm(_that);
      case FormsSubmitEvent() when submit != null:
        return submit(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> schemas)? load,
    TResult Function(
            String schemaKey, String key, dynamic value, BuildContext context)?
        updateField,
    TResult Function(SchemaObject schema, String schemaKey)? update,
    TResult Function(String schemaKey, String pageKey)? clearPage,
    TResult Function(String schemaKey)? clearForm,
    TResult Function(String schemaKey, bool isEdit)? submit,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FormsLoadEvent() when load != null:
        return load(_that.schemas);
      case FormsUpdateFieldEvent() when updateField != null:
        return updateField(
            _that.schemaKey, _that.key, _that.value, _that.context);
      case FormsUpdateEvent() when update != null:
        return update(_that.schema, _that.schemaKey);
      case FormsClearPageEvent() when clearPage != null:
        return clearPage(_that.schemaKey, _that.pageKey);
      case FormsClearFormEvent() when clearForm != null:
        return clearForm(_that.schemaKey);
      case FormsSubmitEvent() when submit != null:
        return submit(_that.schemaKey, _that.isEdit);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> schemas) load,
    required TResult Function(
            String schemaKey, String key, dynamic value, BuildContext context)
        updateField,
    required TResult Function(SchemaObject schema, String schemaKey) update,
    required TResult Function(String schemaKey, String pageKey) clearPage,
    required TResult Function(String schemaKey) clearForm,
    required TResult Function(String schemaKey, bool isEdit) submit,
  }) {
    final _that = this;
    switch (_that) {
      case FormsLoadEvent():
        return load(_that.schemas);
      case FormsUpdateFieldEvent():
        return updateField(
            _that.schemaKey, _that.key, _that.value, _that.context);
      case FormsUpdateEvent():
        return update(_that.schema, _that.schemaKey);
      case FormsClearPageEvent():
        return clearPage(_that.schemaKey, _that.pageKey);
      case FormsClearFormEvent():
        return clearForm(_that.schemaKey);
      case FormsSubmitEvent():
        return submit(_that.schemaKey, _that.isEdit);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> schemas)? load,
    TResult? Function(
            String schemaKey, String key, dynamic value, BuildContext context)?
        updateField,
    TResult? Function(SchemaObject schema, String schemaKey)? update,
    TResult? Function(String schemaKey, String pageKey)? clearPage,
    TResult? Function(String schemaKey)? clearForm,
    TResult? Function(String schemaKey, bool isEdit)? submit,
  }) {
    final _that = this;
    switch (_that) {
      case FormsLoadEvent() when load != null:
        return load(_that.schemas);
      case FormsUpdateFieldEvent() when updateField != null:
        return updateField(
            _that.schemaKey, _that.key, _that.value, _that.context);
      case FormsUpdateEvent() when update != null:
        return update(_that.schema, _that.schemaKey);
      case FormsClearPageEvent() when clearPage != null:
        return clearPage(_that.schemaKey, _that.pageKey);
      case FormsClearFormEvent() when clearForm != null:
        return clearForm(_that.schemaKey);
      case FormsSubmitEvent() when submit != null:
        return submit(_that.schemaKey, _that.isEdit);
      case _:
        return null;
    }
  }
}

/// @nodoc

class FormsLoadEvent implements FormsEvent {
  const FormsLoadEvent({required final List<String> schemas})
      : _schemas = schemas;

  final List<String> _schemas;
  List<String> get schemas {
    if (_schemas is EqualUnmodifiableListView) return _schemas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schemas);
  }

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormsLoadEventCopyWith<FormsLoadEvent> get copyWith =>
      _$FormsLoadEventCopyWithImpl<FormsLoadEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormsLoadEvent &&
            const DeepCollectionEquality().equals(other._schemas, _schemas));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_schemas));

  @override
  String toString() {
    return 'FormsEvent.load(schemas: $schemas)';
  }
}

/// @nodoc
abstract mixin class $FormsLoadEventCopyWith<$Res>
    implements $FormsEventCopyWith<$Res> {
  factory $FormsLoadEventCopyWith(
          FormsLoadEvent value, $Res Function(FormsLoadEvent) _then) =
      _$FormsLoadEventCopyWithImpl;
  @useResult
  $Res call({List<String> schemas});
}

/// @nodoc
class _$FormsLoadEventCopyWithImpl<$Res>
    implements $FormsLoadEventCopyWith<$Res> {
  _$FormsLoadEventCopyWithImpl(this._self, this._then);

  final FormsLoadEvent _self;
  final $Res Function(FormsLoadEvent) _then;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? schemas = null,
  }) {
    return _then(FormsLoadEvent(
      schemas: null == schemas
          ? _self._schemas
          : schemas // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class FormsUpdateFieldEvent implements FormsEvent {
  const FormsUpdateFieldEvent(
      {required this.schemaKey,
      required this.key,
      required this.value,
      required this.context});

  final String schemaKey;
  final String key;
  final dynamic value;
  final BuildContext context;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormsUpdateFieldEventCopyWith<FormsUpdateFieldEvent> get copyWith =>
      _$FormsUpdateFieldEventCopyWithImpl<FormsUpdateFieldEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormsUpdateFieldEvent &&
            (identical(other.schemaKey, schemaKey) ||
                other.schemaKey == schemaKey) &&
            (identical(other.key, key) || other.key == key) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schemaKey, key,
      const DeepCollectionEquality().hash(value), context);

  @override
  String toString() {
    return 'FormsEvent.updateField(schemaKey: $schemaKey, key: $key, value: $value, context: $context)';
  }
}

/// @nodoc
abstract mixin class $FormsUpdateFieldEventCopyWith<$Res>
    implements $FormsEventCopyWith<$Res> {
  factory $FormsUpdateFieldEventCopyWith(FormsUpdateFieldEvent value,
          $Res Function(FormsUpdateFieldEvent) _then) =
      _$FormsUpdateFieldEventCopyWithImpl;
  @useResult
  $Res call(
      {String schemaKey, String key, dynamic value, BuildContext context});
}

/// @nodoc
class _$FormsUpdateFieldEventCopyWithImpl<$Res>
    implements $FormsUpdateFieldEventCopyWith<$Res> {
  _$FormsUpdateFieldEventCopyWithImpl(this._self, this._then);

  final FormsUpdateFieldEvent _self;
  final $Res Function(FormsUpdateFieldEvent) _then;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? schemaKey = null,
    Object? key = null,
    Object? value = freezed,
    Object? context = null,
  }) {
    return _then(FormsUpdateFieldEvent(
      schemaKey: null == schemaKey
          ? _self.schemaKey
          : schemaKey // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      context: null == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class FormsUpdateEvent implements FormsEvent {
  const FormsUpdateEvent({required this.schema, required this.schemaKey});

  final SchemaObject schema;
  final String schemaKey;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormsUpdateEventCopyWith<FormsUpdateEvent> get copyWith =>
      _$FormsUpdateEventCopyWithImpl<FormsUpdateEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormsUpdateEvent &&
            (identical(other.schema, schema) || other.schema == schema) &&
            (identical(other.schemaKey, schemaKey) ||
                other.schemaKey == schemaKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schema, schemaKey);

  @override
  String toString() {
    return 'FormsEvent.update(schema: $schema, schemaKey: $schemaKey)';
  }
}

/// @nodoc
abstract mixin class $FormsUpdateEventCopyWith<$Res>
    implements $FormsEventCopyWith<$Res> {
  factory $FormsUpdateEventCopyWith(
          FormsUpdateEvent value, $Res Function(FormsUpdateEvent) _then) =
      _$FormsUpdateEventCopyWithImpl;
  @useResult
  $Res call({SchemaObject schema, String schemaKey});

  $SchemaObjectCopyWith<$Res> get schema;
}

/// @nodoc
class _$FormsUpdateEventCopyWithImpl<$Res>
    implements $FormsUpdateEventCopyWith<$Res> {
  _$FormsUpdateEventCopyWithImpl(this._self, this._then);

  final FormsUpdateEvent _self;
  final $Res Function(FormsUpdateEvent) _then;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? schema = null,
    Object? schemaKey = null,
  }) {
    return _then(FormsUpdateEvent(
      schema: null == schema
          ? _self.schema
          : schema // ignore: cast_nullable_to_non_nullable
              as SchemaObject,
      schemaKey: null == schemaKey
          ? _self.schemaKey
          : schemaKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemaObjectCopyWith<$Res> get schema {
    return $SchemaObjectCopyWith<$Res>(_self.schema, (value) {
      return _then(_self.copyWith(schema: value));
    });
  }
}

/// @nodoc

class FormsClearPageEvent implements FormsEvent {
  const FormsClearPageEvent({required this.schemaKey, required this.pageKey});

  final String schemaKey;
  final String pageKey;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormsClearPageEventCopyWith<FormsClearPageEvent> get copyWith =>
      _$FormsClearPageEventCopyWithImpl<FormsClearPageEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormsClearPageEvent &&
            (identical(other.schemaKey, schemaKey) ||
                other.schemaKey == schemaKey) &&
            (identical(other.pageKey, pageKey) || other.pageKey == pageKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schemaKey, pageKey);

  @override
  String toString() {
    return 'FormsEvent.clearPage(schemaKey: $schemaKey, pageKey: $pageKey)';
  }
}

/// @nodoc
abstract mixin class $FormsClearPageEventCopyWith<$Res>
    implements $FormsEventCopyWith<$Res> {
  factory $FormsClearPageEventCopyWith(
          FormsClearPageEvent value, $Res Function(FormsClearPageEvent) _then) =
      _$FormsClearPageEventCopyWithImpl;
  @useResult
  $Res call({String schemaKey, String pageKey});
}

/// @nodoc
class _$FormsClearPageEventCopyWithImpl<$Res>
    implements $FormsClearPageEventCopyWith<$Res> {
  _$FormsClearPageEventCopyWithImpl(this._self, this._then);

  final FormsClearPageEvent _self;
  final $Res Function(FormsClearPageEvent) _then;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? schemaKey = null,
    Object? pageKey = null,
  }) {
    return _then(FormsClearPageEvent(
      schemaKey: null == schemaKey
          ? _self.schemaKey
          : schemaKey // ignore: cast_nullable_to_non_nullable
              as String,
      pageKey: null == pageKey
          ? _self.pageKey
          : pageKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class FormsClearFormEvent implements FormsEvent {
  const FormsClearFormEvent({required this.schemaKey});

  final String schemaKey;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormsClearFormEventCopyWith<FormsClearFormEvent> get copyWith =>
      _$FormsClearFormEventCopyWithImpl<FormsClearFormEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormsClearFormEvent &&
            (identical(other.schemaKey, schemaKey) ||
                other.schemaKey == schemaKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schemaKey);

  @override
  String toString() {
    return 'FormsEvent.clearForm(schemaKey: $schemaKey)';
  }
}

/// @nodoc
abstract mixin class $FormsClearFormEventCopyWith<$Res>
    implements $FormsEventCopyWith<$Res> {
  factory $FormsClearFormEventCopyWith(
          FormsClearFormEvent value, $Res Function(FormsClearFormEvent) _then) =
      _$FormsClearFormEventCopyWithImpl;
  @useResult
  $Res call({String schemaKey});
}

/// @nodoc
class _$FormsClearFormEventCopyWithImpl<$Res>
    implements $FormsClearFormEventCopyWith<$Res> {
  _$FormsClearFormEventCopyWithImpl(this._self, this._then);

  final FormsClearFormEvent _self;
  final $Res Function(FormsClearFormEvent) _then;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? schemaKey = null,
  }) {
    return _then(FormsClearFormEvent(
      schemaKey: null == schemaKey
          ? _self.schemaKey
          : schemaKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class FormsSubmitEvent implements FormsEvent {
  const FormsSubmitEvent({required this.schemaKey, this.isEdit = false});

  final String schemaKey;
  @JsonKey()
  final bool isEdit;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormsSubmitEventCopyWith<FormsSubmitEvent> get copyWith =>
      _$FormsSubmitEventCopyWithImpl<FormsSubmitEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormsSubmitEvent &&
            (identical(other.schemaKey, schemaKey) ||
                other.schemaKey == schemaKey) &&
            (identical(other.isEdit, isEdit) || other.isEdit == isEdit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schemaKey, isEdit);

  @override
  String toString() {
    return 'FormsEvent.submit(schemaKey: $schemaKey, isEdit: $isEdit)';
  }
}

/// @nodoc
abstract mixin class $FormsSubmitEventCopyWith<$Res>
    implements $FormsEventCopyWith<$Res> {
  factory $FormsSubmitEventCopyWith(
          FormsSubmitEvent value, $Res Function(FormsSubmitEvent) _then) =
      _$FormsSubmitEventCopyWithImpl;
  @useResult
  $Res call({String schemaKey, bool isEdit});
}

/// @nodoc
class _$FormsSubmitEventCopyWithImpl<$Res>
    implements $FormsSubmitEventCopyWith<$Res> {
  _$FormsSubmitEventCopyWithImpl(this._self, this._then);

  final FormsSubmitEvent _self;
  final $Res Function(FormsSubmitEvent) _then;

  /// Create a copy of FormsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? schemaKey = null,
    Object? isEdit = null,
  }) {
    return _then(FormsSubmitEvent(
      schemaKey: null == schemaKey
          ? _self.schemaKey
          : schemaKey // ignore: cast_nullable_to_non_nullable
              as String,
      isEdit: null == isEdit
          ? _self.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$FormsState {
  Map<String, SchemaObject> get cachedSchemas;
  Map<String, SchemaObject> get initialSchemas;
  String? get activeSchemaKey;

  /// Create a copy of FormsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormsStateCopyWith<FormsState> get copyWith =>
      _$FormsStateCopyWithImpl<FormsState>(this as FormsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormsState &&
            const DeepCollectionEquality()
                .equals(other.cachedSchemas, cachedSchemas) &&
            const DeepCollectionEquality()
                .equals(other.initialSchemas, initialSchemas) &&
            (identical(other.activeSchemaKey, activeSchemaKey) ||
                other.activeSchemaKey == activeSchemaKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cachedSchemas),
      const DeepCollectionEquality().hash(initialSchemas),
      activeSchemaKey);

  @override
  String toString() {
    return 'FormsState(cachedSchemas: $cachedSchemas, initialSchemas: $initialSchemas, activeSchemaKey: $activeSchemaKey)';
  }
}

/// @nodoc
abstract mixin class $FormsStateCopyWith<$Res> {
  factory $FormsStateCopyWith(
          FormsState value, $Res Function(FormsState) _then) =
      _$FormsStateCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, SchemaObject> cachedSchemas,
      Map<String, SchemaObject> initialSchemas,
      String? activeSchemaKey});
}

/// @nodoc
class _$FormsStateCopyWithImpl<$Res> implements $FormsStateCopyWith<$Res> {
  _$FormsStateCopyWithImpl(this._self, this._then);

  final FormsState _self;
  final $Res Function(FormsState) _then;

  /// Create a copy of FormsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cachedSchemas = null,
    Object? initialSchemas = null,
    Object? activeSchemaKey = freezed,
  }) {
    return _then(_self.copyWith(
      cachedSchemas: null == cachedSchemas
          ? _self.cachedSchemas
          : cachedSchemas // ignore: cast_nullable_to_non_nullable
              as Map<String, SchemaObject>,
      initialSchemas: null == initialSchemas
          ? _self.initialSchemas
          : initialSchemas // ignore: cast_nullable_to_non_nullable
              as Map<String, SchemaObject>,
      activeSchemaKey: freezed == activeSchemaKey
          ? _self.activeSchemaKey
          : activeSchemaKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [FormsState].
extension FormsStatePatterns on FormsState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FormsState value)? $default, {
    TResult Function(FormsSubmittedState value)? formSubmitted,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FormsState() when $default != null:
        return $default(_that);
      case FormsSubmittedState() when formSubmitted != null:
        return formSubmitted(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FormsState value) $default, {
    required TResult Function(FormsSubmittedState value) formSubmitted,
  }) {
    final _that = this;
    switch (_that) {
      case _FormsState():
        return $default(_that);
      case FormsSubmittedState():
        return formSubmitted(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FormsState value)? $default, {
    TResult? Function(FormsSubmittedState value)? formSubmitted,
  }) {
    final _that = this;
    switch (_that) {
      case _FormsState() when $default != null:
        return $default(_that);
      case FormsSubmittedState() when formSubmitted != null:
        return formSubmitted(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case _FormsState() when $default != null:
        return $default(
            _that.cachedSchemas, _that.initialSchemas, _that.activeSchemaKey);
      case FormsSubmittedState() when formSubmitted != null:
        return formSubmitted(_that.schema, _that.formData, _that.cachedSchemas,
            _that.initialSchemas, _that.isEdit, _that.activeSchemaKey);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case _FormsState():
        return $default(
            _that.cachedSchemas, _that.initialSchemas, _that.activeSchemaKey);
      case FormsSubmittedState():
        return formSubmitted(_that.schema, _that.formData, _that.cachedSchemas,
            _that.initialSchemas, _that.isEdit, _that.activeSchemaKey);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case _FormsState() when $default != null:
        return $default(
            _that.cachedSchemas, _that.initialSchemas, _that.activeSchemaKey);
      case FormsSubmittedState() when formSubmitted != null:
        return formSubmitted(_that.schema, _that.formData, _that.cachedSchemas,
            _that.initialSchemas, _that.isEdit, _that.activeSchemaKey);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FormsState implements FormsState {
  const _FormsState(
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

  /// Create a copy of FormsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FormsStateCopyWith<_FormsState> get copyWith =>
      __$FormsStateCopyWithImpl<_FormsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FormsState &&
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

  @override
  String toString() {
    return 'FormsState(cachedSchemas: $cachedSchemas, initialSchemas: $initialSchemas, activeSchemaKey: $activeSchemaKey)';
  }
}

/// @nodoc
abstract mixin class _$FormsStateCopyWith<$Res>
    implements $FormsStateCopyWith<$Res> {
  factory _$FormsStateCopyWith(
          _FormsState value, $Res Function(_FormsState) _then) =
      __$FormsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Map<String, SchemaObject> cachedSchemas,
      Map<String, SchemaObject> initialSchemas,
      String? activeSchemaKey});
}

/// @nodoc
class __$FormsStateCopyWithImpl<$Res> implements _$FormsStateCopyWith<$Res> {
  __$FormsStateCopyWithImpl(this._self, this._then);

  final _FormsState _self;
  final $Res Function(_FormsState) _then;

  /// Create a copy of FormsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cachedSchemas = null,
    Object? initialSchemas = null,
    Object? activeSchemaKey = freezed,
  }) {
    return _then(_FormsState(
      cachedSchemas: null == cachedSchemas
          ? _self._cachedSchemas
          : cachedSchemas // ignore: cast_nullable_to_non_nullable
              as Map<String, SchemaObject>,
      initialSchemas: null == initialSchemas
          ? _self._initialSchemas
          : initialSchemas // ignore: cast_nullable_to_non_nullable
              as Map<String, SchemaObject>,
      activeSchemaKey: freezed == activeSchemaKey
          ? _self.activeSchemaKey
          : activeSchemaKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class FormsSubmittedState implements FormsState {
  const FormsSubmittedState(
      {required this.schema,
      required final Map<String, Map<String, dynamic>> formData,
      required final Map<String, SchemaObject> cachedSchemas,
      required final Map<String, SchemaObject> initialSchemas,
      required this.isEdit,
      this.activeSchemaKey})
      : _formData = formData,
        _cachedSchemas = cachedSchemas,
        _initialSchemas = initialSchemas;

  final SchemaObject schema;
  final Map<String, Map<String, dynamic>> _formData;
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

  final bool isEdit;
  @override
  final String? activeSchemaKey;

  /// Create a copy of FormsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormsSubmittedStateCopyWith<FormsSubmittedState> get copyWith =>
      _$FormsSubmittedStateCopyWithImpl<FormsSubmittedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormsSubmittedState &&
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

  @override
  String toString() {
    return 'FormsState.formSubmitted(schema: $schema, formData: $formData, cachedSchemas: $cachedSchemas, initialSchemas: $initialSchemas, isEdit: $isEdit, activeSchemaKey: $activeSchemaKey)';
  }
}

/// @nodoc
abstract mixin class $FormsSubmittedStateCopyWith<$Res>
    implements $FormsStateCopyWith<$Res> {
  factory $FormsSubmittedStateCopyWith(
          FormsSubmittedState value, $Res Function(FormsSubmittedState) _then) =
      _$FormsSubmittedStateCopyWithImpl;
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
class _$FormsSubmittedStateCopyWithImpl<$Res>
    implements $FormsSubmittedStateCopyWith<$Res> {
  _$FormsSubmittedStateCopyWithImpl(this._self, this._then);

  final FormsSubmittedState _self;
  final $Res Function(FormsSubmittedState) _then;

  /// Create a copy of FormsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? schema = null,
    Object? formData = null,
    Object? cachedSchemas = null,
    Object? initialSchemas = null,
    Object? isEdit = null,
    Object? activeSchemaKey = freezed,
  }) {
    return _then(FormsSubmittedState(
      schema: null == schema
          ? _self.schema
          : schema // ignore: cast_nullable_to_non_nullable
              as SchemaObject,
      formData: null == formData
          ? _self._formData
          : formData // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, dynamic>>,
      cachedSchemas: null == cachedSchemas
          ? _self._cachedSchemas
          : cachedSchemas // ignore: cast_nullable_to_non_nullable
              as Map<String, SchemaObject>,
      initialSchemas: null == initialSchemas
          ? _self._initialSchemas
          : initialSchemas // ignore: cast_nullable_to_non_nullable
              as Map<String, SchemaObject>,
      isEdit: null == isEdit
          ? _self.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      activeSchemaKey: freezed == activeSchemaKey
          ? _self.activeSchemaKey
          : activeSchemaKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of FormsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SchemaObjectCopyWith<$Res> get schema {
    return $SchemaObjectCopyWith<$Res>(_self.schema, (value) {
      return _then(_self.copyWith(schema: value));
    });
  }
}

// dart format on

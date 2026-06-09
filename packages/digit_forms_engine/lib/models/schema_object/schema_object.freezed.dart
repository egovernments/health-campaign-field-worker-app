// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schema_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SchemaObject {
  String get name;
  int get version;
  bool get summary;
  SummaryItem? get summaryDetails;
  Map<String, PropertySchema> get pages;
  @JsonKey(fromJson: _showAlertOrNull)
  ShowAlertPopUp? get showAlertPopUp;
  List<ActionSchema>? get actionSchema;

  /// Create a copy of SchemaObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SchemaObjectCopyWith<SchemaObject> get copyWith =>
      _$SchemaObjectCopyWithImpl<SchemaObject>(
          this as SchemaObject, _$identity);

  /// Serializes this SchemaObject to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SchemaObject &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.summaryDetails, summaryDetails) ||
                other.summaryDetails == summaryDetails) &&
            const DeepCollectionEquality().equals(other.pages, pages) &&
            (identical(other.showAlertPopUp, showAlertPopUp) ||
                other.showAlertPopUp == showAlertPopUp) &&
            const DeepCollectionEquality()
                .equals(other.actionSchema, actionSchema));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      version,
      summary,
      summaryDetails,
      const DeepCollectionEquality().hash(pages),
      showAlertPopUp,
      const DeepCollectionEquality().hash(actionSchema));

  @override
  String toString() {
    return 'SchemaObject(name: $name, version: $version, summary: $summary, summaryDetails: $summaryDetails, pages: $pages, showAlertPopUp: $showAlertPopUp, actionSchema: $actionSchema)';
  }
}

/// @nodoc
abstract mixin class $SchemaObjectCopyWith<$Res> {
  factory $SchemaObjectCopyWith(
          SchemaObject value, $Res Function(SchemaObject) _then) =
      _$SchemaObjectCopyWithImpl;
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
class _$SchemaObjectCopyWithImpl<$Res> implements $SchemaObjectCopyWith<$Res> {
  _$SchemaObjectCopyWithImpl(this._self, this._then);

  final SchemaObject _self;
  final $Res Function(SchemaObject) _then;

  /// Create a copy of SchemaObject
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as bool,
      summaryDetails: freezed == summaryDetails
          ? _self.summaryDetails
          : summaryDetails // ignore: cast_nullable_to_non_nullable
              as SummaryItem?,
      pages: null == pages
          ? _self.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as Map<String, PropertySchema>,
      showAlertPopUp: freezed == showAlertPopUp
          ? _self.showAlertPopUp
          : showAlertPopUp // ignore: cast_nullable_to_non_nullable
              as ShowAlertPopUp?,
      actionSchema: freezed == actionSchema
          ? _self.actionSchema
          : actionSchema // ignore: cast_nullable_to_non_nullable
              as List<ActionSchema>?,
    ));
  }

  /// Create a copy of SchemaObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SummaryItemCopyWith<$Res>? get summaryDetails {
    if (_self.summaryDetails == null) {
      return null;
    }

    return $SummaryItemCopyWith<$Res>(_self.summaryDetails!, (value) {
      return _then(_self.copyWith(summaryDetails: value));
    });
  }

  /// Create a copy of SchemaObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShowAlertPopUpCopyWith<$Res>? get showAlertPopUp {
    if (_self.showAlertPopUp == null) {
      return null;
    }

    return $ShowAlertPopUpCopyWith<$Res>(_self.showAlertPopUp!, (value) {
      return _then(_self.copyWith(showAlertPopUp: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SchemaObject].
extension SchemaObjectPatterns on SchemaObject {
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
    TResult Function(_SchemaObject value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SchemaObject() when $default != null:
        return $default(_that);
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
    TResult Function(_SchemaObject value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SchemaObject():
        return $default(_that);
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
    TResult? Function(_SchemaObject value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SchemaObject() when $default != null:
        return $default(_that);
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
    TResult Function(
            String name,
            int version,
            bool summary,
            SummaryItem? summaryDetails,
            Map<String, PropertySchema> pages,
            @JsonKey(fromJson: _showAlertOrNull) ShowAlertPopUp? showAlertPopUp,
            List<ActionSchema>? actionSchema)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SchemaObject() when $default != null:
        return $default(
            _that.name,
            _that.version,
            _that.summary,
            _that.summaryDetails,
            _that.pages,
            _that.showAlertPopUp,
            _that.actionSchema);
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
    TResult Function(
            String name,
            int version,
            bool summary,
            SummaryItem? summaryDetails,
            Map<String, PropertySchema> pages,
            @JsonKey(fromJson: _showAlertOrNull) ShowAlertPopUp? showAlertPopUp,
            List<ActionSchema>? actionSchema)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SchemaObject():
        return $default(
            _that.name,
            _that.version,
            _that.summary,
            _that.summaryDetails,
            _that.pages,
            _that.showAlertPopUp,
            _that.actionSchema);
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
    TResult? Function(
            String name,
            int version,
            bool summary,
            SummaryItem? summaryDetails,
            Map<String, PropertySchema> pages,
            @JsonKey(fromJson: _showAlertOrNull) ShowAlertPopUp? showAlertPopUp,
            List<ActionSchema>? actionSchema)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SchemaObject() when $default != null:
        return $default(
            _that.name,
            _that.version,
            _that.summary,
            _that.summaryDetails,
            _that.pages,
            _that.showAlertPopUp,
            _that.actionSchema);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _SchemaObject implements SchemaObject {
  const _SchemaObject(
      {required this.name,
      required this.version,
      this.summary = false,
      this.summaryDetails,
      final Map<String, PropertySchema> pages = const {},
      @JsonKey(fromJson: _showAlertOrNull) this.showAlertPopUp,
      final List<ActionSchema>? actionSchema})
      : _pages = pages,
        _actionSchema = actionSchema;
  factory _SchemaObject.fromJson(Map<String, dynamic> json) =>
      _$SchemaObjectFromJson(json);

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

  /// Create a copy of SchemaObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SchemaObjectCopyWith<_SchemaObject> get copyWith =>
      __$SchemaObjectCopyWithImpl<_SchemaObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SchemaObjectToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SchemaObject &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'SchemaObject(name: $name, version: $version, summary: $summary, summaryDetails: $summaryDetails, pages: $pages, showAlertPopUp: $showAlertPopUp, actionSchema: $actionSchema)';
  }
}

/// @nodoc
abstract mixin class _$SchemaObjectCopyWith<$Res>
    implements $SchemaObjectCopyWith<$Res> {
  factory _$SchemaObjectCopyWith(
          _SchemaObject value, $Res Function(_SchemaObject) _then) =
      __$SchemaObjectCopyWithImpl;
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
class __$SchemaObjectCopyWithImpl<$Res>
    implements _$SchemaObjectCopyWith<$Res> {
  __$SchemaObjectCopyWithImpl(this._self, this._then);

  final _SchemaObject _self;
  final $Res Function(_SchemaObject) _then;

  /// Create a copy of SchemaObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? version = null,
    Object? summary = null,
    Object? summaryDetails = freezed,
    Object? pages = null,
    Object? showAlertPopUp = freezed,
    Object? actionSchema = freezed,
  }) {
    return _then(_SchemaObject(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as bool,
      summaryDetails: freezed == summaryDetails
          ? _self.summaryDetails
          : summaryDetails // ignore: cast_nullable_to_non_nullable
              as SummaryItem?,
      pages: null == pages
          ? _self._pages
          : pages // ignore: cast_nullable_to_non_nullable
              as Map<String, PropertySchema>,
      showAlertPopUp: freezed == showAlertPopUp
          ? _self.showAlertPopUp
          : showAlertPopUp // ignore: cast_nullable_to_non_nullable
              as ShowAlertPopUp?,
      actionSchema: freezed == actionSchema
          ? _self._actionSchema
          : actionSchema // ignore: cast_nullable_to_non_nullable
              as List<ActionSchema>?,
    ));
  }

  /// Create a copy of SchemaObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SummaryItemCopyWith<$Res>? get summaryDetails {
    if (_self.summaryDetails == null) {
      return null;
    }

    return $SummaryItemCopyWith<$Res>(_self.summaryDetails!, (value) {
      return _then(_self.copyWith(summaryDetails: value));
    });
  }

  /// Create a copy of SchemaObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShowAlertPopUpCopyWith<$Res>? get showAlertPopUp {
    if (_self.showAlertPopUp == null) {
      return null;
    }

    return $ShowAlertPopUpCopyWith<$Res>(_self.showAlertPopUp!, (value) {
      return _then(_self.copyWith(showAlertPopUp: value));
    });
  }
}

/// @nodoc
mixin _$SummaryItem {
  String get heading;
  String? get description;
  bool get show;

  /// Create a copy of SummaryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SummaryItemCopyWith<SummaryItem> get copyWith =>
      _$SummaryItemCopyWithImpl<SummaryItem>(this as SummaryItem, _$identity);

  /// Serializes this SummaryItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SummaryItem &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.show, show) || other.show == show));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, heading, description, show);

  @override
  String toString() {
    return 'SummaryItem(heading: $heading, description: $description, show: $show)';
  }
}

/// @nodoc
abstract mixin class $SummaryItemCopyWith<$Res> {
  factory $SummaryItemCopyWith(
          SummaryItem value, $Res Function(SummaryItem) _then) =
      _$SummaryItemCopyWithImpl;
  @useResult
  $Res call({String heading, String? description, bool show});
}

/// @nodoc
class _$SummaryItemCopyWithImpl<$Res> implements $SummaryItemCopyWith<$Res> {
  _$SummaryItemCopyWithImpl(this._self, this._then);

  final SummaryItem _self;
  final $Res Function(SummaryItem) _then;

  /// Create a copy of SummaryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heading = null,
    Object? description = freezed,
    Object? show = null,
  }) {
    return _then(_self.copyWith(
      heading: null == heading
          ? _self.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      show: null == show
          ? _self.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SummaryItem].
extension SummaryItemPatterns on SummaryItem {
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
    TResult Function(_SummaryItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SummaryItem() when $default != null:
        return $default(_that);
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
    TResult Function(_SummaryItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SummaryItem():
        return $default(_that);
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
    TResult? Function(_SummaryItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SummaryItem() when $default != null:
        return $default(_that);
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
    TResult Function(String heading, String? description, bool show)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SummaryItem() when $default != null:
        return $default(_that.heading, _that.description, _that.show);
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
    TResult Function(String heading, String? description, bool show) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SummaryItem():
        return $default(_that.heading, _that.description, _that.show);
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
    TResult? Function(String heading, String? description, bool show)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SummaryItem() when $default != null:
        return $default(_that.heading, _that.description, _that.show);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SummaryItem implements SummaryItem {
  const _SummaryItem(
      {required this.heading, this.description, this.show = false});
  factory _SummaryItem.fromJson(Map<String, dynamic> json) =>
      _$SummaryItemFromJson(json);

  @override
  final String heading;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool show;

  /// Create a copy of SummaryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SummaryItemCopyWith<_SummaryItem> get copyWith =>
      __$SummaryItemCopyWithImpl<_SummaryItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SummaryItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SummaryItem &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.show, show) || other.show == show));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, heading, description, show);

  @override
  String toString() {
    return 'SummaryItem(heading: $heading, description: $description, show: $show)';
  }
}

/// @nodoc
abstract mixin class _$SummaryItemCopyWith<$Res>
    implements $SummaryItemCopyWith<$Res> {
  factory _$SummaryItemCopyWith(
          _SummaryItem value, $Res Function(_SummaryItem) _then) =
      __$SummaryItemCopyWithImpl;
  @override
  @useResult
  $Res call({String heading, String? description, bool show});
}

/// @nodoc
class __$SummaryItemCopyWithImpl<$Res> implements _$SummaryItemCopyWith<$Res> {
  __$SummaryItemCopyWithImpl(this._self, this._then);

  final _SummaryItem _self;
  final $Res Function(_SummaryItem) _then;

  /// Create a copy of SummaryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? heading = null,
    Object? description = freezed,
    Object? show = null,
  }) {
    return _then(_SummaryItem(
      heading: null == heading
          ? _self.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      show: null == show
          ? _self.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$ActionSchema {
  String get name;
  String get buttonName;
  ButtonType get buttonType;
  List<ActionItemSchema> get actionItems;

  /// Create a copy of ActionSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActionSchemaCopyWith<ActionSchema> get copyWith =>
      _$ActionSchemaCopyWithImpl<ActionSchema>(
          this as ActionSchema, _$identity);

  /// Serializes this ActionSchema to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActionSchema &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.buttonName, buttonName) ||
                other.buttonName == buttonName) &&
            (identical(other.buttonType, buttonType) ||
                other.buttonType == buttonType) &&
            const DeepCollectionEquality()
                .equals(other.actionItems, actionItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, buttonName, buttonType,
      const DeepCollectionEquality().hash(actionItems));

  @override
  String toString() {
    return 'ActionSchema(name: $name, buttonName: $buttonName, buttonType: $buttonType, actionItems: $actionItems)';
  }
}

/// @nodoc
abstract mixin class $ActionSchemaCopyWith<$Res> {
  factory $ActionSchemaCopyWith(
          ActionSchema value, $Res Function(ActionSchema) _then) =
      _$ActionSchemaCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String buttonName,
      ButtonType buttonType,
      List<ActionItemSchema> actionItems});
}

/// @nodoc
class _$ActionSchemaCopyWithImpl<$Res> implements $ActionSchemaCopyWith<$Res> {
  _$ActionSchemaCopyWithImpl(this._self, this._then);

  final ActionSchema _self;
  final $Res Function(ActionSchema) _then;

  /// Create a copy of ActionSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? buttonName = null,
    Object? buttonType = null,
    Object? actionItems = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      buttonName: null == buttonName
          ? _self.buttonName
          : buttonName // ignore: cast_nullable_to_non_nullable
              as String,
      buttonType: null == buttonType
          ? _self.buttonType
          : buttonType // ignore: cast_nullable_to_non_nullable
              as ButtonType,
      actionItems: null == actionItems
          ? _self.actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<ActionItemSchema>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ActionSchema].
extension ActionSchemaPatterns on ActionSchema {
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
    TResult Function(_ActionSchema value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActionSchema() when $default != null:
        return $default(_that);
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
    TResult Function(_ActionSchema value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActionSchema():
        return $default(_that);
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
    TResult? Function(_ActionSchema value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActionSchema() when $default != null:
        return $default(_that);
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
    TResult Function(String name, String buttonName, ButtonType buttonType,
            List<ActionItemSchema> actionItems)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActionSchema() when $default != null:
        return $default(
            _that.name, _that.buttonName, _that.buttonType, _that.actionItems);
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
    TResult Function(String name, String buttonName, ButtonType buttonType,
            List<ActionItemSchema> actionItems)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActionSchema():
        return $default(
            _that.name, _that.buttonName, _that.buttonType, _that.actionItems);
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
    TResult? Function(String name, String buttonName, ButtonType buttonType,
            List<ActionItemSchema> actionItems)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActionSchema() when $default != null:
        return $default(
            _that.name, _that.buttonName, _that.buttonType, _that.actionItems);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ActionSchema implements ActionSchema {
  const _ActionSchema(
      {required this.name,
      required this.buttonName,
      this.buttonType = ButtonType.elevated,
      required final List<ActionItemSchema> actionItems})
      : _actionItems = actionItems;
  factory _ActionSchema.fromJson(Map<String, dynamic> json) =>
      _$ActionSchemaFromJson(json);

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

  /// Create a copy of ActionSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActionSchemaCopyWith<_ActionSchema> get copyWith =>
      __$ActionSchemaCopyWithImpl<_ActionSchema>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ActionSchemaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActionSchema &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.buttonName, buttonName) ||
                other.buttonName == buttonName) &&
            (identical(other.buttonType, buttonType) ||
                other.buttonType == buttonType) &&
            const DeepCollectionEquality()
                .equals(other._actionItems, _actionItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, buttonName, buttonType,
      const DeepCollectionEquality().hash(_actionItems));

  @override
  String toString() {
    return 'ActionSchema(name: $name, buttonName: $buttonName, buttonType: $buttonType, actionItems: $actionItems)';
  }
}

/// @nodoc
abstract mixin class _$ActionSchemaCopyWith<$Res>
    implements $ActionSchemaCopyWith<$Res> {
  factory _$ActionSchemaCopyWith(
          _ActionSchema value, $Res Function(_ActionSchema) _then) =
      __$ActionSchemaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String buttonName,
      ButtonType buttonType,
      List<ActionItemSchema> actionItems});
}

/// @nodoc
class __$ActionSchemaCopyWithImpl<$Res>
    implements _$ActionSchemaCopyWith<$Res> {
  __$ActionSchemaCopyWithImpl(this._self, this._then);

  final _ActionSchema _self;
  final $Res Function(_ActionSchema) _then;

  /// Create a copy of ActionSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? buttonName = null,
    Object? buttonType = null,
    Object? actionItems = null,
  }) {
    return _then(_ActionSchema(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      buttonName: null == buttonName
          ? _self.buttonName
          : buttonName // ignore: cast_nullable_to_non_nullable
              as String,
      buttonType: null == buttonType
          ? _self.buttonType
          : buttonType // ignore: cast_nullable_to_non_nullable
              as ButtonType,
      actionItems: null == actionItems
          ? _self._actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<ActionItemSchema>,
    ));
  }
}

/// @nodoc
mixin _$ActionItemSchema {
  ActionType get type;
  UrlSchema? get urlSchema;
  RoutingSchema? get routingSchema;

  /// Create a copy of ActionItemSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActionItemSchemaCopyWith<ActionItemSchema> get copyWith =>
      _$ActionItemSchemaCopyWithImpl<ActionItemSchema>(
          this as ActionItemSchema, _$identity);

  /// Serializes this ActionItemSchema to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActionItemSchema &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.urlSchema, urlSchema) ||
                other.urlSchema == urlSchema) &&
            (identical(other.routingSchema, routingSchema) ||
                other.routingSchema == routingSchema));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, urlSchema, routingSchema);

  @override
  String toString() {
    return 'ActionItemSchema(type: $type, urlSchema: $urlSchema, routingSchema: $routingSchema)';
  }
}

/// @nodoc
abstract mixin class $ActionItemSchemaCopyWith<$Res> {
  factory $ActionItemSchemaCopyWith(
          ActionItemSchema value, $Res Function(ActionItemSchema) _then) =
      _$ActionItemSchemaCopyWithImpl;
  @useResult
  $Res call(
      {ActionType type, UrlSchema? urlSchema, RoutingSchema? routingSchema});

  $UrlSchemaCopyWith<$Res>? get urlSchema;
  $RoutingSchemaCopyWith<$Res>? get routingSchema;
}

/// @nodoc
class _$ActionItemSchemaCopyWithImpl<$Res>
    implements $ActionItemSchemaCopyWith<$Res> {
  _$ActionItemSchemaCopyWithImpl(this._self, this._then);

  final ActionItemSchema _self;
  final $Res Function(ActionItemSchema) _then;

  /// Create a copy of ActionItemSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? urlSchema = freezed,
    Object? routingSchema = freezed,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActionType,
      urlSchema: freezed == urlSchema
          ? _self.urlSchema
          : urlSchema // ignore: cast_nullable_to_non_nullable
              as UrlSchema?,
      routingSchema: freezed == routingSchema
          ? _self.routingSchema
          : routingSchema // ignore: cast_nullable_to_non_nullable
              as RoutingSchema?,
    ));
  }

  /// Create a copy of ActionItemSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UrlSchemaCopyWith<$Res>? get urlSchema {
    if (_self.urlSchema == null) {
      return null;
    }

    return $UrlSchemaCopyWith<$Res>(_self.urlSchema!, (value) {
      return _then(_self.copyWith(urlSchema: value));
    });
  }

  /// Create a copy of ActionItemSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoutingSchemaCopyWith<$Res>? get routingSchema {
    if (_self.routingSchema == null) {
      return null;
    }

    return $RoutingSchemaCopyWith<$Res>(_self.routingSchema!, (value) {
      return _then(_self.copyWith(routingSchema: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ActionItemSchema].
extension ActionItemSchemaPatterns on ActionItemSchema {
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
    TResult Function(_ActionItemSchema value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActionItemSchema() when $default != null:
        return $default(_that);
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
    TResult Function(_ActionItemSchema value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActionItemSchema():
        return $default(_that);
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
    TResult? Function(_ActionItemSchema value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActionItemSchema() when $default != null:
        return $default(_that);
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
    TResult Function(ActionType type, UrlSchema? urlSchema,
            RoutingSchema? routingSchema)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActionItemSchema() when $default != null:
        return $default(_that.type, _that.urlSchema, _that.routingSchema);
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
    TResult Function(
            ActionType type, UrlSchema? urlSchema, RoutingSchema? routingSchema)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActionItemSchema():
        return $default(_that.type, _that.urlSchema, _that.routingSchema);
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
    TResult? Function(ActionType type, UrlSchema? urlSchema,
            RoutingSchema? routingSchema)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActionItemSchema() when $default != null:
        return $default(_that.type, _that.urlSchema, _that.routingSchema);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _ActionItemSchema implements ActionItemSchema {
  const _ActionItemSchema(
      {required this.type, this.urlSchema, this.routingSchema});
  factory _ActionItemSchema.fromJson(Map<String, dynamic> json) =>
      _$ActionItemSchemaFromJson(json);

  @override
  final ActionType type;
  @override
  final UrlSchema? urlSchema;
  @override
  final RoutingSchema? routingSchema;

  /// Create a copy of ActionItemSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActionItemSchemaCopyWith<_ActionItemSchema> get copyWith =>
      __$ActionItemSchemaCopyWithImpl<_ActionItemSchema>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ActionItemSchemaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActionItemSchema &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.urlSchema, urlSchema) ||
                other.urlSchema == urlSchema) &&
            (identical(other.routingSchema, routingSchema) ||
                other.routingSchema == routingSchema));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, urlSchema, routingSchema);

  @override
  String toString() {
    return 'ActionItemSchema(type: $type, urlSchema: $urlSchema, routingSchema: $routingSchema)';
  }
}

/// @nodoc
abstract mixin class _$ActionItemSchemaCopyWith<$Res>
    implements $ActionItemSchemaCopyWith<$Res> {
  factory _$ActionItemSchemaCopyWith(
          _ActionItemSchema value, $Res Function(_ActionItemSchema) _then) =
      __$ActionItemSchemaCopyWithImpl;
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
class __$ActionItemSchemaCopyWithImpl<$Res>
    implements _$ActionItemSchemaCopyWith<$Res> {
  __$ActionItemSchemaCopyWithImpl(this._self, this._then);

  final _ActionItemSchema _self;
  final $Res Function(_ActionItemSchema) _then;

  /// Create a copy of ActionItemSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? urlSchema = freezed,
    Object? routingSchema = freezed,
  }) {
    return _then(_ActionItemSchema(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActionType,
      urlSchema: freezed == urlSchema
          ? _self.urlSchema
          : urlSchema // ignore: cast_nullable_to_non_nullable
              as UrlSchema?,
      routingSchema: freezed == routingSchema
          ? _self.routingSchema
          : routingSchema // ignore: cast_nullable_to_non_nullable
              as RoutingSchema?,
    ));
  }

  /// Create a copy of ActionItemSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UrlSchemaCopyWith<$Res>? get urlSchema {
    if (_self.urlSchema == null) {
      return null;
    }

    return $UrlSchemaCopyWith<$Res>(_self.urlSchema!, (value) {
      return _then(_self.copyWith(urlSchema: value));
    });
  }

  /// Create a copy of ActionItemSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoutingSchemaCopyWith<$Res>? get routingSchema {
    if (_self.routingSchema == null) {
      return null;
    }

    return $RoutingSchemaCopyWith<$Res>(_self.routingSchema!, (value) {
      return _then(_self.copyWith(routingSchema: value));
    });
  }
}

/// @nodoc
mixin _$UrlSchema {
  String get method;
  String get urlSchema;

  /// Create a copy of UrlSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UrlSchemaCopyWith<UrlSchema> get copyWith =>
      _$UrlSchemaCopyWithImpl<UrlSchema>(this as UrlSchema, _$identity);

  /// Serializes this UrlSchema to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UrlSchema &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.urlSchema, urlSchema) ||
                other.urlSchema == urlSchema));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, method, urlSchema);

  @override
  String toString() {
    return 'UrlSchema(method: $method, urlSchema: $urlSchema)';
  }
}

/// @nodoc
abstract mixin class $UrlSchemaCopyWith<$Res> {
  factory $UrlSchemaCopyWith(UrlSchema value, $Res Function(UrlSchema) _then) =
      _$UrlSchemaCopyWithImpl;
  @useResult
  $Res call({String method, String urlSchema});
}

/// @nodoc
class _$UrlSchemaCopyWithImpl<$Res> implements $UrlSchemaCopyWith<$Res> {
  _$UrlSchemaCopyWithImpl(this._self, this._then);

  final UrlSchema _self;
  final $Res Function(UrlSchema) _then;

  /// Create a copy of UrlSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? urlSchema = null,
  }) {
    return _then(_self.copyWith(
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      urlSchema: null == urlSchema
          ? _self.urlSchema
          : urlSchema // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [UrlSchema].
extension UrlSchemaPatterns on UrlSchema {
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
    TResult Function(_UrlSchema value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UrlSchema() when $default != null:
        return $default(_that);
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
    TResult Function(_UrlSchema value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UrlSchema():
        return $default(_that);
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
    TResult? Function(_UrlSchema value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UrlSchema() when $default != null:
        return $default(_that);
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
    TResult Function(String method, String urlSchema)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UrlSchema() when $default != null:
        return $default(_that.method, _that.urlSchema);
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
    TResult Function(String method, String urlSchema) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UrlSchema():
        return $default(_that.method, _that.urlSchema);
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
    TResult? Function(String method, String urlSchema)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UrlSchema() when $default != null:
        return $default(_that.method, _that.urlSchema);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UrlSchema implements UrlSchema {
  const _UrlSchema({required this.method, required this.urlSchema});
  factory _UrlSchema.fromJson(Map<String, dynamic> json) =>
      _$UrlSchemaFromJson(json);

  @override
  final String method;
  @override
  final String urlSchema;

  /// Create a copy of UrlSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UrlSchemaCopyWith<_UrlSchema> get copyWith =>
      __$UrlSchemaCopyWithImpl<_UrlSchema>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UrlSchemaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UrlSchema &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.urlSchema, urlSchema) ||
                other.urlSchema == urlSchema));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, method, urlSchema);

  @override
  String toString() {
    return 'UrlSchema(method: $method, urlSchema: $urlSchema)';
  }
}

/// @nodoc
abstract mixin class _$UrlSchemaCopyWith<$Res>
    implements $UrlSchemaCopyWith<$Res> {
  factory _$UrlSchemaCopyWith(
          _UrlSchema value, $Res Function(_UrlSchema) _then) =
      __$UrlSchemaCopyWithImpl;
  @override
  @useResult
  $Res call({String method, String urlSchema});
}

/// @nodoc
class __$UrlSchemaCopyWithImpl<$Res> implements _$UrlSchemaCopyWith<$Res> {
  __$UrlSchemaCopyWithImpl(this._self, this._then);

  final _UrlSchema _self;
  final $Res Function(_UrlSchema) _then;

  /// Create a copy of UrlSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? method = null,
    Object? urlSchema = null,
  }) {
    return _then(_UrlSchema(
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      urlSchema: null == urlSchema
          ? _self.urlSchema
          : urlSchema // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$RoutingSchema {
  String get destination;
  PropertySchema? get propertySchema;

  /// Create a copy of RoutingSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoutingSchemaCopyWith<RoutingSchema> get copyWith =>
      _$RoutingSchemaCopyWithImpl<RoutingSchema>(
          this as RoutingSchema, _$identity);

  /// Serializes this RoutingSchema to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoutingSchema &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.propertySchema, propertySchema) ||
                other.propertySchema == propertySchema));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, destination, propertySchema);

  @override
  String toString() {
    return 'RoutingSchema(destination: $destination, propertySchema: $propertySchema)';
  }
}

/// @nodoc
abstract mixin class $RoutingSchemaCopyWith<$Res> {
  factory $RoutingSchemaCopyWith(
          RoutingSchema value, $Res Function(RoutingSchema) _then) =
      _$RoutingSchemaCopyWithImpl;
  @useResult
  $Res call({String destination, PropertySchema? propertySchema});

  $PropertySchemaCopyWith<$Res>? get propertySchema;
}

/// @nodoc
class _$RoutingSchemaCopyWithImpl<$Res>
    implements $RoutingSchemaCopyWith<$Res> {
  _$RoutingSchemaCopyWithImpl(this._self, this._then);

  final RoutingSchema _self;
  final $Res Function(RoutingSchema) _then;

  /// Create a copy of RoutingSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destination = null,
    Object? propertySchema = freezed,
  }) {
    return _then(_self.copyWith(
      destination: null == destination
          ? _self.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      propertySchema: freezed == propertySchema
          ? _self.propertySchema
          : propertySchema // ignore: cast_nullable_to_non_nullable
              as PropertySchema?,
    ));
  }

  /// Create a copy of RoutingSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PropertySchemaCopyWith<$Res>? get propertySchema {
    if (_self.propertySchema == null) {
      return null;
    }

    return $PropertySchemaCopyWith<$Res>(_self.propertySchema!, (value) {
      return _then(_self.copyWith(propertySchema: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RoutingSchema].
extension RoutingSchemaPatterns on RoutingSchema {
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
    TResult Function(_RoutingSchema value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoutingSchema() when $default != null:
        return $default(_that);
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
    TResult Function(_RoutingSchema value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutingSchema():
        return $default(_that);
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
    TResult? Function(_RoutingSchema value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutingSchema() when $default != null:
        return $default(_that);
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
    TResult Function(String destination, PropertySchema? propertySchema)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoutingSchema() when $default != null:
        return $default(_that.destination, _that.propertySchema);
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
    TResult Function(String destination, PropertySchema? propertySchema)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutingSchema():
        return $default(_that.destination, _that.propertySchema);
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
    TResult? Function(String destination, PropertySchema? propertySchema)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutingSchema() when $default != null:
        return $default(_that.destination, _that.propertySchema);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RoutingSchema implements RoutingSchema {
  const _RoutingSchema({required this.destination, this.propertySchema});
  factory _RoutingSchema.fromJson(Map<String, dynamic> json) =>
      _$RoutingSchemaFromJson(json);

  @override
  final String destination;
  @override
  final PropertySchema? propertySchema;

  /// Create a copy of RoutingSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoutingSchemaCopyWith<_RoutingSchema> get copyWith =>
      __$RoutingSchemaCopyWithImpl<_RoutingSchema>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RoutingSchemaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoutingSchema &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.propertySchema, propertySchema) ||
                other.propertySchema == propertySchema));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, destination, propertySchema);

  @override
  String toString() {
    return 'RoutingSchema(destination: $destination, propertySchema: $propertySchema)';
  }
}

/// @nodoc
abstract mixin class _$RoutingSchemaCopyWith<$Res>
    implements $RoutingSchemaCopyWith<$Res> {
  factory _$RoutingSchemaCopyWith(
          _RoutingSchema value, $Res Function(_RoutingSchema) _then) =
      __$RoutingSchemaCopyWithImpl;
  @override
  @useResult
  $Res call({String destination, PropertySchema? propertySchema});

  @override
  $PropertySchemaCopyWith<$Res>? get propertySchema;
}

/// @nodoc
class __$RoutingSchemaCopyWithImpl<$Res>
    implements _$RoutingSchemaCopyWith<$Res> {
  __$RoutingSchemaCopyWithImpl(this._self, this._then);

  final _RoutingSchema _self;
  final $Res Function(_RoutingSchema) _then;

  /// Create a copy of RoutingSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? destination = null,
    Object? propertySchema = freezed,
  }) {
    return _then(_RoutingSchema(
      destination: null == destination
          ? _self.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      propertySchema: freezed == propertySchema
          ? _self.propertySchema
          : propertySchema // ignore: cast_nullable_to_non_nullable
              as PropertySchema?,
    ));
  }

  /// Create a copy of RoutingSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PropertySchemaCopyWith<$Res>? get propertySchema {
    if (_self.propertySchema == null) {
      return null;
    }

    return $PropertySchemaCopyWith<$Res>(_self.propertySchema!, (value) {
      return _then(_self.copyWith(propertySchema: value));
    });
  }
}

// dart format on

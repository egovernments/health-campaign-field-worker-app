// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardConfigPrimaryWrapper {
  @JsonKey(name: 'dashboardConfig')
  List<DashboardConfigWrapper> get dashboardConfigWrapper;

  /// Create a copy of DashboardConfigPrimaryWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardConfigPrimaryWrapperCopyWith<DashboardConfigPrimaryWrapper>
      get copyWith => _$DashboardConfigPrimaryWrapperCopyWithImpl<
              DashboardConfigPrimaryWrapper>(
          this as DashboardConfigPrimaryWrapper, _$identity);

  /// Serializes this DashboardConfigPrimaryWrapper to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardConfigPrimaryWrapper &&
            const DeepCollectionEquality()
                .equals(other.dashboardConfigWrapper, dashboardConfigWrapper));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(dashboardConfigWrapper));

  @override
  String toString() {
    return 'DashboardConfigPrimaryWrapper(dashboardConfigWrapper: $dashboardConfigWrapper)';
  }
}

/// @nodoc
abstract mixin class $DashboardConfigPrimaryWrapperCopyWith<$Res> {
  factory $DashboardConfigPrimaryWrapperCopyWith(
          DashboardConfigPrimaryWrapper value,
          $Res Function(DashboardConfigPrimaryWrapper) _then) =
      _$DashboardConfigPrimaryWrapperCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'dashboardConfig')
      List<DashboardConfigWrapper> dashboardConfigWrapper});
}

/// @nodoc
class _$DashboardConfigPrimaryWrapperCopyWithImpl<$Res>
    implements $DashboardConfigPrimaryWrapperCopyWith<$Res> {
  _$DashboardConfigPrimaryWrapperCopyWithImpl(this._self, this._then);

  final DashboardConfigPrimaryWrapper _self;
  final $Res Function(DashboardConfigPrimaryWrapper) _then;

  /// Create a copy of DashboardConfigPrimaryWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dashboardConfigWrapper = null,
  }) {
    return _then(_self.copyWith(
      dashboardConfigWrapper: null == dashboardConfigWrapper
          ? _self.dashboardConfigWrapper
          : dashboardConfigWrapper // ignore: cast_nullable_to_non_nullable
              as List<DashboardConfigWrapper>,
    ));
  }
}

/// Adds pattern-matching-related methods to [DashboardConfigPrimaryWrapper].
extension DashboardConfigPrimaryWrapperPatterns
    on DashboardConfigPrimaryWrapper {
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
    TResult Function(_DashboardConfigPrimaryWrapper value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardConfigPrimaryWrapper() when $default != null:
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
    TResult Function(_DashboardConfigPrimaryWrapper value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardConfigPrimaryWrapper():
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
    TResult? Function(_DashboardConfigPrimaryWrapper value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardConfigPrimaryWrapper() when $default != null:
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
            @JsonKey(name: 'dashboardConfig')
            List<DashboardConfigWrapper> dashboardConfigWrapper)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardConfigPrimaryWrapper() when $default != null:
        return $default(_that.dashboardConfigWrapper);
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
            @JsonKey(name: 'dashboardConfig')
            List<DashboardConfigWrapper> dashboardConfigWrapper)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardConfigPrimaryWrapper():
        return $default(_that.dashboardConfigWrapper);
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
            @JsonKey(name: 'dashboardConfig')
            List<DashboardConfigWrapper> dashboardConfigWrapper)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardConfigPrimaryWrapper() when $default != null:
        return $default(_that.dashboardConfigWrapper);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DashboardConfigPrimaryWrapper implements DashboardConfigPrimaryWrapper {
  const _DashboardConfigPrimaryWrapper(
      {@JsonKey(name: 'dashboardConfig')
      final List<DashboardConfigWrapper> dashboardConfigWrapper = const []})
      : _dashboardConfigWrapper = dashboardConfigWrapper;
  factory _DashboardConfigPrimaryWrapper.fromJson(Map<String, dynamic> json) =>
      _$DashboardConfigPrimaryWrapperFromJson(json);

  final List<DashboardConfigWrapper> _dashboardConfigWrapper;
  @override
  @JsonKey(name: 'dashboardConfig')
  List<DashboardConfigWrapper> get dashboardConfigWrapper {
    if (_dashboardConfigWrapper is EqualUnmodifiableListView)
      return _dashboardConfigWrapper;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dashboardConfigWrapper);
  }

  /// Create a copy of DashboardConfigPrimaryWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardConfigPrimaryWrapperCopyWith<_DashboardConfigPrimaryWrapper>
      get copyWith => __$DashboardConfigPrimaryWrapperCopyWithImpl<
          _DashboardConfigPrimaryWrapper>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DashboardConfigPrimaryWrapperToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardConfigPrimaryWrapper &&
            const DeepCollectionEquality().equals(
                other._dashboardConfigWrapper, _dashboardConfigWrapper));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_dashboardConfigWrapper));

  @override
  String toString() {
    return 'DashboardConfigPrimaryWrapper(dashboardConfigWrapper: $dashboardConfigWrapper)';
  }
}

/// @nodoc
abstract mixin class _$DashboardConfigPrimaryWrapperCopyWith<$Res>
    implements $DashboardConfigPrimaryWrapperCopyWith<$Res> {
  factory _$DashboardConfigPrimaryWrapperCopyWith(
          _DashboardConfigPrimaryWrapper value,
          $Res Function(_DashboardConfigPrimaryWrapper) _then) =
      __$DashboardConfigPrimaryWrapperCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dashboardConfig')
      List<DashboardConfigWrapper> dashboardConfigWrapper});
}

/// @nodoc
class __$DashboardConfigPrimaryWrapperCopyWithImpl<$Res>
    implements _$DashboardConfigPrimaryWrapperCopyWith<$Res> {
  __$DashboardConfigPrimaryWrapperCopyWithImpl(this._self, this._then);

  final _DashboardConfigPrimaryWrapper _self;
  final $Res Function(_DashboardConfigPrimaryWrapper) _then;

  /// Create a copy of DashboardConfigPrimaryWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dashboardConfigWrapper = null,
  }) {
    return _then(_DashboardConfigPrimaryWrapper(
      dashboardConfigWrapper: null == dashboardConfigWrapper
          ? _self._dashboardConfigWrapper
          : dashboardConfigWrapper // ignore: cast_nullable_to_non_nullable
              as List<DashboardConfigWrapper>,
    ));
  }
}

/// @nodoc
mixin _$DashboardConfigWrapper {
  @JsonKey(name: 'enableDashboard')
  bool get enableDashboard;
  @JsonKey(name: 'charts')
  List<ChartConfigModel>? get charts;
  String get projectTypeCode;
  String? get projectTypeId;

  /// Create a copy of DashboardConfigWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardConfigWrapperCopyWith<DashboardConfigWrapper> get copyWith =>
      _$DashboardConfigWrapperCopyWithImpl<DashboardConfigWrapper>(
          this as DashboardConfigWrapper, _$identity);

  /// Serializes this DashboardConfigWrapper to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardConfigWrapper &&
            (identical(other.enableDashboard, enableDashboard) ||
                other.enableDashboard == enableDashboard) &&
            const DeepCollectionEquality().equals(other.charts, charts) &&
            (identical(other.projectTypeCode, projectTypeCode) ||
                other.projectTypeCode == projectTypeCode) &&
            (identical(other.projectTypeId, projectTypeId) ||
                other.projectTypeId == projectTypeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      enableDashboard,
      const DeepCollectionEquality().hash(charts),
      projectTypeCode,
      projectTypeId);

  @override
  String toString() {
    return 'DashboardConfigWrapper(enableDashboard: $enableDashboard, charts: $charts, projectTypeCode: $projectTypeCode, projectTypeId: $projectTypeId)';
  }
}

/// @nodoc
abstract mixin class $DashboardConfigWrapperCopyWith<$Res> {
  factory $DashboardConfigWrapperCopyWith(DashboardConfigWrapper value,
          $Res Function(DashboardConfigWrapper) _then) =
      _$DashboardConfigWrapperCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'enableDashboard') bool enableDashboard,
      @JsonKey(name: 'charts') List<ChartConfigModel>? charts,
      String projectTypeCode,
      String? projectTypeId});
}

/// @nodoc
class _$DashboardConfigWrapperCopyWithImpl<$Res>
    implements $DashboardConfigWrapperCopyWith<$Res> {
  _$DashboardConfigWrapperCopyWithImpl(this._self, this._then);

  final DashboardConfigWrapper _self;
  final $Res Function(DashboardConfigWrapper) _then;

  /// Create a copy of DashboardConfigWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableDashboard = null,
    Object? charts = freezed,
    Object? projectTypeCode = null,
    Object? projectTypeId = freezed,
  }) {
    return _then(_self.copyWith(
      enableDashboard: null == enableDashboard
          ? _self.enableDashboard
          : enableDashboard // ignore: cast_nullable_to_non_nullable
              as bool,
      charts: freezed == charts
          ? _self.charts
          : charts // ignore: cast_nullable_to_non_nullable
              as List<ChartConfigModel>?,
      projectTypeCode: null == projectTypeCode
          ? _self.projectTypeCode
          : projectTypeCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectTypeId: freezed == projectTypeId
          ? _self.projectTypeId
          : projectTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DashboardConfigWrapper].
extension DashboardConfigWrapperPatterns on DashboardConfigWrapper {
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
    TResult Function(_DashboardConfigWrapper value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardConfigWrapper() when $default != null:
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
    TResult Function(_DashboardConfigWrapper value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardConfigWrapper():
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
    TResult? Function(_DashboardConfigWrapper value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardConfigWrapper() when $default != null:
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
            @JsonKey(name: 'enableDashboard') bool enableDashboard,
            @JsonKey(name: 'charts') List<ChartConfigModel>? charts,
            String projectTypeCode,
            String? projectTypeId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardConfigWrapper() when $default != null:
        return $default(_that.enableDashboard, _that.charts,
            _that.projectTypeCode, _that.projectTypeId);
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
            @JsonKey(name: 'enableDashboard') bool enableDashboard,
            @JsonKey(name: 'charts') List<ChartConfigModel>? charts,
            String projectTypeCode,
            String? projectTypeId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardConfigWrapper():
        return $default(_that.enableDashboard, _that.charts,
            _that.projectTypeCode, _that.projectTypeId);
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
            @JsonKey(name: 'enableDashboard') bool enableDashboard,
            @JsonKey(name: 'charts') List<ChartConfigModel>? charts,
            String projectTypeCode,
            String? projectTypeId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardConfigWrapper() when $default != null:
        return $default(_that.enableDashboard, _that.charts,
            _that.projectTypeCode, _that.projectTypeId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DashboardConfigWrapper implements DashboardConfigWrapper {
  const _DashboardConfigWrapper(
      {@JsonKey(name: 'enableDashboard') required this.enableDashboard,
      @JsonKey(name: 'charts') final List<ChartConfigModel>? charts,
      required this.projectTypeCode,
      this.projectTypeId})
      : _charts = charts;
  factory _DashboardConfigWrapper.fromJson(Map<String, dynamic> json) =>
      _$DashboardConfigWrapperFromJson(json);

  @override
  @JsonKey(name: 'enableDashboard')
  final bool enableDashboard;
  final List<ChartConfigModel>? _charts;
  @override
  @JsonKey(name: 'charts')
  List<ChartConfigModel>? get charts {
    final value = _charts;
    if (value == null) return null;
    if (_charts is EqualUnmodifiableListView) return _charts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String projectTypeCode;
  @override
  final String? projectTypeId;

  /// Create a copy of DashboardConfigWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardConfigWrapperCopyWith<_DashboardConfigWrapper> get copyWith =>
      __$DashboardConfigWrapperCopyWithImpl<_DashboardConfigWrapper>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DashboardConfigWrapperToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardConfigWrapper &&
            (identical(other.enableDashboard, enableDashboard) ||
                other.enableDashboard == enableDashboard) &&
            const DeepCollectionEquality().equals(other._charts, _charts) &&
            (identical(other.projectTypeCode, projectTypeCode) ||
                other.projectTypeCode == projectTypeCode) &&
            (identical(other.projectTypeId, projectTypeId) ||
                other.projectTypeId == projectTypeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      enableDashboard,
      const DeepCollectionEquality().hash(_charts),
      projectTypeCode,
      projectTypeId);

  @override
  String toString() {
    return 'DashboardConfigWrapper(enableDashboard: $enableDashboard, charts: $charts, projectTypeCode: $projectTypeCode, projectTypeId: $projectTypeId)';
  }
}

/// @nodoc
abstract mixin class _$DashboardConfigWrapperCopyWith<$Res>
    implements $DashboardConfigWrapperCopyWith<$Res> {
  factory _$DashboardConfigWrapperCopyWith(_DashboardConfigWrapper value,
          $Res Function(_DashboardConfigWrapper) _then) =
      __$DashboardConfigWrapperCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'enableDashboard') bool enableDashboard,
      @JsonKey(name: 'charts') List<ChartConfigModel>? charts,
      String projectTypeCode,
      String? projectTypeId});
}

/// @nodoc
class __$DashboardConfigWrapperCopyWithImpl<$Res>
    implements _$DashboardConfigWrapperCopyWith<$Res> {
  __$DashboardConfigWrapperCopyWithImpl(this._self, this._then);

  final _DashboardConfigWrapper _self;
  final $Res Function(_DashboardConfigWrapper) _then;

  /// Create a copy of DashboardConfigWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enableDashboard = null,
    Object? charts = freezed,
    Object? projectTypeCode = null,
    Object? projectTypeId = freezed,
  }) {
    return _then(_DashboardConfigWrapper(
      enableDashboard: null == enableDashboard
          ? _self.enableDashboard
          : enableDashboard // ignore: cast_nullable_to_non_nullable
              as bool,
      charts: freezed == charts
          ? _self._charts
          : charts // ignore: cast_nullable_to_non_nullable
              as List<ChartConfigModel>?,
      projectTypeCode: null == projectTypeCode
          ? _self.projectTypeCode
          : projectTypeCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectTypeId: freezed == projectTypeId
          ? _self.projectTypeId
          : projectTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ChartConfigModel {
  @JsonKey(name: 'active')
  bool get active;
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'vizType')
  String? get vizType;
  @JsonKey(name: 'chartType')
  String get chartType;

  /// Create a copy of ChartConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChartConfigModelCopyWith<ChartConfigModel> get copyWith =>
      _$ChartConfigModelCopyWithImpl<ChartConfigModel>(
          this as ChartConfigModel, _$identity);

  /// Serializes this ChartConfigModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChartConfigModel &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vizType, vizType) || other.vizType == vizType) &&
            (identical(other.chartType, chartType) ||
                other.chartType == chartType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, active, name, vizType, chartType);

  @override
  String toString() {
    return 'ChartConfigModel(active: $active, name: $name, vizType: $vizType, chartType: $chartType)';
  }
}

/// @nodoc
abstract mixin class $ChartConfigModelCopyWith<$Res> {
  factory $ChartConfigModelCopyWith(
          ChartConfigModel value, $Res Function(ChartConfigModel) _then) =
      _$ChartConfigModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'active') bool active,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'vizType') String? vizType,
      @JsonKey(name: 'chartType') String chartType});
}

/// @nodoc
class _$ChartConfigModelCopyWithImpl<$Res>
    implements $ChartConfigModelCopyWith<$Res> {
  _$ChartConfigModelCopyWithImpl(this._self, this._then);

  final ChartConfigModel _self;
  final $Res Function(ChartConfigModel) _then;

  /// Create a copy of ChartConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? name = null,
    Object? vizType = freezed,
    Object? chartType = null,
  }) {
    return _then(_self.copyWith(
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vizType: freezed == vizType
          ? _self.vizType
          : vizType // ignore: cast_nullable_to_non_nullable
              as String?,
      chartType: null == chartType
          ? _self.chartType
          : chartType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChartConfigModel].
extension ChartConfigModelPatterns on ChartConfigModel {
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
    TResult Function(_ChartConfigModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChartConfigModel() when $default != null:
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
    TResult Function(_ChartConfigModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartConfigModel():
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
    TResult? Function(_ChartConfigModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartConfigModel() when $default != null:
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
            @JsonKey(name: 'active') bool active,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'vizType') String? vizType,
            @JsonKey(name: 'chartType') String chartType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChartConfigModel() when $default != null:
        return $default(
            _that.active, _that.name, _that.vizType, _that.chartType);
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
            @JsonKey(name: 'active') bool active,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'vizType') String? vizType,
            @JsonKey(name: 'chartType') String chartType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartConfigModel():
        return $default(
            _that.active, _that.name, _that.vizType, _that.chartType);
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
            @JsonKey(name: 'active') bool active,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'vizType') String? vizType,
            @JsonKey(name: 'chartType') String chartType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartConfigModel() when $default != null:
        return $default(
            _that.active, _that.name, _that.vizType, _that.chartType);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChartConfigModel implements ChartConfigModel {
  const _ChartConfigModel(
      {@JsonKey(name: 'active') required this.active,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'vizType') this.vizType,
      @JsonKey(name: 'chartType') required this.chartType});
  factory _ChartConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ChartConfigModelFromJson(json);

  @override
  @JsonKey(name: 'active')
  final bool active;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'vizType')
  final String? vizType;
  @override
  @JsonKey(name: 'chartType')
  final String chartType;

  /// Create a copy of ChartConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChartConfigModelCopyWith<_ChartConfigModel> get copyWith =>
      __$ChartConfigModelCopyWithImpl<_ChartConfigModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChartConfigModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChartConfigModel &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vizType, vizType) || other.vizType == vizType) &&
            (identical(other.chartType, chartType) ||
                other.chartType == chartType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, active, name, vizType, chartType);

  @override
  String toString() {
    return 'ChartConfigModel(active: $active, name: $name, vizType: $vizType, chartType: $chartType)';
  }
}

/// @nodoc
abstract mixin class _$ChartConfigModelCopyWith<$Res>
    implements $ChartConfigModelCopyWith<$Res> {
  factory _$ChartConfigModelCopyWith(
          _ChartConfigModel value, $Res Function(_ChartConfigModel) _then) =
      __$ChartConfigModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'active') bool active,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'vizType') String? vizType,
      @JsonKey(name: 'chartType') String chartType});
}

/// @nodoc
class __$ChartConfigModelCopyWithImpl<$Res>
    implements _$ChartConfigModelCopyWith<$Res> {
  __$ChartConfigModelCopyWithImpl(this._self, this._then);

  final _ChartConfigModel _self;
  final $Res Function(_ChartConfigModel) _then;

  /// Create a copy of ChartConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? active = null,
    Object? name = null,
    Object? vizType = freezed,
    Object? chartType = null,
  }) {
    return _then(_ChartConfigModel(
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vizType: freezed == vizType
          ? _self.vizType
          : vizType // ignore: cast_nullable_to_non_nullable
              as String?,
      chartType: null == chartType
          ? _self.chartType
          : chartType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

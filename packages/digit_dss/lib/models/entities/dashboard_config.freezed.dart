// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardConfigWrapper _$DashboardConfigWrapperFromJson(
    Map<String, dynamic> json) {
  return _DashboardConfigWrapper.fromJson(json);
}

/// @nodoc
mixin _$DashboardConfigWrapper {
  @JsonKey(name: 'enableDashboard')
  bool get enableDashboard => throw _privateConstructorUsedError;
  @JsonKey(name: 'dashboardConfig')
  DashboardConfig? get dashboardConfig => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardConfigWrapperCopyWith<DashboardConfigWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardConfigWrapperCopyWith<$Res> {
  factory $DashboardConfigWrapperCopyWith(DashboardConfigWrapper value,
          $Res Function(DashboardConfigWrapper) then) =
      _$DashboardConfigWrapperCopyWithImpl<$Res, DashboardConfigWrapper>;
  @useResult
  $Res call(
      {@JsonKey(name: 'enableDashboard') bool enableDashboard,
      @JsonKey(name: 'dashboardConfig') DashboardConfig? dashboardConfig});

  $DashboardConfigCopyWith<$Res>? get dashboardConfig;
}

/// @nodoc
class _$DashboardConfigWrapperCopyWithImpl<$Res,
        $Val extends DashboardConfigWrapper>
    implements $DashboardConfigWrapperCopyWith<$Res> {
  _$DashboardConfigWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableDashboard = null,
    Object? dashboardConfig = freezed,
  }) {
    return _then(_value.copyWith(
      enableDashboard: null == enableDashboard
          ? _value.enableDashboard
          : enableDashboard // ignore: cast_nullable_to_non_nullable
              as bool,
      dashboardConfig: freezed == dashboardConfig
          ? _value.dashboardConfig
          : dashboardConfig // ignore: cast_nullable_to_non_nullable
              as DashboardConfig?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardConfigCopyWith<$Res>? get dashboardConfig {
    if (_value.dashboardConfig == null) {
      return null;
    }

    return $DashboardConfigCopyWith<$Res>(_value.dashboardConfig!, (value) {
      return _then(_value.copyWith(dashboardConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardConfigWrapperImplCopyWith<$Res>
    implements $DashboardConfigWrapperCopyWith<$Res> {
  factory _$$DashboardConfigWrapperImplCopyWith(
          _$DashboardConfigWrapperImpl value,
          $Res Function(_$DashboardConfigWrapperImpl) then) =
      __$$DashboardConfigWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'enableDashboard') bool enableDashboard,
      @JsonKey(name: 'dashboardConfig') DashboardConfig? dashboardConfig});

  @override
  $DashboardConfigCopyWith<$Res>? get dashboardConfig;
}

/// @nodoc
class __$$DashboardConfigWrapperImplCopyWithImpl<$Res>
    extends _$DashboardConfigWrapperCopyWithImpl<$Res,
        _$DashboardConfigWrapperImpl>
    implements _$$DashboardConfigWrapperImplCopyWith<$Res> {
  __$$DashboardConfigWrapperImplCopyWithImpl(
      _$DashboardConfigWrapperImpl _value,
      $Res Function(_$DashboardConfigWrapperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableDashboard = null,
    Object? dashboardConfig = freezed,
  }) {
    return _then(_$DashboardConfigWrapperImpl(
      enableDashboard: null == enableDashboard
          ? _value.enableDashboard
          : enableDashboard // ignore: cast_nullable_to_non_nullable
              as bool,
      dashboardConfig: freezed == dashboardConfig
          ? _value.dashboardConfig
          : dashboardConfig // ignore: cast_nullable_to_non_nullable
              as DashboardConfig?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardConfigWrapperImpl implements _DashboardConfigWrapper {
  const _$DashboardConfigWrapperImpl(
      {@JsonKey(name: 'enableDashboard') required this.enableDashboard,
      @JsonKey(name: 'dashboardConfig') this.dashboardConfig});

  factory _$DashboardConfigWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardConfigWrapperImplFromJson(json);

  @override
  @JsonKey(name: 'enableDashboard')
  final bool enableDashboard;
  @override
  @JsonKey(name: 'dashboardConfig')
  final DashboardConfig? dashboardConfig;

  @override
  String toString() {
    return 'DashboardConfigWrapper(enableDashboard: $enableDashboard, dashboardConfig: $dashboardConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardConfigWrapperImpl &&
            (identical(other.enableDashboard, enableDashboard) ||
                other.enableDashboard == enableDashboard) &&
            (identical(other.dashboardConfig, dashboardConfig) ||
                other.dashboardConfig == dashboardConfig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, enableDashboard, dashboardConfig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardConfigWrapperImplCopyWith<_$DashboardConfigWrapperImpl>
      get copyWith => __$$DashboardConfigWrapperImplCopyWithImpl<
          _$DashboardConfigWrapperImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardConfigWrapperImplToJson(
      this,
    );
  }
}

abstract class _DashboardConfigWrapper implements DashboardConfigWrapper {
  const factory _DashboardConfigWrapper(
      {@JsonKey(name: 'enableDashboard') required final bool enableDashboard,
      @JsonKey(name: 'dashboardConfig')
      final DashboardConfig? dashboardConfig}) = _$DashboardConfigWrapperImpl;

  factory _DashboardConfigWrapper.fromJson(Map<String, dynamic> json) =
      _$DashboardConfigWrapperImpl.fromJson;

  @override
  @JsonKey(name: 'enableDashboard')
  bool get enableDashboard;
  @override
  @JsonKey(name: 'dashboardConfig')
  DashboardConfig? get dashboardConfig;
  @override
  @JsonKey(ignore: true)
  _$$DashboardConfigWrapperImplCopyWith<_$DashboardConfigWrapperImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DashboardConfig _$DashboardConfigFromJson(Map<String, dynamic> json) {
  return _DashboardConfig.fromJson(json);
}

/// @nodoc
mixin _$DashboardConfig {
  @JsonKey(name: 'METRIC')
  List<ChartConfigModel>? get metricCharts =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'TABLE')
  List<ChartConfigModel>? get tableCharts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardConfigCopyWith<DashboardConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardConfigCopyWith<$Res> {
  factory $DashboardConfigCopyWith(
          DashboardConfig value, $Res Function(DashboardConfig) then) =
      _$DashboardConfigCopyWithImpl<$Res, DashboardConfig>;
  @useResult
  $Res call(
      {@JsonKey(name: 'METRIC') List<ChartConfigModel>? metricCharts,
      @JsonKey(name: 'TABLE') List<ChartConfigModel>? tableCharts});
}

/// @nodoc
class _$DashboardConfigCopyWithImpl<$Res, $Val extends DashboardConfig>
    implements $DashboardConfigCopyWith<$Res> {
  _$DashboardConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metricCharts = freezed,
    Object? tableCharts = freezed,
  }) {
    return _then(_value.copyWith(
      metricCharts: freezed == metricCharts
          ? _value.metricCharts
          : metricCharts // ignore: cast_nullable_to_non_nullable
              as List<ChartConfigModel>?,
      tableCharts: freezed == tableCharts
          ? _value.tableCharts
          : tableCharts // ignore: cast_nullable_to_non_nullable
              as List<ChartConfigModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardConfigImplCopyWith<$Res>
    implements $DashboardConfigCopyWith<$Res> {
  factory _$$DashboardConfigImplCopyWith(_$DashboardConfigImpl value,
          $Res Function(_$DashboardConfigImpl) then) =
      __$$DashboardConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'METRIC') List<ChartConfigModel>? metricCharts,
      @JsonKey(name: 'TABLE') List<ChartConfigModel>? tableCharts});
}

/// @nodoc
class __$$DashboardConfigImplCopyWithImpl<$Res>
    extends _$DashboardConfigCopyWithImpl<$Res, _$DashboardConfigImpl>
    implements _$$DashboardConfigImplCopyWith<$Res> {
  __$$DashboardConfigImplCopyWithImpl(
      _$DashboardConfigImpl _value, $Res Function(_$DashboardConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metricCharts = freezed,
    Object? tableCharts = freezed,
  }) {
    return _then(_$DashboardConfigImpl(
      metricCharts: freezed == metricCharts
          ? _value._metricCharts
          : metricCharts // ignore: cast_nullable_to_non_nullable
              as List<ChartConfigModel>?,
      tableCharts: freezed == tableCharts
          ? _value._tableCharts
          : tableCharts // ignore: cast_nullable_to_non_nullable
              as List<ChartConfigModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardConfigImpl implements _DashboardConfig {
  const _$DashboardConfigImpl(
      {@JsonKey(name: 'METRIC') final List<ChartConfigModel>? metricCharts,
      @JsonKey(name: 'TABLE') final List<ChartConfigModel>? tableCharts})
      : _metricCharts = metricCharts,
        _tableCharts = tableCharts;

  factory _$DashboardConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardConfigImplFromJson(json);

  final List<ChartConfigModel>? _metricCharts;
  @override
  @JsonKey(name: 'METRIC')
  List<ChartConfigModel>? get metricCharts {
    final value = _metricCharts;
    if (value == null) return null;
    if (_metricCharts is EqualUnmodifiableListView) return _metricCharts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ChartConfigModel>? _tableCharts;
  @override
  @JsonKey(name: 'TABLE')
  List<ChartConfigModel>? get tableCharts {
    final value = _tableCharts;
    if (value == null) return null;
    if (_tableCharts is EqualUnmodifiableListView) return _tableCharts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DashboardConfig(metricCharts: $metricCharts, tableCharts: $tableCharts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardConfigImpl &&
            const DeepCollectionEquality()
                .equals(other._metricCharts, _metricCharts) &&
            const DeepCollectionEquality()
                .equals(other._tableCharts, _tableCharts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_metricCharts),
      const DeepCollectionEquality().hash(_tableCharts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardConfigImplCopyWith<_$DashboardConfigImpl> get copyWith =>
      __$$DashboardConfigImplCopyWithImpl<_$DashboardConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardConfigImplToJson(
      this,
    );
  }
}

abstract class _DashboardConfig implements DashboardConfig {
  const factory _DashboardConfig(
          {@JsonKey(name: 'METRIC') final List<ChartConfigModel>? metricCharts,
          @JsonKey(name: 'TABLE') final List<ChartConfigModel>? tableCharts}) =
      _$DashboardConfigImpl;

  factory _DashboardConfig.fromJson(Map<String, dynamic> json) =
      _$DashboardConfigImpl.fromJson;

  @override
  @JsonKey(name: 'METRIC')
  List<ChartConfigModel>? get metricCharts;
  @override
  @JsonKey(name: 'TABLE')
  List<ChartConfigModel>? get tableCharts;
  @override
  @JsonKey(ignore: true)
  _$$DashboardConfigImplCopyWith<_$DashboardConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChartConfigModel _$ChartConfigModelFromJson(Map<String, dynamic> json) {
  return _ChartConfigModel.fromJson(json);
}

/// @nodoc
mixin _$ChartConfigModel {
  @JsonKey(name: 'active')
  bool get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'vizType')
  String? get vizType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartConfigModelCopyWith<ChartConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartConfigModelCopyWith<$Res> {
  factory $ChartConfigModelCopyWith(
          ChartConfigModel value, $Res Function(ChartConfigModel) then) =
      _$ChartConfigModelCopyWithImpl<$Res, ChartConfigModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'active') bool active,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'vizType') String? vizType});
}

/// @nodoc
class _$ChartConfigModelCopyWithImpl<$Res, $Val extends ChartConfigModel>
    implements $ChartConfigModelCopyWith<$Res> {
  _$ChartConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? name = null,
    Object? vizType = freezed,
  }) {
    return _then(_value.copyWith(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vizType: freezed == vizType
          ? _value.vizType
          : vizType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartConfigModelImplCopyWith<$Res>
    implements $ChartConfigModelCopyWith<$Res> {
  factory _$$ChartConfigModelImplCopyWith(_$ChartConfigModelImpl value,
          $Res Function(_$ChartConfigModelImpl) then) =
      __$$ChartConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'active') bool active,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'vizType') String? vizType});
}

/// @nodoc
class __$$ChartConfigModelImplCopyWithImpl<$Res>
    extends _$ChartConfigModelCopyWithImpl<$Res, _$ChartConfigModelImpl>
    implements _$$ChartConfigModelImplCopyWith<$Res> {
  __$$ChartConfigModelImplCopyWithImpl(_$ChartConfigModelImpl _value,
      $Res Function(_$ChartConfigModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? name = null,
    Object? vizType = freezed,
  }) {
    return _then(_$ChartConfigModelImpl(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vizType: freezed == vizType
          ? _value.vizType
          : vizType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartConfigModelImpl implements _ChartConfigModel {
  const _$ChartConfigModelImpl(
      {@JsonKey(name: 'active') required this.active,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'vizType') this.vizType});

  factory _$ChartConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartConfigModelImplFromJson(json);

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
  String toString() {
    return 'ChartConfigModel(active: $active, name: $name, vizType: $vizType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartConfigModelImpl &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vizType, vizType) || other.vizType == vizType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, active, name, vizType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartConfigModelImplCopyWith<_$ChartConfigModelImpl> get copyWith =>
      __$$ChartConfigModelImplCopyWithImpl<_$ChartConfigModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartConfigModelImplToJson(
      this,
    );
  }
}

abstract class _ChartConfigModel implements ChartConfigModel {
  const factory _ChartConfigModel(
          {@JsonKey(name: 'active') required final bool active,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'vizType') final String? vizType}) =
      _$ChartConfigModelImpl;

  factory _ChartConfigModel.fromJson(Map<String, dynamic> json) =
      _$ChartConfigModelImpl.fromJson;

  @override
  @JsonKey(name: 'active')
  bool get active;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'vizType')
  String? get vizType;
  @override
  @JsonKey(ignore: true)
  _$$ChartConfigModelImplCopyWith<_$ChartConfigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

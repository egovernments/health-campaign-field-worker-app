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

DashboardConfigPrimaryWrapper _$DashboardConfigPrimaryWrapperFromJson(
    Map<String, dynamic> json) {
  return _DashboardConfigPrimaryWrapper.fromJson(json);
}

/// @nodoc
mixin _$DashboardConfigPrimaryWrapper {
  @JsonKey(name: 'dashboardConfig')
  List<DashboardConfigWrapper> get dashboardConfigWrapper =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardConfigPrimaryWrapperCopyWith<DashboardConfigPrimaryWrapper>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardConfigPrimaryWrapperCopyWith<$Res> {
  factory $DashboardConfigPrimaryWrapperCopyWith(
          DashboardConfigPrimaryWrapper value,
          $Res Function(DashboardConfigPrimaryWrapper) then) =
      _$DashboardConfigPrimaryWrapperCopyWithImpl<$Res,
          DashboardConfigPrimaryWrapper>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dashboardConfig')
      List<DashboardConfigWrapper> dashboardConfigWrapper});
}

/// @nodoc
class _$DashboardConfigPrimaryWrapperCopyWithImpl<$Res,
        $Val extends DashboardConfigPrimaryWrapper>
    implements $DashboardConfigPrimaryWrapperCopyWith<$Res> {
  _$DashboardConfigPrimaryWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dashboardConfigWrapper = null,
  }) {
    return _then(_value.copyWith(
      dashboardConfigWrapper: null == dashboardConfigWrapper
          ? _value.dashboardConfigWrapper
          : dashboardConfigWrapper // ignore: cast_nullable_to_non_nullable
              as List<DashboardConfigWrapper>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardConfigPrimaryWrapperImplCopyWith<$Res>
    implements $DashboardConfigPrimaryWrapperCopyWith<$Res> {
  factory _$$DashboardConfigPrimaryWrapperImplCopyWith(
          _$DashboardConfigPrimaryWrapperImpl value,
          $Res Function(_$DashboardConfigPrimaryWrapperImpl) then) =
      __$$DashboardConfigPrimaryWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dashboardConfig')
      List<DashboardConfigWrapper> dashboardConfigWrapper});
}

/// @nodoc
class __$$DashboardConfigPrimaryWrapperImplCopyWithImpl<$Res>
    extends _$DashboardConfigPrimaryWrapperCopyWithImpl<$Res,
        _$DashboardConfigPrimaryWrapperImpl>
    implements _$$DashboardConfigPrimaryWrapperImplCopyWith<$Res> {
  __$$DashboardConfigPrimaryWrapperImplCopyWithImpl(
      _$DashboardConfigPrimaryWrapperImpl _value,
      $Res Function(_$DashboardConfigPrimaryWrapperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dashboardConfigWrapper = null,
  }) {
    return _then(_$DashboardConfigPrimaryWrapperImpl(
      dashboardConfigWrapper: null == dashboardConfigWrapper
          ? _value._dashboardConfigWrapper
          : dashboardConfigWrapper // ignore: cast_nullable_to_non_nullable
              as List<DashboardConfigWrapper>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardConfigPrimaryWrapperImpl
    implements _DashboardConfigPrimaryWrapper {
  const _$DashboardConfigPrimaryWrapperImpl(
      {@JsonKey(name: 'dashboardConfig')
      final List<DashboardConfigWrapper> dashboardConfigWrapper = const []})
      : _dashboardConfigWrapper = dashboardConfigWrapper;

  factory _$DashboardConfigPrimaryWrapperImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DashboardConfigPrimaryWrapperImplFromJson(json);

  final List<DashboardConfigWrapper> _dashboardConfigWrapper;
  @override
  @JsonKey(name: 'dashboardConfig')
  List<DashboardConfigWrapper> get dashboardConfigWrapper {
    if (_dashboardConfigWrapper is EqualUnmodifiableListView)
      return _dashboardConfigWrapper;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dashboardConfigWrapper);
  }

  @override
  String toString() {
    return 'DashboardConfigPrimaryWrapper(dashboardConfigWrapper: $dashboardConfigWrapper)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardConfigPrimaryWrapperImpl &&
            const DeepCollectionEquality().equals(
                other._dashboardConfigWrapper, _dashboardConfigWrapper));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_dashboardConfigWrapper));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardConfigPrimaryWrapperImplCopyWith<
          _$DashboardConfigPrimaryWrapperImpl>
      get copyWith => __$$DashboardConfigPrimaryWrapperImplCopyWithImpl<
          _$DashboardConfigPrimaryWrapperImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardConfigPrimaryWrapperImplToJson(
      this,
    );
  }
}

abstract class _DashboardConfigPrimaryWrapper
    implements DashboardConfigPrimaryWrapper {
  const factory _DashboardConfigPrimaryWrapper(
          {@JsonKey(name: 'dashboardConfig')
          final List<DashboardConfigWrapper> dashboardConfigWrapper}) =
      _$DashboardConfigPrimaryWrapperImpl;

  factory _DashboardConfigPrimaryWrapper.fromJson(Map<String, dynamic> json) =
      _$DashboardConfigPrimaryWrapperImpl.fromJson;

  @override
  @JsonKey(name: 'dashboardConfig')
  List<DashboardConfigWrapper> get dashboardConfigWrapper;
  @override
  @JsonKey(ignore: true)
  _$$DashboardConfigPrimaryWrapperImplCopyWith<
          _$DashboardConfigPrimaryWrapperImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DashboardConfigWrapper _$DashboardConfigWrapperFromJson(
    Map<String, dynamic> json) {
  return _DashboardConfigWrapper.fromJson(json);
}

/// @nodoc
mixin _$DashboardConfigWrapper {
  @JsonKey(name: 'enableDashboard')
  bool get enableDashboard => throw _privateConstructorUsedError;
  @JsonKey(name: 'charts')
  List<ChartConfigModel>? get charts => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'charts') List<ChartConfigModel>? charts});
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
    Object? charts = freezed,
  }) {
    return _then(_value.copyWith(
      enableDashboard: null == enableDashboard
          ? _value.enableDashboard
          : enableDashboard // ignore: cast_nullable_to_non_nullable
              as bool,
      charts: freezed == charts
          ? _value.charts
          : charts // ignore: cast_nullable_to_non_nullable
              as List<ChartConfigModel>?,
    ) as $Val);
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
      @JsonKey(name: 'charts') List<ChartConfigModel>? charts});
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
    Object? charts = freezed,
  }) {
    return _then(_$DashboardConfigWrapperImpl(
      enableDashboard: null == enableDashboard
          ? _value.enableDashboard
          : enableDashboard // ignore: cast_nullable_to_non_nullable
              as bool,
      charts: freezed == charts
          ? _value._charts
          : charts // ignore: cast_nullable_to_non_nullable
              as List<ChartConfigModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardConfigWrapperImpl implements _DashboardConfigWrapper {
  const _$DashboardConfigWrapperImpl(
      {@JsonKey(name: 'enableDashboard') required this.enableDashboard,
      @JsonKey(name: 'charts') final List<ChartConfigModel>? charts})
      : _charts = charts;

  factory _$DashboardConfigWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardConfigWrapperImplFromJson(json);

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
  String toString() {
    return 'DashboardConfigWrapper(enableDashboard: $enableDashboard, charts: $charts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardConfigWrapperImpl &&
            (identical(other.enableDashboard, enableDashboard) ||
                other.enableDashboard == enableDashboard) &&
            const DeepCollectionEquality().equals(other._charts, _charts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, enableDashboard,
      const DeepCollectionEquality().hash(_charts));

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
      @JsonKey(name: 'charts')
      final List<ChartConfigModel>? charts}) = _$DashboardConfigWrapperImpl;

  factory _DashboardConfigWrapper.fromJson(Map<String, dynamic> json) =
      _$DashboardConfigWrapperImpl.fromJson;

  @override
  @JsonKey(name: 'enableDashboard')
  bool get enableDashboard;
  @override
  @JsonKey(name: 'charts')
  List<ChartConfigModel>? get charts;
  @override
  @JsonKey(ignore: true)
  _$$DashboardConfigWrapperImplCopyWith<_$DashboardConfigWrapperImpl>
      get copyWith => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'chartType')
  String get chartType => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'vizType') String? vizType,
      @JsonKey(name: 'chartType') String chartType});
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
    Object? chartType = null,
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
      chartType: null == chartType
          ? _value.chartType
          : chartType // ignore: cast_nullable_to_non_nullable
              as String,
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
      @JsonKey(name: 'vizType') String? vizType,
      @JsonKey(name: 'chartType') String chartType});
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
    Object? chartType = null,
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
      chartType: null == chartType
          ? _value.chartType
          : chartType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartConfigModelImpl implements _ChartConfigModel {
  const _$ChartConfigModelImpl(
      {@JsonKey(name: 'active') required this.active,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'vizType') this.vizType,
      @JsonKey(name: 'chartType') required this.chartType});

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
  @JsonKey(name: 'chartType')
  final String chartType;

  @override
  String toString() {
    return 'ChartConfigModel(active: $active, name: $name, vizType: $vizType, chartType: $chartType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartConfigModelImpl &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vizType, vizType) || other.vizType == vizType) &&
            (identical(other.chartType, chartType) ||
                other.chartType == chartType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, active, name, vizType, chartType);

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
          @JsonKey(name: 'vizType') final String? vizType,
          @JsonKey(name: 'chartType') required final String chartType}) =
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
  @JsonKey(name: 'chartType')
  String get chartType;
  @override
  @JsonKey(ignore: true)
  _$$ChartConfigModelImplCopyWith<_$ChartConfigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

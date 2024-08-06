// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_initialization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppInitializationEvent {
  int get retriesLeft => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int retriesLeft) onSetup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int retriesLeft)? onSetup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int retriesLeft)? onSetup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitializationSetupEvent value) onSetup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitializationSetupEvent value)? onSetup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitializationSetupEvent value)? onSetup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppInitializationEventCopyWith<AppInitializationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppInitializationEventCopyWith<$Res> {
  factory $AppInitializationEventCopyWith(AppInitializationEvent value,
          $Res Function(AppInitializationEvent) then) =
      _$AppInitializationEventCopyWithImpl<$Res, AppInitializationEvent>;
  @useResult
  $Res call({int retriesLeft});
}

/// @nodoc
class _$AppInitializationEventCopyWithImpl<$Res,
        $Val extends AppInitializationEvent>
    implements $AppInitializationEventCopyWith<$Res> {
  _$AppInitializationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retriesLeft = null,
  }) {
    return _then(_value.copyWith(
      retriesLeft: null == retriesLeft
          ? _value.retriesLeft
          : retriesLeft // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppInitializationSetupEventImplCopyWith<$Res>
    implements $AppInitializationEventCopyWith<$Res> {
  factory _$$AppInitializationSetupEventImplCopyWith(
          _$AppInitializationSetupEventImpl value,
          $Res Function(_$AppInitializationSetupEventImpl) then) =
      __$$AppInitializationSetupEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int retriesLeft});
}

/// @nodoc
class __$$AppInitializationSetupEventImplCopyWithImpl<$Res>
    extends _$AppInitializationEventCopyWithImpl<$Res,
        _$AppInitializationSetupEventImpl>
    implements _$$AppInitializationSetupEventImplCopyWith<$Res> {
  __$$AppInitializationSetupEventImplCopyWithImpl(
      _$AppInitializationSetupEventImpl _value,
      $Res Function(_$AppInitializationSetupEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retriesLeft = null,
  }) {
    return _then(_$AppInitializationSetupEventImpl(
      retriesLeft: null == retriesLeft
          ? _value.retriesLeft
          : retriesLeft // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AppInitializationSetupEventImpl implements AppInitializationSetupEvent {
  const _$AppInitializationSetupEventImpl({this.retriesLeft = 3});

  @override
  @JsonKey()
  final int retriesLeft;

  @override
  String toString() {
    return 'AppInitializationEvent.onSetup(retriesLeft: $retriesLeft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppInitializationSetupEventImpl &&
            (identical(other.retriesLeft, retriesLeft) ||
                other.retriesLeft == retriesLeft));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retriesLeft);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppInitializationSetupEventImplCopyWith<_$AppInitializationSetupEventImpl>
      get copyWith => __$$AppInitializationSetupEventImplCopyWithImpl<
          _$AppInitializationSetupEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int retriesLeft) onSetup,
  }) {
    return onSetup(retriesLeft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int retriesLeft)? onSetup,
  }) {
    return onSetup?.call(retriesLeft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int retriesLeft)? onSetup,
    required TResult orElse(),
  }) {
    if (onSetup != null) {
      return onSetup(retriesLeft);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitializationSetupEvent value) onSetup,
  }) {
    return onSetup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitializationSetupEvent value)? onSetup,
  }) {
    return onSetup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitializationSetupEvent value)? onSetup,
    required TResult orElse(),
  }) {
    if (onSetup != null) {
      return onSetup(this);
    }
    return orElse();
  }
}

abstract class AppInitializationSetupEvent implements AppInitializationEvent {
  const factory AppInitializationSetupEvent({final int retriesLeft}) =
      _$AppInitializationSetupEventImpl;

  @override
  int get retriesLeft;
  @override
  @JsonKey(ignore: true)
  _$$AppInitializationSetupEventImplCopyWith<_$AppInitializationSetupEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppInitializationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() loading,
    required TResult Function() failed,
    required TResult Function(
            AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList,
            DashboardConfigSchema? dashboardConfigSchema)
        initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitialized,
    TResult? Function()? loading,
    TResult? Function()? failed,
    TResult? Function(
            AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList,
            DashboardConfigSchema? dashboardConfigSchema)?
        initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? loading,
    TResult Function()? failed,
    TResult Function(
            AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList,
            DashboardConfigSchema? dashboardConfigSchema)?
        initialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppUninitialized value) uninitialized,
    required TResult Function(AppInitializing value) loading,
    required TResult Function(AppInitializationFailed value) failed,
    required TResult Function(AppInitialized value) initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUninitialized value)? uninitialized,
    TResult? Function(AppInitializing value)? loading,
    TResult? Function(AppInitializationFailed value)? failed,
    TResult? Function(AppInitialized value)? initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUninitialized value)? uninitialized,
    TResult Function(AppInitializing value)? loading,
    TResult Function(AppInitializationFailed value)? failed,
    TResult Function(AppInitialized value)? initialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppInitializationStateCopyWith<$Res> {
  factory $AppInitializationStateCopyWith(AppInitializationState value,
          $Res Function(AppInitializationState) then) =
      _$AppInitializationStateCopyWithImpl<$Res, AppInitializationState>;
}

/// @nodoc
class _$AppInitializationStateCopyWithImpl<$Res,
        $Val extends AppInitializationState>
    implements $AppInitializationStateCopyWith<$Res> {
  _$AppInitializationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppUninitializedImplCopyWith<$Res> {
  factory _$$AppUninitializedImplCopyWith(_$AppUninitializedImpl value,
          $Res Function(_$AppUninitializedImpl) then) =
      __$$AppUninitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppUninitializedImplCopyWithImpl<$Res>
    extends _$AppInitializationStateCopyWithImpl<$Res, _$AppUninitializedImpl>
    implements _$$AppUninitializedImplCopyWith<$Res> {
  __$$AppUninitializedImplCopyWithImpl(_$AppUninitializedImpl _value,
      $Res Function(_$AppUninitializedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppUninitializedImpl extends AppUninitialized {
  const _$AppUninitializedImpl() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppUninitializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() loading,
    required TResult Function() failed,
    required TResult Function(
            AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList,
            DashboardConfigSchema? dashboardConfigSchema)
        initialized,
  }) {
    return uninitialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitialized,
    TResult? Function()? loading,
    TResult? Function()? failed,
    TResult? Function(
            AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList,
            DashboardConfigSchema? dashboardConfigSchema)?
        initialized,
  }) {
    return uninitialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? loading,
    TResult Function()? failed,
    TResult Function(
            AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList,
            DashboardConfigSchema? dashboardConfigSchema)?
        initialized,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppUninitialized value) uninitialized,
    required TResult Function(AppInitializing value) loading,
    required TResult Function(AppInitializationFailed value) failed,
    required TResult Function(AppInitialized value) initialized,
  }) {
    return uninitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUninitialized value)? uninitialized,
    TResult? Function(AppInitializing value)? loading,
    TResult? Function(AppInitializationFailed value)? failed,
    TResult? Function(AppInitialized value)? initialized,
  }) {
    return uninitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUninitialized value)? uninitialized,
    TResult Function(AppInitializing value)? loading,
    TResult Function(AppInitializationFailed value)? failed,
    TResult Function(AppInitialized value)? initialized,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized(this);
    }
    return orElse();
  }
}

abstract class AppUninitialized extends AppInitializationState {
  const factory AppUninitialized() = _$AppUninitializedImpl;
  const AppUninitialized._() : super._();
}

/// @nodoc
abstract class _$$AppInitializingImplCopyWith<$Res> {
  factory _$$AppInitializingImplCopyWith(_$AppInitializingImpl value,
          $Res Function(_$AppInitializingImpl) then) =
      __$$AppInitializingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppInitializingImplCopyWithImpl<$Res>
    extends _$AppInitializationStateCopyWithImpl<$Res, _$AppInitializingImpl>
    implements _$$AppInitializingImplCopyWith<$Res> {
  __$$AppInitializingImplCopyWithImpl(
      _$AppInitializingImpl _value, $Res Function(_$AppInitializingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppInitializingImpl extends AppInitializing {
  const _$AppInitializingImpl() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppInitializingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() loading,
    required TResult Function() failed,
    required TResult Function(
            AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList,
            DashboardConfigSchema? dashboardConfigSchema)
        initialized,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitialized,
    TResult? Function()? loading,
    TResult? Function()? failed,
    TResult? Function(
            AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList,
            DashboardConfigSchema? dashboardConfigSchema)?
        initialized,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? loading,
    TResult Function()? failed,
    TResult Function(
            AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList,
            DashboardConfigSchema? dashboardConfigSchema)?
        initialized,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppUninitialized value) uninitialized,
    required TResult Function(AppInitializing value) loading,
    required TResult Function(AppInitializationFailed value) failed,
    required TResult Function(AppInitialized value) initialized,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUninitialized value)? uninitialized,
    TResult? Function(AppInitializing value)? loading,
    TResult? Function(AppInitializationFailed value)? failed,
    TResult? Function(AppInitialized value)? initialized,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUninitialized value)? uninitialized,
    TResult Function(AppInitializing value)? loading,
    TResult Function(AppInitializationFailed value)? failed,
    TResult Function(AppInitialized value)? initialized,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AppInitializing extends AppInitializationState {
  const factory AppInitializing() = _$AppInitializingImpl;
  const AppInitializing._() : super._();
}

/// @nodoc
abstract class _$$AppInitializationFailedImplCopyWith<$Res> {
  factory _$$AppInitializationFailedImplCopyWith(
          _$AppInitializationFailedImpl value,
          $Res Function(_$AppInitializationFailedImpl) then) =
      __$$AppInitializationFailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppInitializationFailedImplCopyWithImpl<$Res>
    extends _$AppInitializationStateCopyWithImpl<$Res,
        _$AppInitializationFailedImpl>
    implements _$$AppInitializationFailedImplCopyWith<$Res> {
  __$$AppInitializationFailedImplCopyWithImpl(
      _$AppInitializationFailedImpl _value,
      $Res Function(_$AppInitializationFailedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppInitializationFailedImpl extends AppInitializationFailed {
  const _$AppInitializationFailedImpl() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppInitializationFailedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() loading,
    required TResult Function() failed,
    required TResult Function(
            AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList,
            DashboardConfigSchema? dashboardConfigSchema)
        initialized,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitialized,
    TResult? Function()? loading,
    TResult? Function()? failed,
    TResult? Function(
            AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList,
            DashboardConfigSchema? dashboardConfigSchema)?
        initialized,
  }) {
    return failed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? loading,
    TResult Function()? failed,
    TResult Function(
            AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList,
            DashboardConfigSchema? dashboardConfigSchema)?
        initialized,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppUninitialized value) uninitialized,
    required TResult Function(AppInitializing value) loading,
    required TResult Function(AppInitializationFailed value) failed,
    required TResult Function(AppInitialized value) initialized,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUninitialized value)? uninitialized,
    TResult? Function(AppInitializing value)? loading,
    TResult? Function(AppInitializationFailed value)? failed,
    TResult? Function(AppInitialized value)? initialized,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUninitialized value)? uninitialized,
    TResult Function(AppInitializing value)? loading,
    TResult Function(AppInitializationFailed value)? failed,
    TResult Function(AppInitialized value)? initialized,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class AppInitializationFailed extends AppInitializationState {
  const factory AppInitializationFailed() = _$AppInitializationFailedImpl;
  const AppInitializationFailed._() : super._();
}

/// @nodoc
abstract class _$$AppInitializedImplCopyWith<$Res> {
  factory _$$AppInitializedImplCopyWith(_$AppInitializedImpl value,
          $Res Function(_$AppInitializedImpl) then) =
      __$$AppInitializedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {AppConfiguration appConfiguration,
      List<ServiceRegistry> serviceRegistryList,
      DashboardConfigSchema? dashboardConfigSchema});
}

/// @nodoc
class __$$AppInitializedImplCopyWithImpl<$Res>
    extends _$AppInitializationStateCopyWithImpl<$Res, _$AppInitializedImpl>
    implements _$$AppInitializedImplCopyWith<$Res> {
  __$$AppInitializedImplCopyWithImpl(
      _$AppInitializedImpl _value, $Res Function(_$AppInitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfiguration = null,
    Object? serviceRegistryList = null,
    Object? dashboardConfigSchema = freezed,
  }) {
    return _then(_$AppInitializedImpl(
      appConfiguration: null == appConfiguration
          ? _value.appConfiguration
          : appConfiguration // ignore: cast_nullable_to_non_nullable
              as AppConfiguration,
      serviceRegistryList: null == serviceRegistryList
          ? _value._serviceRegistryList
          : serviceRegistryList // ignore: cast_nullable_to_non_nullable
              as List<ServiceRegistry>,
      dashboardConfigSchema: freezed == dashboardConfigSchema
          ? _value.dashboardConfigSchema
          : dashboardConfigSchema // ignore: cast_nullable_to_non_nullable
              as DashboardConfigSchema?,
    ));
  }
}

/// @nodoc

class _$AppInitializedImpl extends AppInitialized {
  const _$AppInitializedImpl(
      {required this.appConfiguration,
      final List<ServiceRegistry> serviceRegistryList = const [],
      this.dashboardConfigSchema})
      : _serviceRegistryList = serviceRegistryList,
        super._();

  @override
  final AppConfiguration appConfiguration;
  final List<ServiceRegistry> _serviceRegistryList;
  @override
  @JsonKey()
  List<ServiceRegistry> get serviceRegistryList {
    if (_serviceRegistryList is EqualUnmodifiableListView)
      return _serviceRegistryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceRegistryList);
  }

  @override
  final DashboardConfigSchema? dashboardConfigSchema;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppInitializedImpl &&
            (identical(other.appConfiguration, appConfiguration) ||
                other.appConfiguration == appConfiguration) &&
            const DeepCollectionEquality()
                .equals(other._serviceRegistryList, _serviceRegistryList) &&
            (identical(other.dashboardConfigSchema, dashboardConfigSchema) ||
                other.dashboardConfigSchema == dashboardConfigSchema));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      appConfiguration,
      const DeepCollectionEquality().hash(_serviceRegistryList),
      dashboardConfigSchema);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppInitializedImplCopyWith<_$AppInitializedImpl> get copyWith =>
      __$$AppInitializedImplCopyWithImpl<_$AppInitializedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() loading,
    required TResult Function() failed,
    required TResult Function(
            AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList,
            DashboardConfigSchema? dashboardConfigSchema)
        initialized,
  }) {
    return initialized(
        appConfiguration, serviceRegistryList, dashboardConfigSchema);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitialized,
    TResult? Function()? loading,
    TResult? Function()? failed,
    TResult? Function(
            AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList,
            DashboardConfigSchema? dashboardConfigSchema)?
        initialized,
  }) {
    return initialized?.call(
        appConfiguration, serviceRegistryList, dashboardConfigSchema);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? loading,
    TResult Function()? failed,
    TResult Function(
            AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList,
            DashboardConfigSchema? dashboardConfigSchema)?
        initialized,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(
          appConfiguration, serviceRegistryList, dashboardConfigSchema);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppUninitialized value) uninitialized,
    required TResult Function(AppInitializing value) loading,
    required TResult Function(AppInitializationFailed value) failed,
    required TResult Function(AppInitialized value) initialized,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUninitialized value)? uninitialized,
    TResult? Function(AppInitializing value)? loading,
    TResult? Function(AppInitializationFailed value)? failed,
    TResult? Function(AppInitialized value)? initialized,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUninitialized value)? uninitialized,
    TResult Function(AppInitializing value)? loading,
    TResult Function(AppInitializationFailed value)? failed,
    TResult Function(AppInitialized value)? initialized,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class AppInitialized extends AppInitializationState {
  const factory AppInitialized(
          {required final AppConfiguration appConfiguration,
          final List<ServiceRegistry> serviceRegistryList,
          final DashboardConfigSchema? dashboardConfigSchema}) =
      _$AppInitializedImpl;
  const AppInitialized._() : super._();

  AppConfiguration get appConfiguration;
  List<ServiceRegistry> get serviceRegistryList;
  DashboardConfigSchema? get dashboardConfigSchema;
  @JsonKey(ignore: true)
  _$$AppInitializedImplCopyWith<_$AppInitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

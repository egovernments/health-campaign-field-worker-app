// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_initialization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$AppInitializationSetupEventCopyWith<$Res>
    implements $AppInitializationEventCopyWith<$Res> {
  factory _$$AppInitializationSetupEventCopyWith(
          _$AppInitializationSetupEvent value,
          $Res Function(_$AppInitializationSetupEvent) then) =
      __$$AppInitializationSetupEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int retriesLeft});
}

/// @nodoc
class __$$AppInitializationSetupEventCopyWithImpl<$Res>
    extends _$AppInitializationEventCopyWithImpl<$Res,
        _$AppInitializationSetupEvent>
    implements _$$AppInitializationSetupEventCopyWith<$Res> {
  __$$AppInitializationSetupEventCopyWithImpl(
      _$AppInitializationSetupEvent _value,
      $Res Function(_$AppInitializationSetupEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retriesLeft = null,
  }) {
    return _then(_$AppInitializationSetupEvent(
      retriesLeft: null == retriesLeft
          ? _value.retriesLeft
          : retriesLeft // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AppInitializationSetupEvent implements AppInitializationSetupEvent {
  const _$AppInitializationSetupEvent({this.retriesLeft = 3});

  @override
  @JsonKey()
  final int retriesLeft;

  @override
  String toString() {
    return 'AppInitializationEvent.onSetup(retriesLeft: $retriesLeft)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppInitializationSetupEvent &&
            (identical(other.retriesLeft, retriesLeft) ||
                other.retriesLeft == retriesLeft));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retriesLeft);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppInitializationSetupEventCopyWith<_$AppInitializationSetupEvent>
      get copyWith => __$$AppInitializationSetupEventCopyWithImpl<
          _$AppInitializationSetupEvent>(this, _$identity);

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
      _$AppInitializationSetupEvent;

  @override
  int get retriesLeft;
  @override
  @JsonKey(ignore: true)
  _$$AppInitializationSetupEventCopyWith<_$AppInitializationSetupEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppInitializationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() loading,
    required TResult Function(AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList)
        initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitialized,
    TResult? Function()? loading,
    TResult? Function(AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList)?
        initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? loading,
    TResult Function(AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList)?
        initialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppUninitialized value) uninitialized,
    required TResult Function(AppInitializing value) loading,
    required TResult Function(AppInitialized value) initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUninitialized value)? uninitialized,
    TResult? Function(AppInitializing value)? loading,
    TResult? Function(AppInitialized value)? initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUninitialized value)? uninitialized,
    TResult Function(AppInitializing value)? loading,
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
abstract class _$$AppUninitializedCopyWith<$Res> {
  factory _$$AppUninitializedCopyWith(
          _$AppUninitialized value, $Res Function(_$AppUninitialized) then) =
      __$$AppUninitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppUninitializedCopyWithImpl<$Res>
    extends _$AppInitializationStateCopyWithImpl<$Res, _$AppUninitialized>
    implements _$$AppUninitializedCopyWith<$Res> {
  __$$AppUninitializedCopyWithImpl(
      _$AppUninitialized _value, $Res Function(_$AppUninitialized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppUninitialized extends AppUninitialized {
  const _$AppUninitialized() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppUninitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() loading,
    required TResult Function(AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList)
        initialized,
  }) {
    return uninitialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitialized,
    TResult? Function()? loading,
    TResult? Function(AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList)?
        initialized,
  }) {
    return uninitialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? loading,
    TResult Function(AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList)?
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
    required TResult Function(AppInitialized value) initialized,
  }) {
    return uninitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUninitialized value)? uninitialized,
    TResult? Function(AppInitializing value)? loading,
    TResult? Function(AppInitialized value)? initialized,
  }) {
    return uninitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUninitialized value)? uninitialized,
    TResult Function(AppInitializing value)? loading,
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
  const factory AppUninitialized() = _$AppUninitialized;
  const AppUninitialized._() : super._();
}

/// @nodoc
abstract class _$$AppInitializingCopyWith<$Res> {
  factory _$$AppInitializingCopyWith(
          _$AppInitializing value, $Res Function(_$AppInitializing) then) =
      __$$AppInitializingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppInitializingCopyWithImpl<$Res>
    extends _$AppInitializationStateCopyWithImpl<$Res, _$AppInitializing>
    implements _$$AppInitializingCopyWith<$Res> {
  __$$AppInitializingCopyWithImpl(
      _$AppInitializing _value, $Res Function(_$AppInitializing) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppInitializing extends AppInitializing {
  const _$AppInitializing() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppInitializing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() loading,
    required TResult Function(AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList)
        initialized,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitialized,
    TResult? Function()? loading,
    TResult? Function(AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList)?
        initialized,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? loading,
    TResult Function(AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList)?
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
    required TResult Function(AppInitialized value) initialized,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUninitialized value)? uninitialized,
    TResult? Function(AppInitializing value)? loading,
    TResult? Function(AppInitialized value)? initialized,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUninitialized value)? uninitialized,
    TResult Function(AppInitializing value)? loading,
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
  const factory AppInitializing() = _$AppInitializing;
  const AppInitializing._() : super._();
}

/// @nodoc
abstract class _$$AppInitializedCopyWith<$Res> {
  factory _$$AppInitializedCopyWith(
          _$AppInitialized value, $Res Function(_$AppInitialized) then) =
      __$$AppInitializedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {AppConfiguration appConfiguration,
      List<ServiceRegistry> serviceRegistryList});
}

/// @nodoc
class __$$AppInitializedCopyWithImpl<$Res>
    extends _$AppInitializationStateCopyWithImpl<$Res, _$AppInitialized>
    implements _$$AppInitializedCopyWith<$Res> {
  __$$AppInitializedCopyWithImpl(
      _$AppInitialized _value, $Res Function(_$AppInitialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfiguration = null,
    Object? serviceRegistryList = null,
  }) {
    return _then(_$AppInitialized(
      appConfiguration: null == appConfiguration
          ? _value.appConfiguration
          : appConfiguration // ignore: cast_nullable_to_non_nullable
              as AppConfiguration,
      serviceRegistryList: null == serviceRegistryList
          ? _value._serviceRegistryList
          : serviceRegistryList // ignore: cast_nullable_to_non_nullable
              as List<ServiceRegistry>,
    ));
  }
}

/// @nodoc

class _$AppInitialized extends AppInitialized {
  const _$AppInitialized(
      {required this.appConfiguration,
      final List<ServiceRegistry> serviceRegistryList = const []})
      : _serviceRegistryList = serviceRegistryList,
        super._();

  @override
  final AppConfiguration appConfiguration;
  final List<ServiceRegistry> _serviceRegistryList;
  @override
  @JsonKey()
  List<ServiceRegistry> get serviceRegistryList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceRegistryList);
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppInitialized &&
            (identical(other.appConfiguration, appConfiguration) ||
                other.appConfiguration == appConfiguration) &&
            const DeepCollectionEquality()
                .equals(other._serviceRegistryList, _serviceRegistryList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appConfiguration,
      const DeepCollectionEquality().hash(_serviceRegistryList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppInitializedCopyWith<_$AppInitialized> get copyWith =>
      __$$AppInitializedCopyWithImpl<_$AppInitialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() loading,
    required TResult Function(AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList)
        initialized,
  }) {
    return initialized(appConfiguration, serviceRegistryList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitialized,
    TResult? Function()? loading,
    TResult? Function(AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList)?
        initialized,
  }) {
    return initialized?.call(appConfiguration, serviceRegistryList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? loading,
    TResult Function(AppConfiguration appConfiguration,
            List<ServiceRegistry> serviceRegistryList)?
        initialized,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(appConfiguration, serviceRegistryList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppUninitialized value) uninitialized,
    required TResult Function(AppInitializing value) loading,
    required TResult Function(AppInitialized value) initialized,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUninitialized value)? uninitialized,
    TResult? Function(AppInitializing value)? loading,
    TResult? Function(AppInitialized value)? initialized,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUninitialized value)? uninitialized,
    TResult Function(AppInitializing value)? loading,
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
      final List<ServiceRegistry> serviceRegistryList}) = _$AppInitialized;
  const AppInitialized._() : super._();

  AppConfiguration get appConfiguration;
  List<ServiceRegistry> get serviceRegistryList;
  @JsonKey(ignore: true)
  _$$AppInitializedCopyWith<_$AppInitialized> get copyWith =>
      throw _privateConstructorUsedError;
}

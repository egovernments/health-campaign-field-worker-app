// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_guard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginGuardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String apiEndPoint)
        checkOtherDeviceLogin,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckOtherDeviceLoginEvent value)
        checkOtherDeviceLogin,
    required TResult Function(LoginGuardResetEvent value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckOtherDeviceLoginEvent value)? checkOtherDeviceLogin,
    TResult? Function(LoginGuardResetEvent value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckOtherDeviceLoginEvent value)? checkOtherDeviceLogin,
    TResult Function(LoginGuardResetEvent value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginGuardEventCopyWith<$Res> {
  factory $LoginGuardEventCopyWith(
          LoginGuardEvent value, $Res Function(LoginGuardEvent) then) =
      _$LoginGuardEventCopyWithImpl<$Res, LoginGuardEvent>;
}

/// @nodoc
class _$LoginGuardEventCopyWithImpl<$Res, $Val extends LoginGuardEvent>
    implements $LoginGuardEventCopyWith<$Res> {
  _$LoginGuardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckOtherDeviceLoginEventImplCopyWith<$Res> {
  factory _$$CheckOtherDeviceLoginEventImplCopyWith(
          _$CheckOtherDeviceLoginEventImpl value,
          $Res Function(_$CheckOtherDeviceLoginEventImpl) then) =
      __$$CheckOtherDeviceLoginEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username, String apiEndPoint});
}

/// @nodoc
class __$$CheckOtherDeviceLoginEventImplCopyWithImpl<$Res>
    extends _$LoginGuardEventCopyWithImpl<$Res,
        _$CheckOtherDeviceLoginEventImpl>
    implements _$$CheckOtherDeviceLoginEventImplCopyWith<$Res> {
  __$$CheckOtherDeviceLoginEventImplCopyWithImpl(
      _$CheckOtherDeviceLoginEventImpl _value,
      $Res Function(_$CheckOtherDeviceLoginEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? apiEndPoint = null,
  }) {
    return _then(_$CheckOtherDeviceLoginEventImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      apiEndPoint: null == apiEndPoint
          ? _value.apiEndPoint
          : apiEndPoint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckOtherDeviceLoginEventImpl implements CheckOtherDeviceLoginEvent {
  const _$CheckOtherDeviceLoginEventImpl(
      {required this.username, required this.apiEndPoint});

  @override
  final String username;
  @override
  final String apiEndPoint;

  @override
  String toString() {
    return 'LoginGuardEvent.checkOtherDeviceLogin(username: $username, apiEndPoint: $apiEndPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckOtherDeviceLoginEventImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.apiEndPoint, apiEndPoint) ||
                other.apiEndPoint == apiEndPoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, apiEndPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckOtherDeviceLoginEventImplCopyWith<_$CheckOtherDeviceLoginEventImpl>
      get copyWith => __$$CheckOtherDeviceLoginEventImplCopyWithImpl<
          _$CheckOtherDeviceLoginEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String apiEndPoint)
        checkOtherDeviceLogin,
    required TResult Function() reset,
  }) {
    return checkOtherDeviceLogin(username, apiEndPoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult? Function()? reset,
  }) {
    return checkOtherDeviceLogin?.call(username, apiEndPoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (checkOtherDeviceLogin != null) {
      return checkOtherDeviceLogin(username, apiEndPoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckOtherDeviceLoginEvent value)
        checkOtherDeviceLogin,
    required TResult Function(LoginGuardResetEvent value) reset,
  }) {
    return checkOtherDeviceLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckOtherDeviceLoginEvent value)? checkOtherDeviceLogin,
    TResult? Function(LoginGuardResetEvent value)? reset,
  }) {
    return checkOtherDeviceLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckOtherDeviceLoginEvent value)? checkOtherDeviceLogin,
    TResult Function(LoginGuardResetEvent value)? reset,
    required TResult orElse(),
  }) {
    if (checkOtherDeviceLogin != null) {
      return checkOtherDeviceLogin(this);
    }
    return orElse();
  }
}

abstract class CheckOtherDeviceLoginEvent implements LoginGuardEvent {
  const factory CheckOtherDeviceLoginEvent(
      {required final String username,
      required final String apiEndPoint}) = _$CheckOtherDeviceLoginEventImpl;

  String get username;
  String get apiEndPoint;
  @JsonKey(ignore: true)
  _$$CheckOtherDeviceLoginEventImplCopyWith<_$CheckOtherDeviceLoginEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginGuardResetEventImplCopyWith<$Res> {
  factory _$$LoginGuardResetEventImplCopyWith(_$LoginGuardResetEventImpl value,
          $Res Function(_$LoginGuardResetEventImpl) then) =
      __$$LoginGuardResetEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginGuardResetEventImplCopyWithImpl<$Res>
    extends _$LoginGuardEventCopyWithImpl<$Res, _$LoginGuardResetEventImpl>
    implements _$$LoginGuardResetEventImplCopyWith<$Res> {
  __$$LoginGuardResetEventImplCopyWithImpl(_$LoginGuardResetEventImpl _value,
      $Res Function(_$LoginGuardResetEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginGuardResetEventImpl implements LoginGuardResetEvent {
  const _$LoginGuardResetEventImpl();

  @override
  String toString() {
    return 'LoginGuardEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginGuardResetEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String apiEndPoint)
        checkOtherDeviceLogin,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckOtherDeviceLoginEvent value)
        checkOtherDeviceLogin,
    required TResult Function(LoginGuardResetEvent value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckOtherDeviceLoginEvent value)? checkOtherDeviceLogin,
    TResult? Function(LoginGuardResetEvent value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckOtherDeviceLoginEvent value)? checkOtherDeviceLogin,
    TResult Function(LoginGuardResetEvent value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class LoginGuardResetEvent implements LoginGuardEvent {
  const factory LoginGuardResetEvent() = _$LoginGuardResetEventImpl;
}

/// @nodoc
mixin _$LoginGuardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otherDevice,
    required TResult Function() allow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otherDevice,
    TResult? Function()? allow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otherDevice,
    TResult Function()? allow,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginGuardInitial value) initial,
    required TResult Function(LoginGuardOtherDeviceState value) otherDevice,
    required TResult Function(LoginGuardAllowState value) allow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginGuardInitial value)? initial,
    TResult? Function(LoginGuardOtherDeviceState value)? otherDevice,
    TResult? Function(LoginGuardAllowState value)? allow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginGuardInitial value)? initial,
    TResult Function(LoginGuardOtherDeviceState value)? otherDevice,
    TResult Function(LoginGuardAllowState value)? allow,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginGuardStateCopyWith<$Res> {
  factory $LoginGuardStateCopyWith(
          LoginGuardState value, $Res Function(LoginGuardState) then) =
      _$LoginGuardStateCopyWithImpl<$Res, LoginGuardState>;
}

/// @nodoc
class _$LoginGuardStateCopyWithImpl<$Res, $Val extends LoginGuardState>
    implements $LoginGuardStateCopyWith<$Res> {
  _$LoginGuardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginGuardInitialImplCopyWith<$Res> {
  factory _$$LoginGuardInitialImplCopyWith(_$LoginGuardInitialImpl value,
          $Res Function(_$LoginGuardInitialImpl) then) =
      __$$LoginGuardInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginGuardInitialImplCopyWithImpl<$Res>
    extends _$LoginGuardStateCopyWithImpl<$Res, _$LoginGuardInitialImpl>
    implements _$$LoginGuardInitialImplCopyWith<$Res> {
  __$$LoginGuardInitialImplCopyWithImpl(_$LoginGuardInitialImpl _value,
      $Res Function(_$LoginGuardInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginGuardInitialImpl implements LoginGuardInitial {
  const _$LoginGuardInitialImpl();

  @override
  String toString() {
    return 'LoginGuardState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginGuardInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otherDevice,
    required TResult Function() allow,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otherDevice,
    TResult? Function()? allow,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otherDevice,
    TResult Function()? allow,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginGuardInitial value) initial,
    required TResult Function(LoginGuardOtherDeviceState value) otherDevice,
    required TResult Function(LoginGuardAllowState value) allow,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginGuardInitial value)? initial,
    TResult? Function(LoginGuardOtherDeviceState value)? otherDevice,
    TResult? Function(LoginGuardAllowState value)? allow,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginGuardInitial value)? initial,
    TResult Function(LoginGuardOtherDeviceState value)? otherDevice,
    TResult Function(LoginGuardAllowState value)? allow,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LoginGuardInitial implements LoginGuardState {
  const factory LoginGuardInitial() = _$LoginGuardInitialImpl;
}

/// @nodoc
abstract class _$$LoginGuardOtherDeviceStateImplCopyWith<$Res> {
  factory _$$LoginGuardOtherDeviceStateImplCopyWith(
          _$LoginGuardOtherDeviceStateImpl value,
          $Res Function(_$LoginGuardOtherDeviceStateImpl) then) =
      __$$LoginGuardOtherDeviceStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginGuardOtherDeviceStateImplCopyWithImpl<$Res>
    extends _$LoginGuardStateCopyWithImpl<$Res,
        _$LoginGuardOtherDeviceStateImpl>
    implements _$$LoginGuardOtherDeviceStateImplCopyWith<$Res> {
  __$$LoginGuardOtherDeviceStateImplCopyWithImpl(
      _$LoginGuardOtherDeviceStateImpl _value,
      $Res Function(_$LoginGuardOtherDeviceStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginGuardOtherDeviceStateImpl implements LoginGuardOtherDeviceState {
  const _$LoginGuardOtherDeviceStateImpl();

  @override
  String toString() {
    return 'LoginGuardState.otherDevice()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginGuardOtherDeviceStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otherDevice,
    required TResult Function() allow,
  }) {
    return otherDevice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otherDevice,
    TResult? Function()? allow,
  }) {
    return otherDevice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otherDevice,
    TResult Function()? allow,
    required TResult orElse(),
  }) {
    if (otherDevice != null) {
      return otherDevice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginGuardInitial value) initial,
    required TResult Function(LoginGuardOtherDeviceState value) otherDevice,
    required TResult Function(LoginGuardAllowState value) allow,
  }) {
    return otherDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginGuardInitial value)? initial,
    TResult? Function(LoginGuardOtherDeviceState value)? otherDevice,
    TResult? Function(LoginGuardAllowState value)? allow,
  }) {
    return otherDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginGuardInitial value)? initial,
    TResult Function(LoginGuardOtherDeviceState value)? otherDevice,
    TResult Function(LoginGuardAllowState value)? allow,
    required TResult orElse(),
  }) {
    if (otherDevice != null) {
      return otherDevice(this);
    }
    return orElse();
  }
}

abstract class LoginGuardOtherDeviceState implements LoginGuardState {
  const factory LoginGuardOtherDeviceState() = _$LoginGuardOtherDeviceStateImpl;
}

/// @nodoc
abstract class _$$LoginGuardAllowStateImplCopyWith<$Res> {
  factory _$$LoginGuardAllowStateImplCopyWith(_$LoginGuardAllowStateImpl value,
          $Res Function(_$LoginGuardAllowStateImpl) then) =
      __$$LoginGuardAllowStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginGuardAllowStateImplCopyWithImpl<$Res>
    extends _$LoginGuardStateCopyWithImpl<$Res, _$LoginGuardAllowStateImpl>
    implements _$$LoginGuardAllowStateImplCopyWith<$Res> {
  __$$LoginGuardAllowStateImplCopyWithImpl(_$LoginGuardAllowStateImpl _value,
      $Res Function(_$LoginGuardAllowStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginGuardAllowStateImpl implements LoginGuardAllowState {
  const _$LoginGuardAllowStateImpl();

  @override
  String toString() {
    return 'LoginGuardState.allow()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginGuardAllowStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otherDevice,
    required TResult Function() allow,
  }) {
    return allow();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otherDevice,
    TResult? Function()? allow,
  }) {
    return allow?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otherDevice,
    TResult Function()? allow,
    required TResult orElse(),
  }) {
    if (allow != null) {
      return allow();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginGuardInitial value) initial,
    required TResult Function(LoginGuardOtherDeviceState value) otherDevice,
    required TResult Function(LoginGuardAllowState value) allow,
  }) {
    return allow(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginGuardInitial value)? initial,
    TResult? Function(LoginGuardOtherDeviceState value)? otherDevice,
    TResult? Function(LoginGuardAllowState value)? allow,
  }) {
    return allow?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginGuardInitial value)? initial,
    TResult Function(LoginGuardOtherDeviceState value)? otherDevice,
    TResult Function(LoginGuardAllowState value)? allow,
    required TResult orElse(),
  }) {
    if (allow != null) {
      return allow(this);
    }
    return orElse();
  }
}

abstract class LoginGuardAllowState implements LoginGuardState {
  const factory LoginGuardAllowState() = _$LoginGuardAllowStateImpl;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String password, String tenantId)
        login,
    required TResult Function(String tenantId) autoLogin,
    required TResult Function() logout,
    required TResult Function(
            String username, String tenantId, String apiEndPoint)
        checkOtherDeviceLogin,
    required TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)
        switchDevice,
    required TResult Function() reset,
    required TResult Function(
            UserActionModel userActionModel, String apiEndPoint)
        switchDeviceUserAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
    TResult? Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult? Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult? Function()? reset,
    TResult? Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
    TResult Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult Function()? reset,
    TResult Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(AuthAutoLoginEvent value) autoLogin,
    required TResult Function(AuthLogoutEvent value) logout,
    required TResult Function(AuthCheckOtherDeviceLoginEvent value)
        checkOtherDeviceLogin,
    required TResult Function(AuthSwitchDeviceEventSwitchDevice value)
        switchDevice,
    required TResult Function(AuthResetEvent value) reset,
    required TResult Function(AuthSwitchDeviceUserActionEvent value)
        switchDeviceUserAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
    TResult? Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult? Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult? Function(AuthResetEvent value)? reset,
    TResult? Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
    TResult Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult Function(AuthResetEvent value)? reset,
    TResult Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthLoginEventImplCopyWith<$Res> {
  factory _$$AuthLoginEventImplCopyWith(_$AuthLoginEventImpl value,
          $Res Function(_$AuthLoginEventImpl) then) =
      __$$AuthLoginEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String password, String tenantId});
}

/// @nodoc
class __$$AuthLoginEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLoginEventImpl>
    implements _$$AuthLoginEventImplCopyWith<$Res> {
  __$$AuthLoginEventImplCopyWithImpl(
      _$AuthLoginEventImpl _value, $Res Function(_$AuthLoginEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? password = null,
    Object? tenantId = null,
  }) {
    return _then(_$AuthLoginEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthLoginEventImpl implements AuthLoginEvent {
  const _$AuthLoginEventImpl(
      {required this.userId, required this.password, required this.tenantId});

  @override
  final String userId;
  @override
  final String password;
  @override
  final String tenantId;

  @override
  String toString() {
    return 'AuthEvent.login(userId: $userId, password: $password, tenantId: $tenantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLoginEventImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, password, tenantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthLoginEventImplCopyWith<_$AuthLoginEventImpl> get copyWith =>
      __$$AuthLoginEventImplCopyWithImpl<_$AuthLoginEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String password, String tenantId)
        login,
    required TResult Function(String tenantId) autoLogin,
    required TResult Function() logout,
    required TResult Function(
            String username, String tenantId, String apiEndPoint)
        checkOtherDeviceLogin,
    required TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)
        switchDevice,
    required TResult Function() reset,
    required TResult Function(
            UserActionModel userActionModel, String apiEndPoint)
        switchDeviceUserAction,
  }) {
    return login(userId, password, tenantId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
    TResult? Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult? Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult? Function()? reset,
    TResult? Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
  }) {
    return login?.call(userId, password, tenantId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
    TResult Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult Function()? reset,
    TResult Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(userId, password, tenantId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(AuthAutoLoginEvent value) autoLogin,
    required TResult Function(AuthLogoutEvent value) logout,
    required TResult Function(AuthCheckOtherDeviceLoginEvent value)
        checkOtherDeviceLogin,
    required TResult Function(AuthSwitchDeviceEventSwitchDevice value)
        switchDevice,
    required TResult Function(AuthResetEvent value) reset,
    required TResult Function(AuthSwitchDeviceUserActionEvent value)
        switchDeviceUserAction,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
    TResult? Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult? Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult? Function(AuthResetEvent value)? reset,
    TResult? Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
    TResult Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult Function(AuthResetEvent value)? reset,
    TResult Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class AuthLoginEvent implements AuthEvent {
  const factory AuthLoginEvent(
      {required final String userId,
      required final String password,
      required final String tenantId}) = _$AuthLoginEventImpl;

  String get userId;
  String get password;
  String get tenantId;
  @JsonKey(ignore: true)
  _$$AuthLoginEventImplCopyWith<_$AuthLoginEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthAutoLoginEventImplCopyWith<$Res> {
  factory _$$AuthAutoLoginEventImplCopyWith(_$AuthAutoLoginEventImpl value,
          $Res Function(_$AuthAutoLoginEventImpl) then) =
      __$$AuthAutoLoginEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tenantId});
}

/// @nodoc
class __$$AuthAutoLoginEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthAutoLoginEventImpl>
    implements _$$AuthAutoLoginEventImplCopyWith<$Res> {
  __$$AuthAutoLoginEventImplCopyWithImpl(_$AuthAutoLoginEventImpl _value,
      $Res Function(_$AuthAutoLoginEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
  }) {
    return _then(_$AuthAutoLoginEventImpl(
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthAutoLoginEventImpl implements AuthAutoLoginEvent {
  const _$AuthAutoLoginEventImpl({required this.tenantId});

  @override
  final String tenantId;

  @override
  String toString() {
    return 'AuthEvent.autoLogin(tenantId: $tenantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthAutoLoginEventImpl &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tenantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthAutoLoginEventImplCopyWith<_$AuthAutoLoginEventImpl> get copyWith =>
      __$$AuthAutoLoginEventImplCopyWithImpl<_$AuthAutoLoginEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String password, String tenantId)
        login,
    required TResult Function(String tenantId) autoLogin,
    required TResult Function() logout,
    required TResult Function(
            String username, String tenantId, String apiEndPoint)
        checkOtherDeviceLogin,
    required TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)
        switchDevice,
    required TResult Function() reset,
    required TResult Function(
            UserActionModel userActionModel, String apiEndPoint)
        switchDeviceUserAction,
  }) {
    return autoLogin(tenantId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
    TResult? Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult? Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult? Function()? reset,
    TResult? Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
  }) {
    return autoLogin?.call(tenantId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
    TResult Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult Function()? reset,
    TResult Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
    required TResult orElse(),
  }) {
    if (autoLogin != null) {
      return autoLogin(tenantId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(AuthAutoLoginEvent value) autoLogin,
    required TResult Function(AuthLogoutEvent value) logout,
    required TResult Function(AuthCheckOtherDeviceLoginEvent value)
        checkOtherDeviceLogin,
    required TResult Function(AuthSwitchDeviceEventSwitchDevice value)
        switchDevice,
    required TResult Function(AuthResetEvent value) reset,
    required TResult Function(AuthSwitchDeviceUserActionEvent value)
        switchDeviceUserAction,
  }) {
    return autoLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
    TResult? Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult? Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult? Function(AuthResetEvent value)? reset,
    TResult? Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
  }) {
    return autoLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
    TResult Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult Function(AuthResetEvent value)? reset,
    TResult Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
    required TResult orElse(),
  }) {
    if (autoLogin != null) {
      return autoLogin(this);
    }
    return orElse();
  }
}

abstract class AuthAutoLoginEvent implements AuthEvent {
  const factory AuthAutoLoginEvent({required final String tenantId}) =
      _$AuthAutoLoginEventImpl;

  String get tenantId;
  @JsonKey(ignore: true)
  _$$AuthAutoLoginEventImplCopyWith<_$AuthAutoLoginEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthLogoutEventImplCopyWith<$Res> {
  factory _$$AuthLogoutEventImplCopyWith(_$AuthLogoutEventImpl value,
          $Res Function(_$AuthLogoutEventImpl) then) =
      __$$AuthLogoutEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLogoutEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLogoutEventImpl>
    implements _$$AuthLogoutEventImplCopyWith<$Res> {
  __$$AuthLogoutEventImplCopyWithImpl(
      _$AuthLogoutEventImpl _value, $Res Function(_$AuthLogoutEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLogoutEventImpl implements AuthLogoutEvent {
  const _$AuthLogoutEventImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLogoutEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String password, String tenantId)
        login,
    required TResult Function(String tenantId) autoLogin,
    required TResult Function() logout,
    required TResult Function(
            String username, String tenantId, String apiEndPoint)
        checkOtherDeviceLogin,
    required TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)
        switchDevice,
    required TResult Function() reset,
    required TResult Function(
            UserActionModel userActionModel, String apiEndPoint)
        switchDeviceUserAction,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
    TResult? Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult? Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult? Function()? reset,
    TResult? Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
    TResult Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult Function()? reset,
    TResult Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(AuthAutoLoginEvent value) autoLogin,
    required TResult Function(AuthLogoutEvent value) logout,
    required TResult Function(AuthCheckOtherDeviceLoginEvent value)
        checkOtherDeviceLogin,
    required TResult Function(AuthSwitchDeviceEventSwitchDevice value)
        switchDevice,
    required TResult Function(AuthResetEvent value) reset,
    required TResult Function(AuthSwitchDeviceUserActionEvent value)
        switchDeviceUserAction,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
    TResult? Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult? Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult? Function(AuthResetEvent value)? reset,
    TResult? Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
    TResult Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult Function(AuthResetEvent value)? reset,
    TResult Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class AuthLogoutEvent implements AuthEvent {
  const factory AuthLogoutEvent() = _$AuthLogoutEventImpl;
}

/// @nodoc
abstract class _$$AuthCheckOtherDeviceLoginEventImplCopyWith<$Res> {
  factory _$$AuthCheckOtherDeviceLoginEventImplCopyWith(
          _$AuthCheckOtherDeviceLoginEventImpl value,
          $Res Function(_$AuthCheckOtherDeviceLoginEventImpl) then) =
      __$$AuthCheckOtherDeviceLoginEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username, String tenantId, String apiEndPoint});
}

/// @nodoc
class __$$AuthCheckOtherDeviceLoginEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthCheckOtherDeviceLoginEventImpl>
    implements _$$AuthCheckOtherDeviceLoginEventImplCopyWith<$Res> {
  __$$AuthCheckOtherDeviceLoginEventImplCopyWithImpl(
      _$AuthCheckOtherDeviceLoginEventImpl _value,
      $Res Function(_$AuthCheckOtherDeviceLoginEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? tenantId = null,
    Object? apiEndPoint = null,
  }) {
    return _then(_$AuthCheckOtherDeviceLoginEventImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      apiEndPoint: null == apiEndPoint
          ? _value.apiEndPoint
          : apiEndPoint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthCheckOtherDeviceLoginEventImpl
    implements AuthCheckOtherDeviceLoginEvent {
  const _$AuthCheckOtherDeviceLoginEventImpl(
      {required this.username,
      required this.tenantId,
      required this.apiEndPoint});

  @override
  final String username;
  @override
  final String tenantId;
  @override
  final String apiEndPoint;

  @override
  String toString() {
    return 'AuthEvent.checkOtherDeviceLogin(username: $username, tenantId: $tenantId, apiEndPoint: $apiEndPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthCheckOtherDeviceLoginEventImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.apiEndPoint, apiEndPoint) ||
                other.apiEndPoint == apiEndPoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, tenantId, apiEndPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthCheckOtherDeviceLoginEventImplCopyWith<
          _$AuthCheckOtherDeviceLoginEventImpl>
      get copyWith => __$$AuthCheckOtherDeviceLoginEventImplCopyWithImpl<
          _$AuthCheckOtherDeviceLoginEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String password, String tenantId)
        login,
    required TResult Function(String tenantId) autoLogin,
    required TResult Function() logout,
    required TResult Function(
            String username, String tenantId, String apiEndPoint)
        checkOtherDeviceLogin,
    required TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)
        switchDevice,
    required TResult Function() reset,
    required TResult Function(
            UserActionModel userActionModel, String apiEndPoint)
        switchDeviceUserAction,
  }) {
    return checkOtherDeviceLogin(username, tenantId, apiEndPoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
    TResult? Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult? Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult? Function()? reset,
    TResult? Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
  }) {
    return checkOtherDeviceLogin?.call(username, tenantId, apiEndPoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
    TResult Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult Function()? reset,
    TResult Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
    required TResult orElse(),
  }) {
    if (checkOtherDeviceLogin != null) {
      return checkOtherDeviceLogin(username, tenantId, apiEndPoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(AuthAutoLoginEvent value) autoLogin,
    required TResult Function(AuthLogoutEvent value) logout,
    required TResult Function(AuthCheckOtherDeviceLoginEvent value)
        checkOtherDeviceLogin,
    required TResult Function(AuthSwitchDeviceEventSwitchDevice value)
        switchDevice,
    required TResult Function(AuthResetEvent value) reset,
    required TResult Function(AuthSwitchDeviceUserActionEvent value)
        switchDeviceUserAction,
  }) {
    return checkOtherDeviceLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
    TResult? Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult? Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult? Function(AuthResetEvent value)? reset,
    TResult? Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
  }) {
    return checkOtherDeviceLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
    TResult Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult Function(AuthResetEvent value)? reset,
    TResult Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
    required TResult orElse(),
  }) {
    if (checkOtherDeviceLogin != null) {
      return checkOtherDeviceLogin(this);
    }
    return orElse();
  }
}

abstract class AuthCheckOtherDeviceLoginEvent implements AuthEvent {
  const factory AuthCheckOtherDeviceLoginEvent(
          {required final String username,
          required final String tenantId,
          required final String apiEndPoint}) =
      _$AuthCheckOtherDeviceLoginEventImpl;

  String get username;
  String get tenantId;
  String get apiEndPoint;
  @JsonKey(ignore: true)
  _$$AuthCheckOtherDeviceLoginEventImplCopyWith<
          _$AuthCheckOtherDeviceLoginEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSwitchDeviceEventSwitchDeviceImplCopyWith<$Res> {
  factory _$$AuthSwitchDeviceEventSwitchDeviceImplCopyWith(
          _$AuthSwitchDeviceEventSwitchDeviceImpl value,
          $Res Function(_$AuthSwitchDeviceEventSwitchDeviceImpl) then) =
      __$$AuthSwitchDeviceEventSwitchDeviceImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String selectedReason,
      String? deviceSwitchComment,
      String username,
      String password,
      String tenantId,
      String apiEndPoint});
}

/// @nodoc
class __$$AuthSwitchDeviceEventSwitchDeviceImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res,
        _$AuthSwitchDeviceEventSwitchDeviceImpl>
    implements _$$AuthSwitchDeviceEventSwitchDeviceImplCopyWith<$Res> {
  __$$AuthSwitchDeviceEventSwitchDeviceImplCopyWithImpl(
      _$AuthSwitchDeviceEventSwitchDeviceImpl _value,
      $Res Function(_$AuthSwitchDeviceEventSwitchDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedReason = null,
    Object? deviceSwitchComment = freezed,
    Object? username = null,
    Object? password = null,
    Object? tenantId = null,
    Object? apiEndPoint = null,
  }) {
    return _then(_$AuthSwitchDeviceEventSwitchDeviceImpl(
      selectedReason: null == selectedReason
          ? _value.selectedReason
          : selectedReason // ignore: cast_nullable_to_non_nullable
              as String,
      deviceSwitchComment: freezed == deviceSwitchComment
          ? _value.deviceSwitchComment
          : deviceSwitchComment // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      apiEndPoint: null == apiEndPoint
          ? _value.apiEndPoint
          : apiEndPoint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthSwitchDeviceEventSwitchDeviceImpl
    implements AuthSwitchDeviceEventSwitchDevice {
  const _$AuthSwitchDeviceEventSwitchDeviceImpl(
      {required this.selectedReason,
      required this.deviceSwitchComment,
      required this.username,
      required this.password,
      required this.tenantId,
      required this.apiEndPoint});

  @override
  final String selectedReason;
  @override
  final String? deviceSwitchComment;
  @override
  final String username;
  @override
  final String password;
  @override
  final String tenantId;
  @override
  final String apiEndPoint;

  @override
  String toString() {
    return 'AuthEvent.switchDevice(selectedReason: $selectedReason, deviceSwitchComment: $deviceSwitchComment, username: $username, password: $password, tenantId: $tenantId, apiEndPoint: $apiEndPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSwitchDeviceEventSwitchDeviceImpl &&
            (identical(other.selectedReason, selectedReason) ||
                other.selectedReason == selectedReason) &&
            (identical(other.deviceSwitchComment, deviceSwitchComment) ||
                other.deviceSwitchComment == deviceSwitchComment) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.apiEndPoint, apiEndPoint) ||
                other.apiEndPoint == apiEndPoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedReason,
      deviceSwitchComment, username, password, tenantId, apiEndPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSwitchDeviceEventSwitchDeviceImplCopyWith<
          _$AuthSwitchDeviceEventSwitchDeviceImpl>
      get copyWith => __$$AuthSwitchDeviceEventSwitchDeviceImplCopyWithImpl<
          _$AuthSwitchDeviceEventSwitchDeviceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String password, String tenantId)
        login,
    required TResult Function(String tenantId) autoLogin,
    required TResult Function() logout,
    required TResult Function(
            String username, String tenantId, String apiEndPoint)
        checkOtherDeviceLogin,
    required TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)
        switchDevice,
    required TResult Function() reset,
    required TResult Function(
            UserActionModel userActionModel, String apiEndPoint)
        switchDeviceUserAction,
  }) {
    return switchDevice(selectedReason, deviceSwitchComment, username, password,
        tenantId, apiEndPoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
    TResult? Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult? Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult? Function()? reset,
    TResult? Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
  }) {
    return switchDevice?.call(selectedReason, deviceSwitchComment, username,
        password, tenantId, apiEndPoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
    TResult Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult Function()? reset,
    TResult Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
    required TResult orElse(),
  }) {
    if (switchDevice != null) {
      return switchDevice(selectedReason, deviceSwitchComment, username,
          password, tenantId, apiEndPoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(AuthAutoLoginEvent value) autoLogin,
    required TResult Function(AuthLogoutEvent value) logout,
    required TResult Function(AuthCheckOtherDeviceLoginEvent value)
        checkOtherDeviceLogin,
    required TResult Function(AuthSwitchDeviceEventSwitchDevice value)
        switchDevice,
    required TResult Function(AuthResetEvent value) reset,
    required TResult Function(AuthSwitchDeviceUserActionEvent value)
        switchDeviceUserAction,
  }) {
    return switchDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
    TResult? Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult? Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult? Function(AuthResetEvent value)? reset,
    TResult? Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
  }) {
    return switchDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
    TResult Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult Function(AuthResetEvent value)? reset,
    TResult Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
    required TResult orElse(),
  }) {
    if (switchDevice != null) {
      return switchDevice(this);
    }
    return orElse();
  }
}

abstract class AuthSwitchDeviceEventSwitchDevice implements AuthEvent {
  const factory AuthSwitchDeviceEventSwitchDevice(
          {required final String selectedReason,
          required final String? deviceSwitchComment,
          required final String username,
          required final String password,
          required final String tenantId,
          required final String apiEndPoint}) =
      _$AuthSwitchDeviceEventSwitchDeviceImpl;

  String get selectedReason;
  String? get deviceSwitchComment;
  String get username;
  String get password;
  String get tenantId;
  String get apiEndPoint;
  @JsonKey(ignore: true)
  _$$AuthSwitchDeviceEventSwitchDeviceImplCopyWith<
          _$AuthSwitchDeviceEventSwitchDeviceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthResetEventImplCopyWith<$Res> {
  factory _$$AuthResetEventImplCopyWith(_$AuthResetEventImpl value,
          $Res Function(_$AuthResetEventImpl) then) =
      __$$AuthResetEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthResetEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthResetEventImpl>
    implements _$$AuthResetEventImplCopyWith<$Res> {
  __$$AuthResetEventImplCopyWithImpl(
      _$AuthResetEventImpl _value, $Res Function(_$AuthResetEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthResetEventImpl implements AuthResetEvent {
  const _$AuthResetEventImpl();

  @override
  String toString() {
    return 'AuthEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthResetEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String password, String tenantId)
        login,
    required TResult Function(String tenantId) autoLogin,
    required TResult Function() logout,
    required TResult Function(
            String username, String tenantId, String apiEndPoint)
        checkOtherDeviceLogin,
    required TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)
        switchDevice,
    required TResult Function() reset,
    required TResult Function(
            UserActionModel userActionModel, String apiEndPoint)
        switchDeviceUserAction,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
    TResult? Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult? Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult? Function()? reset,
    TResult? Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
    TResult Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult Function()? reset,
    TResult Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
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
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(AuthAutoLoginEvent value) autoLogin,
    required TResult Function(AuthLogoutEvent value) logout,
    required TResult Function(AuthCheckOtherDeviceLoginEvent value)
        checkOtherDeviceLogin,
    required TResult Function(AuthSwitchDeviceEventSwitchDevice value)
        switchDevice,
    required TResult Function(AuthResetEvent value) reset,
    required TResult Function(AuthSwitchDeviceUserActionEvent value)
        switchDeviceUserAction,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
    TResult? Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult? Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult? Function(AuthResetEvent value)? reset,
    TResult? Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
    TResult Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult Function(AuthResetEvent value)? reset,
    TResult Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class AuthResetEvent implements AuthEvent {
  const factory AuthResetEvent() = _$AuthResetEventImpl;
}

/// @nodoc
abstract class _$$AuthSwitchDeviceUserActionEventImplCopyWith<$Res> {
  factory _$$AuthSwitchDeviceUserActionEventImplCopyWith(
          _$AuthSwitchDeviceUserActionEventImpl value,
          $Res Function(_$AuthSwitchDeviceUserActionEventImpl) then) =
      __$$AuthSwitchDeviceUserActionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserActionModel userActionModel, String apiEndPoint});
}

/// @nodoc
class __$$AuthSwitchDeviceUserActionEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthSwitchDeviceUserActionEventImpl>
    implements _$$AuthSwitchDeviceUserActionEventImplCopyWith<$Res> {
  __$$AuthSwitchDeviceUserActionEventImplCopyWithImpl(
      _$AuthSwitchDeviceUserActionEventImpl _value,
      $Res Function(_$AuthSwitchDeviceUserActionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userActionModel = null,
    Object? apiEndPoint = null,
  }) {
    return _then(_$AuthSwitchDeviceUserActionEventImpl(
      userActionModel: null == userActionModel
          ? _value.userActionModel
          : userActionModel // ignore: cast_nullable_to_non_nullable
              as UserActionModel,
      apiEndPoint: null == apiEndPoint
          ? _value.apiEndPoint
          : apiEndPoint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthSwitchDeviceUserActionEventImpl
    implements AuthSwitchDeviceUserActionEvent {
  const _$AuthSwitchDeviceUserActionEventImpl(
      {required this.userActionModel, required this.apiEndPoint});

  @override
  final UserActionModel userActionModel;
  @override
  final String apiEndPoint;

  @override
  String toString() {
    return 'AuthEvent.switchDeviceUserAction(userActionModel: $userActionModel, apiEndPoint: $apiEndPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSwitchDeviceUserActionEventImpl &&
            (identical(other.userActionModel, userActionModel) ||
                other.userActionModel == userActionModel) &&
            (identical(other.apiEndPoint, apiEndPoint) ||
                other.apiEndPoint == apiEndPoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userActionModel, apiEndPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSwitchDeviceUserActionEventImplCopyWith<
          _$AuthSwitchDeviceUserActionEventImpl>
      get copyWith => __$$AuthSwitchDeviceUserActionEventImplCopyWithImpl<
          _$AuthSwitchDeviceUserActionEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String password, String tenantId)
        login,
    required TResult Function(String tenantId) autoLogin,
    required TResult Function() logout,
    required TResult Function(
            String username, String tenantId, String apiEndPoint)
        checkOtherDeviceLogin,
    required TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)
        switchDevice,
    required TResult Function() reset,
    required TResult Function(
            UserActionModel userActionModel, String apiEndPoint)
        switchDeviceUserAction,
  }) {
    return switchDeviceUserAction(userActionModel, apiEndPoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
    TResult? Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult? Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult? Function()? reset,
    TResult? Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
  }) {
    return switchDeviceUserAction?.call(userActionModel, apiEndPoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
    TResult Function(String username, String tenantId, String apiEndPoint)?
        checkOtherDeviceLogin,
    TResult Function(
            String selectedReason,
            String? deviceSwitchComment,
            String username,
            String password,
            String tenantId,
            String apiEndPoint)?
        switchDevice,
    TResult Function()? reset,
    TResult Function(UserActionModel userActionModel, String apiEndPoint)?
        switchDeviceUserAction,
    required TResult orElse(),
  }) {
    if (switchDeviceUserAction != null) {
      return switchDeviceUserAction(userActionModel, apiEndPoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(AuthAutoLoginEvent value) autoLogin,
    required TResult Function(AuthLogoutEvent value) logout,
    required TResult Function(AuthCheckOtherDeviceLoginEvent value)
        checkOtherDeviceLogin,
    required TResult Function(AuthSwitchDeviceEventSwitchDevice value)
        switchDevice,
    required TResult Function(AuthResetEvent value) reset,
    required TResult Function(AuthSwitchDeviceUserActionEvent value)
        switchDeviceUserAction,
  }) {
    return switchDeviceUserAction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
    TResult? Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult? Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult? Function(AuthResetEvent value)? reset,
    TResult? Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
  }) {
    return switchDeviceUserAction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
    TResult Function(AuthCheckOtherDeviceLoginEvent value)?
        checkOtherDeviceLogin,
    TResult Function(AuthSwitchDeviceEventSwitchDevice value)? switchDevice,
    TResult Function(AuthResetEvent value)? reset,
    TResult Function(AuthSwitchDeviceUserActionEvent value)?
        switchDeviceUserAction,
    required TResult orElse(),
  }) {
    if (switchDeviceUserAction != null) {
      return switchDeviceUserAction(this);
    }
    return orElse();
  }
}

abstract class AuthSwitchDeviceUserActionEvent implements AuthEvent {
  const factory AuthSwitchDeviceUserActionEvent(
          {required final UserActionModel userActionModel,
          required final String apiEndPoint}) =
      _$AuthSwitchDeviceUserActionEventImpl;

  UserActionModel get userActionModel;
  String get apiEndPoint;
  @JsonKey(ignore: true)
  _$$AuthSwitchDeviceUserActionEventImplCopyWith<
          _$AuthSwitchDeviceUserActionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)
        authenticated,
    required TResult Function(String? error) error,
    required TResult Function() otherDevice,
    required TResult Function() allow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)?
        authenticated,
    TResult? Function(String? error)? error,
    TResult? Function()? otherDevice,
    TResult? Function()? allow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)?
        authenticated,
    TResult Function(String? error)? error,
    TResult Function()? otherDevice,
    TResult Function()? allow,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthUnauthenticatedState value) unauthenticated,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthOtherDeviceState value) otherDevice,
    required TResult Function(AuthAllowState value) allow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult? Function(AuthLoadingState value)? loading,
    TResult? Function(AuthAuthenticatedState value)? authenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthOtherDeviceState value)? otherDevice,
    TResult? Function(AuthAllowState value)? allow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthOtherDeviceState value)? otherDevice,
    TResult Function(AuthAllowState value)? allow,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthUnauthenticatedStateImplCopyWith<$Res> {
  factory _$$AuthUnauthenticatedStateImplCopyWith(
          _$AuthUnauthenticatedStateImpl value,
          $Res Function(_$AuthUnauthenticatedStateImpl) then) =
      __$$AuthUnauthenticatedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthUnauthenticatedStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthUnauthenticatedStateImpl>
    implements _$$AuthUnauthenticatedStateImplCopyWith<$Res> {
  __$$AuthUnauthenticatedStateImplCopyWithImpl(
      _$AuthUnauthenticatedStateImpl _value,
      $Res Function(_$AuthUnauthenticatedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthUnauthenticatedStateImpl implements AuthUnauthenticatedState {
  const _$AuthUnauthenticatedStateImpl();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUnauthenticatedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)
        authenticated,
    required TResult Function(String? error) error,
    required TResult Function() otherDevice,
    required TResult Function() allow,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)?
        authenticated,
    TResult? Function(String? error)? error,
    TResult? Function()? otherDevice,
    TResult? Function()? allow,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)?
        authenticated,
    TResult Function(String? error)? error,
    TResult Function()? otherDevice,
    TResult Function()? allow,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthUnauthenticatedState value) unauthenticated,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthOtherDeviceState value) otherDevice,
    required TResult Function(AuthAllowState value) allow,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult? Function(AuthLoadingState value)? loading,
    TResult? Function(AuthAuthenticatedState value)? authenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthOtherDeviceState value)? otherDevice,
    TResult? Function(AuthAllowState value)? allow,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthOtherDeviceState value)? otherDevice,
    TResult Function(AuthAllowState value)? allow,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthUnauthenticatedState implements AuthState {
  const factory AuthUnauthenticatedState() = _$AuthUnauthenticatedStateImpl;
}

/// @nodoc
abstract class _$$AuthLoadingStateImplCopyWith<$Res> {
  factory _$$AuthLoadingStateImplCopyWith(_$AuthLoadingStateImpl value,
          $Res Function(_$AuthLoadingStateImpl) then) =
      __$$AuthLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoadingStateImpl>
    implements _$$AuthLoadingStateImplCopyWith<$Res> {
  __$$AuthLoadingStateImplCopyWithImpl(_$AuthLoadingStateImpl _value,
      $Res Function(_$AuthLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLoadingStateImpl implements AuthLoadingState {
  const _$AuthLoadingStateImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)
        authenticated,
    required TResult Function(String? error) error,
    required TResult Function() otherDevice,
    required TResult Function() allow,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)?
        authenticated,
    TResult? Function(String? error)? error,
    TResult? Function()? otherDevice,
    TResult? Function()? allow,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)?
        authenticated,
    TResult Function(String? error)? error,
    TResult Function()? otherDevice,
    TResult Function()? allow,
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
    required TResult Function(AuthUnauthenticatedState value) unauthenticated,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthOtherDeviceState value) otherDevice,
    required TResult Function(AuthAllowState value) allow,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult? Function(AuthLoadingState value)? loading,
    TResult? Function(AuthAuthenticatedState value)? authenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthOtherDeviceState value)? otherDevice,
    TResult? Function(AuthAllowState value)? allow,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthOtherDeviceState value)? otherDevice,
    TResult Function(AuthAllowState value)? allow,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoadingState implements AuthState {
  const factory AuthLoadingState() = _$AuthLoadingStateImpl;
}

/// @nodoc
abstract class _$$AuthAuthenticatedStateImplCopyWith<$Res> {
  factory _$$AuthAuthenticatedStateImplCopyWith(
          _$AuthAuthenticatedStateImpl value,
          $Res Function(_$AuthAuthenticatedStateImpl) then) =
      __$$AuthAuthenticatedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      UserRequestModel userModel,
      RoleActionsWrapperModel actionsWrapper,
      String? individualId});

  $UserRequestModelCopyWith<$Res> get userModel;
  $RoleActionsWrapperModelCopyWith<$Res> get actionsWrapper;
}

/// @nodoc
class __$$AuthAuthenticatedStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthAuthenticatedStateImpl>
    implements _$$AuthAuthenticatedStateImplCopyWith<$Res> {
  __$$AuthAuthenticatedStateImplCopyWithImpl(
      _$AuthAuthenticatedStateImpl _value,
      $Res Function(_$AuthAuthenticatedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? userModel = null,
    Object? actionsWrapper = null,
    Object? individualId = freezed,
  }) {
    return _then(_$AuthAuthenticatedStateImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserRequestModel,
      actionsWrapper: null == actionsWrapper
          ? _value.actionsWrapper
          : actionsWrapper // ignore: cast_nullable_to_non_nullable
              as RoleActionsWrapperModel,
      individualId: freezed == individualId
          ? _value.individualId
          : individualId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserRequestModelCopyWith<$Res> get userModel {
    return $UserRequestModelCopyWith<$Res>(_value.userModel, (value) {
      return _then(_value.copyWith(userModel: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RoleActionsWrapperModelCopyWith<$Res> get actionsWrapper {
    return $RoleActionsWrapperModelCopyWith<$Res>(_value.actionsWrapper,
        (value) {
      return _then(_value.copyWith(actionsWrapper: value));
    });
  }
}

/// @nodoc

class _$AuthAuthenticatedStateImpl implements AuthAuthenticatedState {
  const _$AuthAuthenticatedStateImpl(
      {required this.accessToken,
      required this.refreshToken,
      required this.userModel,
      required this.actionsWrapper,
      this.individualId});

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final UserRequestModel userModel;
  @override
  final RoleActionsWrapperModel actionsWrapper;
  @override
  final String? individualId;

  @override
  String toString() {
    return 'AuthState.authenticated(accessToken: $accessToken, refreshToken: $refreshToken, userModel: $userModel, actionsWrapper: $actionsWrapper, individualId: $individualId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthAuthenticatedStateImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.actionsWrapper, actionsWrapper) ||
                other.actionsWrapper == actionsWrapper) &&
            (identical(other.individualId, individualId) ||
                other.individualId == individualId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken,
      userModel, actionsWrapper, individualId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthAuthenticatedStateImplCopyWith<_$AuthAuthenticatedStateImpl>
      get copyWith => __$$AuthAuthenticatedStateImplCopyWithImpl<
          _$AuthAuthenticatedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)
        authenticated,
    required TResult Function(String? error) error,
    required TResult Function() otherDevice,
    required TResult Function() allow,
  }) {
    return authenticated(
        accessToken, refreshToken, userModel, actionsWrapper, individualId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)?
        authenticated,
    TResult? Function(String? error)? error,
    TResult? Function()? otherDevice,
    TResult? Function()? allow,
  }) {
    return authenticated?.call(
        accessToken, refreshToken, userModel, actionsWrapper, individualId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)?
        authenticated,
    TResult Function(String? error)? error,
    TResult Function()? otherDevice,
    TResult Function()? allow,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(
          accessToken, refreshToken, userModel, actionsWrapper, individualId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthUnauthenticatedState value) unauthenticated,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthOtherDeviceState value) otherDevice,
    required TResult Function(AuthAllowState value) allow,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult? Function(AuthLoadingState value)? loading,
    TResult? Function(AuthAuthenticatedState value)? authenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthOtherDeviceState value)? otherDevice,
    TResult? Function(AuthAllowState value)? allow,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthOtherDeviceState value)? otherDevice,
    TResult Function(AuthAllowState value)? allow,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthAuthenticatedState implements AuthState {
  const factory AuthAuthenticatedState(
      {required final String accessToken,
      required final String refreshToken,
      required final UserRequestModel userModel,
      required final RoleActionsWrapperModel actionsWrapper,
      final String? individualId}) = _$AuthAuthenticatedStateImpl;

  String get accessToken;
  String get refreshToken;
  UserRequestModel get userModel;
  RoleActionsWrapperModel get actionsWrapper;
  String? get individualId;
  @JsonKey(ignore: true)
  _$$AuthAuthenticatedStateImplCopyWith<_$AuthAuthenticatedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthErrorStateImplCopyWith<$Res> {
  factory _$$AuthErrorStateImplCopyWith(_$AuthErrorStateImpl value,
          $Res Function(_$AuthErrorStateImpl) then) =
      __$$AuthErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$AuthErrorStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthErrorStateImpl>
    implements _$$AuthErrorStateImplCopyWith<$Res> {
  __$$AuthErrorStateImplCopyWithImpl(
      _$AuthErrorStateImpl _value, $Res Function(_$AuthErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$AuthErrorStateImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthErrorStateImpl implements AuthErrorState {
  const _$AuthErrorStateImpl([this.error]);

  @override
  final String? error;

  @override
  String toString() {
    return 'AuthState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorStateImplCopyWith<_$AuthErrorStateImpl> get copyWith =>
      __$$AuthErrorStateImplCopyWithImpl<_$AuthErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)
        authenticated,
    required TResult Function(String? error) error,
    required TResult Function() otherDevice,
    required TResult Function() allow,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)?
        authenticated,
    TResult? Function(String? error)? error,
    TResult? Function()? otherDevice,
    TResult? Function()? allow,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)?
        authenticated,
    TResult Function(String? error)? error,
    TResult Function()? otherDevice,
    TResult Function()? allow,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthUnauthenticatedState value) unauthenticated,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthOtherDeviceState value) otherDevice,
    required TResult Function(AuthAllowState value) allow,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult? Function(AuthLoadingState value)? loading,
    TResult? Function(AuthAuthenticatedState value)? authenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthOtherDeviceState value)? otherDevice,
    TResult? Function(AuthAllowState value)? allow,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthOtherDeviceState value)? otherDevice,
    TResult Function(AuthAllowState value)? allow,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthErrorState implements AuthState {
  const factory AuthErrorState([final String? error]) = _$AuthErrorStateImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$AuthErrorStateImplCopyWith<_$AuthErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthOtherDeviceStateImplCopyWith<$Res> {
  factory _$$AuthOtherDeviceStateImplCopyWith(_$AuthOtherDeviceStateImpl value,
          $Res Function(_$AuthOtherDeviceStateImpl) then) =
      __$$AuthOtherDeviceStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthOtherDeviceStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthOtherDeviceStateImpl>
    implements _$$AuthOtherDeviceStateImplCopyWith<$Res> {
  __$$AuthOtherDeviceStateImplCopyWithImpl(_$AuthOtherDeviceStateImpl _value,
      $Res Function(_$AuthOtherDeviceStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthOtherDeviceStateImpl implements AuthOtherDeviceState {
  const _$AuthOtherDeviceStateImpl();

  @override
  String toString() {
    return 'AuthState.otherDevice()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthOtherDeviceStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)
        authenticated,
    required TResult Function(String? error) error,
    required TResult Function() otherDevice,
    required TResult Function() allow,
  }) {
    return otherDevice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)?
        authenticated,
    TResult? Function(String? error)? error,
    TResult? Function()? otherDevice,
    TResult? Function()? allow,
  }) {
    return otherDevice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)?
        authenticated,
    TResult Function(String? error)? error,
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
    required TResult Function(AuthUnauthenticatedState value) unauthenticated,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthOtherDeviceState value) otherDevice,
    required TResult Function(AuthAllowState value) allow,
  }) {
    return otherDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult? Function(AuthLoadingState value)? loading,
    TResult? Function(AuthAuthenticatedState value)? authenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthOtherDeviceState value)? otherDevice,
    TResult? Function(AuthAllowState value)? allow,
  }) {
    return otherDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthOtherDeviceState value)? otherDevice,
    TResult Function(AuthAllowState value)? allow,
    required TResult orElse(),
  }) {
    if (otherDevice != null) {
      return otherDevice(this);
    }
    return orElse();
  }
}

abstract class AuthOtherDeviceState implements AuthState {
  const factory AuthOtherDeviceState() = _$AuthOtherDeviceStateImpl;
}

/// @nodoc
abstract class _$$AuthAllowStateImplCopyWith<$Res> {
  factory _$$AuthAllowStateImplCopyWith(_$AuthAllowStateImpl value,
          $Res Function(_$AuthAllowStateImpl) then) =
      __$$AuthAllowStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthAllowStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthAllowStateImpl>
    implements _$$AuthAllowStateImplCopyWith<$Res> {
  __$$AuthAllowStateImplCopyWithImpl(
      _$AuthAllowStateImpl _value, $Res Function(_$AuthAllowStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthAllowStateImpl implements AuthAllowState {
  const _$AuthAllowStateImpl();

  @override
  String toString() {
    return 'AuthState.allow()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthAllowStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)
        authenticated,
    required TResult Function(String? error) error,
    required TResult Function() otherDevice,
    required TResult Function() allow,
  }) {
    return allow();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)?
        authenticated,
    TResult? Function(String? error)? error,
    TResult? Function()? otherDevice,
    TResult? Function()? allow,
  }) {
    return allow?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(
            String accessToken,
            String refreshToken,
            UserRequestModel userModel,
            RoleActionsWrapperModel actionsWrapper,
            String? individualId)?
        authenticated,
    TResult Function(String? error)? error,
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
    required TResult Function(AuthUnauthenticatedState value) unauthenticated,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthErrorState value) error,
    required TResult Function(AuthOtherDeviceState value) otherDevice,
    required TResult Function(AuthAllowState value) allow,
  }) {
    return allow(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult? Function(AuthLoadingState value)? loading,
    TResult? Function(AuthAuthenticatedState value)? authenticated,
    TResult? Function(AuthErrorState value)? error,
    TResult? Function(AuthOtherDeviceState value)? otherDevice,
    TResult? Function(AuthAllowState value)? allow,
  }) {
    return allow?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthErrorState value)? error,
    TResult Function(AuthOtherDeviceState value)? otherDevice,
    TResult Function(AuthAllowState value)? allow,
    required TResult orElse(),
  }) {
    if (allow != null) {
      return allow(this);
    }
    return orElse();
  }
}

abstract class AuthAllowState implements AuthState {
  const factory AuthAllowState() = _$AuthAllowStateImpl;
}

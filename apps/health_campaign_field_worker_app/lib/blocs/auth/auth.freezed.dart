// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String password, String tenantId)
        login,
    required TResult Function(String tenantId) autoLogin,
    required TResult Function() logout,
    required TResult Function() logoutWithoutAuthToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
    TResult? Function()? logoutWithoutAuthToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
    TResult Function()? logoutWithoutAuthToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(AuthAutoLoginEvent value) autoLogin,
    required TResult Function(AuthLogoutEvent value) logout,
    required TResult Function(AuthLogoutWithoutTokenEvent value)
        logoutWithoutAuthToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
    TResult? Function(AuthLogoutWithoutTokenEvent value)?
        logoutWithoutAuthToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
    TResult Function(AuthLogoutWithoutTokenEvent value)? logoutWithoutAuthToken,
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
abstract class _$$AuthLoginEventCopyWith<$Res> {
  factory _$$AuthLoginEventCopyWith(
          _$AuthLoginEvent value, $Res Function(_$AuthLoginEvent) then) =
      __$$AuthLoginEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String password, String tenantId});
}

/// @nodoc
class __$$AuthLoginEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLoginEvent>
    implements _$$AuthLoginEventCopyWith<$Res> {
  __$$AuthLoginEventCopyWithImpl(
      _$AuthLoginEvent _value, $Res Function(_$AuthLoginEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? password = null,
    Object? tenantId = null,
  }) {
    return _then(_$AuthLoginEvent(
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

class _$AuthLoginEvent implements AuthLoginEvent {
  const _$AuthLoginEvent(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLoginEvent &&
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
  _$$AuthLoginEventCopyWith<_$AuthLoginEvent> get copyWith =>
      __$$AuthLoginEventCopyWithImpl<_$AuthLoginEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String password, String tenantId)
        login,
    required TResult Function(String tenantId) autoLogin,
    required TResult Function() logout,
    required TResult Function() logoutWithoutAuthToken,
  }) {
    return login(userId, password, tenantId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
    TResult? Function()? logoutWithoutAuthToken,
  }) {
    return login?.call(userId, password, tenantId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
    TResult Function()? logoutWithoutAuthToken,
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
    required TResult Function(AuthLogoutWithoutTokenEvent value)
        logoutWithoutAuthToken,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
    TResult? Function(AuthLogoutWithoutTokenEvent value)?
        logoutWithoutAuthToken,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
    TResult Function(AuthLogoutWithoutTokenEvent value)? logoutWithoutAuthToken,
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
      required final String tenantId}) = _$AuthLoginEvent;

  String get userId;
  String get password;
  String get tenantId;
  @JsonKey(ignore: true)
  _$$AuthLoginEventCopyWith<_$AuthLoginEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthAutoLoginEventCopyWith<$Res> {
  factory _$$AuthAutoLoginEventCopyWith(_$AuthAutoLoginEvent value,
          $Res Function(_$AuthAutoLoginEvent) then) =
      __$$AuthAutoLoginEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String tenantId});
}

/// @nodoc
class __$$AuthAutoLoginEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthAutoLoginEvent>
    implements _$$AuthAutoLoginEventCopyWith<$Res> {
  __$$AuthAutoLoginEventCopyWithImpl(
      _$AuthAutoLoginEvent _value, $Res Function(_$AuthAutoLoginEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
  }) {
    return _then(_$AuthAutoLoginEvent(
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthAutoLoginEvent implements AuthAutoLoginEvent {
  const _$AuthAutoLoginEvent({required this.tenantId});

  @override
  final String tenantId;

  @override
  String toString() {
    return 'AuthEvent.autoLogin(tenantId: $tenantId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthAutoLoginEvent &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tenantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthAutoLoginEventCopyWith<_$AuthAutoLoginEvent> get copyWith =>
      __$$AuthAutoLoginEventCopyWithImpl<_$AuthAutoLoginEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String password, String tenantId)
        login,
    required TResult Function(String tenantId) autoLogin,
    required TResult Function() logout,
    required TResult Function() logoutWithoutAuthToken,
  }) {
    return autoLogin(tenantId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
    TResult? Function()? logoutWithoutAuthToken,
  }) {
    return autoLogin?.call(tenantId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
    TResult Function()? logoutWithoutAuthToken,
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
    required TResult Function(AuthLogoutWithoutTokenEvent value)
        logoutWithoutAuthToken,
  }) {
    return autoLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
    TResult? Function(AuthLogoutWithoutTokenEvent value)?
        logoutWithoutAuthToken,
  }) {
    return autoLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
    TResult Function(AuthLogoutWithoutTokenEvent value)? logoutWithoutAuthToken,
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
      _$AuthAutoLoginEvent;

  String get tenantId;
  @JsonKey(ignore: true)
  _$$AuthAutoLoginEventCopyWith<_$AuthAutoLoginEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthLogoutEventCopyWith<$Res> {
  factory _$$AuthLogoutEventCopyWith(
          _$AuthLogoutEvent value, $Res Function(_$AuthLogoutEvent) then) =
      __$$AuthLogoutEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLogoutEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLogoutEvent>
    implements _$$AuthLogoutEventCopyWith<$Res> {
  __$$AuthLogoutEventCopyWithImpl(
      _$AuthLogoutEvent _value, $Res Function(_$AuthLogoutEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLogoutEvent implements AuthLogoutEvent {
  const _$AuthLogoutEvent();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLogoutEvent);
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
    required TResult Function() logoutWithoutAuthToken,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
    TResult? Function()? logoutWithoutAuthToken,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
    TResult Function()? logoutWithoutAuthToken,
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
    required TResult Function(AuthLogoutWithoutTokenEvent value)
        logoutWithoutAuthToken,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
    TResult? Function(AuthLogoutWithoutTokenEvent value)?
        logoutWithoutAuthToken,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
    TResult Function(AuthLogoutWithoutTokenEvent value)? logoutWithoutAuthToken,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class AuthLogoutEvent implements AuthEvent {
  const factory AuthLogoutEvent() = _$AuthLogoutEvent;
}

/// @nodoc
abstract class _$$AuthLogoutWithoutTokenEventCopyWith<$Res> {
  factory _$$AuthLogoutWithoutTokenEventCopyWith(
          _$AuthLogoutWithoutTokenEvent value,
          $Res Function(_$AuthLogoutWithoutTokenEvent) then) =
      __$$AuthLogoutWithoutTokenEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLogoutWithoutTokenEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLogoutWithoutTokenEvent>
    implements _$$AuthLogoutWithoutTokenEventCopyWith<$Res> {
  __$$AuthLogoutWithoutTokenEventCopyWithImpl(
      _$AuthLogoutWithoutTokenEvent _value,
      $Res Function(_$AuthLogoutWithoutTokenEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLogoutWithoutTokenEvent implements AuthLogoutWithoutTokenEvent {
  const _$AuthLogoutWithoutTokenEvent();

  @override
  String toString() {
    return 'AuthEvent.logoutWithoutAuthToken()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLogoutWithoutTokenEvent);
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
    required TResult Function() logoutWithoutAuthToken,
  }) {
    return logoutWithoutAuthToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
    TResult? Function()? logoutWithoutAuthToken,
  }) {
    return logoutWithoutAuthToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
    TResult Function()? logoutWithoutAuthToken,
    required TResult orElse(),
  }) {
    if (logoutWithoutAuthToken != null) {
      return logoutWithoutAuthToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(AuthAutoLoginEvent value) autoLogin,
    required TResult Function(AuthLogoutEvent value) logout,
    required TResult Function(AuthLogoutWithoutTokenEvent value)
        logoutWithoutAuthToken,
  }) {
    return logoutWithoutAuthToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
    TResult? Function(AuthLogoutWithoutTokenEvent value)?
        logoutWithoutAuthToken,
  }) {
    return logoutWithoutAuthToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
    TResult Function(AuthLogoutWithoutTokenEvent value)? logoutWithoutAuthToken,
    required TResult orElse(),
  }) {
    if (logoutWithoutAuthToken != null) {
      return logoutWithoutAuthToken(this);
    }
    return orElse();
  }
}

abstract class AuthLogoutWithoutTokenEvent implements AuthEvent {
  const factory AuthLogoutWithoutTokenEvent() = _$AuthLogoutWithoutTokenEvent;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken,
            UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper)
        authenticated,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken,
            UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper)?
        authenticated,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken,
            UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper)?
        authenticated,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthUnauthenticatedState value) unauthenticated,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthAuthenticatedState value) authenticated,
    required TResult Function(AuthErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult? Function(AuthLoadingState value)? loading,
    TResult? Function(AuthAuthenticatedState value)? authenticated,
    TResult? Function(AuthErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthUnauthenticatedState value)? unauthenticated,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthAuthenticatedState value)? authenticated,
    TResult Function(AuthErrorState value)? error,
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
abstract class _$$AuthUnauthenticatedStateCopyWith<$Res> {
  factory _$$AuthUnauthenticatedStateCopyWith(_$AuthUnauthenticatedState value,
          $Res Function(_$AuthUnauthenticatedState) then) =
      __$$AuthUnauthenticatedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthUnauthenticatedStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthUnauthenticatedState>
    implements _$$AuthUnauthenticatedStateCopyWith<$Res> {
  __$$AuthUnauthenticatedStateCopyWithImpl(_$AuthUnauthenticatedState _value,
      $Res Function(_$AuthUnauthenticatedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthUnauthenticatedState implements AuthUnauthenticatedState {
  const _$AuthUnauthenticatedState();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUnauthenticatedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken,
            UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper)
        authenticated,
    required TResult Function(String? error) error,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken,
            UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper)?
        authenticated,
    TResult? Function(String? error)? error,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken,
            UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper)?
        authenticated,
    TResult Function(String? error)? error,
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
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthUnauthenticatedState implements AuthState {
  const factory AuthUnauthenticatedState() = _$AuthUnauthenticatedState;
}

/// @nodoc
abstract class _$$AuthLoadingStateCopyWith<$Res> {
  factory _$$AuthLoadingStateCopyWith(
          _$AuthLoadingState value, $Res Function(_$AuthLoadingState) then) =
      __$$AuthLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoadingState>
    implements _$$AuthLoadingStateCopyWith<$Res> {
  __$$AuthLoadingStateCopyWithImpl(
      _$AuthLoadingState _value, $Res Function(_$AuthLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLoadingState implements AuthLoadingState {
  const _$AuthLoadingState();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken,
            UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper)
        authenticated,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken,
            UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper)?
        authenticated,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken,
            UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper)?
        authenticated,
    TResult Function(String? error)? error,
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
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoadingState implements AuthState {
  const factory AuthLoadingState() = _$AuthLoadingState;
}

/// @nodoc
abstract class _$$AuthAuthenticatedStateCopyWith<$Res> {
  factory _$$AuthAuthenticatedStateCopyWith(_$AuthAuthenticatedState value,
          $Res Function(_$AuthAuthenticatedState) then) =
      __$$AuthAuthenticatedStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      UserRequestModel userModel,
      RoleActionsWrapperModel actionsWrapper});

  $UserRequestModelCopyWith<$Res> get userModel;
  $RoleActionsWrapperModelCopyWith<$Res> get actionsWrapper;
}

/// @nodoc
class __$$AuthAuthenticatedStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthAuthenticatedState>
    implements _$$AuthAuthenticatedStateCopyWith<$Res> {
  __$$AuthAuthenticatedStateCopyWithImpl(_$AuthAuthenticatedState _value,
      $Res Function(_$AuthAuthenticatedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? userModel = null,
    Object? actionsWrapper = null,
  }) {
    return _then(_$AuthAuthenticatedState(
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

class _$AuthAuthenticatedState implements AuthAuthenticatedState {
  const _$AuthAuthenticatedState(
      {required this.accessToken,
      required this.refreshToken,
      required this.userModel,
      required this.actionsWrapper});

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final UserRequestModel userModel;
  @override
  final RoleActionsWrapperModel actionsWrapper;

  @override
  String toString() {
    return 'AuthState.authenticated(accessToken: $accessToken, refreshToken: $refreshToken, userModel: $userModel, actionsWrapper: $actionsWrapper)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthAuthenticatedState &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.actionsWrapper, actionsWrapper) ||
                other.actionsWrapper == actionsWrapper));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, accessToken, refreshToken, userModel, actionsWrapper);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthAuthenticatedStateCopyWith<_$AuthAuthenticatedState> get copyWith =>
      __$$AuthAuthenticatedStateCopyWithImpl<_$AuthAuthenticatedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken,
            UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper)
        authenticated,
    required TResult Function(String? error) error,
  }) {
    return authenticated(accessToken, refreshToken, userModel, actionsWrapper);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken,
            UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper)?
        authenticated,
    TResult? Function(String? error)? error,
  }) {
    return authenticated?.call(
        accessToken, refreshToken, userModel, actionsWrapper);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken,
            UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper)?
        authenticated,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(
          accessToken, refreshToken, userModel, actionsWrapper);
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
          required final RoleActionsWrapperModel actionsWrapper}) =
      _$AuthAuthenticatedState;

  String get accessToken;
  String get refreshToken;
  UserRequestModel get userModel;
  RoleActionsWrapperModel get actionsWrapper;
  @JsonKey(ignore: true)
  _$$AuthAuthenticatedStateCopyWith<_$AuthAuthenticatedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthErrorStateCopyWith<$Res> {
  factory _$$AuthErrorStateCopyWith(
          _$AuthErrorState value, $Res Function(_$AuthErrorState) then) =
      __$$AuthErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$AuthErrorStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthErrorState>
    implements _$$AuthErrorStateCopyWith<$Res> {
  __$$AuthErrorStateCopyWithImpl(
      _$AuthErrorState _value, $Res Function(_$AuthErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$AuthErrorState(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthErrorState implements AuthErrorState {
  const _$AuthErrorState([this.error]);

  @override
  final String? error;

  @override
  String toString() {
    return 'AuthState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorStateCopyWith<_$AuthErrorState> get copyWith =>
      __$$AuthErrorStateCopyWithImpl<_$AuthErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(String accessToken, String refreshToken,
            UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper)
        authenticated,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String accessToken, String refreshToken,
            UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper)?
        authenticated,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(String accessToken, String refreshToken,
            UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper)?
        authenticated,
    TResult Function(String? error)? error,
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
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthErrorState implements AuthState {
  const factory AuthErrorState([final String? error]) = _$AuthErrorState;

  String? get error;
  @JsonKey(ignore: true)
  _$$AuthErrorStateCopyWith<_$AuthErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

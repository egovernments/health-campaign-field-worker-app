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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLoginEvent value) login,
    required TResult Function(AuthAutoLoginEvent value) autoLogin,
    required TResult Function(AuthLogoutEvent value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
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
  }) {
    return login(userId, password, tenantId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
  }) {
    return login?.call(userId, password, tenantId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
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
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
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
  }) {
    return autoLogin(tenantId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
  }) {
    return autoLogin?.call(tenantId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
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
  }) {
    return autoLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
  }) {
    return autoLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
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
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, String password, String tenantId)? login,
    TResult? Function(String tenantId)? autoLogin,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String password, String tenantId)? login,
    TResult Function(String tenantId)? autoLogin,
    TResult Function()? logout,
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
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginEvent value)? login,
    TResult? Function(AuthAutoLoginEvent value)? autoLogin,
    TResult? Function(AuthLogoutEvent value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginEvent value)? login,
    TResult Function(AuthAutoLoginEvent value)? autoLogin,
    TResult Function(AuthLogoutEvent value)? logout,
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
  const factory AuthErrorState([final String? error]) = _$AuthErrorStateImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$AuthErrorStateImplCopyWith<_$AuthErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

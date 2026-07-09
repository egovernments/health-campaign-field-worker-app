// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthLoginEvent value)?  login,TResult Function( AuthAutoLoginEvent value)?  autoLogin,TResult Function( AuthLogoutEvent value)?  logout,TResult Function( AuthCheckOtherDeviceLoginEvent value)?  checkOtherDeviceLogin,TResult Function( AuthSwitchDeviceEventSwitchDevice value)?  switchDevice,TResult Function( AuthResetEvent value)?  reset,TResult Function( AuthAllowEvent value)?  allow,TResult Function( AuthSwitchDeviceUserActionEvent value)?  switchDeviceUserAction,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthLoginEvent() when login != null:
return login(_that);case AuthAutoLoginEvent() when autoLogin != null:
return autoLogin(_that);case AuthLogoutEvent() when logout != null:
return logout(_that);case AuthCheckOtherDeviceLoginEvent() when checkOtherDeviceLogin != null:
return checkOtherDeviceLogin(_that);case AuthSwitchDeviceEventSwitchDevice() when switchDevice != null:
return switchDevice(_that);case AuthResetEvent() when reset != null:
return reset(_that);case AuthAllowEvent() when allow != null:
return allow(_that);case AuthSwitchDeviceUserActionEvent() when switchDeviceUserAction != null:
return switchDeviceUserAction(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthLoginEvent value)  login,required TResult Function( AuthAutoLoginEvent value)  autoLogin,required TResult Function( AuthLogoutEvent value)  logout,required TResult Function( AuthCheckOtherDeviceLoginEvent value)  checkOtherDeviceLogin,required TResult Function( AuthSwitchDeviceEventSwitchDevice value)  switchDevice,required TResult Function( AuthResetEvent value)  reset,required TResult Function( AuthAllowEvent value)  allow,required TResult Function( AuthSwitchDeviceUserActionEvent value)  switchDeviceUserAction,}){
final _that = this;
switch (_that) {
case AuthLoginEvent():
return login(_that);case AuthAutoLoginEvent():
return autoLogin(_that);case AuthLogoutEvent():
return logout(_that);case AuthCheckOtherDeviceLoginEvent():
return checkOtherDeviceLogin(_that);case AuthSwitchDeviceEventSwitchDevice():
return switchDevice(_that);case AuthResetEvent():
return reset(_that);case AuthAllowEvent():
return allow(_that);case AuthSwitchDeviceUserActionEvent():
return switchDeviceUserAction(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthLoginEvent value)?  login,TResult? Function( AuthAutoLoginEvent value)?  autoLogin,TResult? Function( AuthLogoutEvent value)?  logout,TResult? Function( AuthCheckOtherDeviceLoginEvent value)?  checkOtherDeviceLogin,TResult? Function( AuthSwitchDeviceEventSwitchDevice value)?  switchDevice,TResult? Function( AuthResetEvent value)?  reset,TResult? Function( AuthAllowEvent value)?  allow,TResult? Function( AuthSwitchDeviceUserActionEvent value)?  switchDeviceUserAction,}){
final _that = this;
switch (_that) {
case AuthLoginEvent() when login != null:
return login(_that);case AuthAutoLoginEvent() when autoLogin != null:
return autoLogin(_that);case AuthLogoutEvent() when logout != null:
return logout(_that);case AuthCheckOtherDeviceLoginEvent() when checkOtherDeviceLogin != null:
return checkOtherDeviceLogin(_that);case AuthSwitchDeviceEventSwitchDevice() when switchDevice != null:
return switchDevice(_that);case AuthResetEvent() when reset != null:
return reset(_that);case AuthAllowEvent() when allow != null:
return allow(_that);case AuthSwitchDeviceUserActionEvent() when switchDeviceUserAction != null:
return switchDeviceUserAction(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId,  String password,  String tenantId)?  login,TResult Function( String tenantId)?  autoLogin,TResult Function()?  logout,TResult Function( String username,  String tenantId,  String apiEndPoint)?  checkOtherDeviceLogin,TResult Function( String selectedReason,  String? deviceSwitchComment,  String username,  String password,  String tenantId,  String apiEndPoint)?  switchDevice,TResult Function()?  reset,TResult Function()?  allow,TResult Function( UserActionModel userActionModel,  String apiEndPoint)?  switchDeviceUserAction,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthLoginEvent() when login != null:
return login(_that.userId,_that.password,_that.tenantId);case AuthAutoLoginEvent() when autoLogin != null:
return autoLogin(_that.tenantId);case AuthLogoutEvent() when logout != null:
return logout();case AuthCheckOtherDeviceLoginEvent() when checkOtherDeviceLogin != null:
return checkOtherDeviceLogin(_that.username,_that.tenantId,_that.apiEndPoint);case AuthSwitchDeviceEventSwitchDevice() when switchDevice != null:
return switchDevice(_that.selectedReason,_that.deviceSwitchComment,_that.username,_that.password,_that.tenantId,_that.apiEndPoint);case AuthResetEvent() when reset != null:
return reset();case AuthAllowEvent() when allow != null:
return allow();case AuthSwitchDeviceUserActionEvent() when switchDeviceUserAction != null:
return switchDeviceUserAction(_that.userActionModel,_that.apiEndPoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId,  String password,  String tenantId)  login,required TResult Function( String tenantId)  autoLogin,required TResult Function()  logout,required TResult Function( String username,  String tenantId,  String apiEndPoint)  checkOtherDeviceLogin,required TResult Function( String selectedReason,  String? deviceSwitchComment,  String username,  String password,  String tenantId,  String apiEndPoint)  switchDevice,required TResult Function()  reset,required TResult Function()  allow,required TResult Function( UserActionModel userActionModel,  String apiEndPoint)  switchDeviceUserAction,}) {final _that = this;
switch (_that) {
case AuthLoginEvent():
return login(_that.userId,_that.password,_that.tenantId);case AuthAutoLoginEvent():
return autoLogin(_that.tenantId);case AuthLogoutEvent():
return logout();case AuthCheckOtherDeviceLoginEvent():
return checkOtherDeviceLogin(_that.username,_that.tenantId,_that.apiEndPoint);case AuthSwitchDeviceEventSwitchDevice():
return switchDevice(_that.selectedReason,_that.deviceSwitchComment,_that.username,_that.password,_that.tenantId,_that.apiEndPoint);case AuthResetEvent():
return reset();case AuthAllowEvent():
return allow();case AuthSwitchDeviceUserActionEvent():
return switchDeviceUserAction(_that.userActionModel,_that.apiEndPoint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId,  String password,  String tenantId)?  login,TResult? Function( String tenantId)?  autoLogin,TResult? Function()?  logout,TResult? Function( String username,  String tenantId,  String apiEndPoint)?  checkOtherDeviceLogin,TResult? Function( String selectedReason,  String? deviceSwitchComment,  String username,  String password,  String tenantId,  String apiEndPoint)?  switchDevice,TResult? Function()?  reset,TResult? Function()?  allow,TResult? Function( UserActionModel userActionModel,  String apiEndPoint)?  switchDeviceUserAction,}) {final _that = this;
switch (_that) {
case AuthLoginEvent() when login != null:
return login(_that.userId,_that.password,_that.tenantId);case AuthAutoLoginEvent() when autoLogin != null:
return autoLogin(_that.tenantId);case AuthLogoutEvent() when logout != null:
return logout();case AuthCheckOtherDeviceLoginEvent() when checkOtherDeviceLogin != null:
return checkOtherDeviceLogin(_that.username,_that.tenantId,_that.apiEndPoint);case AuthSwitchDeviceEventSwitchDevice() when switchDevice != null:
return switchDevice(_that.selectedReason,_that.deviceSwitchComment,_that.username,_that.password,_that.tenantId,_that.apiEndPoint);case AuthResetEvent() when reset != null:
return reset();case AuthAllowEvent() when allow != null:
return allow();case AuthSwitchDeviceUserActionEvent() when switchDeviceUserAction != null:
return switchDeviceUserAction(_that.userActionModel,_that.apiEndPoint);case _:
  return null;

}
}

}

/// @nodoc


class AuthLoginEvent implements AuthEvent {
  const AuthLoginEvent({required this.userId, required this.password, required this.tenantId});
  

 final  String userId;
 final  String password;
 final  String tenantId;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthLoginEventCopyWith<AuthLoginEvent> get copyWith => _$AuthLoginEventCopyWithImpl<AuthLoginEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoginEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.password, password) || other.password == password)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}


@override
int get hashCode => Object.hash(runtimeType,userId,password,tenantId);

@override
String toString() {
  return 'AuthEvent.login(userId: $userId, password: $password, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $AuthLoginEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthLoginEventCopyWith(AuthLoginEvent value, $Res Function(AuthLoginEvent) _then) = _$AuthLoginEventCopyWithImpl;
@useResult
$Res call({
 String userId, String password, String tenantId
});




}
/// @nodoc
class _$AuthLoginEventCopyWithImpl<$Res>
    implements $AuthLoginEventCopyWith<$Res> {
  _$AuthLoginEventCopyWithImpl(this._self, this._then);

  final AuthLoginEvent _self;
  final $Res Function(AuthLoginEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? password = null,Object? tenantId = null,}) {
  return _then(AuthLoginEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthAutoLoginEvent implements AuthEvent {
  const AuthAutoLoginEvent({required this.tenantId});
  

 final  String tenantId;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthAutoLoginEventCopyWith<AuthAutoLoginEvent> get copyWith => _$AuthAutoLoginEventCopyWithImpl<AuthAutoLoginEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAutoLoginEvent&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}


@override
int get hashCode => Object.hash(runtimeType,tenantId);

@override
String toString() {
  return 'AuthEvent.autoLogin(tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $AuthAutoLoginEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthAutoLoginEventCopyWith(AuthAutoLoginEvent value, $Res Function(AuthAutoLoginEvent) _then) = _$AuthAutoLoginEventCopyWithImpl;
@useResult
$Res call({
 String tenantId
});




}
/// @nodoc
class _$AuthAutoLoginEventCopyWithImpl<$Res>
    implements $AuthAutoLoginEventCopyWith<$Res> {
  _$AuthAutoLoginEventCopyWithImpl(this._self, this._then);

  final AuthAutoLoginEvent _self;
  final $Res Function(AuthAutoLoginEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tenantId = null,}) {
  return _then(AuthAutoLoginEvent(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthLogoutEvent implements AuthEvent {
  const AuthLogoutEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLogoutEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logout()';
}


}




/// @nodoc


class AuthCheckOtherDeviceLoginEvent implements AuthEvent {
  const AuthCheckOtherDeviceLoginEvent({required this.username, required this.tenantId, required this.apiEndPoint});
  

 final  String username;
 final  String tenantId;
 final  String apiEndPoint;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthCheckOtherDeviceLoginEventCopyWith<AuthCheckOtherDeviceLoginEvent> get copyWith => _$AuthCheckOtherDeviceLoginEventCopyWithImpl<AuthCheckOtherDeviceLoginEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCheckOtherDeviceLoginEvent&&(identical(other.username, username) || other.username == username)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.apiEndPoint, apiEndPoint) || other.apiEndPoint == apiEndPoint));
}


@override
int get hashCode => Object.hash(runtimeType,username,tenantId,apiEndPoint);

@override
String toString() {
  return 'AuthEvent.checkOtherDeviceLogin(username: $username, tenantId: $tenantId, apiEndPoint: $apiEndPoint)';
}


}

/// @nodoc
abstract mixin class $AuthCheckOtherDeviceLoginEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthCheckOtherDeviceLoginEventCopyWith(AuthCheckOtherDeviceLoginEvent value, $Res Function(AuthCheckOtherDeviceLoginEvent) _then) = _$AuthCheckOtherDeviceLoginEventCopyWithImpl;
@useResult
$Res call({
 String username, String tenantId, String apiEndPoint
});




}
/// @nodoc
class _$AuthCheckOtherDeviceLoginEventCopyWithImpl<$Res>
    implements $AuthCheckOtherDeviceLoginEventCopyWith<$Res> {
  _$AuthCheckOtherDeviceLoginEventCopyWithImpl(this._self, this._then);

  final AuthCheckOtherDeviceLoginEvent _self;
  final $Res Function(AuthCheckOtherDeviceLoginEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? username = null,Object? tenantId = null,Object? apiEndPoint = null,}) {
  return _then(AuthCheckOtherDeviceLoginEvent(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,apiEndPoint: null == apiEndPoint ? _self.apiEndPoint : apiEndPoint // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthSwitchDeviceEventSwitchDevice implements AuthEvent {
  const AuthSwitchDeviceEventSwitchDevice({required this.selectedReason, required this.deviceSwitchComment, required this.username, required this.password, required this.tenantId, required this.apiEndPoint});
  

 final  String selectedReason;
 final  String? deviceSwitchComment;
 final  String username;
 final  String password;
 final  String tenantId;
 final  String apiEndPoint;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSwitchDeviceEventSwitchDeviceCopyWith<AuthSwitchDeviceEventSwitchDevice> get copyWith => _$AuthSwitchDeviceEventSwitchDeviceCopyWithImpl<AuthSwitchDeviceEventSwitchDevice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSwitchDeviceEventSwitchDevice&&(identical(other.selectedReason, selectedReason) || other.selectedReason == selectedReason)&&(identical(other.deviceSwitchComment, deviceSwitchComment) || other.deviceSwitchComment == deviceSwitchComment)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.apiEndPoint, apiEndPoint) || other.apiEndPoint == apiEndPoint));
}


@override
int get hashCode => Object.hash(runtimeType,selectedReason,deviceSwitchComment,username,password,tenantId,apiEndPoint);

@override
String toString() {
  return 'AuthEvent.switchDevice(selectedReason: $selectedReason, deviceSwitchComment: $deviceSwitchComment, username: $username, password: $password, tenantId: $tenantId, apiEndPoint: $apiEndPoint)';
}


}

/// @nodoc
abstract mixin class $AuthSwitchDeviceEventSwitchDeviceCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthSwitchDeviceEventSwitchDeviceCopyWith(AuthSwitchDeviceEventSwitchDevice value, $Res Function(AuthSwitchDeviceEventSwitchDevice) _then) = _$AuthSwitchDeviceEventSwitchDeviceCopyWithImpl;
@useResult
$Res call({
 String selectedReason, String? deviceSwitchComment, String username, String password, String tenantId, String apiEndPoint
});




}
/// @nodoc
class _$AuthSwitchDeviceEventSwitchDeviceCopyWithImpl<$Res>
    implements $AuthSwitchDeviceEventSwitchDeviceCopyWith<$Res> {
  _$AuthSwitchDeviceEventSwitchDeviceCopyWithImpl(this._self, this._then);

  final AuthSwitchDeviceEventSwitchDevice _self;
  final $Res Function(AuthSwitchDeviceEventSwitchDevice) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedReason = null,Object? deviceSwitchComment = freezed,Object? username = null,Object? password = null,Object? tenantId = null,Object? apiEndPoint = null,}) {
  return _then(AuthSwitchDeviceEventSwitchDevice(
selectedReason: null == selectedReason ? _self.selectedReason : selectedReason // ignore: cast_nullable_to_non_nullable
as String,deviceSwitchComment: freezed == deviceSwitchComment ? _self.deviceSwitchComment : deviceSwitchComment // ignore: cast_nullable_to_non_nullable
as String?,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,apiEndPoint: null == apiEndPoint ? _self.apiEndPoint : apiEndPoint // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthResetEvent implements AuthEvent {
  const AuthResetEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResetEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.reset()';
}


}




/// @nodoc


class AuthAllowEvent implements AuthEvent {
  const AuthAllowEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAllowEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.allow()';
}


}




/// @nodoc


class AuthSwitchDeviceUserActionEvent implements AuthEvent {
  const AuthSwitchDeviceUserActionEvent({required this.userActionModel, required this.apiEndPoint});
  

 final  UserActionModel userActionModel;
 final  String apiEndPoint;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSwitchDeviceUserActionEventCopyWith<AuthSwitchDeviceUserActionEvent> get copyWith => _$AuthSwitchDeviceUserActionEventCopyWithImpl<AuthSwitchDeviceUserActionEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSwitchDeviceUserActionEvent&&(identical(other.userActionModel, userActionModel) || other.userActionModel == userActionModel)&&(identical(other.apiEndPoint, apiEndPoint) || other.apiEndPoint == apiEndPoint));
}


@override
int get hashCode => Object.hash(runtimeType,userActionModel,apiEndPoint);

@override
String toString() {
  return 'AuthEvent.switchDeviceUserAction(userActionModel: $userActionModel, apiEndPoint: $apiEndPoint)';
}


}

/// @nodoc
abstract mixin class $AuthSwitchDeviceUserActionEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthSwitchDeviceUserActionEventCopyWith(AuthSwitchDeviceUserActionEvent value, $Res Function(AuthSwitchDeviceUserActionEvent) _then) = _$AuthSwitchDeviceUserActionEventCopyWithImpl;
@useResult
$Res call({
 UserActionModel userActionModel, String apiEndPoint
});




}
/// @nodoc
class _$AuthSwitchDeviceUserActionEventCopyWithImpl<$Res>
    implements $AuthSwitchDeviceUserActionEventCopyWith<$Res> {
  _$AuthSwitchDeviceUserActionEventCopyWithImpl(this._self, this._then);

  final AuthSwitchDeviceUserActionEvent _self;
  final $Res Function(AuthSwitchDeviceUserActionEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userActionModel = null,Object? apiEndPoint = null,}) {
  return _then(AuthSwitchDeviceUserActionEvent(
userActionModel: null == userActionModel ? _self.userActionModel : userActionModel // ignore: cast_nullable_to_non_nullable
as UserActionModel,apiEndPoint: null == apiEndPoint ? _self.apiEndPoint : apiEndPoint // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthUnauthenticatedState value)?  unauthenticated,TResult Function( AuthLoadingState value)?  loading,TResult Function( AuthLoggingOutState value)?  loggingOut,TResult Function( AuthAuthenticatedState value)?  authenticated,TResult Function( AuthErrorState value)?  error,TResult Function( AuthOtherDeviceState value)?  otherDevice,TResult Function( AuthAllowState value)?  allow,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthUnauthenticatedState() when unauthenticated != null:
return unauthenticated(_that);case AuthLoadingState() when loading != null:
return loading(_that);case AuthLoggingOutState() when loggingOut != null:
return loggingOut(_that);case AuthAuthenticatedState() when authenticated != null:
return authenticated(_that);case AuthErrorState() when error != null:
return error(_that);case AuthOtherDeviceState() when otherDevice != null:
return otherDevice(_that);case AuthAllowState() when allow != null:
return allow(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthUnauthenticatedState value)  unauthenticated,required TResult Function( AuthLoadingState value)  loading,required TResult Function( AuthLoggingOutState value)  loggingOut,required TResult Function( AuthAuthenticatedState value)  authenticated,required TResult Function( AuthErrorState value)  error,required TResult Function( AuthOtherDeviceState value)  otherDevice,required TResult Function( AuthAllowState value)  allow,}){
final _that = this;
switch (_that) {
case AuthUnauthenticatedState():
return unauthenticated(_that);case AuthLoadingState():
return loading(_that);case AuthLoggingOutState():
return loggingOut(_that);case AuthAuthenticatedState():
return authenticated(_that);case AuthErrorState():
return error(_that);case AuthOtherDeviceState():
return otherDevice(_that);case AuthAllowState():
return allow(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthUnauthenticatedState value)?  unauthenticated,TResult? Function( AuthLoadingState value)?  loading,TResult? Function( AuthLoggingOutState value)?  loggingOut,TResult? Function( AuthAuthenticatedState value)?  authenticated,TResult? Function( AuthErrorState value)?  error,TResult? Function( AuthOtherDeviceState value)?  otherDevice,TResult? Function( AuthAllowState value)?  allow,}){
final _that = this;
switch (_that) {
case AuthUnauthenticatedState() when unauthenticated != null:
return unauthenticated(_that);case AuthLoadingState() when loading != null:
return loading(_that);case AuthLoggingOutState() when loggingOut != null:
return loggingOut(_that);case AuthAuthenticatedState() when authenticated != null:
return authenticated(_that);case AuthErrorState() when error != null:
return error(_that);case AuthOtherDeviceState() when otherDevice != null:
return otherDevice(_that);case AuthAllowState() when allow != null:
return allow(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  unauthenticated,TResult Function()?  loading,TResult Function()?  loggingOut,TResult Function( String accessToken,  String refreshToken,  UserRequestModel userModel,  RoleActionsWrapperModel actionsWrapper,  String? individualId)?  authenticated,TResult Function( String? error)?  error,TResult Function()?  otherDevice,TResult Function()?  allow,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthUnauthenticatedState() when unauthenticated != null:
return unauthenticated();case AuthLoadingState() when loading != null:
return loading();case AuthLoggingOutState() when loggingOut != null:
return loggingOut();case AuthAuthenticatedState() when authenticated != null:
return authenticated(_that.accessToken,_that.refreshToken,_that.userModel,_that.actionsWrapper,_that.individualId);case AuthErrorState() when error != null:
return error(_that.error);case AuthOtherDeviceState() when otherDevice != null:
return otherDevice();case AuthAllowState() when allow != null:
return allow();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  unauthenticated,required TResult Function()  loading,required TResult Function()  loggingOut,required TResult Function( String accessToken,  String refreshToken,  UserRequestModel userModel,  RoleActionsWrapperModel actionsWrapper,  String? individualId)  authenticated,required TResult Function( String? error)  error,required TResult Function()  otherDevice,required TResult Function()  allow,}) {final _that = this;
switch (_that) {
case AuthUnauthenticatedState():
return unauthenticated();case AuthLoadingState():
return loading();case AuthLoggingOutState():
return loggingOut();case AuthAuthenticatedState():
return authenticated(_that.accessToken,_that.refreshToken,_that.userModel,_that.actionsWrapper,_that.individualId);case AuthErrorState():
return error(_that.error);case AuthOtherDeviceState():
return otherDevice();case AuthAllowState():
return allow();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  unauthenticated,TResult? Function()?  loading,TResult? Function()?  loggingOut,TResult? Function( String accessToken,  String refreshToken,  UserRequestModel userModel,  RoleActionsWrapperModel actionsWrapper,  String? individualId)?  authenticated,TResult? Function( String? error)?  error,TResult? Function()?  otherDevice,TResult? Function()?  allow,}) {final _that = this;
switch (_that) {
case AuthUnauthenticatedState() when unauthenticated != null:
return unauthenticated();case AuthLoadingState() when loading != null:
return loading();case AuthLoggingOutState() when loggingOut != null:
return loggingOut();case AuthAuthenticatedState() when authenticated != null:
return authenticated(_that.accessToken,_that.refreshToken,_that.userModel,_that.actionsWrapper,_that.individualId);case AuthErrorState() when error != null:
return error(_that.error);case AuthOtherDeviceState() when otherDevice != null:
return otherDevice();case AuthAllowState() when allow != null:
return allow();case _:
  return null;

}
}

}

/// @nodoc


class AuthUnauthenticatedState implements AuthState {
  const AuthUnauthenticatedState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUnauthenticatedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.unauthenticated()';
}


}




/// @nodoc


class AuthLoadingState implements AuthState {
  const AuthLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class AuthLoggingOutState implements AuthState {
  const AuthLoggingOutState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoggingOutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loggingOut()';
}


}




/// @nodoc


class AuthAuthenticatedState implements AuthState {
  const AuthAuthenticatedState({required this.accessToken, required this.refreshToken, required this.userModel, required this.actionsWrapper, this.individualId});
  

 final  String accessToken;
 final  String refreshToken;
 final  UserRequestModel userModel;
 final  RoleActionsWrapperModel actionsWrapper;
 final  String? individualId;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthAuthenticatedStateCopyWith<AuthAuthenticatedState> get copyWith => _$AuthAuthenticatedStateCopyWithImpl<AuthAuthenticatedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAuthenticatedState&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.userModel, userModel) || other.userModel == userModel)&&(identical(other.actionsWrapper, actionsWrapper) || other.actionsWrapper == actionsWrapper)&&(identical(other.individualId, individualId) || other.individualId == individualId));
}


@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,userModel,actionsWrapper,individualId);

@override
String toString() {
  return 'AuthState.authenticated(accessToken: $accessToken, refreshToken: $refreshToken, userModel: $userModel, actionsWrapper: $actionsWrapper, individualId: $individualId)';
}


}

/// @nodoc
abstract mixin class $AuthAuthenticatedStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthAuthenticatedStateCopyWith(AuthAuthenticatedState value, $Res Function(AuthAuthenticatedState) _then) = _$AuthAuthenticatedStateCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken, UserRequestModel userModel, RoleActionsWrapperModel actionsWrapper, String? individualId
});


$UserRequestModelCopyWith<$Res> get userModel;$RoleActionsWrapperModelCopyWith<$Res> get actionsWrapper;

}
/// @nodoc
class _$AuthAuthenticatedStateCopyWithImpl<$Res>
    implements $AuthAuthenticatedStateCopyWith<$Res> {
  _$AuthAuthenticatedStateCopyWithImpl(this._self, this._then);

  final AuthAuthenticatedState _self;
  final $Res Function(AuthAuthenticatedState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? userModel = null,Object? actionsWrapper = null,Object? individualId = freezed,}) {
  return _then(AuthAuthenticatedState(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,userModel: null == userModel ? _self.userModel : userModel // ignore: cast_nullable_to_non_nullable
as UserRequestModel,actionsWrapper: null == actionsWrapper ? _self.actionsWrapper : actionsWrapper // ignore: cast_nullable_to_non_nullable
as RoleActionsWrapperModel,individualId: freezed == individualId ? _self.individualId : individualId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserRequestModelCopyWith<$Res> get userModel {
  
  return $UserRequestModelCopyWith<$Res>(_self.userModel, (value) {
    return _then(_self.copyWith(userModel: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoleActionsWrapperModelCopyWith<$Res> get actionsWrapper {
  
  return $RoleActionsWrapperModelCopyWith<$Res>(_self.actionsWrapper, (value) {
    return _then(_self.copyWith(actionsWrapper: value));
  });
}
}

/// @nodoc


class AuthErrorState implements AuthState {
  const AuthErrorState([this.error]);
  

 final  String? error;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthErrorStateCopyWith<AuthErrorState> get copyWith => _$AuthErrorStateCopyWithImpl<AuthErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthErrorState&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AuthState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $AuthErrorStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthErrorStateCopyWith(AuthErrorState value, $Res Function(AuthErrorState) _then) = _$AuthErrorStateCopyWithImpl;
@useResult
$Res call({
 String? error
});




}
/// @nodoc
class _$AuthErrorStateCopyWithImpl<$Res>
    implements $AuthErrorStateCopyWith<$Res> {
  _$AuthErrorStateCopyWithImpl(this._self, this._then);

  final AuthErrorState _self;
  final $Res Function(AuthErrorState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(AuthErrorState(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class AuthOtherDeviceState implements AuthState {
  const AuthOtherDeviceState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthOtherDeviceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.otherDevice()';
}


}




/// @nodoc


class AuthAllowState implements AuthState {
  const AuthAllowState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAllowState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.allow()';
}


}




// dart format on

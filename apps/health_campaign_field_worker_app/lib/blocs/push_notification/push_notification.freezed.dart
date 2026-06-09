// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PushNotificationEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PushNotificationEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushNotificationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PushNotificationEvent()';
}


}

/// @nodoc
class $PushNotificationEventCopyWith<$Res>  {
$PushNotificationEventCopyWith(PushNotificationEvent _, $Res Function(PushNotificationEvent) __);
}


/// Adds pattern-matching-related methods to [PushNotificationEvent].
extension PushNotificationEventPatterns on PushNotificationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PushNotificationInitializeEvent value)?  initialize,TResult Function( PushNotificationLoginEvent value)?  login,TResult Function( PushNotificationLogoutEvent value)?  logout,TResult Function( PushNotificationTokenRefreshedEvent value)?  tokenRefreshed,TResult Function( PushNotificationRegisterTokenEvent value)?  registerToken,TResult Function( PushNotificationNotificationReceivedEvent value)?  notificationReceived,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PushNotificationInitializeEvent() when initialize != null:
return initialize(_that);case PushNotificationLoginEvent() when login != null:
return login(_that);case PushNotificationLogoutEvent() when logout != null:
return logout(_that);case PushNotificationTokenRefreshedEvent() when tokenRefreshed != null:
return tokenRefreshed(_that);case PushNotificationRegisterTokenEvent() when registerToken != null:
return registerToken(_that);case PushNotificationNotificationReceivedEvent() when notificationReceived != null:
return notificationReceived(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PushNotificationInitializeEvent value)  initialize,required TResult Function( PushNotificationLoginEvent value)  login,required TResult Function( PushNotificationLogoutEvent value)  logout,required TResult Function( PushNotificationTokenRefreshedEvent value)  tokenRefreshed,required TResult Function( PushNotificationRegisterTokenEvent value)  registerToken,required TResult Function( PushNotificationNotificationReceivedEvent value)  notificationReceived,}){
final _that = this;
switch (_that) {
case PushNotificationInitializeEvent():
return initialize(_that);case PushNotificationLoginEvent():
return login(_that);case PushNotificationLogoutEvent():
return logout(_that);case PushNotificationTokenRefreshedEvent():
return tokenRefreshed(_that);case PushNotificationRegisterTokenEvent():
return registerToken(_that);case PushNotificationNotificationReceivedEvent():
return notificationReceived(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PushNotificationInitializeEvent value)?  initialize,TResult? Function( PushNotificationLoginEvent value)?  login,TResult? Function( PushNotificationLogoutEvent value)?  logout,TResult? Function( PushNotificationTokenRefreshedEvent value)?  tokenRefreshed,TResult? Function( PushNotificationRegisterTokenEvent value)?  registerToken,TResult? Function( PushNotificationNotificationReceivedEvent value)?  notificationReceived,}){
final _that = this;
switch (_that) {
case PushNotificationInitializeEvent() when initialize != null:
return initialize(_that);case PushNotificationLoginEvent() when login != null:
return login(_that);case PushNotificationLogoutEvent() when logout != null:
return logout(_that);case PushNotificationTokenRefreshedEvent() when tokenRefreshed != null:
return tokenRefreshed(_that);case PushNotificationRegisterTokenEvent() when registerToken != null:
return registerToken(_that);case PushNotificationNotificationReceivedEvent() when notificationReceived != null:
return notificationReceived(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialize,TResult Function( String userId)?  login,TResult Function( String apiEndPoint)?  logout,TResult Function( String token)?  tokenRefreshed,TResult Function( String apiEndPoint,  List<String> facilityIds,  UserRequestModel? userObject)?  registerToken,TResult Function( Map<String, dynamic> data)?  notificationReceived,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PushNotificationInitializeEvent() when initialize != null:
return initialize();case PushNotificationLoginEvent() when login != null:
return login(_that.userId);case PushNotificationLogoutEvent() when logout != null:
return logout(_that.apiEndPoint);case PushNotificationTokenRefreshedEvent() when tokenRefreshed != null:
return tokenRefreshed(_that.token);case PushNotificationRegisterTokenEvent() when registerToken != null:
return registerToken(_that.apiEndPoint,_that.facilityIds,_that.userObject);case PushNotificationNotificationReceivedEvent() when notificationReceived != null:
return notificationReceived(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialize,required TResult Function( String userId)  login,required TResult Function( String apiEndPoint)  logout,required TResult Function( String token)  tokenRefreshed,required TResult Function( String apiEndPoint,  List<String> facilityIds,  UserRequestModel? userObject)  registerToken,required TResult Function( Map<String, dynamic> data)  notificationReceived,}) {final _that = this;
switch (_that) {
case PushNotificationInitializeEvent():
return initialize();case PushNotificationLoginEvent():
return login(_that.userId);case PushNotificationLogoutEvent():
return logout(_that.apiEndPoint);case PushNotificationTokenRefreshedEvent():
return tokenRefreshed(_that.token);case PushNotificationRegisterTokenEvent():
return registerToken(_that.apiEndPoint,_that.facilityIds,_that.userObject);case PushNotificationNotificationReceivedEvent():
return notificationReceived(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialize,TResult? Function( String userId)?  login,TResult? Function( String apiEndPoint)?  logout,TResult? Function( String token)?  tokenRefreshed,TResult? Function( String apiEndPoint,  List<String> facilityIds,  UserRequestModel? userObject)?  registerToken,TResult? Function( Map<String, dynamic> data)?  notificationReceived,}) {final _that = this;
switch (_that) {
case PushNotificationInitializeEvent() when initialize != null:
return initialize();case PushNotificationLoginEvent() when login != null:
return login(_that.userId);case PushNotificationLogoutEvent() when logout != null:
return logout(_that.apiEndPoint);case PushNotificationTokenRefreshedEvent() when tokenRefreshed != null:
return tokenRefreshed(_that.token);case PushNotificationRegisterTokenEvent() when registerToken != null:
return registerToken(_that.apiEndPoint,_that.facilityIds,_that.userObject);case PushNotificationNotificationReceivedEvent() when notificationReceived != null:
return notificationReceived(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class PushNotificationInitializeEvent with DiagnosticableTreeMixin implements PushNotificationEvent {
  const PushNotificationInitializeEvent();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PushNotificationEvent.initialize'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushNotificationInitializeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PushNotificationEvent.initialize()';
}


}




/// @nodoc


class PushNotificationLoginEvent with DiagnosticableTreeMixin implements PushNotificationEvent {
  const PushNotificationLoginEvent({required this.userId});
  

 final  String userId;

/// Create a copy of PushNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushNotificationLoginEventCopyWith<PushNotificationLoginEvent> get copyWith => _$PushNotificationLoginEventCopyWithImpl<PushNotificationLoginEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PushNotificationEvent.login'))
    ..add(DiagnosticsProperty('userId', userId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushNotificationLoginEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PushNotificationEvent.login(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $PushNotificationLoginEventCopyWith<$Res> implements $PushNotificationEventCopyWith<$Res> {
  factory $PushNotificationLoginEventCopyWith(PushNotificationLoginEvent value, $Res Function(PushNotificationLoginEvent) _then) = _$PushNotificationLoginEventCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$PushNotificationLoginEventCopyWithImpl<$Res>
    implements $PushNotificationLoginEventCopyWith<$Res> {
  _$PushNotificationLoginEventCopyWithImpl(this._self, this._then);

  final PushNotificationLoginEvent _self;
  final $Res Function(PushNotificationLoginEvent) _then;

/// Create a copy of PushNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(PushNotificationLoginEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PushNotificationLogoutEvent with DiagnosticableTreeMixin implements PushNotificationEvent {
  const PushNotificationLogoutEvent({required this.apiEndPoint});
  

 final  String apiEndPoint;

/// Create a copy of PushNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushNotificationLogoutEventCopyWith<PushNotificationLogoutEvent> get copyWith => _$PushNotificationLogoutEventCopyWithImpl<PushNotificationLogoutEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PushNotificationEvent.logout'))
    ..add(DiagnosticsProperty('apiEndPoint', apiEndPoint));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushNotificationLogoutEvent&&(identical(other.apiEndPoint, apiEndPoint) || other.apiEndPoint == apiEndPoint));
}


@override
int get hashCode => Object.hash(runtimeType,apiEndPoint);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PushNotificationEvent.logout(apiEndPoint: $apiEndPoint)';
}


}

/// @nodoc
abstract mixin class $PushNotificationLogoutEventCopyWith<$Res> implements $PushNotificationEventCopyWith<$Res> {
  factory $PushNotificationLogoutEventCopyWith(PushNotificationLogoutEvent value, $Res Function(PushNotificationLogoutEvent) _then) = _$PushNotificationLogoutEventCopyWithImpl;
@useResult
$Res call({
 String apiEndPoint
});




}
/// @nodoc
class _$PushNotificationLogoutEventCopyWithImpl<$Res>
    implements $PushNotificationLogoutEventCopyWith<$Res> {
  _$PushNotificationLogoutEventCopyWithImpl(this._self, this._then);

  final PushNotificationLogoutEvent _self;
  final $Res Function(PushNotificationLogoutEvent) _then;

/// Create a copy of PushNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiEndPoint = null,}) {
  return _then(PushNotificationLogoutEvent(
apiEndPoint: null == apiEndPoint ? _self.apiEndPoint : apiEndPoint // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PushNotificationTokenRefreshedEvent with DiagnosticableTreeMixin implements PushNotificationEvent {
  const PushNotificationTokenRefreshedEvent({required this.token});
  

 final  String token;

/// Create a copy of PushNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushNotificationTokenRefreshedEventCopyWith<PushNotificationTokenRefreshedEvent> get copyWith => _$PushNotificationTokenRefreshedEventCopyWithImpl<PushNotificationTokenRefreshedEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PushNotificationEvent.tokenRefreshed'))
    ..add(DiagnosticsProperty('token', token));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushNotificationTokenRefreshedEvent&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PushNotificationEvent.tokenRefreshed(token: $token)';
}


}

/// @nodoc
abstract mixin class $PushNotificationTokenRefreshedEventCopyWith<$Res> implements $PushNotificationEventCopyWith<$Res> {
  factory $PushNotificationTokenRefreshedEventCopyWith(PushNotificationTokenRefreshedEvent value, $Res Function(PushNotificationTokenRefreshedEvent) _then) = _$PushNotificationTokenRefreshedEventCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class _$PushNotificationTokenRefreshedEventCopyWithImpl<$Res>
    implements $PushNotificationTokenRefreshedEventCopyWith<$Res> {
  _$PushNotificationTokenRefreshedEventCopyWithImpl(this._self, this._then);

  final PushNotificationTokenRefreshedEvent _self;
  final $Res Function(PushNotificationTokenRefreshedEvent) _then;

/// Create a copy of PushNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(PushNotificationTokenRefreshedEvent(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PushNotificationRegisterTokenEvent with DiagnosticableTreeMixin implements PushNotificationEvent {
  const PushNotificationRegisterTokenEvent({required this.apiEndPoint, required final  List<String> facilityIds, required this.userObject}): _facilityIds = facilityIds;
  

 final  String apiEndPoint;
 final  List<String> _facilityIds;
 List<String> get facilityIds {
  if (_facilityIds is EqualUnmodifiableListView) return _facilityIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_facilityIds);
}

 final  UserRequestModel? userObject;

/// Create a copy of PushNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushNotificationRegisterTokenEventCopyWith<PushNotificationRegisterTokenEvent> get copyWith => _$PushNotificationRegisterTokenEventCopyWithImpl<PushNotificationRegisterTokenEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PushNotificationEvent.registerToken'))
    ..add(DiagnosticsProperty('apiEndPoint', apiEndPoint))..add(DiagnosticsProperty('facilityIds', facilityIds))..add(DiagnosticsProperty('userObject', userObject));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushNotificationRegisterTokenEvent&&(identical(other.apiEndPoint, apiEndPoint) || other.apiEndPoint == apiEndPoint)&&const DeepCollectionEquality().equals(other._facilityIds, _facilityIds)&&(identical(other.userObject, userObject) || other.userObject == userObject));
}


@override
int get hashCode => Object.hash(runtimeType,apiEndPoint,const DeepCollectionEquality().hash(_facilityIds),userObject);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PushNotificationEvent.registerToken(apiEndPoint: $apiEndPoint, facilityIds: $facilityIds, userObject: $userObject)';
}


}

/// @nodoc
abstract mixin class $PushNotificationRegisterTokenEventCopyWith<$Res> implements $PushNotificationEventCopyWith<$Res> {
  factory $PushNotificationRegisterTokenEventCopyWith(PushNotificationRegisterTokenEvent value, $Res Function(PushNotificationRegisterTokenEvent) _then) = _$PushNotificationRegisterTokenEventCopyWithImpl;
@useResult
$Res call({
 String apiEndPoint, List<String> facilityIds, UserRequestModel? userObject
});


$UserRequestModelCopyWith<$Res>? get userObject;

}
/// @nodoc
class _$PushNotificationRegisterTokenEventCopyWithImpl<$Res>
    implements $PushNotificationRegisterTokenEventCopyWith<$Res> {
  _$PushNotificationRegisterTokenEventCopyWithImpl(this._self, this._then);

  final PushNotificationRegisterTokenEvent _self;
  final $Res Function(PushNotificationRegisterTokenEvent) _then;

/// Create a copy of PushNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiEndPoint = null,Object? facilityIds = null,Object? userObject = freezed,}) {
  return _then(PushNotificationRegisterTokenEvent(
apiEndPoint: null == apiEndPoint ? _self.apiEndPoint : apiEndPoint // ignore: cast_nullable_to_non_nullable
as String,facilityIds: null == facilityIds ? _self._facilityIds : facilityIds // ignore: cast_nullable_to_non_nullable
as List<String>,userObject: freezed == userObject ? _self.userObject : userObject // ignore: cast_nullable_to_non_nullable
as UserRequestModel?,
  ));
}

/// Create a copy of PushNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserRequestModelCopyWith<$Res>? get userObject {
    if (_self.userObject == null) {
    return null;
  }

  return $UserRequestModelCopyWith<$Res>(_self.userObject!, (value) {
    return _then(_self.copyWith(userObject: value));
  });
}
}

/// @nodoc


class PushNotificationNotificationReceivedEvent with DiagnosticableTreeMixin implements PushNotificationEvent {
  const PushNotificationNotificationReceivedEvent({required final  Map<String, dynamic> data}): _data = data;
  

 final  Map<String, dynamic> _data;
 Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of PushNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushNotificationNotificationReceivedEventCopyWith<PushNotificationNotificationReceivedEvent> get copyWith => _$PushNotificationNotificationReceivedEventCopyWithImpl<PushNotificationNotificationReceivedEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PushNotificationEvent.notificationReceived'))
    ..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushNotificationNotificationReceivedEvent&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PushNotificationEvent.notificationReceived(data: $data)';
}


}

/// @nodoc
abstract mixin class $PushNotificationNotificationReceivedEventCopyWith<$Res> implements $PushNotificationEventCopyWith<$Res> {
  factory $PushNotificationNotificationReceivedEventCopyWith(PushNotificationNotificationReceivedEvent value, $Res Function(PushNotificationNotificationReceivedEvent) _then) = _$PushNotificationNotificationReceivedEventCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> data
});




}
/// @nodoc
class _$PushNotificationNotificationReceivedEventCopyWithImpl<$Res>
    implements $PushNotificationNotificationReceivedEventCopyWith<$Res> {
  _$PushNotificationNotificationReceivedEventCopyWithImpl(this._self, this._then);

  final PushNotificationNotificationReceivedEvent _self;
  final $Res Function(PushNotificationNotificationReceivedEvent) _then;

/// Create a copy of PushNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(PushNotificationNotificationReceivedEvent(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc
mixin _$PushNotificationState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PushNotificationState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushNotificationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PushNotificationState()';
}


}

/// @nodoc
class $PushNotificationStateCopyWith<$Res>  {
$PushNotificationStateCopyWith(PushNotificationState _, $Res Function(PushNotificationState) __);
}


/// Adds pattern-matching-related methods to [PushNotificationState].
extension PushNotificationStatePatterns on PushNotificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PushNotificationInitialState value)?  initial,TResult Function( PushNotificationInitializedState value)?  initialized,TResult Function( PushNotificationTappedState value)?  notificationTapped,TResult Function( PushNotificationErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PushNotificationInitialState() when initial != null:
return initial(_that);case PushNotificationInitializedState() when initialized != null:
return initialized(_that);case PushNotificationTappedState() when notificationTapped != null:
return notificationTapped(_that);case PushNotificationErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PushNotificationInitialState value)  initial,required TResult Function( PushNotificationInitializedState value)  initialized,required TResult Function( PushNotificationTappedState value)  notificationTapped,required TResult Function( PushNotificationErrorState value)  error,}){
final _that = this;
switch (_that) {
case PushNotificationInitialState():
return initial(_that);case PushNotificationInitializedState():
return initialized(_that);case PushNotificationTappedState():
return notificationTapped(_that);case PushNotificationErrorState():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PushNotificationInitialState value)?  initial,TResult? Function( PushNotificationInitializedState value)?  initialized,TResult? Function( PushNotificationTappedState value)?  notificationTapped,TResult? Function( PushNotificationErrorState value)?  error,}){
final _that = this;
switch (_that) {
case PushNotificationInitialState() when initial != null:
return initial(_that);case PushNotificationInitializedState() when initialized != null:
return initialized(_that);case PushNotificationTappedState() when notificationTapped != null:
return notificationTapped(_that);case PushNotificationErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String? fcmToken)?  initialized,TResult Function( Map<String, dynamic> data)?  notificationTapped,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PushNotificationInitialState() when initial != null:
return initial();case PushNotificationInitializedState() when initialized != null:
return initialized(_that.fcmToken);case PushNotificationTappedState() when notificationTapped != null:
return notificationTapped(_that.data);case PushNotificationErrorState() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String? fcmToken)  initialized,required TResult Function( Map<String, dynamic> data)  notificationTapped,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case PushNotificationInitialState():
return initial();case PushNotificationInitializedState():
return initialized(_that.fcmToken);case PushNotificationTappedState():
return notificationTapped(_that.data);case PushNotificationErrorState():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String? fcmToken)?  initialized,TResult? Function( Map<String, dynamic> data)?  notificationTapped,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case PushNotificationInitialState() when initial != null:
return initial();case PushNotificationInitializedState() when initialized != null:
return initialized(_that.fcmToken);case PushNotificationTappedState() when notificationTapped != null:
return notificationTapped(_that.data);case PushNotificationErrorState() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class PushNotificationInitialState with DiagnosticableTreeMixin implements PushNotificationState {
  const PushNotificationInitialState();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PushNotificationState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushNotificationInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PushNotificationState.initial()';
}


}




/// @nodoc


class PushNotificationInitializedState with DiagnosticableTreeMixin implements PushNotificationState {
  const PushNotificationInitializedState({this.fcmToken});
  

 final  String? fcmToken;

/// Create a copy of PushNotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushNotificationInitializedStateCopyWith<PushNotificationInitializedState> get copyWith => _$PushNotificationInitializedStateCopyWithImpl<PushNotificationInitializedState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PushNotificationState.initialized'))
    ..add(DiagnosticsProperty('fcmToken', fcmToken));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushNotificationInitializedState&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken));
}


@override
int get hashCode => Object.hash(runtimeType,fcmToken);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PushNotificationState.initialized(fcmToken: $fcmToken)';
}


}

/// @nodoc
abstract mixin class $PushNotificationInitializedStateCopyWith<$Res> implements $PushNotificationStateCopyWith<$Res> {
  factory $PushNotificationInitializedStateCopyWith(PushNotificationInitializedState value, $Res Function(PushNotificationInitializedState) _then) = _$PushNotificationInitializedStateCopyWithImpl;
@useResult
$Res call({
 String? fcmToken
});




}
/// @nodoc
class _$PushNotificationInitializedStateCopyWithImpl<$Res>
    implements $PushNotificationInitializedStateCopyWith<$Res> {
  _$PushNotificationInitializedStateCopyWithImpl(this._self, this._then);

  final PushNotificationInitializedState _self;
  final $Res Function(PushNotificationInitializedState) _then;

/// Create a copy of PushNotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fcmToken = freezed,}) {
  return _then(PushNotificationInitializedState(
fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PushNotificationTappedState with DiagnosticableTreeMixin implements PushNotificationState {
  const PushNotificationTappedState({required final  Map<String, dynamic> data}): _data = data;
  

 final  Map<String, dynamic> _data;
 Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of PushNotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushNotificationTappedStateCopyWith<PushNotificationTappedState> get copyWith => _$PushNotificationTappedStateCopyWithImpl<PushNotificationTappedState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PushNotificationState.notificationTapped'))
    ..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushNotificationTappedState&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PushNotificationState.notificationTapped(data: $data)';
}


}

/// @nodoc
abstract mixin class $PushNotificationTappedStateCopyWith<$Res> implements $PushNotificationStateCopyWith<$Res> {
  factory $PushNotificationTappedStateCopyWith(PushNotificationTappedState value, $Res Function(PushNotificationTappedState) _then) = _$PushNotificationTappedStateCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> data
});




}
/// @nodoc
class _$PushNotificationTappedStateCopyWithImpl<$Res>
    implements $PushNotificationTappedStateCopyWith<$Res> {
  _$PushNotificationTappedStateCopyWithImpl(this._self, this._then);

  final PushNotificationTappedState _self;
  final $Res Function(PushNotificationTappedState) _then;

/// Create a copy of PushNotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(PushNotificationTappedState(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class PushNotificationErrorState with DiagnosticableTreeMixin implements PushNotificationState {
  const PushNotificationErrorState({required this.error});
  

 final  String error;

/// Create a copy of PushNotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushNotificationErrorStateCopyWith<PushNotificationErrorState> get copyWith => _$PushNotificationErrorStateCopyWithImpl<PushNotificationErrorState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PushNotificationState.error'))
    ..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushNotificationErrorState&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PushNotificationState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $PushNotificationErrorStateCopyWith<$Res> implements $PushNotificationStateCopyWith<$Res> {
  factory $PushNotificationErrorStateCopyWith(PushNotificationErrorState value, $Res Function(PushNotificationErrorState) _then) = _$PushNotificationErrorStateCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PushNotificationErrorStateCopyWithImpl<$Res>
    implements $PushNotificationErrorStateCopyWith<$Res> {
  _$PushNotificationErrorStateCopyWithImpl(this._self, this._then);

  final PushNotificationErrorState _self;
  final $Res Function(PushNotificationErrorState) _then;

/// Create a copy of PushNotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PushNotificationErrorState(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

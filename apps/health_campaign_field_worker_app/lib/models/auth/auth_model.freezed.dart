// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthModel {

@JsonKey(name: 'access_token') String get accessToken;@JsonKey(name: 'token_type') String get tokenType;@JsonKey(name: 'refresh_token') String get refreshToken;@JsonKey(name: 'expires_in') int get expiresIn;@JsonKey(name: 'UserRequest') UserRequestModel get userRequestModel;
/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthModelCopyWith<AuthModel> get copyWith => _$AuthModelCopyWithImpl<AuthModel>(this as AuthModel, _$identity);

  /// Serializes this AuthModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.userRequestModel, userRequestModel) || other.userRequestModel == userRequestModel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,tokenType,refreshToken,expiresIn,userRequestModel);

@override
String toString() {
  return 'AuthModel(accessToken: $accessToken, tokenType: $tokenType, refreshToken: $refreshToken, expiresIn: $expiresIn, userRequestModel: $userRequestModel)';
}


}

/// @nodoc
abstract mixin class $AuthModelCopyWith<$Res>  {
  factory $AuthModelCopyWith(AuthModel value, $Res Function(AuthModel) _then) = _$AuthModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'token_type') String tokenType,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'expires_in') int expiresIn,@JsonKey(name: 'UserRequest') UserRequestModel userRequestModel
});


$UserRequestModelCopyWith<$Res> get userRequestModel;

}
/// @nodoc
class _$AuthModelCopyWithImpl<$Res>
    implements $AuthModelCopyWith<$Res> {
  _$AuthModelCopyWithImpl(this._self, this._then);

  final AuthModel _self;
  final $Res Function(AuthModel) _then;

/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? tokenType = null,Object? refreshToken = null,Object? expiresIn = null,Object? userRequestModel = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,userRequestModel: null == userRequestModel ? _self.userRequestModel : userRequestModel // ignore: cast_nullable_to_non_nullable
as UserRequestModel,
  ));
}
/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserRequestModelCopyWith<$Res> get userRequestModel {
  
  return $UserRequestModelCopyWith<$Res>(_self.userRequestModel, (value) {
    return _then(_self.copyWith(userRequestModel: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthModel].
extension AuthModelPatterns on AuthModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'token_type')  String tokenType, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'UserRequest')  UserRequestModel userRequestModel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthModel() when $default != null:
return $default(_that.accessToken,_that.tokenType,_that.refreshToken,_that.expiresIn,_that.userRequestModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'token_type')  String tokenType, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'UserRequest')  UserRequestModel userRequestModel)  $default,) {final _that = this;
switch (_that) {
case _AuthModel():
return $default(_that.accessToken,_that.tokenType,_that.refreshToken,_that.expiresIn,_that.userRequestModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'token_type')  String tokenType, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'UserRequest')  UserRequestModel userRequestModel)?  $default,) {final _that = this;
switch (_that) {
case _AuthModel() when $default != null:
return $default(_that.accessToken,_that.tokenType,_that.refreshToken,_that.expiresIn,_that.userRequestModel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthModel implements AuthModel {
  const _AuthModel({@JsonKey(name: 'access_token') required this.accessToken, @JsonKey(name: 'token_type') required this.tokenType, @JsonKey(name: 'refresh_token') required this.refreshToken, @JsonKey(name: 'expires_in') required this.expiresIn, @JsonKey(name: 'UserRequest') required this.userRequestModel});
  factory _AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);

@override@JsonKey(name: 'access_token') final  String accessToken;
@override@JsonKey(name: 'token_type') final  String tokenType;
@override@JsonKey(name: 'refresh_token') final  String refreshToken;
@override@JsonKey(name: 'expires_in') final  int expiresIn;
@override@JsonKey(name: 'UserRequest') final  UserRequestModel userRequestModel;

/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthModelCopyWith<_AuthModel> get copyWith => __$AuthModelCopyWithImpl<_AuthModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.userRequestModel, userRequestModel) || other.userRequestModel == userRequestModel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,tokenType,refreshToken,expiresIn,userRequestModel);

@override
String toString() {
  return 'AuthModel(accessToken: $accessToken, tokenType: $tokenType, refreshToken: $refreshToken, expiresIn: $expiresIn, userRequestModel: $userRequestModel)';
}


}

/// @nodoc
abstract mixin class _$AuthModelCopyWith<$Res> implements $AuthModelCopyWith<$Res> {
  factory _$AuthModelCopyWith(_AuthModel value, $Res Function(_AuthModel) _then) = __$AuthModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'token_type') String tokenType,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'expires_in') int expiresIn,@JsonKey(name: 'UserRequest') UserRequestModel userRequestModel
});


@override $UserRequestModelCopyWith<$Res> get userRequestModel;

}
/// @nodoc
class __$AuthModelCopyWithImpl<$Res>
    implements _$AuthModelCopyWith<$Res> {
  __$AuthModelCopyWithImpl(this._self, this._then);

  final _AuthModel _self;
  final $Res Function(_AuthModel) _then;

/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? tokenType = null,Object? refreshToken = null,Object? expiresIn = null,Object? userRequestModel = null,}) {
  return _then(_AuthModel(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,userRequestModel: null == userRequestModel ? _self.userRequestModel : userRequestModel // ignore: cast_nullable_to_non_nullable
as UserRequestModel,
  ));
}

/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserRequestModelCopyWith<$Res> get userRequestModel {
  
  return $UserRequestModelCopyWith<$Res>(_self.userRequestModel, (value) {
    return _then(_self.copyWith(userRequestModel: value));
  });
}
}


/// @nodoc
mixin _$ValidateResponseModel {

@JsonKey(name: 'isDuplicateLogin') bool get isDuplicateLogin;@JsonKey(name: 'existingDeviceToken') String? get existingDeviceToken;
/// Create a copy of ValidateResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidateResponseModelCopyWith<ValidateResponseModel> get copyWith => _$ValidateResponseModelCopyWithImpl<ValidateResponseModel>(this as ValidateResponseModel, _$identity);

  /// Serializes this ValidateResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidateResponseModel&&(identical(other.isDuplicateLogin, isDuplicateLogin) || other.isDuplicateLogin == isDuplicateLogin)&&(identical(other.existingDeviceToken, existingDeviceToken) || other.existingDeviceToken == existingDeviceToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isDuplicateLogin,existingDeviceToken);

@override
String toString() {
  return 'ValidateResponseModel(isDuplicateLogin: $isDuplicateLogin, existingDeviceToken: $existingDeviceToken)';
}


}

/// @nodoc
abstract mixin class $ValidateResponseModelCopyWith<$Res>  {
  factory $ValidateResponseModelCopyWith(ValidateResponseModel value, $Res Function(ValidateResponseModel) _then) = _$ValidateResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'isDuplicateLogin') bool isDuplicateLogin,@JsonKey(name: 'existingDeviceToken') String? existingDeviceToken
});




}
/// @nodoc
class _$ValidateResponseModelCopyWithImpl<$Res>
    implements $ValidateResponseModelCopyWith<$Res> {
  _$ValidateResponseModelCopyWithImpl(this._self, this._then);

  final ValidateResponseModel _self;
  final $Res Function(ValidateResponseModel) _then;

/// Create a copy of ValidateResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isDuplicateLogin = null,Object? existingDeviceToken = freezed,}) {
  return _then(_self.copyWith(
isDuplicateLogin: null == isDuplicateLogin ? _self.isDuplicateLogin : isDuplicateLogin // ignore: cast_nullable_to_non_nullable
as bool,existingDeviceToken: freezed == existingDeviceToken ? _self.existingDeviceToken : existingDeviceToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ValidateResponseModel].
extension ValidateResponseModelPatterns on ValidateResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidateResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidateResponseModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidateResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ValidateResponseModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidateResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ValidateResponseModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'isDuplicateLogin')  bool isDuplicateLogin, @JsonKey(name: 'existingDeviceToken')  String? existingDeviceToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValidateResponseModel() when $default != null:
return $default(_that.isDuplicateLogin,_that.existingDeviceToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'isDuplicateLogin')  bool isDuplicateLogin, @JsonKey(name: 'existingDeviceToken')  String? existingDeviceToken)  $default,) {final _that = this;
switch (_that) {
case _ValidateResponseModel():
return $default(_that.isDuplicateLogin,_that.existingDeviceToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'isDuplicateLogin')  bool isDuplicateLogin, @JsonKey(name: 'existingDeviceToken')  String? existingDeviceToken)?  $default,) {final _that = this;
switch (_that) {
case _ValidateResponseModel() when $default != null:
return $default(_that.isDuplicateLogin,_that.existingDeviceToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ValidateResponseModel implements ValidateResponseModel {
  const _ValidateResponseModel({@JsonKey(name: 'isDuplicateLogin') required this.isDuplicateLogin, @JsonKey(name: 'existingDeviceToken') required this.existingDeviceToken});
  factory _ValidateResponseModel.fromJson(Map<String, dynamic> json) => _$ValidateResponseModelFromJson(json);

@override@JsonKey(name: 'isDuplicateLogin') final  bool isDuplicateLogin;
@override@JsonKey(name: 'existingDeviceToken') final  String? existingDeviceToken;

/// Create a copy of ValidateResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidateResponseModelCopyWith<_ValidateResponseModel> get copyWith => __$ValidateResponseModelCopyWithImpl<_ValidateResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ValidateResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidateResponseModel&&(identical(other.isDuplicateLogin, isDuplicateLogin) || other.isDuplicateLogin == isDuplicateLogin)&&(identical(other.existingDeviceToken, existingDeviceToken) || other.existingDeviceToken == existingDeviceToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isDuplicateLogin,existingDeviceToken);

@override
String toString() {
  return 'ValidateResponseModel(isDuplicateLogin: $isDuplicateLogin, existingDeviceToken: $existingDeviceToken)';
}


}

/// @nodoc
abstract mixin class _$ValidateResponseModelCopyWith<$Res> implements $ValidateResponseModelCopyWith<$Res> {
  factory _$ValidateResponseModelCopyWith(_ValidateResponseModel value, $Res Function(_ValidateResponseModel) _then) = __$ValidateResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'isDuplicateLogin') bool isDuplicateLogin,@JsonKey(name: 'existingDeviceToken') String? existingDeviceToken
});




}
/// @nodoc
class __$ValidateResponseModelCopyWithImpl<$Res>
    implements _$ValidateResponseModelCopyWith<$Res> {
  __$ValidateResponseModelCopyWithImpl(this._self, this._then);

  final _ValidateResponseModel _self;
  final $Res Function(_ValidateResponseModel) _then;

/// Create a copy of ValidateResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isDuplicateLogin = null,Object? existingDeviceToken = freezed,}) {
  return _then(_ValidateResponseModel(
isDuplicateLogin: null == isDuplicateLogin ? _self.isDuplicateLogin : isDuplicateLogin // ignore: cast_nullable_to_non_nullable
as bool,existingDeviceToken: freezed == existingDeviceToken ? _self.existingDeviceToken : existingDeviceToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LoginModel {

 String get username; String get password; String get userType; String get tenantId; String get scope;@JsonKey(name: 'grant_type') String get grantType;
/// Create a copy of LoginModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginModelCopyWith<LoginModel> get copyWith => _$LoginModelCopyWithImpl<LoginModel>(this as LoginModel, _$identity);

  /// Serializes this LoginModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginModel&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.grantType, grantType) || other.grantType == grantType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password,userType,tenantId,scope,grantType);

@override
String toString() {
  return 'LoginModel(username: $username, password: $password, userType: $userType, tenantId: $tenantId, scope: $scope, grantType: $grantType)';
}


}

/// @nodoc
abstract mixin class $LoginModelCopyWith<$Res>  {
  factory $LoginModelCopyWith(LoginModel value, $Res Function(LoginModel) _then) = _$LoginModelCopyWithImpl;
@useResult
$Res call({
 String username, String password, String userType, String tenantId, String scope,@JsonKey(name: 'grant_type') String grantType
});




}
/// @nodoc
class _$LoginModelCopyWithImpl<$Res>
    implements $LoginModelCopyWith<$Res> {
  _$LoginModelCopyWithImpl(this._self, this._then);

  final LoginModel _self;
  final $Res Function(LoginModel) _then;

/// Create a copy of LoginModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? password = null,Object? userType = null,Object? tenantId = null,Object? scope = null,Object? grantType = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,grantType: null == grantType ? _self.grantType : grantType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginModel].
extension LoginModelPatterns on LoginModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginModel value)  $default,){
final _that = this;
switch (_that) {
case _LoginModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginModel value)?  $default,){
final _that = this;
switch (_that) {
case _LoginModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String password,  String userType,  String tenantId,  String scope, @JsonKey(name: 'grant_type')  String grantType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginModel() when $default != null:
return $default(_that.username,_that.password,_that.userType,_that.tenantId,_that.scope,_that.grantType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String password,  String userType,  String tenantId,  String scope, @JsonKey(name: 'grant_type')  String grantType)  $default,) {final _that = this;
switch (_that) {
case _LoginModel():
return $default(_that.username,_that.password,_that.userType,_that.tenantId,_that.scope,_that.grantType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String password,  String userType,  String tenantId,  String scope, @JsonKey(name: 'grant_type')  String grantType)?  $default,) {final _that = this;
switch (_that) {
case _LoginModel() when $default != null:
return $default(_that.username,_that.password,_that.userType,_that.tenantId,_that.scope,_that.grantType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginModel implements LoginModel {
  const _LoginModel({required this.username, required this.password, this.userType = 'EMPLOYEE', required this.tenantId, this.scope = 'read', @JsonKey(name: 'grant_type') this.grantType = 'password'});
  factory _LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

@override final  String username;
@override final  String password;
@override@JsonKey() final  String userType;
@override final  String tenantId;
@override@JsonKey() final  String scope;
@override@JsonKey(name: 'grant_type') final  String grantType;

/// Create a copy of LoginModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginModelCopyWith<_LoginModel> get copyWith => __$LoginModelCopyWithImpl<_LoginModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginModel&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.grantType, grantType) || other.grantType == grantType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password,userType,tenantId,scope,grantType);

@override
String toString() {
  return 'LoginModel(username: $username, password: $password, userType: $userType, tenantId: $tenantId, scope: $scope, grantType: $grantType)';
}


}

/// @nodoc
abstract mixin class _$LoginModelCopyWith<$Res> implements $LoginModelCopyWith<$Res> {
  factory _$LoginModelCopyWith(_LoginModel value, $Res Function(_LoginModel) _then) = __$LoginModelCopyWithImpl;
@override @useResult
$Res call({
 String username, String password, String userType, String tenantId, String scope,@JsonKey(name: 'grant_type') String grantType
});




}
/// @nodoc
class __$LoginModelCopyWithImpl<$Res>
    implements _$LoginModelCopyWith<$Res> {
  __$LoginModelCopyWithImpl(this._self, this._then);

  final _LoginModel _self;
  final $Res Function(_LoginModel) _then;

/// Create a copy of LoginModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,Object? userType = null,Object? tenantId = null,Object? scope = null,Object? grantType = null,}) {
  return _then(_LoginModel(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,grantType: null == grantType ? _self.grantType : grantType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserRequestModel {

 int? get id; String get uuid; String? get userName; String? get name; String? get mobileNumber; String? get emailId; String? get locale; bool? get active; String? get tenantId; String? get permanentCity; String? get gender; List<UserRoleModel> get roles;
/// Create a copy of UserRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRequestModelCopyWith<UserRequestModel> get copyWith => _$UserRequestModelCopyWithImpl<UserRequestModel>(this as UserRequestModel, _$identity);

  /// Serializes this UserRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.name, name) || other.name == name)&&(identical(other.mobileNumber, mobileNumber) || other.mobileNumber == mobileNumber)&&(identical(other.emailId, emailId) || other.emailId == emailId)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.active, active) || other.active == active)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.permanentCity, permanentCity) || other.permanentCity == permanentCity)&&(identical(other.gender, gender) || other.gender == gender)&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uuid,userName,name,mobileNumber,emailId,locale,active,tenantId,permanentCity,gender,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'UserRequestModel(id: $id, uuid: $uuid, userName: $userName, name: $name, mobileNumber: $mobileNumber, emailId: $emailId, locale: $locale, active: $active, tenantId: $tenantId, permanentCity: $permanentCity, gender: $gender, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $UserRequestModelCopyWith<$Res>  {
  factory $UserRequestModelCopyWith(UserRequestModel value, $Res Function(UserRequestModel) _then) = _$UserRequestModelCopyWithImpl;
@useResult
$Res call({
 int? id, String uuid, String? userName, String? name, String? mobileNumber, String? emailId, String? locale, bool? active, String? tenantId, String? permanentCity, String? gender, List<UserRoleModel> roles
});




}
/// @nodoc
class _$UserRequestModelCopyWithImpl<$Res>
    implements $UserRequestModelCopyWith<$Res> {
  _$UserRequestModelCopyWithImpl(this._self, this._then);

  final UserRequestModel _self;
  final $Res Function(UserRequestModel) _then;

/// Create a copy of UserRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uuid = null,Object? userName = freezed,Object? name = freezed,Object? mobileNumber = freezed,Object? emailId = freezed,Object? locale = freezed,Object? active = freezed,Object? tenantId = freezed,Object? permanentCity = freezed,Object? gender = freezed,Object? roles = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,mobileNumber: freezed == mobileNumber ? _self.mobileNumber : mobileNumber // ignore: cast_nullable_to_non_nullable
as String?,emailId: freezed == emailId ? _self.emailId : emailId // ignore: cast_nullable_to_non_nullable
as String?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,permanentCity: freezed == permanentCity ? _self.permanentCity : permanentCity // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<UserRoleModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserRequestModel].
extension UserRequestModelPatterns on UserRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserRequestModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _UserRequestModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserRequestModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String uuid,  String? userName,  String? name,  String? mobileNumber,  String? emailId,  String? locale,  bool? active,  String? tenantId,  String? permanentCity,  String? gender,  List<UserRoleModel> roles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserRequestModel() when $default != null:
return $default(_that.id,_that.uuid,_that.userName,_that.name,_that.mobileNumber,_that.emailId,_that.locale,_that.active,_that.tenantId,_that.permanentCity,_that.gender,_that.roles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String uuid,  String? userName,  String? name,  String? mobileNumber,  String? emailId,  String? locale,  bool? active,  String? tenantId,  String? permanentCity,  String? gender,  List<UserRoleModel> roles)  $default,) {final _that = this;
switch (_that) {
case _UserRequestModel():
return $default(_that.id,_that.uuid,_that.userName,_that.name,_that.mobileNumber,_that.emailId,_that.locale,_that.active,_that.tenantId,_that.permanentCity,_that.gender,_that.roles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String uuid,  String? userName,  String? name,  String? mobileNumber,  String? emailId,  String? locale,  bool? active,  String? tenantId,  String? permanentCity,  String? gender,  List<UserRoleModel> roles)?  $default,) {final _that = this;
switch (_that) {
case _UserRequestModel() when $default != null:
return $default(_that.id,_that.uuid,_that.userName,_that.name,_that.mobileNumber,_that.emailId,_that.locale,_that.active,_that.tenantId,_that.permanentCity,_that.gender,_that.roles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserRequestModel implements UserRequestModel {
  const _UserRequestModel({this.id, required this.uuid, this.userName, this.name, this.mobileNumber, this.emailId, this.locale, this.active, this.tenantId, this.permanentCity, this.gender, final  List<UserRoleModel> roles = const []}): _roles = roles;
  factory _UserRequestModel.fromJson(Map<String, dynamic> json) => _$UserRequestModelFromJson(json);

@override final  int? id;
@override final  String uuid;
@override final  String? userName;
@override final  String? name;
@override final  String? mobileNumber;
@override final  String? emailId;
@override final  String? locale;
@override final  bool? active;
@override final  String? tenantId;
@override final  String? permanentCity;
@override final  String? gender;
 final  List<UserRoleModel> _roles;
@override@JsonKey() List<UserRoleModel> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}


/// Create a copy of UserRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRequestModelCopyWith<_UserRequestModel> get copyWith => __$UserRequestModelCopyWithImpl<_UserRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.name, name) || other.name == name)&&(identical(other.mobileNumber, mobileNumber) || other.mobileNumber == mobileNumber)&&(identical(other.emailId, emailId) || other.emailId == emailId)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.active, active) || other.active == active)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.permanentCity, permanentCity) || other.permanentCity == permanentCity)&&(identical(other.gender, gender) || other.gender == gender)&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uuid,userName,name,mobileNumber,emailId,locale,active,tenantId,permanentCity,gender,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'UserRequestModel(id: $id, uuid: $uuid, userName: $userName, name: $name, mobileNumber: $mobileNumber, emailId: $emailId, locale: $locale, active: $active, tenantId: $tenantId, permanentCity: $permanentCity, gender: $gender, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$UserRequestModelCopyWith<$Res> implements $UserRequestModelCopyWith<$Res> {
  factory _$UserRequestModelCopyWith(_UserRequestModel value, $Res Function(_UserRequestModel) _then) = __$UserRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String uuid, String? userName, String? name, String? mobileNumber, String? emailId, String? locale, bool? active, String? tenantId, String? permanentCity, String? gender, List<UserRoleModel> roles
});




}
/// @nodoc
class __$UserRequestModelCopyWithImpl<$Res>
    implements _$UserRequestModelCopyWith<$Res> {
  __$UserRequestModelCopyWithImpl(this._self, this._then);

  final _UserRequestModel _self;
  final $Res Function(_UserRequestModel) _then;

/// Create a copy of UserRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uuid = null,Object? userName = freezed,Object? name = freezed,Object? mobileNumber = freezed,Object? emailId = freezed,Object? locale = freezed,Object? active = freezed,Object? tenantId = freezed,Object? permanentCity = freezed,Object? gender = freezed,Object? roles = null,}) {
  return _then(_UserRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,mobileNumber: freezed == mobileNumber ? _self.mobileNumber : mobileNumber // ignore: cast_nullable_to_non_nullable
as String?,emailId: freezed == emailId ? _self.emailId : emailId // ignore: cast_nullable_to_non_nullable
as String?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,permanentCity: freezed == permanentCity ? _self.permanentCity : permanentCity // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<UserRoleModel>,
  ));
}


}


/// @nodoc
mixin _$UserRoleModel {

 String? get name; String get code; String? get tenantId;
/// Create a copy of UserRoleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRoleModelCopyWith<UserRoleModel> get copyWith => _$UserRoleModelCopyWithImpl<UserRoleModel>(this as UserRoleModel, _$identity);

  /// Serializes this UserRoleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRoleModel&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,tenantId);

@override
String toString() {
  return 'UserRoleModel(name: $name, code: $code, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $UserRoleModelCopyWith<$Res>  {
  factory $UserRoleModelCopyWith(UserRoleModel value, $Res Function(UserRoleModel) _then) = _$UserRoleModelCopyWithImpl;
@useResult
$Res call({
 String? name, String code, String? tenantId
});




}
/// @nodoc
class _$UserRoleModelCopyWithImpl<$Res>
    implements $UserRoleModelCopyWith<$Res> {
  _$UserRoleModelCopyWithImpl(this._self, this._then);

  final UserRoleModel _self;
  final $Res Function(UserRoleModel) _then;

/// Create a copy of UserRoleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? code = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserRoleModel].
extension UserRoleModelPatterns on UserRoleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserRoleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserRoleModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserRoleModel value)  $default,){
final _that = this;
switch (_that) {
case _UserRoleModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserRoleModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserRoleModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String code,  String? tenantId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserRoleModel() when $default != null:
return $default(_that.name,_that.code,_that.tenantId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String code,  String? tenantId)  $default,) {final _that = this;
switch (_that) {
case _UserRoleModel():
return $default(_that.name,_that.code,_that.tenantId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String code,  String? tenantId)?  $default,) {final _that = this;
switch (_that) {
case _UserRoleModel() when $default != null:
return $default(_that.name,_that.code,_that.tenantId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserRoleModel implements UserRoleModel {
  const _UserRoleModel({this.name = '', required this.code, this.tenantId});
  factory _UserRoleModel.fromJson(Map<String, dynamic> json) => _$UserRoleModelFromJson(json);

@override@JsonKey() final  String? name;
@override final  String code;
@override final  String? tenantId;

/// Create a copy of UserRoleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRoleModelCopyWith<_UserRoleModel> get copyWith => __$UserRoleModelCopyWithImpl<_UserRoleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRoleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRoleModel&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,tenantId);

@override
String toString() {
  return 'UserRoleModel(name: $name, code: $code, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$UserRoleModelCopyWith<$Res> implements $UserRoleModelCopyWith<$Res> {
  factory _$UserRoleModelCopyWith(_UserRoleModel value, $Res Function(_UserRoleModel) _then) = __$UserRoleModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String code, String? tenantId
});




}
/// @nodoc
class __$UserRoleModelCopyWithImpl<$Res>
    implements _$UserRoleModelCopyWith<$Res> {
  __$UserRoleModelCopyWithImpl(this._self, this._then);

  final _UserRoleModel _self;
  final $Res Function(_UserRoleModel) _then;

/// Create a copy of UserRoleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? code = null,Object? tenantId = freezed,}) {
  return _then(_UserRoleModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestInfoMapperModel {

 RequestInfoModel? get requestInfo;
/// Create a copy of RequestInfoMapperModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestInfoMapperModelCopyWith<RequestInfoMapperModel> get copyWith => _$RequestInfoMapperModelCopyWithImpl<RequestInfoMapperModel>(this as RequestInfoMapperModel, _$identity);

  /// Serializes this RequestInfoMapperModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestInfoMapperModel&&(identical(other.requestInfo, requestInfo) || other.requestInfo == requestInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestInfo);

@override
String toString() {
  return 'RequestInfoMapperModel(requestInfo: $requestInfo)';
}


}

/// @nodoc
abstract mixin class $RequestInfoMapperModelCopyWith<$Res>  {
  factory $RequestInfoMapperModelCopyWith(RequestInfoMapperModel value, $Res Function(RequestInfoMapperModel) _then) = _$RequestInfoMapperModelCopyWithImpl;
@useResult
$Res call({
 RequestInfoModel? requestInfo
});


$RequestInfoModelCopyWith<$Res>? get requestInfo;

}
/// @nodoc
class _$RequestInfoMapperModelCopyWithImpl<$Res>
    implements $RequestInfoMapperModelCopyWith<$Res> {
  _$RequestInfoMapperModelCopyWithImpl(this._self, this._then);

  final RequestInfoMapperModel _self;
  final $Res Function(RequestInfoMapperModel) _then;

/// Create a copy of RequestInfoMapperModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestInfo = freezed,}) {
  return _then(_self.copyWith(
requestInfo: freezed == requestInfo ? _self.requestInfo : requestInfo // ignore: cast_nullable_to_non_nullable
as RequestInfoModel?,
  ));
}
/// Create a copy of RequestInfoMapperModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestInfoModelCopyWith<$Res>? get requestInfo {
    if (_self.requestInfo == null) {
    return null;
  }

  return $RequestInfoModelCopyWith<$Res>(_self.requestInfo!, (value) {
    return _then(_self.copyWith(requestInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [RequestInfoMapperModel].
extension RequestInfoMapperModelPatterns on RequestInfoMapperModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestInfoMapperModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestInfoMapperModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestInfoMapperModel value)  $default,){
final _that = this;
switch (_that) {
case _RequestInfoMapperModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestInfoMapperModel value)?  $default,){
final _that = this;
switch (_that) {
case _RequestInfoMapperModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RequestInfoModel? requestInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestInfoMapperModel() when $default != null:
return $default(_that.requestInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RequestInfoModel? requestInfo)  $default,) {final _that = this;
switch (_that) {
case _RequestInfoMapperModel():
return $default(_that.requestInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RequestInfoModel? requestInfo)?  $default,) {final _that = this;
switch (_that) {
case _RequestInfoMapperModel() when $default != null:
return $default(_that.requestInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestInfoMapperModel implements RequestInfoMapperModel {
  const _RequestInfoMapperModel({this.requestInfo});
  factory _RequestInfoMapperModel.fromJson(Map<String, dynamic> json) => _$RequestInfoMapperModelFromJson(json);

@override final  RequestInfoModel? requestInfo;

/// Create a copy of RequestInfoMapperModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestInfoMapperModelCopyWith<_RequestInfoMapperModel> get copyWith => __$RequestInfoMapperModelCopyWithImpl<_RequestInfoMapperModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestInfoMapperModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestInfoMapperModel&&(identical(other.requestInfo, requestInfo) || other.requestInfo == requestInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestInfo);

@override
String toString() {
  return 'RequestInfoMapperModel(requestInfo: $requestInfo)';
}


}

/// @nodoc
abstract mixin class _$RequestInfoMapperModelCopyWith<$Res> implements $RequestInfoMapperModelCopyWith<$Res> {
  factory _$RequestInfoMapperModelCopyWith(_RequestInfoMapperModel value, $Res Function(_RequestInfoMapperModel) _then) = __$RequestInfoMapperModelCopyWithImpl;
@override @useResult
$Res call({
 RequestInfoModel? requestInfo
});


@override $RequestInfoModelCopyWith<$Res>? get requestInfo;

}
/// @nodoc
class __$RequestInfoMapperModelCopyWithImpl<$Res>
    implements _$RequestInfoMapperModelCopyWith<$Res> {
  __$RequestInfoMapperModelCopyWithImpl(this._self, this._then);

  final _RequestInfoMapperModel _self;
  final $Res Function(_RequestInfoMapperModel) _then;

/// Create a copy of RequestInfoMapperModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestInfo = freezed,}) {
  return _then(_RequestInfoMapperModel(
requestInfo: freezed == requestInfo ? _self.requestInfo : requestInfo // ignore: cast_nullable_to_non_nullable
as RequestInfoModel?,
  ));
}

/// Create a copy of RequestInfoMapperModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestInfoModelCopyWith<$Res>? get requestInfo {
    if (_self.requestInfo == null) {
    return null;
  }

  return $RequestInfoModelCopyWith<$Res>(_self.requestInfo!, (value) {
    return _then(_self.copyWith(requestInfo: value));
  });
}
}


/// @nodoc
mixin _$RequestInfoModel {

 String? get apiId; String? get ver; num? get ts; String? get action; String? get did; String? get key; String? get msgId; String? get authToken; UserRequestModel? get userInfo; String? get tenantId;
/// Create a copy of RequestInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestInfoModelCopyWith<RequestInfoModel> get copyWith => _$RequestInfoModelCopyWithImpl<RequestInfoModel>(this as RequestInfoModel, _$identity);

  /// Serializes this RequestInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestInfoModel&&(identical(other.apiId, apiId) || other.apiId == apiId)&&(identical(other.ver, ver) || other.ver == ver)&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.action, action) || other.action == action)&&(identical(other.did, did) || other.did == did)&&(identical(other.key, key) || other.key == key)&&(identical(other.msgId, msgId) || other.msgId == msgId)&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,apiId,ver,ts,action,did,key,msgId,authToken,userInfo,tenantId);

@override
String toString() {
  return 'RequestInfoModel(apiId: $apiId, ver: $ver, ts: $ts, action: $action, did: $did, key: $key, msgId: $msgId, authToken: $authToken, userInfo: $userInfo, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $RequestInfoModelCopyWith<$Res>  {
  factory $RequestInfoModelCopyWith(RequestInfoModel value, $Res Function(RequestInfoModel) _then) = _$RequestInfoModelCopyWithImpl;
@useResult
$Res call({
 String? apiId, String? ver, num? ts, String? action, String? did, String? key, String? msgId, String? authToken, UserRequestModel? userInfo, String? tenantId
});


$UserRequestModelCopyWith<$Res>? get userInfo;

}
/// @nodoc
class _$RequestInfoModelCopyWithImpl<$Res>
    implements $RequestInfoModelCopyWith<$Res> {
  _$RequestInfoModelCopyWithImpl(this._self, this._then);

  final RequestInfoModel _self;
  final $Res Function(RequestInfoModel) _then;

/// Create a copy of RequestInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apiId = freezed,Object? ver = freezed,Object? ts = freezed,Object? action = freezed,Object? did = freezed,Object? key = freezed,Object? msgId = freezed,Object? authToken = freezed,Object? userInfo = freezed,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
apiId: freezed == apiId ? _self.apiId : apiId // ignore: cast_nullable_to_non_nullable
as String?,ver: freezed == ver ? _self.ver : ver // ignore: cast_nullable_to_non_nullable
as String?,ts: freezed == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as num?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String?,did: freezed == did ? _self.did : did // ignore: cast_nullable_to_non_nullable
as String?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,msgId: freezed == msgId ? _self.msgId : msgId // ignore: cast_nullable_to_non_nullable
as String?,authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String?,userInfo: freezed == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as UserRequestModel?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RequestInfoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserRequestModelCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
    return null;
  }

  return $UserRequestModelCopyWith<$Res>(_self.userInfo!, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [RequestInfoModel].
extension RequestInfoModelPatterns on RequestInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _RequestInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _RequestInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? apiId,  String? ver,  num? ts,  String? action,  String? did,  String? key,  String? msgId,  String? authToken,  UserRequestModel? userInfo,  String? tenantId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestInfoModel() when $default != null:
return $default(_that.apiId,_that.ver,_that.ts,_that.action,_that.did,_that.key,_that.msgId,_that.authToken,_that.userInfo,_that.tenantId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? apiId,  String? ver,  num? ts,  String? action,  String? did,  String? key,  String? msgId,  String? authToken,  UserRequestModel? userInfo,  String? tenantId)  $default,) {final _that = this;
switch (_that) {
case _RequestInfoModel():
return $default(_that.apiId,_that.ver,_that.ts,_that.action,_that.did,_that.key,_that.msgId,_that.authToken,_that.userInfo,_that.tenantId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? apiId,  String? ver,  num? ts,  String? action,  String? did,  String? key,  String? msgId,  String? authToken,  UserRequestModel? userInfo,  String? tenantId)?  $default,) {final _that = this;
switch (_that) {
case _RequestInfoModel() when $default != null:
return $default(_that.apiId,_that.ver,_that.ts,_that.action,_that.did,_that.key,_that.msgId,_that.authToken,_that.userInfo,_that.tenantId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _RequestInfoModel implements RequestInfoModel {
  const _RequestInfoModel({this.apiId, this.ver, this.ts, this.action, this.did, this.key, this.msgId, this.authToken, this.userInfo, this.tenantId});
  factory _RequestInfoModel.fromJson(Map<String, dynamic> json) => _$RequestInfoModelFromJson(json);

@override final  String? apiId;
@override final  String? ver;
@override final  num? ts;
@override final  String? action;
@override final  String? did;
@override final  String? key;
@override final  String? msgId;
@override final  String? authToken;
@override final  UserRequestModel? userInfo;
@override final  String? tenantId;

/// Create a copy of RequestInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestInfoModelCopyWith<_RequestInfoModel> get copyWith => __$RequestInfoModelCopyWithImpl<_RequestInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestInfoModel&&(identical(other.apiId, apiId) || other.apiId == apiId)&&(identical(other.ver, ver) || other.ver == ver)&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.action, action) || other.action == action)&&(identical(other.did, did) || other.did == did)&&(identical(other.key, key) || other.key == key)&&(identical(other.msgId, msgId) || other.msgId == msgId)&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,apiId,ver,ts,action,did,key,msgId,authToken,userInfo,tenantId);

@override
String toString() {
  return 'RequestInfoModel(apiId: $apiId, ver: $ver, ts: $ts, action: $action, did: $did, key: $key, msgId: $msgId, authToken: $authToken, userInfo: $userInfo, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$RequestInfoModelCopyWith<$Res> implements $RequestInfoModelCopyWith<$Res> {
  factory _$RequestInfoModelCopyWith(_RequestInfoModel value, $Res Function(_RequestInfoModel) _then) = __$RequestInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String? apiId, String? ver, num? ts, String? action, String? did, String? key, String? msgId, String? authToken, UserRequestModel? userInfo, String? tenantId
});


@override $UserRequestModelCopyWith<$Res>? get userInfo;

}
/// @nodoc
class __$RequestInfoModelCopyWithImpl<$Res>
    implements _$RequestInfoModelCopyWith<$Res> {
  __$RequestInfoModelCopyWithImpl(this._self, this._then);

  final _RequestInfoModel _self;
  final $Res Function(_RequestInfoModel) _then;

/// Create a copy of RequestInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apiId = freezed,Object? ver = freezed,Object? ts = freezed,Object? action = freezed,Object? did = freezed,Object? key = freezed,Object? msgId = freezed,Object? authToken = freezed,Object? userInfo = freezed,Object? tenantId = freezed,}) {
  return _then(_RequestInfoModel(
apiId: freezed == apiId ? _self.apiId : apiId // ignore: cast_nullable_to_non_nullable
as String?,ver: freezed == ver ? _self.ver : ver // ignore: cast_nullable_to_non_nullable
as String?,ts: freezed == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as num?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String?,did: freezed == did ? _self.did : did // ignore: cast_nullable_to_non_nullable
as String?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,msgId: freezed == msgId ? _self.msgId : msgId // ignore: cast_nullable_to_non_nullable
as String?,authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String?,userInfo: freezed == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as UserRequestModel?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RequestInfoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserRequestModelCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
    return null;
  }

  return $UserRequestModelCopyWith<$Res>(_self.userInfo!, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}
}

// dart format on

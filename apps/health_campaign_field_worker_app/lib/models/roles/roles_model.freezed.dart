// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'roles_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RolesWrapperModel {

 String get tenantId; String get moduleName; List<RolesModel> get roles;
/// Create a copy of RolesWrapperModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RolesWrapperModelCopyWith<RolesWrapperModel> get copyWith => _$RolesWrapperModelCopyWithImpl<RolesWrapperModel>(this as RolesWrapperModel, _$identity);

  /// Serializes this RolesWrapperModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RolesWrapperModel&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.moduleName, moduleName) || other.moduleName == moduleName)&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,moduleName,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'RolesWrapperModel(tenantId: $tenantId, moduleName: $moduleName, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $RolesWrapperModelCopyWith<$Res>  {
  factory $RolesWrapperModelCopyWith(RolesWrapperModel value, $Res Function(RolesWrapperModel) _then) = _$RolesWrapperModelCopyWithImpl;
@useResult
$Res call({
 String tenantId, String moduleName, List<RolesModel> roles
});




}
/// @nodoc
class _$RolesWrapperModelCopyWithImpl<$Res>
    implements $RolesWrapperModelCopyWith<$Res> {
  _$RolesWrapperModelCopyWithImpl(this._self, this._then);

  final RolesWrapperModel _self;
  final $Res Function(RolesWrapperModel) _then;

/// Create a copy of RolesWrapperModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantId = null,Object? moduleName = null,Object? roles = null,}) {
  return _then(_self.copyWith(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,moduleName: null == moduleName ? _self.moduleName : moduleName // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<RolesModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [RolesWrapperModel].
extension RolesWrapperModelPatterns on RolesWrapperModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RolesWrapperModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RolesWrapperModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RolesWrapperModel value)  $default,){
final _that = this;
switch (_that) {
case _RolesWrapperModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RolesWrapperModel value)?  $default,){
final _that = this;
switch (_that) {
case _RolesWrapperModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tenantId,  String moduleName,  List<RolesModel> roles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RolesWrapperModel() when $default != null:
return $default(_that.tenantId,_that.moduleName,_that.roles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tenantId,  String moduleName,  List<RolesModel> roles)  $default,) {final _that = this;
switch (_that) {
case _RolesWrapperModel():
return $default(_that.tenantId,_that.moduleName,_that.roles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tenantId,  String moduleName,  List<RolesModel> roles)?  $default,) {final _that = this;
switch (_that) {
case _RolesWrapperModel() when $default != null:
return $default(_that.tenantId,_that.moduleName,_that.roles);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _RolesWrapperModel implements RolesWrapperModel {
  const _RolesWrapperModel({required this.tenantId, required this.moduleName, final  List<RolesModel> roles = const []}): _roles = roles;
  factory _RolesWrapperModel.fromJson(Map<String, dynamic> json) => _$RolesWrapperModelFromJson(json);

@override final  String tenantId;
@override final  String moduleName;
 final  List<RolesModel> _roles;
@override@JsonKey() List<RolesModel> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}


/// Create a copy of RolesWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RolesWrapperModelCopyWith<_RolesWrapperModel> get copyWith => __$RolesWrapperModelCopyWithImpl<_RolesWrapperModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RolesWrapperModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RolesWrapperModel&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.moduleName, moduleName) || other.moduleName == moduleName)&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,moduleName,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'RolesWrapperModel(tenantId: $tenantId, moduleName: $moduleName, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$RolesWrapperModelCopyWith<$Res> implements $RolesWrapperModelCopyWith<$Res> {
  factory _$RolesWrapperModelCopyWith(_RolesWrapperModel value, $Res Function(_RolesWrapperModel) _then) = __$RolesWrapperModelCopyWithImpl;
@override @useResult
$Res call({
 String tenantId, String moduleName, List<RolesModel> roles
});




}
/// @nodoc
class __$RolesWrapperModelCopyWithImpl<$Res>
    implements _$RolesWrapperModelCopyWith<$Res> {
  __$RolesWrapperModelCopyWithImpl(this._self, this._then);

  final _RolesWrapperModel _self;
  final $Res Function(_RolesWrapperModel) _then;

/// Create a copy of RolesWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantId = null,Object? moduleName = null,Object? roles = null,}) {
  return _then(_RolesWrapperModel(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,moduleName: null == moduleName ? _self.moduleName : moduleName // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<RolesModel>,
  ));
}


}


/// @nodoc
mixin _$RolesModel {

 Code get code; String get name; String? get description;
/// Create a copy of RolesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RolesModelCopyWith<RolesModel> get copyWith => _$RolesModelCopyWithImpl<RolesModel>(this as RolesModel, _$identity);

  /// Serializes this RolesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RolesModel&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,description);

@override
String toString() {
  return 'RolesModel(code: $code, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $RolesModelCopyWith<$Res>  {
  factory $RolesModelCopyWith(RolesModel value, $Res Function(RolesModel) _then) = _$RolesModelCopyWithImpl;
@useResult
$Res call({
 Code code, String name, String? description
});




}
/// @nodoc
class _$RolesModelCopyWithImpl<$Res>
    implements $RolesModelCopyWith<$Res> {
  _$RolesModelCopyWithImpl(this._self, this._then);

  final RolesModel _self;
  final $Res Function(RolesModel) _then;

/// Create a copy of RolesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as Code,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RolesModel].
extension RolesModelPatterns on RolesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RolesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RolesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RolesModel value)  $default,){
final _that = this;
switch (_that) {
case _RolesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RolesModel value)?  $default,){
final _that = this;
switch (_that) {
case _RolesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Code code,  String name,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RolesModel() when $default != null:
return $default(_that.code,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Code code,  String name,  String? description)  $default,) {final _that = this;
switch (_that) {
case _RolesModel():
return $default(_that.code,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Code code,  String name,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _RolesModel() when $default != null:
return $default(_that.code,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RolesModel implements RolesModel {
  const _RolesModel({required this.code, required this.name, this.description});
  factory _RolesModel.fromJson(Map<String, dynamic> json) => _$RolesModelFromJson(json);

@override final  Code code;
@override final  String name;
@override final  String? description;

/// Create a copy of RolesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RolesModelCopyWith<_RolesModel> get copyWith => __$RolesModelCopyWithImpl<_RolesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RolesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RolesModel&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,description);

@override
String toString() {
  return 'RolesModel(code: $code, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$RolesModelCopyWith<$Res> implements $RolesModelCopyWith<$Res> {
  factory _$RolesModelCopyWith(_RolesModel value, $Res Function(_RolesModel) _then) = __$RolesModelCopyWithImpl;
@override @useResult
$Res call({
 Code code, String name, String? description
});




}
/// @nodoc
class __$RolesModelCopyWithImpl<$Res>
    implements _$RolesModelCopyWith<$Res> {
  __$RolesModelCopyWithImpl(this._self, this._then);

  final _RolesModel _self;
  final $Res Function(_RolesModel) _then;

/// Create a copy of RolesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? description = freezed,}) {
  return _then(_RolesModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as Code,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

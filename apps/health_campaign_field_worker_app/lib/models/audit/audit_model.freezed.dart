// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditDetailsModel {

 String get createdBy; int get createdTime; String? get lastModifiedBy; String? get lastModifiedTime;
/// Create a copy of AuditDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditDetailsModelCopyWith<AuditDetailsModel> get copyWith => _$AuditDetailsModelCopyWithImpl<AuditDetailsModel>(this as AuditDetailsModel, _$identity);

  /// Serializes this AuditDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditDetailsModel&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdTime, createdTime) || other.createdTime == createdTime)&&(identical(other.lastModifiedBy, lastModifiedBy) || other.lastModifiedBy == lastModifiedBy)&&(identical(other.lastModifiedTime, lastModifiedTime) || other.lastModifiedTime == lastModifiedTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdBy,createdTime,lastModifiedBy,lastModifiedTime);

@override
String toString() {
  return 'AuditDetailsModel(createdBy: $createdBy, createdTime: $createdTime, lastModifiedBy: $lastModifiedBy, lastModifiedTime: $lastModifiedTime)';
}


}

/// @nodoc
abstract mixin class $AuditDetailsModelCopyWith<$Res>  {
  factory $AuditDetailsModelCopyWith(AuditDetailsModel value, $Res Function(AuditDetailsModel) _then) = _$AuditDetailsModelCopyWithImpl;
@useResult
$Res call({
 String createdBy, int createdTime, String? lastModifiedBy, String? lastModifiedTime
});




}
/// @nodoc
class _$AuditDetailsModelCopyWithImpl<$Res>
    implements $AuditDetailsModelCopyWith<$Res> {
  _$AuditDetailsModelCopyWithImpl(this._self, this._then);

  final AuditDetailsModel _self;
  final $Res Function(AuditDetailsModel) _then;

/// Create a copy of AuditDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdBy = null,Object? createdTime = null,Object? lastModifiedBy = freezed,Object? lastModifiedTime = freezed,}) {
  return _then(_self.copyWith(
createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdTime: null == createdTime ? _self.createdTime : createdTime // ignore: cast_nullable_to_non_nullable
as int,lastModifiedBy: freezed == lastModifiedBy ? _self.lastModifiedBy : lastModifiedBy // ignore: cast_nullable_to_non_nullable
as String?,lastModifiedTime: freezed == lastModifiedTime ? _self.lastModifiedTime : lastModifiedTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditDetailsModel].
extension AuditDetailsModelPatterns on AuditDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _AuditDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuditDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String createdBy,  int createdTime,  String? lastModifiedBy,  String? lastModifiedTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditDetailsModel() when $default != null:
return $default(_that.createdBy,_that.createdTime,_that.lastModifiedBy,_that.lastModifiedTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String createdBy,  int createdTime,  String? lastModifiedBy,  String? lastModifiedTime)  $default,) {final _that = this;
switch (_that) {
case _AuditDetailsModel():
return $default(_that.createdBy,_that.createdTime,_that.lastModifiedBy,_that.lastModifiedTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String createdBy,  int createdTime,  String? lastModifiedBy,  String? lastModifiedTime)?  $default,) {final _that = this;
switch (_that) {
case _AuditDetailsModel() when $default != null:
return $default(_that.createdBy,_that.createdTime,_that.lastModifiedBy,_that.lastModifiedTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuditDetailsModel implements AuditDetailsModel {
  const _AuditDetailsModel({required this.createdBy, required this.createdTime, this.lastModifiedBy, this.lastModifiedTime});
  factory _AuditDetailsModel.fromJson(Map<String, dynamic> json) => _$AuditDetailsModelFromJson(json);

@override final  String createdBy;
@override final  int createdTime;
@override final  String? lastModifiedBy;
@override final  String? lastModifiedTime;

/// Create a copy of AuditDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditDetailsModelCopyWith<_AuditDetailsModel> get copyWith => __$AuditDetailsModelCopyWithImpl<_AuditDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuditDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditDetailsModel&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdTime, createdTime) || other.createdTime == createdTime)&&(identical(other.lastModifiedBy, lastModifiedBy) || other.lastModifiedBy == lastModifiedBy)&&(identical(other.lastModifiedTime, lastModifiedTime) || other.lastModifiedTime == lastModifiedTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdBy,createdTime,lastModifiedBy,lastModifiedTime);

@override
String toString() {
  return 'AuditDetailsModel(createdBy: $createdBy, createdTime: $createdTime, lastModifiedBy: $lastModifiedBy, lastModifiedTime: $lastModifiedTime)';
}


}

/// @nodoc
abstract mixin class _$AuditDetailsModelCopyWith<$Res> implements $AuditDetailsModelCopyWith<$Res> {
  factory _$AuditDetailsModelCopyWith(_AuditDetailsModel value, $Res Function(_AuditDetailsModel) _then) = __$AuditDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 String createdBy, int createdTime, String? lastModifiedBy, String? lastModifiedTime
});




}
/// @nodoc
class __$AuditDetailsModelCopyWithImpl<$Res>
    implements _$AuditDetailsModelCopyWith<$Res> {
  __$AuditDetailsModelCopyWithImpl(this._self, this._then);

  final _AuditDetailsModel _self;
  final $Res Function(_AuditDetailsModel) _then;

/// Create a copy of AuditDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdBy = null,Object? createdTime = null,Object? lastModifiedBy = freezed,Object? lastModifiedTime = freezed,}) {
  return _then(_AuditDetailsModel(
createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdTime: null == createdTime ? _self.createdTime : createdTime // ignore: cast_nullable_to_non_nullable
as int,lastModifiedBy: freezed == lastModifiedBy ? _self.lastModifiedBy : lastModifiedBy // ignore: cast_nullable_to_non_nullable
as String?,lastModifiedTime: freezed == lastModifiedTime ? _self.lastModifiedTime : lastModifiedTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_reasons_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferralReasonsWrapperModel {

@JsonKey(name: 'referralReasons') List<ReferralReasonType>? get referralReasonList;
/// Create a copy of ReferralReasonsWrapperModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralReasonsWrapperModelCopyWith<ReferralReasonsWrapperModel> get copyWith => _$ReferralReasonsWrapperModelCopyWithImpl<ReferralReasonsWrapperModel>(this as ReferralReasonsWrapperModel, _$identity);

  /// Serializes this ReferralReasonsWrapperModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralReasonsWrapperModel&&const DeepCollectionEquality().equals(other.referralReasonList, referralReasonList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(referralReasonList));

@override
String toString() {
  return 'ReferralReasonsWrapperModel(referralReasonList: $referralReasonList)';
}


}

/// @nodoc
abstract mixin class $ReferralReasonsWrapperModelCopyWith<$Res>  {
  factory $ReferralReasonsWrapperModelCopyWith(ReferralReasonsWrapperModel value, $Res Function(ReferralReasonsWrapperModel) _then) = _$ReferralReasonsWrapperModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'referralReasons') List<ReferralReasonType>? referralReasonList
});




}
/// @nodoc
class _$ReferralReasonsWrapperModelCopyWithImpl<$Res>
    implements $ReferralReasonsWrapperModelCopyWith<$Res> {
  _$ReferralReasonsWrapperModelCopyWithImpl(this._self, this._then);

  final ReferralReasonsWrapperModel _self;
  final $Res Function(ReferralReasonsWrapperModel) _then;

/// Create a copy of ReferralReasonsWrapperModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? referralReasonList = freezed,}) {
  return _then(_self.copyWith(
referralReasonList: freezed == referralReasonList ? _self.referralReasonList : referralReasonList // ignore: cast_nullable_to_non_nullable
as List<ReferralReasonType>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferralReasonsWrapperModel].
extension ReferralReasonsWrapperModelPatterns on ReferralReasonsWrapperModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralReasonsWrapperModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralReasonsWrapperModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralReasonsWrapperModel value)  $default,){
final _that = this;
switch (_that) {
case _ReferralReasonsWrapperModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralReasonsWrapperModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralReasonsWrapperModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'referralReasons')  List<ReferralReasonType>? referralReasonList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralReasonsWrapperModel() when $default != null:
return $default(_that.referralReasonList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'referralReasons')  List<ReferralReasonType>? referralReasonList)  $default,) {final _that = this;
switch (_that) {
case _ReferralReasonsWrapperModel():
return $default(_that.referralReasonList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'referralReasons')  List<ReferralReasonType>? referralReasonList)?  $default,) {final _that = this;
switch (_that) {
case _ReferralReasonsWrapperModel() when $default != null:
return $default(_that.referralReasonList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralReasonsWrapperModel implements ReferralReasonsWrapperModel {
  const _ReferralReasonsWrapperModel({@JsonKey(name: 'referralReasons') final  List<ReferralReasonType>? referralReasonList}): _referralReasonList = referralReasonList;
  factory _ReferralReasonsWrapperModel.fromJson(Map<String, dynamic> json) => _$ReferralReasonsWrapperModelFromJson(json);

 final  List<ReferralReasonType>? _referralReasonList;
@override@JsonKey(name: 'referralReasons') List<ReferralReasonType>? get referralReasonList {
  final value = _referralReasonList;
  if (value == null) return null;
  if (_referralReasonList is EqualUnmodifiableListView) return _referralReasonList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ReferralReasonsWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralReasonsWrapperModelCopyWith<_ReferralReasonsWrapperModel> get copyWith => __$ReferralReasonsWrapperModelCopyWithImpl<_ReferralReasonsWrapperModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferralReasonsWrapperModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralReasonsWrapperModel&&const DeepCollectionEquality().equals(other._referralReasonList, _referralReasonList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_referralReasonList));

@override
String toString() {
  return 'ReferralReasonsWrapperModel(referralReasonList: $referralReasonList)';
}


}

/// @nodoc
abstract mixin class _$ReferralReasonsWrapperModelCopyWith<$Res> implements $ReferralReasonsWrapperModelCopyWith<$Res> {
  factory _$ReferralReasonsWrapperModelCopyWith(_ReferralReasonsWrapperModel value, $Res Function(_ReferralReasonsWrapperModel) _then) = __$ReferralReasonsWrapperModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'referralReasons') List<ReferralReasonType>? referralReasonList
});




}
/// @nodoc
class __$ReferralReasonsWrapperModelCopyWithImpl<$Res>
    implements _$ReferralReasonsWrapperModelCopyWith<$Res> {
  __$ReferralReasonsWrapperModelCopyWithImpl(this._self, this._then);

  final _ReferralReasonsWrapperModel _self;
  final $Res Function(_ReferralReasonsWrapperModel) _then;

/// Create a copy of ReferralReasonsWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? referralReasonList = freezed,}) {
  return _then(_ReferralReasonsWrapperModel(
referralReasonList: freezed == referralReasonList ? _self._referralReasonList : referralReasonList // ignore: cast_nullable_to_non_nullable
as List<ReferralReasonType>?,
  ));
}


}


/// @nodoc
mixin _$ReferralReasonType {

 String get code; String get name; bool get active;
/// Create a copy of ReferralReasonType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralReasonTypeCopyWith<ReferralReasonType> get copyWith => _$ReferralReasonTypeCopyWithImpl<ReferralReasonType>(this as ReferralReasonType, _$identity);

  /// Serializes this ReferralReasonType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralReasonType&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,active);

@override
String toString() {
  return 'ReferralReasonType(code: $code, name: $name, active: $active)';
}


}

/// @nodoc
abstract mixin class $ReferralReasonTypeCopyWith<$Res>  {
  factory $ReferralReasonTypeCopyWith(ReferralReasonType value, $Res Function(ReferralReasonType) _then) = _$ReferralReasonTypeCopyWithImpl;
@useResult
$Res call({
 String code, String name, bool active
});




}
/// @nodoc
class _$ReferralReasonTypeCopyWithImpl<$Res>
    implements $ReferralReasonTypeCopyWith<$Res> {
  _$ReferralReasonTypeCopyWithImpl(this._self, this._then);

  final ReferralReasonType _self;
  final $Res Function(ReferralReasonType) _then;

/// Create a copy of ReferralReasonType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? active = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferralReasonType].
extension ReferralReasonTypePatterns on ReferralReasonType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralReasonType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralReasonType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralReasonType value)  $default,){
final _that = this;
switch (_that) {
case _ReferralReasonType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralReasonType value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralReasonType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralReasonType() when $default != null:
return $default(_that.code,_that.name,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name,  bool active)  $default,) {final _that = this;
switch (_that) {
case _ReferralReasonType():
return $default(_that.code,_that.name,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _ReferralReasonType() when $default != null:
return $default(_that.code,_that.name,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralReasonType implements ReferralReasonType {
  const _ReferralReasonType({required this.code, required this.name, required this.active});
  factory _ReferralReasonType.fromJson(Map<String, dynamic> json) => _$ReferralReasonTypeFromJson(json);

@override final  String code;
@override final  String name;
@override final  bool active;

/// Create a copy of ReferralReasonType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralReasonTypeCopyWith<_ReferralReasonType> get copyWith => __$ReferralReasonTypeCopyWithImpl<_ReferralReasonType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferralReasonTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralReasonType&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,active);

@override
String toString() {
  return 'ReferralReasonType(code: $code, name: $name, active: $active)';
}


}

/// @nodoc
abstract mixin class _$ReferralReasonTypeCopyWith<$Res> implements $ReferralReasonTypeCopyWith<$Res> {
  factory _$ReferralReasonTypeCopyWith(_ReferralReasonType value, $Res Function(_ReferralReasonType) _then) = __$ReferralReasonTypeCopyWithImpl;
@override @useResult
$Res call({
 String code, String name, bool active
});




}
/// @nodoc
class __$ReferralReasonTypeCopyWithImpl<$Res>
    implements _$ReferralReasonTypeCopyWith<$Res> {
  __$ReferralReasonTypeCopyWithImpl(this._self, this._then);

  final _ReferralReasonType _self;
  final $Res Function(_ReferralReasonType) _then;

/// Create a copy of ReferralReasonType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? active = null,}) {
  return _then(_ReferralReasonType(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

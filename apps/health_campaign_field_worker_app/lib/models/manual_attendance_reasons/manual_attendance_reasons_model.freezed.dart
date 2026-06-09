// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manual_attendance_reasons_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManualAttendanceReasonsWrapperModel {

@JsonKey(name: 'manualAttendanceReasons') List<ManualAttendanceReasonType>? get manualAttendanceReasons;
/// Create a copy of ManualAttendanceReasonsWrapperModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManualAttendanceReasonsWrapperModelCopyWith<ManualAttendanceReasonsWrapperModel> get copyWith => _$ManualAttendanceReasonsWrapperModelCopyWithImpl<ManualAttendanceReasonsWrapperModel>(this as ManualAttendanceReasonsWrapperModel, _$identity);

  /// Serializes this ManualAttendanceReasonsWrapperModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManualAttendanceReasonsWrapperModel&&const DeepCollectionEquality().equals(other.manualAttendanceReasons, manualAttendanceReasons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(manualAttendanceReasons));

@override
String toString() {
  return 'ManualAttendanceReasonsWrapperModel(manualAttendanceReasons: $manualAttendanceReasons)';
}


}

/// @nodoc
abstract mixin class $ManualAttendanceReasonsWrapperModelCopyWith<$Res>  {
  factory $ManualAttendanceReasonsWrapperModelCopyWith(ManualAttendanceReasonsWrapperModel value, $Res Function(ManualAttendanceReasonsWrapperModel) _then) = _$ManualAttendanceReasonsWrapperModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'manualAttendanceReasons') List<ManualAttendanceReasonType>? manualAttendanceReasons
});




}
/// @nodoc
class _$ManualAttendanceReasonsWrapperModelCopyWithImpl<$Res>
    implements $ManualAttendanceReasonsWrapperModelCopyWith<$Res> {
  _$ManualAttendanceReasonsWrapperModelCopyWithImpl(this._self, this._then);

  final ManualAttendanceReasonsWrapperModel _self;
  final $Res Function(ManualAttendanceReasonsWrapperModel) _then;

/// Create a copy of ManualAttendanceReasonsWrapperModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? manualAttendanceReasons = freezed,}) {
  return _then(_self.copyWith(
manualAttendanceReasons: freezed == manualAttendanceReasons ? _self.manualAttendanceReasons : manualAttendanceReasons // ignore: cast_nullable_to_non_nullable
as List<ManualAttendanceReasonType>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ManualAttendanceReasonsWrapperModel].
extension ManualAttendanceReasonsWrapperModelPatterns on ManualAttendanceReasonsWrapperModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManualAttendanceReasonsWrapperModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManualAttendanceReasonsWrapperModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManualAttendanceReasonsWrapperModel value)  $default,){
final _that = this;
switch (_that) {
case _ManualAttendanceReasonsWrapperModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManualAttendanceReasonsWrapperModel value)?  $default,){
final _that = this;
switch (_that) {
case _ManualAttendanceReasonsWrapperModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'manualAttendanceReasons')  List<ManualAttendanceReasonType>? manualAttendanceReasons)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManualAttendanceReasonsWrapperModel() when $default != null:
return $default(_that.manualAttendanceReasons);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'manualAttendanceReasons')  List<ManualAttendanceReasonType>? manualAttendanceReasons)  $default,) {final _that = this;
switch (_that) {
case _ManualAttendanceReasonsWrapperModel():
return $default(_that.manualAttendanceReasons);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'manualAttendanceReasons')  List<ManualAttendanceReasonType>? manualAttendanceReasons)?  $default,) {final _that = this;
switch (_that) {
case _ManualAttendanceReasonsWrapperModel() when $default != null:
return $default(_that.manualAttendanceReasons);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManualAttendanceReasonsWrapperModel implements ManualAttendanceReasonsWrapperModel {
  const _ManualAttendanceReasonsWrapperModel({@JsonKey(name: 'manualAttendanceReasons') final  List<ManualAttendanceReasonType>? manualAttendanceReasons}): _manualAttendanceReasons = manualAttendanceReasons;
  factory _ManualAttendanceReasonsWrapperModel.fromJson(Map<String, dynamic> json) => _$ManualAttendanceReasonsWrapperModelFromJson(json);

 final  List<ManualAttendanceReasonType>? _manualAttendanceReasons;
@override@JsonKey(name: 'manualAttendanceReasons') List<ManualAttendanceReasonType>? get manualAttendanceReasons {
  final value = _manualAttendanceReasons;
  if (value == null) return null;
  if (_manualAttendanceReasons is EqualUnmodifiableListView) return _manualAttendanceReasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ManualAttendanceReasonsWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManualAttendanceReasonsWrapperModelCopyWith<_ManualAttendanceReasonsWrapperModel> get copyWith => __$ManualAttendanceReasonsWrapperModelCopyWithImpl<_ManualAttendanceReasonsWrapperModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManualAttendanceReasonsWrapperModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManualAttendanceReasonsWrapperModel&&const DeepCollectionEquality().equals(other._manualAttendanceReasons, _manualAttendanceReasons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_manualAttendanceReasons));

@override
String toString() {
  return 'ManualAttendanceReasonsWrapperModel(manualAttendanceReasons: $manualAttendanceReasons)';
}


}

/// @nodoc
abstract mixin class _$ManualAttendanceReasonsWrapperModelCopyWith<$Res> implements $ManualAttendanceReasonsWrapperModelCopyWith<$Res> {
  factory _$ManualAttendanceReasonsWrapperModelCopyWith(_ManualAttendanceReasonsWrapperModel value, $Res Function(_ManualAttendanceReasonsWrapperModel) _then) = __$ManualAttendanceReasonsWrapperModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'manualAttendanceReasons') List<ManualAttendanceReasonType>? manualAttendanceReasons
});




}
/// @nodoc
class __$ManualAttendanceReasonsWrapperModelCopyWithImpl<$Res>
    implements _$ManualAttendanceReasonsWrapperModelCopyWith<$Res> {
  __$ManualAttendanceReasonsWrapperModelCopyWithImpl(this._self, this._then);

  final _ManualAttendanceReasonsWrapperModel _self;
  final $Res Function(_ManualAttendanceReasonsWrapperModel) _then;

/// Create a copy of ManualAttendanceReasonsWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? manualAttendanceReasons = freezed,}) {
  return _then(_ManualAttendanceReasonsWrapperModel(
manualAttendanceReasons: freezed == manualAttendanceReasons ? _self._manualAttendanceReasons : manualAttendanceReasons // ignore: cast_nullable_to_non_nullable
as List<ManualAttendanceReasonType>?,
  ));
}


}


/// @nodoc
mixin _$ManualAttendanceReasonType {

 String get code; String get name; bool get active;
/// Create a copy of ManualAttendanceReasonType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManualAttendanceReasonTypeCopyWith<ManualAttendanceReasonType> get copyWith => _$ManualAttendanceReasonTypeCopyWithImpl<ManualAttendanceReasonType>(this as ManualAttendanceReasonType, _$identity);

  /// Serializes this ManualAttendanceReasonType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManualAttendanceReasonType&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,active);

@override
String toString() {
  return 'ManualAttendanceReasonType(code: $code, name: $name, active: $active)';
}


}

/// @nodoc
abstract mixin class $ManualAttendanceReasonTypeCopyWith<$Res>  {
  factory $ManualAttendanceReasonTypeCopyWith(ManualAttendanceReasonType value, $Res Function(ManualAttendanceReasonType) _then) = _$ManualAttendanceReasonTypeCopyWithImpl;
@useResult
$Res call({
 String code, String name, bool active
});




}
/// @nodoc
class _$ManualAttendanceReasonTypeCopyWithImpl<$Res>
    implements $ManualAttendanceReasonTypeCopyWith<$Res> {
  _$ManualAttendanceReasonTypeCopyWithImpl(this._self, this._then);

  final ManualAttendanceReasonType _self;
  final $Res Function(ManualAttendanceReasonType) _then;

/// Create a copy of ManualAttendanceReasonType
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


/// Adds pattern-matching-related methods to [ManualAttendanceReasonType].
extension ManualAttendanceReasonTypePatterns on ManualAttendanceReasonType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManualAttendanceReasonType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManualAttendanceReasonType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManualAttendanceReasonType value)  $default,){
final _that = this;
switch (_that) {
case _ManualAttendanceReasonType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManualAttendanceReasonType value)?  $default,){
final _that = this;
switch (_that) {
case _ManualAttendanceReasonType() when $default != null:
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
case _ManualAttendanceReasonType() when $default != null:
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
case _ManualAttendanceReasonType():
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
case _ManualAttendanceReasonType() when $default != null:
return $default(_that.code,_that.name,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManualAttendanceReasonType implements ManualAttendanceReasonType {
  const _ManualAttendanceReasonType({required this.code, required this.name, required this.active});
  factory _ManualAttendanceReasonType.fromJson(Map<String, dynamic> json) => _$ManualAttendanceReasonTypeFromJson(json);

@override final  String code;
@override final  String name;
@override final  bool active;

/// Create a copy of ManualAttendanceReasonType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManualAttendanceReasonTypeCopyWith<_ManualAttendanceReasonType> get copyWith => __$ManualAttendanceReasonTypeCopyWithImpl<_ManualAttendanceReasonType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManualAttendanceReasonTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManualAttendanceReasonType&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,active);

@override
String toString() {
  return 'ManualAttendanceReasonType(code: $code, name: $name, active: $active)';
}


}

/// @nodoc
abstract mixin class _$ManualAttendanceReasonTypeCopyWith<$Res> implements $ManualAttendanceReasonTypeCopyWith<$Res> {
  factory _$ManualAttendanceReasonTypeCopyWith(_ManualAttendanceReasonType value, $Res Function(_ManualAttendanceReasonType) _then) = __$ManualAttendanceReasonTypeCopyWithImpl;
@override @useResult
$Res call({
 String code, String name, bool active
});




}
/// @nodoc
class __$ManualAttendanceReasonTypeCopyWithImpl<$Res>
    implements _$ManualAttendanceReasonTypeCopyWith<$Res> {
  __$ManualAttendanceReasonTypeCopyWithImpl(this._self, this._then);

  final _ManualAttendanceReasonType _self;
  final $Res Function(_ManualAttendanceReasonType) _then;

/// Create a copy of ManualAttendanceReasonType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? active = null,}) {
  return _then(_ManualAttendanceReasonType(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

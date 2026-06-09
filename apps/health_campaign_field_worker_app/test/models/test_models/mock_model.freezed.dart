// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mock_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MockDataModel {

 String get id;
/// Create a copy of MockDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MockDataModelCopyWith<MockDataModel> get copyWith => _$MockDataModelCopyWithImpl<MockDataModel>(this as MockDataModel, _$identity);

  /// Serializes this MockDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MockDataModel&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'MockDataModel(id: $id)';
}


}

/// @nodoc
abstract mixin class $MockDataModelCopyWith<$Res>  {
  factory $MockDataModelCopyWith(MockDataModel value, $Res Function(MockDataModel) _then) = _$MockDataModelCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$MockDataModelCopyWithImpl<$Res>
    implements $MockDataModelCopyWith<$Res> {
  _$MockDataModelCopyWithImpl(this._self, this._then);

  final MockDataModel _self;
  final $Res Function(MockDataModel) _then;

/// Create a copy of MockDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MockDataModel].
extension MockDataModelPatterns on MockDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MockDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MockDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MockDataModel value)  $default,){
final _that = this;
switch (_that) {
case _MockDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MockDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _MockDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MockDataModel() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id)  $default,) {final _that = this;
switch (_that) {
case _MockDataModel():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id)?  $default,) {final _that = this;
switch (_that) {
case _MockDataModel() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MockDataModel implements MockDataModel {
  const _MockDataModel({required this.id});
  factory _MockDataModel.fromJson(Map<String, dynamic> json) => _$MockDataModelFromJson(json);

@override final  String id;

/// Create a copy of MockDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MockDataModelCopyWith<_MockDataModel> get copyWith => __$MockDataModelCopyWithImpl<_MockDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MockDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MockDataModel&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'MockDataModel(id: $id)';
}


}

/// @nodoc
abstract mixin class _$MockDataModelCopyWith<$Res> implements $MockDataModelCopyWith<$Res> {
  factory _$MockDataModelCopyWith(_MockDataModel value, $Res Function(_MockDataModel) _then) = __$MockDataModelCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$MockDataModelCopyWithImpl<$Res>
    implements _$MockDataModelCopyWith<$Res> {
  __$MockDataModelCopyWithImpl(this._self, this._then);

  final _MockDataModel _self;
  final $Res Function(_MockDataModel) _then;

/// Create a copy of MockDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_MockDataModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

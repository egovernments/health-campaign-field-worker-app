// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symptoms_types_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SymptomsTypesPrimaryWrapperModel {

@JsonKey(name: 'HCM-SYMPTOMS-TYPES') SymptomsTypesSecondaryWrapperModel? get symptomsTypes;
/// Create a copy of SymptomsTypesPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SymptomsTypesPrimaryWrapperModelCopyWith<SymptomsTypesPrimaryWrapperModel> get copyWith => _$SymptomsTypesPrimaryWrapperModelCopyWithImpl<SymptomsTypesPrimaryWrapperModel>(this as SymptomsTypesPrimaryWrapperModel, _$identity);

  /// Serializes this SymptomsTypesPrimaryWrapperModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SymptomsTypesPrimaryWrapperModel&&(identical(other.symptomsTypes, symptomsTypes) || other.symptomsTypes == symptomsTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symptomsTypes);

@override
String toString() {
  return 'SymptomsTypesPrimaryWrapperModel(symptomsTypes: $symptomsTypes)';
}


}

/// @nodoc
abstract mixin class $SymptomsTypesPrimaryWrapperModelCopyWith<$Res>  {
  factory $SymptomsTypesPrimaryWrapperModelCopyWith(SymptomsTypesPrimaryWrapperModel value, $Res Function(SymptomsTypesPrimaryWrapperModel) _then) = _$SymptomsTypesPrimaryWrapperModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'HCM-SYMPTOMS-TYPES') SymptomsTypesSecondaryWrapperModel? symptomsTypes
});


$SymptomsTypesSecondaryWrapperModelCopyWith<$Res>? get symptomsTypes;

}
/// @nodoc
class _$SymptomsTypesPrimaryWrapperModelCopyWithImpl<$Res>
    implements $SymptomsTypesPrimaryWrapperModelCopyWith<$Res> {
  _$SymptomsTypesPrimaryWrapperModelCopyWithImpl(this._self, this._then);

  final SymptomsTypesPrimaryWrapperModel _self;
  final $Res Function(SymptomsTypesPrimaryWrapperModel) _then;

/// Create a copy of SymptomsTypesPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symptomsTypes = freezed,}) {
  return _then(_self.copyWith(
symptomsTypes: freezed == symptomsTypes ? _self.symptomsTypes : symptomsTypes // ignore: cast_nullable_to_non_nullable
as SymptomsTypesSecondaryWrapperModel?,
  ));
}
/// Create a copy of SymptomsTypesPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SymptomsTypesSecondaryWrapperModelCopyWith<$Res>? get symptomsTypes {
    if (_self.symptomsTypes == null) {
    return null;
  }

  return $SymptomsTypesSecondaryWrapperModelCopyWith<$Res>(_self.symptomsTypes!, (value) {
    return _then(_self.copyWith(symptomsTypes: value));
  });
}
}


/// Adds pattern-matching-related methods to [SymptomsTypesPrimaryWrapperModel].
extension SymptomsTypesPrimaryWrapperModelPatterns on SymptomsTypesPrimaryWrapperModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SymptomsTypesPrimaryWrapperModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SymptomsTypesPrimaryWrapperModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SymptomsTypesPrimaryWrapperModel value)  $default,){
final _that = this;
switch (_that) {
case _SymptomsTypesPrimaryWrapperModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SymptomsTypesPrimaryWrapperModel value)?  $default,){
final _that = this;
switch (_that) {
case _SymptomsTypesPrimaryWrapperModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'HCM-SYMPTOMS-TYPES')  SymptomsTypesSecondaryWrapperModel? symptomsTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SymptomsTypesPrimaryWrapperModel() when $default != null:
return $default(_that.symptomsTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'HCM-SYMPTOMS-TYPES')  SymptomsTypesSecondaryWrapperModel? symptomsTypes)  $default,) {final _that = this;
switch (_that) {
case _SymptomsTypesPrimaryWrapperModel():
return $default(_that.symptomsTypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'HCM-SYMPTOMS-TYPES')  SymptomsTypesSecondaryWrapperModel? symptomsTypes)?  $default,) {final _that = this;
switch (_that) {
case _SymptomsTypesPrimaryWrapperModel() when $default != null:
return $default(_that.symptomsTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SymptomsTypesPrimaryWrapperModel implements SymptomsTypesPrimaryWrapperModel {
  const _SymptomsTypesPrimaryWrapperModel({@JsonKey(name: 'HCM-SYMPTOMS-TYPES') this.symptomsTypes});
  factory _SymptomsTypesPrimaryWrapperModel.fromJson(Map<String, dynamic> json) => _$SymptomsTypesPrimaryWrapperModelFromJson(json);

@override@JsonKey(name: 'HCM-SYMPTOMS-TYPES') final  SymptomsTypesSecondaryWrapperModel? symptomsTypes;

/// Create a copy of SymptomsTypesPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SymptomsTypesPrimaryWrapperModelCopyWith<_SymptomsTypesPrimaryWrapperModel> get copyWith => __$SymptomsTypesPrimaryWrapperModelCopyWithImpl<_SymptomsTypesPrimaryWrapperModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SymptomsTypesPrimaryWrapperModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SymptomsTypesPrimaryWrapperModel&&(identical(other.symptomsTypes, symptomsTypes) || other.symptomsTypes == symptomsTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symptomsTypes);

@override
String toString() {
  return 'SymptomsTypesPrimaryWrapperModel(symptomsTypes: $symptomsTypes)';
}


}

/// @nodoc
abstract mixin class _$SymptomsTypesPrimaryWrapperModelCopyWith<$Res> implements $SymptomsTypesPrimaryWrapperModelCopyWith<$Res> {
  factory _$SymptomsTypesPrimaryWrapperModelCopyWith(_SymptomsTypesPrimaryWrapperModel value, $Res Function(_SymptomsTypesPrimaryWrapperModel) _then) = __$SymptomsTypesPrimaryWrapperModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'HCM-SYMPTOMS-TYPES') SymptomsTypesSecondaryWrapperModel? symptomsTypes
});


@override $SymptomsTypesSecondaryWrapperModelCopyWith<$Res>? get symptomsTypes;

}
/// @nodoc
class __$SymptomsTypesPrimaryWrapperModelCopyWithImpl<$Res>
    implements _$SymptomsTypesPrimaryWrapperModelCopyWith<$Res> {
  __$SymptomsTypesPrimaryWrapperModelCopyWithImpl(this._self, this._then);

  final _SymptomsTypesPrimaryWrapperModel _self;
  final $Res Function(_SymptomsTypesPrimaryWrapperModel) _then;

/// Create a copy of SymptomsTypesPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symptomsTypes = freezed,}) {
  return _then(_SymptomsTypesPrimaryWrapperModel(
symptomsTypes: freezed == symptomsTypes ? _self.symptomsTypes : symptomsTypes // ignore: cast_nullable_to_non_nullable
as SymptomsTypesSecondaryWrapperModel?,
  ));
}

/// Create a copy of SymptomsTypesPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SymptomsTypesSecondaryWrapperModelCopyWith<$Res>? get symptomsTypes {
    if (_self.symptomsTypes == null) {
    return null;
  }

  return $SymptomsTypesSecondaryWrapperModelCopyWith<$Res>(_self.symptomsTypes!, (value) {
    return _then(_self.copyWith(symptomsTypes: value));
  });
}
}


/// @nodoc
mixin _$SymptomsTypesSecondaryWrapperModel {

@JsonKey(name: 'symptomsTypes') List<SymptomsType>? get symptomsTypeList;
/// Create a copy of SymptomsTypesSecondaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SymptomsTypesSecondaryWrapperModelCopyWith<SymptomsTypesSecondaryWrapperModel> get copyWith => _$SymptomsTypesSecondaryWrapperModelCopyWithImpl<SymptomsTypesSecondaryWrapperModel>(this as SymptomsTypesSecondaryWrapperModel, _$identity);

  /// Serializes this SymptomsTypesSecondaryWrapperModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SymptomsTypesSecondaryWrapperModel&&const DeepCollectionEquality().equals(other.symptomsTypeList, symptomsTypeList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(symptomsTypeList));

@override
String toString() {
  return 'SymptomsTypesSecondaryWrapperModel(symptomsTypeList: $symptomsTypeList)';
}


}

/// @nodoc
abstract mixin class $SymptomsTypesSecondaryWrapperModelCopyWith<$Res>  {
  factory $SymptomsTypesSecondaryWrapperModelCopyWith(SymptomsTypesSecondaryWrapperModel value, $Res Function(SymptomsTypesSecondaryWrapperModel) _then) = _$SymptomsTypesSecondaryWrapperModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'symptomsTypes') List<SymptomsType>? symptomsTypeList
});




}
/// @nodoc
class _$SymptomsTypesSecondaryWrapperModelCopyWithImpl<$Res>
    implements $SymptomsTypesSecondaryWrapperModelCopyWith<$Res> {
  _$SymptomsTypesSecondaryWrapperModelCopyWithImpl(this._self, this._then);

  final SymptomsTypesSecondaryWrapperModel _self;
  final $Res Function(SymptomsTypesSecondaryWrapperModel) _then;

/// Create a copy of SymptomsTypesSecondaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symptomsTypeList = freezed,}) {
  return _then(_self.copyWith(
symptomsTypeList: freezed == symptomsTypeList ? _self.symptomsTypeList : symptomsTypeList // ignore: cast_nullable_to_non_nullable
as List<SymptomsType>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SymptomsTypesSecondaryWrapperModel].
extension SymptomsTypesSecondaryWrapperModelPatterns on SymptomsTypesSecondaryWrapperModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SymptomsTypesSecondaryWrapperModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SymptomsTypesSecondaryWrapperModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SymptomsTypesSecondaryWrapperModel value)  $default,){
final _that = this;
switch (_that) {
case _SymptomsTypesSecondaryWrapperModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SymptomsTypesSecondaryWrapperModel value)?  $default,){
final _that = this;
switch (_that) {
case _SymptomsTypesSecondaryWrapperModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'symptomsTypes')  List<SymptomsType>? symptomsTypeList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SymptomsTypesSecondaryWrapperModel() when $default != null:
return $default(_that.symptomsTypeList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'symptomsTypes')  List<SymptomsType>? symptomsTypeList)  $default,) {final _that = this;
switch (_that) {
case _SymptomsTypesSecondaryWrapperModel():
return $default(_that.symptomsTypeList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'symptomsTypes')  List<SymptomsType>? symptomsTypeList)?  $default,) {final _that = this;
switch (_that) {
case _SymptomsTypesSecondaryWrapperModel() when $default != null:
return $default(_that.symptomsTypeList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SymptomsTypesSecondaryWrapperModel implements SymptomsTypesSecondaryWrapperModel {
  const _SymptomsTypesSecondaryWrapperModel({@JsonKey(name: 'symptomsTypes') final  List<SymptomsType>? symptomsTypeList}): _symptomsTypeList = symptomsTypeList;
  factory _SymptomsTypesSecondaryWrapperModel.fromJson(Map<String, dynamic> json) => _$SymptomsTypesSecondaryWrapperModelFromJson(json);

 final  List<SymptomsType>? _symptomsTypeList;
@override@JsonKey(name: 'symptomsTypes') List<SymptomsType>? get symptomsTypeList {
  final value = _symptomsTypeList;
  if (value == null) return null;
  if (_symptomsTypeList is EqualUnmodifiableListView) return _symptomsTypeList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SymptomsTypesSecondaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SymptomsTypesSecondaryWrapperModelCopyWith<_SymptomsTypesSecondaryWrapperModel> get copyWith => __$SymptomsTypesSecondaryWrapperModelCopyWithImpl<_SymptomsTypesSecondaryWrapperModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SymptomsTypesSecondaryWrapperModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SymptomsTypesSecondaryWrapperModel&&const DeepCollectionEquality().equals(other._symptomsTypeList, _symptomsTypeList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_symptomsTypeList));

@override
String toString() {
  return 'SymptomsTypesSecondaryWrapperModel(symptomsTypeList: $symptomsTypeList)';
}


}

/// @nodoc
abstract mixin class _$SymptomsTypesSecondaryWrapperModelCopyWith<$Res> implements $SymptomsTypesSecondaryWrapperModelCopyWith<$Res> {
  factory _$SymptomsTypesSecondaryWrapperModelCopyWith(_SymptomsTypesSecondaryWrapperModel value, $Res Function(_SymptomsTypesSecondaryWrapperModel) _then) = __$SymptomsTypesSecondaryWrapperModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'symptomsTypes') List<SymptomsType>? symptomsTypeList
});




}
/// @nodoc
class __$SymptomsTypesSecondaryWrapperModelCopyWithImpl<$Res>
    implements _$SymptomsTypesSecondaryWrapperModelCopyWith<$Res> {
  __$SymptomsTypesSecondaryWrapperModelCopyWithImpl(this._self, this._then);

  final _SymptomsTypesSecondaryWrapperModel _self;
  final $Res Function(_SymptomsTypesSecondaryWrapperModel) _then;

/// Create a copy of SymptomsTypesSecondaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symptomsTypeList = freezed,}) {
  return _then(_SymptomsTypesSecondaryWrapperModel(
symptomsTypeList: freezed == symptomsTypeList ? _self._symptomsTypeList : symptomsTypeList // ignore: cast_nullable_to_non_nullable
as List<SymptomsType>?,
  ));
}


}


/// @nodoc
mixin _$SymptomsType {

 String get code; String get name; bool get active;
/// Create a copy of SymptomsType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SymptomsTypeCopyWith<SymptomsType> get copyWith => _$SymptomsTypeCopyWithImpl<SymptomsType>(this as SymptomsType, _$identity);

  /// Serializes this SymptomsType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SymptomsType&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,active);

@override
String toString() {
  return 'SymptomsType(code: $code, name: $name, active: $active)';
}


}

/// @nodoc
abstract mixin class $SymptomsTypeCopyWith<$Res>  {
  factory $SymptomsTypeCopyWith(SymptomsType value, $Res Function(SymptomsType) _then) = _$SymptomsTypeCopyWithImpl;
@useResult
$Res call({
 String code, String name, bool active
});




}
/// @nodoc
class _$SymptomsTypeCopyWithImpl<$Res>
    implements $SymptomsTypeCopyWith<$Res> {
  _$SymptomsTypeCopyWithImpl(this._self, this._then);

  final SymptomsType _self;
  final $Res Function(SymptomsType) _then;

/// Create a copy of SymptomsType
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


/// Adds pattern-matching-related methods to [SymptomsType].
extension SymptomsTypePatterns on SymptomsType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SymptomsType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SymptomsType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SymptomsType value)  $default,){
final _that = this;
switch (_that) {
case _SymptomsType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SymptomsType value)?  $default,){
final _that = this;
switch (_that) {
case _SymptomsType() when $default != null:
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
case _SymptomsType() when $default != null:
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
case _SymptomsType():
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
case _SymptomsType() when $default != null:
return $default(_that.code,_that.name,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SymptomsType implements SymptomsType {
  const _SymptomsType({required this.code, required this.name, required this.active});
  factory _SymptomsType.fromJson(Map<String, dynamic> json) => _$SymptomsTypeFromJson(json);

@override final  String code;
@override final  String name;
@override final  bool active;

/// Create a copy of SymptomsType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SymptomsTypeCopyWith<_SymptomsType> get copyWith => __$SymptomsTypeCopyWithImpl<_SymptomsType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SymptomsTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SymptomsType&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,active);

@override
String toString() {
  return 'SymptomsType(code: $code, name: $name, active: $active)';
}


}

/// @nodoc
abstract mixin class _$SymptomsTypeCopyWith<$Res> implements $SymptomsTypeCopyWith<$Res> {
  factory _$SymptomsTypeCopyWith(_SymptomsType value, $Res Function(_SymptomsType) _then) = __$SymptomsTypeCopyWithImpl;
@override @useResult
$Res call({
 String code, String name, bool active
});




}
/// @nodoc
class __$SymptomsTypeCopyWithImpl<$Res>
    implements _$SymptomsTypeCopyWith<$Res> {
  __$SymptomsTypeCopyWithImpl(this._self, this._then);

  final _SymptomsType _self;
  final $Res Function(_SymptomsType) _then;

/// Create a copy of SymptomsType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? active = null,}) {
  return _then(_SymptomsType(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

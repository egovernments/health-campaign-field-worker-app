// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MdmsRequestModel {

@JsonKey(name: 'MdmsCriteria') MdmsCriteriaModel get mdmsCriteria;
/// Create a copy of MdmsRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MdmsRequestModelCopyWith<MdmsRequestModel> get copyWith => _$MdmsRequestModelCopyWithImpl<MdmsRequestModel>(this as MdmsRequestModel, _$identity);

  /// Serializes this MdmsRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MdmsRequestModel&&(identical(other.mdmsCriteria, mdmsCriteria) || other.mdmsCriteria == mdmsCriteria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mdmsCriteria);

@override
String toString() {
  return 'MdmsRequestModel(mdmsCriteria: $mdmsCriteria)';
}


}

/// @nodoc
abstract mixin class $MdmsRequestModelCopyWith<$Res>  {
  factory $MdmsRequestModelCopyWith(MdmsRequestModel value, $Res Function(MdmsRequestModel) _then) = _$MdmsRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'MdmsCriteria') MdmsCriteriaModel mdmsCriteria
});


$MdmsCriteriaModelCopyWith<$Res> get mdmsCriteria;

}
/// @nodoc
class _$MdmsRequestModelCopyWithImpl<$Res>
    implements $MdmsRequestModelCopyWith<$Res> {
  _$MdmsRequestModelCopyWithImpl(this._self, this._then);

  final MdmsRequestModel _self;
  final $Res Function(MdmsRequestModel) _then;

/// Create a copy of MdmsRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mdmsCriteria = null,}) {
  return _then(_self.copyWith(
mdmsCriteria: null == mdmsCriteria ? _self.mdmsCriteria : mdmsCriteria // ignore: cast_nullable_to_non_nullable
as MdmsCriteriaModel,
  ));
}
/// Create a copy of MdmsRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MdmsCriteriaModelCopyWith<$Res> get mdmsCriteria {
  
  return $MdmsCriteriaModelCopyWith<$Res>(_self.mdmsCriteria, (value) {
    return _then(_self.copyWith(mdmsCriteria: value));
  });
}
}


/// Adds pattern-matching-related methods to [MdmsRequestModel].
extension MdmsRequestModelPatterns on MdmsRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MdmsRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MdmsRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MdmsRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _MdmsRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MdmsRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _MdmsRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'MdmsCriteria')  MdmsCriteriaModel mdmsCriteria)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MdmsRequestModel() when $default != null:
return $default(_that.mdmsCriteria);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'MdmsCriteria')  MdmsCriteriaModel mdmsCriteria)  $default,) {final _that = this;
switch (_that) {
case _MdmsRequestModel():
return $default(_that.mdmsCriteria);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'MdmsCriteria')  MdmsCriteriaModel mdmsCriteria)?  $default,) {final _that = this;
switch (_that) {
case _MdmsRequestModel() when $default != null:
return $default(_that.mdmsCriteria);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MdmsRequestModel implements MdmsRequestModel {
  const _MdmsRequestModel({@JsonKey(name: 'MdmsCriteria') required this.mdmsCriteria});
  factory _MdmsRequestModel.fromJson(Map<String, dynamic> json) => _$MdmsRequestModelFromJson(json);

@override@JsonKey(name: 'MdmsCriteria') final  MdmsCriteriaModel mdmsCriteria;

/// Create a copy of MdmsRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MdmsRequestModelCopyWith<_MdmsRequestModel> get copyWith => __$MdmsRequestModelCopyWithImpl<_MdmsRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MdmsRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MdmsRequestModel&&(identical(other.mdmsCriteria, mdmsCriteria) || other.mdmsCriteria == mdmsCriteria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mdmsCriteria);

@override
String toString() {
  return 'MdmsRequestModel(mdmsCriteria: $mdmsCriteria)';
}


}

/// @nodoc
abstract mixin class _$MdmsRequestModelCopyWith<$Res> implements $MdmsRequestModelCopyWith<$Res> {
  factory _$MdmsRequestModelCopyWith(_MdmsRequestModel value, $Res Function(_MdmsRequestModel) _then) = __$MdmsRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'MdmsCriteria') MdmsCriteriaModel mdmsCriteria
});


@override $MdmsCriteriaModelCopyWith<$Res> get mdmsCriteria;

}
/// @nodoc
class __$MdmsRequestModelCopyWithImpl<$Res>
    implements _$MdmsRequestModelCopyWith<$Res> {
  __$MdmsRequestModelCopyWithImpl(this._self, this._then);

  final _MdmsRequestModel _self;
  final $Res Function(_MdmsRequestModel) _then;

/// Create a copy of MdmsRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mdmsCriteria = null,}) {
  return _then(_MdmsRequestModel(
mdmsCriteria: null == mdmsCriteria ? _self.mdmsCriteria : mdmsCriteria // ignore: cast_nullable_to_non_nullable
as MdmsCriteriaModel,
  ));
}

/// Create a copy of MdmsRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MdmsCriteriaModelCopyWith<$Res> get mdmsCriteria {
  
  return $MdmsCriteriaModelCopyWith<$Res>(_self.mdmsCriteria, (value) {
    return _then(_self.copyWith(mdmsCriteria: value));
  });
}
}


/// @nodoc
mixin _$MdmsCriteriaModel {

 String get tenantId; List<MdmsModuleDetailModel> get moduleDetails;
/// Create a copy of MdmsCriteriaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MdmsCriteriaModelCopyWith<MdmsCriteriaModel> get copyWith => _$MdmsCriteriaModelCopyWithImpl<MdmsCriteriaModel>(this as MdmsCriteriaModel, _$identity);

  /// Serializes this MdmsCriteriaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MdmsCriteriaModel&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&const DeepCollectionEquality().equals(other.moduleDetails, moduleDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,const DeepCollectionEquality().hash(moduleDetails));

@override
String toString() {
  return 'MdmsCriteriaModel(tenantId: $tenantId, moduleDetails: $moduleDetails)';
}


}

/// @nodoc
abstract mixin class $MdmsCriteriaModelCopyWith<$Res>  {
  factory $MdmsCriteriaModelCopyWith(MdmsCriteriaModel value, $Res Function(MdmsCriteriaModel) _then) = _$MdmsCriteriaModelCopyWithImpl;
@useResult
$Res call({
 String tenantId, List<MdmsModuleDetailModel> moduleDetails
});




}
/// @nodoc
class _$MdmsCriteriaModelCopyWithImpl<$Res>
    implements $MdmsCriteriaModelCopyWith<$Res> {
  _$MdmsCriteriaModelCopyWithImpl(this._self, this._then);

  final MdmsCriteriaModel _self;
  final $Res Function(MdmsCriteriaModel) _then;

/// Create a copy of MdmsCriteriaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantId = null,Object? moduleDetails = null,}) {
  return _then(_self.copyWith(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,moduleDetails: null == moduleDetails ? _self.moduleDetails : moduleDetails // ignore: cast_nullable_to_non_nullable
as List<MdmsModuleDetailModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [MdmsCriteriaModel].
extension MdmsCriteriaModelPatterns on MdmsCriteriaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MdmsCriteriaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MdmsCriteriaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MdmsCriteriaModel value)  $default,){
final _that = this;
switch (_that) {
case _MdmsCriteriaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MdmsCriteriaModel value)?  $default,){
final _that = this;
switch (_that) {
case _MdmsCriteriaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tenantId,  List<MdmsModuleDetailModel> moduleDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MdmsCriteriaModel() when $default != null:
return $default(_that.tenantId,_that.moduleDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tenantId,  List<MdmsModuleDetailModel> moduleDetails)  $default,) {final _that = this;
switch (_that) {
case _MdmsCriteriaModel():
return $default(_that.tenantId,_that.moduleDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tenantId,  List<MdmsModuleDetailModel> moduleDetails)?  $default,) {final _that = this;
switch (_that) {
case _MdmsCriteriaModel() when $default != null:
return $default(_that.tenantId,_that.moduleDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MdmsCriteriaModel implements MdmsCriteriaModel {
  const _MdmsCriteriaModel({required this.tenantId, required final  List<MdmsModuleDetailModel> moduleDetails}): _moduleDetails = moduleDetails;
  factory _MdmsCriteriaModel.fromJson(Map<String, dynamic> json) => _$MdmsCriteriaModelFromJson(json);

@override final  String tenantId;
 final  List<MdmsModuleDetailModel> _moduleDetails;
@override List<MdmsModuleDetailModel> get moduleDetails {
  if (_moduleDetails is EqualUnmodifiableListView) return _moduleDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_moduleDetails);
}


/// Create a copy of MdmsCriteriaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MdmsCriteriaModelCopyWith<_MdmsCriteriaModel> get copyWith => __$MdmsCriteriaModelCopyWithImpl<_MdmsCriteriaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MdmsCriteriaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MdmsCriteriaModel&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&const DeepCollectionEquality().equals(other._moduleDetails, _moduleDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,const DeepCollectionEquality().hash(_moduleDetails));

@override
String toString() {
  return 'MdmsCriteriaModel(tenantId: $tenantId, moduleDetails: $moduleDetails)';
}


}

/// @nodoc
abstract mixin class _$MdmsCriteriaModelCopyWith<$Res> implements $MdmsCriteriaModelCopyWith<$Res> {
  factory _$MdmsCriteriaModelCopyWith(_MdmsCriteriaModel value, $Res Function(_MdmsCriteriaModel) _then) = __$MdmsCriteriaModelCopyWithImpl;
@override @useResult
$Res call({
 String tenantId, List<MdmsModuleDetailModel> moduleDetails
});




}
/// @nodoc
class __$MdmsCriteriaModelCopyWithImpl<$Res>
    implements _$MdmsCriteriaModelCopyWith<$Res> {
  __$MdmsCriteriaModelCopyWithImpl(this._self, this._then);

  final _MdmsCriteriaModel _self;
  final $Res Function(_MdmsCriteriaModel) _then;

/// Create a copy of MdmsCriteriaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantId = null,Object? moduleDetails = null,}) {
  return _then(_MdmsCriteriaModel(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,moduleDetails: null == moduleDetails ? _self._moduleDetails : moduleDetails // ignore: cast_nullable_to_non_nullable
as List<MdmsModuleDetailModel>,
  ));
}


}


/// @nodoc
mixin _$MdmsModuleDetailModel {

 String get moduleName; List<MdmsMasterDetailModel> get masterDetails;
/// Create a copy of MdmsModuleDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MdmsModuleDetailModelCopyWith<MdmsModuleDetailModel> get copyWith => _$MdmsModuleDetailModelCopyWithImpl<MdmsModuleDetailModel>(this as MdmsModuleDetailModel, _$identity);

  /// Serializes this MdmsModuleDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MdmsModuleDetailModel&&(identical(other.moduleName, moduleName) || other.moduleName == moduleName)&&const DeepCollectionEquality().equals(other.masterDetails, masterDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,moduleName,const DeepCollectionEquality().hash(masterDetails));

@override
String toString() {
  return 'MdmsModuleDetailModel(moduleName: $moduleName, masterDetails: $masterDetails)';
}


}

/// @nodoc
abstract mixin class $MdmsModuleDetailModelCopyWith<$Res>  {
  factory $MdmsModuleDetailModelCopyWith(MdmsModuleDetailModel value, $Res Function(MdmsModuleDetailModel) _then) = _$MdmsModuleDetailModelCopyWithImpl;
@useResult
$Res call({
 String moduleName, List<MdmsMasterDetailModel> masterDetails
});




}
/// @nodoc
class _$MdmsModuleDetailModelCopyWithImpl<$Res>
    implements $MdmsModuleDetailModelCopyWith<$Res> {
  _$MdmsModuleDetailModelCopyWithImpl(this._self, this._then);

  final MdmsModuleDetailModel _self;
  final $Res Function(MdmsModuleDetailModel) _then;

/// Create a copy of MdmsModuleDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? moduleName = null,Object? masterDetails = null,}) {
  return _then(_self.copyWith(
moduleName: null == moduleName ? _self.moduleName : moduleName // ignore: cast_nullable_to_non_nullable
as String,masterDetails: null == masterDetails ? _self.masterDetails : masterDetails // ignore: cast_nullable_to_non_nullable
as List<MdmsMasterDetailModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [MdmsModuleDetailModel].
extension MdmsModuleDetailModelPatterns on MdmsModuleDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MdmsModuleDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MdmsModuleDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MdmsModuleDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _MdmsModuleDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MdmsModuleDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _MdmsModuleDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String moduleName,  List<MdmsMasterDetailModel> masterDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MdmsModuleDetailModel() when $default != null:
return $default(_that.moduleName,_that.masterDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String moduleName,  List<MdmsMasterDetailModel> masterDetails)  $default,) {final _that = this;
switch (_that) {
case _MdmsModuleDetailModel():
return $default(_that.moduleName,_that.masterDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String moduleName,  List<MdmsMasterDetailModel> masterDetails)?  $default,) {final _that = this;
switch (_that) {
case _MdmsModuleDetailModel() when $default != null:
return $default(_that.moduleName,_that.masterDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MdmsModuleDetailModel implements MdmsModuleDetailModel {
  const _MdmsModuleDetailModel({required this.moduleName, required final  List<MdmsMasterDetailModel> masterDetails}): _masterDetails = masterDetails;
  factory _MdmsModuleDetailModel.fromJson(Map<String, dynamic> json) => _$MdmsModuleDetailModelFromJson(json);

@override final  String moduleName;
 final  List<MdmsMasterDetailModel> _masterDetails;
@override List<MdmsMasterDetailModel> get masterDetails {
  if (_masterDetails is EqualUnmodifiableListView) return _masterDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_masterDetails);
}


/// Create a copy of MdmsModuleDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MdmsModuleDetailModelCopyWith<_MdmsModuleDetailModel> get copyWith => __$MdmsModuleDetailModelCopyWithImpl<_MdmsModuleDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MdmsModuleDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MdmsModuleDetailModel&&(identical(other.moduleName, moduleName) || other.moduleName == moduleName)&&const DeepCollectionEquality().equals(other._masterDetails, _masterDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,moduleName,const DeepCollectionEquality().hash(_masterDetails));

@override
String toString() {
  return 'MdmsModuleDetailModel(moduleName: $moduleName, masterDetails: $masterDetails)';
}


}

/// @nodoc
abstract mixin class _$MdmsModuleDetailModelCopyWith<$Res> implements $MdmsModuleDetailModelCopyWith<$Res> {
  factory _$MdmsModuleDetailModelCopyWith(_MdmsModuleDetailModel value, $Res Function(_MdmsModuleDetailModel) _then) = __$MdmsModuleDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String moduleName, List<MdmsMasterDetailModel> masterDetails
});




}
/// @nodoc
class __$MdmsModuleDetailModelCopyWithImpl<$Res>
    implements _$MdmsModuleDetailModelCopyWith<$Res> {
  __$MdmsModuleDetailModelCopyWithImpl(this._self, this._then);

  final _MdmsModuleDetailModel _self;
  final $Res Function(_MdmsModuleDetailModel) _then;

/// Create a copy of MdmsModuleDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? moduleName = null,Object? masterDetails = null,}) {
  return _then(_MdmsModuleDetailModel(
moduleName: null == moduleName ? _self.moduleName : moduleName // ignore: cast_nullable_to_non_nullable
as String,masterDetails: null == masterDetails ? _self._masterDetails : masterDetails // ignore: cast_nullable_to_non_nullable
as List<MdmsMasterDetailModel>,
  ));
}


}


/// @nodoc
mixin _$MdmsMasterDetailModel {

 String get name; String? get filter;
/// Create a copy of MdmsMasterDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MdmsMasterDetailModelCopyWith<MdmsMasterDetailModel> get copyWith => _$MdmsMasterDetailModelCopyWithImpl<MdmsMasterDetailModel>(this as MdmsMasterDetailModel, _$identity);

  /// Serializes this MdmsMasterDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MdmsMasterDetailModel&&(identical(other.name, name) || other.name == name)&&(identical(other.filter, filter) || other.filter == filter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,filter);

@override
String toString() {
  return 'MdmsMasterDetailModel(name: $name, filter: $filter)';
}


}

/// @nodoc
abstract mixin class $MdmsMasterDetailModelCopyWith<$Res>  {
  factory $MdmsMasterDetailModelCopyWith(MdmsMasterDetailModel value, $Res Function(MdmsMasterDetailModel) _then) = _$MdmsMasterDetailModelCopyWithImpl;
@useResult
$Res call({
 String name, String? filter
});




}
/// @nodoc
class _$MdmsMasterDetailModelCopyWithImpl<$Res>
    implements $MdmsMasterDetailModelCopyWith<$Res> {
  _$MdmsMasterDetailModelCopyWithImpl(this._self, this._then);

  final MdmsMasterDetailModel _self;
  final $Res Function(MdmsMasterDetailModel) _then;

/// Create a copy of MdmsMasterDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? filter = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MdmsMasterDetailModel].
extension MdmsMasterDetailModelPatterns on MdmsMasterDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MdmsMasterDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MdmsMasterDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MdmsMasterDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _MdmsMasterDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MdmsMasterDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _MdmsMasterDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? filter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MdmsMasterDetailModel() when $default != null:
return $default(_that.name,_that.filter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? filter)  $default,) {final _that = this;
switch (_that) {
case _MdmsMasterDetailModel():
return $default(_that.name,_that.filter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? filter)?  $default,) {final _that = this;
switch (_that) {
case _MdmsMasterDetailModel() when $default != null:
return $default(_that.name,_that.filter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MdmsMasterDetailModel implements MdmsMasterDetailModel {
  const _MdmsMasterDetailModel(this.name, {this.filter});
  factory _MdmsMasterDetailModel.fromJson(Map<String, dynamic> json) => _$MdmsMasterDetailModelFromJson(json);

@override final  String name;
@override final  String? filter;

/// Create a copy of MdmsMasterDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MdmsMasterDetailModelCopyWith<_MdmsMasterDetailModel> get copyWith => __$MdmsMasterDetailModelCopyWithImpl<_MdmsMasterDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MdmsMasterDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MdmsMasterDetailModel&&(identical(other.name, name) || other.name == name)&&(identical(other.filter, filter) || other.filter == filter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,filter);

@override
String toString() {
  return 'MdmsMasterDetailModel(name: $name, filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$MdmsMasterDetailModelCopyWith<$Res> implements $MdmsMasterDetailModelCopyWith<$Res> {
  factory _$MdmsMasterDetailModelCopyWith(_MdmsMasterDetailModel value, $Res Function(_MdmsMasterDetailModel) _then) = __$MdmsMasterDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String? filter
});




}
/// @nodoc
class __$MdmsMasterDetailModelCopyWithImpl<$Res>
    implements _$MdmsMasterDetailModelCopyWith<$Res> {
  __$MdmsMasterDetailModelCopyWithImpl(this._self, this._then);

  final _MdmsMasterDetailModel _self;
  final $Res Function(_MdmsMasterDetailModel) _then;

/// Create a copy of MdmsMasterDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? filter = freezed,}) {
  return _then(_MdmsMasterDetailModel(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AppConfigPrimaryWrapperModel {

@JsonKey(name: 'HCM') HCMWrapperModel? get hcmWrapperModel;@JsonKey(name: 'common-masters') CommonMastersWrapperModel? get commonMasters;@JsonKey(name: 'module-version') RowVersionWrapperModel? get rowVersions;
/// Create a copy of AppConfigPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigPrimaryWrapperModelCopyWith<AppConfigPrimaryWrapperModel> get copyWith => _$AppConfigPrimaryWrapperModelCopyWithImpl<AppConfigPrimaryWrapperModel>(this as AppConfigPrimaryWrapperModel, _$identity);

  /// Serializes this AppConfigPrimaryWrapperModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfigPrimaryWrapperModel&&(identical(other.hcmWrapperModel, hcmWrapperModel) || other.hcmWrapperModel == hcmWrapperModel)&&(identical(other.commonMasters, commonMasters) || other.commonMasters == commonMasters)&&(identical(other.rowVersions, rowVersions) || other.rowVersions == rowVersions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hcmWrapperModel,commonMasters,rowVersions);

@override
String toString() {
  return 'AppConfigPrimaryWrapperModel(hcmWrapperModel: $hcmWrapperModel, commonMasters: $commonMasters, rowVersions: $rowVersions)';
}


}

/// @nodoc
abstract mixin class $AppConfigPrimaryWrapperModelCopyWith<$Res>  {
  factory $AppConfigPrimaryWrapperModelCopyWith(AppConfigPrimaryWrapperModel value, $Res Function(AppConfigPrimaryWrapperModel) _then) = _$AppConfigPrimaryWrapperModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'HCM') HCMWrapperModel? hcmWrapperModel,@JsonKey(name: 'common-masters') CommonMastersWrapperModel? commonMasters,@JsonKey(name: 'module-version') RowVersionWrapperModel? rowVersions
});


$HCMWrapperModelCopyWith<$Res>? get hcmWrapperModel;$CommonMastersWrapperModelCopyWith<$Res>? get commonMasters;$RowVersionWrapperModelCopyWith<$Res>? get rowVersions;

}
/// @nodoc
class _$AppConfigPrimaryWrapperModelCopyWithImpl<$Res>
    implements $AppConfigPrimaryWrapperModelCopyWith<$Res> {
  _$AppConfigPrimaryWrapperModelCopyWithImpl(this._self, this._then);

  final AppConfigPrimaryWrapperModel _self;
  final $Res Function(AppConfigPrimaryWrapperModel) _then;

/// Create a copy of AppConfigPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hcmWrapperModel = freezed,Object? commonMasters = freezed,Object? rowVersions = freezed,}) {
  return _then(_self.copyWith(
hcmWrapperModel: freezed == hcmWrapperModel ? _self.hcmWrapperModel : hcmWrapperModel // ignore: cast_nullable_to_non_nullable
as HCMWrapperModel?,commonMasters: freezed == commonMasters ? _self.commonMasters : commonMasters // ignore: cast_nullable_to_non_nullable
as CommonMastersWrapperModel?,rowVersions: freezed == rowVersions ? _self.rowVersions : rowVersions // ignore: cast_nullable_to_non_nullable
as RowVersionWrapperModel?,
  ));
}
/// Create a copy of AppConfigPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HCMWrapperModelCopyWith<$Res>? get hcmWrapperModel {
    if (_self.hcmWrapperModel == null) {
    return null;
  }

  return $HCMWrapperModelCopyWith<$Res>(_self.hcmWrapperModel!, (value) {
    return _then(_self.copyWith(hcmWrapperModel: value));
  });
}/// Create a copy of AppConfigPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommonMastersWrapperModelCopyWith<$Res>? get commonMasters {
    if (_self.commonMasters == null) {
    return null;
  }

  return $CommonMastersWrapperModelCopyWith<$Res>(_self.commonMasters!, (value) {
    return _then(_self.copyWith(commonMasters: value));
  });
}/// Create a copy of AppConfigPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RowVersionWrapperModelCopyWith<$Res>? get rowVersions {
    if (_self.rowVersions == null) {
    return null;
  }

  return $RowVersionWrapperModelCopyWith<$Res>(_self.rowVersions!, (value) {
    return _then(_self.copyWith(rowVersions: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppConfigPrimaryWrapperModel].
extension AppConfigPrimaryWrapperModelPatterns on AppConfigPrimaryWrapperModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfigPrimaryWrapperModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfigPrimaryWrapperModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfigPrimaryWrapperModel value)  $default,){
final _that = this;
switch (_that) {
case _AppConfigPrimaryWrapperModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfigPrimaryWrapperModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfigPrimaryWrapperModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'HCM')  HCMWrapperModel? hcmWrapperModel, @JsonKey(name: 'common-masters')  CommonMastersWrapperModel? commonMasters, @JsonKey(name: 'module-version')  RowVersionWrapperModel? rowVersions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfigPrimaryWrapperModel() when $default != null:
return $default(_that.hcmWrapperModel,_that.commonMasters,_that.rowVersions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'HCM')  HCMWrapperModel? hcmWrapperModel, @JsonKey(name: 'common-masters')  CommonMastersWrapperModel? commonMasters, @JsonKey(name: 'module-version')  RowVersionWrapperModel? rowVersions)  $default,) {final _that = this;
switch (_that) {
case _AppConfigPrimaryWrapperModel():
return $default(_that.hcmWrapperModel,_that.commonMasters,_that.rowVersions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'HCM')  HCMWrapperModel? hcmWrapperModel, @JsonKey(name: 'common-masters')  CommonMastersWrapperModel? commonMasters, @JsonKey(name: 'module-version')  RowVersionWrapperModel? rowVersions)?  $default,) {final _that = this;
switch (_that) {
case _AppConfigPrimaryWrapperModel() when $default != null:
return $default(_that.hcmWrapperModel,_that.commonMasters,_that.rowVersions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppConfigPrimaryWrapperModel implements AppConfigPrimaryWrapperModel {
  const _AppConfigPrimaryWrapperModel({@JsonKey(name: 'HCM') this.hcmWrapperModel, @JsonKey(name: 'common-masters') this.commonMasters, @JsonKey(name: 'module-version') this.rowVersions});
  factory _AppConfigPrimaryWrapperModel.fromJson(Map<String, dynamic> json) => _$AppConfigPrimaryWrapperModelFromJson(json);

@override@JsonKey(name: 'HCM') final  HCMWrapperModel? hcmWrapperModel;
@override@JsonKey(name: 'common-masters') final  CommonMastersWrapperModel? commonMasters;
@override@JsonKey(name: 'module-version') final  RowVersionWrapperModel? rowVersions;

/// Create a copy of AppConfigPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigPrimaryWrapperModelCopyWith<_AppConfigPrimaryWrapperModel> get copyWith => __$AppConfigPrimaryWrapperModelCopyWithImpl<_AppConfigPrimaryWrapperModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppConfigPrimaryWrapperModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfigPrimaryWrapperModel&&(identical(other.hcmWrapperModel, hcmWrapperModel) || other.hcmWrapperModel == hcmWrapperModel)&&(identical(other.commonMasters, commonMasters) || other.commonMasters == commonMasters)&&(identical(other.rowVersions, rowVersions) || other.rowVersions == rowVersions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hcmWrapperModel,commonMasters,rowVersions);

@override
String toString() {
  return 'AppConfigPrimaryWrapperModel(hcmWrapperModel: $hcmWrapperModel, commonMasters: $commonMasters, rowVersions: $rowVersions)';
}


}

/// @nodoc
abstract mixin class _$AppConfigPrimaryWrapperModelCopyWith<$Res> implements $AppConfigPrimaryWrapperModelCopyWith<$Res> {
  factory _$AppConfigPrimaryWrapperModelCopyWith(_AppConfigPrimaryWrapperModel value, $Res Function(_AppConfigPrimaryWrapperModel) _then) = __$AppConfigPrimaryWrapperModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'HCM') HCMWrapperModel? hcmWrapperModel,@JsonKey(name: 'common-masters') CommonMastersWrapperModel? commonMasters,@JsonKey(name: 'module-version') RowVersionWrapperModel? rowVersions
});


@override $HCMWrapperModelCopyWith<$Res>? get hcmWrapperModel;@override $CommonMastersWrapperModelCopyWith<$Res>? get commonMasters;@override $RowVersionWrapperModelCopyWith<$Res>? get rowVersions;

}
/// @nodoc
class __$AppConfigPrimaryWrapperModelCopyWithImpl<$Res>
    implements _$AppConfigPrimaryWrapperModelCopyWith<$Res> {
  __$AppConfigPrimaryWrapperModelCopyWithImpl(this._self, this._then);

  final _AppConfigPrimaryWrapperModel _self;
  final $Res Function(_AppConfigPrimaryWrapperModel) _then;

/// Create a copy of AppConfigPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hcmWrapperModel = freezed,Object? commonMasters = freezed,Object? rowVersions = freezed,}) {
  return _then(_AppConfigPrimaryWrapperModel(
hcmWrapperModel: freezed == hcmWrapperModel ? _self.hcmWrapperModel : hcmWrapperModel // ignore: cast_nullable_to_non_nullable
as HCMWrapperModel?,commonMasters: freezed == commonMasters ? _self.commonMasters : commonMasters // ignore: cast_nullable_to_non_nullable
as CommonMastersWrapperModel?,rowVersions: freezed == rowVersions ? _self.rowVersions : rowVersions // ignore: cast_nullable_to_non_nullable
as RowVersionWrapperModel?,
  ));
}

/// Create a copy of AppConfigPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HCMWrapperModelCopyWith<$Res>? get hcmWrapperModel {
    if (_self.hcmWrapperModel == null) {
    return null;
  }

  return $HCMWrapperModelCopyWith<$Res>(_self.hcmWrapperModel!, (value) {
    return _then(_self.copyWith(hcmWrapperModel: value));
  });
}/// Create a copy of AppConfigPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommonMastersWrapperModelCopyWith<$Res>? get commonMasters {
    if (_self.commonMasters == null) {
    return null;
  }

  return $CommonMastersWrapperModelCopyWith<$Res>(_self.commonMasters!, (value) {
    return _then(_self.copyWith(commonMasters: value));
  });
}/// Create a copy of AppConfigPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RowVersionWrapperModelCopyWith<$Res>? get rowVersions {
    if (_self.rowVersions == null) {
    return null;
  }

  return $RowVersionWrapperModelCopyWith<$Res>(_self.rowVersions!, (value) {
    return _then(_self.copyWith(rowVersions: value));
  });
}
}


/// @nodoc
mixin _$HCMWrapperModel {

@JsonKey(name: 'APP_CONFIG') List<AppConfig> get appConfig;@JsonKey(name: 'BANDWIDTH_BATCH_SIZE') List<BandWidthBatchSize> get bandWidthBatchSize;@JsonKey(name: 'BENEFICIARY_ID_CONFIG') List<BeneficiaryIdConfig> get beneficiaryIdConfig;@JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE') List<BandWidthBatchSize> get downSyncBandWidthBatchSize;@JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS') List<DeletionReasonOptions> get householdDeletionReasonOptions;@JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS') List<DeletionReasonOptions> get householdMemberDeletionReasonOptions;@JsonKey(name: 'BACKGROUND_SERVICE_CONFIG') List<BackgroundServiceConfig>? get backgroundServiceConfig;@JsonKey(name: 'CHECKLIST_TYPES') List<CheckListTypes> get checklistTypes;@JsonKey(name: 'DEVICE_CHANGE_REASONS') List<DeviceChangeReasons> get deviceChangeReasons;@JsonKey(name: 'SINGLE_USER_LOGIN') List<SingleUserLogin> get singleUserLogin;@JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR') List<IdTypeOptions> get idTypeOptions;@JsonKey(name: 'HOUSEHOLD_MEMBER_RELATIONSHIP_TYPES') List<RelationShipTypeOptions> get relationShipTypeOptions;@JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR') List<DeliveryCommentOptions> get deliveryCommentOptions;@JsonKey(name: 'BACKEND_INTERFACE') List<BackendInterface> get backendInterface;@JsonKey(name: 'CALL_SUPPORT') List<CallSupportList>? get callSupportOptions;@JsonKey(name: 'TRANSPORT_TYPES') List<TransportTypes> get transportTypes;@JsonKey(name: 'SYMPTOM_TYPES') List<SymptomsType>? get symptomsTypeList;@JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS') List<SearchHouseHoldFilters>? get searchHouseHoldFilters;@JsonKey(name: 'SEARCH_CLF_FILTERS') List<SearchCLFFilters>? get searchCLFFilters;@JsonKey(name: 'REFERRAL_REASONS') List<ReferralReasonType>? get referralReasonList;@JsonKey(name: 'MANUAL_ATTENDANCE_REASONS') List<ManualAttendanceReasonType>? get manualAttendanceReasonList;@JsonKey(name: 'HOUSE_STRUCTURE_TYPES') List<CommonMasterModel>? get houseStructureTypes;@JsonKey(name: 'REFUSAL_REASONS') List<CommonMasterModel>? get refusalReasons;@JsonKey(name: 'FIREBASE_CONFIG') List<FirebaseConfig>? get firebaseConfig;@JsonKey(name: 'TRANSIT_POST_TYPE') List<TransitPostType>? get transitPostType;@JsonKey(name: 'BOUNDARY_RELATIONSHIP') List<BoundaryRelationship>? get boundaryRelationship;
/// Create a copy of HCMWrapperModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HCMWrapperModelCopyWith<HCMWrapperModel> get copyWith => _$HCMWrapperModelCopyWithImpl<HCMWrapperModel>(this as HCMWrapperModel, _$identity);

  /// Serializes this HCMWrapperModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HCMWrapperModel&&const DeepCollectionEquality().equals(other.appConfig, appConfig)&&const DeepCollectionEquality().equals(other.bandWidthBatchSize, bandWidthBatchSize)&&const DeepCollectionEquality().equals(other.beneficiaryIdConfig, beneficiaryIdConfig)&&const DeepCollectionEquality().equals(other.downSyncBandWidthBatchSize, downSyncBandWidthBatchSize)&&const DeepCollectionEquality().equals(other.householdDeletionReasonOptions, householdDeletionReasonOptions)&&const DeepCollectionEquality().equals(other.householdMemberDeletionReasonOptions, householdMemberDeletionReasonOptions)&&const DeepCollectionEquality().equals(other.backgroundServiceConfig, backgroundServiceConfig)&&const DeepCollectionEquality().equals(other.checklistTypes, checklistTypes)&&const DeepCollectionEquality().equals(other.deviceChangeReasons, deviceChangeReasons)&&const DeepCollectionEquality().equals(other.singleUserLogin, singleUserLogin)&&const DeepCollectionEquality().equals(other.idTypeOptions, idTypeOptions)&&const DeepCollectionEquality().equals(other.relationShipTypeOptions, relationShipTypeOptions)&&const DeepCollectionEquality().equals(other.deliveryCommentOptions, deliveryCommentOptions)&&const DeepCollectionEquality().equals(other.backendInterface, backendInterface)&&const DeepCollectionEquality().equals(other.callSupportOptions, callSupportOptions)&&const DeepCollectionEquality().equals(other.transportTypes, transportTypes)&&const DeepCollectionEquality().equals(other.symptomsTypeList, symptomsTypeList)&&const DeepCollectionEquality().equals(other.searchHouseHoldFilters, searchHouseHoldFilters)&&const DeepCollectionEquality().equals(other.searchCLFFilters, searchCLFFilters)&&const DeepCollectionEquality().equals(other.referralReasonList, referralReasonList)&&const DeepCollectionEquality().equals(other.manualAttendanceReasonList, manualAttendanceReasonList)&&const DeepCollectionEquality().equals(other.houseStructureTypes, houseStructureTypes)&&const DeepCollectionEquality().equals(other.refusalReasons, refusalReasons)&&const DeepCollectionEquality().equals(other.firebaseConfig, firebaseConfig)&&const DeepCollectionEquality().equals(other.transitPostType, transitPostType)&&const DeepCollectionEquality().equals(other.boundaryRelationship, boundaryRelationship));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(appConfig),const DeepCollectionEquality().hash(bandWidthBatchSize),const DeepCollectionEquality().hash(beneficiaryIdConfig),const DeepCollectionEquality().hash(downSyncBandWidthBatchSize),const DeepCollectionEquality().hash(householdDeletionReasonOptions),const DeepCollectionEquality().hash(householdMemberDeletionReasonOptions),const DeepCollectionEquality().hash(backgroundServiceConfig),const DeepCollectionEquality().hash(checklistTypes),const DeepCollectionEquality().hash(deviceChangeReasons),const DeepCollectionEquality().hash(singleUserLogin),const DeepCollectionEquality().hash(idTypeOptions),const DeepCollectionEquality().hash(relationShipTypeOptions),const DeepCollectionEquality().hash(deliveryCommentOptions),const DeepCollectionEquality().hash(backendInterface),const DeepCollectionEquality().hash(callSupportOptions),const DeepCollectionEquality().hash(transportTypes),const DeepCollectionEquality().hash(symptomsTypeList),const DeepCollectionEquality().hash(searchHouseHoldFilters),const DeepCollectionEquality().hash(searchCLFFilters),const DeepCollectionEquality().hash(referralReasonList),const DeepCollectionEquality().hash(manualAttendanceReasonList),const DeepCollectionEquality().hash(houseStructureTypes),const DeepCollectionEquality().hash(refusalReasons),const DeepCollectionEquality().hash(firebaseConfig),const DeepCollectionEquality().hash(transitPostType),const DeepCollectionEquality().hash(boundaryRelationship)]);

@override
String toString() {
  return 'HCMWrapperModel(appConfig: $appConfig, bandWidthBatchSize: $bandWidthBatchSize, beneficiaryIdConfig: $beneficiaryIdConfig, downSyncBandWidthBatchSize: $downSyncBandWidthBatchSize, householdDeletionReasonOptions: $householdDeletionReasonOptions, householdMemberDeletionReasonOptions: $householdMemberDeletionReasonOptions, backgroundServiceConfig: $backgroundServiceConfig, checklistTypes: $checklistTypes, deviceChangeReasons: $deviceChangeReasons, singleUserLogin: $singleUserLogin, idTypeOptions: $idTypeOptions, relationShipTypeOptions: $relationShipTypeOptions, deliveryCommentOptions: $deliveryCommentOptions, backendInterface: $backendInterface, callSupportOptions: $callSupportOptions, transportTypes: $transportTypes, symptomsTypeList: $symptomsTypeList, searchHouseHoldFilters: $searchHouseHoldFilters, searchCLFFilters: $searchCLFFilters, referralReasonList: $referralReasonList, manualAttendanceReasonList: $manualAttendanceReasonList, houseStructureTypes: $houseStructureTypes, refusalReasons: $refusalReasons, firebaseConfig: $firebaseConfig, transitPostType: $transitPostType, boundaryRelationship: $boundaryRelationship)';
}


}

/// @nodoc
abstract mixin class $HCMWrapperModelCopyWith<$Res>  {
  factory $HCMWrapperModelCopyWith(HCMWrapperModel value, $Res Function(HCMWrapperModel) _then) = _$HCMWrapperModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'APP_CONFIG') List<AppConfig> appConfig,@JsonKey(name: 'BANDWIDTH_BATCH_SIZE') List<BandWidthBatchSize> bandWidthBatchSize,@JsonKey(name: 'BENEFICIARY_ID_CONFIG') List<BeneficiaryIdConfig> beneficiaryIdConfig,@JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE') List<BandWidthBatchSize> downSyncBandWidthBatchSize,@JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS') List<DeletionReasonOptions> householdDeletionReasonOptions,@JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS') List<DeletionReasonOptions> householdMemberDeletionReasonOptions,@JsonKey(name: 'BACKGROUND_SERVICE_CONFIG') List<BackgroundServiceConfig>? backgroundServiceConfig,@JsonKey(name: 'CHECKLIST_TYPES') List<CheckListTypes> checklistTypes,@JsonKey(name: 'DEVICE_CHANGE_REASONS') List<DeviceChangeReasons> deviceChangeReasons,@JsonKey(name: 'SINGLE_USER_LOGIN') List<SingleUserLogin> singleUserLogin,@JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR') List<IdTypeOptions> idTypeOptions,@JsonKey(name: 'HOUSEHOLD_MEMBER_RELATIONSHIP_TYPES') List<RelationShipTypeOptions> relationShipTypeOptions,@JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR') List<DeliveryCommentOptions> deliveryCommentOptions,@JsonKey(name: 'BACKEND_INTERFACE') List<BackendInterface> backendInterface,@JsonKey(name: 'CALL_SUPPORT') List<CallSupportList>? callSupportOptions,@JsonKey(name: 'TRANSPORT_TYPES') List<TransportTypes> transportTypes,@JsonKey(name: 'SYMPTOM_TYPES') List<SymptomsType>? symptomsTypeList,@JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS') List<SearchHouseHoldFilters>? searchHouseHoldFilters,@JsonKey(name: 'SEARCH_CLF_FILTERS') List<SearchCLFFilters>? searchCLFFilters,@JsonKey(name: 'REFERRAL_REASONS') List<ReferralReasonType>? referralReasonList,@JsonKey(name: 'MANUAL_ATTENDANCE_REASONS') List<ManualAttendanceReasonType>? manualAttendanceReasonList,@JsonKey(name: 'HOUSE_STRUCTURE_TYPES') List<CommonMasterModel>? houseStructureTypes,@JsonKey(name: 'REFUSAL_REASONS') List<CommonMasterModel>? refusalReasons,@JsonKey(name: 'FIREBASE_CONFIG') List<FirebaseConfig>? firebaseConfig,@JsonKey(name: 'TRANSIT_POST_TYPE') List<TransitPostType>? transitPostType,@JsonKey(name: 'BOUNDARY_RELATIONSHIP') List<BoundaryRelationship>? boundaryRelationship
});




}
/// @nodoc
class _$HCMWrapperModelCopyWithImpl<$Res>
    implements $HCMWrapperModelCopyWith<$Res> {
  _$HCMWrapperModelCopyWithImpl(this._self, this._then);

  final HCMWrapperModel _self;
  final $Res Function(HCMWrapperModel) _then;

/// Create a copy of HCMWrapperModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appConfig = null,Object? bandWidthBatchSize = null,Object? beneficiaryIdConfig = null,Object? downSyncBandWidthBatchSize = null,Object? householdDeletionReasonOptions = null,Object? householdMemberDeletionReasonOptions = null,Object? backgroundServiceConfig = freezed,Object? checklistTypes = null,Object? deviceChangeReasons = null,Object? singleUserLogin = null,Object? idTypeOptions = null,Object? relationShipTypeOptions = null,Object? deliveryCommentOptions = null,Object? backendInterface = null,Object? callSupportOptions = freezed,Object? transportTypes = null,Object? symptomsTypeList = freezed,Object? searchHouseHoldFilters = freezed,Object? searchCLFFilters = freezed,Object? referralReasonList = freezed,Object? manualAttendanceReasonList = freezed,Object? houseStructureTypes = freezed,Object? refusalReasons = freezed,Object? firebaseConfig = freezed,Object? transitPostType = freezed,Object? boundaryRelationship = freezed,}) {
  return _then(_self.copyWith(
appConfig: null == appConfig ? _self.appConfig : appConfig // ignore: cast_nullable_to_non_nullable
as List<AppConfig>,bandWidthBatchSize: null == bandWidthBatchSize ? _self.bandWidthBatchSize : bandWidthBatchSize // ignore: cast_nullable_to_non_nullable
as List<BandWidthBatchSize>,beneficiaryIdConfig: null == beneficiaryIdConfig ? _self.beneficiaryIdConfig : beneficiaryIdConfig // ignore: cast_nullable_to_non_nullable
as List<BeneficiaryIdConfig>,downSyncBandWidthBatchSize: null == downSyncBandWidthBatchSize ? _self.downSyncBandWidthBatchSize : downSyncBandWidthBatchSize // ignore: cast_nullable_to_non_nullable
as List<BandWidthBatchSize>,householdDeletionReasonOptions: null == householdDeletionReasonOptions ? _self.householdDeletionReasonOptions : householdDeletionReasonOptions // ignore: cast_nullable_to_non_nullable
as List<DeletionReasonOptions>,householdMemberDeletionReasonOptions: null == householdMemberDeletionReasonOptions ? _self.householdMemberDeletionReasonOptions : householdMemberDeletionReasonOptions // ignore: cast_nullable_to_non_nullable
as List<DeletionReasonOptions>,backgroundServiceConfig: freezed == backgroundServiceConfig ? _self.backgroundServiceConfig : backgroundServiceConfig // ignore: cast_nullable_to_non_nullable
as List<BackgroundServiceConfig>?,checklistTypes: null == checklistTypes ? _self.checklistTypes : checklistTypes // ignore: cast_nullable_to_non_nullable
as List<CheckListTypes>,deviceChangeReasons: null == deviceChangeReasons ? _self.deviceChangeReasons : deviceChangeReasons // ignore: cast_nullable_to_non_nullable
as List<DeviceChangeReasons>,singleUserLogin: null == singleUserLogin ? _self.singleUserLogin : singleUserLogin // ignore: cast_nullable_to_non_nullable
as List<SingleUserLogin>,idTypeOptions: null == idTypeOptions ? _self.idTypeOptions : idTypeOptions // ignore: cast_nullable_to_non_nullable
as List<IdTypeOptions>,relationShipTypeOptions: null == relationShipTypeOptions ? _self.relationShipTypeOptions : relationShipTypeOptions // ignore: cast_nullable_to_non_nullable
as List<RelationShipTypeOptions>,deliveryCommentOptions: null == deliveryCommentOptions ? _self.deliveryCommentOptions : deliveryCommentOptions // ignore: cast_nullable_to_non_nullable
as List<DeliveryCommentOptions>,backendInterface: null == backendInterface ? _self.backendInterface : backendInterface // ignore: cast_nullable_to_non_nullable
as List<BackendInterface>,callSupportOptions: freezed == callSupportOptions ? _self.callSupportOptions : callSupportOptions // ignore: cast_nullable_to_non_nullable
as List<CallSupportList>?,transportTypes: null == transportTypes ? _self.transportTypes : transportTypes // ignore: cast_nullable_to_non_nullable
as List<TransportTypes>,symptomsTypeList: freezed == symptomsTypeList ? _self.symptomsTypeList : symptomsTypeList // ignore: cast_nullable_to_non_nullable
as List<SymptomsType>?,searchHouseHoldFilters: freezed == searchHouseHoldFilters ? _self.searchHouseHoldFilters : searchHouseHoldFilters // ignore: cast_nullable_to_non_nullable
as List<SearchHouseHoldFilters>?,searchCLFFilters: freezed == searchCLFFilters ? _self.searchCLFFilters : searchCLFFilters // ignore: cast_nullable_to_non_nullable
as List<SearchCLFFilters>?,referralReasonList: freezed == referralReasonList ? _self.referralReasonList : referralReasonList // ignore: cast_nullable_to_non_nullable
as List<ReferralReasonType>?,manualAttendanceReasonList: freezed == manualAttendanceReasonList ? _self.manualAttendanceReasonList : manualAttendanceReasonList // ignore: cast_nullable_to_non_nullable
as List<ManualAttendanceReasonType>?,houseStructureTypes: freezed == houseStructureTypes ? _self.houseStructureTypes : houseStructureTypes // ignore: cast_nullable_to_non_nullable
as List<CommonMasterModel>?,refusalReasons: freezed == refusalReasons ? _self.refusalReasons : refusalReasons // ignore: cast_nullable_to_non_nullable
as List<CommonMasterModel>?,firebaseConfig: freezed == firebaseConfig ? _self.firebaseConfig : firebaseConfig // ignore: cast_nullable_to_non_nullable
as List<FirebaseConfig>?,transitPostType: freezed == transitPostType ? _self.transitPostType : transitPostType // ignore: cast_nullable_to_non_nullable
as List<TransitPostType>?,boundaryRelationship: freezed == boundaryRelationship ? _self.boundaryRelationship : boundaryRelationship // ignore: cast_nullable_to_non_nullable
as List<BoundaryRelationship>?,
  ));
}

}


/// Adds pattern-matching-related methods to [HCMWrapperModel].
extension HCMWrapperModelPatterns on HCMWrapperModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HCMWrapperModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HCMWrapperModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HCMWrapperModel value)  $default,){
final _that = this;
switch (_that) {
case _HCMWrapperModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HCMWrapperModel value)?  $default,){
final _that = this;
switch (_that) {
case _HCMWrapperModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'APP_CONFIG')  List<AppConfig> appConfig, @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')  List<BandWidthBatchSize> bandWidthBatchSize, @JsonKey(name: 'BENEFICIARY_ID_CONFIG')  List<BeneficiaryIdConfig> beneficiaryIdConfig, @JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE')  List<BandWidthBatchSize> downSyncBandWidthBatchSize, @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')  List<DeletionReasonOptions> householdDeletionReasonOptions, @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')  List<DeletionReasonOptions> householdMemberDeletionReasonOptions, @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')  List<BackgroundServiceConfig>? backgroundServiceConfig, @JsonKey(name: 'CHECKLIST_TYPES')  List<CheckListTypes> checklistTypes, @JsonKey(name: 'DEVICE_CHANGE_REASONS')  List<DeviceChangeReasons> deviceChangeReasons, @JsonKey(name: 'SINGLE_USER_LOGIN')  List<SingleUserLogin> singleUserLogin, @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')  List<IdTypeOptions> idTypeOptions, @JsonKey(name: 'HOUSEHOLD_MEMBER_RELATIONSHIP_TYPES')  List<RelationShipTypeOptions> relationShipTypeOptions, @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')  List<DeliveryCommentOptions> deliveryCommentOptions, @JsonKey(name: 'BACKEND_INTERFACE')  List<BackendInterface> backendInterface, @JsonKey(name: 'CALL_SUPPORT')  List<CallSupportList>? callSupportOptions, @JsonKey(name: 'TRANSPORT_TYPES')  List<TransportTypes> transportTypes, @JsonKey(name: 'SYMPTOM_TYPES')  List<SymptomsType>? symptomsTypeList, @JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS')  List<SearchHouseHoldFilters>? searchHouseHoldFilters, @JsonKey(name: 'SEARCH_CLF_FILTERS')  List<SearchCLFFilters>? searchCLFFilters, @JsonKey(name: 'REFERRAL_REASONS')  List<ReferralReasonType>? referralReasonList, @JsonKey(name: 'MANUAL_ATTENDANCE_REASONS')  List<ManualAttendanceReasonType>? manualAttendanceReasonList, @JsonKey(name: 'HOUSE_STRUCTURE_TYPES')  List<CommonMasterModel>? houseStructureTypes, @JsonKey(name: 'REFUSAL_REASONS')  List<CommonMasterModel>? refusalReasons, @JsonKey(name: 'FIREBASE_CONFIG')  List<FirebaseConfig>? firebaseConfig, @JsonKey(name: 'TRANSIT_POST_TYPE')  List<TransitPostType>? transitPostType, @JsonKey(name: 'BOUNDARY_RELATIONSHIP')  List<BoundaryRelationship>? boundaryRelationship)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HCMWrapperModel() when $default != null:
return $default(_that.appConfig,_that.bandWidthBatchSize,_that.beneficiaryIdConfig,_that.downSyncBandWidthBatchSize,_that.householdDeletionReasonOptions,_that.householdMemberDeletionReasonOptions,_that.backgroundServiceConfig,_that.checklistTypes,_that.deviceChangeReasons,_that.singleUserLogin,_that.idTypeOptions,_that.relationShipTypeOptions,_that.deliveryCommentOptions,_that.backendInterface,_that.callSupportOptions,_that.transportTypes,_that.symptomsTypeList,_that.searchHouseHoldFilters,_that.searchCLFFilters,_that.referralReasonList,_that.manualAttendanceReasonList,_that.houseStructureTypes,_that.refusalReasons,_that.firebaseConfig,_that.transitPostType,_that.boundaryRelationship);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'APP_CONFIG')  List<AppConfig> appConfig, @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')  List<BandWidthBatchSize> bandWidthBatchSize, @JsonKey(name: 'BENEFICIARY_ID_CONFIG')  List<BeneficiaryIdConfig> beneficiaryIdConfig, @JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE')  List<BandWidthBatchSize> downSyncBandWidthBatchSize, @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')  List<DeletionReasonOptions> householdDeletionReasonOptions, @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')  List<DeletionReasonOptions> householdMemberDeletionReasonOptions, @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')  List<BackgroundServiceConfig>? backgroundServiceConfig, @JsonKey(name: 'CHECKLIST_TYPES')  List<CheckListTypes> checklistTypes, @JsonKey(name: 'DEVICE_CHANGE_REASONS')  List<DeviceChangeReasons> deviceChangeReasons, @JsonKey(name: 'SINGLE_USER_LOGIN')  List<SingleUserLogin> singleUserLogin, @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')  List<IdTypeOptions> idTypeOptions, @JsonKey(name: 'HOUSEHOLD_MEMBER_RELATIONSHIP_TYPES')  List<RelationShipTypeOptions> relationShipTypeOptions, @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')  List<DeliveryCommentOptions> deliveryCommentOptions, @JsonKey(name: 'BACKEND_INTERFACE')  List<BackendInterface> backendInterface, @JsonKey(name: 'CALL_SUPPORT')  List<CallSupportList>? callSupportOptions, @JsonKey(name: 'TRANSPORT_TYPES')  List<TransportTypes> transportTypes, @JsonKey(name: 'SYMPTOM_TYPES')  List<SymptomsType>? symptomsTypeList, @JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS')  List<SearchHouseHoldFilters>? searchHouseHoldFilters, @JsonKey(name: 'SEARCH_CLF_FILTERS')  List<SearchCLFFilters>? searchCLFFilters, @JsonKey(name: 'REFERRAL_REASONS')  List<ReferralReasonType>? referralReasonList, @JsonKey(name: 'MANUAL_ATTENDANCE_REASONS')  List<ManualAttendanceReasonType>? manualAttendanceReasonList, @JsonKey(name: 'HOUSE_STRUCTURE_TYPES')  List<CommonMasterModel>? houseStructureTypes, @JsonKey(name: 'REFUSAL_REASONS')  List<CommonMasterModel>? refusalReasons, @JsonKey(name: 'FIREBASE_CONFIG')  List<FirebaseConfig>? firebaseConfig, @JsonKey(name: 'TRANSIT_POST_TYPE')  List<TransitPostType>? transitPostType, @JsonKey(name: 'BOUNDARY_RELATIONSHIP')  List<BoundaryRelationship>? boundaryRelationship)  $default,) {final _that = this;
switch (_that) {
case _HCMWrapperModel():
return $default(_that.appConfig,_that.bandWidthBatchSize,_that.beneficiaryIdConfig,_that.downSyncBandWidthBatchSize,_that.householdDeletionReasonOptions,_that.householdMemberDeletionReasonOptions,_that.backgroundServiceConfig,_that.checklistTypes,_that.deviceChangeReasons,_that.singleUserLogin,_that.idTypeOptions,_that.relationShipTypeOptions,_that.deliveryCommentOptions,_that.backendInterface,_that.callSupportOptions,_that.transportTypes,_that.symptomsTypeList,_that.searchHouseHoldFilters,_that.searchCLFFilters,_that.referralReasonList,_that.manualAttendanceReasonList,_that.houseStructureTypes,_that.refusalReasons,_that.firebaseConfig,_that.transitPostType,_that.boundaryRelationship);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'APP_CONFIG')  List<AppConfig> appConfig, @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')  List<BandWidthBatchSize> bandWidthBatchSize, @JsonKey(name: 'BENEFICIARY_ID_CONFIG')  List<BeneficiaryIdConfig> beneficiaryIdConfig, @JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE')  List<BandWidthBatchSize> downSyncBandWidthBatchSize, @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')  List<DeletionReasonOptions> householdDeletionReasonOptions, @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')  List<DeletionReasonOptions> householdMemberDeletionReasonOptions, @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')  List<BackgroundServiceConfig>? backgroundServiceConfig, @JsonKey(name: 'CHECKLIST_TYPES')  List<CheckListTypes> checklistTypes, @JsonKey(name: 'DEVICE_CHANGE_REASONS')  List<DeviceChangeReasons> deviceChangeReasons, @JsonKey(name: 'SINGLE_USER_LOGIN')  List<SingleUserLogin> singleUserLogin, @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')  List<IdTypeOptions> idTypeOptions, @JsonKey(name: 'HOUSEHOLD_MEMBER_RELATIONSHIP_TYPES')  List<RelationShipTypeOptions> relationShipTypeOptions, @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')  List<DeliveryCommentOptions> deliveryCommentOptions, @JsonKey(name: 'BACKEND_INTERFACE')  List<BackendInterface> backendInterface, @JsonKey(name: 'CALL_SUPPORT')  List<CallSupportList>? callSupportOptions, @JsonKey(name: 'TRANSPORT_TYPES')  List<TransportTypes> transportTypes, @JsonKey(name: 'SYMPTOM_TYPES')  List<SymptomsType>? symptomsTypeList, @JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS')  List<SearchHouseHoldFilters>? searchHouseHoldFilters, @JsonKey(name: 'SEARCH_CLF_FILTERS')  List<SearchCLFFilters>? searchCLFFilters, @JsonKey(name: 'REFERRAL_REASONS')  List<ReferralReasonType>? referralReasonList, @JsonKey(name: 'MANUAL_ATTENDANCE_REASONS')  List<ManualAttendanceReasonType>? manualAttendanceReasonList, @JsonKey(name: 'HOUSE_STRUCTURE_TYPES')  List<CommonMasterModel>? houseStructureTypes, @JsonKey(name: 'REFUSAL_REASONS')  List<CommonMasterModel>? refusalReasons, @JsonKey(name: 'FIREBASE_CONFIG')  List<FirebaseConfig>? firebaseConfig, @JsonKey(name: 'TRANSIT_POST_TYPE')  List<TransitPostType>? transitPostType, @JsonKey(name: 'BOUNDARY_RELATIONSHIP')  List<BoundaryRelationship>? boundaryRelationship)?  $default,) {final _that = this;
switch (_that) {
case _HCMWrapperModel() when $default != null:
return $default(_that.appConfig,_that.bandWidthBatchSize,_that.beneficiaryIdConfig,_that.downSyncBandWidthBatchSize,_that.householdDeletionReasonOptions,_that.householdMemberDeletionReasonOptions,_that.backgroundServiceConfig,_that.checklistTypes,_that.deviceChangeReasons,_that.singleUserLogin,_that.idTypeOptions,_that.relationShipTypeOptions,_that.deliveryCommentOptions,_that.backendInterface,_that.callSupportOptions,_that.transportTypes,_that.symptomsTypeList,_that.searchHouseHoldFilters,_that.searchCLFFilters,_that.referralReasonList,_that.manualAttendanceReasonList,_that.houseStructureTypes,_that.refusalReasons,_that.firebaseConfig,_that.transitPostType,_that.boundaryRelationship);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HCMWrapperModel implements HCMWrapperModel {
  const _HCMWrapperModel({@JsonKey(name: 'APP_CONFIG') required final  List<AppConfig> appConfig, @JsonKey(name: 'BANDWIDTH_BATCH_SIZE') required final  List<BandWidthBatchSize> bandWidthBatchSize, @JsonKey(name: 'BENEFICIARY_ID_CONFIG') required final  List<BeneficiaryIdConfig> beneficiaryIdConfig, @JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE') required final  List<BandWidthBatchSize> downSyncBandWidthBatchSize, @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS') required final  List<DeletionReasonOptions> householdDeletionReasonOptions, @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS') required final  List<DeletionReasonOptions> householdMemberDeletionReasonOptions, @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG') final  List<BackgroundServiceConfig>? backgroundServiceConfig, @JsonKey(name: 'CHECKLIST_TYPES') required final  List<CheckListTypes> checklistTypes, @JsonKey(name: 'DEVICE_CHANGE_REASONS') required final  List<DeviceChangeReasons> deviceChangeReasons, @JsonKey(name: 'SINGLE_USER_LOGIN') required final  List<SingleUserLogin> singleUserLogin, @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR') required final  List<IdTypeOptions> idTypeOptions, @JsonKey(name: 'HOUSEHOLD_MEMBER_RELATIONSHIP_TYPES') required final  List<RelationShipTypeOptions> relationShipTypeOptions, @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR') required final  List<DeliveryCommentOptions> deliveryCommentOptions, @JsonKey(name: 'BACKEND_INTERFACE') required final  List<BackendInterface> backendInterface, @JsonKey(name: 'CALL_SUPPORT') required final  List<CallSupportList>? callSupportOptions, @JsonKey(name: 'TRANSPORT_TYPES') required final  List<TransportTypes> transportTypes, @JsonKey(name: 'SYMPTOM_TYPES') final  List<SymptomsType>? symptomsTypeList, @JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS') final  List<SearchHouseHoldFilters>? searchHouseHoldFilters, @JsonKey(name: 'SEARCH_CLF_FILTERS') final  List<SearchCLFFilters>? searchCLFFilters, @JsonKey(name: 'REFERRAL_REASONS') final  List<ReferralReasonType>? referralReasonList, @JsonKey(name: 'MANUAL_ATTENDANCE_REASONS') final  List<ManualAttendanceReasonType>? manualAttendanceReasonList, @JsonKey(name: 'HOUSE_STRUCTURE_TYPES') final  List<CommonMasterModel>? houseStructureTypes, @JsonKey(name: 'REFUSAL_REASONS') final  List<CommonMasterModel>? refusalReasons, @JsonKey(name: 'FIREBASE_CONFIG') required final  List<FirebaseConfig>? firebaseConfig, @JsonKey(name: 'TRANSIT_POST_TYPE') final  List<TransitPostType>? transitPostType, @JsonKey(name: 'BOUNDARY_RELATIONSHIP') final  List<BoundaryRelationship>? boundaryRelationship}): _appConfig = appConfig,_bandWidthBatchSize = bandWidthBatchSize,_beneficiaryIdConfig = beneficiaryIdConfig,_downSyncBandWidthBatchSize = downSyncBandWidthBatchSize,_householdDeletionReasonOptions = householdDeletionReasonOptions,_householdMemberDeletionReasonOptions = householdMemberDeletionReasonOptions,_backgroundServiceConfig = backgroundServiceConfig,_checklistTypes = checklistTypes,_deviceChangeReasons = deviceChangeReasons,_singleUserLogin = singleUserLogin,_idTypeOptions = idTypeOptions,_relationShipTypeOptions = relationShipTypeOptions,_deliveryCommentOptions = deliveryCommentOptions,_backendInterface = backendInterface,_callSupportOptions = callSupportOptions,_transportTypes = transportTypes,_symptomsTypeList = symptomsTypeList,_searchHouseHoldFilters = searchHouseHoldFilters,_searchCLFFilters = searchCLFFilters,_referralReasonList = referralReasonList,_manualAttendanceReasonList = manualAttendanceReasonList,_houseStructureTypes = houseStructureTypes,_refusalReasons = refusalReasons,_firebaseConfig = firebaseConfig,_transitPostType = transitPostType,_boundaryRelationship = boundaryRelationship;
  factory _HCMWrapperModel.fromJson(Map<String, dynamic> json) => _$HCMWrapperModelFromJson(json);

 final  List<AppConfig> _appConfig;
@override@JsonKey(name: 'APP_CONFIG') List<AppConfig> get appConfig {
  if (_appConfig is EqualUnmodifiableListView) return _appConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appConfig);
}

 final  List<BandWidthBatchSize> _bandWidthBatchSize;
@override@JsonKey(name: 'BANDWIDTH_BATCH_SIZE') List<BandWidthBatchSize> get bandWidthBatchSize {
  if (_bandWidthBatchSize is EqualUnmodifiableListView) return _bandWidthBatchSize;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bandWidthBatchSize);
}

 final  List<BeneficiaryIdConfig> _beneficiaryIdConfig;
@override@JsonKey(name: 'BENEFICIARY_ID_CONFIG') List<BeneficiaryIdConfig> get beneficiaryIdConfig {
  if (_beneficiaryIdConfig is EqualUnmodifiableListView) return _beneficiaryIdConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_beneficiaryIdConfig);
}

 final  List<BandWidthBatchSize> _downSyncBandWidthBatchSize;
@override@JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE') List<BandWidthBatchSize> get downSyncBandWidthBatchSize {
  if (_downSyncBandWidthBatchSize is EqualUnmodifiableListView) return _downSyncBandWidthBatchSize;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_downSyncBandWidthBatchSize);
}

 final  List<DeletionReasonOptions> _householdDeletionReasonOptions;
@override@JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS') List<DeletionReasonOptions> get householdDeletionReasonOptions {
  if (_householdDeletionReasonOptions is EqualUnmodifiableListView) return _householdDeletionReasonOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_householdDeletionReasonOptions);
}

 final  List<DeletionReasonOptions> _householdMemberDeletionReasonOptions;
@override@JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS') List<DeletionReasonOptions> get householdMemberDeletionReasonOptions {
  if (_householdMemberDeletionReasonOptions is EqualUnmodifiableListView) return _householdMemberDeletionReasonOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_householdMemberDeletionReasonOptions);
}

 final  List<BackgroundServiceConfig>? _backgroundServiceConfig;
@override@JsonKey(name: 'BACKGROUND_SERVICE_CONFIG') List<BackgroundServiceConfig>? get backgroundServiceConfig {
  final value = _backgroundServiceConfig;
  if (value == null) return null;
  if (_backgroundServiceConfig is EqualUnmodifiableListView) return _backgroundServiceConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CheckListTypes> _checklistTypes;
@override@JsonKey(name: 'CHECKLIST_TYPES') List<CheckListTypes> get checklistTypes {
  if (_checklistTypes is EqualUnmodifiableListView) return _checklistTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checklistTypes);
}

 final  List<DeviceChangeReasons> _deviceChangeReasons;
@override@JsonKey(name: 'DEVICE_CHANGE_REASONS') List<DeviceChangeReasons> get deviceChangeReasons {
  if (_deviceChangeReasons is EqualUnmodifiableListView) return _deviceChangeReasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deviceChangeReasons);
}

 final  List<SingleUserLogin> _singleUserLogin;
@override@JsonKey(name: 'SINGLE_USER_LOGIN') List<SingleUserLogin> get singleUserLogin {
  if (_singleUserLogin is EqualUnmodifiableListView) return _singleUserLogin;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_singleUserLogin);
}

 final  List<IdTypeOptions> _idTypeOptions;
@override@JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR') List<IdTypeOptions> get idTypeOptions {
  if (_idTypeOptions is EqualUnmodifiableListView) return _idTypeOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_idTypeOptions);
}

 final  List<RelationShipTypeOptions> _relationShipTypeOptions;
@override@JsonKey(name: 'HOUSEHOLD_MEMBER_RELATIONSHIP_TYPES') List<RelationShipTypeOptions> get relationShipTypeOptions {
  if (_relationShipTypeOptions is EqualUnmodifiableListView) return _relationShipTypeOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_relationShipTypeOptions);
}

 final  List<DeliveryCommentOptions> _deliveryCommentOptions;
@override@JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR') List<DeliveryCommentOptions> get deliveryCommentOptions {
  if (_deliveryCommentOptions is EqualUnmodifiableListView) return _deliveryCommentOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deliveryCommentOptions);
}

 final  List<BackendInterface> _backendInterface;
@override@JsonKey(name: 'BACKEND_INTERFACE') List<BackendInterface> get backendInterface {
  if (_backendInterface is EqualUnmodifiableListView) return _backendInterface;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_backendInterface);
}

 final  List<CallSupportList>? _callSupportOptions;
@override@JsonKey(name: 'CALL_SUPPORT') List<CallSupportList>? get callSupportOptions {
  final value = _callSupportOptions;
  if (value == null) return null;
  if (_callSupportOptions is EqualUnmodifiableListView) return _callSupportOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TransportTypes> _transportTypes;
@override@JsonKey(name: 'TRANSPORT_TYPES') List<TransportTypes> get transportTypes {
  if (_transportTypes is EqualUnmodifiableListView) return _transportTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transportTypes);
}

 final  List<SymptomsType>? _symptomsTypeList;
@override@JsonKey(name: 'SYMPTOM_TYPES') List<SymptomsType>? get symptomsTypeList {
  final value = _symptomsTypeList;
  if (value == null) return null;
  if (_symptomsTypeList is EqualUnmodifiableListView) return _symptomsTypeList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<SearchHouseHoldFilters>? _searchHouseHoldFilters;
@override@JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS') List<SearchHouseHoldFilters>? get searchHouseHoldFilters {
  final value = _searchHouseHoldFilters;
  if (value == null) return null;
  if (_searchHouseHoldFilters is EqualUnmodifiableListView) return _searchHouseHoldFilters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<SearchCLFFilters>? _searchCLFFilters;
@override@JsonKey(name: 'SEARCH_CLF_FILTERS') List<SearchCLFFilters>? get searchCLFFilters {
  final value = _searchCLFFilters;
  if (value == null) return null;
  if (_searchCLFFilters is EqualUnmodifiableListView) return _searchCLFFilters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ReferralReasonType>? _referralReasonList;
@override@JsonKey(name: 'REFERRAL_REASONS') List<ReferralReasonType>? get referralReasonList {
  final value = _referralReasonList;
  if (value == null) return null;
  if (_referralReasonList is EqualUnmodifiableListView) return _referralReasonList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ManualAttendanceReasonType>? _manualAttendanceReasonList;
@override@JsonKey(name: 'MANUAL_ATTENDANCE_REASONS') List<ManualAttendanceReasonType>? get manualAttendanceReasonList {
  final value = _manualAttendanceReasonList;
  if (value == null) return null;
  if (_manualAttendanceReasonList is EqualUnmodifiableListView) return _manualAttendanceReasonList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CommonMasterModel>? _houseStructureTypes;
@override@JsonKey(name: 'HOUSE_STRUCTURE_TYPES') List<CommonMasterModel>? get houseStructureTypes {
  final value = _houseStructureTypes;
  if (value == null) return null;
  if (_houseStructureTypes is EqualUnmodifiableListView) return _houseStructureTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CommonMasterModel>? _refusalReasons;
@override@JsonKey(name: 'REFUSAL_REASONS') List<CommonMasterModel>? get refusalReasons {
  final value = _refusalReasons;
  if (value == null) return null;
  if (_refusalReasons is EqualUnmodifiableListView) return _refusalReasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<FirebaseConfig>? _firebaseConfig;
@override@JsonKey(name: 'FIREBASE_CONFIG') List<FirebaseConfig>? get firebaseConfig {
  final value = _firebaseConfig;
  if (value == null) return null;
  if (_firebaseConfig is EqualUnmodifiableListView) return _firebaseConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TransitPostType>? _transitPostType;
@override@JsonKey(name: 'TRANSIT_POST_TYPE') List<TransitPostType>? get transitPostType {
  final value = _transitPostType;
  if (value == null) return null;
  if (_transitPostType is EqualUnmodifiableListView) return _transitPostType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<BoundaryRelationship>? _boundaryRelationship;
@override@JsonKey(name: 'BOUNDARY_RELATIONSHIP') List<BoundaryRelationship>? get boundaryRelationship {
  final value = _boundaryRelationship;
  if (value == null) return null;
  if (_boundaryRelationship is EqualUnmodifiableListView) return _boundaryRelationship;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HCMWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HCMWrapperModelCopyWith<_HCMWrapperModel> get copyWith => __$HCMWrapperModelCopyWithImpl<_HCMWrapperModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HCMWrapperModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HCMWrapperModel&&const DeepCollectionEquality().equals(other._appConfig, _appConfig)&&const DeepCollectionEquality().equals(other._bandWidthBatchSize, _bandWidthBatchSize)&&const DeepCollectionEquality().equals(other._beneficiaryIdConfig, _beneficiaryIdConfig)&&const DeepCollectionEquality().equals(other._downSyncBandWidthBatchSize, _downSyncBandWidthBatchSize)&&const DeepCollectionEquality().equals(other._householdDeletionReasonOptions, _householdDeletionReasonOptions)&&const DeepCollectionEquality().equals(other._householdMemberDeletionReasonOptions, _householdMemberDeletionReasonOptions)&&const DeepCollectionEquality().equals(other._backgroundServiceConfig, _backgroundServiceConfig)&&const DeepCollectionEquality().equals(other._checklistTypes, _checklistTypes)&&const DeepCollectionEquality().equals(other._deviceChangeReasons, _deviceChangeReasons)&&const DeepCollectionEquality().equals(other._singleUserLogin, _singleUserLogin)&&const DeepCollectionEquality().equals(other._idTypeOptions, _idTypeOptions)&&const DeepCollectionEquality().equals(other._relationShipTypeOptions, _relationShipTypeOptions)&&const DeepCollectionEquality().equals(other._deliveryCommentOptions, _deliveryCommentOptions)&&const DeepCollectionEquality().equals(other._backendInterface, _backendInterface)&&const DeepCollectionEquality().equals(other._callSupportOptions, _callSupportOptions)&&const DeepCollectionEquality().equals(other._transportTypes, _transportTypes)&&const DeepCollectionEquality().equals(other._symptomsTypeList, _symptomsTypeList)&&const DeepCollectionEquality().equals(other._searchHouseHoldFilters, _searchHouseHoldFilters)&&const DeepCollectionEquality().equals(other._searchCLFFilters, _searchCLFFilters)&&const DeepCollectionEquality().equals(other._referralReasonList, _referralReasonList)&&const DeepCollectionEquality().equals(other._manualAttendanceReasonList, _manualAttendanceReasonList)&&const DeepCollectionEquality().equals(other._houseStructureTypes, _houseStructureTypes)&&const DeepCollectionEquality().equals(other._refusalReasons, _refusalReasons)&&const DeepCollectionEquality().equals(other._firebaseConfig, _firebaseConfig)&&const DeepCollectionEquality().equals(other._transitPostType, _transitPostType)&&const DeepCollectionEquality().equals(other._boundaryRelationship, _boundaryRelationship));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(_appConfig),const DeepCollectionEquality().hash(_bandWidthBatchSize),const DeepCollectionEquality().hash(_beneficiaryIdConfig),const DeepCollectionEquality().hash(_downSyncBandWidthBatchSize),const DeepCollectionEquality().hash(_householdDeletionReasonOptions),const DeepCollectionEquality().hash(_householdMemberDeletionReasonOptions),const DeepCollectionEquality().hash(_backgroundServiceConfig),const DeepCollectionEquality().hash(_checklistTypes),const DeepCollectionEquality().hash(_deviceChangeReasons),const DeepCollectionEquality().hash(_singleUserLogin),const DeepCollectionEquality().hash(_idTypeOptions),const DeepCollectionEquality().hash(_relationShipTypeOptions),const DeepCollectionEquality().hash(_deliveryCommentOptions),const DeepCollectionEquality().hash(_backendInterface),const DeepCollectionEquality().hash(_callSupportOptions),const DeepCollectionEquality().hash(_transportTypes),const DeepCollectionEquality().hash(_symptomsTypeList),const DeepCollectionEquality().hash(_searchHouseHoldFilters),const DeepCollectionEquality().hash(_searchCLFFilters),const DeepCollectionEquality().hash(_referralReasonList),const DeepCollectionEquality().hash(_manualAttendanceReasonList),const DeepCollectionEquality().hash(_houseStructureTypes),const DeepCollectionEquality().hash(_refusalReasons),const DeepCollectionEquality().hash(_firebaseConfig),const DeepCollectionEquality().hash(_transitPostType),const DeepCollectionEquality().hash(_boundaryRelationship)]);

@override
String toString() {
  return 'HCMWrapperModel(appConfig: $appConfig, bandWidthBatchSize: $bandWidthBatchSize, beneficiaryIdConfig: $beneficiaryIdConfig, downSyncBandWidthBatchSize: $downSyncBandWidthBatchSize, householdDeletionReasonOptions: $householdDeletionReasonOptions, householdMemberDeletionReasonOptions: $householdMemberDeletionReasonOptions, backgroundServiceConfig: $backgroundServiceConfig, checklistTypes: $checklistTypes, deviceChangeReasons: $deviceChangeReasons, singleUserLogin: $singleUserLogin, idTypeOptions: $idTypeOptions, relationShipTypeOptions: $relationShipTypeOptions, deliveryCommentOptions: $deliveryCommentOptions, backendInterface: $backendInterface, callSupportOptions: $callSupportOptions, transportTypes: $transportTypes, symptomsTypeList: $symptomsTypeList, searchHouseHoldFilters: $searchHouseHoldFilters, searchCLFFilters: $searchCLFFilters, referralReasonList: $referralReasonList, manualAttendanceReasonList: $manualAttendanceReasonList, houseStructureTypes: $houseStructureTypes, refusalReasons: $refusalReasons, firebaseConfig: $firebaseConfig, transitPostType: $transitPostType, boundaryRelationship: $boundaryRelationship)';
}


}

/// @nodoc
abstract mixin class _$HCMWrapperModelCopyWith<$Res> implements $HCMWrapperModelCopyWith<$Res> {
  factory _$HCMWrapperModelCopyWith(_HCMWrapperModel value, $Res Function(_HCMWrapperModel) _then) = __$HCMWrapperModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'APP_CONFIG') List<AppConfig> appConfig,@JsonKey(name: 'BANDWIDTH_BATCH_SIZE') List<BandWidthBatchSize> bandWidthBatchSize,@JsonKey(name: 'BENEFICIARY_ID_CONFIG') List<BeneficiaryIdConfig> beneficiaryIdConfig,@JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE') List<BandWidthBatchSize> downSyncBandWidthBatchSize,@JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS') List<DeletionReasonOptions> householdDeletionReasonOptions,@JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS') List<DeletionReasonOptions> householdMemberDeletionReasonOptions,@JsonKey(name: 'BACKGROUND_SERVICE_CONFIG') List<BackgroundServiceConfig>? backgroundServiceConfig,@JsonKey(name: 'CHECKLIST_TYPES') List<CheckListTypes> checklistTypes,@JsonKey(name: 'DEVICE_CHANGE_REASONS') List<DeviceChangeReasons> deviceChangeReasons,@JsonKey(name: 'SINGLE_USER_LOGIN') List<SingleUserLogin> singleUserLogin,@JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR') List<IdTypeOptions> idTypeOptions,@JsonKey(name: 'HOUSEHOLD_MEMBER_RELATIONSHIP_TYPES') List<RelationShipTypeOptions> relationShipTypeOptions,@JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR') List<DeliveryCommentOptions> deliveryCommentOptions,@JsonKey(name: 'BACKEND_INTERFACE') List<BackendInterface> backendInterface,@JsonKey(name: 'CALL_SUPPORT') List<CallSupportList>? callSupportOptions,@JsonKey(name: 'TRANSPORT_TYPES') List<TransportTypes> transportTypes,@JsonKey(name: 'SYMPTOM_TYPES') List<SymptomsType>? symptomsTypeList,@JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS') List<SearchHouseHoldFilters>? searchHouseHoldFilters,@JsonKey(name: 'SEARCH_CLF_FILTERS') List<SearchCLFFilters>? searchCLFFilters,@JsonKey(name: 'REFERRAL_REASONS') List<ReferralReasonType>? referralReasonList,@JsonKey(name: 'MANUAL_ATTENDANCE_REASONS') List<ManualAttendanceReasonType>? manualAttendanceReasonList,@JsonKey(name: 'HOUSE_STRUCTURE_TYPES') List<CommonMasterModel>? houseStructureTypes,@JsonKey(name: 'REFUSAL_REASONS') List<CommonMasterModel>? refusalReasons,@JsonKey(name: 'FIREBASE_CONFIG') List<FirebaseConfig>? firebaseConfig,@JsonKey(name: 'TRANSIT_POST_TYPE') List<TransitPostType>? transitPostType,@JsonKey(name: 'BOUNDARY_RELATIONSHIP') List<BoundaryRelationship>? boundaryRelationship
});




}
/// @nodoc
class __$HCMWrapperModelCopyWithImpl<$Res>
    implements _$HCMWrapperModelCopyWith<$Res> {
  __$HCMWrapperModelCopyWithImpl(this._self, this._then);

  final _HCMWrapperModel _self;
  final $Res Function(_HCMWrapperModel) _then;

/// Create a copy of HCMWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appConfig = null,Object? bandWidthBatchSize = null,Object? beneficiaryIdConfig = null,Object? downSyncBandWidthBatchSize = null,Object? householdDeletionReasonOptions = null,Object? householdMemberDeletionReasonOptions = null,Object? backgroundServiceConfig = freezed,Object? checklistTypes = null,Object? deviceChangeReasons = null,Object? singleUserLogin = null,Object? idTypeOptions = null,Object? relationShipTypeOptions = null,Object? deliveryCommentOptions = null,Object? backendInterface = null,Object? callSupportOptions = freezed,Object? transportTypes = null,Object? symptomsTypeList = freezed,Object? searchHouseHoldFilters = freezed,Object? searchCLFFilters = freezed,Object? referralReasonList = freezed,Object? manualAttendanceReasonList = freezed,Object? houseStructureTypes = freezed,Object? refusalReasons = freezed,Object? firebaseConfig = freezed,Object? transitPostType = freezed,Object? boundaryRelationship = freezed,}) {
  return _then(_HCMWrapperModel(
appConfig: null == appConfig ? _self._appConfig : appConfig // ignore: cast_nullable_to_non_nullable
as List<AppConfig>,bandWidthBatchSize: null == bandWidthBatchSize ? _self._bandWidthBatchSize : bandWidthBatchSize // ignore: cast_nullable_to_non_nullable
as List<BandWidthBatchSize>,beneficiaryIdConfig: null == beneficiaryIdConfig ? _self._beneficiaryIdConfig : beneficiaryIdConfig // ignore: cast_nullable_to_non_nullable
as List<BeneficiaryIdConfig>,downSyncBandWidthBatchSize: null == downSyncBandWidthBatchSize ? _self._downSyncBandWidthBatchSize : downSyncBandWidthBatchSize // ignore: cast_nullable_to_non_nullable
as List<BandWidthBatchSize>,householdDeletionReasonOptions: null == householdDeletionReasonOptions ? _self._householdDeletionReasonOptions : householdDeletionReasonOptions // ignore: cast_nullable_to_non_nullable
as List<DeletionReasonOptions>,householdMemberDeletionReasonOptions: null == householdMemberDeletionReasonOptions ? _self._householdMemberDeletionReasonOptions : householdMemberDeletionReasonOptions // ignore: cast_nullable_to_non_nullable
as List<DeletionReasonOptions>,backgroundServiceConfig: freezed == backgroundServiceConfig ? _self._backgroundServiceConfig : backgroundServiceConfig // ignore: cast_nullable_to_non_nullable
as List<BackgroundServiceConfig>?,checklistTypes: null == checklistTypes ? _self._checklistTypes : checklistTypes // ignore: cast_nullable_to_non_nullable
as List<CheckListTypes>,deviceChangeReasons: null == deviceChangeReasons ? _self._deviceChangeReasons : deviceChangeReasons // ignore: cast_nullable_to_non_nullable
as List<DeviceChangeReasons>,singleUserLogin: null == singleUserLogin ? _self._singleUserLogin : singleUserLogin // ignore: cast_nullable_to_non_nullable
as List<SingleUserLogin>,idTypeOptions: null == idTypeOptions ? _self._idTypeOptions : idTypeOptions // ignore: cast_nullable_to_non_nullable
as List<IdTypeOptions>,relationShipTypeOptions: null == relationShipTypeOptions ? _self._relationShipTypeOptions : relationShipTypeOptions // ignore: cast_nullable_to_non_nullable
as List<RelationShipTypeOptions>,deliveryCommentOptions: null == deliveryCommentOptions ? _self._deliveryCommentOptions : deliveryCommentOptions // ignore: cast_nullable_to_non_nullable
as List<DeliveryCommentOptions>,backendInterface: null == backendInterface ? _self._backendInterface : backendInterface // ignore: cast_nullable_to_non_nullable
as List<BackendInterface>,callSupportOptions: freezed == callSupportOptions ? _self._callSupportOptions : callSupportOptions // ignore: cast_nullable_to_non_nullable
as List<CallSupportList>?,transportTypes: null == transportTypes ? _self._transportTypes : transportTypes // ignore: cast_nullable_to_non_nullable
as List<TransportTypes>,symptomsTypeList: freezed == symptomsTypeList ? _self._symptomsTypeList : symptomsTypeList // ignore: cast_nullable_to_non_nullable
as List<SymptomsType>?,searchHouseHoldFilters: freezed == searchHouseHoldFilters ? _self._searchHouseHoldFilters : searchHouseHoldFilters // ignore: cast_nullable_to_non_nullable
as List<SearchHouseHoldFilters>?,searchCLFFilters: freezed == searchCLFFilters ? _self._searchCLFFilters : searchCLFFilters // ignore: cast_nullable_to_non_nullable
as List<SearchCLFFilters>?,referralReasonList: freezed == referralReasonList ? _self._referralReasonList : referralReasonList // ignore: cast_nullable_to_non_nullable
as List<ReferralReasonType>?,manualAttendanceReasonList: freezed == manualAttendanceReasonList ? _self._manualAttendanceReasonList : manualAttendanceReasonList // ignore: cast_nullable_to_non_nullable
as List<ManualAttendanceReasonType>?,houseStructureTypes: freezed == houseStructureTypes ? _self._houseStructureTypes : houseStructureTypes // ignore: cast_nullable_to_non_nullable
as List<CommonMasterModel>?,refusalReasons: freezed == refusalReasons ? _self._refusalReasons : refusalReasons // ignore: cast_nullable_to_non_nullable
as List<CommonMasterModel>?,firebaseConfig: freezed == firebaseConfig ? _self._firebaseConfig : firebaseConfig // ignore: cast_nullable_to_non_nullable
as List<FirebaseConfig>?,transitPostType: freezed == transitPostType ? _self._transitPostType : transitPostType // ignore: cast_nullable_to_non_nullable
as List<TransitPostType>?,boundaryRelationship: freezed == boundaryRelationship ? _self._boundaryRelationship : boundaryRelationship // ignore: cast_nullable_to_non_nullable
as List<BoundaryRelationship>?,
  ));
}


}


/// @nodoc
mixin _$AppConfigSecondaryWrapperModel {

@JsonKey(name: 'appConfig') List<AppConfig>? get appConfiglist;
/// Create a copy of AppConfigSecondaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigSecondaryWrapperModelCopyWith<AppConfigSecondaryWrapperModel> get copyWith => _$AppConfigSecondaryWrapperModelCopyWithImpl<AppConfigSecondaryWrapperModel>(this as AppConfigSecondaryWrapperModel, _$identity);

  /// Serializes this AppConfigSecondaryWrapperModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfigSecondaryWrapperModel&&const DeepCollectionEquality().equals(other.appConfiglist, appConfiglist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(appConfiglist));

@override
String toString() {
  return 'AppConfigSecondaryWrapperModel(appConfiglist: $appConfiglist)';
}


}

/// @nodoc
abstract mixin class $AppConfigSecondaryWrapperModelCopyWith<$Res>  {
  factory $AppConfigSecondaryWrapperModelCopyWith(AppConfigSecondaryWrapperModel value, $Res Function(AppConfigSecondaryWrapperModel) _then) = _$AppConfigSecondaryWrapperModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'appConfig') List<AppConfig>? appConfiglist
});




}
/// @nodoc
class _$AppConfigSecondaryWrapperModelCopyWithImpl<$Res>
    implements $AppConfigSecondaryWrapperModelCopyWith<$Res> {
  _$AppConfigSecondaryWrapperModelCopyWithImpl(this._self, this._then);

  final AppConfigSecondaryWrapperModel _self;
  final $Res Function(AppConfigSecondaryWrapperModel) _then;

/// Create a copy of AppConfigSecondaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appConfiglist = freezed,}) {
  return _then(_self.copyWith(
appConfiglist: freezed == appConfiglist ? _self.appConfiglist : appConfiglist // ignore: cast_nullable_to_non_nullable
as List<AppConfig>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppConfigSecondaryWrapperModel].
extension AppConfigSecondaryWrapperModelPatterns on AppConfigSecondaryWrapperModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfigSecondaryWrapperModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfigSecondaryWrapperModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfigSecondaryWrapperModel value)  $default,){
final _that = this;
switch (_that) {
case _AppConfigSecondaryWrapperModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfigSecondaryWrapperModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfigSecondaryWrapperModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'appConfig')  List<AppConfig>? appConfiglist)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfigSecondaryWrapperModel() when $default != null:
return $default(_that.appConfiglist);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'appConfig')  List<AppConfig>? appConfiglist)  $default,) {final _that = this;
switch (_that) {
case _AppConfigSecondaryWrapperModel():
return $default(_that.appConfiglist);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'appConfig')  List<AppConfig>? appConfiglist)?  $default,) {final _that = this;
switch (_that) {
case _AppConfigSecondaryWrapperModel() when $default != null:
return $default(_that.appConfiglist);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppConfigSecondaryWrapperModel implements AppConfigSecondaryWrapperModel {
  const _AppConfigSecondaryWrapperModel({@JsonKey(name: 'appConfig') final  List<AppConfig>? appConfiglist}): _appConfiglist = appConfiglist;
  factory _AppConfigSecondaryWrapperModel.fromJson(Map<String, dynamic> json) => _$AppConfigSecondaryWrapperModelFromJson(json);

 final  List<AppConfig>? _appConfiglist;
@override@JsonKey(name: 'appConfig') List<AppConfig>? get appConfiglist {
  final value = _appConfiglist;
  if (value == null) return null;
  if (_appConfiglist is EqualUnmodifiableListView) return _appConfiglist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AppConfigSecondaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigSecondaryWrapperModelCopyWith<_AppConfigSecondaryWrapperModel> get copyWith => __$AppConfigSecondaryWrapperModelCopyWithImpl<_AppConfigSecondaryWrapperModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppConfigSecondaryWrapperModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfigSecondaryWrapperModel&&const DeepCollectionEquality().equals(other._appConfiglist, _appConfiglist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_appConfiglist));

@override
String toString() {
  return 'AppConfigSecondaryWrapperModel(appConfiglist: $appConfiglist)';
}


}

/// @nodoc
abstract mixin class _$AppConfigSecondaryWrapperModelCopyWith<$Res> implements $AppConfigSecondaryWrapperModelCopyWith<$Res> {
  factory _$AppConfigSecondaryWrapperModelCopyWith(_AppConfigSecondaryWrapperModel value, $Res Function(_AppConfigSecondaryWrapperModel) _then) = __$AppConfigSecondaryWrapperModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'appConfig') List<AppConfig>? appConfiglist
});




}
/// @nodoc
class __$AppConfigSecondaryWrapperModelCopyWithImpl<$Res>
    implements _$AppConfigSecondaryWrapperModelCopyWith<$Res> {
  __$AppConfigSecondaryWrapperModelCopyWithImpl(this._self, this._then);

  final _AppConfigSecondaryWrapperModel _self;
  final $Res Function(_AppConfigSecondaryWrapperModel) _then;

/// Create a copy of AppConfigSecondaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appConfiglist = freezed,}) {
  return _then(_AppConfigSecondaryWrapperModel(
appConfiglist: freezed == appConfiglist ? _self._appConfiglist : appConfiglist // ignore: cast_nullable_to_non_nullable
as List<AppConfig>?,
  ));
}


}


/// @nodoc
mixin _$CommonMastersWrapperModel {

@JsonKey(name: 'GenderType') List<CommonMasterModel> get genderType;@JsonKey(name: 'StateInfo') List<StateInfoModel> get stateInfo;@JsonKey(name: 'PrivacyPolicy') List<PrivacyPolicyModel>? get privacyPolicyConfig;
/// Create a copy of CommonMastersWrapperModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommonMastersWrapperModelCopyWith<CommonMastersWrapperModel> get copyWith => _$CommonMastersWrapperModelCopyWithImpl<CommonMastersWrapperModel>(this as CommonMastersWrapperModel, _$identity);

  /// Serializes this CommonMastersWrapperModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommonMastersWrapperModel&&const DeepCollectionEquality().equals(other.genderType, genderType)&&const DeepCollectionEquality().equals(other.stateInfo, stateInfo)&&const DeepCollectionEquality().equals(other.privacyPolicyConfig, privacyPolicyConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(genderType),const DeepCollectionEquality().hash(stateInfo),const DeepCollectionEquality().hash(privacyPolicyConfig));

@override
String toString() {
  return 'CommonMastersWrapperModel(genderType: $genderType, stateInfo: $stateInfo, privacyPolicyConfig: $privacyPolicyConfig)';
}


}

/// @nodoc
abstract mixin class $CommonMastersWrapperModelCopyWith<$Res>  {
  factory $CommonMastersWrapperModelCopyWith(CommonMastersWrapperModel value, $Res Function(CommonMastersWrapperModel) _then) = _$CommonMastersWrapperModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'GenderType') List<CommonMasterModel> genderType,@JsonKey(name: 'StateInfo') List<StateInfoModel> stateInfo,@JsonKey(name: 'PrivacyPolicy') List<PrivacyPolicyModel>? privacyPolicyConfig
});




}
/// @nodoc
class _$CommonMastersWrapperModelCopyWithImpl<$Res>
    implements $CommonMastersWrapperModelCopyWith<$Res> {
  _$CommonMastersWrapperModelCopyWithImpl(this._self, this._then);

  final CommonMastersWrapperModel _self;
  final $Res Function(CommonMastersWrapperModel) _then;

/// Create a copy of CommonMastersWrapperModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? genderType = null,Object? stateInfo = null,Object? privacyPolicyConfig = freezed,}) {
  return _then(_self.copyWith(
genderType: null == genderType ? _self.genderType : genderType // ignore: cast_nullable_to_non_nullable
as List<CommonMasterModel>,stateInfo: null == stateInfo ? _self.stateInfo : stateInfo // ignore: cast_nullable_to_non_nullable
as List<StateInfoModel>,privacyPolicyConfig: freezed == privacyPolicyConfig ? _self.privacyPolicyConfig : privacyPolicyConfig // ignore: cast_nullable_to_non_nullable
as List<PrivacyPolicyModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommonMastersWrapperModel].
extension CommonMastersWrapperModelPatterns on CommonMastersWrapperModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommonMastersWrapperModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommonMastersWrapperModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommonMastersWrapperModel value)  $default,){
final _that = this;
switch (_that) {
case _CommonMastersWrapperModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommonMastersWrapperModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommonMastersWrapperModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'GenderType')  List<CommonMasterModel> genderType, @JsonKey(name: 'StateInfo')  List<StateInfoModel> stateInfo, @JsonKey(name: 'PrivacyPolicy')  List<PrivacyPolicyModel>? privacyPolicyConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommonMastersWrapperModel() when $default != null:
return $default(_that.genderType,_that.stateInfo,_that.privacyPolicyConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'GenderType')  List<CommonMasterModel> genderType, @JsonKey(name: 'StateInfo')  List<StateInfoModel> stateInfo, @JsonKey(name: 'PrivacyPolicy')  List<PrivacyPolicyModel>? privacyPolicyConfig)  $default,) {final _that = this;
switch (_that) {
case _CommonMastersWrapperModel():
return $default(_that.genderType,_that.stateInfo,_that.privacyPolicyConfig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'GenderType')  List<CommonMasterModel> genderType, @JsonKey(name: 'StateInfo')  List<StateInfoModel> stateInfo, @JsonKey(name: 'PrivacyPolicy')  List<PrivacyPolicyModel>? privacyPolicyConfig)?  $default,) {final _that = this;
switch (_that) {
case _CommonMastersWrapperModel() when $default != null:
return $default(_that.genderType,_that.stateInfo,_that.privacyPolicyConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommonMastersWrapperModel implements CommonMastersWrapperModel {
  const _CommonMastersWrapperModel({@JsonKey(name: 'GenderType') required final  List<CommonMasterModel> genderType, @JsonKey(name: 'StateInfo') required final  List<StateInfoModel> stateInfo, @JsonKey(name: 'PrivacyPolicy') final  List<PrivacyPolicyModel>? privacyPolicyConfig}): _genderType = genderType,_stateInfo = stateInfo,_privacyPolicyConfig = privacyPolicyConfig;
  factory _CommonMastersWrapperModel.fromJson(Map<String, dynamic> json) => _$CommonMastersWrapperModelFromJson(json);

 final  List<CommonMasterModel> _genderType;
@override@JsonKey(name: 'GenderType') List<CommonMasterModel> get genderType {
  if (_genderType is EqualUnmodifiableListView) return _genderType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genderType);
}

 final  List<StateInfoModel> _stateInfo;
@override@JsonKey(name: 'StateInfo') List<StateInfoModel> get stateInfo {
  if (_stateInfo is EqualUnmodifiableListView) return _stateInfo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stateInfo);
}

 final  List<PrivacyPolicyModel>? _privacyPolicyConfig;
@override@JsonKey(name: 'PrivacyPolicy') List<PrivacyPolicyModel>? get privacyPolicyConfig {
  final value = _privacyPolicyConfig;
  if (value == null) return null;
  if (_privacyPolicyConfig is EqualUnmodifiableListView) return _privacyPolicyConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CommonMastersWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommonMastersWrapperModelCopyWith<_CommonMastersWrapperModel> get copyWith => __$CommonMastersWrapperModelCopyWithImpl<_CommonMastersWrapperModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommonMastersWrapperModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommonMastersWrapperModel&&const DeepCollectionEquality().equals(other._genderType, _genderType)&&const DeepCollectionEquality().equals(other._stateInfo, _stateInfo)&&const DeepCollectionEquality().equals(other._privacyPolicyConfig, _privacyPolicyConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_genderType),const DeepCollectionEquality().hash(_stateInfo),const DeepCollectionEquality().hash(_privacyPolicyConfig));

@override
String toString() {
  return 'CommonMastersWrapperModel(genderType: $genderType, stateInfo: $stateInfo, privacyPolicyConfig: $privacyPolicyConfig)';
}


}

/// @nodoc
abstract mixin class _$CommonMastersWrapperModelCopyWith<$Res> implements $CommonMastersWrapperModelCopyWith<$Res> {
  factory _$CommonMastersWrapperModelCopyWith(_CommonMastersWrapperModel value, $Res Function(_CommonMastersWrapperModel) _then) = __$CommonMastersWrapperModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'GenderType') List<CommonMasterModel> genderType,@JsonKey(name: 'StateInfo') List<StateInfoModel> stateInfo,@JsonKey(name: 'PrivacyPolicy') List<PrivacyPolicyModel>? privacyPolicyConfig
});




}
/// @nodoc
class __$CommonMastersWrapperModelCopyWithImpl<$Res>
    implements _$CommonMastersWrapperModelCopyWith<$Res> {
  __$CommonMastersWrapperModelCopyWithImpl(this._self, this._then);

  final _CommonMastersWrapperModel _self;
  final $Res Function(_CommonMastersWrapperModel) _then;

/// Create a copy of CommonMastersWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genderType = null,Object? stateInfo = null,Object? privacyPolicyConfig = freezed,}) {
  return _then(_CommonMastersWrapperModel(
genderType: null == genderType ? _self._genderType : genderType // ignore: cast_nullable_to_non_nullable
as List<CommonMasterModel>,stateInfo: null == stateInfo ? _self._stateInfo : stateInfo // ignore: cast_nullable_to_non_nullable
as List<StateInfoModel>,privacyPolicyConfig: freezed == privacyPolicyConfig ? _self._privacyPolicyConfig : privacyPolicyConfig // ignore: cast_nullable_to_non_nullable
as List<PrivacyPolicyModel>?,
  ));
}


}


/// @nodoc
mixin _$CommonMasterModel {

@JsonKey(name: 'code') String get code;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'active') bool get active;
/// Create a copy of CommonMasterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommonMasterModelCopyWith<CommonMasterModel> get copyWith => _$CommonMasterModelCopyWithImpl<CommonMasterModel>(this as CommonMasterModel, _$identity);

  /// Serializes this CommonMasterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommonMasterModel&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,active);

@override
String toString() {
  return 'CommonMasterModel(code: $code, name: $name, active: $active)';
}


}

/// @nodoc
abstract mixin class $CommonMasterModelCopyWith<$Res>  {
  factory $CommonMasterModelCopyWith(CommonMasterModel value, $Res Function(CommonMasterModel) _then) = _$CommonMasterModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'code') String code,@JsonKey(name: 'name') String? name,@JsonKey(name: 'active') bool active
});




}
/// @nodoc
class _$CommonMasterModelCopyWithImpl<$Res>
    implements $CommonMasterModelCopyWith<$Res> {
  _$CommonMasterModelCopyWithImpl(this._self, this._then);

  final CommonMasterModel _self;
  final $Res Function(CommonMasterModel) _then;

/// Create a copy of CommonMasterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = freezed,Object? active = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CommonMasterModel].
extension CommonMasterModelPatterns on CommonMasterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommonMasterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommonMasterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommonMasterModel value)  $default,){
final _that = this;
switch (_that) {
case _CommonMasterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommonMasterModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommonMasterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'code')  String code, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'active')  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommonMasterModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'code')  String code, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'active')  bool active)  $default,) {final _that = this;
switch (_that) {
case _CommonMasterModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'code')  String code, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'active')  bool active)?  $default,) {final _that = this;
switch (_that) {
case _CommonMasterModel() when $default != null:
return $default(_that.code,_that.name,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommonMasterModel implements CommonMasterModel {
  const _CommonMasterModel({@JsonKey(name: 'code') required this.code, @JsonKey(name: 'name') this.name, @JsonKey(name: 'active') required this.active});
  factory _CommonMasterModel.fromJson(Map<String, dynamic> json) => _$CommonMasterModelFromJson(json);

@override@JsonKey(name: 'code') final  String code;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'active') final  bool active;

/// Create a copy of CommonMasterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommonMasterModelCopyWith<_CommonMasterModel> get copyWith => __$CommonMasterModelCopyWithImpl<_CommonMasterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommonMasterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommonMasterModel&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,active);

@override
String toString() {
  return 'CommonMasterModel(code: $code, name: $name, active: $active)';
}


}

/// @nodoc
abstract mixin class _$CommonMasterModelCopyWith<$Res> implements $CommonMasterModelCopyWith<$Res> {
  factory _$CommonMasterModelCopyWith(_CommonMasterModel value, $Res Function(_CommonMasterModel) _then) = __$CommonMasterModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'code') String code,@JsonKey(name: 'name') String? name,@JsonKey(name: 'active') bool active
});




}
/// @nodoc
class __$CommonMasterModelCopyWithImpl<$Res>
    implements _$CommonMasterModelCopyWith<$Res> {
  __$CommonMasterModelCopyWithImpl(this._self, this._then);

  final _CommonMasterModel _self;
  final $Res Function(_CommonMasterModel) _then;

/// Create a copy of CommonMasterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = freezed,Object? active = null,}) {
  return _then(_CommonMasterModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$StateInfoModel {

@JsonKey(name: 'code') String get code;@JsonKey(name: 'languages') List<Languages> get languages;@JsonKey(name: 'localizationModules') List<Languages>? get localizationModules;
/// Create a copy of StateInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StateInfoModelCopyWith<StateInfoModel> get copyWith => _$StateInfoModelCopyWithImpl<StateInfoModel>(this as StateInfoModel, _$identity);

  /// Serializes this StateInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StateInfoModel&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.languages, languages)&&const DeepCollectionEquality().equals(other.localizationModules, localizationModules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,const DeepCollectionEquality().hash(languages),const DeepCollectionEquality().hash(localizationModules));

@override
String toString() {
  return 'StateInfoModel(code: $code, languages: $languages, localizationModules: $localizationModules)';
}


}

/// @nodoc
abstract mixin class $StateInfoModelCopyWith<$Res>  {
  factory $StateInfoModelCopyWith(StateInfoModel value, $Res Function(StateInfoModel) _then) = _$StateInfoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'code') String code,@JsonKey(name: 'languages') List<Languages> languages,@JsonKey(name: 'localizationModules') List<Languages>? localizationModules
});




}
/// @nodoc
class _$StateInfoModelCopyWithImpl<$Res>
    implements $StateInfoModelCopyWith<$Res> {
  _$StateInfoModelCopyWithImpl(this._self, this._then);

  final StateInfoModel _self;
  final $Res Function(StateInfoModel) _then;

/// Create a copy of StateInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? languages = null,Object? localizationModules = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<Languages>,localizationModules: freezed == localizationModules ? _self.localizationModules : localizationModules // ignore: cast_nullable_to_non_nullable
as List<Languages>?,
  ));
}

}


/// Adds pattern-matching-related methods to [StateInfoModel].
extension StateInfoModelPatterns on StateInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StateInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StateInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StateInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _StateInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StateInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _StateInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'code')  String code, @JsonKey(name: 'languages')  List<Languages> languages, @JsonKey(name: 'localizationModules')  List<Languages>? localizationModules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StateInfoModel() when $default != null:
return $default(_that.code,_that.languages,_that.localizationModules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'code')  String code, @JsonKey(name: 'languages')  List<Languages> languages, @JsonKey(name: 'localizationModules')  List<Languages>? localizationModules)  $default,) {final _that = this;
switch (_that) {
case _StateInfoModel():
return $default(_that.code,_that.languages,_that.localizationModules);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'code')  String code, @JsonKey(name: 'languages')  List<Languages> languages, @JsonKey(name: 'localizationModules')  List<Languages>? localizationModules)?  $default,) {final _that = this;
switch (_that) {
case _StateInfoModel() when $default != null:
return $default(_that.code,_that.languages,_that.localizationModules);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StateInfoModel implements StateInfoModel {
  const _StateInfoModel({@JsonKey(name: 'code') required this.code, @JsonKey(name: 'languages') required final  List<Languages> languages, @JsonKey(name: 'localizationModules') final  List<Languages>? localizationModules}): _languages = languages,_localizationModules = localizationModules;
  factory _StateInfoModel.fromJson(Map<String, dynamic> json) => _$StateInfoModelFromJson(json);

@override@JsonKey(name: 'code') final  String code;
 final  List<Languages> _languages;
@override@JsonKey(name: 'languages') List<Languages> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

 final  List<Languages>? _localizationModules;
@override@JsonKey(name: 'localizationModules') List<Languages>? get localizationModules {
  final value = _localizationModules;
  if (value == null) return null;
  if (_localizationModules is EqualUnmodifiableListView) return _localizationModules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of StateInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateInfoModelCopyWith<_StateInfoModel> get copyWith => __$StateInfoModelCopyWithImpl<_StateInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StateInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateInfoModel&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other._languages, _languages)&&const DeepCollectionEquality().equals(other._localizationModules, _localizationModules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,const DeepCollectionEquality().hash(_languages),const DeepCollectionEquality().hash(_localizationModules));

@override
String toString() {
  return 'StateInfoModel(code: $code, languages: $languages, localizationModules: $localizationModules)';
}


}

/// @nodoc
abstract mixin class _$StateInfoModelCopyWith<$Res> implements $StateInfoModelCopyWith<$Res> {
  factory _$StateInfoModelCopyWith(_StateInfoModel value, $Res Function(_StateInfoModel) _then) = __$StateInfoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'code') String code,@JsonKey(name: 'languages') List<Languages> languages,@JsonKey(name: 'localizationModules') List<Languages>? localizationModules
});




}
/// @nodoc
class __$StateInfoModelCopyWithImpl<$Res>
    implements _$StateInfoModelCopyWith<$Res> {
  __$StateInfoModelCopyWithImpl(this._self, this._then);

  final _StateInfoModel _self;
  final $Res Function(_StateInfoModel) _then;

/// Create a copy of StateInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? languages = null,Object? localizationModules = freezed,}) {
  return _then(_StateInfoModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<Languages>,localizationModules: freezed == localizationModules ? _self._localizationModules : localizationModules // ignore: cast_nullable_to_non_nullable
as List<Languages>?,
  ));
}


}


/// @nodoc
mixin _$RowVersionWrapperModel {

@JsonKey(name: 'ROW_VERSIONS') List<RowVersions>? get rowVersionslist;
/// Create a copy of RowVersionWrapperModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RowVersionWrapperModelCopyWith<RowVersionWrapperModel> get copyWith => _$RowVersionWrapperModelCopyWithImpl<RowVersionWrapperModel>(this as RowVersionWrapperModel, _$identity);

  /// Serializes this RowVersionWrapperModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RowVersionWrapperModel&&const DeepCollectionEquality().equals(other.rowVersionslist, rowVersionslist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(rowVersionslist));

@override
String toString() {
  return 'RowVersionWrapperModel(rowVersionslist: $rowVersionslist)';
}


}

/// @nodoc
abstract mixin class $RowVersionWrapperModelCopyWith<$Res>  {
  factory $RowVersionWrapperModelCopyWith(RowVersionWrapperModel value, $Res Function(RowVersionWrapperModel) _then) = _$RowVersionWrapperModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ROW_VERSIONS') List<RowVersions>? rowVersionslist
});




}
/// @nodoc
class _$RowVersionWrapperModelCopyWithImpl<$Res>
    implements $RowVersionWrapperModelCopyWith<$Res> {
  _$RowVersionWrapperModelCopyWithImpl(this._self, this._then);

  final RowVersionWrapperModel _self;
  final $Res Function(RowVersionWrapperModel) _then;

/// Create a copy of RowVersionWrapperModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rowVersionslist = freezed,}) {
  return _then(_self.copyWith(
rowVersionslist: freezed == rowVersionslist ? _self.rowVersionslist : rowVersionslist // ignore: cast_nullable_to_non_nullable
as List<RowVersions>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RowVersionWrapperModel].
extension RowVersionWrapperModelPatterns on RowVersionWrapperModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RowVersionWrapperModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RowVersionWrapperModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RowVersionWrapperModel value)  $default,){
final _that = this;
switch (_that) {
case _RowVersionWrapperModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RowVersionWrapperModel value)?  $default,){
final _that = this;
switch (_that) {
case _RowVersionWrapperModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ROW_VERSIONS')  List<RowVersions>? rowVersionslist)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RowVersionWrapperModel() when $default != null:
return $default(_that.rowVersionslist);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ROW_VERSIONS')  List<RowVersions>? rowVersionslist)  $default,) {final _that = this;
switch (_that) {
case _RowVersionWrapperModel():
return $default(_that.rowVersionslist);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ROW_VERSIONS')  List<RowVersions>? rowVersionslist)?  $default,) {final _that = this;
switch (_that) {
case _RowVersionWrapperModel() when $default != null:
return $default(_that.rowVersionslist);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RowVersionWrapperModel implements RowVersionWrapperModel {
  const _RowVersionWrapperModel({@JsonKey(name: 'ROW_VERSIONS') final  List<RowVersions>? rowVersionslist}): _rowVersionslist = rowVersionslist;
  factory _RowVersionWrapperModel.fromJson(Map<String, dynamic> json) => _$RowVersionWrapperModelFromJson(json);

 final  List<RowVersions>? _rowVersionslist;
@override@JsonKey(name: 'ROW_VERSIONS') List<RowVersions>? get rowVersionslist {
  final value = _rowVersionslist;
  if (value == null) return null;
  if (_rowVersionslist is EqualUnmodifiableListView) return _rowVersionslist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of RowVersionWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RowVersionWrapperModelCopyWith<_RowVersionWrapperModel> get copyWith => __$RowVersionWrapperModelCopyWithImpl<_RowVersionWrapperModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RowVersionWrapperModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RowVersionWrapperModel&&const DeepCollectionEquality().equals(other._rowVersionslist, _rowVersionslist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_rowVersionslist));

@override
String toString() {
  return 'RowVersionWrapperModel(rowVersionslist: $rowVersionslist)';
}


}

/// @nodoc
abstract mixin class _$RowVersionWrapperModelCopyWith<$Res> implements $RowVersionWrapperModelCopyWith<$Res> {
  factory _$RowVersionWrapperModelCopyWith(_RowVersionWrapperModel value, $Res Function(_RowVersionWrapperModel) _then) = __$RowVersionWrapperModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ROW_VERSIONS') List<RowVersions>? rowVersionslist
});




}
/// @nodoc
class __$RowVersionWrapperModelCopyWithImpl<$Res>
    implements _$RowVersionWrapperModelCopyWith<$Res> {
  __$RowVersionWrapperModelCopyWithImpl(this._self, this._then);

  final _RowVersionWrapperModel _self;
  final $Res Function(_RowVersionWrapperModel) _then;

/// Create a copy of RowVersionWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rowVersionslist = freezed,}) {
  return _then(_RowVersionWrapperModel(
rowVersionslist: freezed == rowVersionslist ? _self._rowVersionslist : rowVersionslist // ignore: cast_nullable_to_non_nullable
as List<RowVersions>?,
  ));
}


}


/// @nodoc
mixin _$AppConfig {

@JsonKey(name: 'NETWORK_DETECTION') String get networkDetection;@JsonKey(name: 'PERSISTENCE_MODE') String get persistenceMode;@JsonKey(name: 'SYNC_METHOD') String get syncMethod;@JsonKey(name: 'SYNC_TRIGGER') String get syncTrigger;@JsonKey(name: 'TENANT_ID') String? get tenantId;@JsonKey(name: 'PROXIMITY_SEARCH_RANGE') double? get maxRadius;@JsonKey(name: 'BOUNDARY_LAST_LEVEL_MAX_SELECTION') int? get boundaryLastLevelMaxSelection;
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigCopyWith<AppConfig> get copyWith => _$AppConfigCopyWithImpl<AppConfig>(this as AppConfig, _$identity);

  /// Serializes this AppConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfig&&(identical(other.networkDetection, networkDetection) || other.networkDetection == networkDetection)&&(identical(other.persistenceMode, persistenceMode) || other.persistenceMode == persistenceMode)&&(identical(other.syncMethod, syncMethod) || other.syncMethod == syncMethod)&&(identical(other.syncTrigger, syncTrigger) || other.syncTrigger == syncTrigger)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.maxRadius, maxRadius) || other.maxRadius == maxRadius)&&(identical(other.boundaryLastLevelMaxSelection, boundaryLastLevelMaxSelection) || other.boundaryLastLevelMaxSelection == boundaryLastLevelMaxSelection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,networkDetection,persistenceMode,syncMethod,syncTrigger,tenantId,maxRadius,boundaryLastLevelMaxSelection);

@override
String toString() {
  return 'AppConfig(networkDetection: $networkDetection, persistenceMode: $persistenceMode, syncMethod: $syncMethod, syncTrigger: $syncTrigger, tenantId: $tenantId, maxRadius: $maxRadius, boundaryLastLevelMaxSelection: $boundaryLastLevelMaxSelection)';
}


}

/// @nodoc
abstract mixin class $AppConfigCopyWith<$Res>  {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) _then) = _$AppConfigCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'NETWORK_DETECTION') String networkDetection,@JsonKey(name: 'PERSISTENCE_MODE') String persistenceMode,@JsonKey(name: 'SYNC_METHOD') String syncMethod,@JsonKey(name: 'SYNC_TRIGGER') String syncTrigger,@JsonKey(name: 'TENANT_ID') String? tenantId,@JsonKey(name: 'PROXIMITY_SEARCH_RANGE') double? maxRadius,@JsonKey(name: 'BOUNDARY_LAST_LEVEL_MAX_SELECTION') int? boundaryLastLevelMaxSelection
});




}
/// @nodoc
class _$AppConfigCopyWithImpl<$Res>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._self, this._then);

  final AppConfig _self;
  final $Res Function(AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? networkDetection = null,Object? persistenceMode = null,Object? syncMethod = null,Object? syncTrigger = null,Object? tenantId = freezed,Object? maxRadius = freezed,Object? boundaryLastLevelMaxSelection = freezed,}) {
  return _then(_self.copyWith(
networkDetection: null == networkDetection ? _self.networkDetection : networkDetection // ignore: cast_nullable_to_non_nullable
as String,persistenceMode: null == persistenceMode ? _self.persistenceMode : persistenceMode // ignore: cast_nullable_to_non_nullable
as String,syncMethod: null == syncMethod ? _self.syncMethod : syncMethod // ignore: cast_nullable_to_non_nullable
as String,syncTrigger: null == syncTrigger ? _self.syncTrigger : syncTrigger // ignore: cast_nullable_to_non_nullable
as String,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,maxRadius: freezed == maxRadius ? _self.maxRadius : maxRadius // ignore: cast_nullable_to_non_nullable
as double?,boundaryLastLevelMaxSelection: freezed == boundaryLastLevelMaxSelection ? _self.boundaryLastLevelMaxSelection : boundaryLastLevelMaxSelection // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppConfig].
extension AppConfigPatterns on AppConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfig value)  $default,){
final _that = this;
switch (_that) {
case _AppConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'NETWORK_DETECTION')  String networkDetection, @JsonKey(name: 'PERSISTENCE_MODE')  String persistenceMode, @JsonKey(name: 'SYNC_METHOD')  String syncMethod, @JsonKey(name: 'SYNC_TRIGGER')  String syncTrigger, @JsonKey(name: 'TENANT_ID')  String? tenantId, @JsonKey(name: 'PROXIMITY_SEARCH_RANGE')  double? maxRadius, @JsonKey(name: 'BOUNDARY_LAST_LEVEL_MAX_SELECTION')  int? boundaryLastLevelMaxSelection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.networkDetection,_that.persistenceMode,_that.syncMethod,_that.syncTrigger,_that.tenantId,_that.maxRadius,_that.boundaryLastLevelMaxSelection);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'NETWORK_DETECTION')  String networkDetection, @JsonKey(name: 'PERSISTENCE_MODE')  String persistenceMode, @JsonKey(name: 'SYNC_METHOD')  String syncMethod, @JsonKey(name: 'SYNC_TRIGGER')  String syncTrigger, @JsonKey(name: 'TENANT_ID')  String? tenantId, @JsonKey(name: 'PROXIMITY_SEARCH_RANGE')  double? maxRadius, @JsonKey(name: 'BOUNDARY_LAST_LEVEL_MAX_SELECTION')  int? boundaryLastLevelMaxSelection)  $default,) {final _that = this;
switch (_that) {
case _AppConfig():
return $default(_that.networkDetection,_that.persistenceMode,_that.syncMethod,_that.syncTrigger,_that.tenantId,_that.maxRadius,_that.boundaryLastLevelMaxSelection);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'NETWORK_DETECTION')  String networkDetection, @JsonKey(name: 'PERSISTENCE_MODE')  String persistenceMode, @JsonKey(name: 'SYNC_METHOD')  String syncMethod, @JsonKey(name: 'SYNC_TRIGGER')  String syncTrigger, @JsonKey(name: 'TENANT_ID')  String? tenantId, @JsonKey(name: 'PROXIMITY_SEARCH_RANGE')  double? maxRadius, @JsonKey(name: 'BOUNDARY_LAST_LEVEL_MAX_SELECTION')  int? boundaryLastLevelMaxSelection)?  $default,) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.networkDetection,_that.persistenceMode,_that.syncMethod,_that.syncTrigger,_that.tenantId,_that.maxRadius,_that.boundaryLastLevelMaxSelection);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppConfig implements AppConfig {
   _AppConfig({@JsonKey(name: 'NETWORK_DETECTION') required this.networkDetection, @JsonKey(name: 'PERSISTENCE_MODE') required this.persistenceMode, @JsonKey(name: 'SYNC_METHOD') required this.syncMethod, @JsonKey(name: 'SYNC_TRIGGER') required this.syncTrigger, @JsonKey(name: 'TENANT_ID') this.tenantId, @JsonKey(name: 'PROXIMITY_SEARCH_RANGE') this.maxRadius, @JsonKey(name: 'BOUNDARY_LAST_LEVEL_MAX_SELECTION') this.boundaryLastLevelMaxSelection});
  factory _AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);

@override@JsonKey(name: 'NETWORK_DETECTION') final  String networkDetection;
@override@JsonKey(name: 'PERSISTENCE_MODE') final  String persistenceMode;
@override@JsonKey(name: 'SYNC_METHOD') final  String syncMethod;
@override@JsonKey(name: 'SYNC_TRIGGER') final  String syncTrigger;
@override@JsonKey(name: 'TENANT_ID') final  String? tenantId;
@override@JsonKey(name: 'PROXIMITY_SEARCH_RANGE') final  double? maxRadius;
@override@JsonKey(name: 'BOUNDARY_LAST_LEVEL_MAX_SELECTION') final  int? boundaryLastLevelMaxSelection;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigCopyWith<_AppConfig> get copyWith => __$AppConfigCopyWithImpl<_AppConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfig&&(identical(other.networkDetection, networkDetection) || other.networkDetection == networkDetection)&&(identical(other.persistenceMode, persistenceMode) || other.persistenceMode == persistenceMode)&&(identical(other.syncMethod, syncMethod) || other.syncMethod == syncMethod)&&(identical(other.syncTrigger, syncTrigger) || other.syncTrigger == syncTrigger)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.maxRadius, maxRadius) || other.maxRadius == maxRadius)&&(identical(other.boundaryLastLevelMaxSelection, boundaryLastLevelMaxSelection) || other.boundaryLastLevelMaxSelection == boundaryLastLevelMaxSelection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,networkDetection,persistenceMode,syncMethod,syncTrigger,tenantId,maxRadius,boundaryLastLevelMaxSelection);

@override
String toString() {
  return 'AppConfig(networkDetection: $networkDetection, persistenceMode: $persistenceMode, syncMethod: $syncMethod, syncTrigger: $syncTrigger, tenantId: $tenantId, maxRadius: $maxRadius, boundaryLastLevelMaxSelection: $boundaryLastLevelMaxSelection)';
}


}

/// @nodoc
abstract mixin class _$AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$AppConfigCopyWith(_AppConfig value, $Res Function(_AppConfig) _then) = __$AppConfigCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'NETWORK_DETECTION') String networkDetection,@JsonKey(name: 'PERSISTENCE_MODE') String persistenceMode,@JsonKey(name: 'SYNC_METHOD') String syncMethod,@JsonKey(name: 'SYNC_TRIGGER') String syncTrigger,@JsonKey(name: 'TENANT_ID') String? tenantId,@JsonKey(name: 'PROXIMITY_SEARCH_RANGE') double? maxRadius,@JsonKey(name: 'BOUNDARY_LAST_LEVEL_MAX_SELECTION') int? boundaryLastLevelMaxSelection
});




}
/// @nodoc
class __$AppConfigCopyWithImpl<$Res>
    implements _$AppConfigCopyWith<$Res> {
  __$AppConfigCopyWithImpl(this._self, this._then);

  final _AppConfig _self;
  final $Res Function(_AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? networkDetection = null,Object? persistenceMode = null,Object? syncMethod = null,Object? syncTrigger = null,Object? tenantId = freezed,Object? maxRadius = freezed,Object? boundaryLastLevelMaxSelection = freezed,}) {
  return _then(_AppConfig(
networkDetection: null == networkDetection ? _self.networkDetection : networkDetection // ignore: cast_nullable_to_non_nullable
as String,persistenceMode: null == persistenceMode ? _self.persistenceMode : persistenceMode // ignore: cast_nullable_to_non_nullable
as String,syncMethod: null == syncMethod ? _self.syncMethod : syncMethod // ignore: cast_nullable_to_non_nullable
as String,syncTrigger: null == syncTrigger ? _self.syncTrigger : syncTrigger // ignore: cast_nullable_to_non_nullable
as String,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,maxRadius: freezed == maxRadius ? _self.maxRadius : maxRadius // ignore: cast_nullable_to_non_nullable
as double?,boundaryLastLevelMaxSelection: freezed == boundaryLastLevelMaxSelection ? _self.boundaryLastLevelMaxSelection : boundaryLastLevelMaxSelection // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$IdTypeOptions {

 String get name; String get code;
/// Create a copy of IdTypeOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdTypeOptionsCopyWith<IdTypeOptions> get copyWith => _$IdTypeOptionsCopyWithImpl<IdTypeOptions>(this as IdTypeOptions, _$identity);

  /// Serializes this IdTypeOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdTypeOptions&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'IdTypeOptions(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class $IdTypeOptionsCopyWith<$Res>  {
  factory $IdTypeOptionsCopyWith(IdTypeOptions value, $Res Function(IdTypeOptions) _then) = _$IdTypeOptionsCopyWithImpl;
@useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class _$IdTypeOptionsCopyWithImpl<$Res>
    implements $IdTypeOptionsCopyWith<$Res> {
  _$IdTypeOptionsCopyWithImpl(this._self, this._then);

  final IdTypeOptions _self;
  final $Res Function(IdTypeOptions) _then;

/// Create a copy of IdTypeOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IdTypeOptions].
extension IdTypeOptionsPatterns on IdTypeOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdTypeOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdTypeOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdTypeOptions value)  $default,){
final _that = this;
switch (_that) {
case _IdTypeOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdTypeOptions value)?  $default,){
final _that = this;
switch (_that) {
case _IdTypeOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdTypeOptions() when $default != null:
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code)  $default,) {final _that = this;
switch (_that) {
case _IdTypeOptions():
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code)?  $default,) {final _that = this;
switch (_that) {
case _IdTypeOptions() when $default != null:
return $default(_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IdTypeOptions implements IdTypeOptions {
   _IdTypeOptions({required this.name, required this.code});
  factory _IdTypeOptions.fromJson(Map<String, dynamic> json) => _$IdTypeOptionsFromJson(json);

@override final  String name;
@override final  String code;

/// Create a copy of IdTypeOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdTypeOptionsCopyWith<_IdTypeOptions> get copyWith => __$IdTypeOptionsCopyWithImpl<_IdTypeOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IdTypeOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdTypeOptions&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'IdTypeOptions(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$IdTypeOptionsCopyWith<$Res> implements $IdTypeOptionsCopyWith<$Res> {
  factory _$IdTypeOptionsCopyWith(_IdTypeOptions value, $Res Function(_IdTypeOptions) _then) = __$IdTypeOptionsCopyWithImpl;
@override @useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class __$IdTypeOptionsCopyWithImpl<$Res>
    implements _$IdTypeOptionsCopyWith<$Res> {
  __$IdTypeOptionsCopyWithImpl(this._self, this._then);

  final _IdTypeOptions _self;
  final $Res Function(_IdTypeOptions) _then;

/// Create a copy of IdTypeOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,}) {
  return _then(_IdTypeOptions(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RelationShipTypeOptions {

 String get name; String get code; bool get active;
/// Create a copy of RelationShipTypeOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RelationShipTypeOptionsCopyWith<RelationShipTypeOptions> get copyWith => _$RelationShipTypeOptionsCopyWithImpl<RelationShipTypeOptions>(this as RelationShipTypeOptions, _$identity);

  /// Serializes this RelationShipTypeOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RelationShipTypeOptions&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,active);

@override
String toString() {
  return 'RelationShipTypeOptions(name: $name, code: $code, active: $active)';
}


}

/// @nodoc
abstract mixin class $RelationShipTypeOptionsCopyWith<$Res>  {
  factory $RelationShipTypeOptionsCopyWith(RelationShipTypeOptions value, $Res Function(RelationShipTypeOptions) _then) = _$RelationShipTypeOptionsCopyWithImpl;
@useResult
$Res call({
 String name, String code, bool active
});




}
/// @nodoc
class _$RelationShipTypeOptionsCopyWithImpl<$Res>
    implements $RelationShipTypeOptionsCopyWith<$Res> {
  _$RelationShipTypeOptionsCopyWithImpl(this._self, this._then);

  final RelationShipTypeOptions _self;
  final $Res Function(RelationShipTypeOptions) _then;

/// Create a copy of RelationShipTypeOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,Object? active = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RelationShipTypeOptions].
extension RelationShipTypeOptionsPatterns on RelationShipTypeOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RelationShipTypeOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RelationShipTypeOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RelationShipTypeOptions value)  $default,){
final _that = this;
switch (_that) {
case _RelationShipTypeOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RelationShipTypeOptions value)?  $default,){
final _that = this;
switch (_that) {
case _RelationShipTypeOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RelationShipTypeOptions() when $default != null:
return $default(_that.name,_that.code,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code,  bool active)  $default,) {final _that = this;
switch (_that) {
case _RelationShipTypeOptions():
return $default(_that.name,_that.code,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _RelationShipTypeOptions() when $default != null:
return $default(_that.name,_that.code,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RelationShipTypeOptions implements RelationShipTypeOptions {
   _RelationShipTypeOptions({required this.name, required this.code, required this.active});
  factory _RelationShipTypeOptions.fromJson(Map<String, dynamic> json) => _$RelationShipTypeOptionsFromJson(json);

@override final  String name;
@override final  String code;
@override final  bool active;

/// Create a copy of RelationShipTypeOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RelationShipTypeOptionsCopyWith<_RelationShipTypeOptions> get copyWith => __$RelationShipTypeOptionsCopyWithImpl<_RelationShipTypeOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RelationShipTypeOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RelationShipTypeOptions&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,active);

@override
String toString() {
  return 'RelationShipTypeOptions(name: $name, code: $code, active: $active)';
}


}

/// @nodoc
abstract mixin class _$RelationShipTypeOptionsCopyWith<$Res> implements $RelationShipTypeOptionsCopyWith<$Res> {
  factory _$RelationShipTypeOptionsCopyWith(_RelationShipTypeOptions value, $Res Function(_RelationShipTypeOptions) _then) = __$RelationShipTypeOptionsCopyWithImpl;
@override @useResult
$Res call({
 String name, String code, bool active
});




}
/// @nodoc
class __$RelationShipTypeOptionsCopyWithImpl<$Res>
    implements _$RelationShipTypeOptionsCopyWith<$Res> {
  __$RelationShipTypeOptionsCopyWithImpl(this._self, this._then);

  final _RelationShipTypeOptions _self;
  final $Res Function(_RelationShipTypeOptions) _then;

/// Create a copy of RelationShipTypeOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,Object? active = null,}) {
  return _then(_RelationShipTypeOptions(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$BandWidthBatchSize {

@JsonKey(name: 'MIN_RANGE') double get minRange;@JsonKey(name: 'MAX_RANGE') double get maxRange;@JsonKey(name: 'BATCH_SIZE') int get batchSize;
/// Create a copy of BandWidthBatchSize
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BandWidthBatchSizeCopyWith<BandWidthBatchSize> get copyWith => _$BandWidthBatchSizeCopyWithImpl<BandWidthBatchSize>(this as BandWidthBatchSize, _$identity);

  /// Serializes this BandWidthBatchSize to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BandWidthBatchSize&&(identical(other.minRange, minRange) || other.minRange == minRange)&&(identical(other.maxRange, maxRange) || other.maxRange == maxRange)&&(identical(other.batchSize, batchSize) || other.batchSize == batchSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minRange,maxRange,batchSize);

@override
String toString() {
  return 'BandWidthBatchSize(minRange: $minRange, maxRange: $maxRange, batchSize: $batchSize)';
}


}

/// @nodoc
abstract mixin class $BandWidthBatchSizeCopyWith<$Res>  {
  factory $BandWidthBatchSizeCopyWith(BandWidthBatchSize value, $Res Function(BandWidthBatchSize) _then) = _$BandWidthBatchSizeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'MIN_RANGE') double minRange,@JsonKey(name: 'MAX_RANGE') double maxRange,@JsonKey(name: 'BATCH_SIZE') int batchSize
});




}
/// @nodoc
class _$BandWidthBatchSizeCopyWithImpl<$Res>
    implements $BandWidthBatchSizeCopyWith<$Res> {
  _$BandWidthBatchSizeCopyWithImpl(this._self, this._then);

  final BandWidthBatchSize _self;
  final $Res Function(BandWidthBatchSize) _then;

/// Create a copy of BandWidthBatchSize
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minRange = null,Object? maxRange = null,Object? batchSize = null,}) {
  return _then(_self.copyWith(
minRange: null == minRange ? _self.minRange : minRange // ignore: cast_nullable_to_non_nullable
as double,maxRange: null == maxRange ? _self.maxRange : maxRange // ignore: cast_nullable_to_non_nullable
as double,batchSize: null == batchSize ? _self.batchSize : batchSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BandWidthBatchSize].
extension BandWidthBatchSizePatterns on BandWidthBatchSize {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BandWidthBatchSize value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BandWidthBatchSize() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BandWidthBatchSize value)  $default,){
final _that = this;
switch (_that) {
case _BandWidthBatchSize():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BandWidthBatchSize value)?  $default,){
final _that = this;
switch (_that) {
case _BandWidthBatchSize() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'MIN_RANGE')  double minRange, @JsonKey(name: 'MAX_RANGE')  double maxRange, @JsonKey(name: 'BATCH_SIZE')  int batchSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BandWidthBatchSize() when $default != null:
return $default(_that.minRange,_that.maxRange,_that.batchSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'MIN_RANGE')  double minRange, @JsonKey(name: 'MAX_RANGE')  double maxRange, @JsonKey(name: 'BATCH_SIZE')  int batchSize)  $default,) {final _that = this;
switch (_that) {
case _BandWidthBatchSize():
return $default(_that.minRange,_that.maxRange,_that.batchSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'MIN_RANGE')  double minRange, @JsonKey(name: 'MAX_RANGE')  double maxRange, @JsonKey(name: 'BATCH_SIZE')  int batchSize)?  $default,) {final _that = this;
switch (_that) {
case _BandWidthBatchSize() when $default != null:
return $default(_that.minRange,_that.maxRange,_that.batchSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BandWidthBatchSize implements BandWidthBatchSize {
   _BandWidthBatchSize({@JsonKey(name: 'MIN_RANGE') required this.minRange, @JsonKey(name: 'MAX_RANGE') required this.maxRange, @JsonKey(name: 'BATCH_SIZE') required this.batchSize});
  factory _BandWidthBatchSize.fromJson(Map<String, dynamic> json) => _$BandWidthBatchSizeFromJson(json);

@override@JsonKey(name: 'MIN_RANGE') final  double minRange;
@override@JsonKey(name: 'MAX_RANGE') final  double maxRange;
@override@JsonKey(name: 'BATCH_SIZE') final  int batchSize;

/// Create a copy of BandWidthBatchSize
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BandWidthBatchSizeCopyWith<_BandWidthBatchSize> get copyWith => __$BandWidthBatchSizeCopyWithImpl<_BandWidthBatchSize>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BandWidthBatchSizeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BandWidthBatchSize&&(identical(other.minRange, minRange) || other.minRange == minRange)&&(identical(other.maxRange, maxRange) || other.maxRange == maxRange)&&(identical(other.batchSize, batchSize) || other.batchSize == batchSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minRange,maxRange,batchSize);

@override
String toString() {
  return 'BandWidthBatchSize(minRange: $minRange, maxRange: $maxRange, batchSize: $batchSize)';
}


}

/// @nodoc
abstract mixin class _$BandWidthBatchSizeCopyWith<$Res> implements $BandWidthBatchSizeCopyWith<$Res> {
  factory _$BandWidthBatchSizeCopyWith(_BandWidthBatchSize value, $Res Function(_BandWidthBatchSize) _then) = __$BandWidthBatchSizeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'MIN_RANGE') double minRange,@JsonKey(name: 'MAX_RANGE') double maxRange,@JsonKey(name: 'BATCH_SIZE') int batchSize
});




}
/// @nodoc
class __$BandWidthBatchSizeCopyWithImpl<$Res>
    implements _$BandWidthBatchSizeCopyWith<$Res> {
  __$BandWidthBatchSizeCopyWithImpl(this._self, this._then);

  final _BandWidthBatchSize _self;
  final $Res Function(_BandWidthBatchSize) _then;

/// Create a copy of BandWidthBatchSize
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minRange = null,Object? maxRange = null,Object? batchSize = null,}) {
  return _then(_BandWidthBatchSize(
minRange: null == minRange ? _self.minRange : minRange // ignore: cast_nullable_to_non_nullable
as double,maxRange: null == maxRange ? _self.maxRange : maxRange // ignore: cast_nullable_to_non_nullable
as double,batchSize: null == batchSize ? _self.batchSize : batchSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BeneficiaryIdConfig {

@JsonKey(name: 'MIN_COUNT') double get minCount;@JsonKey(name: 'BATCH_SIZE') int get batchSize;
/// Create a copy of BeneficiaryIdConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BeneficiaryIdConfigCopyWith<BeneficiaryIdConfig> get copyWith => _$BeneficiaryIdConfigCopyWithImpl<BeneficiaryIdConfig>(this as BeneficiaryIdConfig, _$identity);

  /// Serializes this BeneficiaryIdConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BeneficiaryIdConfig&&(identical(other.minCount, minCount) || other.minCount == minCount)&&(identical(other.batchSize, batchSize) || other.batchSize == batchSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minCount,batchSize);

@override
String toString() {
  return 'BeneficiaryIdConfig(minCount: $minCount, batchSize: $batchSize)';
}


}

/// @nodoc
abstract mixin class $BeneficiaryIdConfigCopyWith<$Res>  {
  factory $BeneficiaryIdConfigCopyWith(BeneficiaryIdConfig value, $Res Function(BeneficiaryIdConfig) _then) = _$BeneficiaryIdConfigCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'MIN_COUNT') double minCount,@JsonKey(name: 'BATCH_SIZE') int batchSize
});




}
/// @nodoc
class _$BeneficiaryIdConfigCopyWithImpl<$Res>
    implements $BeneficiaryIdConfigCopyWith<$Res> {
  _$BeneficiaryIdConfigCopyWithImpl(this._self, this._then);

  final BeneficiaryIdConfig _self;
  final $Res Function(BeneficiaryIdConfig) _then;

/// Create a copy of BeneficiaryIdConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minCount = null,Object? batchSize = null,}) {
  return _then(_self.copyWith(
minCount: null == minCount ? _self.minCount : minCount // ignore: cast_nullable_to_non_nullable
as double,batchSize: null == batchSize ? _self.batchSize : batchSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BeneficiaryIdConfig].
extension BeneficiaryIdConfigPatterns on BeneficiaryIdConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BeneficiaryIdConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BeneficiaryIdConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BeneficiaryIdConfig value)  $default,){
final _that = this;
switch (_that) {
case _BeneficiaryIdConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BeneficiaryIdConfig value)?  $default,){
final _that = this;
switch (_that) {
case _BeneficiaryIdConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'MIN_COUNT')  double minCount, @JsonKey(name: 'BATCH_SIZE')  int batchSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BeneficiaryIdConfig() when $default != null:
return $default(_that.minCount,_that.batchSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'MIN_COUNT')  double minCount, @JsonKey(name: 'BATCH_SIZE')  int batchSize)  $default,) {final _that = this;
switch (_that) {
case _BeneficiaryIdConfig():
return $default(_that.minCount,_that.batchSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'MIN_COUNT')  double minCount, @JsonKey(name: 'BATCH_SIZE')  int batchSize)?  $default,) {final _that = this;
switch (_that) {
case _BeneficiaryIdConfig() when $default != null:
return $default(_that.minCount,_that.batchSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BeneficiaryIdConfig implements BeneficiaryIdConfig {
   _BeneficiaryIdConfig({@JsonKey(name: 'MIN_COUNT') required this.minCount, @JsonKey(name: 'BATCH_SIZE') required this.batchSize});
  factory _BeneficiaryIdConfig.fromJson(Map<String, dynamic> json) => _$BeneficiaryIdConfigFromJson(json);

@override@JsonKey(name: 'MIN_COUNT') final  double minCount;
@override@JsonKey(name: 'BATCH_SIZE') final  int batchSize;

/// Create a copy of BeneficiaryIdConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BeneficiaryIdConfigCopyWith<_BeneficiaryIdConfig> get copyWith => __$BeneficiaryIdConfigCopyWithImpl<_BeneficiaryIdConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BeneficiaryIdConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BeneficiaryIdConfig&&(identical(other.minCount, minCount) || other.minCount == minCount)&&(identical(other.batchSize, batchSize) || other.batchSize == batchSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minCount,batchSize);

@override
String toString() {
  return 'BeneficiaryIdConfig(minCount: $minCount, batchSize: $batchSize)';
}


}

/// @nodoc
abstract mixin class _$BeneficiaryIdConfigCopyWith<$Res> implements $BeneficiaryIdConfigCopyWith<$Res> {
  factory _$BeneficiaryIdConfigCopyWith(_BeneficiaryIdConfig value, $Res Function(_BeneficiaryIdConfig) _then) = __$BeneficiaryIdConfigCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'MIN_COUNT') double minCount,@JsonKey(name: 'BATCH_SIZE') int batchSize
});




}
/// @nodoc
class __$BeneficiaryIdConfigCopyWithImpl<$Res>
    implements _$BeneficiaryIdConfigCopyWith<$Res> {
  __$BeneficiaryIdConfigCopyWithImpl(this._self, this._then);

  final _BeneficiaryIdConfig _self;
  final $Res Function(_BeneficiaryIdConfig) _then;

/// Create a copy of BeneficiaryIdConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minCount = null,Object? batchSize = null,}) {
  return _then(_BeneficiaryIdConfig(
minCount: null == minCount ? _self.minCount : minCount // ignore: cast_nullable_to_non_nullable
as double,batchSize: null == batchSize ? _self.batchSize : batchSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DeliveryCommentOptions {

 String get name; String get code;
/// Create a copy of DeliveryCommentOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryCommentOptionsCopyWith<DeliveryCommentOptions> get copyWith => _$DeliveryCommentOptionsCopyWithImpl<DeliveryCommentOptions>(this as DeliveryCommentOptions, _$identity);

  /// Serializes this DeliveryCommentOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryCommentOptions&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'DeliveryCommentOptions(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class $DeliveryCommentOptionsCopyWith<$Res>  {
  factory $DeliveryCommentOptionsCopyWith(DeliveryCommentOptions value, $Res Function(DeliveryCommentOptions) _then) = _$DeliveryCommentOptionsCopyWithImpl;
@useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class _$DeliveryCommentOptionsCopyWithImpl<$Res>
    implements $DeliveryCommentOptionsCopyWith<$Res> {
  _$DeliveryCommentOptionsCopyWithImpl(this._self, this._then);

  final DeliveryCommentOptions _self;
  final $Res Function(DeliveryCommentOptions) _then;

/// Create a copy of DeliveryCommentOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryCommentOptions].
extension DeliveryCommentOptionsPatterns on DeliveryCommentOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryCommentOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryCommentOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryCommentOptions value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryCommentOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryCommentOptions value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryCommentOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryCommentOptions() when $default != null:
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code)  $default,) {final _that = this;
switch (_that) {
case _DeliveryCommentOptions():
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryCommentOptions() when $default != null:
return $default(_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryCommentOptions implements DeliveryCommentOptions {
   _DeliveryCommentOptions({required this.name, required this.code});
  factory _DeliveryCommentOptions.fromJson(Map<String, dynamic> json) => _$DeliveryCommentOptionsFromJson(json);

@override final  String name;
@override final  String code;

/// Create a copy of DeliveryCommentOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryCommentOptionsCopyWith<_DeliveryCommentOptions> get copyWith => __$DeliveryCommentOptionsCopyWithImpl<_DeliveryCommentOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryCommentOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryCommentOptions&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'DeliveryCommentOptions(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$DeliveryCommentOptionsCopyWith<$Res> implements $DeliveryCommentOptionsCopyWith<$Res> {
  factory _$DeliveryCommentOptionsCopyWith(_DeliveryCommentOptions value, $Res Function(_DeliveryCommentOptions) _then) = __$DeliveryCommentOptionsCopyWithImpl;
@override @useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class __$DeliveryCommentOptionsCopyWithImpl<$Res>
    implements _$DeliveryCommentOptionsCopyWith<$Res> {
  __$DeliveryCommentOptionsCopyWithImpl(this._self, this._then);

  final _DeliveryCommentOptions _self;
  final $Res Function(_DeliveryCommentOptions) _then;

/// Create a copy of DeliveryCommentOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,}) {
  return _then(_DeliveryCommentOptions(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DeletionReasonOptions {

 String get value; String get code;
/// Create a copy of DeletionReasonOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletionReasonOptionsCopyWith<DeletionReasonOptions> get copyWith => _$DeletionReasonOptionsCopyWithImpl<DeletionReasonOptions>(this as DeletionReasonOptions, _$identity);

  /// Serializes this DeletionReasonOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletionReasonOptions&&(identical(other.value, value) || other.value == value)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,code);

@override
String toString() {
  return 'DeletionReasonOptions(value: $value, code: $code)';
}


}

/// @nodoc
abstract mixin class $DeletionReasonOptionsCopyWith<$Res>  {
  factory $DeletionReasonOptionsCopyWith(DeletionReasonOptions value, $Res Function(DeletionReasonOptions) _then) = _$DeletionReasonOptionsCopyWithImpl;
@useResult
$Res call({
 String value, String code
});




}
/// @nodoc
class _$DeletionReasonOptionsCopyWithImpl<$Res>
    implements $DeletionReasonOptionsCopyWith<$Res> {
  _$DeletionReasonOptionsCopyWithImpl(this._self, this._then);

  final DeletionReasonOptions _self;
  final $Res Function(DeletionReasonOptions) _then;

/// Create a copy of DeletionReasonOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? code = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeletionReasonOptions].
extension DeletionReasonOptionsPatterns on DeletionReasonOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeletionReasonOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeletionReasonOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeletionReasonOptions value)  $default,){
final _that = this;
switch (_that) {
case _DeletionReasonOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeletionReasonOptions value)?  $default,){
final _that = this;
switch (_that) {
case _DeletionReasonOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeletionReasonOptions() when $default != null:
return $default(_that.value,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String code)  $default,) {final _that = this;
switch (_that) {
case _DeletionReasonOptions():
return $default(_that.value,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String code)?  $default,) {final _that = this;
switch (_that) {
case _DeletionReasonOptions() when $default != null:
return $default(_that.value,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeletionReasonOptions implements DeletionReasonOptions {
   _DeletionReasonOptions({required this.value, required this.code});
  factory _DeletionReasonOptions.fromJson(Map<String, dynamic> json) => _$DeletionReasonOptionsFromJson(json);

@override final  String value;
@override final  String code;

/// Create a copy of DeletionReasonOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletionReasonOptionsCopyWith<_DeletionReasonOptions> get copyWith => __$DeletionReasonOptionsCopyWithImpl<_DeletionReasonOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeletionReasonOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletionReasonOptions&&(identical(other.value, value) || other.value == value)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,code);

@override
String toString() {
  return 'DeletionReasonOptions(value: $value, code: $code)';
}


}

/// @nodoc
abstract mixin class _$DeletionReasonOptionsCopyWith<$Res> implements $DeletionReasonOptionsCopyWith<$Res> {
  factory _$DeletionReasonOptionsCopyWith(_DeletionReasonOptions value, $Res Function(_DeletionReasonOptions) _then) = __$DeletionReasonOptionsCopyWithImpl;
@override @useResult
$Res call({
 String value, String code
});




}
/// @nodoc
class __$DeletionReasonOptionsCopyWithImpl<$Res>
    implements _$DeletionReasonOptionsCopyWith<$Res> {
  __$DeletionReasonOptionsCopyWithImpl(this._self, this._then);

  final _DeletionReasonOptions _self;
  final $Res Function(_DeletionReasonOptions) _then;

/// Create a copy of DeletionReasonOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? code = null,}) {
  return _then(_DeletionReasonOptions(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GenderOptions {

 String get name; String get code;
/// Create a copy of GenderOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenderOptionsCopyWith<GenderOptions> get copyWith => _$GenderOptionsCopyWithImpl<GenderOptions>(this as GenderOptions, _$identity);

  /// Serializes this GenderOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenderOptions&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'GenderOptions(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class $GenderOptionsCopyWith<$Res>  {
  factory $GenderOptionsCopyWith(GenderOptions value, $Res Function(GenderOptions) _then) = _$GenderOptionsCopyWithImpl;
@useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class _$GenderOptionsCopyWithImpl<$Res>
    implements $GenderOptionsCopyWith<$Res> {
  _$GenderOptionsCopyWithImpl(this._self, this._then);

  final GenderOptions _self;
  final $Res Function(GenderOptions) _then;

/// Create a copy of GenderOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GenderOptions].
extension GenderOptionsPatterns on GenderOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenderOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenderOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenderOptions value)  $default,){
final _that = this;
switch (_that) {
case _GenderOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenderOptions value)?  $default,){
final _that = this;
switch (_that) {
case _GenderOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenderOptions() when $default != null:
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code)  $default,) {final _that = this;
switch (_that) {
case _GenderOptions():
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code)?  $default,) {final _that = this;
switch (_that) {
case _GenderOptions() when $default != null:
return $default(_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenderOptions implements GenderOptions {
   _GenderOptions({required this.name, required this.code});
  factory _GenderOptions.fromJson(Map<String, dynamic> json) => _$GenderOptionsFromJson(json);

@override final  String name;
@override final  String code;

/// Create a copy of GenderOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenderOptionsCopyWith<_GenderOptions> get copyWith => __$GenderOptionsCopyWithImpl<_GenderOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenderOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenderOptions&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'GenderOptions(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$GenderOptionsCopyWith<$Res> implements $GenderOptionsCopyWith<$Res> {
  factory _$GenderOptionsCopyWith(_GenderOptions value, $Res Function(_GenderOptions) _then) = __$GenderOptionsCopyWithImpl;
@override @useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class __$GenderOptionsCopyWithImpl<$Res>
    implements _$GenderOptionsCopyWith<$Res> {
  __$GenderOptionsCopyWithImpl(this._self, this._then);

  final _GenderOptions _self;
  final $Res Function(_GenderOptions) _then;

/// Create a copy of GenderOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,}) {
  return _then(_GenderOptions(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BackgroundServiceConfig {

@JsonKey(name: 'BATTERY_PERCENT_CUT_OFF') int get batteryPercentCutOff;@JsonKey(name: 'SERVICE_INTERVAL') int get serviceInterval;@JsonKey(name: 'API_CONCURRENCY') int get apiConcurrency;
/// Create a copy of BackgroundServiceConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackgroundServiceConfigCopyWith<BackgroundServiceConfig> get copyWith => _$BackgroundServiceConfigCopyWithImpl<BackgroundServiceConfig>(this as BackgroundServiceConfig, _$identity);

  /// Serializes this BackgroundServiceConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackgroundServiceConfig&&(identical(other.batteryPercentCutOff, batteryPercentCutOff) || other.batteryPercentCutOff == batteryPercentCutOff)&&(identical(other.serviceInterval, serviceInterval) || other.serviceInterval == serviceInterval)&&(identical(other.apiConcurrency, apiConcurrency) || other.apiConcurrency == apiConcurrency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,batteryPercentCutOff,serviceInterval,apiConcurrency);

@override
String toString() {
  return 'BackgroundServiceConfig(batteryPercentCutOff: $batteryPercentCutOff, serviceInterval: $serviceInterval, apiConcurrency: $apiConcurrency)';
}


}

/// @nodoc
abstract mixin class $BackgroundServiceConfigCopyWith<$Res>  {
  factory $BackgroundServiceConfigCopyWith(BackgroundServiceConfig value, $Res Function(BackgroundServiceConfig) _then) = _$BackgroundServiceConfigCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'BATTERY_PERCENT_CUT_OFF') int batteryPercentCutOff,@JsonKey(name: 'SERVICE_INTERVAL') int serviceInterval,@JsonKey(name: 'API_CONCURRENCY') int apiConcurrency
});




}
/// @nodoc
class _$BackgroundServiceConfigCopyWithImpl<$Res>
    implements $BackgroundServiceConfigCopyWith<$Res> {
  _$BackgroundServiceConfigCopyWithImpl(this._self, this._then);

  final BackgroundServiceConfig _self;
  final $Res Function(BackgroundServiceConfig) _then;

/// Create a copy of BackgroundServiceConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? batteryPercentCutOff = null,Object? serviceInterval = null,Object? apiConcurrency = null,}) {
  return _then(_self.copyWith(
batteryPercentCutOff: null == batteryPercentCutOff ? _self.batteryPercentCutOff : batteryPercentCutOff // ignore: cast_nullable_to_non_nullable
as int,serviceInterval: null == serviceInterval ? _self.serviceInterval : serviceInterval // ignore: cast_nullable_to_non_nullable
as int,apiConcurrency: null == apiConcurrency ? _self.apiConcurrency : apiConcurrency // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BackgroundServiceConfig].
extension BackgroundServiceConfigPatterns on BackgroundServiceConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackgroundServiceConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackgroundServiceConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackgroundServiceConfig value)  $default,){
final _that = this;
switch (_that) {
case _BackgroundServiceConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackgroundServiceConfig value)?  $default,){
final _that = this;
switch (_that) {
case _BackgroundServiceConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'BATTERY_PERCENT_CUT_OFF')  int batteryPercentCutOff, @JsonKey(name: 'SERVICE_INTERVAL')  int serviceInterval, @JsonKey(name: 'API_CONCURRENCY')  int apiConcurrency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackgroundServiceConfig() when $default != null:
return $default(_that.batteryPercentCutOff,_that.serviceInterval,_that.apiConcurrency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'BATTERY_PERCENT_CUT_OFF')  int batteryPercentCutOff, @JsonKey(name: 'SERVICE_INTERVAL')  int serviceInterval, @JsonKey(name: 'API_CONCURRENCY')  int apiConcurrency)  $default,) {final _that = this;
switch (_that) {
case _BackgroundServiceConfig():
return $default(_that.batteryPercentCutOff,_that.serviceInterval,_that.apiConcurrency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'BATTERY_PERCENT_CUT_OFF')  int batteryPercentCutOff, @JsonKey(name: 'SERVICE_INTERVAL')  int serviceInterval, @JsonKey(name: 'API_CONCURRENCY')  int apiConcurrency)?  $default,) {final _that = this;
switch (_that) {
case _BackgroundServiceConfig() when $default != null:
return $default(_that.batteryPercentCutOff,_that.serviceInterval,_that.apiConcurrency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BackgroundServiceConfig implements BackgroundServiceConfig {
   _BackgroundServiceConfig({@JsonKey(name: 'BATTERY_PERCENT_CUT_OFF') required this.batteryPercentCutOff, @JsonKey(name: 'SERVICE_INTERVAL') required this.serviceInterval, @JsonKey(name: 'API_CONCURRENCY') required this.apiConcurrency});
  factory _BackgroundServiceConfig.fromJson(Map<String, dynamic> json) => _$BackgroundServiceConfigFromJson(json);

@override@JsonKey(name: 'BATTERY_PERCENT_CUT_OFF') final  int batteryPercentCutOff;
@override@JsonKey(name: 'SERVICE_INTERVAL') final  int serviceInterval;
@override@JsonKey(name: 'API_CONCURRENCY') final  int apiConcurrency;

/// Create a copy of BackgroundServiceConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackgroundServiceConfigCopyWith<_BackgroundServiceConfig> get copyWith => __$BackgroundServiceConfigCopyWithImpl<_BackgroundServiceConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BackgroundServiceConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackgroundServiceConfig&&(identical(other.batteryPercentCutOff, batteryPercentCutOff) || other.batteryPercentCutOff == batteryPercentCutOff)&&(identical(other.serviceInterval, serviceInterval) || other.serviceInterval == serviceInterval)&&(identical(other.apiConcurrency, apiConcurrency) || other.apiConcurrency == apiConcurrency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,batteryPercentCutOff,serviceInterval,apiConcurrency);

@override
String toString() {
  return 'BackgroundServiceConfig(batteryPercentCutOff: $batteryPercentCutOff, serviceInterval: $serviceInterval, apiConcurrency: $apiConcurrency)';
}


}

/// @nodoc
abstract mixin class _$BackgroundServiceConfigCopyWith<$Res> implements $BackgroundServiceConfigCopyWith<$Res> {
  factory _$BackgroundServiceConfigCopyWith(_BackgroundServiceConfig value, $Res Function(_BackgroundServiceConfig) _then) = __$BackgroundServiceConfigCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'BATTERY_PERCENT_CUT_OFF') int batteryPercentCutOff,@JsonKey(name: 'SERVICE_INTERVAL') int serviceInterval,@JsonKey(name: 'API_CONCURRENCY') int apiConcurrency
});




}
/// @nodoc
class __$BackgroundServiceConfigCopyWithImpl<$Res>
    implements _$BackgroundServiceConfigCopyWith<$Res> {
  __$BackgroundServiceConfigCopyWithImpl(this._self, this._then);

  final _BackgroundServiceConfig _self;
  final $Res Function(_BackgroundServiceConfig) _then;

/// Create a copy of BackgroundServiceConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? batteryPercentCutOff = null,Object? serviceInterval = null,Object? apiConcurrency = null,}) {
  return _then(_BackgroundServiceConfig(
batteryPercentCutOff: null == batteryPercentCutOff ? _self.batteryPercentCutOff : batteryPercentCutOff // ignore: cast_nullable_to_non_nullable
as int,serviceInterval: null == serviceInterval ? _self.serviceInterval : serviceInterval // ignore: cast_nullable_to_non_nullable
as int,apiConcurrency: null == apiConcurrency ? _self.apiConcurrency : apiConcurrency // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BackendInterface {

@JsonKey(name: 'interfaces') List<Interfaces> get interface;
/// Create a copy of BackendInterface
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackendInterfaceCopyWith<BackendInterface> get copyWith => _$BackendInterfaceCopyWithImpl<BackendInterface>(this as BackendInterface, _$identity);

  /// Serializes this BackendInterface to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackendInterface&&const DeepCollectionEquality().equals(other.interface, interface));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(interface));

@override
String toString() {
  return 'BackendInterface(interface: $interface)';
}


}

/// @nodoc
abstract mixin class $BackendInterfaceCopyWith<$Res>  {
  factory $BackendInterfaceCopyWith(BackendInterface value, $Res Function(BackendInterface) _then) = _$BackendInterfaceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'interfaces') List<Interfaces> interface
});




}
/// @nodoc
class _$BackendInterfaceCopyWithImpl<$Res>
    implements $BackendInterfaceCopyWith<$Res> {
  _$BackendInterfaceCopyWithImpl(this._self, this._then);

  final BackendInterface _self;
  final $Res Function(BackendInterface) _then;

/// Create a copy of BackendInterface
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? interface = null,}) {
  return _then(_self.copyWith(
interface: null == interface ? _self.interface : interface // ignore: cast_nullable_to_non_nullable
as List<Interfaces>,
  ));
}

}


/// Adds pattern-matching-related methods to [BackendInterface].
extension BackendInterfacePatterns on BackendInterface {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackendInterface value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackendInterface() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackendInterface value)  $default,){
final _that = this;
switch (_that) {
case _BackendInterface():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackendInterface value)?  $default,){
final _that = this;
switch (_that) {
case _BackendInterface() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'interfaces')  List<Interfaces> interface)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackendInterface() when $default != null:
return $default(_that.interface);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'interfaces')  List<Interfaces> interface)  $default,) {final _that = this;
switch (_that) {
case _BackendInterface():
return $default(_that.interface);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'interfaces')  List<Interfaces> interface)?  $default,) {final _that = this;
switch (_that) {
case _BackendInterface() when $default != null:
return $default(_that.interface);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BackendInterface implements BackendInterface {
   _BackendInterface({@JsonKey(name: 'interfaces') required final  List<Interfaces> interface}): _interface = interface;
  factory _BackendInterface.fromJson(Map<String, dynamic> json) => _$BackendInterfaceFromJson(json);

 final  List<Interfaces> _interface;
@override@JsonKey(name: 'interfaces') List<Interfaces> get interface {
  if (_interface is EqualUnmodifiableListView) return _interface;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interface);
}


/// Create a copy of BackendInterface
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackendInterfaceCopyWith<_BackendInterface> get copyWith => __$BackendInterfaceCopyWithImpl<_BackendInterface>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BackendInterfaceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackendInterface&&const DeepCollectionEquality().equals(other._interface, _interface));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_interface));

@override
String toString() {
  return 'BackendInterface(interface: $interface)';
}


}

/// @nodoc
abstract mixin class _$BackendInterfaceCopyWith<$Res> implements $BackendInterfaceCopyWith<$Res> {
  factory _$BackendInterfaceCopyWith(_BackendInterface value, $Res Function(_BackendInterface) _then) = __$BackendInterfaceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'interfaces') List<Interfaces> interface
});




}
/// @nodoc
class __$BackendInterfaceCopyWithImpl<$Res>
    implements _$BackendInterfaceCopyWith<$Res> {
  __$BackendInterfaceCopyWithImpl(this._self, this._then);

  final _BackendInterface _self;
  final $Res Function(_BackendInterface) _then;

/// Create a copy of BackendInterface
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? interface = null,}) {
  return _then(_BackendInterface(
interface: null == interface ? _self._interface : interface // ignore: cast_nullable_to_non_nullable
as List<Interfaces>,
  ));
}


}


/// @nodoc
mixin _$InterfacesWrapper {

 List<Interfaces> get interface;
/// Create a copy of InterfacesWrapper
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterfacesWrapperCopyWith<InterfacesWrapper> get copyWith => _$InterfacesWrapperCopyWithImpl<InterfacesWrapper>(this as InterfacesWrapper, _$identity);

  /// Serializes this InterfacesWrapper to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterfacesWrapper&&const DeepCollectionEquality().equals(other.interface, interface));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(interface));

@override
String toString() {
  return 'InterfacesWrapper(interface: $interface)';
}


}

/// @nodoc
abstract mixin class $InterfacesWrapperCopyWith<$Res>  {
  factory $InterfacesWrapperCopyWith(InterfacesWrapper value, $Res Function(InterfacesWrapper) _then) = _$InterfacesWrapperCopyWithImpl;
@useResult
$Res call({
 List<Interfaces> interface
});




}
/// @nodoc
class _$InterfacesWrapperCopyWithImpl<$Res>
    implements $InterfacesWrapperCopyWith<$Res> {
  _$InterfacesWrapperCopyWithImpl(this._self, this._then);

  final InterfacesWrapper _self;
  final $Res Function(InterfacesWrapper) _then;

/// Create a copy of InterfacesWrapper
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? interface = null,}) {
  return _then(_self.copyWith(
interface: null == interface ? _self.interface : interface // ignore: cast_nullable_to_non_nullable
as List<Interfaces>,
  ));
}

}


/// Adds pattern-matching-related methods to [InterfacesWrapper].
extension InterfacesWrapperPatterns on InterfacesWrapper {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterfacesWrapper value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterfacesWrapper() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterfacesWrapper value)  $default,){
final _that = this;
switch (_that) {
case _InterfacesWrapper():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterfacesWrapper value)?  $default,){
final _that = this;
switch (_that) {
case _InterfacesWrapper() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Interfaces> interface)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterfacesWrapper() when $default != null:
return $default(_that.interface);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Interfaces> interface)  $default,) {final _that = this;
switch (_that) {
case _InterfacesWrapper():
return $default(_that.interface);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Interfaces> interface)?  $default,) {final _that = this;
switch (_that) {
case _InterfacesWrapper() when $default != null:
return $default(_that.interface);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterfacesWrapper implements InterfacesWrapper {
   _InterfacesWrapper({required final  List<Interfaces> interface}): _interface = interface;
  factory _InterfacesWrapper.fromJson(Map<String, dynamic> json) => _$InterfacesWrapperFromJson(json);

 final  List<Interfaces> _interface;
@override List<Interfaces> get interface {
  if (_interface is EqualUnmodifiableListView) return _interface;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interface);
}


/// Create a copy of InterfacesWrapper
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterfacesWrapperCopyWith<_InterfacesWrapper> get copyWith => __$InterfacesWrapperCopyWithImpl<_InterfacesWrapper>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterfacesWrapperToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterfacesWrapper&&const DeepCollectionEquality().equals(other._interface, _interface));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_interface));

@override
String toString() {
  return 'InterfacesWrapper(interface: $interface)';
}


}

/// @nodoc
abstract mixin class _$InterfacesWrapperCopyWith<$Res> implements $InterfacesWrapperCopyWith<$Res> {
  factory _$InterfacesWrapperCopyWith(_InterfacesWrapper value, $Res Function(_InterfacesWrapper) _then) = __$InterfacesWrapperCopyWithImpl;
@override @useResult
$Res call({
 List<Interfaces> interface
});




}
/// @nodoc
class __$InterfacesWrapperCopyWithImpl<$Res>
    implements _$InterfacesWrapperCopyWith<$Res> {
  __$InterfacesWrapperCopyWithImpl(this._self, this._then);

  final _InterfacesWrapper _self;
  final $Res Function(_InterfacesWrapper) _then;

/// Create a copy of InterfacesWrapper
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? interface = null,}) {
  return _then(_InterfacesWrapper(
interface: null == interface ? _self._interface : interface // ignore: cast_nullable_to_non_nullable
as List<Interfaces>,
  ));
}


}


/// @nodoc
mixin _$Interfaces {

 String get type; String get name; Config get config;
/// Create a copy of Interfaces
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterfacesCopyWith<Interfaces> get copyWith => _$InterfacesCopyWithImpl<Interfaces>(this as Interfaces, _$identity);

  /// Serializes this Interfaces to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Interfaces&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.config, config) || other.config == config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,name,config);

@override
String toString() {
  return 'Interfaces(type: $type, name: $name, config: $config)';
}


}

/// @nodoc
abstract mixin class $InterfacesCopyWith<$Res>  {
  factory $InterfacesCopyWith(Interfaces value, $Res Function(Interfaces) _then) = _$InterfacesCopyWithImpl;
@useResult
$Res call({
 String type, String name, Config config
});


$ConfigCopyWith<$Res> get config;

}
/// @nodoc
class _$InterfacesCopyWithImpl<$Res>
    implements $InterfacesCopyWith<$Res> {
  _$InterfacesCopyWithImpl(this._self, this._then);

  final Interfaces _self;
  final $Res Function(Interfaces) _then;

/// Create a copy of Interfaces
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? name = null,Object? config = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as Config,
  ));
}
/// Create a copy of Interfaces
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfigCopyWith<$Res> get config {
  
  return $ConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// Adds pattern-matching-related methods to [Interfaces].
extension InterfacesPatterns on Interfaces {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Interfaces value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Interfaces() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Interfaces value)  $default,){
final _that = this;
switch (_that) {
case _Interfaces():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Interfaces value)?  $default,){
final _that = this;
switch (_that) {
case _Interfaces() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String name,  Config config)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Interfaces() when $default != null:
return $default(_that.type,_that.name,_that.config);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String name,  Config config)  $default,) {final _that = this;
switch (_that) {
case _Interfaces():
return $default(_that.type,_that.name,_that.config);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String name,  Config config)?  $default,) {final _that = this;
switch (_that) {
case _Interfaces() when $default != null:
return $default(_that.type,_that.name,_that.config);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Interfaces implements Interfaces {
   _Interfaces({required this.type, required this.name, required this.config});
  factory _Interfaces.fromJson(Map<String, dynamic> json) => _$InterfacesFromJson(json);

@override final  String type;
@override final  String name;
@override final  Config config;

/// Create a copy of Interfaces
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterfacesCopyWith<_Interfaces> get copyWith => __$InterfacesCopyWithImpl<_Interfaces>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterfacesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Interfaces&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.config, config) || other.config == config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,name,config);

@override
String toString() {
  return 'Interfaces(type: $type, name: $name, config: $config)';
}


}

/// @nodoc
abstract mixin class _$InterfacesCopyWith<$Res> implements $InterfacesCopyWith<$Res> {
  factory _$InterfacesCopyWith(_Interfaces value, $Res Function(_Interfaces) _then) = __$InterfacesCopyWithImpl;
@override @useResult
$Res call({
 String type, String name, Config config
});


@override $ConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$InterfacesCopyWithImpl<$Res>
    implements _$InterfacesCopyWith<$Res> {
  __$InterfacesCopyWithImpl(this._self, this._then);

  final _Interfaces _self;
  final $Res Function(_Interfaces) _then;

/// Create a copy of Interfaces
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? name = null,Object? config = null,}) {
  return _then(_Interfaces(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as Config,
  ));
}

/// Create a copy of Interfaces
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfigCopyWith<$Res> get config {
  
  return $ConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// @nodoc
mixin _$Config {

 int get localStoreTTL;
/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigCopyWith<Config> get copyWith => _$ConfigCopyWithImpl<Config>(this as Config, _$identity);

  /// Serializes this Config to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Config&&(identical(other.localStoreTTL, localStoreTTL) || other.localStoreTTL == localStoreTTL));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localStoreTTL);

@override
String toString() {
  return 'Config(localStoreTTL: $localStoreTTL)';
}


}

/// @nodoc
abstract mixin class $ConfigCopyWith<$Res>  {
  factory $ConfigCopyWith(Config value, $Res Function(Config) _then) = _$ConfigCopyWithImpl;
@useResult
$Res call({
 int localStoreTTL
});




}
/// @nodoc
class _$ConfigCopyWithImpl<$Res>
    implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._self, this._then);

  final Config _self;
  final $Res Function(Config) _then;

/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localStoreTTL = null,}) {
  return _then(_self.copyWith(
localStoreTTL: null == localStoreTTL ? _self.localStoreTTL : localStoreTTL // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Config].
extension ConfigPatterns on Config {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Config value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Config() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Config value)  $default,){
final _that = this;
switch (_that) {
case _Config():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Config value)?  $default,){
final _that = this;
switch (_that) {
case _Config() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int localStoreTTL)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Config() when $default != null:
return $default(_that.localStoreTTL);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int localStoreTTL)  $default,) {final _that = this;
switch (_that) {
case _Config():
return $default(_that.localStoreTTL);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int localStoreTTL)?  $default,) {final _that = this;
switch (_that) {
case _Config() when $default != null:
return $default(_that.localStoreTTL);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Config implements Config {
   _Config({required this.localStoreTTL});
  factory _Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

@override final  int localStoreTTL;

/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfigCopyWith<_Config> get copyWith => __$ConfigCopyWithImpl<_Config>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Config&&(identical(other.localStoreTTL, localStoreTTL) || other.localStoreTTL == localStoreTTL));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localStoreTTL);

@override
String toString() {
  return 'Config(localStoreTTL: $localStoreTTL)';
}


}

/// @nodoc
abstract mixin class _$ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$ConfigCopyWith(_Config value, $Res Function(_Config) _then) = __$ConfigCopyWithImpl;
@override @useResult
$Res call({
 int localStoreTTL
});




}
/// @nodoc
class __$ConfigCopyWithImpl<$Res>
    implements _$ConfigCopyWith<$Res> {
  __$ConfigCopyWithImpl(this._self, this._then);

  final _Config _self;
  final $Res Function(_Config) _then;

/// Create a copy of Config
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localStoreTTL = null,}) {
  return _then(_Config(
localStoreTTL: null == localStoreTTL ? _self.localStoreTTL : localStoreTTL // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Languages {

 String get label; String get value; bool get isSelected;
/// Create a copy of Languages
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LanguagesCopyWith<Languages> get copyWith => _$LanguagesCopyWithImpl<Languages>(this as Languages, _$identity);

  /// Serializes this Languages to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Languages&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,value,isSelected);

@override
String toString() {
  return 'Languages(label: $label, value: $value, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class $LanguagesCopyWith<$Res>  {
  factory $LanguagesCopyWith(Languages value, $Res Function(Languages) _then) = _$LanguagesCopyWithImpl;
@useResult
$Res call({
 String label, String value, bool isSelected
});




}
/// @nodoc
class _$LanguagesCopyWithImpl<$Res>
    implements $LanguagesCopyWith<$Res> {
  _$LanguagesCopyWithImpl(this._self, this._then);

  final Languages _self;
  final $Res Function(Languages) _then;

/// Create a copy of Languages
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,Object? isSelected = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Languages].
extension LanguagesPatterns on Languages {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Languages value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Languages() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Languages value)  $default,){
final _that = this;
switch (_that) {
case _Languages():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Languages value)?  $default,){
final _that = this;
switch (_that) {
case _Languages() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String value,  bool isSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Languages() when $default != null:
return $default(_that.label,_that.value,_that.isSelected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String value,  bool isSelected)  $default,) {final _that = this;
switch (_that) {
case _Languages():
return $default(_that.label,_that.value,_that.isSelected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String value,  bool isSelected)?  $default,) {final _that = this;
switch (_that) {
case _Languages() when $default != null:
return $default(_that.label,_that.value,_that.isSelected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Languages implements Languages {
   _Languages({required this.label, required this.value, this.isSelected = false});
  factory _Languages.fromJson(Map<String, dynamic> json) => _$LanguagesFromJson(json);

@override final  String label;
@override final  String value;
@override@JsonKey() final  bool isSelected;

/// Create a copy of Languages
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LanguagesCopyWith<_Languages> get copyWith => __$LanguagesCopyWithImpl<_Languages>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LanguagesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Languages&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,value,isSelected);

@override
String toString() {
  return 'Languages(label: $label, value: $value, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class _$LanguagesCopyWith<$Res> implements $LanguagesCopyWith<$Res> {
  factory _$LanguagesCopyWith(_Languages value, $Res Function(_Languages) _then) = __$LanguagesCopyWithImpl;
@override @useResult
$Res call({
 String label, String value, bool isSelected
});




}
/// @nodoc
class __$LanguagesCopyWithImpl<$Res>
    implements _$LanguagesCopyWith<$Res> {
  __$LanguagesCopyWithImpl(this._self, this._then);

  final _Languages _self;
  final $Res Function(_Languages) _then;

/// Create a copy of Languages
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,Object? isSelected = null,}) {
  return _then(_Languages(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$CheckListTypes {

 String get name; String get code;
/// Create a copy of CheckListTypes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckListTypesCopyWith<CheckListTypes> get copyWith => _$CheckListTypesCopyWithImpl<CheckListTypes>(this as CheckListTypes, _$identity);

  /// Serializes this CheckListTypes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckListTypes&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'CheckListTypes(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class $CheckListTypesCopyWith<$Res>  {
  factory $CheckListTypesCopyWith(CheckListTypes value, $Res Function(CheckListTypes) _then) = _$CheckListTypesCopyWithImpl;
@useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class _$CheckListTypesCopyWithImpl<$Res>
    implements $CheckListTypesCopyWith<$Res> {
  _$CheckListTypesCopyWithImpl(this._self, this._then);

  final CheckListTypes _self;
  final $Res Function(CheckListTypes) _then;

/// Create a copy of CheckListTypes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckListTypes].
extension CheckListTypesPatterns on CheckListTypes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckListTypes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckListTypes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckListTypes value)  $default,){
final _that = this;
switch (_that) {
case _CheckListTypes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckListTypes value)?  $default,){
final _that = this;
switch (_that) {
case _CheckListTypes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckListTypes() when $default != null:
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code)  $default,) {final _that = this;
switch (_that) {
case _CheckListTypes():
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code)?  $default,) {final _that = this;
switch (_that) {
case _CheckListTypes() when $default != null:
return $default(_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckListTypes implements CheckListTypes {
   _CheckListTypes({required this.name, required this.code});
  factory _CheckListTypes.fromJson(Map<String, dynamic> json) => _$CheckListTypesFromJson(json);

@override final  String name;
@override final  String code;

/// Create a copy of CheckListTypes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckListTypesCopyWith<_CheckListTypes> get copyWith => __$CheckListTypesCopyWithImpl<_CheckListTypes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckListTypesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckListTypes&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'CheckListTypes(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$CheckListTypesCopyWith<$Res> implements $CheckListTypesCopyWith<$Res> {
  factory _$CheckListTypesCopyWith(_CheckListTypes value, $Res Function(_CheckListTypes) _then) = __$CheckListTypesCopyWithImpl;
@override @useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class __$CheckListTypesCopyWithImpl<$Res>
    implements _$CheckListTypesCopyWith<$Res> {
  __$CheckListTypesCopyWithImpl(this._self, this._then);

  final _CheckListTypes _self;
  final $Res Function(_CheckListTypes) _then;

/// Create a copy of CheckListTypes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,}) {
  return _then(_CheckListTypes(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CallSupportList {

 String get name; String get code;
/// Create a copy of CallSupportList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallSupportListCopyWith<CallSupportList> get copyWith => _$CallSupportListCopyWithImpl<CallSupportList>(this as CallSupportList, _$identity);

  /// Serializes this CallSupportList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallSupportList&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'CallSupportList(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class $CallSupportListCopyWith<$Res>  {
  factory $CallSupportListCopyWith(CallSupportList value, $Res Function(CallSupportList) _then) = _$CallSupportListCopyWithImpl;
@useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class _$CallSupportListCopyWithImpl<$Res>
    implements $CallSupportListCopyWith<$Res> {
  _$CallSupportListCopyWithImpl(this._self, this._then);

  final CallSupportList _self;
  final $Res Function(CallSupportList) _then;

/// Create a copy of CallSupportList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CallSupportList].
extension CallSupportListPatterns on CallSupportList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallSupportList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallSupportList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallSupportList value)  $default,){
final _that = this;
switch (_that) {
case _CallSupportList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallSupportList value)?  $default,){
final _that = this;
switch (_that) {
case _CallSupportList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallSupportList() when $default != null:
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code)  $default,) {final _that = this;
switch (_that) {
case _CallSupportList():
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code)?  $default,) {final _that = this;
switch (_that) {
case _CallSupportList() when $default != null:
return $default(_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CallSupportList implements CallSupportList {
   _CallSupportList({required this.name, required this.code});
  factory _CallSupportList.fromJson(Map<String, dynamic> json) => _$CallSupportListFromJson(json);

@override final  String name;
@override final  String code;

/// Create a copy of CallSupportList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallSupportListCopyWith<_CallSupportList> get copyWith => __$CallSupportListCopyWithImpl<_CallSupportList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CallSupportListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallSupportList&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'CallSupportList(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$CallSupportListCopyWith<$Res> implements $CallSupportListCopyWith<$Res> {
  factory _$CallSupportListCopyWith(_CallSupportList value, $Res Function(_CallSupportList) _then) = __$CallSupportListCopyWithImpl;
@override @useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class __$CallSupportListCopyWithImpl<$Res>
    implements _$CallSupportListCopyWith<$Res> {
  __$CallSupportListCopyWithImpl(this._self, this._then);

  final _CallSupportList _self;
  final $Res Function(_CallSupportList) _then;

/// Create a copy of CallSupportList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,}) {
  return _then(_CallSupportList(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SearchHouseHoldFilters {

 String get name; String get code; bool get active;
/// Create a copy of SearchHouseHoldFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchHouseHoldFiltersCopyWith<SearchHouseHoldFilters> get copyWith => _$SearchHouseHoldFiltersCopyWithImpl<SearchHouseHoldFilters>(this as SearchHouseHoldFilters, _$identity);

  /// Serializes this SearchHouseHoldFilters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchHouseHoldFilters&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,active);

@override
String toString() {
  return 'SearchHouseHoldFilters(name: $name, code: $code, active: $active)';
}


}

/// @nodoc
abstract mixin class $SearchHouseHoldFiltersCopyWith<$Res>  {
  factory $SearchHouseHoldFiltersCopyWith(SearchHouseHoldFilters value, $Res Function(SearchHouseHoldFilters) _then) = _$SearchHouseHoldFiltersCopyWithImpl;
@useResult
$Res call({
 String name, String code, bool active
});




}
/// @nodoc
class _$SearchHouseHoldFiltersCopyWithImpl<$Res>
    implements $SearchHouseHoldFiltersCopyWith<$Res> {
  _$SearchHouseHoldFiltersCopyWithImpl(this._self, this._then);

  final SearchHouseHoldFilters _self;
  final $Res Function(SearchHouseHoldFilters) _then;

/// Create a copy of SearchHouseHoldFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,Object? active = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchHouseHoldFilters].
extension SearchHouseHoldFiltersPatterns on SearchHouseHoldFilters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchHouseHoldFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchHouseHoldFilters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchHouseHoldFilters value)  $default,){
final _that = this;
switch (_that) {
case _SearchHouseHoldFilters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchHouseHoldFilters value)?  $default,){
final _that = this;
switch (_that) {
case _SearchHouseHoldFilters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchHouseHoldFilters() when $default != null:
return $default(_that.name,_that.code,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code,  bool active)  $default,) {final _that = this;
switch (_that) {
case _SearchHouseHoldFilters():
return $default(_that.name,_that.code,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _SearchHouseHoldFilters() when $default != null:
return $default(_that.name,_that.code,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchHouseHoldFilters implements SearchHouseHoldFilters {
   _SearchHouseHoldFilters({required this.name, required this.code, required this.active});
  factory _SearchHouseHoldFilters.fromJson(Map<String, dynamic> json) => _$SearchHouseHoldFiltersFromJson(json);

@override final  String name;
@override final  String code;
@override final  bool active;

/// Create a copy of SearchHouseHoldFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchHouseHoldFiltersCopyWith<_SearchHouseHoldFilters> get copyWith => __$SearchHouseHoldFiltersCopyWithImpl<_SearchHouseHoldFilters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchHouseHoldFiltersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchHouseHoldFilters&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,active);

@override
String toString() {
  return 'SearchHouseHoldFilters(name: $name, code: $code, active: $active)';
}


}

/// @nodoc
abstract mixin class _$SearchHouseHoldFiltersCopyWith<$Res> implements $SearchHouseHoldFiltersCopyWith<$Res> {
  factory _$SearchHouseHoldFiltersCopyWith(_SearchHouseHoldFilters value, $Res Function(_SearchHouseHoldFilters) _then) = __$SearchHouseHoldFiltersCopyWithImpl;
@override @useResult
$Res call({
 String name, String code, bool active
});




}
/// @nodoc
class __$SearchHouseHoldFiltersCopyWithImpl<$Res>
    implements _$SearchHouseHoldFiltersCopyWith<$Res> {
  __$SearchHouseHoldFiltersCopyWithImpl(this._self, this._then);

  final _SearchHouseHoldFilters _self;
  final $Res Function(_SearchHouseHoldFilters) _then;

/// Create a copy of SearchHouseHoldFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,Object? active = null,}) {
  return _then(_SearchHouseHoldFilters(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SearchCLFFilters {

 String get name; String get code; bool get active;
/// Create a copy of SearchCLFFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchCLFFiltersCopyWith<SearchCLFFilters> get copyWith => _$SearchCLFFiltersCopyWithImpl<SearchCLFFilters>(this as SearchCLFFilters, _$identity);

  /// Serializes this SearchCLFFilters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchCLFFilters&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,active);

@override
String toString() {
  return 'SearchCLFFilters(name: $name, code: $code, active: $active)';
}


}

/// @nodoc
abstract mixin class $SearchCLFFiltersCopyWith<$Res>  {
  factory $SearchCLFFiltersCopyWith(SearchCLFFilters value, $Res Function(SearchCLFFilters) _then) = _$SearchCLFFiltersCopyWithImpl;
@useResult
$Res call({
 String name, String code, bool active
});




}
/// @nodoc
class _$SearchCLFFiltersCopyWithImpl<$Res>
    implements $SearchCLFFiltersCopyWith<$Res> {
  _$SearchCLFFiltersCopyWithImpl(this._self, this._then);

  final SearchCLFFilters _self;
  final $Res Function(SearchCLFFilters) _then;

/// Create a copy of SearchCLFFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,Object? active = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchCLFFilters].
extension SearchCLFFiltersPatterns on SearchCLFFilters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchCLFFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchCLFFilters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchCLFFilters value)  $default,){
final _that = this;
switch (_that) {
case _SearchCLFFilters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchCLFFilters value)?  $default,){
final _that = this;
switch (_that) {
case _SearchCLFFilters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchCLFFilters() when $default != null:
return $default(_that.name,_that.code,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code,  bool active)  $default,) {final _that = this;
switch (_that) {
case _SearchCLFFilters():
return $default(_that.name,_that.code,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _SearchCLFFilters() when $default != null:
return $default(_that.name,_that.code,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchCLFFilters implements SearchCLFFilters {
   _SearchCLFFilters({required this.name, required this.code, required this.active});
  factory _SearchCLFFilters.fromJson(Map<String, dynamic> json) => _$SearchCLFFiltersFromJson(json);

@override final  String name;
@override final  String code;
@override final  bool active;

/// Create a copy of SearchCLFFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCLFFiltersCopyWith<_SearchCLFFilters> get copyWith => __$SearchCLFFiltersCopyWithImpl<_SearchCLFFilters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchCLFFiltersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchCLFFilters&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,active);

@override
String toString() {
  return 'SearchCLFFilters(name: $name, code: $code, active: $active)';
}


}

/// @nodoc
abstract mixin class _$SearchCLFFiltersCopyWith<$Res> implements $SearchCLFFiltersCopyWith<$Res> {
  factory _$SearchCLFFiltersCopyWith(_SearchCLFFilters value, $Res Function(_SearchCLFFilters) _then) = __$SearchCLFFiltersCopyWithImpl;
@override @useResult
$Res call({
 String name, String code, bool active
});




}
/// @nodoc
class __$SearchCLFFiltersCopyWithImpl<$Res>
    implements _$SearchCLFFiltersCopyWith<$Res> {
  __$SearchCLFFiltersCopyWithImpl(this._self, this._then);

  final _SearchCLFFilters _self;
  final $Res Function(_SearchCLFFilters) _then;

/// Create a copy of SearchCLFFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,Object? active = null,}) {
  return _then(_SearchCLFFilters(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$TransitPostType {

 String get name; String get code; bool get active;
/// Create a copy of TransitPostType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransitPostTypeCopyWith<TransitPostType> get copyWith => _$TransitPostTypeCopyWithImpl<TransitPostType>(this as TransitPostType, _$identity);

  /// Serializes this TransitPostType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransitPostType&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,active);

@override
String toString() {
  return 'TransitPostType(name: $name, code: $code, active: $active)';
}


}

/// @nodoc
abstract mixin class $TransitPostTypeCopyWith<$Res>  {
  factory $TransitPostTypeCopyWith(TransitPostType value, $Res Function(TransitPostType) _then) = _$TransitPostTypeCopyWithImpl;
@useResult
$Res call({
 String name, String code, bool active
});




}
/// @nodoc
class _$TransitPostTypeCopyWithImpl<$Res>
    implements $TransitPostTypeCopyWith<$Res> {
  _$TransitPostTypeCopyWithImpl(this._self, this._then);

  final TransitPostType _self;
  final $Res Function(TransitPostType) _then;

/// Create a copy of TransitPostType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,Object? active = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TransitPostType].
extension TransitPostTypePatterns on TransitPostType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransitPostType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransitPostType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransitPostType value)  $default,){
final _that = this;
switch (_that) {
case _TransitPostType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransitPostType value)?  $default,){
final _that = this;
switch (_that) {
case _TransitPostType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransitPostType() when $default != null:
return $default(_that.name,_that.code,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code,  bool active)  $default,) {final _that = this;
switch (_that) {
case _TransitPostType():
return $default(_that.name,_that.code,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _TransitPostType() when $default != null:
return $default(_that.name,_that.code,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransitPostType implements TransitPostType {
   _TransitPostType({required this.name, required this.code, required this.active});
  factory _TransitPostType.fromJson(Map<String, dynamic> json) => _$TransitPostTypeFromJson(json);

@override final  String name;
@override final  String code;
@override final  bool active;

/// Create a copy of TransitPostType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransitPostTypeCopyWith<_TransitPostType> get copyWith => __$TransitPostTypeCopyWithImpl<_TransitPostType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransitPostTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransitPostType&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,active);

@override
String toString() {
  return 'TransitPostType(name: $name, code: $code, active: $active)';
}


}

/// @nodoc
abstract mixin class _$TransitPostTypeCopyWith<$Res> implements $TransitPostTypeCopyWith<$Res> {
  factory _$TransitPostTypeCopyWith(_TransitPostType value, $Res Function(_TransitPostType) _then) = __$TransitPostTypeCopyWithImpl;
@override @useResult
$Res call({
 String name, String code, bool active
});




}
/// @nodoc
class __$TransitPostTypeCopyWithImpl<$Res>
    implements _$TransitPostTypeCopyWith<$Res> {
  __$TransitPostTypeCopyWithImpl(this._self, this._then);

  final _TransitPostType _self;
  final $Res Function(_TransitPostType) _then;

/// Create a copy of TransitPostType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,Object? active = null,}) {
  return _then(_TransitPostType(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$DeviceChangeReasons {

 String get name; String get code;
/// Create a copy of DeviceChangeReasons
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceChangeReasonsCopyWith<DeviceChangeReasons> get copyWith => _$DeviceChangeReasonsCopyWithImpl<DeviceChangeReasons>(this as DeviceChangeReasons, _$identity);

  /// Serializes this DeviceChangeReasons to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceChangeReasons&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'DeviceChangeReasons(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class $DeviceChangeReasonsCopyWith<$Res>  {
  factory $DeviceChangeReasonsCopyWith(DeviceChangeReasons value, $Res Function(DeviceChangeReasons) _then) = _$DeviceChangeReasonsCopyWithImpl;
@useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class _$DeviceChangeReasonsCopyWithImpl<$Res>
    implements $DeviceChangeReasonsCopyWith<$Res> {
  _$DeviceChangeReasonsCopyWithImpl(this._self, this._then);

  final DeviceChangeReasons _self;
  final $Res Function(DeviceChangeReasons) _then;

/// Create a copy of DeviceChangeReasons
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceChangeReasons].
extension DeviceChangeReasonsPatterns on DeviceChangeReasons {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceChangeReasons value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceChangeReasons() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceChangeReasons value)  $default,){
final _that = this;
switch (_that) {
case _DeviceChangeReasons():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceChangeReasons value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceChangeReasons() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceChangeReasons() when $default != null:
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code)  $default,) {final _that = this;
switch (_that) {
case _DeviceChangeReasons():
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code)?  $default,) {final _that = this;
switch (_that) {
case _DeviceChangeReasons() when $default != null:
return $default(_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceChangeReasons implements DeviceChangeReasons {
   _DeviceChangeReasons({required this.name, required this.code});
  factory _DeviceChangeReasons.fromJson(Map<String, dynamic> json) => _$DeviceChangeReasonsFromJson(json);

@override final  String name;
@override final  String code;

/// Create a copy of DeviceChangeReasons
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceChangeReasonsCopyWith<_DeviceChangeReasons> get copyWith => __$DeviceChangeReasonsCopyWithImpl<_DeviceChangeReasons>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceChangeReasonsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceChangeReasons&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'DeviceChangeReasons(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$DeviceChangeReasonsCopyWith<$Res> implements $DeviceChangeReasonsCopyWith<$Res> {
  factory _$DeviceChangeReasonsCopyWith(_DeviceChangeReasons value, $Res Function(_DeviceChangeReasons) _then) = __$DeviceChangeReasonsCopyWithImpl;
@override @useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class __$DeviceChangeReasonsCopyWithImpl<$Res>
    implements _$DeviceChangeReasonsCopyWith<$Res> {
  __$DeviceChangeReasonsCopyWithImpl(this._self, this._then);

  final _DeviceChangeReasons _self;
  final $Res Function(_DeviceChangeReasons) _then;

/// Create a copy of DeviceChangeReasons
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,}) {
  return _then(_DeviceChangeReasons(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SingleUserLogin {

 bool get enabled; int get id;
/// Create a copy of SingleUserLogin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingleUserLoginCopyWith<SingleUserLogin> get copyWith => _$SingleUserLoginCopyWithImpl<SingleUserLogin>(this as SingleUserLogin, _$identity);

  /// Serializes this SingleUserLogin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingleUserLogin&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,id);

@override
String toString() {
  return 'SingleUserLogin(enabled: $enabled, id: $id)';
}


}

/// @nodoc
abstract mixin class $SingleUserLoginCopyWith<$Res>  {
  factory $SingleUserLoginCopyWith(SingleUserLogin value, $Res Function(SingleUserLogin) _then) = _$SingleUserLoginCopyWithImpl;
@useResult
$Res call({
 bool enabled, int id
});




}
/// @nodoc
class _$SingleUserLoginCopyWithImpl<$Res>
    implements $SingleUserLoginCopyWith<$Res> {
  _$SingleUserLoginCopyWithImpl(this._self, this._then);

  final SingleUserLogin _self;
  final $Res Function(SingleUserLogin) _then;

/// Create a copy of SingleUserLogin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? id = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SingleUserLogin].
extension SingleUserLoginPatterns on SingleUserLogin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SingleUserLogin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SingleUserLogin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SingleUserLogin value)  $default,){
final _that = this;
switch (_that) {
case _SingleUserLogin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SingleUserLogin value)?  $default,){
final _that = this;
switch (_that) {
case _SingleUserLogin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled,  int id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SingleUserLogin() when $default != null:
return $default(_that.enabled,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled,  int id)  $default,) {final _that = this;
switch (_that) {
case _SingleUserLogin():
return $default(_that.enabled,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled,  int id)?  $default,) {final _that = this;
switch (_that) {
case _SingleUserLogin() when $default != null:
return $default(_that.enabled,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SingleUserLogin implements SingleUserLogin {
   _SingleUserLogin({required this.enabled, required this.id});
  factory _SingleUserLogin.fromJson(Map<String, dynamic> json) => _$SingleUserLoginFromJson(json);

@override final  bool enabled;
@override final  int id;

/// Create a copy of SingleUserLogin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SingleUserLoginCopyWith<_SingleUserLogin> get copyWith => __$SingleUserLoginCopyWithImpl<_SingleUserLogin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SingleUserLoginToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SingleUserLogin&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,id);

@override
String toString() {
  return 'SingleUserLogin(enabled: $enabled, id: $id)';
}


}

/// @nodoc
abstract mixin class _$SingleUserLoginCopyWith<$Res> implements $SingleUserLoginCopyWith<$Res> {
  factory _$SingleUserLoginCopyWith(_SingleUserLogin value, $Res Function(_SingleUserLogin) _then) = __$SingleUserLoginCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, int id
});




}
/// @nodoc
class __$SingleUserLoginCopyWithImpl<$Res>
    implements _$SingleUserLoginCopyWith<$Res> {
  __$SingleUserLoginCopyWithImpl(this._self, this._then);

  final _SingleUserLogin _self;
  final $Res Function(_SingleUserLogin) _then;

/// Create a copy of SingleUserLogin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? id = null,}) {
  return _then(_SingleUserLogin(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TransportTypes {

 String get name; String get code;
/// Create a copy of TransportTypes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransportTypesCopyWith<TransportTypes> get copyWith => _$TransportTypesCopyWithImpl<TransportTypes>(this as TransportTypes, _$identity);

  /// Serializes this TransportTypes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransportTypes&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'TransportTypes(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class $TransportTypesCopyWith<$Res>  {
  factory $TransportTypesCopyWith(TransportTypes value, $Res Function(TransportTypes) _then) = _$TransportTypesCopyWithImpl;
@useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class _$TransportTypesCopyWithImpl<$Res>
    implements $TransportTypesCopyWith<$Res> {
  _$TransportTypesCopyWithImpl(this._self, this._then);

  final TransportTypes _self;
  final $Res Function(TransportTypes) _then;

/// Create a copy of TransportTypes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransportTypes].
extension TransportTypesPatterns on TransportTypes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransportTypes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransportTypes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransportTypes value)  $default,){
final _that = this;
switch (_that) {
case _TransportTypes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransportTypes value)?  $default,){
final _that = this;
switch (_that) {
case _TransportTypes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransportTypes() when $default != null:
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code)  $default,) {final _that = this;
switch (_that) {
case _TransportTypes():
return $default(_that.name,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code)?  $default,) {final _that = this;
switch (_that) {
case _TransportTypes() when $default != null:
return $default(_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransportTypes implements TransportTypes {
   _TransportTypes({required this.name, required this.code});
  factory _TransportTypes.fromJson(Map<String, dynamic> json) => _$TransportTypesFromJson(json);

@override final  String name;
@override final  String code;

/// Create a copy of TransportTypes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransportTypesCopyWith<_TransportTypes> get copyWith => __$TransportTypesCopyWithImpl<_TransportTypes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransportTypesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransportTypes&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code);

@override
String toString() {
  return 'TransportTypes(name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$TransportTypesCopyWith<$Res> implements $TransportTypesCopyWith<$Res> {
  factory _$TransportTypesCopyWith(_TransportTypes value, $Res Function(_TransportTypes) _then) = __$TransportTypesCopyWithImpl;
@override @useResult
$Res call({
 String name, String code
});




}
/// @nodoc
class __$TransportTypesCopyWithImpl<$Res>
    implements _$TransportTypesCopyWith<$Res> {
  __$TransportTypesCopyWithImpl(this._self, this._then);

  final _TransportTypes _self;
  final $Res Function(_TransportTypes) _then;

/// Create a copy of TransportTypes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,}) {
  return _then(_TransportTypes(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RowVersions {

 String get module; String get version;
/// Create a copy of RowVersions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RowVersionsCopyWith<RowVersions> get copyWith => _$RowVersionsCopyWithImpl<RowVersions>(this as RowVersions, _$identity);

  /// Serializes this RowVersions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RowVersions&&(identical(other.module, module) || other.module == module)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,module,version);

@override
String toString() {
  return 'RowVersions(module: $module, version: $version)';
}


}

/// @nodoc
abstract mixin class $RowVersionsCopyWith<$Res>  {
  factory $RowVersionsCopyWith(RowVersions value, $Res Function(RowVersions) _then) = _$RowVersionsCopyWithImpl;
@useResult
$Res call({
 String module, String version
});




}
/// @nodoc
class _$RowVersionsCopyWithImpl<$Res>
    implements $RowVersionsCopyWith<$Res> {
  _$RowVersionsCopyWithImpl(this._self, this._then);

  final RowVersions _self;
  final $Res Function(RowVersions) _then;

/// Create a copy of RowVersions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? module = null,Object? version = null,}) {
  return _then(_self.copyWith(
module: null == module ? _self.module : module // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RowVersions].
extension RowVersionsPatterns on RowVersions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RowVersions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RowVersions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RowVersions value)  $default,){
final _that = this;
switch (_that) {
case _RowVersions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RowVersions value)?  $default,){
final _that = this;
switch (_that) {
case _RowVersions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String module,  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RowVersions() when $default != null:
return $default(_that.module,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String module,  String version)  $default,) {final _that = this;
switch (_that) {
case _RowVersions():
return $default(_that.module,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String module,  String version)?  $default,) {final _that = this;
switch (_that) {
case _RowVersions() when $default != null:
return $default(_that.module,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RowVersions implements RowVersions {
   _RowVersions({required this.module, required this.version});
  factory _RowVersions.fromJson(Map<String, dynamic> json) => _$RowVersionsFromJson(json);

@override final  String module;
@override final  String version;

/// Create a copy of RowVersions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RowVersionsCopyWith<_RowVersions> get copyWith => __$RowVersionsCopyWithImpl<_RowVersions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RowVersionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RowVersions&&(identical(other.module, module) || other.module == module)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,module,version);

@override
String toString() {
  return 'RowVersions(module: $module, version: $version)';
}


}

/// @nodoc
abstract mixin class _$RowVersionsCopyWith<$Res> implements $RowVersionsCopyWith<$Res> {
  factory _$RowVersionsCopyWith(_RowVersions value, $Res Function(_RowVersions) _then) = __$RowVersionsCopyWithImpl;
@override @useResult
$Res call({
 String module, String version
});




}
/// @nodoc
class __$RowVersionsCopyWithImpl<$Res>
    implements _$RowVersionsCopyWith<$Res> {
  __$RowVersionsCopyWithImpl(this._self, this._then);

  final _RowVersions _self;
  final $Res Function(_RowVersions) _then;

/// Create a copy of RowVersions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? module = null,Object? version = null,}) {
  return _then(_RowVersions(
module: null == module ? _self.module : module // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FirebaseConfig {

 bool get enableCrashlytics; bool get enableAnalytics;
/// Create a copy of FirebaseConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirebaseConfigCopyWith<FirebaseConfig> get copyWith => _$FirebaseConfigCopyWithImpl<FirebaseConfig>(this as FirebaseConfig, _$identity);

  /// Serializes this FirebaseConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirebaseConfig&&(identical(other.enableCrashlytics, enableCrashlytics) || other.enableCrashlytics == enableCrashlytics)&&(identical(other.enableAnalytics, enableAnalytics) || other.enableAnalytics == enableAnalytics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enableCrashlytics,enableAnalytics);

@override
String toString() {
  return 'FirebaseConfig(enableCrashlytics: $enableCrashlytics, enableAnalytics: $enableAnalytics)';
}


}

/// @nodoc
abstract mixin class $FirebaseConfigCopyWith<$Res>  {
  factory $FirebaseConfigCopyWith(FirebaseConfig value, $Res Function(FirebaseConfig) _then) = _$FirebaseConfigCopyWithImpl;
@useResult
$Res call({
 bool enableCrashlytics, bool enableAnalytics
});




}
/// @nodoc
class _$FirebaseConfigCopyWithImpl<$Res>
    implements $FirebaseConfigCopyWith<$Res> {
  _$FirebaseConfigCopyWithImpl(this._self, this._then);

  final FirebaseConfig _self;
  final $Res Function(FirebaseConfig) _then;

/// Create a copy of FirebaseConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enableCrashlytics = null,Object? enableAnalytics = null,}) {
  return _then(_self.copyWith(
enableCrashlytics: null == enableCrashlytics ? _self.enableCrashlytics : enableCrashlytics // ignore: cast_nullable_to_non_nullable
as bool,enableAnalytics: null == enableAnalytics ? _self.enableAnalytics : enableAnalytics // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FirebaseConfig].
extension FirebaseConfigPatterns on FirebaseConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FirebaseConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FirebaseConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FirebaseConfig value)  $default,){
final _that = this;
switch (_that) {
case _FirebaseConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FirebaseConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FirebaseConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enableCrashlytics,  bool enableAnalytics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FirebaseConfig() when $default != null:
return $default(_that.enableCrashlytics,_that.enableAnalytics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enableCrashlytics,  bool enableAnalytics)  $default,) {final _that = this;
switch (_that) {
case _FirebaseConfig():
return $default(_that.enableCrashlytics,_that.enableAnalytics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enableCrashlytics,  bool enableAnalytics)?  $default,) {final _that = this;
switch (_that) {
case _FirebaseConfig() when $default != null:
return $default(_that.enableCrashlytics,_that.enableAnalytics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FirebaseConfig implements FirebaseConfig {
   _FirebaseConfig({required this.enableCrashlytics, required this.enableAnalytics});
  factory _FirebaseConfig.fromJson(Map<String, dynamic> json) => _$FirebaseConfigFromJson(json);

@override final  bool enableCrashlytics;
@override final  bool enableAnalytics;

/// Create a copy of FirebaseConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FirebaseConfigCopyWith<_FirebaseConfig> get copyWith => __$FirebaseConfigCopyWithImpl<_FirebaseConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FirebaseConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FirebaseConfig&&(identical(other.enableCrashlytics, enableCrashlytics) || other.enableCrashlytics == enableCrashlytics)&&(identical(other.enableAnalytics, enableAnalytics) || other.enableAnalytics == enableAnalytics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enableCrashlytics,enableAnalytics);

@override
String toString() {
  return 'FirebaseConfig(enableCrashlytics: $enableCrashlytics, enableAnalytics: $enableAnalytics)';
}


}

/// @nodoc
abstract mixin class _$FirebaseConfigCopyWith<$Res> implements $FirebaseConfigCopyWith<$Res> {
  factory _$FirebaseConfigCopyWith(_FirebaseConfig value, $Res Function(_FirebaseConfig) _then) = __$FirebaseConfigCopyWithImpl;
@override @useResult
$Res call({
 bool enableCrashlytics, bool enableAnalytics
});




}
/// @nodoc
class __$FirebaseConfigCopyWithImpl<$Res>
    implements _$FirebaseConfigCopyWith<$Res> {
  __$FirebaseConfigCopyWithImpl(this._self, this._then);

  final _FirebaseConfig _self;
  final $Res Function(_FirebaseConfig) _then;

/// Create a copy of FirebaseConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enableCrashlytics = null,Object? enableAnalytics = null,}) {
  return _then(_FirebaseConfig(
enableCrashlytics: null == enableCrashlytics ? _self.enableCrashlytics : enableCrashlytics // ignore: cast_nullable_to_non_nullable
as bool,enableAnalytics: null == enableAnalytics ? _self.enableAnalytics : enableAnalytics // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$BoundaryRelationship {

 String get boundaryType; int get order; BoundaryRelationshipRef? get parent; List<BoundaryRelationshipRef>? get children;
/// Create a copy of BoundaryRelationship
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoundaryRelationshipCopyWith<BoundaryRelationship> get copyWith => _$BoundaryRelationshipCopyWithImpl<BoundaryRelationship>(this as BoundaryRelationship, _$identity);

  /// Serializes this BoundaryRelationship to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoundaryRelationship&&(identical(other.boundaryType, boundaryType) || other.boundaryType == boundaryType)&&(identical(other.order, order) || other.order == order)&&(identical(other.parent, parent) || other.parent == parent)&&const DeepCollectionEquality().equals(other.children, children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,boundaryType,order,parent,const DeepCollectionEquality().hash(children));

@override
String toString() {
  return 'BoundaryRelationship(boundaryType: $boundaryType, order: $order, parent: $parent, children: $children)';
}


}

/// @nodoc
abstract mixin class $BoundaryRelationshipCopyWith<$Res>  {
  factory $BoundaryRelationshipCopyWith(BoundaryRelationship value, $Res Function(BoundaryRelationship) _then) = _$BoundaryRelationshipCopyWithImpl;
@useResult
$Res call({
 String boundaryType, int order, BoundaryRelationshipRef? parent, List<BoundaryRelationshipRef>? children
});


$BoundaryRelationshipRefCopyWith<$Res>? get parent;

}
/// @nodoc
class _$BoundaryRelationshipCopyWithImpl<$Res>
    implements $BoundaryRelationshipCopyWith<$Res> {
  _$BoundaryRelationshipCopyWithImpl(this._self, this._then);

  final BoundaryRelationship _self;
  final $Res Function(BoundaryRelationship) _then;

/// Create a copy of BoundaryRelationship
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? boundaryType = null,Object? order = null,Object? parent = freezed,Object? children = freezed,}) {
  return _then(_self.copyWith(
boundaryType: null == boundaryType ? _self.boundaryType : boundaryType // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as BoundaryRelationshipRef?,children: freezed == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<BoundaryRelationshipRef>?,
  ));
}
/// Create a copy of BoundaryRelationship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoundaryRelationshipRefCopyWith<$Res>? get parent {
    if (_self.parent == null) {
    return null;
  }

  return $BoundaryRelationshipRefCopyWith<$Res>(_self.parent!, (value) {
    return _then(_self.copyWith(parent: value));
  });
}
}


/// Adds pattern-matching-related methods to [BoundaryRelationship].
extension BoundaryRelationshipPatterns on BoundaryRelationship {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoundaryRelationship value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoundaryRelationship() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoundaryRelationship value)  $default,){
final _that = this;
switch (_that) {
case _BoundaryRelationship():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoundaryRelationship value)?  $default,){
final _that = this;
switch (_that) {
case _BoundaryRelationship() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String boundaryType,  int order,  BoundaryRelationshipRef? parent,  List<BoundaryRelationshipRef>? children)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoundaryRelationship() when $default != null:
return $default(_that.boundaryType,_that.order,_that.parent,_that.children);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String boundaryType,  int order,  BoundaryRelationshipRef? parent,  List<BoundaryRelationshipRef>? children)  $default,) {final _that = this;
switch (_that) {
case _BoundaryRelationship():
return $default(_that.boundaryType,_that.order,_that.parent,_that.children);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String boundaryType,  int order,  BoundaryRelationshipRef? parent,  List<BoundaryRelationshipRef>? children)?  $default,) {final _that = this;
switch (_that) {
case _BoundaryRelationship() when $default != null:
return $default(_that.boundaryType,_that.order,_that.parent,_that.children);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoundaryRelationship implements BoundaryRelationship {
   _BoundaryRelationship({required this.boundaryType, required this.order, this.parent, final  List<BoundaryRelationshipRef>? children}): _children = children;
  factory _BoundaryRelationship.fromJson(Map<String, dynamic> json) => _$BoundaryRelationshipFromJson(json);

@override final  String boundaryType;
@override final  int order;
@override final  BoundaryRelationshipRef? parent;
 final  List<BoundaryRelationshipRef>? _children;
@override List<BoundaryRelationshipRef>? get children {
  final value = _children;
  if (value == null) return null;
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of BoundaryRelationship
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoundaryRelationshipCopyWith<_BoundaryRelationship> get copyWith => __$BoundaryRelationshipCopyWithImpl<_BoundaryRelationship>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoundaryRelationshipToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoundaryRelationship&&(identical(other.boundaryType, boundaryType) || other.boundaryType == boundaryType)&&(identical(other.order, order) || other.order == order)&&(identical(other.parent, parent) || other.parent == parent)&&const DeepCollectionEquality().equals(other._children, _children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,boundaryType,order,parent,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'BoundaryRelationship(boundaryType: $boundaryType, order: $order, parent: $parent, children: $children)';
}


}

/// @nodoc
abstract mixin class _$BoundaryRelationshipCopyWith<$Res> implements $BoundaryRelationshipCopyWith<$Res> {
  factory _$BoundaryRelationshipCopyWith(_BoundaryRelationship value, $Res Function(_BoundaryRelationship) _then) = __$BoundaryRelationshipCopyWithImpl;
@override @useResult
$Res call({
 String boundaryType, int order, BoundaryRelationshipRef? parent, List<BoundaryRelationshipRef>? children
});


@override $BoundaryRelationshipRefCopyWith<$Res>? get parent;

}
/// @nodoc
class __$BoundaryRelationshipCopyWithImpl<$Res>
    implements _$BoundaryRelationshipCopyWith<$Res> {
  __$BoundaryRelationshipCopyWithImpl(this._self, this._then);

  final _BoundaryRelationship _self;
  final $Res Function(_BoundaryRelationship) _then;

/// Create a copy of BoundaryRelationship
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? boundaryType = null,Object? order = null,Object? parent = freezed,Object? children = freezed,}) {
  return _then(_BoundaryRelationship(
boundaryType: null == boundaryType ? _self.boundaryType : boundaryType // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as BoundaryRelationshipRef?,children: freezed == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<BoundaryRelationshipRef>?,
  ));
}

/// Create a copy of BoundaryRelationship
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoundaryRelationshipRefCopyWith<$Res>? get parent {
    if (_self.parent == null) {
    return null;
  }

  return $BoundaryRelationshipRefCopyWith<$Res>(_self.parent!, (value) {
    return _then(_self.copyWith(parent: value));
  });
}
}


/// @nodoc
mixin _$BoundaryRelationshipRef {

 String get boundaryType; int get order;
/// Create a copy of BoundaryRelationshipRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoundaryRelationshipRefCopyWith<BoundaryRelationshipRef> get copyWith => _$BoundaryRelationshipRefCopyWithImpl<BoundaryRelationshipRef>(this as BoundaryRelationshipRef, _$identity);

  /// Serializes this BoundaryRelationshipRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoundaryRelationshipRef&&(identical(other.boundaryType, boundaryType) || other.boundaryType == boundaryType)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,boundaryType,order);

@override
String toString() {
  return 'BoundaryRelationshipRef(boundaryType: $boundaryType, order: $order)';
}


}

/// @nodoc
abstract mixin class $BoundaryRelationshipRefCopyWith<$Res>  {
  factory $BoundaryRelationshipRefCopyWith(BoundaryRelationshipRef value, $Res Function(BoundaryRelationshipRef) _then) = _$BoundaryRelationshipRefCopyWithImpl;
@useResult
$Res call({
 String boundaryType, int order
});




}
/// @nodoc
class _$BoundaryRelationshipRefCopyWithImpl<$Res>
    implements $BoundaryRelationshipRefCopyWith<$Res> {
  _$BoundaryRelationshipRefCopyWithImpl(this._self, this._then);

  final BoundaryRelationshipRef _self;
  final $Res Function(BoundaryRelationshipRef) _then;

/// Create a copy of BoundaryRelationshipRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? boundaryType = null,Object? order = null,}) {
  return _then(_self.copyWith(
boundaryType: null == boundaryType ? _self.boundaryType : boundaryType // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BoundaryRelationshipRef].
extension BoundaryRelationshipRefPatterns on BoundaryRelationshipRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoundaryRelationshipRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoundaryRelationshipRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoundaryRelationshipRef value)  $default,){
final _that = this;
switch (_that) {
case _BoundaryRelationshipRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoundaryRelationshipRef value)?  $default,){
final _that = this;
switch (_that) {
case _BoundaryRelationshipRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String boundaryType,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoundaryRelationshipRef() when $default != null:
return $default(_that.boundaryType,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String boundaryType,  int order)  $default,) {final _that = this;
switch (_that) {
case _BoundaryRelationshipRef():
return $default(_that.boundaryType,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String boundaryType,  int order)?  $default,) {final _that = this;
switch (_that) {
case _BoundaryRelationshipRef() when $default != null:
return $default(_that.boundaryType,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoundaryRelationshipRef implements BoundaryRelationshipRef {
   _BoundaryRelationshipRef({required this.boundaryType, required this.order});
  factory _BoundaryRelationshipRef.fromJson(Map<String, dynamic> json) => _$BoundaryRelationshipRefFromJson(json);

@override final  String boundaryType;
@override final  int order;

/// Create a copy of BoundaryRelationshipRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoundaryRelationshipRefCopyWith<_BoundaryRelationshipRef> get copyWith => __$BoundaryRelationshipRefCopyWithImpl<_BoundaryRelationshipRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoundaryRelationshipRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoundaryRelationshipRef&&(identical(other.boundaryType, boundaryType) || other.boundaryType == boundaryType)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,boundaryType,order);

@override
String toString() {
  return 'BoundaryRelationshipRef(boundaryType: $boundaryType, order: $order)';
}


}

/// @nodoc
abstract mixin class _$BoundaryRelationshipRefCopyWith<$Res> implements $BoundaryRelationshipRefCopyWith<$Res> {
  factory _$BoundaryRelationshipRefCopyWith(_BoundaryRelationshipRef value, $Res Function(_BoundaryRelationshipRef) _then) = __$BoundaryRelationshipRefCopyWithImpl;
@override @useResult
$Res call({
 String boundaryType, int order
});




}
/// @nodoc
class __$BoundaryRelationshipRefCopyWithImpl<$Res>
    implements _$BoundaryRelationshipRefCopyWith<$Res> {
  __$BoundaryRelationshipRefCopyWithImpl(this._self, this._then);

  final _BoundaryRelationshipRef _self;
  final $Res Function(_BoundaryRelationshipRef) _then;

/// Create a copy of BoundaryRelationshipRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? boundaryType = null,Object? order = null,}) {
  return _then(_BoundaryRelationshipRef(
boundaryType: null == boundaryType ? _self.boundaryType : boundaryType // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

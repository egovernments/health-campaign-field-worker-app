// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_actions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoleActionsWrapperModel {

@JsonKey(name: 'actions') List<RoleActionsModel> get actions;
/// Create a copy of RoleActionsWrapperModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleActionsWrapperModelCopyWith<RoleActionsWrapperModel> get copyWith => _$RoleActionsWrapperModelCopyWithImpl<RoleActionsWrapperModel>(this as RoleActionsWrapperModel, _$identity);

  /// Serializes this RoleActionsWrapperModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleActionsWrapperModel&&const DeepCollectionEquality().equals(other.actions, actions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(actions));

@override
String toString() {
  return 'RoleActionsWrapperModel(actions: $actions)';
}


}

/// @nodoc
abstract mixin class $RoleActionsWrapperModelCopyWith<$Res>  {
  factory $RoleActionsWrapperModelCopyWith(RoleActionsWrapperModel value, $Res Function(RoleActionsWrapperModel) _then) = _$RoleActionsWrapperModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'actions') List<RoleActionsModel> actions
});




}
/// @nodoc
class _$RoleActionsWrapperModelCopyWithImpl<$Res>
    implements $RoleActionsWrapperModelCopyWith<$Res> {
  _$RoleActionsWrapperModelCopyWithImpl(this._self, this._then);

  final RoleActionsWrapperModel _self;
  final $Res Function(RoleActionsWrapperModel) _then;

/// Create a copy of RoleActionsWrapperModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? actions = null,}) {
  return _then(_self.copyWith(
actions: null == actions ? _self.actions : actions // ignore: cast_nullable_to_non_nullable
as List<RoleActionsModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [RoleActionsWrapperModel].
extension RoleActionsWrapperModelPatterns on RoleActionsWrapperModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleActionsWrapperModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleActionsWrapperModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleActionsWrapperModel value)  $default,){
final _that = this;
switch (_that) {
case _RoleActionsWrapperModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleActionsWrapperModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoleActionsWrapperModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'actions')  List<RoleActionsModel> actions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoleActionsWrapperModel() when $default != null:
return $default(_that.actions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'actions')  List<RoleActionsModel> actions)  $default,) {final _that = this;
switch (_that) {
case _RoleActionsWrapperModel():
return $default(_that.actions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'actions')  List<RoleActionsModel> actions)?  $default,) {final _that = this;
switch (_that) {
case _RoleActionsWrapperModel() when $default != null:
return $default(_that.actions);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _RoleActionsWrapperModel implements RoleActionsWrapperModel {
  const _RoleActionsWrapperModel({@JsonKey(name: 'actions') final  List<RoleActionsModel> actions = const []}): _actions = actions;
  factory _RoleActionsWrapperModel.fromJson(Map<String, dynamic> json) => _$RoleActionsWrapperModelFromJson(json);

 final  List<RoleActionsModel> _actions;
@override@JsonKey(name: 'actions') List<RoleActionsModel> get actions {
  if (_actions is EqualUnmodifiableListView) return _actions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_actions);
}


/// Create a copy of RoleActionsWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleActionsWrapperModelCopyWith<_RoleActionsWrapperModel> get copyWith => __$RoleActionsWrapperModelCopyWithImpl<_RoleActionsWrapperModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoleActionsWrapperModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleActionsWrapperModel&&const DeepCollectionEquality().equals(other._actions, _actions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_actions));

@override
String toString() {
  return 'RoleActionsWrapperModel(actions: $actions)';
}


}

/// @nodoc
abstract mixin class _$RoleActionsWrapperModelCopyWith<$Res> implements $RoleActionsWrapperModelCopyWith<$Res> {
  factory _$RoleActionsWrapperModelCopyWith(_RoleActionsWrapperModel value, $Res Function(_RoleActionsWrapperModel) _then) = __$RoleActionsWrapperModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'actions') List<RoleActionsModel> actions
});




}
/// @nodoc
class __$RoleActionsWrapperModelCopyWithImpl<$Res>
    implements _$RoleActionsWrapperModelCopyWith<$Res> {
  __$RoleActionsWrapperModelCopyWithImpl(this._self, this._then);

  final _RoleActionsWrapperModel _self;
  final $Res Function(_RoleActionsWrapperModel) _then;

/// Create a copy of RoleActionsWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? actions = null,}) {
  return _then(_RoleActionsWrapperModel(
actions: null == actions ? _self._actions : actions // ignore: cast_nullable_to_non_nullable
as List<RoleActionsModel>,
  ));
}


}


/// @nodoc
mixin _$RoleActionsModel {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'url') String? get url;@JsonKey(name: 'displayName') String? get displayName;@JsonKey(name: 'orderNumber') num? get orderNumber;@JsonKey(name: 'queryParams') String? get queryParams;@JsonKey(name: 'parentModule') String? get parentModule;@JsonKey(name: 'enabled') bool get enabled;@JsonKey(name: 'serviceCode') String? get serviceCode;@JsonKey(name: 'tenantId') String get tenantId;@JsonKey(name: 'createdDate') String? get createdDate;@JsonKey(name: 'createdBy') String? get createdBy;@JsonKey(name: 'lastModifiedDate') String? get lastModifiedDate;@JsonKey(name: 'lastModifiedBy') String? get lastModifiedBy;@JsonKey(name: 'path') String? get path;@JsonKey(name: 'navigationURL') String? get navigationURL;@JsonKey(name: 'leftIcon') String? get leftIcon;@JsonKey(name: 'rightIcon') String? get rightIcon;
/// Create a copy of RoleActionsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleActionsModelCopyWith<RoleActionsModel> get copyWith => _$RoleActionsModelCopyWithImpl<RoleActionsModel>(this as RoleActionsModel, _$identity);

  /// Serializes this RoleActionsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleActionsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.queryParams, queryParams) || other.queryParams == queryParams)&&(identical(other.parentModule, parentModule) || other.parentModule == parentModule)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.serviceCode, serviceCode) || other.serviceCode == serviceCode)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.lastModifiedDate, lastModifiedDate) || other.lastModifiedDate == lastModifiedDate)&&(identical(other.lastModifiedBy, lastModifiedBy) || other.lastModifiedBy == lastModifiedBy)&&(identical(other.path, path) || other.path == path)&&(identical(other.navigationURL, navigationURL) || other.navigationURL == navigationURL)&&(identical(other.leftIcon, leftIcon) || other.leftIcon == leftIcon)&&(identical(other.rightIcon, rightIcon) || other.rightIcon == rightIcon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url,displayName,orderNumber,queryParams,parentModule,enabled,serviceCode,tenantId,createdDate,createdBy,lastModifiedDate,lastModifiedBy,path,navigationURL,leftIcon,rightIcon);

@override
String toString() {
  return 'RoleActionsModel(id: $id, name: $name, url: $url, displayName: $displayName, orderNumber: $orderNumber, queryParams: $queryParams, parentModule: $parentModule, enabled: $enabled, serviceCode: $serviceCode, tenantId: $tenantId, createdDate: $createdDate, createdBy: $createdBy, lastModifiedDate: $lastModifiedDate, lastModifiedBy: $lastModifiedBy, path: $path, navigationURL: $navigationURL, leftIcon: $leftIcon, rightIcon: $rightIcon)';
}


}

/// @nodoc
abstract mixin class $RoleActionsModelCopyWith<$Res>  {
  factory $RoleActionsModelCopyWith(RoleActionsModel value, $Res Function(RoleActionsModel) _then) = _$RoleActionsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'url') String? url,@JsonKey(name: 'displayName') String? displayName,@JsonKey(name: 'orderNumber') num? orderNumber,@JsonKey(name: 'queryParams') String? queryParams,@JsonKey(name: 'parentModule') String? parentModule,@JsonKey(name: 'enabled') bool enabled,@JsonKey(name: 'serviceCode') String? serviceCode,@JsonKey(name: 'tenantId') String tenantId,@JsonKey(name: 'createdDate') String? createdDate,@JsonKey(name: 'createdBy') String? createdBy,@JsonKey(name: 'lastModifiedDate') String? lastModifiedDate,@JsonKey(name: 'lastModifiedBy') String? lastModifiedBy,@JsonKey(name: 'path') String? path,@JsonKey(name: 'navigationURL') String? navigationURL,@JsonKey(name: 'leftIcon') String? leftIcon,@JsonKey(name: 'rightIcon') String? rightIcon
});




}
/// @nodoc
class _$RoleActionsModelCopyWithImpl<$Res>
    implements $RoleActionsModelCopyWith<$Res> {
  _$RoleActionsModelCopyWithImpl(this._self, this._then);

  final RoleActionsModel _self;
  final $Res Function(RoleActionsModel) _then;

/// Create a copy of RoleActionsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? url = freezed,Object? displayName = freezed,Object? orderNumber = freezed,Object? queryParams = freezed,Object? parentModule = freezed,Object? enabled = null,Object? serviceCode = freezed,Object? tenantId = null,Object? createdDate = freezed,Object? createdBy = freezed,Object? lastModifiedDate = freezed,Object? lastModifiedBy = freezed,Object? path = freezed,Object? navigationURL = freezed,Object? leftIcon = freezed,Object? rightIcon = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as num?,queryParams: freezed == queryParams ? _self.queryParams : queryParams // ignore: cast_nullable_to_non_nullable
as String?,parentModule: freezed == parentModule ? _self.parentModule : parentModule // ignore: cast_nullable_to_non_nullable
as String?,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,serviceCode: freezed == serviceCode ? _self.serviceCode : serviceCode // ignore: cast_nullable_to_non_nullable
as String?,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,lastModifiedDate: freezed == lastModifiedDate ? _self.lastModifiedDate : lastModifiedDate // ignore: cast_nullable_to_non_nullable
as String?,lastModifiedBy: freezed == lastModifiedBy ? _self.lastModifiedBy : lastModifiedBy // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,navigationURL: freezed == navigationURL ? _self.navigationURL : navigationURL // ignore: cast_nullable_to_non_nullable
as String?,leftIcon: freezed == leftIcon ? _self.leftIcon : leftIcon // ignore: cast_nullable_to_non_nullable
as String?,rightIcon: freezed == rightIcon ? _self.rightIcon : rightIcon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoleActionsModel].
extension RoleActionsModelPatterns on RoleActionsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleActionsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleActionsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleActionsModel value)  $default,){
final _that = this;
switch (_that) {
case _RoleActionsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleActionsModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoleActionsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'url')  String? url, @JsonKey(name: 'displayName')  String? displayName, @JsonKey(name: 'orderNumber')  num? orderNumber, @JsonKey(name: 'queryParams')  String? queryParams, @JsonKey(name: 'parentModule')  String? parentModule, @JsonKey(name: 'enabled')  bool enabled, @JsonKey(name: 'serviceCode')  String? serviceCode, @JsonKey(name: 'tenantId')  String tenantId, @JsonKey(name: 'createdDate')  String? createdDate, @JsonKey(name: 'createdBy')  String? createdBy, @JsonKey(name: 'lastModifiedDate')  String? lastModifiedDate, @JsonKey(name: 'lastModifiedBy')  String? lastModifiedBy, @JsonKey(name: 'path')  String? path, @JsonKey(name: 'navigationURL')  String? navigationURL, @JsonKey(name: 'leftIcon')  String? leftIcon, @JsonKey(name: 'rightIcon')  String? rightIcon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoleActionsModel() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.displayName,_that.orderNumber,_that.queryParams,_that.parentModule,_that.enabled,_that.serviceCode,_that.tenantId,_that.createdDate,_that.createdBy,_that.lastModifiedDate,_that.lastModifiedBy,_that.path,_that.navigationURL,_that.leftIcon,_that.rightIcon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'url')  String? url, @JsonKey(name: 'displayName')  String? displayName, @JsonKey(name: 'orderNumber')  num? orderNumber, @JsonKey(name: 'queryParams')  String? queryParams, @JsonKey(name: 'parentModule')  String? parentModule, @JsonKey(name: 'enabled')  bool enabled, @JsonKey(name: 'serviceCode')  String? serviceCode, @JsonKey(name: 'tenantId')  String tenantId, @JsonKey(name: 'createdDate')  String? createdDate, @JsonKey(name: 'createdBy')  String? createdBy, @JsonKey(name: 'lastModifiedDate')  String? lastModifiedDate, @JsonKey(name: 'lastModifiedBy')  String? lastModifiedBy, @JsonKey(name: 'path')  String? path, @JsonKey(name: 'navigationURL')  String? navigationURL, @JsonKey(name: 'leftIcon')  String? leftIcon, @JsonKey(name: 'rightIcon')  String? rightIcon)  $default,) {final _that = this;
switch (_that) {
case _RoleActionsModel():
return $default(_that.id,_that.name,_that.url,_that.displayName,_that.orderNumber,_that.queryParams,_that.parentModule,_that.enabled,_that.serviceCode,_that.tenantId,_that.createdDate,_that.createdBy,_that.lastModifiedDate,_that.lastModifiedBy,_that.path,_that.navigationURL,_that.leftIcon,_that.rightIcon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'url')  String? url, @JsonKey(name: 'displayName')  String? displayName, @JsonKey(name: 'orderNumber')  num? orderNumber, @JsonKey(name: 'queryParams')  String? queryParams, @JsonKey(name: 'parentModule')  String? parentModule, @JsonKey(name: 'enabled')  bool enabled, @JsonKey(name: 'serviceCode')  String? serviceCode, @JsonKey(name: 'tenantId')  String tenantId, @JsonKey(name: 'createdDate')  String? createdDate, @JsonKey(name: 'createdBy')  String? createdBy, @JsonKey(name: 'lastModifiedDate')  String? lastModifiedDate, @JsonKey(name: 'lastModifiedBy')  String? lastModifiedBy, @JsonKey(name: 'path')  String? path, @JsonKey(name: 'navigationURL')  String? navigationURL, @JsonKey(name: 'leftIcon')  String? leftIcon, @JsonKey(name: 'rightIcon')  String? rightIcon)?  $default,) {final _that = this;
switch (_that) {
case _RoleActionsModel() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.displayName,_that.orderNumber,_that.queryParams,_that.parentModule,_that.enabled,_that.serviceCode,_that.tenantId,_that.createdDate,_that.createdBy,_that.lastModifiedDate,_that.lastModifiedBy,_that.path,_that.navigationURL,_that.leftIcon,_that.rightIcon);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RoleActionsModel implements RoleActionsModel {
  const _RoleActionsModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'url') this.url, @JsonKey(name: 'displayName') this.displayName, @JsonKey(name: 'orderNumber') this.orderNumber, @JsonKey(name: 'queryParams') this.queryParams, @JsonKey(name: 'parentModule') this.parentModule, @JsonKey(name: 'enabled') required this.enabled, @JsonKey(name: 'serviceCode') this.serviceCode, @JsonKey(name: 'tenantId') required this.tenantId, @JsonKey(name: 'createdDate') this.createdDate, @JsonKey(name: 'createdBy') this.createdBy, @JsonKey(name: 'lastModifiedDate') this.lastModifiedDate, @JsonKey(name: 'lastModifiedBy') this.lastModifiedBy, @JsonKey(name: 'path') this.path, @JsonKey(name: 'navigationURL') this.navigationURL, @JsonKey(name: 'leftIcon') this.leftIcon, @JsonKey(name: 'rightIcon') this.rightIcon});
  factory _RoleActionsModel.fromJson(Map<String, dynamic> json) => _$RoleActionsModelFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'url') final  String? url;
@override@JsonKey(name: 'displayName') final  String? displayName;
@override@JsonKey(name: 'orderNumber') final  num? orderNumber;
@override@JsonKey(name: 'queryParams') final  String? queryParams;
@override@JsonKey(name: 'parentModule') final  String? parentModule;
@override@JsonKey(name: 'enabled') final  bool enabled;
@override@JsonKey(name: 'serviceCode') final  String? serviceCode;
@override@JsonKey(name: 'tenantId') final  String tenantId;
@override@JsonKey(name: 'createdDate') final  String? createdDate;
@override@JsonKey(name: 'createdBy') final  String? createdBy;
@override@JsonKey(name: 'lastModifiedDate') final  String? lastModifiedDate;
@override@JsonKey(name: 'lastModifiedBy') final  String? lastModifiedBy;
@override@JsonKey(name: 'path') final  String? path;
@override@JsonKey(name: 'navigationURL') final  String? navigationURL;
@override@JsonKey(name: 'leftIcon') final  String? leftIcon;
@override@JsonKey(name: 'rightIcon') final  String? rightIcon;

/// Create a copy of RoleActionsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleActionsModelCopyWith<_RoleActionsModel> get copyWith => __$RoleActionsModelCopyWithImpl<_RoleActionsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoleActionsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleActionsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.queryParams, queryParams) || other.queryParams == queryParams)&&(identical(other.parentModule, parentModule) || other.parentModule == parentModule)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.serviceCode, serviceCode) || other.serviceCode == serviceCode)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.lastModifiedDate, lastModifiedDate) || other.lastModifiedDate == lastModifiedDate)&&(identical(other.lastModifiedBy, lastModifiedBy) || other.lastModifiedBy == lastModifiedBy)&&(identical(other.path, path) || other.path == path)&&(identical(other.navigationURL, navigationURL) || other.navigationURL == navigationURL)&&(identical(other.leftIcon, leftIcon) || other.leftIcon == leftIcon)&&(identical(other.rightIcon, rightIcon) || other.rightIcon == rightIcon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url,displayName,orderNumber,queryParams,parentModule,enabled,serviceCode,tenantId,createdDate,createdBy,lastModifiedDate,lastModifiedBy,path,navigationURL,leftIcon,rightIcon);

@override
String toString() {
  return 'RoleActionsModel(id: $id, name: $name, url: $url, displayName: $displayName, orderNumber: $orderNumber, queryParams: $queryParams, parentModule: $parentModule, enabled: $enabled, serviceCode: $serviceCode, tenantId: $tenantId, createdDate: $createdDate, createdBy: $createdBy, lastModifiedDate: $lastModifiedDate, lastModifiedBy: $lastModifiedBy, path: $path, navigationURL: $navigationURL, leftIcon: $leftIcon, rightIcon: $rightIcon)';
}


}

/// @nodoc
abstract mixin class _$RoleActionsModelCopyWith<$Res> implements $RoleActionsModelCopyWith<$Res> {
  factory _$RoleActionsModelCopyWith(_RoleActionsModel value, $Res Function(_RoleActionsModel) _then) = __$RoleActionsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'url') String? url,@JsonKey(name: 'displayName') String? displayName,@JsonKey(name: 'orderNumber') num? orderNumber,@JsonKey(name: 'queryParams') String? queryParams,@JsonKey(name: 'parentModule') String? parentModule,@JsonKey(name: 'enabled') bool enabled,@JsonKey(name: 'serviceCode') String? serviceCode,@JsonKey(name: 'tenantId') String tenantId,@JsonKey(name: 'createdDate') String? createdDate,@JsonKey(name: 'createdBy') String? createdBy,@JsonKey(name: 'lastModifiedDate') String? lastModifiedDate,@JsonKey(name: 'lastModifiedBy') String? lastModifiedBy,@JsonKey(name: 'path') String? path,@JsonKey(name: 'navigationURL') String? navigationURL,@JsonKey(name: 'leftIcon') String? leftIcon,@JsonKey(name: 'rightIcon') String? rightIcon
});




}
/// @nodoc
class __$RoleActionsModelCopyWithImpl<$Res>
    implements _$RoleActionsModelCopyWith<$Res> {
  __$RoleActionsModelCopyWithImpl(this._self, this._then);

  final _RoleActionsModel _self;
  final $Res Function(_RoleActionsModel) _then;

/// Create a copy of RoleActionsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? url = freezed,Object? displayName = freezed,Object? orderNumber = freezed,Object? queryParams = freezed,Object? parentModule = freezed,Object? enabled = null,Object? serviceCode = freezed,Object? tenantId = null,Object? createdDate = freezed,Object? createdBy = freezed,Object? lastModifiedDate = freezed,Object? lastModifiedBy = freezed,Object? path = freezed,Object? navigationURL = freezed,Object? leftIcon = freezed,Object? rightIcon = freezed,}) {
  return _then(_RoleActionsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as num?,queryParams: freezed == queryParams ? _self.queryParams : queryParams // ignore: cast_nullable_to_non_nullable
as String?,parentModule: freezed == parentModule ? _self.parentModule : parentModule // ignore: cast_nullable_to_non_nullable
as String?,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,serviceCode: freezed == serviceCode ? _self.serviceCode : serviceCode // ignore: cast_nullable_to_non_nullable
as String?,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,lastModifiedDate: freezed == lastModifiedDate ? _self.lastModifiedDate : lastModifiedDate // ignore: cast_nullable_to_non_nullable
as String?,lastModifiedBy: freezed == lastModifiedBy ? _self.lastModifiedBy : lastModifiedBy // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,navigationURL: freezed == navigationURL ? _self.navigationURL : navigationURL // ignore: cast_nullable_to_non_nullable
as String?,leftIcon: freezed == leftIcon ? _self.leftIcon : leftIcon // ignore: cast_nullable_to_non_nullable
as String?,rightIcon: freezed == rightIcon ? _self.rightIcon : rightIcon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

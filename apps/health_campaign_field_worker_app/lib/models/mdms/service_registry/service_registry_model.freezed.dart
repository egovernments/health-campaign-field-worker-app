// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_registry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceRegistryPrimaryWrapperModel {

@JsonKey(name: 'HCM-SERVICE-REGISTRY') ServiceRegistrySecondaryWrapperModel? get serviceRegistry;
/// Create a copy of ServiceRegistryPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRegistryPrimaryWrapperModelCopyWith<ServiceRegistryPrimaryWrapperModel> get copyWith => _$ServiceRegistryPrimaryWrapperModelCopyWithImpl<ServiceRegistryPrimaryWrapperModel>(this as ServiceRegistryPrimaryWrapperModel, _$identity);

  /// Serializes this ServiceRegistryPrimaryWrapperModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRegistryPrimaryWrapperModel&&(identical(other.serviceRegistry, serviceRegistry) || other.serviceRegistry == serviceRegistry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceRegistry);

@override
String toString() {
  return 'ServiceRegistryPrimaryWrapperModel(serviceRegistry: $serviceRegistry)';
}


}

/// @nodoc
abstract mixin class $ServiceRegistryPrimaryWrapperModelCopyWith<$Res>  {
  factory $ServiceRegistryPrimaryWrapperModelCopyWith(ServiceRegistryPrimaryWrapperModel value, $Res Function(ServiceRegistryPrimaryWrapperModel) _then) = _$ServiceRegistryPrimaryWrapperModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'HCM-SERVICE-REGISTRY') ServiceRegistrySecondaryWrapperModel? serviceRegistry
});


$ServiceRegistrySecondaryWrapperModelCopyWith<$Res>? get serviceRegistry;

}
/// @nodoc
class _$ServiceRegistryPrimaryWrapperModelCopyWithImpl<$Res>
    implements $ServiceRegistryPrimaryWrapperModelCopyWith<$Res> {
  _$ServiceRegistryPrimaryWrapperModelCopyWithImpl(this._self, this._then);

  final ServiceRegistryPrimaryWrapperModel _self;
  final $Res Function(ServiceRegistryPrimaryWrapperModel) _then;

/// Create a copy of ServiceRegistryPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceRegistry = freezed,}) {
  return _then(_self.copyWith(
serviceRegistry: freezed == serviceRegistry ? _self.serviceRegistry : serviceRegistry // ignore: cast_nullable_to_non_nullable
as ServiceRegistrySecondaryWrapperModel?,
  ));
}
/// Create a copy of ServiceRegistryPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceRegistrySecondaryWrapperModelCopyWith<$Res>? get serviceRegistry {
    if (_self.serviceRegistry == null) {
    return null;
  }

  return $ServiceRegistrySecondaryWrapperModelCopyWith<$Res>(_self.serviceRegistry!, (value) {
    return _then(_self.copyWith(serviceRegistry: value));
  });
}
}


/// Adds pattern-matching-related methods to [ServiceRegistryPrimaryWrapperModel].
extension ServiceRegistryPrimaryWrapperModelPatterns on ServiceRegistryPrimaryWrapperModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRegistryPrimaryWrapperModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRegistryPrimaryWrapperModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRegistryPrimaryWrapperModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRegistryPrimaryWrapperModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRegistryPrimaryWrapperModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRegistryPrimaryWrapperModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'HCM-SERVICE-REGISTRY')  ServiceRegistrySecondaryWrapperModel? serviceRegistry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRegistryPrimaryWrapperModel() when $default != null:
return $default(_that.serviceRegistry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'HCM-SERVICE-REGISTRY')  ServiceRegistrySecondaryWrapperModel? serviceRegistry)  $default,) {final _that = this;
switch (_that) {
case _ServiceRegistryPrimaryWrapperModel():
return $default(_that.serviceRegistry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'HCM-SERVICE-REGISTRY')  ServiceRegistrySecondaryWrapperModel? serviceRegistry)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRegistryPrimaryWrapperModel() when $default != null:
return $default(_that.serviceRegistry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRegistryPrimaryWrapperModel implements ServiceRegistryPrimaryWrapperModel {
  const _ServiceRegistryPrimaryWrapperModel({@JsonKey(name: 'HCM-SERVICE-REGISTRY') this.serviceRegistry});
  factory _ServiceRegistryPrimaryWrapperModel.fromJson(Map<String, dynamic> json) => _$ServiceRegistryPrimaryWrapperModelFromJson(json);

@override@JsonKey(name: 'HCM-SERVICE-REGISTRY') final  ServiceRegistrySecondaryWrapperModel? serviceRegistry;

/// Create a copy of ServiceRegistryPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRegistryPrimaryWrapperModelCopyWith<_ServiceRegistryPrimaryWrapperModel> get copyWith => __$ServiceRegistryPrimaryWrapperModelCopyWithImpl<_ServiceRegistryPrimaryWrapperModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRegistryPrimaryWrapperModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRegistryPrimaryWrapperModel&&(identical(other.serviceRegistry, serviceRegistry) || other.serviceRegistry == serviceRegistry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceRegistry);

@override
String toString() {
  return 'ServiceRegistryPrimaryWrapperModel(serviceRegistry: $serviceRegistry)';
}


}

/// @nodoc
abstract mixin class _$ServiceRegistryPrimaryWrapperModelCopyWith<$Res> implements $ServiceRegistryPrimaryWrapperModelCopyWith<$Res> {
  factory _$ServiceRegistryPrimaryWrapperModelCopyWith(_ServiceRegistryPrimaryWrapperModel value, $Res Function(_ServiceRegistryPrimaryWrapperModel) _then) = __$ServiceRegistryPrimaryWrapperModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'HCM-SERVICE-REGISTRY') ServiceRegistrySecondaryWrapperModel? serviceRegistry
});


@override $ServiceRegistrySecondaryWrapperModelCopyWith<$Res>? get serviceRegistry;

}
/// @nodoc
class __$ServiceRegistryPrimaryWrapperModelCopyWithImpl<$Res>
    implements _$ServiceRegistryPrimaryWrapperModelCopyWith<$Res> {
  __$ServiceRegistryPrimaryWrapperModelCopyWithImpl(this._self, this._then);

  final _ServiceRegistryPrimaryWrapperModel _self;
  final $Res Function(_ServiceRegistryPrimaryWrapperModel) _then;

/// Create a copy of ServiceRegistryPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceRegistry = freezed,}) {
  return _then(_ServiceRegistryPrimaryWrapperModel(
serviceRegistry: freezed == serviceRegistry ? _self.serviceRegistry : serviceRegistry // ignore: cast_nullable_to_non_nullable
as ServiceRegistrySecondaryWrapperModel?,
  ));
}

/// Create a copy of ServiceRegistryPrimaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceRegistrySecondaryWrapperModelCopyWith<$Res>? get serviceRegistry {
    if (_self.serviceRegistry == null) {
    return null;
  }

  return $ServiceRegistrySecondaryWrapperModelCopyWith<$Res>(_self.serviceRegistry!, (value) {
    return _then(_self.copyWith(serviceRegistry: value));
  });
}
}


/// @nodoc
mixin _$ServiceRegistrySecondaryWrapperModel {

@JsonKey(name: 'serviceRegistry') List<ServiceRegistryModel> get serviceRegistryList;
/// Create a copy of ServiceRegistrySecondaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRegistrySecondaryWrapperModelCopyWith<ServiceRegistrySecondaryWrapperModel> get copyWith => _$ServiceRegistrySecondaryWrapperModelCopyWithImpl<ServiceRegistrySecondaryWrapperModel>(this as ServiceRegistrySecondaryWrapperModel, _$identity);

  /// Serializes this ServiceRegistrySecondaryWrapperModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRegistrySecondaryWrapperModel&&const DeepCollectionEquality().equals(other.serviceRegistryList, serviceRegistryList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(serviceRegistryList));

@override
String toString() {
  return 'ServiceRegistrySecondaryWrapperModel(serviceRegistryList: $serviceRegistryList)';
}


}

/// @nodoc
abstract mixin class $ServiceRegistrySecondaryWrapperModelCopyWith<$Res>  {
  factory $ServiceRegistrySecondaryWrapperModelCopyWith(ServiceRegistrySecondaryWrapperModel value, $Res Function(ServiceRegistrySecondaryWrapperModel) _then) = _$ServiceRegistrySecondaryWrapperModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'serviceRegistry') List<ServiceRegistryModel> serviceRegistryList
});




}
/// @nodoc
class _$ServiceRegistrySecondaryWrapperModelCopyWithImpl<$Res>
    implements $ServiceRegistrySecondaryWrapperModelCopyWith<$Res> {
  _$ServiceRegistrySecondaryWrapperModelCopyWithImpl(this._self, this._then);

  final ServiceRegistrySecondaryWrapperModel _self;
  final $Res Function(ServiceRegistrySecondaryWrapperModel) _then;

/// Create a copy of ServiceRegistrySecondaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceRegistryList = null,}) {
  return _then(_self.copyWith(
serviceRegistryList: null == serviceRegistryList ? _self.serviceRegistryList : serviceRegistryList // ignore: cast_nullable_to_non_nullable
as List<ServiceRegistryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRegistrySecondaryWrapperModel].
extension ServiceRegistrySecondaryWrapperModelPatterns on ServiceRegistrySecondaryWrapperModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRegistrySecondaryWrapperModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRegistrySecondaryWrapperModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRegistrySecondaryWrapperModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRegistrySecondaryWrapperModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRegistrySecondaryWrapperModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRegistrySecondaryWrapperModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'serviceRegistry')  List<ServiceRegistryModel> serviceRegistryList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRegistrySecondaryWrapperModel() when $default != null:
return $default(_that.serviceRegistryList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'serviceRegistry')  List<ServiceRegistryModel> serviceRegistryList)  $default,) {final _that = this;
switch (_that) {
case _ServiceRegistrySecondaryWrapperModel():
return $default(_that.serviceRegistryList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'serviceRegistry')  List<ServiceRegistryModel> serviceRegistryList)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRegistrySecondaryWrapperModel() when $default != null:
return $default(_that.serviceRegistryList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRegistrySecondaryWrapperModel implements ServiceRegistrySecondaryWrapperModel {
  const _ServiceRegistrySecondaryWrapperModel({@JsonKey(name: 'serviceRegistry') final  List<ServiceRegistryModel> serviceRegistryList = const []}): _serviceRegistryList = serviceRegistryList;
  factory _ServiceRegistrySecondaryWrapperModel.fromJson(Map<String, dynamic> json) => _$ServiceRegistrySecondaryWrapperModelFromJson(json);

 final  List<ServiceRegistryModel> _serviceRegistryList;
@override@JsonKey(name: 'serviceRegistry') List<ServiceRegistryModel> get serviceRegistryList {
  if (_serviceRegistryList is EqualUnmodifiableListView) return _serviceRegistryList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_serviceRegistryList);
}


/// Create a copy of ServiceRegistrySecondaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRegistrySecondaryWrapperModelCopyWith<_ServiceRegistrySecondaryWrapperModel> get copyWith => __$ServiceRegistrySecondaryWrapperModelCopyWithImpl<_ServiceRegistrySecondaryWrapperModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRegistrySecondaryWrapperModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRegistrySecondaryWrapperModel&&const DeepCollectionEquality().equals(other._serviceRegistryList, _serviceRegistryList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_serviceRegistryList));

@override
String toString() {
  return 'ServiceRegistrySecondaryWrapperModel(serviceRegistryList: $serviceRegistryList)';
}


}

/// @nodoc
abstract mixin class _$ServiceRegistrySecondaryWrapperModelCopyWith<$Res> implements $ServiceRegistrySecondaryWrapperModelCopyWith<$Res> {
  factory _$ServiceRegistrySecondaryWrapperModelCopyWith(_ServiceRegistrySecondaryWrapperModel value, $Res Function(_ServiceRegistrySecondaryWrapperModel) _then) = __$ServiceRegistrySecondaryWrapperModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'serviceRegistry') List<ServiceRegistryModel> serviceRegistryList
});




}
/// @nodoc
class __$ServiceRegistrySecondaryWrapperModelCopyWithImpl<$Res>
    implements _$ServiceRegistrySecondaryWrapperModelCopyWith<$Res> {
  __$ServiceRegistrySecondaryWrapperModelCopyWithImpl(this._self, this._then);

  final _ServiceRegistrySecondaryWrapperModel _self;
  final $Res Function(_ServiceRegistrySecondaryWrapperModel) _then;

/// Create a copy of ServiceRegistrySecondaryWrapperModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceRegistryList = null,}) {
  return _then(_ServiceRegistrySecondaryWrapperModel(
serviceRegistryList: null == serviceRegistryList ? _self._serviceRegistryList : serviceRegistryList // ignore: cast_nullable_to_non_nullable
as List<ServiceRegistryModel>,
  ));
}


}


/// @nodoc
mixin _$ServiceRegistryModel {

 String get service; List<ActionsModel> get actions;
/// Create a copy of ServiceRegistryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRegistryModelCopyWith<ServiceRegistryModel> get copyWith => _$ServiceRegistryModelCopyWithImpl<ServiceRegistryModel>(this as ServiceRegistryModel, _$identity);

  /// Serializes this ServiceRegistryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRegistryModel&&(identical(other.service, service) || other.service == service)&&const DeepCollectionEquality().equals(other.actions, actions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,service,const DeepCollectionEquality().hash(actions));

@override
String toString() {
  return 'ServiceRegistryModel(service: $service, actions: $actions)';
}


}

/// @nodoc
abstract mixin class $ServiceRegistryModelCopyWith<$Res>  {
  factory $ServiceRegistryModelCopyWith(ServiceRegistryModel value, $Res Function(ServiceRegistryModel) _then) = _$ServiceRegistryModelCopyWithImpl;
@useResult
$Res call({
 String service, List<ActionsModel> actions
});




}
/// @nodoc
class _$ServiceRegistryModelCopyWithImpl<$Res>
    implements $ServiceRegistryModelCopyWith<$Res> {
  _$ServiceRegistryModelCopyWithImpl(this._self, this._then);

  final ServiceRegistryModel _self;
  final $Res Function(ServiceRegistryModel) _then;

/// Create a copy of ServiceRegistryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? service = null,Object? actions = null,}) {
  return _then(_self.copyWith(
service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as String,actions: null == actions ? _self.actions : actions // ignore: cast_nullable_to_non_nullable
as List<ActionsModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRegistryModel].
extension ServiceRegistryModelPatterns on ServiceRegistryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRegistryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRegistryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRegistryModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRegistryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRegistryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRegistryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String service,  List<ActionsModel> actions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRegistryModel() when $default != null:
return $default(_that.service,_that.actions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String service,  List<ActionsModel> actions)  $default,) {final _that = this;
switch (_that) {
case _ServiceRegistryModel():
return $default(_that.service,_that.actions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String service,  List<ActionsModel> actions)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRegistryModel() when $default != null:
return $default(_that.service,_that.actions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRegistryModel implements ServiceRegistryModel {
  const _ServiceRegistryModel({required this.service, final  List<ActionsModel> actions = const []}): _actions = actions;
  factory _ServiceRegistryModel.fromJson(Map<String, dynamic> json) => _$ServiceRegistryModelFromJson(json);

@override final  String service;
 final  List<ActionsModel> _actions;
@override@JsonKey() List<ActionsModel> get actions {
  if (_actions is EqualUnmodifiableListView) return _actions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_actions);
}


/// Create a copy of ServiceRegistryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRegistryModelCopyWith<_ServiceRegistryModel> get copyWith => __$ServiceRegistryModelCopyWithImpl<_ServiceRegistryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRegistryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRegistryModel&&(identical(other.service, service) || other.service == service)&&const DeepCollectionEquality().equals(other._actions, _actions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,service,const DeepCollectionEquality().hash(_actions));

@override
String toString() {
  return 'ServiceRegistryModel(service: $service, actions: $actions)';
}


}

/// @nodoc
abstract mixin class _$ServiceRegistryModelCopyWith<$Res> implements $ServiceRegistryModelCopyWith<$Res> {
  factory _$ServiceRegistryModelCopyWith(_ServiceRegistryModel value, $Res Function(_ServiceRegistryModel) _then) = __$ServiceRegistryModelCopyWithImpl;
@override @useResult
$Res call({
 String service, List<ActionsModel> actions
});




}
/// @nodoc
class __$ServiceRegistryModelCopyWithImpl<$Res>
    implements _$ServiceRegistryModelCopyWith<$Res> {
  __$ServiceRegistryModelCopyWithImpl(this._self, this._then);

  final _ServiceRegistryModel _self;
  final $Res Function(_ServiceRegistryModel) _then;

/// Create a copy of ServiceRegistryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? service = null,Object? actions = null,}) {
  return _then(_ServiceRegistryModel(
service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as String,actions: null == actions ? _self._actions : actions // ignore: cast_nullable_to_non_nullable
as List<ActionsModel>,
  ));
}


}


/// @nodoc
mixin _$ActionsModel {

 String get action; String get entityName; String get path;
/// Create a copy of ActionsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionsModelCopyWith<ActionsModel> get copyWith => _$ActionsModelCopyWithImpl<ActionsModel>(this as ActionsModel, _$identity);

  /// Serializes this ActionsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionsModel&&(identical(other.action, action) || other.action == action)&&(identical(other.entityName, entityName) || other.entityName == entityName)&&(identical(other.path, path) || other.path == path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action,entityName,path);

@override
String toString() {
  return 'ActionsModel(action: $action, entityName: $entityName, path: $path)';
}


}

/// @nodoc
abstract mixin class $ActionsModelCopyWith<$Res>  {
  factory $ActionsModelCopyWith(ActionsModel value, $Res Function(ActionsModel) _then) = _$ActionsModelCopyWithImpl;
@useResult
$Res call({
 String action, String entityName, String path
});




}
/// @nodoc
class _$ActionsModelCopyWithImpl<$Res>
    implements $ActionsModelCopyWith<$Res> {
  _$ActionsModelCopyWithImpl(this._self, this._then);

  final ActionsModel _self;
  final $Res Function(ActionsModel) _then;

/// Create a copy of ActionsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? action = null,Object? entityName = null,Object? path = null,}) {
  return _then(_self.copyWith(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,entityName: null == entityName ? _self.entityName : entityName // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ActionsModel].
extension ActionsModelPatterns on ActionsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActionsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActionsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActionsModel value)  $default,){
final _that = this;
switch (_that) {
case _ActionsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActionsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ActionsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String action,  String entityName,  String path)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActionsModel() when $default != null:
return $default(_that.action,_that.entityName,_that.path);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String action,  String entityName,  String path)  $default,) {final _that = this;
switch (_that) {
case _ActionsModel():
return $default(_that.action,_that.entityName,_that.path);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String action,  String entityName,  String path)?  $default,) {final _that = this;
switch (_that) {
case _ActionsModel() when $default != null:
return $default(_that.action,_that.entityName,_that.path);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActionsModel implements ActionsModel {
  const _ActionsModel({required this.action, required this.entityName, required this.path});
  factory _ActionsModel.fromJson(Map<String, dynamic> json) => _$ActionsModelFromJson(json);

@override final  String action;
@override final  String entityName;
@override final  String path;

/// Create a copy of ActionsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActionsModelCopyWith<_ActionsModel> get copyWith => __$ActionsModelCopyWithImpl<_ActionsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActionsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionsModel&&(identical(other.action, action) || other.action == action)&&(identical(other.entityName, entityName) || other.entityName == entityName)&&(identical(other.path, path) || other.path == path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action,entityName,path);

@override
String toString() {
  return 'ActionsModel(action: $action, entityName: $entityName, path: $path)';
}


}

/// @nodoc
abstract mixin class _$ActionsModelCopyWith<$Res> implements $ActionsModelCopyWith<$Res> {
  factory _$ActionsModelCopyWith(_ActionsModel value, $Res Function(_ActionsModel) _then) = __$ActionsModelCopyWithImpl;
@override @useResult
$Res call({
 String action, String entityName, String path
});




}
/// @nodoc
class __$ActionsModelCopyWithImpl<$Res>
    implements _$ActionsModelCopyWith<$Res> {
  __$ActionsModelCopyWithImpl(this._self, this._then);

  final _ActionsModel _self;
  final $Res Function(_ActionsModel) _then;

/// Create a copy of ActionsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? action = null,Object? entityName = null,Object? path = null,}) {
  return _then(_ActionsModel(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,entityName: null == entityName ? _self.entityName : entityName // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

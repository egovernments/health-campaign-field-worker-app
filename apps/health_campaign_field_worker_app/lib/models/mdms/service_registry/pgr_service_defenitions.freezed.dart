// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pgr_service_defenitions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PGRServiceDefinitions {

@JsonKey(name: 'RAINMAKER-PGR') ServiceDefinitionWrapper? get serviceDefinitionWrapper;
/// Create a copy of PGRServiceDefinitions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PGRServiceDefinitionsCopyWith<PGRServiceDefinitions> get copyWith => _$PGRServiceDefinitionsCopyWithImpl<PGRServiceDefinitions>(this as PGRServiceDefinitions, _$identity);

  /// Serializes this PGRServiceDefinitions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PGRServiceDefinitions&&(identical(other.serviceDefinitionWrapper, serviceDefinitionWrapper) || other.serviceDefinitionWrapper == serviceDefinitionWrapper));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceDefinitionWrapper);

@override
String toString() {
  return 'PGRServiceDefinitions(serviceDefinitionWrapper: $serviceDefinitionWrapper)';
}


}

/// @nodoc
abstract mixin class $PGRServiceDefinitionsCopyWith<$Res>  {
  factory $PGRServiceDefinitionsCopyWith(PGRServiceDefinitions value, $Res Function(PGRServiceDefinitions) _then) = _$PGRServiceDefinitionsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'RAINMAKER-PGR') ServiceDefinitionWrapper? serviceDefinitionWrapper
});


$ServiceDefinitionWrapperCopyWith<$Res>? get serviceDefinitionWrapper;

}
/// @nodoc
class _$PGRServiceDefinitionsCopyWithImpl<$Res>
    implements $PGRServiceDefinitionsCopyWith<$Res> {
  _$PGRServiceDefinitionsCopyWithImpl(this._self, this._then);

  final PGRServiceDefinitions _self;
  final $Res Function(PGRServiceDefinitions) _then;

/// Create a copy of PGRServiceDefinitions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceDefinitionWrapper = freezed,}) {
  return _then(_self.copyWith(
serviceDefinitionWrapper: freezed == serviceDefinitionWrapper ? _self.serviceDefinitionWrapper : serviceDefinitionWrapper // ignore: cast_nullable_to_non_nullable
as ServiceDefinitionWrapper?,
  ));
}
/// Create a copy of PGRServiceDefinitions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceDefinitionWrapperCopyWith<$Res>? get serviceDefinitionWrapper {
    if (_self.serviceDefinitionWrapper == null) {
    return null;
  }

  return $ServiceDefinitionWrapperCopyWith<$Res>(_self.serviceDefinitionWrapper!, (value) {
    return _then(_self.copyWith(serviceDefinitionWrapper: value));
  });
}
}


/// Adds pattern-matching-related methods to [PGRServiceDefinitions].
extension PGRServiceDefinitionsPatterns on PGRServiceDefinitions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PGRServiceDefinitions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PGRServiceDefinitions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PGRServiceDefinitions value)  $default,){
final _that = this;
switch (_that) {
case _PGRServiceDefinitions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PGRServiceDefinitions value)?  $default,){
final _that = this;
switch (_that) {
case _PGRServiceDefinitions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'RAINMAKER-PGR')  ServiceDefinitionWrapper? serviceDefinitionWrapper)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PGRServiceDefinitions() when $default != null:
return $default(_that.serviceDefinitionWrapper);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'RAINMAKER-PGR')  ServiceDefinitionWrapper? serviceDefinitionWrapper)  $default,) {final _that = this;
switch (_that) {
case _PGRServiceDefinitions():
return $default(_that.serviceDefinitionWrapper);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'RAINMAKER-PGR')  ServiceDefinitionWrapper? serviceDefinitionWrapper)?  $default,) {final _that = this;
switch (_that) {
case _PGRServiceDefinitions() when $default != null:
return $default(_that.serviceDefinitionWrapper);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PGRServiceDefinitions implements PGRServiceDefinitions {
  const _PGRServiceDefinitions({@JsonKey(name: 'RAINMAKER-PGR') this.serviceDefinitionWrapper});
  factory _PGRServiceDefinitions.fromJson(Map<String, dynamic> json) => _$PGRServiceDefinitionsFromJson(json);

@override@JsonKey(name: 'RAINMAKER-PGR') final  ServiceDefinitionWrapper? serviceDefinitionWrapper;

/// Create a copy of PGRServiceDefinitions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PGRServiceDefinitionsCopyWith<_PGRServiceDefinitions> get copyWith => __$PGRServiceDefinitionsCopyWithImpl<_PGRServiceDefinitions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PGRServiceDefinitionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PGRServiceDefinitions&&(identical(other.serviceDefinitionWrapper, serviceDefinitionWrapper) || other.serviceDefinitionWrapper == serviceDefinitionWrapper));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceDefinitionWrapper);

@override
String toString() {
  return 'PGRServiceDefinitions(serviceDefinitionWrapper: $serviceDefinitionWrapper)';
}


}

/// @nodoc
abstract mixin class _$PGRServiceDefinitionsCopyWith<$Res> implements $PGRServiceDefinitionsCopyWith<$Res> {
  factory _$PGRServiceDefinitionsCopyWith(_PGRServiceDefinitions value, $Res Function(_PGRServiceDefinitions) _then) = __$PGRServiceDefinitionsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'RAINMAKER-PGR') ServiceDefinitionWrapper? serviceDefinitionWrapper
});


@override $ServiceDefinitionWrapperCopyWith<$Res>? get serviceDefinitionWrapper;

}
/// @nodoc
class __$PGRServiceDefinitionsCopyWithImpl<$Res>
    implements _$PGRServiceDefinitionsCopyWith<$Res> {
  __$PGRServiceDefinitionsCopyWithImpl(this._self, this._then);

  final _PGRServiceDefinitions _self;
  final $Res Function(_PGRServiceDefinitions) _then;

/// Create a copy of PGRServiceDefinitions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceDefinitionWrapper = freezed,}) {
  return _then(_PGRServiceDefinitions(
serviceDefinitionWrapper: freezed == serviceDefinitionWrapper ? _self.serviceDefinitionWrapper : serviceDefinitionWrapper // ignore: cast_nullable_to_non_nullable
as ServiceDefinitionWrapper?,
  ));
}

/// Create a copy of PGRServiceDefinitions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceDefinitionWrapperCopyWith<$Res>? get serviceDefinitionWrapper {
    if (_self.serviceDefinitionWrapper == null) {
    return null;
  }

  return $ServiceDefinitionWrapperCopyWith<$Res>(_self.serviceDefinitionWrapper!, (value) {
    return _then(_self.copyWith(serviceDefinitionWrapper: value));
  });
}
}


/// @nodoc
mixin _$ServiceDefinitionWrapper {

@JsonKey(name: "ServiceDefs") List<Definition> get definition;
/// Create a copy of ServiceDefinitionWrapper
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceDefinitionWrapperCopyWith<ServiceDefinitionWrapper> get copyWith => _$ServiceDefinitionWrapperCopyWithImpl<ServiceDefinitionWrapper>(this as ServiceDefinitionWrapper, _$identity);

  /// Serializes this ServiceDefinitionWrapper to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDefinitionWrapper&&const DeepCollectionEquality().equals(other.definition, definition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(definition));

@override
String toString() {
  return 'ServiceDefinitionWrapper(definition: $definition)';
}


}

/// @nodoc
abstract mixin class $ServiceDefinitionWrapperCopyWith<$Res>  {
  factory $ServiceDefinitionWrapperCopyWith(ServiceDefinitionWrapper value, $Res Function(ServiceDefinitionWrapper) _then) = _$ServiceDefinitionWrapperCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "ServiceDefs") List<Definition> definition
});




}
/// @nodoc
class _$ServiceDefinitionWrapperCopyWithImpl<$Res>
    implements $ServiceDefinitionWrapperCopyWith<$Res> {
  _$ServiceDefinitionWrapperCopyWithImpl(this._self, this._then);

  final ServiceDefinitionWrapper _self;
  final $Res Function(ServiceDefinitionWrapper) _then;

/// Create a copy of ServiceDefinitionWrapper
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? definition = null,}) {
  return _then(_self.copyWith(
definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as List<Definition>,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceDefinitionWrapper].
extension ServiceDefinitionWrapperPatterns on ServiceDefinitionWrapper {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceDefinitionWrapper value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceDefinitionWrapper() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceDefinitionWrapper value)  $default,){
final _that = this;
switch (_that) {
case _ServiceDefinitionWrapper():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceDefinitionWrapper value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceDefinitionWrapper() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "ServiceDefs")  List<Definition> definition)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceDefinitionWrapper() when $default != null:
return $default(_that.definition);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "ServiceDefs")  List<Definition> definition)  $default,) {final _that = this;
switch (_that) {
case _ServiceDefinitionWrapper():
return $default(_that.definition);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "ServiceDefs")  List<Definition> definition)?  $default,) {final _that = this;
switch (_that) {
case _ServiceDefinitionWrapper() when $default != null:
return $default(_that.definition);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceDefinitionWrapper implements ServiceDefinitionWrapper {
  const _ServiceDefinitionWrapper({@JsonKey(name: "ServiceDefs") final  List<Definition> definition = const []}): _definition = definition;
  factory _ServiceDefinitionWrapper.fromJson(Map<String, dynamic> json) => _$ServiceDefinitionWrapperFromJson(json);

 final  List<Definition> _definition;
@override@JsonKey(name: "ServiceDefs") List<Definition> get definition {
  if (_definition is EqualUnmodifiableListView) return _definition;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_definition);
}


/// Create a copy of ServiceDefinitionWrapper
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceDefinitionWrapperCopyWith<_ServiceDefinitionWrapper> get copyWith => __$ServiceDefinitionWrapperCopyWithImpl<_ServiceDefinitionWrapper>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceDefinitionWrapperToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceDefinitionWrapper&&const DeepCollectionEquality().equals(other._definition, _definition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_definition));

@override
String toString() {
  return 'ServiceDefinitionWrapper(definition: $definition)';
}


}

/// @nodoc
abstract mixin class _$ServiceDefinitionWrapperCopyWith<$Res> implements $ServiceDefinitionWrapperCopyWith<$Res> {
  factory _$ServiceDefinitionWrapperCopyWith(_ServiceDefinitionWrapper value, $Res Function(_ServiceDefinitionWrapper) _then) = __$ServiceDefinitionWrapperCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "ServiceDefs") List<Definition> definition
});




}
/// @nodoc
class __$ServiceDefinitionWrapperCopyWithImpl<$Res>
    implements _$ServiceDefinitionWrapperCopyWith<$Res> {
  __$ServiceDefinitionWrapperCopyWithImpl(this._self, this._then);

  final _ServiceDefinitionWrapper _self;
  final $Res Function(_ServiceDefinitionWrapper) _then;

/// Create a copy of ServiceDefinitionWrapper
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? definition = null,}) {
  return _then(_ServiceDefinitionWrapper(
definition: null == definition ? _self._definition : definition // ignore: cast_nullable_to_non_nullable
as List<Definition>,
  ));
}


}


/// @nodoc
mixin _$Definition {

 String get serviceCode; String get name;
/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefinitionCopyWith<Definition> get copyWith => _$DefinitionCopyWithImpl<Definition>(this as Definition, _$identity);

  /// Serializes this Definition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Definition&&(identical(other.serviceCode, serviceCode) || other.serviceCode == serviceCode)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceCode,name);

@override
String toString() {
  return 'Definition(serviceCode: $serviceCode, name: $name)';
}


}

/// @nodoc
abstract mixin class $DefinitionCopyWith<$Res>  {
  factory $DefinitionCopyWith(Definition value, $Res Function(Definition) _then) = _$DefinitionCopyWithImpl;
@useResult
$Res call({
 String serviceCode, String name
});




}
/// @nodoc
class _$DefinitionCopyWithImpl<$Res>
    implements $DefinitionCopyWith<$Res> {
  _$DefinitionCopyWithImpl(this._self, this._then);

  final Definition _self;
  final $Res Function(Definition) _then;

/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceCode = null,Object? name = null,}) {
  return _then(_self.copyWith(
serviceCode: null == serviceCode ? _self.serviceCode : serviceCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Definition].
extension DefinitionPatterns on Definition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Definition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Definition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Definition value)  $default,){
final _that = this;
switch (_that) {
case _Definition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Definition value)?  $default,){
final _that = this;
switch (_that) {
case _Definition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serviceCode,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Definition() when $default != null:
return $default(_that.serviceCode,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serviceCode,  String name)  $default,) {final _that = this;
switch (_that) {
case _Definition():
return $default(_that.serviceCode,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serviceCode,  String name)?  $default,) {final _that = this;
switch (_that) {
case _Definition() when $default != null:
return $default(_that.serviceCode,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Definition implements Definition {
  const _Definition({required this.serviceCode, required this.name});
  factory _Definition.fromJson(Map<String, dynamic> json) => _$DefinitionFromJson(json);

@override final  String serviceCode;
@override final  String name;

/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DefinitionCopyWith<_Definition> get copyWith => __$DefinitionCopyWithImpl<_Definition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DefinitionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Definition&&(identical(other.serviceCode, serviceCode) || other.serviceCode == serviceCode)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceCode,name);

@override
String toString() {
  return 'Definition(serviceCode: $serviceCode, name: $name)';
}


}

/// @nodoc
abstract mixin class _$DefinitionCopyWith<$Res> implements $DefinitionCopyWith<$Res> {
  factory _$DefinitionCopyWith(_Definition value, $Res Function(_Definition) _then) = __$DefinitionCopyWithImpl;
@override @useResult
$Res call({
 String serviceCode, String name
});




}
/// @nodoc
class __$DefinitionCopyWithImpl<$Res>
    implements _$DefinitionCopyWith<$Res> {
  __$DefinitionCopyWithImpl(this._self, this._then);

  final _Definition _self;
  final $Res Function(_Definition) _then;

/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceCode = null,Object? name = null,}) {
  return _then(_Definition(
serviceCode: null == serviceCode ? _self.serviceCode : serviceCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

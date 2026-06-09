// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_initialization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppInitializationEvent {

 int get retriesLeft;
/// Create a copy of AppInitializationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppInitializationEventCopyWith<AppInitializationEvent> get copyWith => _$AppInitializationEventCopyWithImpl<AppInitializationEvent>(this as AppInitializationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInitializationEvent&&(identical(other.retriesLeft, retriesLeft) || other.retriesLeft == retriesLeft));
}


@override
int get hashCode => Object.hash(runtimeType,retriesLeft);

@override
String toString() {
  return 'AppInitializationEvent(retriesLeft: $retriesLeft)';
}


}

/// @nodoc
abstract mixin class $AppInitializationEventCopyWith<$Res>  {
  factory $AppInitializationEventCopyWith(AppInitializationEvent value, $Res Function(AppInitializationEvent) _then) = _$AppInitializationEventCopyWithImpl;
@useResult
$Res call({
 int retriesLeft
});




}
/// @nodoc
class _$AppInitializationEventCopyWithImpl<$Res>
    implements $AppInitializationEventCopyWith<$Res> {
  _$AppInitializationEventCopyWithImpl(this._self, this._then);

  final AppInitializationEvent _self;
  final $Res Function(AppInitializationEvent) _then;

/// Create a copy of AppInitializationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? retriesLeft = null,}) {
  return _then(_self.copyWith(
retriesLeft: null == retriesLeft ? _self.retriesLeft : retriesLeft // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AppInitializationEvent].
extension AppInitializationEventPatterns on AppInitializationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AppInitializationSetupEvent value)?  onSetup,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AppInitializationSetupEvent() when onSetup != null:
return onSetup(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AppInitializationSetupEvent value)  onSetup,}){
final _that = this;
switch (_that) {
case AppInitializationSetupEvent():
return onSetup(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AppInitializationSetupEvent value)?  onSetup,}){
final _that = this;
switch (_that) {
case AppInitializationSetupEvent() when onSetup != null:
return onSetup(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int retriesLeft)?  onSetup,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AppInitializationSetupEvent() when onSetup != null:
return onSetup(_that.retriesLeft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int retriesLeft)  onSetup,}) {final _that = this;
switch (_that) {
case AppInitializationSetupEvent():
return onSetup(_that.retriesLeft);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int retriesLeft)?  onSetup,}) {final _that = this;
switch (_that) {
case AppInitializationSetupEvent() when onSetup != null:
return onSetup(_that.retriesLeft);case _:
  return null;

}
}

}

/// @nodoc


class AppInitializationSetupEvent implements AppInitializationEvent {
  const AppInitializationSetupEvent({this.retriesLeft = 3});
  

@override@JsonKey() final  int retriesLeft;

/// Create a copy of AppInitializationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppInitializationSetupEventCopyWith<AppInitializationSetupEvent> get copyWith => _$AppInitializationSetupEventCopyWithImpl<AppInitializationSetupEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInitializationSetupEvent&&(identical(other.retriesLeft, retriesLeft) || other.retriesLeft == retriesLeft));
}


@override
int get hashCode => Object.hash(runtimeType,retriesLeft);

@override
String toString() {
  return 'AppInitializationEvent.onSetup(retriesLeft: $retriesLeft)';
}


}

/// @nodoc
abstract mixin class $AppInitializationSetupEventCopyWith<$Res> implements $AppInitializationEventCopyWith<$Res> {
  factory $AppInitializationSetupEventCopyWith(AppInitializationSetupEvent value, $Res Function(AppInitializationSetupEvent) _then) = _$AppInitializationSetupEventCopyWithImpl;
@override @useResult
$Res call({
 int retriesLeft
});




}
/// @nodoc
class _$AppInitializationSetupEventCopyWithImpl<$Res>
    implements $AppInitializationSetupEventCopyWith<$Res> {
  _$AppInitializationSetupEventCopyWithImpl(this._self, this._then);

  final AppInitializationSetupEvent _self;
  final $Res Function(AppInitializationSetupEvent) _then;

/// Create a copy of AppInitializationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? retriesLeft = null,}) {
  return _then(AppInitializationSetupEvent(
retriesLeft: null == retriesLeft ? _self.retriesLeft : retriesLeft // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$AppInitializationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInitializationState);
}


@override
int get hashCode => runtimeType.hashCode;



}

/// @nodoc
class $AppInitializationStateCopyWith<$Res>  {
$AppInitializationStateCopyWith(AppInitializationState _, $Res Function(AppInitializationState) __);
}


/// Adds pattern-matching-related methods to [AppInitializationState].
extension AppInitializationStatePatterns on AppInitializationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AppUninitialized value)?  uninitialized,TResult Function( AppInitializing value)?  loading,TResult Function( AppInitializationFailed value)?  failed,TResult Function( AppInitialized value)?  initialized,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AppUninitialized() when uninitialized != null:
return uninitialized(_that);case AppInitializing() when loading != null:
return loading(_that);case AppInitializationFailed() when failed != null:
return failed(_that);case AppInitialized() when initialized != null:
return initialized(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AppUninitialized value)  uninitialized,required TResult Function( AppInitializing value)  loading,required TResult Function( AppInitializationFailed value)  failed,required TResult Function( AppInitialized value)  initialized,}){
final _that = this;
switch (_that) {
case AppUninitialized():
return uninitialized(_that);case AppInitializing():
return loading(_that);case AppInitializationFailed():
return failed(_that);case AppInitialized():
return initialized(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AppUninitialized value)?  uninitialized,TResult? Function( AppInitializing value)?  loading,TResult? Function( AppInitializationFailed value)?  failed,TResult? Function( AppInitialized value)?  initialized,}){
final _that = this;
switch (_that) {
case AppUninitialized() when uninitialized != null:
return uninitialized(_that);case AppInitializing() when loading != null:
return loading(_that);case AppInitializationFailed() when failed != null:
return failed(_that);case AppInitialized() when initialized != null:
return initialized(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  uninitialized,TResult Function()?  loading,TResult Function()?  failed,TResult Function( AppConfiguration appConfiguration,  List<ServiceRegistry> serviceRegistryList,  List<DashboardConfigSchema?>? dashboardConfigSchema)?  initialized,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AppUninitialized() when uninitialized != null:
return uninitialized();case AppInitializing() when loading != null:
return loading();case AppInitializationFailed() when failed != null:
return failed();case AppInitialized() when initialized != null:
return initialized(_that.appConfiguration,_that.serviceRegistryList,_that.dashboardConfigSchema);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  uninitialized,required TResult Function()  loading,required TResult Function()  failed,required TResult Function( AppConfiguration appConfiguration,  List<ServiceRegistry> serviceRegistryList,  List<DashboardConfigSchema?>? dashboardConfigSchema)  initialized,}) {final _that = this;
switch (_that) {
case AppUninitialized():
return uninitialized();case AppInitializing():
return loading();case AppInitializationFailed():
return failed();case AppInitialized():
return initialized(_that.appConfiguration,_that.serviceRegistryList,_that.dashboardConfigSchema);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  uninitialized,TResult? Function()?  loading,TResult? Function()?  failed,TResult? Function( AppConfiguration appConfiguration,  List<ServiceRegistry> serviceRegistryList,  List<DashboardConfigSchema?>? dashboardConfigSchema)?  initialized,}) {final _that = this;
switch (_that) {
case AppUninitialized() when uninitialized != null:
return uninitialized();case AppInitializing() when loading != null:
return loading();case AppInitializationFailed() when failed != null:
return failed();case AppInitialized() when initialized != null:
return initialized(_that.appConfiguration,_that.serviceRegistryList,_that.dashboardConfigSchema);case _:
  return null;

}
}

}

/// @nodoc


class AppUninitialized extends AppInitializationState {
  const AppUninitialized(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUninitialized);
}


@override
int get hashCode => runtimeType.hashCode;



}




/// @nodoc


class AppInitializing extends AppInitializationState {
  const AppInitializing(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInitializing);
}


@override
int get hashCode => runtimeType.hashCode;



}




/// @nodoc


class AppInitializationFailed extends AppInitializationState {
  const AppInitializationFailed(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInitializationFailed);
}


@override
int get hashCode => runtimeType.hashCode;



}




/// @nodoc


class AppInitialized extends AppInitializationState {
  const AppInitialized({required this.appConfiguration, final  List<ServiceRegistry> serviceRegistryList = const [], final  List<DashboardConfigSchema?>? dashboardConfigSchema}): _serviceRegistryList = serviceRegistryList,_dashboardConfigSchema = dashboardConfigSchema,super._();
  

 final  AppConfiguration appConfiguration;
 final  List<ServiceRegistry> _serviceRegistryList;
@JsonKey() List<ServiceRegistry> get serviceRegistryList {
  if (_serviceRegistryList is EqualUnmodifiableListView) return _serviceRegistryList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_serviceRegistryList);
}

 final  List<DashboardConfigSchema?>? _dashboardConfigSchema;
 List<DashboardConfigSchema?>? get dashboardConfigSchema {
  final value = _dashboardConfigSchema;
  if (value == null) return null;
  if (_dashboardConfigSchema is EqualUnmodifiableListView) return _dashboardConfigSchema;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AppInitializationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppInitializedCopyWith<AppInitialized> get copyWith => _$AppInitializedCopyWithImpl<AppInitialized>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInitialized&&(identical(other.appConfiguration, appConfiguration) || other.appConfiguration == appConfiguration)&&const DeepCollectionEquality().equals(other._serviceRegistryList, _serviceRegistryList)&&const DeepCollectionEquality().equals(other._dashboardConfigSchema, _dashboardConfigSchema));
}


@override
int get hashCode => Object.hash(runtimeType,appConfiguration,const DeepCollectionEquality().hash(_serviceRegistryList),const DeepCollectionEquality().hash(_dashboardConfigSchema));



}

/// @nodoc
abstract mixin class $AppInitializedCopyWith<$Res> implements $AppInitializationStateCopyWith<$Res> {
  factory $AppInitializedCopyWith(AppInitialized value, $Res Function(AppInitialized) _then) = _$AppInitializedCopyWithImpl;
@useResult
$Res call({
 AppConfiguration appConfiguration, List<ServiceRegistry> serviceRegistryList, List<DashboardConfigSchema?>? dashboardConfigSchema
});




}
/// @nodoc
class _$AppInitializedCopyWithImpl<$Res>
    implements $AppInitializedCopyWith<$Res> {
  _$AppInitializedCopyWithImpl(this._self, this._then);

  final AppInitialized _self;
  final $Res Function(AppInitialized) _then;

/// Create a copy of AppInitializationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appConfiguration = null,Object? serviceRegistryList = null,Object? dashboardConfigSchema = freezed,}) {
  return _then(AppInitialized(
appConfiguration: null == appConfiguration ? _self.appConfiguration : appConfiguration // ignore: cast_nullable_to_non_nullable
as AppConfiguration,serviceRegistryList: null == serviceRegistryList ? _self._serviceRegistryList : serviceRegistryList // ignore: cast_nullable_to_non_nullable
as List<ServiceRegistry>,dashboardConfigSchema: freezed == dashboardConfigSchema ? _self._dashboardConfigSchema : dashboardConfigSchema // ignore: cast_nullable_to_non_nullable
as List<DashboardConfigSchema?>?,
  ));
}


}

// dart format on

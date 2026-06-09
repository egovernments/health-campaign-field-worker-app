// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocalizationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalizationEvent()';
}


}

/// @nodoc
class $LocalizationEventCopyWith<$Res>  {
$LocalizationEventCopyWith(LocalizationEvent _, $Res Function(LocalizationEvent) __);
}


/// Adds pattern-matching-related methods to [LocalizationEvent].
extension LocalizationEventPatterns on LocalizationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnLoadLocalizationEvent value)?  onLoadLocalization,TResult Function( OnRemoteLoadLocalizationEvent value)?  onRemoteLoadLocalization,TResult Function( OnUpdateLocalizationIndexEvent value)?  onUpdateLocalizationIndex,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnLoadLocalizationEvent() when onLoadLocalization != null:
return onLoadLocalization(_that);case OnRemoteLoadLocalizationEvent() when onRemoteLoadLocalization != null:
return onRemoteLoadLocalization(_that);case OnUpdateLocalizationIndexEvent() when onUpdateLocalizationIndex != null:
return onUpdateLocalizationIndex(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnLoadLocalizationEvent value)  onLoadLocalization,required TResult Function( OnRemoteLoadLocalizationEvent value)  onRemoteLoadLocalization,required TResult Function( OnUpdateLocalizationIndexEvent value)  onUpdateLocalizationIndex,}){
final _that = this;
switch (_that) {
case OnLoadLocalizationEvent():
return onLoadLocalization(_that);case OnRemoteLoadLocalizationEvent():
return onRemoteLoadLocalization(_that);case OnUpdateLocalizationIndexEvent():
return onUpdateLocalizationIndex(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnLoadLocalizationEvent value)?  onLoadLocalization,TResult? Function( OnRemoteLoadLocalizationEvent value)?  onRemoteLoadLocalization,TResult? Function( OnUpdateLocalizationIndexEvent value)?  onUpdateLocalizationIndex,}){
final _that = this;
switch (_that) {
case OnLoadLocalizationEvent() when onLoadLocalization != null:
return onLoadLocalization(_that);case OnRemoteLoadLocalizationEvent() when onRemoteLoadLocalization != null:
return onRemoteLoadLocalization(_that);case OnUpdateLocalizationIndexEvent() when onUpdateLocalizationIndex != null:
return onUpdateLocalizationIndex(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String module,  String tenantId,  String locale,  String path)?  onLoadLocalization,TResult Function( String module,  String tenantId,  String locale,  String path)?  onRemoteLoadLocalization,TResult Function( int index,  String code)?  onUpdateLocalizationIndex,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnLoadLocalizationEvent() when onLoadLocalization != null:
return onLoadLocalization(_that.module,_that.tenantId,_that.locale,_that.path);case OnRemoteLoadLocalizationEvent() when onRemoteLoadLocalization != null:
return onRemoteLoadLocalization(_that.module,_that.tenantId,_that.locale,_that.path);case OnUpdateLocalizationIndexEvent() when onUpdateLocalizationIndex != null:
return onUpdateLocalizationIndex(_that.index,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String module,  String tenantId,  String locale,  String path)  onLoadLocalization,required TResult Function( String module,  String tenantId,  String locale,  String path)  onRemoteLoadLocalization,required TResult Function( int index,  String code)  onUpdateLocalizationIndex,}) {final _that = this;
switch (_that) {
case OnLoadLocalizationEvent():
return onLoadLocalization(_that.module,_that.tenantId,_that.locale,_that.path);case OnRemoteLoadLocalizationEvent():
return onRemoteLoadLocalization(_that.module,_that.tenantId,_that.locale,_that.path);case OnUpdateLocalizationIndexEvent():
return onUpdateLocalizationIndex(_that.index,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String module,  String tenantId,  String locale,  String path)?  onLoadLocalization,TResult? Function( String module,  String tenantId,  String locale,  String path)?  onRemoteLoadLocalization,TResult? Function( int index,  String code)?  onUpdateLocalizationIndex,}) {final _that = this;
switch (_that) {
case OnLoadLocalizationEvent() when onLoadLocalization != null:
return onLoadLocalization(_that.module,_that.tenantId,_that.locale,_that.path);case OnRemoteLoadLocalizationEvent() when onRemoteLoadLocalization != null:
return onRemoteLoadLocalization(_that.module,_that.tenantId,_that.locale,_that.path);case OnUpdateLocalizationIndexEvent() when onUpdateLocalizationIndex != null:
return onUpdateLocalizationIndex(_that.index,_that.code);case _:
  return null;

}
}

}

/// @nodoc


class OnLoadLocalizationEvent implements LocalizationEvent {
  const OnLoadLocalizationEvent({required this.module, required this.tenantId, required this.locale, required this.path});
  

 final  String module;
 final  String tenantId;
 final  String locale;
 final  String path;

/// Create a copy of LocalizationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnLoadLocalizationEventCopyWith<OnLoadLocalizationEvent> get copyWith => _$OnLoadLocalizationEventCopyWithImpl<OnLoadLocalizationEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnLoadLocalizationEvent&&(identical(other.module, module) || other.module == module)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,module,tenantId,locale,path);

@override
String toString() {
  return 'LocalizationEvent.onLoadLocalization(module: $module, tenantId: $tenantId, locale: $locale, path: $path)';
}


}

/// @nodoc
abstract mixin class $OnLoadLocalizationEventCopyWith<$Res> implements $LocalizationEventCopyWith<$Res> {
  factory $OnLoadLocalizationEventCopyWith(OnLoadLocalizationEvent value, $Res Function(OnLoadLocalizationEvent) _then) = _$OnLoadLocalizationEventCopyWithImpl;
@useResult
$Res call({
 String module, String tenantId, String locale, String path
});




}
/// @nodoc
class _$OnLoadLocalizationEventCopyWithImpl<$Res>
    implements $OnLoadLocalizationEventCopyWith<$Res> {
  _$OnLoadLocalizationEventCopyWithImpl(this._self, this._then);

  final OnLoadLocalizationEvent _self;
  final $Res Function(OnLoadLocalizationEvent) _then;

/// Create a copy of LocalizationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? module = null,Object? tenantId = null,Object? locale = null,Object? path = null,}) {
  return _then(OnLoadLocalizationEvent(
module: null == module ? _self.module : module // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnRemoteLoadLocalizationEvent implements LocalizationEvent {
  const OnRemoteLoadLocalizationEvent({required this.module, required this.tenantId, required this.locale, required this.path});
  

 final  String module;
 final  String tenantId;
 final  String locale;
 final  String path;

/// Create a copy of LocalizationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnRemoteLoadLocalizationEventCopyWith<OnRemoteLoadLocalizationEvent> get copyWith => _$OnRemoteLoadLocalizationEventCopyWithImpl<OnRemoteLoadLocalizationEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnRemoteLoadLocalizationEvent&&(identical(other.module, module) || other.module == module)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,module,tenantId,locale,path);

@override
String toString() {
  return 'LocalizationEvent.onRemoteLoadLocalization(module: $module, tenantId: $tenantId, locale: $locale, path: $path)';
}


}

/// @nodoc
abstract mixin class $OnRemoteLoadLocalizationEventCopyWith<$Res> implements $LocalizationEventCopyWith<$Res> {
  factory $OnRemoteLoadLocalizationEventCopyWith(OnRemoteLoadLocalizationEvent value, $Res Function(OnRemoteLoadLocalizationEvent) _then) = _$OnRemoteLoadLocalizationEventCopyWithImpl;
@useResult
$Res call({
 String module, String tenantId, String locale, String path
});




}
/// @nodoc
class _$OnRemoteLoadLocalizationEventCopyWithImpl<$Res>
    implements $OnRemoteLoadLocalizationEventCopyWith<$Res> {
  _$OnRemoteLoadLocalizationEventCopyWithImpl(this._self, this._then);

  final OnRemoteLoadLocalizationEvent _self;
  final $Res Function(OnRemoteLoadLocalizationEvent) _then;

/// Create a copy of LocalizationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? module = null,Object? tenantId = null,Object? locale = null,Object? path = null,}) {
  return _then(OnRemoteLoadLocalizationEvent(
module: null == module ? _self.module : module // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnUpdateLocalizationIndexEvent implements LocalizationEvent {
  const OnUpdateLocalizationIndexEvent({required this.index, required this.code});
  

 final  int index;
 final  String code;

/// Create a copy of LocalizationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnUpdateLocalizationIndexEventCopyWith<OnUpdateLocalizationIndexEvent> get copyWith => _$OnUpdateLocalizationIndexEventCopyWithImpl<OnUpdateLocalizationIndexEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnUpdateLocalizationIndexEvent&&(identical(other.index, index) || other.index == index)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,index,code);

@override
String toString() {
  return 'LocalizationEvent.onUpdateLocalizationIndex(index: $index, code: $code)';
}


}

/// @nodoc
abstract mixin class $OnUpdateLocalizationIndexEventCopyWith<$Res> implements $LocalizationEventCopyWith<$Res> {
  factory $OnUpdateLocalizationIndexEventCopyWith(OnUpdateLocalizationIndexEvent value, $Res Function(OnUpdateLocalizationIndexEvent) _then) = _$OnUpdateLocalizationIndexEventCopyWithImpl;
@useResult
$Res call({
 int index, String code
});




}
/// @nodoc
class _$OnUpdateLocalizationIndexEventCopyWithImpl<$Res>
    implements $OnUpdateLocalizationIndexEventCopyWith<$Res> {
  _$OnUpdateLocalizationIndexEventCopyWithImpl(this._self, this._then);

  final OnUpdateLocalizationIndexEvent _self;
  final $Res Function(OnUpdateLocalizationIndexEvent) _then;

/// Create a copy of LocalizationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,Object? code = null,}) {
  return _then(OnUpdateLocalizationIndexEvent(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$LocalizationState {

 bool get loading; int get index; bool get isLocalizationLoadCompleted; String? get retryModule;
/// Create a copy of LocalizationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalizationStateCopyWith<LocalizationState> get copyWith => _$LocalizationStateCopyWithImpl<LocalizationState>(this as LocalizationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizationState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.index, index) || other.index == index)&&(identical(other.isLocalizationLoadCompleted, isLocalizationLoadCompleted) || other.isLocalizationLoadCompleted == isLocalizationLoadCompleted)&&(identical(other.retryModule, retryModule) || other.retryModule == retryModule));
}


@override
int get hashCode => Object.hash(runtimeType,loading,index,isLocalizationLoadCompleted,retryModule);

@override
String toString() {
  return 'LocalizationState(loading: $loading, index: $index, isLocalizationLoadCompleted: $isLocalizationLoadCompleted, retryModule: $retryModule)';
}


}

/// @nodoc
abstract mixin class $LocalizationStateCopyWith<$Res>  {
  factory $LocalizationStateCopyWith(LocalizationState value, $Res Function(LocalizationState) _then) = _$LocalizationStateCopyWithImpl;
@useResult
$Res call({
 bool loading, int index, bool isLocalizationLoadCompleted, String? retryModule
});




}
/// @nodoc
class _$LocalizationStateCopyWithImpl<$Res>
    implements $LocalizationStateCopyWith<$Res> {
  _$LocalizationStateCopyWithImpl(this._self, this._then);

  final LocalizationState _self;
  final $Res Function(LocalizationState) _then;

/// Create a copy of LocalizationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? index = null,Object? isLocalizationLoadCompleted = null,Object? retryModule = freezed,}) {
  return _then(_self.copyWith(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,isLocalizationLoadCompleted: null == isLocalizationLoadCompleted ? _self.isLocalizationLoadCompleted : isLocalizationLoadCompleted // ignore: cast_nullable_to_non_nullable
as bool,retryModule: freezed == retryModule ? _self.retryModule : retryModule // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalizationState].
extension LocalizationStatePatterns on LocalizationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalizationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalizationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalizationState value)  $default,){
final _that = this;
switch (_that) {
case _LocalizationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalizationState value)?  $default,){
final _that = this;
switch (_that) {
case _LocalizationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loading,  int index,  bool isLocalizationLoadCompleted,  String? retryModule)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalizationState() when $default != null:
return $default(_that.loading,_that.index,_that.isLocalizationLoadCompleted,_that.retryModule);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loading,  int index,  bool isLocalizationLoadCompleted,  String? retryModule)  $default,) {final _that = this;
switch (_that) {
case _LocalizationState():
return $default(_that.loading,_that.index,_that.isLocalizationLoadCompleted,_that.retryModule);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loading,  int index,  bool isLocalizationLoadCompleted,  String? retryModule)?  $default,) {final _that = this;
switch (_that) {
case _LocalizationState() when $default != null:
return $default(_that.loading,_that.index,_that.isLocalizationLoadCompleted,_that.retryModule);case _:
  return null;

}
}

}

/// @nodoc


class _LocalizationState implements LocalizationState {
  const _LocalizationState({this.loading = false, this.index = 0, this.isLocalizationLoadCompleted = false, this.retryModule});
  

@override@JsonKey() final  bool loading;
@override@JsonKey() final  int index;
@override@JsonKey() final  bool isLocalizationLoadCompleted;
@override final  String? retryModule;

/// Create a copy of LocalizationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalizationStateCopyWith<_LocalizationState> get copyWith => __$LocalizationStateCopyWithImpl<_LocalizationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalizationState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.index, index) || other.index == index)&&(identical(other.isLocalizationLoadCompleted, isLocalizationLoadCompleted) || other.isLocalizationLoadCompleted == isLocalizationLoadCompleted)&&(identical(other.retryModule, retryModule) || other.retryModule == retryModule));
}


@override
int get hashCode => Object.hash(runtimeType,loading,index,isLocalizationLoadCompleted,retryModule);

@override
String toString() {
  return 'LocalizationState(loading: $loading, index: $index, isLocalizationLoadCompleted: $isLocalizationLoadCompleted, retryModule: $retryModule)';
}


}

/// @nodoc
abstract mixin class _$LocalizationStateCopyWith<$Res> implements $LocalizationStateCopyWith<$Res> {
  factory _$LocalizationStateCopyWith(_LocalizationState value, $Res Function(_LocalizationState) _then) = __$LocalizationStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, int index, bool isLocalizationLoadCompleted, String? retryModule
});




}
/// @nodoc
class __$LocalizationStateCopyWithImpl<$Res>
    implements _$LocalizationStateCopyWith<$Res> {
  __$LocalizationStateCopyWithImpl(this._self, this._then);

  final _LocalizationState _self;
  final $Res Function(_LocalizationState) _then;

/// Create a copy of LocalizationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? index = null,Object? isLocalizationLoadCompleted = null,Object? retryModule = freezed,}) {
  return _then(_LocalizationState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,isLocalizationLoadCompleted: null == isLocalizationLoadCompleted ? _self.isLocalizationLoadCompleted : isLocalizationLoadCompleted // ignore: cast_nullable_to_non_nullable
as bool,retryModule: freezed == retryModule ? _self.retryModule : retryModule // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'root_detection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RootDetectionEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RootDetectionEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RootDetectionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RootDetectionEvent()';
}


}

/// @nodoc
class $RootDetectionEventCopyWith<$Res>  {
$RootDetectionEventCopyWith(RootDetectionEvent _, $Res Function(RootDetectionEvent) __);
}


/// Adds pattern-matching-related methods to [RootDetectionEvent].
extension RootDetectionEventPatterns on RootDetectionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RootDetectionLoadedEvent value)?  onLoaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RootDetectionLoadedEvent() when onLoaded != null:
return onLoaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RootDetectionLoadedEvent value)  onLoaded,}){
final _that = this;
switch (_that) {
case RootDetectionLoadedEvent():
return onLoaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RootDetectionLoadedEvent value)?  onLoaded,}){
final _that = this;
switch (_that) {
case RootDetectionLoadedEvent() when onLoaded != null:
return onLoaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onLoaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RootDetectionLoadedEvent() when onLoaded != null:
return onLoaded();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onLoaded,}) {final _that = this;
switch (_that) {
case RootDetectionLoadedEvent():
return onLoaded();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onLoaded,}) {final _that = this;
switch (_that) {
case RootDetectionLoadedEvent() when onLoaded != null:
return onLoaded();case _:
  return null;

}
}

}

/// @nodoc


class RootDetectionLoadedEvent with DiagnosticableTreeMixin implements RootDetectionEvent {
  const RootDetectionLoadedEvent();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RootDetectionEvent.onLoaded'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RootDetectionLoadedEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RootDetectionEvent.onLoaded()';
}


}




/// @nodoc
mixin _$RootDetectionState implements DiagnosticableTreeMixin {

 bool? get isRooted;
/// Create a copy of RootDetectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RootDetectionStateCopyWith<RootDetectionState> get copyWith => _$RootDetectionStateCopyWithImpl<RootDetectionState>(this as RootDetectionState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RootDetectionState'))
    ..add(DiagnosticsProperty('isRooted', isRooted));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RootDetectionState&&(identical(other.isRooted, isRooted) || other.isRooted == isRooted));
}


@override
int get hashCode => Object.hash(runtimeType,isRooted);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RootDetectionState(isRooted: $isRooted)';
}


}

/// @nodoc
abstract mixin class $RootDetectionStateCopyWith<$Res>  {
  factory $RootDetectionStateCopyWith(RootDetectionState value, $Res Function(RootDetectionState) _then) = _$RootDetectionStateCopyWithImpl;
@useResult
$Res call({
 bool? isRooted
});




}
/// @nodoc
class _$RootDetectionStateCopyWithImpl<$Res>
    implements $RootDetectionStateCopyWith<$Res> {
  _$RootDetectionStateCopyWithImpl(this._self, this._then);

  final RootDetectionState _self;
  final $Res Function(RootDetectionState) _then;

/// Create a copy of RootDetectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isRooted = freezed,}) {
  return _then(_self.copyWith(
isRooted: freezed == isRooted ? _self.isRooted : isRooted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [RootDetectionState].
extension RootDetectionStatePatterns on RootDetectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RootDetectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RootDetectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RootDetectionState value)  $default,){
final _that = this;
switch (_that) {
case _RootDetectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RootDetectionState value)?  $default,){
final _that = this;
switch (_that) {
case _RootDetectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? isRooted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RootDetectionState() when $default != null:
return $default(_that.isRooted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? isRooted)  $default,) {final _that = this;
switch (_that) {
case _RootDetectionState():
return $default(_that.isRooted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? isRooted)?  $default,) {final _that = this;
switch (_that) {
case _RootDetectionState() when $default != null:
return $default(_that.isRooted);case _:
  return null;

}
}

}

/// @nodoc


class _RootDetectionState with DiagnosticableTreeMixin implements RootDetectionState {
  const _RootDetectionState({this.isRooted});
  

@override final  bool? isRooted;

/// Create a copy of RootDetectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RootDetectionStateCopyWith<_RootDetectionState> get copyWith => __$RootDetectionStateCopyWithImpl<_RootDetectionState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RootDetectionState'))
    ..add(DiagnosticsProperty('isRooted', isRooted));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RootDetectionState&&(identical(other.isRooted, isRooted) || other.isRooted == isRooted));
}


@override
int get hashCode => Object.hash(runtimeType,isRooted);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RootDetectionState(isRooted: $isRooted)';
}


}

/// @nodoc
abstract mixin class _$RootDetectionStateCopyWith<$Res> implements $RootDetectionStateCopyWith<$Res> {
  factory _$RootDetectionStateCopyWith(_RootDetectionState value, $Res Function(_RootDetectionState) _then) = __$RootDetectionStateCopyWithImpl;
@override @useResult
$Res call({
 bool? isRooted
});




}
/// @nodoc
class __$RootDetectionStateCopyWithImpl<$Res>
    implements _$RootDetectionStateCopyWith<$Res> {
  __$RootDetectionStateCopyWithImpl(this._self, this._then);

  final _RootDetectionState _self;
  final $Res Function(_RootDetectionState) _then;

/// Create a copy of RootDetectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isRooted = freezed,}) {
  return _then(_RootDetectionState(
isRooted: freezed == isRooted ? _self.isRooted : isRooted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on

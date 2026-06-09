// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ErrorEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ErrorEvent()';
}


}

/// @nodoc
class $ErrorEventCopyWith<$Res>  {
$ErrorEventCopyWith(ErrorEvent _, $Res Function(ErrorEvent) __);
}


/// Adds pattern-matching-related methods to [ErrorEvent].
extension ErrorEventPatterns on ErrorEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SetErrorEvent value)?  setError,TResult Function( ClearErrorEvent value)?  clearError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SetErrorEvent() when setError != null:
return setError(_that);case ClearErrorEvent() when clearError != null:
return clearError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SetErrorEvent value)  setError,required TResult Function( ClearErrorEvent value)  clearError,}){
final _that = this;
switch (_that) {
case SetErrorEvent():
return setError(_that);case ClearErrorEvent():
return clearError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SetErrorEvent value)?  setError,TResult? Function( ClearErrorEvent value)?  clearError,}){
final _that = this;
switch (_that) {
case SetErrorEvent() when setError != null:
return setError(_that);case ClearErrorEvent() when clearError != null:
return clearError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String errorMessage)?  setError,TResult Function()?  clearError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SetErrorEvent() when setError != null:
return setError(_that.errorMessage);case ClearErrorEvent() when clearError != null:
return clearError();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String errorMessage)  setError,required TResult Function()  clearError,}) {final _that = this;
switch (_that) {
case SetErrorEvent():
return setError(_that.errorMessage);case ClearErrorEvent():
return clearError();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String errorMessage)?  setError,TResult? Function()?  clearError,}) {final _that = this;
switch (_that) {
case SetErrorEvent() when setError != null:
return setError(_that.errorMessage);case ClearErrorEvent() when clearError != null:
return clearError();case _:
  return null;

}
}

}

/// @nodoc


class SetErrorEvent implements ErrorEvent {
  const SetErrorEvent({required this.errorMessage});
  

 final  String errorMessage;

/// Create a copy of ErrorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetErrorEventCopyWith<SetErrorEvent> get copyWith => _$SetErrorEventCopyWithImpl<SetErrorEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetErrorEvent&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'ErrorEvent.setError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SetErrorEventCopyWith<$Res> implements $ErrorEventCopyWith<$Res> {
  factory $SetErrorEventCopyWith(SetErrorEvent value, $Res Function(SetErrorEvent) _then) = _$SetErrorEventCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$SetErrorEventCopyWithImpl<$Res>
    implements $SetErrorEventCopyWith<$Res> {
  _$SetErrorEventCopyWithImpl(this._self, this._then);

  final SetErrorEvent _self;
  final $Res Function(SetErrorEvent) _then;

/// Create a copy of ErrorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(SetErrorEvent(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearErrorEvent implements ErrorEvent {
  const ClearErrorEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearErrorEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ErrorEvent.clearError()';
}


}




/// @nodoc
mixin _$ErrorState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ErrorState()';
}


}

/// @nodoc
class $ErrorStateCopyWith<$Res>  {
$ErrorStateCopyWith(ErrorState _, $Res Function(ErrorState) __);
}


/// Adds pattern-matching-related methods to [ErrorState].
extension ErrorStatePatterns on ErrorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NoErrorState value)?  noError,TResult Function( HasErrorState value)?  hasError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NoErrorState() when noError != null:
return noError(_that);case HasErrorState() when hasError != null:
return hasError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NoErrorState value)  noError,required TResult Function( HasErrorState value)  hasError,}){
final _that = this;
switch (_that) {
case NoErrorState():
return noError(_that);case HasErrorState():
return hasError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NoErrorState value)?  noError,TResult? Function( HasErrorState value)?  hasError,}){
final _that = this;
switch (_that) {
case NoErrorState() when noError != null:
return noError(_that);case HasErrorState() when hasError != null:
return hasError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  noError,TResult Function( String errorMessage)?  hasError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NoErrorState() when noError != null:
return noError();case HasErrorState() when hasError != null:
return hasError(_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  noError,required TResult Function( String errorMessage)  hasError,}) {final _that = this;
switch (_that) {
case NoErrorState():
return noError();case HasErrorState():
return hasError(_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  noError,TResult? Function( String errorMessage)?  hasError,}) {final _that = this;
switch (_that) {
case NoErrorState() when noError != null:
return noError();case HasErrorState() when hasError != null:
return hasError(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class NoErrorState implements ErrorState {
  const NoErrorState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoErrorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ErrorState.noError()';
}


}




/// @nodoc


class HasErrorState implements ErrorState {
  const HasErrorState(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HasErrorStateCopyWith<HasErrorState> get copyWith => _$HasErrorStateCopyWithImpl<HasErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HasErrorState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'ErrorState.hasError(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HasErrorStateCopyWith<$Res> implements $ErrorStateCopyWith<$Res> {
  factory $HasErrorStateCopyWith(HasErrorState value, $Res Function(HasErrorState) _then) = _$HasErrorStateCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$HasErrorStateCopyWithImpl<$Res>
    implements $HasErrorStateCopyWith<$Res> {
  _$HasErrorStateCopyWithImpl(this._self, this._then);

  final HasErrorState _self;
  final $Res Function(HasErrorState) _then;

/// Create a copy of ErrorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(HasErrorState(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

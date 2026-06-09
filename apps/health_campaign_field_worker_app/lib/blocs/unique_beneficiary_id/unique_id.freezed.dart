// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unique_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UniqueIdEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UniqueIdEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UniqueIdEvent()';
}


}

/// @nodoc
class $UniqueIdEventCopyWith<$Res>  {
$UniqueIdEventCopyWith(UniqueIdEvent _, $Res Function(UniqueIdEvent) __);
}


/// Adds pattern-matching-related methods to [UniqueIdEvent].
extension UniqueIdEventPatterns on UniqueIdEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UniqueIdCountEvent value)?  fetchIdCount,TResult Function( FetchUniqueIdsEvent value)?  fetchUniqueIdsFromServer,TResult Function( FetchAUniqueIdEvent value)?  fetchAUniqueId,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UniqueIdCountEvent() when fetchIdCount != null:
return fetchIdCount(_that);case FetchUniqueIdsEvent() when fetchUniqueIdsFromServer != null:
return fetchUniqueIdsFromServer(_that);case FetchAUniqueIdEvent() when fetchAUniqueId != null:
return fetchAUniqueId(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UniqueIdCountEvent value)  fetchIdCount,required TResult Function( FetchUniqueIdsEvent value)  fetchUniqueIdsFromServer,required TResult Function( FetchAUniqueIdEvent value)  fetchAUniqueId,}){
final _that = this;
switch (_that) {
case UniqueIdCountEvent():
return fetchIdCount(_that);case FetchUniqueIdsEvent():
return fetchUniqueIdsFromServer(_that);case FetchAUniqueIdEvent():
return fetchAUniqueId(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UniqueIdCountEvent value)?  fetchIdCount,TResult? Function( FetchUniqueIdsEvent value)?  fetchUniqueIdsFromServer,TResult? Function( FetchAUniqueIdEvent value)?  fetchAUniqueId,}){
final _that = this;
switch (_that) {
case UniqueIdCountEvent() when fetchIdCount != null:
return fetchIdCount(_that);case FetchUniqueIdsEvent() when fetchUniqueIdsFromServer != null:
return fetchUniqueIdsFromServer(_that);case FetchAUniqueIdEvent() when fetchAUniqueId != null:
return fetchAUniqueId(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchIdCount,TResult Function( bool? reFetch)?  fetchUniqueIdsFromServer,TResult Function()?  fetchAUniqueId,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UniqueIdCountEvent() when fetchIdCount != null:
return fetchIdCount();case FetchUniqueIdsEvent() when fetchUniqueIdsFromServer != null:
return fetchUniqueIdsFromServer(_that.reFetch);case FetchAUniqueIdEvent() when fetchAUniqueId != null:
return fetchAUniqueId();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchIdCount,required TResult Function( bool? reFetch)  fetchUniqueIdsFromServer,required TResult Function()  fetchAUniqueId,}) {final _that = this;
switch (_that) {
case UniqueIdCountEvent():
return fetchIdCount();case FetchUniqueIdsEvent():
return fetchUniqueIdsFromServer(_that.reFetch);case FetchAUniqueIdEvent():
return fetchAUniqueId();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchIdCount,TResult? Function( bool? reFetch)?  fetchUniqueIdsFromServer,TResult? Function()?  fetchAUniqueId,}) {final _that = this;
switch (_that) {
case UniqueIdCountEvent() when fetchIdCount != null:
return fetchIdCount();case FetchUniqueIdsEvent() when fetchUniqueIdsFromServer != null:
return fetchUniqueIdsFromServer(_that.reFetch);case FetchAUniqueIdEvent() when fetchAUniqueId != null:
return fetchAUniqueId();case _:
  return null;

}
}

}

/// @nodoc


class UniqueIdCountEvent implements UniqueIdEvent {
  const UniqueIdCountEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UniqueIdCountEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UniqueIdEvent.fetchIdCount()';
}


}




/// @nodoc


class FetchUniqueIdsEvent implements UniqueIdEvent {
  const FetchUniqueIdsEvent({this.reFetch});
  

 final  bool? reFetch;

/// Create a copy of UniqueIdEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchUniqueIdsEventCopyWith<FetchUniqueIdsEvent> get copyWith => _$FetchUniqueIdsEventCopyWithImpl<FetchUniqueIdsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchUniqueIdsEvent&&(identical(other.reFetch, reFetch) || other.reFetch == reFetch));
}


@override
int get hashCode => Object.hash(runtimeType,reFetch);

@override
String toString() {
  return 'UniqueIdEvent.fetchUniqueIdsFromServer(reFetch: $reFetch)';
}


}

/// @nodoc
abstract mixin class $FetchUniqueIdsEventCopyWith<$Res> implements $UniqueIdEventCopyWith<$Res> {
  factory $FetchUniqueIdsEventCopyWith(FetchUniqueIdsEvent value, $Res Function(FetchUniqueIdsEvent) _then) = _$FetchUniqueIdsEventCopyWithImpl;
@useResult
$Res call({
 bool? reFetch
});




}
/// @nodoc
class _$FetchUniqueIdsEventCopyWithImpl<$Res>
    implements $FetchUniqueIdsEventCopyWith<$Res> {
  _$FetchUniqueIdsEventCopyWithImpl(this._self, this._then);

  final FetchUniqueIdsEvent _self;
  final $Res Function(FetchUniqueIdsEvent) _then;

/// Create a copy of UniqueIdEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reFetch = freezed,}) {
  return _then(FetchUniqueIdsEvent(
reFetch: freezed == reFetch ? _self.reFetch : reFetch // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class FetchAUniqueIdEvent implements UniqueIdEvent {
  const FetchAUniqueIdEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchAUniqueIdEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UniqueIdEvent.fetchAUniqueId()';
}


}




/// @nodoc
mixin _$UniqueIdState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UniqueIdState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UniqueIdState()';
}


}

/// @nodoc
class $UniqueIdStateCopyWith<$Res>  {
$UniqueIdStateCopyWith(UniqueIdState _, $Res Function(UniqueIdState) __);
}


/// Adds pattern-matching-related methods to [UniqueIdState].
extension UniqueIdStatePatterns on UniqueIdState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingState value)?  loading,TResult Function( FetchingState value)?  fetching,TResult Function( FetchedIdCountState value)?  idCount,TResult Function( FetchedUniqueIdsState value)?  ids,TResult Function( FailedState value)?  failed,TResult Function( FetchedUniqueIdState value)?  aUniqueId,TResult Function( NoInternetState value)?  noInternet,TResult Function( LimitExceeded value)?  limitExceeded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading(_that);case FetchingState() when fetching != null:
return fetching(_that);case FetchedIdCountState() when idCount != null:
return idCount(_that);case FetchedUniqueIdsState() when ids != null:
return ids(_that);case FailedState() when failed != null:
return failed(_that);case FetchedUniqueIdState() when aUniqueId != null:
return aUniqueId(_that);case NoInternetState() when noInternet != null:
return noInternet(_that);case LimitExceeded() when limitExceeded != null:
return limitExceeded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingState value)  loading,required TResult Function( FetchingState value)  fetching,required TResult Function( FetchedIdCountState value)  idCount,required TResult Function( FetchedUniqueIdsState value)  ids,required TResult Function( FailedState value)  failed,required TResult Function( FetchedUniqueIdState value)  aUniqueId,required TResult Function( NoInternetState value)  noInternet,required TResult Function( LimitExceeded value)  limitExceeded,}){
final _that = this;
switch (_that) {
case LoadingState():
return loading(_that);case FetchingState():
return fetching(_that);case FetchedIdCountState():
return idCount(_that);case FetchedUniqueIdsState():
return ids(_that);case FailedState():
return failed(_that);case FetchedUniqueIdState():
return aUniqueId(_that);case NoInternetState():
return noInternet(_that);case LimitExceeded():
return limitExceeded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingState value)?  loading,TResult? Function( FetchingState value)?  fetching,TResult? Function( FetchedIdCountState value)?  idCount,TResult? Function( FetchedUniqueIdsState value)?  ids,TResult? Function( FailedState value)?  failed,TResult? Function( FetchedUniqueIdState value)?  aUniqueId,TResult? Function( NoInternetState value)?  noInternet,TResult? Function( LimitExceeded value)?  limitExceeded,}){
final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading(_that);case FetchingState() when fetching != null:
return fetching(_that);case FetchedIdCountState() when idCount != null:
return idCount(_that);case FetchedUniqueIdsState() when ids != null:
return ids(_that);case FailedState() when failed != null:
return failed(_that);case FetchedUniqueIdState() when aUniqueId != null:
return aUniqueId(_that);case NoInternetState() when noInternet != null:
return noInternet(_that);case LimitExceeded() when limitExceeded != null:
return limitExceeded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( int progress,  int totalCount)?  fetching,TResult Function( int count,  int totalCount)?  idCount,TResult Function( List<UniqueIdPoolModel> ids)?  ids,TResult Function( String? error)?  failed,TResult Function( UniqueIdPoolModel aUniqueId)?  aUniqueId,TResult Function()?  noInternet,TResult Function( String message)?  limitExceeded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading();case FetchingState() when fetching != null:
return fetching(_that.progress,_that.totalCount);case FetchedIdCountState() when idCount != null:
return idCount(_that.count,_that.totalCount);case FetchedUniqueIdsState() when ids != null:
return ids(_that.ids);case FailedState() when failed != null:
return failed(_that.error);case FetchedUniqueIdState() when aUniqueId != null:
return aUniqueId(_that.aUniqueId);case NoInternetState() when noInternet != null:
return noInternet();case LimitExceeded() when limitExceeded != null:
return limitExceeded(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( int progress,  int totalCount)  fetching,required TResult Function( int count,  int totalCount)  idCount,required TResult Function( List<UniqueIdPoolModel> ids)  ids,required TResult Function( String? error)  failed,required TResult Function( UniqueIdPoolModel aUniqueId)  aUniqueId,required TResult Function()  noInternet,required TResult Function( String message)  limitExceeded,}) {final _that = this;
switch (_that) {
case LoadingState():
return loading();case FetchingState():
return fetching(_that.progress,_that.totalCount);case FetchedIdCountState():
return idCount(_that.count,_that.totalCount);case FetchedUniqueIdsState():
return ids(_that.ids);case FailedState():
return failed(_that.error);case FetchedUniqueIdState():
return aUniqueId(_that.aUniqueId);case NoInternetState():
return noInternet();case LimitExceeded():
return limitExceeded(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( int progress,  int totalCount)?  fetching,TResult? Function( int count,  int totalCount)?  idCount,TResult? Function( List<UniqueIdPoolModel> ids)?  ids,TResult? Function( String? error)?  failed,TResult? Function( UniqueIdPoolModel aUniqueId)?  aUniqueId,TResult? Function()?  noInternet,TResult? Function( String message)?  limitExceeded,}) {final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading();case FetchingState() when fetching != null:
return fetching(_that.progress,_that.totalCount);case FetchedIdCountState() when idCount != null:
return idCount(_that.count,_that.totalCount);case FetchedUniqueIdsState() when ids != null:
return ids(_that.ids);case FailedState() when failed != null:
return failed(_that.error);case FetchedUniqueIdState() when aUniqueId != null:
return aUniqueId(_that.aUniqueId);case NoInternetState() when noInternet != null:
return noInternet();case LimitExceeded() when limitExceeded != null:
return limitExceeded(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LoadingState implements UniqueIdState {
  const LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UniqueIdState.loading()';
}


}




/// @nodoc


class FetchingState implements UniqueIdState {
  const FetchingState(this.progress, this.totalCount);
  

 final  int progress;
 final  int totalCount;

/// Create a copy of UniqueIdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchingStateCopyWith<FetchingState> get copyWith => _$FetchingStateCopyWithImpl<FetchingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchingState&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,progress,totalCount);

@override
String toString() {
  return 'UniqueIdState.fetching(progress: $progress, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $FetchingStateCopyWith<$Res> implements $UniqueIdStateCopyWith<$Res> {
  factory $FetchingStateCopyWith(FetchingState value, $Res Function(FetchingState) _then) = _$FetchingStateCopyWithImpl;
@useResult
$Res call({
 int progress, int totalCount
});




}
/// @nodoc
class _$FetchingStateCopyWithImpl<$Res>
    implements $FetchingStateCopyWith<$Res> {
  _$FetchingStateCopyWithImpl(this._self, this._then);

  final FetchingState _self;
  final $Res Function(FetchingState) _then;

/// Create a copy of UniqueIdState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,Object? totalCount = null,}) {
  return _then(FetchingState(
null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class FetchedIdCountState implements UniqueIdState {
  const FetchedIdCountState(this.count, this.totalCount);
  

 final  int count;
 final  int totalCount;

/// Create a copy of UniqueIdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchedIdCountStateCopyWith<FetchedIdCountState> get copyWith => _$FetchedIdCountStateCopyWithImpl<FetchedIdCountState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchedIdCountState&&(identical(other.count, count) || other.count == count)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,count,totalCount);

@override
String toString() {
  return 'UniqueIdState.idCount(count: $count, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $FetchedIdCountStateCopyWith<$Res> implements $UniqueIdStateCopyWith<$Res> {
  factory $FetchedIdCountStateCopyWith(FetchedIdCountState value, $Res Function(FetchedIdCountState) _then) = _$FetchedIdCountStateCopyWithImpl;
@useResult
$Res call({
 int count, int totalCount
});




}
/// @nodoc
class _$FetchedIdCountStateCopyWithImpl<$Res>
    implements $FetchedIdCountStateCopyWith<$Res> {
  _$FetchedIdCountStateCopyWithImpl(this._self, this._then);

  final FetchedIdCountState _self;
  final $Res Function(FetchedIdCountState) _then;

/// Create a copy of UniqueIdState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? count = null,Object? totalCount = null,}) {
  return _then(FetchedIdCountState(
null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class FetchedUniqueIdsState implements UniqueIdState {
  const FetchedUniqueIdsState(final  List<UniqueIdPoolModel> ids): _ids = ids;
  

 final  List<UniqueIdPoolModel> _ids;
 List<UniqueIdPoolModel> get ids {
  if (_ids is EqualUnmodifiableListView) return _ids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ids);
}


/// Create a copy of UniqueIdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchedUniqueIdsStateCopyWith<FetchedUniqueIdsState> get copyWith => _$FetchedUniqueIdsStateCopyWithImpl<FetchedUniqueIdsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchedUniqueIdsState&&const DeepCollectionEquality().equals(other._ids, _ids));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ids));

@override
String toString() {
  return 'UniqueIdState.ids(ids: $ids)';
}


}

/// @nodoc
abstract mixin class $FetchedUniqueIdsStateCopyWith<$Res> implements $UniqueIdStateCopyWith<$Res> {
  factory $FetchedUniqueIdsStateCopyWith(FetchedUniqueIdsState value, $Res Function(FetchedUniqueIdsState) _then) = _$FetchedUniqueIdsStateCopyWithImpl;
@useResult
$Res call({
 List<UniqueIdPoolModel> ids
});




}
/// @nodoc
class _$FetchedUniqueIdsStateCopyWithImpl<$Res>
    implements $FetchedUniqueIdsStateCopyWith<$Res> {
  _$FetchedUniqueIdsStateCopyWithImpl(this._self, this._then);

  final FetchedUniqueIdsState _self;
  final $Res Function(FetchedUniqueIdsState) _then;

/// Create a copy of UniqueIdState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ids = null,}) {
  return _then(FetchedUniqueIdsState(
null == ids ? _self._ids : ids // ignore: cast_nullable_to_non_nullable
as List<UniqueIdPoolModel>,
  ));
}


}

/// @nodoc


class FailedState implements UniqueIdState {
  const FailedState(this.error);
  

 final  String? error;

/// Create a copy of UniqueIdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailedStateCopyWith<FailedState> get copyWith => _$FailedStateCopyWithImpl<FailedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailedState&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'UniqueIdState.failed(error: $error)';
}


}

/// @nodoc
abstract mixin class $FailedStateCopyWith<$Res> implements $UniqueIdStateCopyWith<$Res> {
  factory $FailedStateCopyWith(FailedState value, $Res Function(FailedState) _then) = _$FailedStateCopyWithImpl;
@useResult
$Res call({
 String? error
});




}
/// @nodoc
class _$FailedStateCopyWithImpl<$Res>
    implements $FailedStateCopyWith<$Res> {
  _$FailedStateCopyWithImpl(this._self, this._then);

  final FailedState _self;
  final $Res Function(FailedState) _then;

/// Create a copy of UniqueIdState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(FailedState(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class FetchedUniqueIdState implements UniqueIdState {
  const FetchedUniqueIdState(this.aUniqueId);
  

 final  UniqueIdPoolModel aUniqueId;

/// Create a copy of UniqueIdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchedUniqueIdStateCopyWith<FetchedUniqueIdState> get copyWith => _$FetchedUniqueIdStateCopyWithImpl<FetchedUniqueIdState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchedUniqueIdState&&(identical(other.aUniqueId, aUniqueId) || other.aUniqueId == aUniqueId));
}


@override
int get hashCode => Object.hash(runtimeType,aUniqueId);

@override
String toString() {
  return 'UniqueIdState.aUniqueId(aUniqueId: $aUniqueId)';
}


}

/// @nodoc
abstract mixin class $FetchedUniqueIdStateCopyWith<$Res> implements $UniqueIdStateCopyWith<$Res> {
  factory $FetchedUniqueIdStateCopyWith(FetchedUniqueIdState value, $Res Function(FetchedUniqueIdState) _then) = _$FetchedUniqueIdStateCopyWithImpl;
@useResult
$Res call({
 UniqueIdPoolModel aUniqueId
});




}
/// @nodoc
class _$FetchedUniqueIdStateCopyWithImpl<$Res>
    implements $FetchedUniqueIdStateCopyWith<$Res> {
  _$FetchedUniqueIdStateCopyWithImpl(this._self, this._then);

  final FetchedUniqueIdState _self;
  final $Res Function(FetchedUniqueIdState) _then;

/// Create a copy of UniqueIdState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? aUniqueId = null,}) {
  return _then(FetchedUniqueIdState(
null == aUniqueId ? _self.aUniqueId : aUniqueId // ignore: cast_nullable_to_non_nullable
as UniqueIdPoolModel,
  ));
}


}

/// @nodoc


class NoInternetState implements UniqueIdState {
  const NoInternetState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoInternetState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UniqueIdState.noInternet()';
}


}




/// @nodoc


class LimitExceeded implements UniqueIdState {
  const LimitExceeded(this.message);
  

 final  String message;

/// Create a copy of UniqueIdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LimitExceededCopyWith<LimitExceeded> get copyWith => _$LimitExceededCopyWithImpl<LimitExceeded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LimitExceeded&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UniqueIdState.limitExceeded(message: $message)';
}


}

/// @nodoc
abstract mixin class $LimitExceededCopyWith<$Res> implements $UniqueIdStateCopyWith<$Res> {
  factory $LimitExceededCopyWith(LimitExceeded value, $Res Function(LimitExceeded) _then) = _$LimitExceededCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LimitExceededCopyWithImpl<$Res>
    implements $LimitExceededCopyWith<$Res> {
  _$LimitExceededCopyWithImpl(this._self, this._then);

  final LimitExceeded _self;
  final $Res Function(LimitExceeded) _then;

/// Create a copy of UniqueIdState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LimitExceeded(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

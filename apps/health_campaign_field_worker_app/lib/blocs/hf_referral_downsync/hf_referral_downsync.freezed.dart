// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hf_referral_downsync.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HFReferralDownSyncEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HFReferralDownSyncEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HFReferralDownSyncEvent()';
}


}

/// @nodoc
class $HFReferralDownSyncEventCopyWith<$Res>  {
$HFReferralDownSyncEventCopyWith(HFReferralDownSyncEvent _, $Res Function(HFReferralDownSyncEvent) __);
}


/// Adds pattern-matching-related methods to [HFReferralDownSyncEvent].
extension HFReferralDownSyncEventPatterns on HFReferralDownSyncEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HFReferralDownSyncStartEvent value)?  start,TResult Function( HFReferralDownSyncDownloadEvent value)?  download,TResult Function( HFReferralDownSyncResetStateEvent value)?  resetState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HFReferralDownSyncStartEvent() when start != null:
return start(_that);case HFReferralDownSyncDownloadEvent() when download != null:
return download(_that);case HFReferralDownSyncResetStateEvent() when resetState != null:
return resetState(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HFReferralDownSyncStartEvent value)  start,required TResult Function( HFReferralDownSyncDownloadEvent value)  download,required TResult Function( HFReferralDownSyncResetStateEvent value)  resetState,}){
final _that = this;
switch (_that) {
case HFReferralDownSyncStartEvent():
return start(_that);case HFReferralDownSyncDownloadEvent():
return download(_that);case HFReferralDownSyncResetStateEvent():
return resetState(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HFReferralDownSyncStartEvent value)?  start,TResult? Function( HFReferralDownSyncDownloadEvent value)?  download,TResult? Function( HFReferralDownSyncResetStateEvent value)?  resetState,}){
final _that = this;
switch (_that) {
case HFReferralDownSyncStartEvent() when start != null:
return start(_that);case HFReferralDownSyncDownloadEvent() when download != null:
return download(_that);case HFReferralDownSyncResetStateEvent() when resetState != null:
return resetState(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String projectId,  List<AppConfiguration> appConfiguration)?  start,TResult Function( String projectId,  List<AppConfiguration> appConfiguration,  int totalCount,  int serverTotalCount)?  download,TResult Function()?  resetState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HFReferralDownSyncStartEvent() when start != null:
return start(_that.projectId,_that.appConfiguration);case HFReferralDownSyncDownloadEvent() when download != null:
return download(_that.projectId,_that.appConfiguration,_that.totalCount,_that.serverTotalCount);case HFReferralDownSyncResetStateEvent() when resetState != null:
return resetState();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String projectId,  List<AppConfiguration> appConfiguration)  start,required TResult Function( String projectId,  List<AppConfiguration> appConfiguration,  int totalCount,  int serverTotalCount)  download,required TResult Function()  resetState,}) {final _that = this;
switch (_that) {
case HFReferralDownSyncStartEvent():
return start(_that.projectId,_that.appConfiguration);case HFReferralDownSyncDownloadEvent():
return download(_that.projectId,_that.appConfiguration,_that.totalCount,_that.serverTotalCount);case HFReferralDownSyncResetStateEvent():
return resetState();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String projectId,  List<AppConfiguration> appConfiguration)?  start,TResult? Function( String projectId,  List<AppConfiguration> appConfiguration,  int totalCount,  int serverTotalCount)?  download,TResult? Function()?  resetState,}) {final _that = this;
switch (_that) {
case HFReferralDownSyncStartEvent() when start != null:
return start(_that.projectId,_that.appConfiguration);case HFReferralDownSyncDownloadEvent() when download != null:
return download(_that.projectId,_that.appConfiguration,_that.totalCount,_that.serverTotalCount);case HFReferralDownSyncResetStateEvent() when resetState != null:
return resetState();case _:
  return null;

}
}

}

/// @nodoc


class HFReferralDownSyncStartEvent implements HFReferralDownSyncEvent {
  const HFReferralDownSyncStartEvent({required this.projectId, required final  List<AppConfiguration> appConfiguration}): _appConfiguration = appConfiguration;
  

 final  String projectId;
 final  List<AppConfiguration> _appConfiguration;
 List<AppConfiguration> get appConfiguration {
  if (_appConfiguration is EqualUnmodifiableListView) return _appConfiguration;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appConfiguration);
}


/// Create a copy of HFReferralDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HFReferralDownSyncStartEventCopyWith<HFReferralDownSyncStartEvent> get copyWith => _$HFReferralDownSyncStartEventCopyWithImpl<HFReferralDownSyncStartEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HFReferralDownSyncStartEvent&&(identical(other.projectId, projectId) || other.projectId == projectId)&&const DeepCollectionEquality().equals(other._appConfiguration, _appConfiguration));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,const DeepCollectionEquality().hash(_appConfiguration));

@override
String toString() {
  return 'HFReferralDownSyncEvent.start(projectId: $projectId, appConfiguration: $appConfiguration)';
}


}

/// @nodoc
abstract mixin class $HFReferralDownSyncStartEventCopyWith<$Res> implements $HFReferralDownSyncEventCopyWith<$Res> {
  factory $HFReferralDownSyncStartEventCopyWith(HFReferralDownSyncStartEvent value, $Res Function(HFReferralDownSyncStartEvent) _then) = _$HFReferralDownSyncStartEventCopyWithImpl;
@useResult
$Res call({
 String projectId, List<AppConfiguration> appConfiguration
});




}
/// @nodoc
class _$HFReferralDownSyncStartEventCopyWithImpl<$Res>
    implements $HFReferralDownSyncStartEventCopyWith<$Res> {
  _$HFReferralDownSyncStartEventCopyWithImpl(this._self, this._then);

  final HFReferralDownSyncStartEvent _self;
  final $Res Function(HFReferralDownSyncStartEvent) _then;

/// Create a copy of HFReferralDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? appConfiguration = null,}) {
  return _then(HFReferralDownSyncStartEvent(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,appConfiguration: null == appConfiguration ? _self._appConfiguration : appConfiguration // ignore: cast_nullable_to_non_nullable
as List<AppConfiguration>,
  ));
}


}

/// @nodoc


class HFReferralDownSyncDownloadEvent implements HFReferralDownSyncEvent {
  const HFReferralDownSyncDownloadEvent({required this.projectId, required final  List<AppConfiguration> appConfiguration, required this.totalCount, required this.serverTotalCount}): _appConfiguration = appConfiguration;
  

 final  String projectId;
 final  List<AppConfiguration> _appConfiguration;
 List<AppConfiguration> get appConfiguration {
  if (_appConfiguration is EqualUnmodifiableListView) return _appConfiguration;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appConfiguration);
}

 final  int totalCount;
 final  int serverTotalCount;

/// Create a copy of HFReferralDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HFReferralDownSyncDownloadEventCopyWith<HFReferralDownSyncDownloadEvent> get copyWith => _$HFReferralDownSyncDownloadEventCopyWithImpl<HFReferralDownSyncDownloadEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HFReferralDownSyncDownloadEvent&&(identical(other.projectId, projectId) || other.projectId == projectId)&&const DeepCollectionEquality().equals(other._appConfiguration, _appConfiguration)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.serverTotalCount, serverTotalCount) || other.serverTotalCount == serverTotalCount));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,const DeepCollectionEquality().hash(_appConfiguration),totalCount,serverTotalCount);

@override
String toString() {
  return 'HFReferralDownSyncEvent.download(projectId: $projectId, appConfiguration: $appConfiguration, totalCount: $totalCount, serverTotalCount: $serverTotalCount)';
}


}

/// @nodoc
abstract mixin class $HFReferralDownSyncDownloadEventCopyWith<$Res> implements $HFReferralDownSyncEventCopyWith<$Res> {
  factory $HFReferralDownSyncDownloadEventCopyWith(HFReferralDownSyncDownloadEvent value, $Res Function(HFReferralDownSyncDownloadEvent) _then) = _$HFReferralDownSyncDownloadEventCopyWithImpl;
@useResult
$Res call({
 String projectId, List<AppConfiguration> appConfiguration, int totalCount, int serverTotalCount
});




}
/// @nodoc
class _$HFReferralDownSyncDownloadEventCopyWithImpl<$Res>
    implements $HFReferralDownSyncDownloadEventCopyWith<$Res> {
  _$HFReferralDownSyncDownloadEventCopyWithImpl(this._self, this._then);

  final HFReferralDownSyncDownloadEvent _self;
  final $Res Function(HFReferralDownSyncDownloadEvent) _then;

/// Create a copy of HFReferralDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? appConfiguration = null,Object? totalCount = null,Object? serverTotalCount = null,}) {
  return _then(HFReferralDownSyncDownloadEvent(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,appConfiguration: null == appConfiguration ? _self._appConfiguration : appConfiguration // ignore: cast_nullable_to_non_nullable
as List<AppConfiguration>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,serverTotalCount: null == serverTotalCount ? _self.serverTotalCount : serverTotalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class HFReferralDownSyncResetStateEvent implements HFReferralDownSyncEvent {
  const HFReferralDownSyncResetStateEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HFReferralDownSyncResetStateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HFReferralDownSyncEvent.resetState()';
}


}




/// @nodoc
mixin _$HFReferralDownSyncState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HFReferralDownSyncState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HFReferralDownSyncState()';
}


}

/// @nodoc
class $HFReferralDownSyncStateCopyWith<$Res>  {
$HFReferralDownSyncStateCopyWith(HFReferralDownSyncState _, $Res Function(HFReferralDownSyncState) __);
}


/// Adds pattern-matching-related methods to [HFReferralDownSyncState].
extension HFReferralDownSyncStatePatterns on HFReferralDownSyncState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _HFReferralDownSyncLoadingState value)?  loading,TResult Function( _HFReferralDownSyncDataFoundState value)?  dataFound,TResult Function( _HFReferralDownSyncInProgressState value)?  inProgress,TResult Function( _HFReferralDownSyncSuccessState value)?  success,TResult Function( _HFReferralDownSyncResetState value)?  resetState,TResult Function( _HFReferralDownSyncFailureState value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HFReferralDownSyncLoadingState() when loading != null:
return loading(_that);case _HFReferralDownSyncDataFoundState() when dataFound != null:
return dataFound(_that);case _HFReferralDownSyncInProgressState() when inProgress != null:
return inProgress(_that);case _HFReferralDownSyncSuccessState() when success != null:
return success(_that);case _HFReferralDownSyncResetState() when resetState != null:
return resetState(_that);case _HFReferralDownSyncFailureState() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _HFReferralDownSyncLoadingState value)  loading,required TResult Function( _HFReferralDownSyncDataFoundState value)  dataFound,required TResult Function( _HFReferralDownSyncInProgressState value)  inProgress,required TResult Function( _HFReferralDownSyncSuccessState value)  success,required TResult Function( _HFReferralDownSyncResetState value)  resetState,required TResult Function( _HFReferralDownSyncFailureState value)  failed,}){
final _that = this;
switch (_that) {
case _HFReferralDownSyncLoadingState():
return loading(_that);case _HFReferralDownSyncDataFoundState():
return dataFound(_that);case _HFReferralDownSyncInProgressState():
return inProgress(_that);case _HFReferralDownSyncSuccessState():
return success(_that);case _HFReferralDownSyncResetState():
return resetState(_that);case _HFReferralDownSyncFailureState():
return failed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _HFReferralDownSyncLoadingState value)?  loading,TResult? Function( _HFReferralDownSyncDataFoundState value)?  dataFound,TResult? Function( _HFReferralDownSyncInProgressState value)?  inProgress,TResult? Function( _HFReferralDownSyncSuccessState value)?  success,TResult? Function( _HFReferralDownSyncResetState value)?  resetState,TResult? Function( _HFReferralDownSyncFailureState value)?  failed,}){
final _that = this;
switch (_that) {
case _HFReferralDownSyncLoadingState() when loading != null:
return loading(_that);case _HFReferralDownSyncDataFoundState() when dataFound != null:
return dataFound(_that);case _HFReferralDownSyncInProgressState() when inProgress != null:
return inProgress(_that);case _HFReferralDownSyncSuccessState() when success != null:
return success(_that);case _HFReferralDownSyncResetState() when resetState != null:
return resetState(_that);case _HFReferralDownSyncFailureState() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( int newCount,  int serverTotalCount)?  dataFound,TResult Function( int syncedCount,  int totalCount)?  inProgress,TResult Function( int syncedCount,  int totalCount)?  success,TResult Function()?  resetState,TResult Function()?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HFReferralDownSyncLoadingState() when loading != null:
return loading();case _HFReferralDownSyncDataFoundState() when dataFound != null:
return dataFound(_that.newCount,_that.serverTotalCount);case _HFReferralDownSyncInProgressState() when inProgress != null:
return inProgress(_that.syncedCount,_that.totalCount);case _HFReferralDownSyncSuccessState() when success != null:
return success(_that.syncedCount,_that.totalCount);case _HFReferralDownSyncResetState() when resetState != null:
return resetState();case _HFReferralDownSyncFailureState() when failed != null:
return failed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( int newCount,  int serverTotalCount)  dataFound,required TResult Function( int syncedCount,  int totalCount)  inProgress,required TResult Function( int syncedCount,  int totalCount)  success,required TResult Function()  resetState,required TResult Function()  failed,}) {final _that = this;
switch (_that) {
case _HFReferralDownSyncLoadingState():
return loading();case _HFReferralDownSyncDataFoundState():
return dataFound(_that.newCount,_that.serverTotalCount);case _HFReferralDownSyncInProgressState():
return inProgress(_that.syncedCount,_that.totalCount);case _HFReferralDownSyncSuccessState():
return success(_that.syncedCount,_that.totalCount);case _HFReferralDownSyncResetState():
return resetState();case _HFReferralDownSyncFailureState():
return failed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( int newCount,  int serverTotalCount)?  dataFound,TResult? Function( int syncedCount,  int totalCount)?  inProgress,TResult? Function( int syncedCount,  int totalCount)?  success,TResult? Function()?  resetState,TResult? Function()?  failed,}) {final _that = this;
switch (_that) {
case _HFReferralDownSyncLoadingState() when loading != null:
return loading();case _HFReferralDownSyncDataFoundState() when dataFound != null:
return dataFound(_that.newCount,_that.serverTotalCount);case _HFReferralDownSyncInProgressState() when inProgress != null:
return inProgress(_that.syncedCount,_that.totalCount);case _HFReferralDownSyncSuccessState() when success != null:
return success(_that.syncedCount,_that.totalCount);case _HFReferralDownSyncResetState() when resetState != null:
return resetState();case _HFReferralDownSyncFailureState() when failed != null:
return failed();case _:
  return null;

}
}

}

/// @nodoc


class _HFReferralDownSyncLoadingState extends HFReferralDownSyncState {
  const _HFReferralDownSyncLoadingState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HFReferralDownSyncLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HFReferralDownSyncState.loading()';
}


}




/// @nodoc


class _HFReferralDownSyncDataFoundState extends HFReferralDownSyncState {
  const _HFReferralDownSyncDataFoundState(this.newCount, this.serverTotalCount): super._();
  

 final  int newCount;
 final  int serverTotalCount;

/// Create a copy of HFReferralDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HFReferralDownSyncDataFoundStateCopyWith<_HFReferralDownSyncDataFoundState> get copyWith => __$HFReferralDownSyncDataFoundStateCopyWithImpl<_HFReferralDownSyncDataFoundState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HFReferralDownSyncDataFoundState&&(identical(other.newCount, newCount) || other.newCount == newCount)&&(identical(other.serverTotalCount, serverTotalCount) || other.serverTotalCount == serverTotalCount));
}


@override
int get hashCode => Object.hash(runtimeType,newCount,serverTotalCount);

@override
String toString() {
  return 'HFReferralDownSyncState.dataFound(newCount: $newCount, serverTotalCount: $serverTotalCount)';
}


}

/// @nodoc
abstract mixin class _$HFReferralDownSyncDataFoundStateCopyWith<$Res> implements $HFReferralDownSyncStateCopyWith<$Res> {
  factory _$HFReferralDownSyncDataFoundStateCopyWith(_HFReferralDownSyncDataFoundState value, $Res Function(_HFReferralDownSyncDataFoundState) _then) = __$HFReferralDownSyncDataFoundStateCopyWithImpl;
@useResult
$Res call({
 int newCount, int serverTotalCount
});




}
/// @nodoc
class __$HFReferralDownSyncDataFoundStateCopyWithImpl<$Res>
    implements _$HFReferralDownSyncDataFoundStateCopyWith<$Res> {
  __$HFReferralDownSyncDataFoundStateCopyWithImpl(this._self, this._then);

  final _HFReferralDownSyncDataFoundState _self;
  final $Res Function(_HFReferralDownSyncDataFoundState) _then;

/// Create a copy of HFReferralDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newCount = null,Object? serverTotalCount = null,}) {
  return _then(_HFReferralDownSyncDataFoundState(
null == newCount ? _self.newCount : newCount // ignore: cast_nullable_to_non_nullable
as int,null == serverTotalCount ? _self.serverTotalCount : serverTotalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _HFReferralDownSyncInProgressState extends HFReferralDownSyncState {
  const _HFReferralDownSyncInProgressState(this.syncedCount, this.totalCount): super._();
  

 final  int syncedCount;
 final  int totalCount;

/// Create a copy of HFReferralDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HFReferralDownSyncInProgressStateCopyWith<_HFReferralDownSyncInProgressState> get copyWith => __$HFReferralDownSyncInProgressStateCopyWithImpl<_HFReferralDownSyncInProgressState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HFReferralDownSyncInProgressState&&(identical(other.syncedCount, syncedCount) || other.syncedCount == syncedCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,syncedCount,totalCount);

@override
String toString() {
  return 'HFReferralDownSyncState.inProgress(syncedCount: $syncedCount, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$HFReferralDownSyncInProgressStateCopyWith<$Res> implements $HFReferralDownSyncStateCopyWith<$Res> {
  factory _$HFReferralDownSyncInProgressStateCopyWith(_HFReferralDownSyncInProgressState value, $Res Function(_HFReferralDownSyncInProgressState) _then) = __$HFReferralDownSyncInProgressStateCopyWithImpl;
@useResult
$Res call({
 int syncedCount, int totalCount
});




}
/// @nodoc
class __$HFReferralDownSyncInProgressStateCopyWithImpl<$Res>
    implements _$HFReferralDownSyncInProgressStateCopyWith<$Res> {
  __$HFReferralDownSyncInProgressStateCopyWithImpl(this._self, this._then);

  final _HFReferralDownSyncInProgressState _self;
  final $Res Function(_HFReferralDownSyncInProgressState) _then;

/// Create a copy of HFReferralDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? syncedCount = null,Object? totalCount = null,}) {
  return _then(_HFReferralDownSyncInProgressState(
null == syncedCount ? _self.syncedCount : syncedCount // ignore: cast_nullable_to_non_nullable
as int,null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _HFReferralDownSyncSuccessState extends HFReferralDownSyncState {
  const _HFReferralDownSyncSuccessState(this.syncedCount, this.totalCount): super._();
  

 final  int syncedCount;
 final  int totalCount;

/// Create a copy of HFReferralDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HFReferralDownSyncSuccessStateCopyWith<_HFReferralDownSyncSuccessState> get copyWith => __$HFReferralDownSyncSuccessStateCopyWithImpl<_HFReferralDownSyncSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HFReferralDownSyncSuccessState&&(identical(other.syncedCount, syncedCount) || other.syncedCount == syncedCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,syncedCount,totalCount);

@override
String toString() {
  return 'HFReferralDownSyncState.success(syncedCount: $syncedCount, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$HFReferralDownSyncSuccessStateCopyWith<$Res> implements $HFReferralDownSyncStateCopyWith<$Res> {
  factory _$HFReferralDownSyncSuccessStateCopyWith(_HFReferralDownSyncSuccessState value, $Res Function(_HFReferralDownSyncSuccessState) _then) = __$HFReferralDownSyncSuccessStateCopyWithImpl;
@useResult
$Res call({
 int syncedCount, int totalCount
});




}
/// @nodoc
class __$HFReferralDownSyncSuccessStateCopyWithImpl<$Res>
    implements _$HFReferralDownSyncSuccessStateCopyWith<$Res> {
  __$HFReferralDownSyncSuccessStateCopyWithImpl(this._self, this._then);

  final _HFReferralDownSyncSuccessState _self;
  final $Res Function(_HFReferralDownSyncSuccessState) _then;

/// Create a copy of HFReferralDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? syncedCount = null,Object? totalCount = null,}) {
  return _then(_HFReferralDownSyncSuccessState(
null == syncedCount ? _self.syncedCount : syncedCount // ignore: cast_nullable_to_non_nullable
as int,null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _HFReferralDownSyncResetState extends HFReferralDownSyncState {
  const _HFReferralDownSyncResetState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HFReferralDownSyncResetState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HFReferralDownSyncState.resetState()';
}


}




/// @nodoc


class _HFReferralDownSyncFailureState extends HFReferralDownSyncState {
  const _HFReferralDownSyncFailureState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HFReferralDownSyncFailureState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HFReferralDownSyncState.failed()';
}


}




// dart format on

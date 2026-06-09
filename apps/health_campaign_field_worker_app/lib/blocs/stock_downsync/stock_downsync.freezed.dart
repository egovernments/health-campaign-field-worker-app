// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_downsync.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StockDownSyncEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StockDownSyncEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockDownSyncEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StockDownSyncEvent()';
}


}

/// @nodoc
class $StockDownSyncEventCopyWith<$Res>  {
$StockDownSyncEventCopyWith(StockDownSyncEvent _, $Res Function(StockDownSyncEvent) __);
}


/// Adds pattern-matching-related methods to [StockDownSyncEvent].
extension StockDownSyncEventPatterns on StockDownSyncEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StockDownSyncGetBatchSizeEvent value)?  getBatchSize,TResult Function( StockDownSyncCheckTotalCountEvent value)?  checkTotalCount,TResult Function( StockDownSyncDownloadEvent value)?  downloadStock,TResult Function( StockDownSyncResetStateEvent value)?  resetState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StockDownSyncGetBatchSizeEvent() when getBatchSize != null:
return getBatchSize(_that);case StockDownSyncCheckTotalCountEvent() when checkTotalCount != null:
return checkTotalCount(_that);case StockDownSyncDownloadEvent() when downloadStock != null:
return downloadStock(_that);case StockDownSyncResetStateEvent() when resetState != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StockDownSyncGetBatchSizeEvent value)  getBatchSize,required TResult Function( StockDownSyncCheckTotalCountEvent value)  checkTotalCount,required TResult Function( StockDownSyncDownloadEvent value)  downloadStock,required TResult Function( StockDownSyncResetStateEvent value)  resetState,}){
final _that = this;
switch (_that) {
case StockDownSyncGetBatchSizeEvent():
return getBatchSize(_that);case StockDownSyncCheckTotalCountEvent():
return checkTotalCount(_that);case StockDownSyncDownloadEvent():
return downloadStock(_that);case StockDownSyncResetStateEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StockDownSyncGetBatchSizeEvent value)?  getBatchSize,TResult? Function( StockDownSyncCheckTotalCountEvent value)?  checkTotalCount,TResult? Function( StockDownSyncDownloadEvent value)?  downloadStock,TResult? Function( StockDownSyncResetStateEvent value)?  resetState,}){
final _that = this;
switch (_that) {
case StockDownSyncGetBatchSizeEvent() when getBatchSize != null:
return getBatchSize(_that);case StockDownSyncCheckTotalCountEvent() when checkTotalCount != null:
return checkTotalCount(_that);case StockDownSyncDownloadEvent() when downloadStock != null:
return downloadStock(_that);case StockDownSyncResetStateEvent() when resetState != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<AppConfiguration> appConfiguration,  ProjectModel projectModel)?  getBatchSize,TResult Function( ProjectModel projectModel,  int batchSize)?  checkTotalCount,TResult Function( ProjectModel projectModel,  int batchSize,  int initialServerCount)?  downloadStock,TResult Function()?  resetState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case StockDownSyncGetBatchSizeEvent() when getBatchSize != null:
return getBatchSize(_that.appConfiguration,_that.projectModel);case StockDownSyncCheckTotalCountEvent() when checkTotalCount != null:
return checkTotalCount(_that.projectModel,_that.batchSize);case StockDownSyncDownloadEvent() when downloadStock != null:
return downloadStock(_that.projectModel,_that.batchSize,_that.initialServerCount);case StockDownSyncResetStateEvent() when resetState != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<AppConfiguration> appConfiguration,  ProjectModel projectModel)  getBatchSize,required TResult Function( ProjectModel projectModel,  int batchSize)  checkTotalCount,required TResult Function( ProjectModel projectModel,  int batchSize,  int initialServerCount)  downloadStock,required TResult Function()  resetState,}) {final _that = this;
switch (_that) {
case StockDownSyncGetBatchSizeEvent():
return getBatchSize(_that.appConfiguration,_that.projectModel);case StockDownSyncCheckTotalCountEvent():
return checkTotalCount(_that.projectModel,_that.batchSize);case StockDownSyncDownloadEvent():
return downloadStock(_that.projectModel,_that.batchSize,_that.initialServerCount);case StockDownSyncResetStateEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<AppConfiguration> appConfiguration,  ProjectModel projectModel)?  getBatchSize,TResult? Function( ProjectModel projectModel,  int batchSize)?  checkTotalCount,TResult? Function( ProjectModel projectModel,  int batchSize,  int initialServerCount)?  downloadStock,TResult? Function()?  resetState,}) {final _that = this;
switch (_that) {
case StockDownSyncGetBatchSizeEvent() when getBatchSize != null:
return getBatchSize(_that.appConfiguration,_that.projectModel);case StockDownSyncCheckTotalCountEvent() when checkTotalCount != null:
return checkTotalCount(_that.projectModel,_that.batchSize);case StockDownSyncDownloadEvent() when downloadStock != null:
return downloadStock(_that.projectModel,_that.batchSize,_that.initialServerCount);case StockDownSyncResetStateEvent() when resetState != null:
return resetState();case _:
  return null;

}
}

}

/// @nodoc


class StockDownSyncGetBatchSizeEvent with DiagnosticableTreeMixin implements StockDownSyncEvent {
  const StockDownSyncGetBatchSizeEvent({required final  List<AppConfiguration> appConfiguration, required this.projectModel}): _appConfiguration = appConfiguration;
  

 final  List<AppConfiguration> _appConfiguration;
 List<AppConfiguration> get appConfiguration {
  if (_appConfiguration is EqualUnmodifiableListView) return _appConfiguration;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appConfiguration);
}

 final  ProjectModel projectModel;

/// Create a copy of StockDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockDownSyncGetBatchSizeEventCopyWith<StockDownSyncGetBatchSizeEvent> get copyWith => _$StockDownSyncGetBatchSizeEventCopyWithImpl<StockDownSyncGetBatchSizeEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StockDownSyncEvent.getBatchSize'))
    ..add(DiagnosticsProperty('appConfiguration', appConfiguration))..add(DiagnosticsProperty('projectModel', projectModel));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockDownSyncGetBatchSizeEvent&&const DeepCollectionEquality().equals(other._appConfiguration, _appConfiguration)&&(identical(other.projectModel, projectModel) || other.projectModel == projectModel));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_appConfiguration),projectModel);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StockDownSyncEvent.getBatchSize(appConfiguration: $appConfiguration, projectModel: $projectModel)';
}


}

/// @nodoc
abstract mixin class $StockDownSyncGetBatchSizeEventCopyWith<$Res> implements $StockDownSyncEventCopyWith<$Res> {
  factory $StockDownSyncGetBatchSizeEventCopyWith(StockDownSyncGetBatchSizeEvent value, $Res Function(StockDownSyncGetBatchSizeEvent) _then) = _$StockDownSyncGetBatchSizeEventCopyWithImpl;
@useResult
$Res call({
 List<AppConfiguration> appConfiguration, ProjectModel projectModel
});




}
/// @nodoc
class _$StockDownSyncGetBatchSizeEventCopyWithImpl<$Res>
    implements $StockDownSyncGetBatchSizeEventCopyWith<$Res> {
  _$StockDownSyncGetBatchSizeEventCopyWithImpl(this._self, this._then);

  final StockDownSyncGetBatchSizeEvent _self;
  final $Res Function(StockDownSyncGetBatchSizeEvent) _then;

/// Create a copy of StockDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appConfiguration = null,Object? projectModel = null,}) {
  return _then(StockDownSyncGetBatchSizeEvent(
appConfiguration: null == appConfiguration ? _self._appConfiguration : appConfiguration // ignore: cast_nullable_to_non_nullable
as List<AppConfiguration>,projectModel: null == projectModel ? _self.projectModel : projectModel // ignore: cast_nullable_to_non_nullable
as ProjectModel,
  ));
}


}

/// @nodoc


class StockDownSyncCheckTotalCountEvent with DiagnosticableTreeMixin implements StockDownSyncEvent {
  const StockDownSyncCheckTotalCountEvent({required this.projectModel, required this.batchSize});
  

 final  ProjectModel projectModel;
 final  int batchSize;

/// Create a copy of StockDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockDownSyncCheckTotalCountEventCopyWith<StockDownSyncCheckTotalCountEvent> get copyWith => _$StockDownSyncCheckTotalCountEventCopyWithImpl<StockDownSyncCheckTotalCountEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StockDownSyncEvent.checkTotalCount'))
    ..add(DiagnosticsProperty('projectModel', projectModel))..add(DiagnosticsProperty('batchSize', batchSize));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockDownSyncCheckTotalCountEvent&&(identical(other.projectModel, projectModel) || other.projectModel == projectModel)&&(identical(other.batchSize, batchSize) || other.batchSize == batchSize));
}


@override
int get hashCode => Object.hash(runtimeType,projectModel,batchSize);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StockDownSyncEvent.checkTotalCount(projectModel: $projectModel, batchSize: $batchSize)';
}


}

/// @nodoc
abstract mixin class $StockDownSyncCheckTotalCountEventCopyWith<$Res> implements $StockDownSyncEventCopyWith<$Res> {
  factory $StockDownSyncCheckTotalCountEventCopyWith(StockDownSyncCheckTotalCountEvent value, $Res Function(StockDownSyncCheckTotalCountEvent) _then) = _$StockDownSyncCheckTotalCountEventCopyWithImpl;
@useResult
$Res call({
 ProjectModel projectModel, int batchSize
});




}
/// @nodoc
class _$StockDownSyncCheckTotalCountEventCopyWithImpl<$Res>
    implements $StockDownSyncCheckTotalCountEventCopyWith<$Res> {
  _$StockDownSyncCheckTotalCountEventCopyWithImpl(this._self, this._then);

  final StockDownSyncCheckTotalCountEvent _self;
  final $Res Function(StockDownSyncCheckTotalCountEvent) _then;

/// Create a copy of StockDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectModel = null,Object? batchSize = null,}) {
  return _then(StockDownSyncCheckTotalCountEvent(
projectModel: null == projectModel ? _self.projectModel : projectModel // ignore: cast_nullable_to_non_nullable
as ProjectModel,batchSize: null == batchSize ? _self.batchSize : batchSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class StockDownSyncDownloadEvent with DiagnosticableTreeMixin implements StockDownSyncEvent {
  const StockDownSyncDownloadEvent({required this.projectModel, required this.batchSize, required this.initialServerCount});
  

 final  ProjectModel projectModel;
 final  int batchSize;
 final  int initialServerCount;

/// Create a copy of StockDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockDownSyncDownloadEventCopyWith<StockDownSyncDownloadEvent> get copyWith => _$StockDownSyncDownloadEventCopyWithImpl<StockDownSyncDownloadEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StockDownSyncEvent.downloadStock'))
    ..add(DiagnosticsProperty('projectModel', projectModel))..add(DiagnosticsProperty('batchSize', batchSize))..add(DiagnosticsProperty('initialServerCount', initialServerCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockDownSyncDownloadEvent&&(identical(other.projectModel, projectModel) || other.projectModel == projectModel)&&(identical(other.batchSize, batchSize) || other.batchSize == batchSize)&&(identical(other.initialServerCount, initialServerCount) || other.initialServerCount == initialServerCount));
}


@override
int get hashCode => Object.hash(runtimeType,projectModel,batchSize,initialServerCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StockDownSyncEvent.downloadStock(projectModel: $projectModel, batchSize: $batchSize, initialServerCount: $initialServerCount)';
}


}

/// @nodoc
abstract mixin class $StockDownSyncDownloadEventCopyWith<$Res> implements $StockDownSyncEventCopyWith<$Res> {
  factory $StockDownSyncDownloadEventCopyWith(StockDownSyncDownloadEvent value, $Res Function(StockDownSyncDownloadEvent) _then) = _$StockDownSyncDownloadEventCopyWithImpl;
@useResult
$Res call({
 ProjectModel projectModel, int batchSize, int initialServerCount
});




}
/// @nodoc
class _$StockDownSyncDownloadEventCopyWithImpl<$Res>
    implements $StockDownSyncDownloadEventCopyWith<$Res> {
  _$StockDownSyncDownloadEventCopyWithImpl(this._self, this._then);

  final StockDownSyncDownloadEvent _self;
  final $Res Function(StockDownSyncDownloadEvent) _then;

/// Create a copy of StockDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectModel = null,Object? batchSize = null,Object? initialServerCount = null,}) {
  return _then(StockDownSyncDownloadEvent(
projectModel: null == projectModel ? _self.projectModel : projectModel // ignore: cast_nullable_to_non_nullable
as ProjectModel,batchSize: null == batchSize ? _self.batchSize : batchSize // ignore: cast_nullable_to_non_nullable
as int,initialServerCount: null == initialServerCount ? _self.initialServerCount : initialServerCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class StockDownSyncResetStateEvent with DiagnosticableTreeMixin implements StockDownSyncEvent {
  const StockDownSyncResetStateEvent();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StockDownSyncEvent.resetState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockDownSyncResetStateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StockDownSyncEvent.resetState()';
}


}




/// @nodoc
mixin _$StockDownSyncState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StockDownSyncState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockDownSyncState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StockDownSyncState()';
}


}

/// @nodoc
class $StockDownSyncStateCopyWith<$Res>  {
$StockDownSyncStateCopyWith(StockDownSyncState _, $Res Function(StockDownSyncState) __);
}


/// Adds pattern-matching-related methods to [StockDownSyncState].
extension StockDownSyncStatePatterns on StockDownSyncState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StockDownSyncLoadingState value)?  loading,TResult Function( _StockDownSyncGetBatchSizeState value)?  getBatchSize,TResult Function( _StockDownSyncDataFoundState value)?  dataFound,TResult Function( _StockDownSyncInProgressState value)?  inProgress,TResult Function( _StockDownSyncSuccessState value)?  success,TResult Function( _StockDownSyncFailureState value)?  failed,TResult Function( _StockDownSyncInsufficientStorageState value)?  insufficientStorage,TResult Function( _StockDownSyncCountCheckFailedState value)?  totalCountCheckFailed,TResult Function( _StockDownSyncResetState value)?  resetState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockDownSyncLoadingState() when loading != null:
return loading(_that);case _StockDownSyncGetBatchSizeState() when getBatchSize != null:
return getBatchSize(_that);case _StockDownSyncDataFoundState() when dataFound != null:
return dataFound(_that);case _StockDownSyncInProgressState() when inProgress != null:
return inProgress(_that);case _StockDownSyncSuccessState() when success != null:
return success(_that);case _StockDownSyncFailureState() when failed != null:
return failed(_that);case _StockDownSyncInsufficientStorageState() when insufficientStorage != null:
return insufficientStorage(_that);case _StockDownSyncCountCheckFailedState() when totalCountCheckFailed != null:
return totalCountCheckFailed(_that);case _StockDownSyncResetState() when resetState != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StockDownSyncLoadingState value)  loading,required TResult Function( _StockDownSyncGetBatchSizeState value)  getBatchSize,required TResult Function( _StockDownSyncDataFoundState value)  dataFound,required TResult Function( _StockDownSyncInProgressState value)  inProgress,required TResult Function( _StockDownSyncSuccessState value)  success,required TResult Function( _StockDownSyncFailureState value)  failed,required TResult Function( _StockDownSyncInsufficientStorageState value)  insufficientStorage,required TResult Function( _StockDownSyncCountCheckFailedState value)  totalCountCheckFailed,required TResult Function( _StockDownSyncResetState value)  resetState,}){
final _that = this;
switch (_that) {
case _StockDownSyncLoadingState():
return loading(_that);case _StockDownSyncGetBatchSizeState():
return getBatchSize(_that);case _StockDownSyncDataFoundState():
return dataFound(_that);case _StockDownSyncInProgressState():
return inProgress(_that);case _StockDownSyncSuccessState():
return success(_that);case _StockDownSyncFailureState():
return failed(_that);case _StockDownSyncInsufficientStorageState():
return insufficientStorage(_that);case _StockDownSyncCountCheckFailedState():
return totalCountCheckFailed(_that);case _StockDownSyncResetState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StockDownSyncLoadingState value)?  loading,TResult? Function( _StockDownSyncGetBatchSizeState value)?  getBatchSize,TResult? Function( _StockDownSyncDataFoundState value)?  dataFound,TResult? Function( _StockDownSyncInProgressState value)?  inProgress,TResult? Function( _StockDownSyncSuccessState value)?  success,TResult? Function( _StockDownSyncFailureState value)?  failed,TResult? Function( _StockDownSyncInsufficientStorageState value)?  insufficientStorage,TResult? Function( _StockDownSyncCountCheckFailedState value)?  totalCountCheckFailed,TResult? Function( _StockDownSyncResetState value)?  resetState,}){
final _that = this;
switch (_that) {
case _StockDownSyncLoadingState() when loading != null:
return loading(_that);case _StockDownSyncGetBatchSizeState() when getBatchSize != null:
return getBatchSize(_that);case _StockDownSyncDataFoundState() when dataFound != null:
return dataFound(_that);case _StockDownSyncInProgressState() when inProgress != null:
return inProgress(_that);case _StockDownSyncSuccessState() when success != null:
return success(_that);case _StockDownSyncFailureState() when failed != null:
return failed(_that);case _StockDownSyncInsufficientStorageState() when insufficientStorage != null:
return insufficientStorage(_that);case _StockDownSyncCountCheckFailedState() when totalCountCheckFailed != null:
return totalCountCheckFailed(_that);case _StockDownSyncResetState() when resetState != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isPop)?  loading,TResult Function( int batchSize,  ProjectModel projectModel)?  getBatchSize,TResult Function( int initialServerCount,  int batchSize,  int offset,  int? lastSyncedTime)?  dataFound,TResult Function( int syncedCount,  int totalCount)?  inProgress,TResult Function( int syncedCount,  int totalCount)?  success,TResult Function()?  failed,TResult Function()?  insufficientStorage,TResult Function()?  totalCountCheckFailed,TResult Function()?  resetState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockDownSyncLoadingState() when loading != null:
return loading(_that.isPop);case _StockDownSyncGetBatchSizeState() when getBatchSize != null:
return getBatchSize(_that.batchSize,_that.projectModel);case _StockDownSyncDataFoundState() when dataFound != null:
return dataFound(_that.initialServerCount,_that.batchSize,_that.offset,_that.lastSyncedTime);case _StockDownSyncInProgressState() when inProgress != null:
return inProgress(_that.syncedCount,_that.totalCount);case _StockDownSyncSuccessState() when success != null:
return success(_that.syncedCount,_that.totalCount);case _StockDownSyncFailureState() when failed != null:
return failed();case _StockDownSyncInsufficientStorageState() when insufficientStorage != null:
return insufficientStorage();case _StockDownSyncCountCheckFailedState() when totalCountCheckFailed != null:
return totalCountCheckFailed();case _StockDownSyncResetState() when resetState != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isPop)  loading,required TResult Function( int batchSize,  ProjectModel projectModel)  getBatchSize,required TResult Function( int initialServerCount,  int batchSize,  int offset,  int? lastSyncedTime)  dataFound,required TResult Function( int syncedCount,  int totalCount)  inProgress,required TResult Function( int syncedCount,  int totalCount)  success,required TResult Function()  failed,required TResult Function()  insufficientStorage,required TResult Function()  totalCountCheckFailed,required TResult Function()  resetState,}) {final _that = this;
switch (_that) {
case _StockDownSyncLoadingState():
return loading(_that.isPop);case _StockDownSyncGetBatchSizeState():
return getBatchSize(_that.batchSize,_that.projectModel);case _StockDownSyncDataFoundState():
return dataFound(_that.initialServerCount,_that.batchSize,_that.offset,_that.lastSyncedTime);case _StockDownSyncInProgressState():
return inProgress(_that.syncedCount,_that.totalCount);case _StockDownSyncSuccessState():
return success(_that.syncedCount,_that.totalCount);case _StockDownSyncFailureState():
return failed();case _StockDownSyncInsufficientStorageState():
return insufficientStorage();case _StockDownSyncCountCheckFailedState():
return totalCountCheckFailed();case _StockDownSyncResetState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isPop)?  loading,TResult? Function( int batchSize,  ProjectModel projectModel)?  getBatchSize,TResult? Function( int initialServerCount,  int batchSize,  int offset,  int? lastSyncedTime)?  dataFound,TResult? Function( int syncedCount,  int totalCount)?  inProgress,TResult? Function( int syncedCount,  int totalCount)?  success,TResult? Function()?  failed,TResult? Function()?  insufficientStorage,TResult? Function()?  totalCountCheckFailed,TResult? Function()?  resetState,}) {final _that = this;
switch (_that) {
case _StockDownSyncLoadingState() when loading != null:
return loading(_that.isPop);case _StockDownSyncGetBatchSizeState() when getBatchSize != null:
return getBatchSize(_that.batchSize,_that.projectModel);case _StockDownSyncDataFoundState() when dataFound != null:
return dataFound(_that.initialServerCount,_that.batchSize,_that.offset,_that.lastSyncedTime);case _StockDownSyncInProgressState() when inProgress != null:
return inProgress(_that.syncedCount,_that.totalCount);case _StockDownSyncSuccessState() when success != null:
return success(_that.syncedCount,_that.totalCount);case _StockDownSyncFailureState() when failed != null:
return failed();case _StockDownSyncInsufficientStorageState() when insufficientStorage != null:
return insufficientStorage();case _StockDownSyncCountCheckFailedState() when totalCountCheckFailed != null:
return totalCountCheckFailed();case _StockDownSyncResetState() when resetState != null:
return resetState();case _:
  return null;

}
}

}

/// @nodoc


class _StockDownSyncLoadingState extends StockDownSyncState with DiagnosticableTreeMixin {
  const _StockDownSyncLoadingState(this.isPop): super._();
  

 final  bool isPop;

/// Create a copy of StockDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockDownSyncLoadingStateCopyWith<_StockDownSyncLoadingState> get copyWith => __$StockDownSyncLoadingStateCopyWithImpl<_StockDownSyncLoadingState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StockDownSyncState.loading'))
    ..add(DiagnosticsProperty('isPop', isPop));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockDownSyncLoadingState&&(identical(other.isPop, isPop) || other.isPop == isPop));
}


@override
int get hashCode => Object.hash(runtimeType,isPop);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StockDownSyncState.loading(isPop: $isPop)';
}


}

/// @nodoc
abstract mixin class _$StockDownSyncLoadingStateCopyWith<$Res> implements $StockDownSyncStateCopyWith<$Res> {
  factory _$StockDownSyncLoadingStateCopyWith(_StockDownSyncLoadingState value, $Res Function(_StockDownSyncLoadingState) _then) = __$StockDownSyncLoadingStateCopyWithImpl;
@useResult
$Res call({
 bool isPop
});




}
/// @nodoc
class __$StockDownSyncLoadingStateCopyWithImpl<$Res>
    implements _$StockDownSyncLoadingStateCopyWith<$Res> {
  __$StockDownSyncLoadingStateCopyWithImpl(this._self, this._then);

  final _StockDownSyncLoadingState _self;
  final $Res Function(_StockDownSyncLoadingState) _then;

/// Create a copy of StockDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isPop = null,}) {
  return _then(_StockDownSyncLoadingState(
null == isPop ? _self.isPop : isPop // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _StockDownSyncGetBatchSizeState extends StockDownSyncState with DiagnosticableTreeMixin {
  const _StockDownSyncGetBatchSizeState(this.batchSize, this.projectModel): super._();
  

 final  int batchSize;
 final  ProjectModel projectModel;

/// Create a copy of StockDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockDownSyncGetBatchSizeStateCopyWith<_StockDownSyncGetBatchSizeState> get copyWith => __$StockDownSyncGetBatchSizeStateCopyWithImpl<_StockDownSyncGetBatchSizeState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StockDownSyncState.getBatchSize'))
    ..add(DiagnosticsProperty('batchSize', batchSize))..add(DiagnosticsProperty('projectModel', projectModel));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockDownSyncGetBatchSizeState&&(identical(other.batchSize, batchSize) || other.batchSize == batchSize)&&(identical(other.projectModel, projectModel) || other.projectModel == projectModel));
}


@override
int get hashCode => Object.hash(runtimeType,batchSize,projectModel);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StockDownSyncState.getBatchSize(batchSize: $batchSize, projectModel: $projectModel)';
}


}

/// @nodoc
abstract mixin class _$StockDownSyncGetBatchSizeStateCopyWith<$Res> implements $StockDownSyncStateCopyWith<$Res> {
  factory _$StockDownSyncGetBatchSizeStateCopyWith(_StockDownSyncGetBatchSizeState value, $Res Function(_StockDownSyncGetBatchSizeState) _then) = __$StockDownSyncGetBatchSizeStateCopyWithImpl;
@useResult
$Res call({
 int batchSize, ProjectModel projectModel
});




}
/// @nodoc
class __$StockDownSyncGetBatchSizeStateCopyWithImpl<$Res>
    implements _$StockDownSyncGetBatchSizeStateCopyWith<$Res> {
  __$StockDownSyncGetBatchSizeStateCopyWithImpl(this._self, this._then);

  final _StockDownSyncGetBatchSizeState _self;
  final $Res Function(_StockDownSyncGetBatchSizeState) _then;

/// Create a copy of StockDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? batchSize = null,Object? projectModel = null,}) {
  return _then(_StockDownSyncGetBatchSizeState(
null == batchSize ? _self.batchSize : batchSize // ignore: cast_nullable_to_non_nullable
as int,null == projectModel ? _self.projectModel : projectModel // ignore: cast_nullable_to_non_nullable
as ProjectModel,
  ));
}


}

/// @nodoc


class _StockDownSyncDataFoundState extends StockDownSyncState with DiagnosticableTreeMixin {
  const _StockDownSyncDataFoundState(this.initialServerCount, this.batchSize, this.offset, this.lastSyncedTime): super._();
  

 final  int initialServerCount;
 final  int batchSize;
 final  int offset;
 final  int? lastSyncedTime;

/// Create a copy of StockDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockDownSyncDataFoundStateCopyWith<_StockDownSyncDataFoundState> get copyWith => __$StockDownSyncDataFoundStateCopyWithImpl<_StockDownSyncDataFoundState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StockDownSyncState.dataFound'))
    ..add(DiagnosticsProperty('initialServerCount', initialServerCount))..add(DiagnosticsProperty('batchSize', batchSize))..add(DiagnosticsProperty('offset', offset))..add(DiagnosticsProperty('lastSyncedTime', lastSyncedTime));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockDownSyncDataFoundState&&(identical(other.initialServerCount, initialServerCount) || other.initialServerCount == initialServerCount)&&(identical(other.batchSize, batchSize) || other.batchSize == batchSize)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.lastSyncedTime, lastSyncedTime) || other.lastSyncedTime == lastSyncedTime));
}


@override
int get hashCode => Object.hash(runtimeType,initialServerCount,batchSize,offset,lastSyncedTime);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StockDownSyncState.dataFound(initialServerCount: $initialServerCount, batchSize: $batchSize, offset: $offset, lastSyncedTime: $lastSyncedTime)';
}


}

/// @nodoc
abstract mixin class _$StockDownSyncDataFoundStateCopyWith<$Res> implements $StockDownSyncStateCopyWith<$Res> {
  factory _$StockDownSyncDataFoundStateCopyWith(_StockDownSyncDataFoundState value, $Res Function(_StockDownSyncDataFoundState) _then) = __$StockDownSyncDataFoundStateCopyWithImpl;
@useResult
$Res call({
 int initialServerCount, int batchSize, int offset, int? lastSyncedTime
});




}
/// @nodoc
class __$StockDownSyncDataFoundStateCopyWithImpl<$Res>
    implements _$StockDownSyncDataFoundStateCopyWith<$Res> {
  __$StockDownSyncDataFoundStateCopyWithImpl(this._self, this._then);

  final _StockDownSyncDataFoundState _self;
  final $Res Function(_StockDownSyncDataFoundState) _then;

/// Create a copy of StockDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? initialServerCount = null,Object? batchSize = null,Object? offset = null,Object? lastSyncedTime = freezed,}) {
  return _then(_StockDownSyncDataFoundState(
null == initialServerCount ? _self.initialServerCount : initialServerCount // ignore: cast_nullable_to_non_nullable
as int,null == batchSize ? _self.batchSize : batchSize // ignore: cast_nullable_to_non_nullable
as int,null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,freezed == lastSyncedTime ? _self.lastSyncedTime : lastSyncedTime // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _StockDownSyncInProgressState extends StockDownSyncState with DiagnosticableTreeMixin {
  const _StockDownSyncInProgressState(this.syncedCount, this.totalCount): super._();
  

 final  int syncedCount;
 final  int totalCount;

/// Create a copy of StockDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockDownSyncInProgressStateCopyWith<_StockDownSyncInProgressState> get copyWith => __$StockDownSyncInProgressStateCopyWithImpl<_StockDownSyncInProgressState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StockDownSyncState.inProgress'))
    ..add(DiagnosticsProperty('syncedCount', syncedCount))..add(DiagnosticsProperty('totalCount', totalCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockDownSyncInProgressState&&(identical(other.syncedCount, syncedCount) || other.syncedCount == syncedCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,syncedCount,totalCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StockDownSyncState.inProgress(syncedCount: $syncedCount, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$StockDownSyncInProgressStateCopyWith<$Res> implements $StockDownSyncStateCopyWith<$Res> {
  factory _$StockDownSyncInProgressStateCopyWith(_StockDownSyncInProgressState value, $Res Function(_StockDownSyncInProgressState) _then) = __$StockDownSyncInProgressStateCopyWithImpl;
@useResult
$Res call({
 int syncedCount, int totalCount
});




}
/// @nodoc
class __$StockDownSyncInProgressStateCopyWithImpl<$Res>
    implements _$StockDownSyncInProgressStateCopyWith<$Res> {
  __$StockDownSyncInProgressStateCopyWithImpl(this._self, this._then);

  final _StockDownSyncInProgressState _self;
  final $Res Function(_StockDownSyncInProgressState) _then;

/// Create a copy of StockDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? syncedCount = null,Object? totalCount = null,}) {
  return _then(_StockDownSyncInProgressState(
null == syncedCount ? _self.syncedCount : syncedCount // ignore: cast_nullable_to_non_nullable
as int,null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _StockDownSyncSuccessState extends StockDownSyncState with DiagnosticableTreeMixin {
  const _StockDownSyncSuccessState(this.syncedCount, this.totalCount): super._();
  

 final  int syncedCount;
 final  int totalCount;

/// Create a copy of StockDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockDownSyncSuccessStateCopyWith<_StockDownSyncSuccessState> get copyWith => __$StockDownSyncSuccessStateCopyWithImpl<_StockDownSyncSuccessState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StockDownSyncState.success'))
    ..add(DiagnosticsProperty('syncedCount', syncedCount))..add(DiagnosticsProperty('totalCount', totalCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockDownSyncSuccessState&&(identical(other.syncedCount, syncedCount) || other.syncedCount == syncedCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,syncedCount,totalCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StockDownSyncState.success(syncedCount: $syncedCount, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$StockDownSyncSuccessStateCopyWith<$Res> implements $StockDownSyncStateCopyWith<$Res> {
  factory _$StockDownSyncSuccessStateCopyWith(_StockDownSyncSuccessState value, $Res Function(_StockDownSyncSuccessState) _then) = __$StockDownSyncSuccessStateCopyWithImpl;
@useResult
$Res call({
 int syncedCount, int totalCount
});




}
/// @nodoc
class __$StockDownSyncSuccessStateCopyWithImpl<$Res>
    implements _$StockDownSyncSuccessStateCopyWith<$Res> {
  __$StockDownSyncSuccessStateCopyWithImpl(this._self, this._then);

  final _StockDownSyncSuccessState _self;
  final $Res Function(_StockDownSyncSuccessState) _then;

/// Create a copy of StockDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? syncedCount = null,Object? totalCount = null,}) {
  return _then(_StockDownSyncSuccessState(
null == syncedCount ? _self.syncedCount : syncedCount // ignore: cast_nullable_to_non_nullable
as int,null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _StockDownSyncFailureState extends StockDownSyncState with DiagnosticableTreeMixin {
  const _StockDownSyncFailureState(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StockDownSyncState.failed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockDownSyncFailureState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StockDownSyncState.failed()';
}


}




/// @nodoc


class _StockDownSyncInsufficientStorageState extends StockDownSyncState with DiagnosticableTreeMixin {
  const _StockDownSyncInsufficientStorageState(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StockDownSyncState.insufficientStorage'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockDownSyncInsufficientStorageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StockDownSyncState.insufficientStorage()';
}


}




/// @nodoc


class _StockDownSyncCountCheckFailedState extends StockDownSyncState with DiagnosticableTreeMixin {
  const _StockDownSyncCountCheckFailedState(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StockDownSyncState.totalCountCheckFailed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockDownSyncCountCheckFailedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StockDownSyncState.totalCountCheckFailed()';
}


}




/// @nodoc


class _StockDownSyncResetState extends StockDownSyncState with DiagnosticableTreeMixin {
  const _StockDownSyncResetState(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StockDownSyncState.resetState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockDownSyncResetState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StockDownSyncState.resetState()';
}


}




// dart format on

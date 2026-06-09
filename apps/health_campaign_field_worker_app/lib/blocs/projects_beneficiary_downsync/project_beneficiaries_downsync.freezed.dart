// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_beneficiaries_downsync.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BeneficiaryDownSyncEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BeneficiaryDownSyncEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncEvent()';
}


}

/// @nodoc
class $BeneficiaryDownSyncEventCopyWith<$Res>  {
$BeneficiaryDownSyncEventCopyWith(BeneficiaryDownSyncEvent _, $Res Function(BeneficiaryDownSyncEvent) __);
}


/// Adds pattern-matching-related methods to [BeneficiaryDownSyncEvent].
extension BeneficiaryDownSyncEventPatterns on BeneficiaryDownSyncEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DownSyncBeneficiaryEvent value)?  downSync,TResult Function( DownSyncCheckTotalCountEvent value)?  checkForData,TResult Function( DownSyncGetBatchSizeEvent value)?  getBatchSize,TResult Function( DownSyncAllBoundariesEvent value)?  downSyncAll,TResult Function( DownSyncDownloadAllEvent value)?  downloadAll,TResult Function( DownSyncReportEvent value)?  downSyncReport,TResult Function( DownSyncResetStateEvent value)?  resetState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DownSyncBeneficiaryEvent() when downSync != null:
return downSync(_that);case DownSyncCheckTotalCountEvent() when checkForData != null:
return checkForData(_that);case DownSyncGetBatchSizeEvent() when getBatchSize != null:
return getBatchSize(_that);case DownSyncAllBoundariesEvent() when downSyncAll != null:
return downSyncAll(_that);case DownSyncDownloadAllEvent() when downloadAll != null:
return downloadAll(_that);case DownSyncReportEvent() when downSyncReport != null:
return downSyncReport(_that);case DownSyncResetStateEvent() when resetState != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DownSyncBeneficiaryEvent value)  downSync,required TResult Function( DownSyncCheckTotalCountEvent value)  checkForData,required TResult Function( DownSyncGetBatchSizeEvent value)  getBatchSize,required TResult Function( DownSyncAllBoundariesEvent value)  downSyncAll,required TResult Function( DownSyncDownloadAllEvent value)  downloadAll,required TResult Function( DownSyncReportEvent value)  downSyncReport,required TResult Function( DownSyncResetStateEvent value)  resetState,}){
final _that = this;
switch (_that) {
case DownSyncBeneficiaryEvent():
return downSync(_that);case DownSyncCheckTotalCountEvent():
return checkForData(_that);case DownSyncGetBatchSizeEvent():
return getBatchSize(_that);case DownSyncAllBoundariesEvent():
return downSyncAll(_that);case DownSyncDownloadAllEvent():
return downloadAll(_that);case DownSyncReportEvent():
return downSyncReport(_that);case DownSyncResetStateEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DownSyncBeneficiaryEvent value)?  downSync,TResult? Function( DownSyncCheckTotalCountEvent value)?  checkForData,TResult? Function( DownSyncGetBatchSizeEvent value)?  getBatchSize,TResult? Function( DownSyncAllBoundariesEvent value)?  downSyncAll,TResult? Function( DownSyncDownloadAllEvent value)?  downloadAll,TResult? Function( DownSyncReportEvent value)?  downSyncReport,TResult? Function( DownSyncResetStateEvent value)?  resetState,}){
final _that = this;
switch (_that) {
case DownSyncBeneficiaryEvent() when downSync != null:
return downSync(_that);case DownSyncCheckTotalCountEvent() when checkForData != null:
return checkForData(_that);case DownSyncGetBatchSizeEvent() when getBatchSize != null:
return getBatchSize(_that);case DownSyncAllBoundariesEvent() when downSyncAll != null:
return downSyncAll(_that);case DownSyncDownloadAllEvent() when downloadAll != null:
return downloadAll(_that);case DownSyncReportEvent() when downSyncReport != null:
return downSyncReport(_that);case DownSyncResetStateEvent() when resetState != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ProjectModel projectModel,  String boundaryCode,  int batchSize,  int initialServerCount,  String boundaryName)?  downSync,TResult Function( ProjectModel projectModel,  String boundaryCode,  int pendingSyncCount,  int batchSize,  String boundaryName)?  checkForData,TResult Function( List<AppConfiguration> appConfiguration,  ProjectModel projectModel,  List<BoundaryModel> boundaries,  int pendingSyncCount)?  getBatchSize,TResult Function( ProjectModel projectModel,  List<BoundaryModel> boundaries,  int batchSize,  int pendingSyncCount)?  downSyncAll,TResult Function( ProjectModel projectModel,  List<BoundaryModel> boundaries,  int batchSize,  Map<String, int> boundaryCounts)?  downloadAll,TResult Function()?  downSyncReport,TResult Function()?  resetState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DownSyncBeneficiaryEvent() when downSync != null:
return downSync(_that.projectModel,_that.boundaryCode,_that.batchSize,_that.initialServerCount,_that.boundaryName);case DownSyncCheckTotalCountEvent() when checkForData != null:
return checkForData(_that.projectModel,_that.boundaryCode,_that.pendingSyncCount,_that.batchSize,_that.boundaryName);case DownSyncGetBatchSizeEvent() when getBatchSize != null:
return getBatchSize(_that.appConfiguration,_that.projectModel,_that.boundaries,_that.pendingSyncCount);case DownSyncAllBoundariesEvent() when downSyncAll != null:
return downSyncAll(_that.projectModel,_that.boundaries,_that.batchSize,_that.pendingSyncCount);case DownSyncDownloadAllEvent() when downloadAll != null:
return downloadAll(_that.projectModel,_that.boundaries,_that.batchSize,_that.boundaryCounts);case DownSyncReportEvent() when downSyncReport != null:
return downSyncReport();case DownSyncResetStateEvent() when resetState != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ProjectModel projectModel,  String boundaryCode,  int batchSize,  int initialServerCount,  String boundaryName)  downSync,required TResult Function( ProjectModel projectModel,  String boundaryCode,  int pendingSyncCount,  int batchSize,  String boundaryName)  checkForData,required TResult Function( List<AppConfiguration> appConfiguration,  ProjectModel projectModel,  List<BoundaryModel> boundaries,  int pendingSyncCount)  getBatchSize,required TResult Function( ProjectModel projectModel,  List<BoundaryModel> boundaries,  int batchSize,  int pendingSyncCount)  downSyncAll,required TResult Function( ProjectModel projectModel,  List<BoundaryModel> boundaries,  int batchSize,  Map<String, int> boundaryCounts)  downloadAll,required TResult Function()  downSyncReport,required TResult Function()  resetState,}) {final _that = this;
switch (_that) {
case DownSyncBeneficiaryEvent():
return downSync(_that.projectModel,_that.boundaryCode,_that.batchSize,_that.initialServerCount,_that.boundaryName);case DownSyncCheckTotalCountEvent():
return checkForData(_that.projectModel,_that.boundaryCode,_that.pendingSyncCount,_that.batchSize,_that.boundaryName);case DownSyncGetBatchSizeEvent():
return getBatchSize(_that.appConfiguration,_that.projectModel,_that.boundaries,_that.pendingSyncCount);case DownSyncAllBoundariesEvent():
return downSyncAll(_that.projectModel,_that.boundaries,_that.batchSize,_that.pendingSyncCount);case DownSyncDownloadAllEvent():
return downloadAll(_that.projectModel,_that.boundaries,_that.batchSize,_that.boundaryCounts);case DownSyncReportEvent():
return downSyncReport();case DownSyncResetStateEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ProjectModel projectModel,  String boundaryCode,  int batchSize,  int initialServerCount,  String boundaryName)?  downSync,TResult? Function( ProjectModel projectModel,  String boundaryCode,  int pendingSyncCount,  int batchSize,  String boundaryName)?  checkForData,TResult? Function( List<AppConfiguration> appConfiguration,  ProjectModel projectModel,  List<BoundaryModel> boundaries,  int pendingSyncCount)?  getBatchSize,TResult? Function( ProjectModel projectModel,  List<BoundaryModel> boundaries,  int batchSize,  int pendingSyncCount)?  downSyncAll,TResult? Function( ProjectModel projectModel,  List<BoundaryModel> boundaries,  int batchSize,  Map<String, int> boundaryCounts)?  downloadAll,TResult? Function()?  downSyncReport,TResult? Function()?  resetState,}) {final _that = this;
switch (_that) {
case DownSyncBeneficiaryEvent() when downSync != null:
return downSync(_that.projectModel,_that.boundaryCode,_that.batchSize,_that.initialServerCount,_that.boundaryName);case DownSyncCheckTotalCountEvent() when checkForData != null:
return checkForData(_that.projectModel,_that.boundaryCode,_that.pendingSyncCount,_that.batchSize,_that.boundaryName);case DownSyncGetBatchSizeEvent() when getBatchSize != null:
return getBatchSize(_that.appConfiguration,_that.projectModel,_that.boundaries,_that.pendingSyncCount);case DownSyncAllBoundariesEvent() when downSyncAll != null:
return downSyncAll(_that.projectModel,_that.boundaries,_that.batchSize,_that.pendingSyncCount);case DownSyncDownloadAllEvent() when downloadAll != null:
return downloadAll(_that.projectModel,_that.boundaries,_that.batchSize,_that.boundaryCounts);case DownSyncReportEvent() when downSyncReport != null:
return downSyncReport();case DownSyncResetStateEvent() when resetState != null:
return resetState();case _:
  return null;

}
}

}

/// @nodoc


class DownSyncBeneficiaryEvent with DiagnosticableTreeMixin implements BeneficiaryDownSyncEvent {
  const DownSyncBeneficiaryEvent({required this.projectModel, required this.boundaryCode, required this.batchSize, required this.initialServerCount, required this.boundaryName});
  

 final  ProjectModel projectModel;
 final  String boundaryCode;
 final  int batchSize;
 final  int initialServerCount;
 final  String boundaryName;

/// Create a copy of BeneficiaryDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownSyncBeneficiaryEventCopyWith<DownSyncBeneficiaryEvent> get copyWith => _$DownSyncBeneficiaryEventCopyWithImpl<DownSyncBeneficiaryEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncEvent.downSync'))
    ..add(DiagnosticsProperty('projectModel', projectModel))..add(DiagnosticsProperty('boundaryCode', boundaryCode))..add(DiagnosticsProperty('batchSize', batchSize))..add(DiagnosticsProperty('initialServerCount', initialServerCount))..add(DiagnosticsProperty('boundaryName', boundaryName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownSyncBeneficiaryEvent&&(identical(other.projectModel, projectModel) || other.projectModel == projectModel)&&(identical(other.boundaryCode, boundaryCode) || other.boundaryCode == boundaryCode)&&(identical(other.batchSize, batchSize) || other.batchSize == batchSize)&&(identical(other.initialServerCount, initialServerCount) || other.initialServerCount == initialServerCount)&&(identical(other.boundaryName, boundaryName) || other.boundaryName == boundaryName));
}


@override
int get hashCode => Object.hash(runtimeType,projectModel,boundaryCode,batchSize,initialServerCount,boundaryName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncEvent.downSync(projectModel: $projectModel, boundaryCode: $boundaryCode, batchSize: $batchSize, initialServerCount: $initialServerCount, boundaryName: $boundaryName)';
}


}

/// @nodoc
abstract mixin class $DownSyncBeneficiaryEventCopyWith<$Res> implements $BeneficiaryDownSyncEventCopyWith<$Res> {
  factory $DownSyncBeneficiaryEventCopyWith(DownSyncBeneficiaryEvent value, $Res Function(DownSyncBeneficiaryEvent) _then) = _$DownSyncBeneficiaryEventCopyWithImpl;
@useResult
$Res call({
 ProjectModel projectModel, String boundaryCode, int batchSize, int initialServerCount, String boundaryName
});




}
/// @nodoc
class _$DownSyncBeneficiaryEventCopyWithImpl<$Res>
    implements $DownSyncBeneficiaryEventCopyWith<$Res> {
  _$DownSyncBeneficiaryEventCopyWithImpl(this._self, this._then);

  final DownSyncBeneficiaryEvent _self;
  final $Res Function(DownSyncBeneficiaryEvent) _then;

/// Create a copy of BeneficiaryDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectModel = null,Object? boundaryCode = null,Object? batchSize = null,Object? initialServerCount = null,Object? boundaryName = null,}) {
  return _then(DownSyncBeneficiaryEvent(
projectModel: null == projectModel ? _self.projectModel : projectModel // ignore: cast_nullable_to_non_nullable
as ProjectModel,boundaryCode: null == boundaryCode ? _self.boundaryCode : boundaryCode // ignore: cast_nullable_to_non_nullable
as String,batchSize: null == batchSize ? _self.batchSize : batchSize // ignore: cast_nullable_to_non_nullable
as int,initialServerCount: null == initialServerCount ? _self.initialServerCount : initialServerCount // ignore: cast_nullable_to_non_nullable
as int,boundaryName: null == boundaryName ? _self.boundaryName : boundaryName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DownSyncCheckTotalCountEvent with DiagnosticableTreeMixin implements BeneficiaryDownSyncEvent {
  const DownSyncCheckTotalCountEvent({required this.projectModel, required this.boundaryCode, required this.pendingSyncCount, required this.batchSize, required this.boundaryName});
  

 final  ProjectModel projectModel;
 final  String boundaryCode;
 final  int pendingSyncCount;
 final  int batchSize;
 final  String boundaryName;

/// Create a copy of BeneficiaryDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownSyncCheckTotalCountEventCopyWith<DownSyncCheckTotalCountEvent> get copyWith => _$DownSyncCheckTotalCountEventCopyWithImpl<DownSyncCheckTotalCountEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncEvent.checkForData'))
    ..add(DiagnosticsProperty('projectModel', projectModel))..add(DiagnosticsProperty('boundaryCode', boundaryCode))..add(DiagnosticsProperty('pendingSyncCount', pendingSyncCount))..add(DiagnosticsProperty('batchSize', batchSize))..add(DiagnosticsProperty('boundaryName', boundaryName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownSyncCheckTotalCountEvent&&(identical(other.projectModel, projectModel) || other.projectModel == projectModel)&&(identical(other.boundaryCode, boundaryCode) || other.boundaryCode == boundaryCode)&&(identical(other.pendingSyncCount, pendingSyncCount) || other.pendingSyncCount == pendingSyncCount)&&(identical(other.batchSize, batchSize) || other.batchSize == batchSize)&&(identical(other.boundaryName, boundaryName) || other.boundaryName == boundaryName));
}


@override
int get hashCode => Object.hash(runtimeType,projectModel,boundaryCode,pendingSyncCount,batchSize,boundaryName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncEvent.checkForData(projectModel: $projectModel, boundaryCode: $boundaryCode, pendingSyncCount: $pendingSyncCount, batchSize: $batchSize, boundaryName: $boundaryName)';
}


}

/// @nodoc
abstract mixin class $DownSyncCheckTotalCountEventCopyWith<$Res> implements $BeneficiaryDownSyncEventCopyWith<$Res> {
  factory $DownSyncCheckTotalCountEventCopyWith(DownSyncCheckTotalCountEvent value, $Res Function(DownSyncCheckTotalCountEvent) _then) = _$DownSyncCheckTotalCountEventCopyWithImpl;
@useResult
$Res call({
 ProjectModel projectModel, String boundaryCode, int pendingSyncCount, int batchSize, String boundaryName
});




}
/// @nodoc
class _$DownSyncCheckTotalCountEventCopyWithImpl<$Res>
    implements $DownSyncCheckTotalCountEventCopyWith<$Res> {
  _$DownSyncCheckTotalCountEventCopyWithImpl(this._self, this._then);

  final DownSyncCheckTotalCountEvent _self;
  final $Res Function(DownSyncCheckTotalCountEvent) _then;

/// Create a copy of BeneficiaryDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectModel = null,Object? boundaryCode = null,Object? pendingSyncCount = null,Object? batchSize = null,Object? boundaryName = null,}) {
  return _then(DownSyncCheckTotalCountEvent(
projectModel: null == projectModel ? _self.projectModel : projectModel // ignore: cast_nullable_to_non_nullable
as ProjectModel,boundaryCode: null == boundaryCode ? _self.boundaryCode : boundaryCode // ignore: cast_nullable_to_non_nullable
as String,pendingSyncCount: null == pendingSyncCount ? _self.pendingSyncCount : pendingSyncCount // ignore: cast_nullable_to_non_nullable
as int,batchSize: null == batchSize ? _self.batchSize : batchSize // ignore: cast_nullable_to_non_nullable
as int,boundaryName: null == boundaryName ? _self.boundaryName : boundaryName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DownSyncGetBatchSizeEvent with DiagnosticableTreeMixin implements BeneficiaryDownSyncEvent {
  const DownSyncGetBatchSizeEvent({required final  List<AppConfiguration> appConfiguration, required this.projectModel, required final  List<BoundaryModel> boundaries, required this.pendingSyncCount}): _appConfiguration = appConfiguration,_boundaries = boundaries;
  

 final  List<AppConfiguration> _appConfiguration;
 List<AppConfiguration> get appConfiguration {
  if (_appConfiguration is EqualUnmodifiableListView) return _appConfiguration;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appConfiguration);
}

 final  ProjectModel projectModel;
 final  List<BoundaryModel> _boundaries;
 List<BoundaryModel> get boundaries {
  if (_boundaries is EqualUnmodifiableListView) return _boundaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_boundaries);
}

 final  int pendingSyncCount;

/// Create a copy of BeneficiaryDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownSyncGetBatchSizeEventCopyWith<DownSyncGetBatchSizeEvent> get copyWith => _$DownSyncGetBatchSizeEventCopyWithImpl<DownSyncGetBatchSizeEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncEvent.getBatchSize'))
    ..add(DiagnosticsProperty('appConfiguration', appConfiguration))..add(DiagnosticsProperty('projectModel', projectModel))..add(DiagnosticsProperty('boundaries', boundaries))..add(DiagnosticsProperty('pendingSyncCount', pendingSyncCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownSyncGetBatchSizeEvent&&const DeepCollectionEquality().equals(other._appConfiguration, _appConfiguration)&&(identical(other.projectModel, projectModel) || other.projectModel == projectModel)&&const DeepCollectionEquality().equals(other._boundaries, _boundaries)&&(identical(other.pendingSyncCount, pendingSyncCount) || other.pendingSyncCount == pendingSyncCount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_appConfiguration),projectModel,const DeepCollectionEquality().hash(_boundaries),pendingSyncCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncEvent.getBatchSize(appConfiguration: $appConfiguration, projectModel: $projectModel, boundaries: $boundaries, pendingSyncCount: $pendingSyncCount)';
}


}

/// @nodoc
abstract mixin class $DownSyncGetBatchSizeEventCopyWith<$Res> implements $BeneficiaryDownSyncEventCopyWith<$Res> {
  factory $DownSyncGetBatchSizeEventCopyWith(DownSyncGetBatchSizeEvent value, $Res Function(DownSyncGetBatchSizeEvent) _then) = _$DownSyncGetBatchSizeEventCopyWithImpl;
@useResult
$Res call({
 List<AppConfiguration> appConfiguration, ProjectModel projectModel, List<BoundaryModel> boundaries, int pendingSyncCount
});




}
/// @nodoc
class _$DownSyncGetBatchSizeEventCopyWithImpl<$Res>
    implements $DownSyncGetBatchSizeEventCopyWith<$Res> {
  _$DownSyncGetBatchSizeEventCopyWithImpl(this._self, this._then);

  final DownSyncGetBatchSizeEvent _self;
  final $Res Function(DownSyncGetBatchSizeEvent) _then;

/// Create a copy of BeneficiaryDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appConfiguration = null,Object? projectModel = null,Object? boundaries = null,Object? pendingSyncCount = null,}) {
  return _then(DownSyncGetBatchSizeEvent(
appConfiguration: null == appConfiguration ? _self._appConfiguration : appConfiguration // ignore: cast_nullable_to_non_nullable
as List<AppConfiguration>,projectModel: null == projectModel ? _self.projectModel : projectModel // ignore: cast_nullable_to_non_nullable
as ProjectModel,boundaries: null == boundaries ? _self._boundaries : boundaries // ignore: cast_nullable_to_non_nullable
as List<BoundaryModel>,pendingSyncCount: null == pendingSyncCount ? _self.pendingSyncCount : pendingSyncCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DownSyncAllBoundariesEvent with DiagnosticableTreeMixin implements BeneficiaryDownSyncEvent {
  const DownSyncAllBoundariesEvent({required this.projectModel, required final  List<BoundaryModel> boundaries, required this.batchSize, required this.pendingSyncCount}): _boundaries = boundaries;
  

 final  ProjectModel projectModel;
 final  List<BoundaryModel> _boundaries;
 List<BoundaryModel> get boundaries {
  if (_boundaries is EqualUnmodifiableListView) return _boundaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_boundaries);
}

 final  int batchSize;
 final  int pendingSyncCount;

/// Create a copy of BeneficiaryDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownSyncAllBoundariesEventCopyWith<DownSyncAllBoundariesEvent> get copyWith => _$DownSyncAllBoundariesEventCopyWithImpl<DownSyncAllBoundariesEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncEvent.downSyncAll'))
    ..add(DiagnosticsProperty('projectModel', projectModel))..add(DiagnosticsProperty('boundaries', boundaries))..add(DiagnosticsProperty('batchSize', batchSize))..add(DiagnosticsProperty('pendingSyncCount', pendingSyncCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownSyncAllBoundariesEvent&&(identical(other.projectModel, projectModel) || other.projectModel == projectModel)&&const DeepCollectionEquality().equals(other._boundaries, _boundaries)&&(identical(other.batchSize, batchSize) || other.batchSize == batchSize)&&(identical(other.pendingSyncCount, pendingSyncCount) || other.pendingSyncCount == pendingSyncCount));
}


@override
int get hashCode => Object.hash(runtimeType,projectModel,const DeepCollectionEquality().hash(_boundaries),batchSize,pendingSyncCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncEvent.downSyncAll(projectModel: $projectModel, boundaries: $boundaries, batchSize: $batchSize, pendingSyncCount: $pendingSyncCount)';
}


}

/// @nodoc
abstract mixin class $DownSyncAllBoundariesEventCopyWith<$Res> implements $BeneficiaryDownSyncEventCopyWith<$Res> {
  factory $DownSyncAllBoundariesEventCopyWith(DownSyncAllBoundariesEvent value, $Res Function(DownSyncAllBoundariesEvent) _then) = _$DownSyncAllBoundariesEventCopyWithImpl;
@useResult
$Res call({
 ProjectModel projectModel, List<BoundaryModel> boundaries, int batchSize, int pendingSyncCount
});




}
/// @nodoc
class _$DownSyncAllBoundariesEventCopyWithImpl<$Res>
    implements $DownSyncAllBoundariesEventCopyWith<$Res> {
  _$DownSyncAllBoundariesEventCopyWithImpl(this._self, this._then);

  final DownSyncAllBoundariesEvent _self;
  final $Res Function(DownSyncAllBoundariesEvent) _then;

/// Create a copy of BeneficiaryDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectModel = null,Object? boundaries = null,Object? batchSize = null,Object? pendingSyncCount = null,}) {
  return _then(DownSyncAllBoundariesEvent(
projectModel: null == projectModel ? _self.projectModel : projectModel // ignore: cast_nullable_to_non_nullable
as ProjectModel,boundaries: null == boundaries ? _self._boundaries : boundaries // ignore: cast_nullable_to_non_nullable
as List<BoundaryModel>,batchSize: null == batchSize ? _self.batchSize : batchSize // ignore: cast_nullable_to_non_nullable
as int,pendingSyncCount: null == pendingSyncCount ? _self.pendingSyncCount : pendingSyncCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DownSyncDownloadAllEvent with DiagnosticableTreeMixin implements BeneficiaryDownSyncEvent {
  const DownSyncDownloadAllEvent({required this.projectModel, required final  List<BoundaryModel> boundaries, required this.batchSize, required final  Map<String, int> boundaryCounts}): _boundaries = boundaries,_boundaryCounts = boundaryCounts;
  

 final  ProjectModel projectModel;
 final  List<BoundaryModel> _boundaries;
 List<BoundaryModel> get boundaries {
  if (_boundaries is EqualUnmodifiableListView) return _boundaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_boundaries);
}

 final  int batchSize;
 final  Map<String, int> _boundaryCounts;
 Map<String, int> get boundaryCounts {
  if (_boundaryCounts is EqualUnmodifiableMapView) return _boundaryCounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_boundaryCounts);
}


/// Create a copy of BeneficiaryDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownSyncDownloadAllEventCopyWith<DownSyncDownloadAllEvent> get copyWith => _$DownSyncDownloadAllEventCopyWithImpl<DownSyncDownloadAllEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncEvent.downloadAll'))
    ..add(DiagnosticsProperty('projectModel', projectModel))..add(DiagnosticsProperty('boundaries', boundaries))..add(DiagnosticsProperty('batchSize', batchSize))..add(DiagnosticsProperty('boundaryCounts', boundaryCounts));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownSyncDownloadAllEvent&&(identical(other.projectModel, projectModel) || other.projectModel == projectModel)&&const DeepCollectionEquality().equals(other._boundaries, _boundaries)&&(identical(other.batchSize, batchSize) || other.batchSize == batchSize)&&const DeepCollectionEquality().equals(other._boundaryCounts, _boundaryCounts));
}


@override
int get hashCode => Object.hash(runtimeType,projectModel,const DeepCollectionEquality().hash(_boundaries),batchSize,const DeepCollectionEquality().hash(_boundaryCounts));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncEvent.downloadAll(projectModel: $projectModel, boundaries: $boundaries, batchSize: $batchSize, boundaryCounts: $boundaryCounts)';
}


}

/// @nodoc
abstract mixin class $DownSyncDownloadAllEventCopyWith<$Res> implements $BeneficiaryDownSyncEventCopyWith<$Res> {
  factory $DownSyncDownloadAllEventCopyWith(DownSyncDownloadAllEvent value, $Res Function(DownSyncDownloadAllEvent) _then) = _$DownSyncDownloadAllEventCopyWithImpl;
@useResult
$Res call({
 ProjectModel projectModel, List<BoundaryModel> boundaries, int batchSize, Map<String, int> boundaryCounts
});




}
/// @nodoc
class _$DownSyncDownloadAllEventCopyWithImpl<$Res>
    implements $DownSyncDownloadAllEventCopyWith<$Res> {
  _$DownSyncDownloadAllEventCopyWithImpl(this._self, this._then);

  final DownSyncDownloadAllEvent _self;
  final $Res Function(DownSyncDownloadAllEvent) _then;

/// Create a copy of BeneficiaryDownSyncEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectModel = null,Object? boundaries = null,Object? batchSize = null,Object? boundaryCounts = null,}) {
  return _then(DownSyncDownloadAllEvent(
projectModel: null == projectModel ? _self.projectModel : projectModel // ignore: cast_nullable_to_non_nullable
as ProjectModel,boundaries: null == boundaries ? _self._boundaries : boundaries // ignore: cast_nullable_to_non_nullable
as List<BoundaryModel>,batchSize: null == batchSize ? _self.batchSize : batchSize // ignore: cast_nullable_to_non_nullable
as int,boundaryCounts: null == boundaryCounts ? _self._boundaryCounts : boundaryCounts // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}


}

/// @nodoc


class DownSyncReportEvent with DiagnosticableTreeMixin implements BeneficiaryDownSyncEvent {
  const DownSyncReportEvent();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncEvent.downSyncReport'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownSyncReportEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncEvent.downSyncReport()';
}


}




/// @nodoc


class DownSyncResetStateEvent with DiagnosticableTreeMixin implements BeneficiaryDownSyncEvent {
  const DownSyncResetStateEvent();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncEvent.resetState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownSyncResetStateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncEvent.resetState()';
}


}




/// @nodoc
mixin _$BeneficiaryDownSyncState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BeneficiaryDownSyncState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncState()';
}


}

/// @nodoc
class $BeneficiaryDownSyncStateCopyWith<$Res>  {
$BeneficiaryDownSyncStateCopyWith(BeneficiaryDownSyncState _, $Res Function(BeneficiaryDownSyncState) __);
}


/// Adds pattern-matching-related methods to [BeneficiaryDownSyncState].
extension BeneficiaryDownSyncStatePatterns on BeneficiaryDownSyncState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _DownSyncInProgressState value)?  inProgress,TResult Function( _DownSyncSuccessState value)?  success,TResult Function( _DownSyncGetBatchSizeState value)?  getBatchSize,TResult Function( _DownSyncLoadingState value)?  loading,TResult Function( _DownSyncInsufficientStorageState value)?  insufficientStorage,TResult Function( _DownSyncDataFoundState value)?  dataFound,TResult Function( _DownSyncResetState value)?  resetState,TResult Function( _DownSynnCountCheckFailedState value)?  totalCountCheckFailed,TResult Function( _DownSyncFailureState value)?  failed,TResult Function( _DownSyncReportState value)?  report,TResult Function( _DownSyncPendingSyncState value)?  pendingSync,TResult Function( _DownSyncMultiBoundaryInProgressState value)?  multiBoundaryInProgress,TResult Function( _DownSyncMultiBoundarySuccessState value)?  multiBoundarySuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownSyncInProgressState() when inProgress != null:
return inProgress(_that);case _DownSyncSuccessState() when success != null:
return success(_that);case _DownSyncGetBatchSizeState() when getBatchSize != null:
return getBatchSize(_that);case _DownSyncLoadingState() when loading != null:
return loading(_that);case _DownSyncInsufficientStorageState() when insufficientStorage != null:
return insufficientStorage(_that);case _DownSyncDataFoundState() when dataFound != null:
return dataFound(_that);case _DownSyncResetState() when resetState != null:
return resetState(_that);case _DownSynnCountCheckFailedState() when totalCountCheckFailed != null:
return totalCountCheckFailed(_that);case _DownSyncFailureState() when failed != null:
return failed(_that);case _DownSyncReportState() when report != null:
return report(_that);case _DownSyncPendingSyncState() when pendingSync != null:
return pendingSync(_that);case _DownSyncMultiBoundaryInProgressState() when multiBoundaryInProgress != null:
return multiBoundaryInProgress(_that);case _DownSyncMultiBoundarySuccessState() when multiBoundarySuccess != null:
return multiBoundarySuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _DownSyncInProgressState value)  inProgress,required TResult Function( _DownSyncSuccessState value)  success,required TResult Function( _DownSyncGetBatchSizeState value)  getBatchSize,required TResult Function( _DownSyncLoadingState value)  loading,required TResult Function( _DownSyncInsufficientStorageState value)  insufficientStorage,required TResult Function( _DownSyncDataFoundState value)  dataFound,required TResult Function( _DownSyncResetState value)  resetState,required TResult Function( _DownSynnCountCheckFailedState value)  totalCountCheckFailed,required TResult Function( _DownSyncFailureState value)  failed,required TResult Function( _DownSyncReportState value)  report,required TResult Function( _DownSyncPendingSyncState value)  pendingSync,required TResult Function( _DownSyncMultiBoundaryInProgressState value)  multiBoundaryInProgress,required TResult Function( _DownSyncMultiBoundarySuccessState value)  multiBoundarySuccess,}){
final _that = this;
switch (_that) {
case _DownSyncInProgressState():
return inProgress(_that);case _DownSyncSuccessState():
return success(_that);case _DownSyncGetBatchSizeState():
return getBatchSize(_that);case _DownSyncLoadingState():
return loading(_that);case _DownSyncInsufficientStorageState():
return insufficientStorage(_that);case _DownSyncDataFoundState():
return dataFound(_that);case _DownSyncResetState():
return resetState(_that);case _DownSynnCountCheckFailedState():
return totalCountCheckFailed(_that);case _DownSyncFailureState():
return failed(_that);case _DownSyncReportState():
return report(_that);case _DownSyncPendingSyncState():
return pendingSync(_that);case _DownSyncMultiBoundaryInProgressState():
return multiBoundaryInProgress(_that);case _DownSyncMultiBoundarySuccessState():
return multiBoundarySuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _DownSyncInProgressState value)?  inProgress,TResult? Function( _DownSyncSuccessState value)?  success,TResult? Function( _DownSyncGetBatchSizeState value)?  getBatchSize,TResult? Function( _DownSyncLoadingState value)?  loading,TResult? Function( _DownSyncInsufficientStorageState value)?  insufficientStorage,TResult? Function( _DownSyncDataFoundState value)?  dataFound,TResult? Function( _DownSyncResetState value)?  resetState,TResult? Function( _DownSynnCountCheckFailedState value)?  totalCountCheckFailed,TResult? Function( _DownSyncFailureState value)?  failed,TResult? Function( _DownSyncReportState value)?  report,TResult? Function( _DownSyncPendingSyncState value)?  pendingSync,TResult? Function( _DownSyncMultiBoundaryInProgressState value)?  multiBoundaryInProgress,TResult? Function( _DownSyncMultiBoundarySuccessState value)?  multiBoundarySuccess,}){
final _that = this;
switch (_that) {
case _DownSyncInProgressState() when inProgress != null:
return inProgress(_that);case _DownSyncSuccessState() when success != null:
return success(_that);case _DownSyncGetBatchSizeState() when getBatchSize != null:
return getBatchSize(_that);case _DownSyncLoadingState() when loading != null:
return loading(_that);case _DownSyncInsufficientStorageState() when insufficientStorage != null:
return insufficientStorage(_that);case _DownSyncDataFoundState() when dataFound != null:
return dataFound(_that);case _DownSyncResetState() when resetState != null:
return resetState(_that);case _DownSynnCountCheckFailedState() when totalCountCheckFailed != null:
return totalCountCheckFailed(_that);case _DownSyncFailureState() when failed != null:
return failed(_that);case _DownSyncReportState() when report != null:
return report(_that);case _DownSyncPendingSyncState() when pendingSync != null:
return pendingSync(_that);case _DownSyncMultiBoundaryInProgressState() when multiBoundaryInProgress != null:
return multiBoundaryInProgress(_that);case _DownSyncMultiBoundarySuccessState() when multiBoundarySuccess != null:
return multiBoundarySuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int syncedCount,  int totalCount)?  inProgress,TResult Function( DownsyncModel downSyncResult)?  success,TResult Function( int batchSize,  ProjectModel projectModel,  List<BoundaryModel> boundaries,  int pendingSyncCount)?  getBatchSize,TResult Function( bool isPop)?  loading,TResult Function()?  insufficientStorage,TResult Function( int initialServerCount,  int batchSize,  Map<String, int> boundaryCounts)?  dataFound,TResult Function()?  resetState,TResult Function()?  totalCountCheckFailed,TResult Function()?  failed,TResult Function( List<DownsyncModel> downsyncCriteriaList)?  report,TResult Function()?  pendingSync,TResult Function( int currentBoundaryIndex,  int totalBoundaries,  String currentBoundaryName,  int syncedCount,  int totalCount)?  multiBoundaryInProgress,TResult Function( List<DownsyncModel> results)?  multiBoundarySuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownSyncInProgressState() when inProgress != null:
return inProgress(_that.syncedCount,_that.totalCount);case _DownSyncSuccessState() when success != null:
return success(_that.downSyncResult);case _DownSyncGetBatchSizeState() when getBatchSize != null:
return getBatchSize(_that.batchSize,_that.projectModel,_that.boundaries,_that.pendingSyncCount);case _DownSyncLoadingState() when loading != null:
return loading(_that.isPop);case _DownSyncInsufficientStorageState() when insufficientStorage != null:
return insufficientStorage();case _DownSyncDataFoundState() when dataFound != null:
return dataFound(_that.initialServerCount,_that.batchSize,_that.boundaryCounts);case _DownSyncResetState() when resetState != null:
return resetState();case _DownSynnCountCheckFailedState() when totalCountCheckFailed != null:
return totalCountCheckFailed();case _DownSyncFailureState() when failed != null:
return failed();case _DownSyncReportState() when report != null:
return report(_that.downsyncCriteriaList);case _DownSyncPendingSyncState() when pendingSync != null:
return pendingSync();case _DownSyncMultiBoundaryInProgressState() when multiBoundaryInProgress != null:
return multiBoundaryInProgress(_that.currentBoundaryIndex,_that.totalBoundaries,_that.currentBoundaryName,_that.syncedCount,_that.totalCount);case _DownSyncMultiBoundarySuccessState() when multiBoundarySuccess != null:
return multiBoundarySuccess(_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int syncedCount,  int totalCount)  inProgress,required TResult Function( DownsyncModel downSyncResult)  success,required TResult Function( int batchSize,  ProjectModel projectModel,  List<BoundaryModel> boundaries,  int pendingSyncCount)  getBatchSize,required TResult Function( bool isPop)  loading,required TResult Function()  insufficientStorage,required TResult Function( int initialServerCount,  int batchSize,  Map<String, int> boundaryCounts)  dataFound,required TResult Function()  resetState,required TResult Function()  totalCountCheckFailed,required TResult Function()  failed,required TResult Function( List<DownsyncModel> downsyncCriteriaList)  report,required TResult Function()  pendingSync,required TResult Function( int currentBoundaryIndex,  int totalBoundaries,  String currentBoundaryName,  int syncedCount,  int totalCount)  multiBoundaryInProgress,required TResult Function( List<DownsyncModel> results)  multiBoundarySuccess,}) {final _that = this;
switch (_that) {
case _DownSyncInProgressState():
return inProgress(_that.syncedCount,_that.totalCount);case _DownSyncSuccessState():
return success(_that.downSyncResult);case _DownSyncGetBatchSizeState():
return getBatchSize(_that.batchSize,_that.projectModel,_that.boundaries,_that.pendingSyncCount);case _DownSyncLoadingState():
return loading(_that.isPop);case _DownSyncInsufficientStorageState():
return insufficientStorage();case _DownSyncDataFoundState():
return dataFound(_that.initialServerCount,_that.batchSize,_that.boundaryCounts);case _DownSyncResetState():
return resetState();case _DownSynnCountCheckFailedState():
return totalCountCheckFailed();case _DownSyncFailureState():
return failed();case _DownSyncReportState():
return report(_that.downsyncCriteriaList);case _DownSyncPendingSyncState():
return pendingSync();case _DownSyncMultiBoundaryInProgressState():
return multiBoundaryInProgress(_that.currentBoundaryIndex,_that.totalBoundaries,_that.currentBoundaryName,_that.syncedCount,_that.totalCount);case _DownSyncMultiBoundarySuccessState():
return multiBoundarySuccess(_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int syncedCount,  int totalCount)?  inProgress,TResult? Function( DownsyncModel downSyncResult)?  success,TResult? Function( int batchSize,  ProjectModel projectModel,  List<BoundaryModel> boundaries,  int pendingSyncCount)?  getBatchSize,TResult? Function( bool isPop)?  loading,TResult? Function()?  insufficientStorage,TResult? Function( int initialServerCount,  int batchSize,  Map<String, int> boundaryCounts)?  dataFound,TResult? Function()?  resetState,TResult? Function()?  totalCountCheckFailed,TResult? Function()?  failed,TResult? Function( List<DownsyncModel> downsyncCriteriaList)?  report,TResult? Function()?  pendingSync,TResult? Function( int currentBoundaryIndex,  int totalBoundaries,  String currentBoundaryName,  int syncedCount,  int totalCount)?  multiBoundaryInProgress,TResult? Function( List<DownsyncModel> results)?  multiBoundarySuccess,}) {final _that = this;
switch (_that) {
case _DownSyncInProgressState() when inProgress != null:
return inProgress(_that.syncedCount,_that.totalCount);case _DownSyncSuccessState() when success != null:
return success(_that.downSyncResult);case _DownSyncGetBatchSizeState() when getBatchSize != null:
return getBatchSize(_that.batchSize,_that.projectModel,_that.boundaries,_that.pendingSyncCount);case _DownSyncLoadingState() when loading != null:
return loading(_that.isPop);case _DownSyncInsufficientStorageState() when insufficientStorage != null:
return insufficientStorage();case _DownSyncDataFoundState() when dataFound != null:
return dataFound(_that.initialServerCount,_that.batchSize,_that.boundaryCounts);case _DownSyncResetState() when resetState != null:
return resetState();case _DownSynnCountCheckFailedState() when totalCountCheckFailed != null:
return totalCountCheckFailed();case _DownSyncFailureState() when failed != null:
return failed();case _DownSyncReportState() when report != null:
return report(_that.downsyncCriteriaList);case _DownSyncPendingSyncState() when pendingSync != null:
return pendingSync();case _DownSyncMultiBoundaryInProgressState() when multiBoundaryInProgress != null:
return multiBoundaryInProgress(_that.currentBoundaryIndex,_that.totalBoundaries,_that.currentBoundaryName,_that.syncedCount,_that.totalCount);case _DownSyncMultiBoundarySuccessState() when multiBoundarySuccess != null:
return multiBoundarySuccess(_that.results);case _:
  return null;

}
}

}

/// @nodoc


class _DownSyncInProgressState extends BeneficiaryDownSyncState with DiagnosticableTreeMixin {
  const _DownSyncInProgressState(this.syncedCount, this.totalCount): super._();
  

 final  int syncedCount;
 final  int totalCount;

/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownSyncInProgressStateCopyWith<_DownSyncInProgressState> get copyWith => __$DownSyncInProgressStateCopyWithImpl<_DownSyncInProgressState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncState.inProgress'))
    ..add(DiagnosticsProperty('syncedCount', syncedCount))..add(DiagnosticsProperty('totalCount', totalCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownSyncInProgressState&&(identical(other.syncedCount, syncedCount) || other.syncedCount == syncedCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,syncedCount,totalCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncState.inProgress(syncedCount: $syncedCount, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$DownSyncInProgressStateCopyWith<$Res> implements $BeneficiaryDownSyncStateCopyWith<$Res> {
  factory _$DownSyncInProgressStateCopyWith(_DownSyncInProgressState value, $Res Function(_DownSyncInProgressState) _then) = __$DownSyncInProgressStateCopyWithImpl;
@useResult
$Res call({
 int syncedCount, int totalCount
});




}
/// @nodoc
class __$DownSyncInProgressStateCopyWithImpl<$Res>
    implements _$DownSyncInProgressStateCopyWith<$Res> {
  __$DownSyncInProgressStateCopyWithImpl(this._self, this._then);

  final _DownSyncInProgressState _self;
  final $Res Function(_DownSyncInProgressState) _then;

/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? syncedCount = null,Object? totalCount = null,}) {
  return _then(_DownSyncInProgressState(
null == syncedCount ? _self.syncedCount : syncedCount // ignore: cast_nullable_to_non_nullable
as int,null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DownSyncSuccessState extends BeneficiaryDownSyncState with DiagnosticableTreeMixin {
  const _DownSyncSuccessState(this.downSyncResult): super._();
  

 final  DownsyncModel downSyncResult;

/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownSyncSuccessStateCopyWith<_DownSyncSuccessState> get copyWith => __$DownSyncSuccessStateCopyWithImpl<_DownSyncSuccessState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncState.success'))
    ..add(DiagnosticsProperty('downSyncResult', downSyncResult));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownSyncSuccessState&&(identical(other.downSyncResult, downSyncResult) || other.downSyncResult == downSyncResult));
}


@override
int get hashCode => Object.hash(runtimeType,downSyncResult);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncState.success(downSyncResult: $downSyncResult)';
}


}

/// @nodoc
abstract mixin class _$DownSyncSuccessStateCopyWith<$Res> implements $BeneficiaryDownSyncStateCopyWith<$Res> {
  factory _$DownSyncSuccessStateCopyWith(_DownSyncSuccessState value, $Res Function(_DownSyncSuccessState) _then) = __$DownSyncSuccessStateCopyWithImpl;
@useResult
$Res call({
 DownsyncModel downSyncResult
});




}
/// @nodoc
class __$DownSyncSuccessStateCopyWithImpl<$Res>
    implements _$DownSyncSuccessStateCopyWith<$Res> {
  __$DownSyncSuccessStateCopyWithImpl(this._self, this._then);

  final _DownSyncSuccessState _self;
  final $Res Function(_DownSyncSuccessState) _then;

/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? downSyncResult = null,}) {
  return _then(_DownSyncSuccessState(
null == downSyncResult ? _self.downSyncResult : downSyncResult // ignore: cast_nullable_to_non_nullable
as DownsyncModel,
  ));
}


}

/// @nodoc


class _DownSyncGetBatchSizeState extends BeneficiaryDownSyncState with DiagnosticableTreeMixin {
  const _DownSyncGetBatchSizeState(this.batchSize, this.projectModel, final  List<BoundaryModel> boundaries, this.pendingSyncCount): _boundaries = boundaries,super._();
  

 final  int batchSize;
 final  ProjectModel projectModel;
 final  List<BoundaryModel> _boundaries;
 List<BoundaryModel> get boundaries {
  if (_boundaries is EqualUnmodifiableListView) return _boundaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_boundaries);
}

 final  int pendingSyncCount;

/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownSyncGetBatchSizeStateCopyWith<_DownSyncGetBatchSizeState> get copyWith => __$DownSyncGetBatchSizeStateCopyWithImpl<_DownSyncGetBatchSizeState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncState.getBatchSize'))
    ..add(DiagnosticsProperty('batchSize', batchSize))..add(DiagnosticsProperty('projectModel', projectModel))..add(DiagnosticsProperty('boundaries', boundaries))..add(DiagnosticsProperty('pendingSyncCount', pendingSyncCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownSyncGetBatchSizeState&&(identical(other.batchSize, batchSize) || other.batchSize == batchSize)&&(identical(other.projectModel, projectModel) || other.projectModel == projectModel)&&const DeepCollectionEquality().equals(other._boundaries, _boundaries)&&(identical(other.pendingSyncCount, pendingSyncCount) || other.pendingSyncCount == pendingSyncCount));
}


@override
int get hashCode => Object.hash(runtimeType,batchSize,projectModel,const DeepCollectionEquality().hash(_boundaries),pendingSyncCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncState.getBatchSize(batchSize: $batchSize, projectModel: $projectModel, boundaries: $boundaries, pendingSyncCount: $pendingSyncCount)';
}


}

/// @nodoc
abstract mixin class _$DownSyncGetBatchSizeStateCopyWith<$Res> implements $BeneficiaryDownSyncStateCopyWith<$Res> {
  factory _$DownSyncGetBatchSizeStateCopyWith(_DownSyncGetBatchSizeState value, $Res Function(_DownSyncGetBatchSizeState) _then) = __$DownSyncGetBatchSizeStateCopyWithImpl;
@useResult
$Res call({
 int batchSize, ProjectModel projectModel, List<BoundaryModel> boundaries, int pendingSyncCount
});




}
/// @nodoc
class __$DownSyncGetBatchSizeStateCopyWithImpl<$Res>
    implements _$DownSyncGetBatchSizeStateCopyWith<$Res> {
  __$DownSyncGetBatchSizeStateCopyWithImpl(this._self, this._then);

  final _DownSyncGetBatchSizeState _self;
  final $Res Function(_DownSyncGetBatchSizeState) _then;

/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? batchSize = null,Object? projectModel = null,Object? boundaries = null,Object? pendingSyncCount = null,}) {
  return _then(_DownSyncGetBatchSizeState(
null == batchSize ? _self.batchSize : batchSize // ignore: cast_nullable_to_non_nullable
as int,null == projectModel ? _self.projectModel : projectModel // ignore: cast_nullable_to_non_nullable
as ProjectModel,null == boundaries ? _self._boundaries : boundaries // ignore: cast_nullable_to_non_nullable
as List<BoundaryModel>,null == pendingSyncCount ? _self.pendingSyncCount : pendingSyncCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DownSyncLoadingState extends BeneficiaryDownSyncState with DiagnosticableTreeMixin {
  const _DownSyncLoadingState(this.isPop): super._();
  

 final  bool isPop;

/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownSyncLoadingStateCopyWith<_DownSyncLoadingState> get copyWith => __$DownSyncLoadingStateCopyWithImpl<_DownSyncLoadingState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncState.loading'))
    ..add(DiagnosticsProperty('isPop', isPop));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownSyncLoadingState&&(identical(other.isPop, isPop) || other.isPop == isPop));
}


@override
int get hashCode => Object.hash(runtimeType,isPop);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncState.loading(isPop: $isPop)';
}


}

/// @nodoc
abstract mixin class _$DownSyncLoadingStateCopyWith<$Res> implements $BeneficiaryDownSyncStateCopyWith<$Res> {
  factory _$DownSyncLoadingStateCopyWith(_DownSyncLoadingState value, $Res Function(_DownSyncLoadingState) _then) = __$DownSyncLoadingStateCopyWithImpl;
@useResult
$Res call({
 bool isPop
});




}
/// @nodoc
class __$DownSyncLoadingStateCopyWithImpl<$Res>
    implements _$DownSyncLoadingStateCopyWith<$Res> {
  __$DownSyncLoadingStateCopyWithImpl(this._self, this._then);

  final _DownSyncLoadingState _self;
  final $Res Function(_DownSyncLoadingState) _then;

/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isPop = null,}) {
  return _then(_DownSyncLoadingState(
null == isPop ? _self.isPop : isPop // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _DownSyncInsufficientStorageState extends BeneficiaryDownSyncState with DiagnosticableTreeMixin {
  const _DownSyncInsufficientStorageState(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncState.insufficientStorage'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownSyncInsufficientStorageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncState.insufficientStorage()';
}


}




/// @nodoc


class _DownSyncDataFoundState extends BeneficiaryDownSyncState with DiagnosticableTreeMixin {
  const _DownSyncDataFoundState(this.initialServerCount, this.batchSize, final  Map<String, int> boundaryCounts): _boundaryCounts = boundaryCounts,super._();
  

 final  int initialServerCount;
 final  int batchSize;
 final  Map<String, int> _boundaryCounts;
 Map<String, int> get boundaryCounts {
  if (_boundaryCounts is EqualUnmodifiableMapView) return _boundaryCounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_boundaryCounts);
}


/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownSyncDataFoundStateCopyWith<_DownSyncDataFoundState> get copyWith => __$DownSyncDataFoundStateCopyWithImpl<_DownSyncDataFoundState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncState.dataFound'))
    ..add(DiagnosticsProperty('initialServerCount', initialServerCount))..add(DiagnosticsProperty('batchSize', batchSize))..add(DiagnosticsProperty('boundaryCounts', boundaryCounts));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownSyncDataFoundState&&(identical(other.initialServerCount, initialServerCount) || other.initialServerCount == initialServerCount)&&(identical(other.batchSize, batchSize) || other.batchSize == batchSize)&&const DeepCollectionEquality().equals(other._boundaryCounts, _boundaryCounts));
}


@override
int get hashCode => Object.hash(runtimeType,initialServerCount,batchSize,const DeepCollectionEquality().hash(_boundaryCounts));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncState.dataFound(initialServerCount: $initialServerCount, batchSize: $batchSize, boundaryCounts: $boundaryCounts)';
}


}

/// @nodoc
abstract mixin class _$DownSyncDataFoundStateCopyWith<$Res> implements $BeneficiaryDownSyncStateCopyWith<$Res> {
  factory _$DownSyncDataFoundStateCopyWith(_DownSyncDataFoundState value, $Res Function(_DownSyncDataFoundState) _then) = __$DownSyncDataFoundStateCopyWithImpl;
@useResult
$Res call({
 int initialServerCount, int batchSize, Map<String, int> boundaryCounts
});




}
/// @nodoc
class __$DownSyncDataFoundStateCopyWithImpl<$Res>
    implements _$DownSyncDataFoundStateCopyWith<$Res> {
  __$DownSyncDataFoundStateCopyWithImpl(this._self, this._then);

  final _DownSyncDataFoundState _self;
  final $Res Function(_DownSyncDataFoundState) _then;

/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? initialServerCount = null,Object? batchSize = null,Object? boundaryCounts = null,}) {
  return _then(_DownSyncDataFoundState(
null == initialServerCount ? _self.initialServerCount : initialServerCount // ignore: cast_nullable_to_non_nullable
as int,null == batchSize ? _self.batchSize : batchSize // ignore: cast_nullable_to_non_nullable
as int,null == boundaryCounts ? _self._boundaryCounts : boundaryCounts // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}


}

/// @nodoc


class _DownSyncResetState extends BeneficiaryDownSyncState with DiagnosticableTreeMixin {
  const _DownSyncResetState(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncState.resetState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownSyncResetState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncState.resetState()';
}


}




/// @nodoc


class _DownSynnCountCheckFailedState extends BeneficiaryDownSyncState with DiagnosticableTreeMixin {
  const _DownSynnCountCheckFailedState(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncState.totalCountCheckFailed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownSynnCountCheckFailedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncState.totalCountCheckFailed()';
}


}




/// @nodoc


class _DownSyncFailureState extends BeneficiaryDownSyncState with DiagnosticableTreeMixin {
  const _DownSyncFailureState(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncState.failed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownSyncFailureState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncState.failed()';
}


}




/// @nodoc


class _DownSyncReportState extends BeneficiaryDownSyncState with DiagnosticableTreeMixin {
  const _DownSyncReportState(final  List<DownsyncModel> downsyncCriteriaList): _downsyncCriteriaList = downsyncCriteriaList,super._();
  

 final  List<DownsyncModel> _downsyncCriteriaList;
 List<DownsyncModel> get downsyncCriteriaList {
  if (_downsyncCriteriaList is EqualUnmodifiableListView) return _downsyncCriteriaList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_downsyncCriteriaList);
}


/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownSyncReportStateCopyWith<_DownSyncReportState> get copyWith => __$DownSyncReportStateCopyWithImpl<_DownSyncReportState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncState.report'))
    ..add(DiagnosticsProperty('downsyncCriteriaList', downsyncCriteriaList));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownSyncReportState&&const DeepCollectionEquality().equals(other._downsyncCriteriaList, _downsyncCriteriaList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_downsyncCriteriaList));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncState.report(downsyncCriteriaList: $downsyncCriteriaList)';
}


}

/// @nodoc
abstract mixin class _$DownSyncReportStateCopyWith<$Res> implements $BeneficiaryDownSyncStateCopyWith<$Res> {
  factory _$DownSyncReportStateCopyWith(_DownSyncReportState value, $Res Function(_DownSyncReportState) _then) = __$DownSyncReportStateCopyWithImpl;
@useResult
$Res call({
 List<DownsyncModel> downsyncCriteriaList
});




}
/// @nodoc
class __$DownSyncReportStateCopyWithImpl<$Res>
    implements _$DownSyncReportStateCopyWith<$Res> {
  __$DownSyncReportStateCopyWithImpl(this._self, this._then);

  final _DownSyncReportState _self;
  final $Res Function(_DownSyncReportState) _then;

/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? downsyncCriteriaList = null,}) {
  return _then(_DownSyncReportState(
null == downsyncCriteriaList ? _self._downsyncCriteriaList : downsyncCriteriaList // ignore: cast_nullable_to_non_nullable
as List<DownsyncModel>,
  ));
}


}

/// @nodoc


class _DownSyncPendingSyncState extends BeneficiaryDownSyncState with DiagnosticableTreeMixin {
  const _DownSyncPendingSyncState(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncState.pendingSync'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownSyncPendingSyncState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncState.pendingSync()';
}


}




/// @nodoc


class _DownSyncMultiBoundaryInProgressState extends BeneficiaryDownSyncState with DiagnosticableTreeMixin {
  const _DownSyncMultiBoundaryInProgressState(this.currentBoundaryIndex, this.totalBoundaries, this.currentBoundaryName, this.syncedCount, this.totalCount): super._();
  

 final  int currentBoundaryIndex;
 final  int totalBoundaries;
 final  String currentBoundaryName;
 final  int syncedCount;
 final  int totalCount;

/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownSyncMultiBoundaryInProgressStateCopyWith<_DownSyncMultiBoundaryInProgressState> get copyWith => __$DownSyncMultiBoundaryInProgressStateCopyWithImpl<_DownSyncMultiBoundaryInProgressState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncState.multiBoundaryInProgress'))
    ..add(DiagnosticsProperty('currentBoundaryIndex', currentBoundaryIndex))..add(DiagnosticsProperty('totalBoundaries', totalBoundaries))..add(DiagnosticsProperty('currentBoundaryName', currentBoundaryName))..add(DiagnosticsProperty('syncedCount', syncedCount))..add(DiagnosticsProperty('totalCount', totalCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownSyncMultiBoundaryInProgressState&&(identical(other.currentBoundaryIndex, currentBoundaryIndex) || other.currentBoundaryIndex == currentBoundaryIndex)&&(identical(other.totalBoundaries, totalBoundaries) || other.totalBoundaries == totalBoundaries)&&(identical(other.currentBoundaryName, currentBoundaryName) || other.currentBoundaryName == currentBoundaryName)&&(identical(other.syncedCount, syncedCount) || other.syncedCount == syncedCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,currentBoundaryIndex,totalBoundaries,currentBoundaryName,syncedCount,totalCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncState.multiBoundaryInProgress(currentBoundaryIndex: $currentBoundaryIndex, totalBoundaries: $totalBoundaries, currentBoundaryName: $currentBoundaryName, syncedCount: $syncedCount, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$DownSyncMultiBoundaryInProgressStateCopyWith<$Res> implements $BeneficiaryDownSyncStateCopyWith<$Res> {
  factory _$DownSyncMultiBoundaryInProgressStateCopyWith(_DownSyncMultiBoundaryInProgressState value, $Res Function(_DownSyncMultiBoundaryInProgressState) _then) = __$DownSyncMultiBoundaryInProgressStateCopyWithImpl;
@useResult
$Res call({
 int currentBoundaryIndex, int totalBoundaries, String currentBoundaryName, int syncedCount, int totalCount
});




}
/// @nodoc
class __$DownSyncMultiBoundaryInProgressStateCopyWithImpl<$Res>
    implements _$DownSyncMultiBoundaryInProgressStateCopyWith<$Res> {
  __$DownSyncMultiBoundaryInProgressStateCopyWithImpl(this._self, this._then);

  final _DownSyncMultiBoundaryInProgressState _self;
  final $Res Function(_DownSyncMultiBoundaryInProgressState) _then;

/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentBoundaryIndex = null,Object? totalBoundaries = null,Object? currentBoundaryName = null,Object? syncedCount = null,Object? totalCount = null,}) {
  return _then(_DownSyncMultiBoundaryInProgressState(
null == currentBoundaryIndex ? _self.currentBoundaryIndex : currentBoundaryIndex // ignore: cast_nullable_to_non_nullable
as int,null == totalBoundaries ? _self.totalBoundaries : totalBoundaries // ignore: cast_nullable_to_non_nullable
as int,null == currentBoundaryName ? _self.currentBoundaryName : currentBoundaryName // ignore: cast_nullable_to_non_nullable
as String,null == syncedCount ? _self.syncedCount : syncedCount // ignore: cast_nullable_to_non_nullable
as int,null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DownSyncMultiBoundarySuccessState extends BeneficiaryDownSyncState with DiagnosticableTreeMixin {
  const _DownSyncMultiBoundarySuccessState(final  List<DownsyncModel> results): _results = results,super._();
  

 final  List<DownsyncModel> _results;
 List<DownsyncModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownSyncMultiBoundarySuccessStateCopyWith<_DownSyncMultiBoundarySuccessState> get copyWith => __$DownSyncMultiBoundarySuccessStateCopyWithImpl<_DownSyncMultiBoundarySuccessState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BeneficiaryDownSyncState.multiBoundarySuccess'))
    ..add(DiagnosticsProperty('results', results));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownSyncMultiBoundarySuccessState&&const DeepCollectionEquality().equals(other._results, _results));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BeneficiaryDownSyncState.multiBoundarySuccess(results: $results)';
}


}

/// @nodoc
abstract mixin class _$DownSyncMultiBoundarySuccessStateCopyWith<$Res> implements $BeneficiaryDownSyncStateCopyWith<$Res> {
  factory _$DownSyncMultiBoundarySuccessStateCopyWith(_DownSyncMultiBoundarySuccessState value, $Res Function(_DownSyncMultiBoundarySuccessState) _then) = __$DownSyncMultiBoundarySuccessStateCopyWithImpl;
@useResult
$Res call({
 List<DownsyncModel> results
});




}
/// @nodoc
class __$DownSyncMultiBoundarySuccessStateCopyWithImpl<$Res>
    implements _$DownSyncMultiBoundarySuccessStateCopyWith<$Res> {
  __$DownSyncMultiBoundarySuccessStateCopyWithImpl(this._self, this._then);

  final _DownSyncMultiBoundarySuccessState _self;
  final $Res Function(_DownSyncMultiBoundarySuccessState) _then;

/// Create a copy of BeneficiaryDownSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(_DownSyncMultiBoundarySuccessState(
null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<DownsyncModel>,
  ));
}


}

// dart format on

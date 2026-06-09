// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peer_to_peer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PeerToPeerEvent implements DiagnosticableTreeMixin {

 NearbyService get nearbyService; String get selectedBoundaryCode;
/// Create a copy of PeerToPeerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeerToPeerEventCopyWith<PeerToPeerEvent> get copyWith => _$PeerToPeerEventCopyWithImpl<PeerToPeerEvent>(this as PeerToPeerEvent, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PeerToPeerEvent'))
    ..add(DiagnosticsProperty('nearbyService', nearbyService))..add(DiagnosticsProperty('selectedBoundaryCode', selectedBoundaryCode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeerToPeerEvent&&(identical(other.nearbyService, nearbyService) || other.nearbyService == nearbyService)&&(identical(other.selectedBoundaryCode, selectedBoundaryCode) || other.selectedBoundaryCode == selectedBoundaryCode));
}


@override
int get hashCode => Object.hash(runtimeType,nearbyService,selectedBoundaryCode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PeerToPeerEvent(nearbyService: $nearbyService, selectedBoundaryCode: $selectedBoundaryCode)';
}


}

/// @nodoc
abstract mixin class $PeerToPeerEventCopyWith<$Res>  {
  factory $PeerToPeerEventCopyWith(PeerToPeerEvent value, $Res Function(PeerToPeerEvent) _then) = _$PeerToPeerEventCopyWithImpl;
@useResult
$Res call({
 NearbyService nearbyService, String selectedBoundaryCode
});




}
/// @nodoc
class _$PeerToPeerEventCopyWithImpl<$Res>
    implements $PeerToPeerEventCopyWith<$Res> {
  _$PeerToPeerEventCopyWithImpl(this._self, this._then);

  final PeerToPeerEvent _self;
  final $Res Function(PeerToPeerEvent) _then;

/// Create a copy of PeerToPeerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nearbyService = null,Object? selectedBoundaryCode = null,}) {
  return _then(_self.copyWith(
nearbyService: null == nearbyService ? _self.nearbyService : nearbyService // ignore: cast_nullable_to_non_nullable
as NearbyService,selectedBoundaryCode: null == selectedBoundaryCode ? _self.selectedBoundaryCode : selectedBoundaryCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PeerToPeerEvent].
extension PeerToPeerEventPatterns on PeerToPeerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DataTransferEvent value)?  dataTransfer,TResult Function( DataReceiverEvent value)?  dataReceiver,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DataTransferEvent() when dataTransfer != null:
return dataTransfer(_that);case DataReceiverEvent() when dataReceiver != null:
return dataReceiver(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DataTransferEvent value)  dataTransfer,required TResult Function( DataReceiverEvent value)  dataReceiver,}){
final _that = this;
switch (_that) {
case DataTransferEvent():
return dataTransfer(_that);case DataReceiverEvent():
return dataReceiver(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DataTransferEvent value)?  dataTransfer,TResult? Function( DataReceiverEvent value)?  dataReceiver,}){
final _that = this;
switch (_that) {
case DataTransferEvent() when dataTransfer != null:
return dataTransfer(_that);case DataReceiverEvent() when dataReceiver != null:
return dataReceiver(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( NearbyService nearbyService,  String selectedProject,  String selectedBoundaryCode,  List<Device> connectedDevice)?  dataTransfer,TResult Function( String projectId,  String selectedBoundaryCode,  NearbyService nearbyService,  dynamic data)?  dataReceiver,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DataTransferEvent() when dataTransfer != null:
return dataTransfer(_that.nearbyService,_that.selectedProject,_that.selectedBoundaryCode,_that.connectedDevice);case DataReceiverEvent() when dataReceiver != null:
return dataReceiver(_that.projectId,_that.selectedBoundaryCode,_that.nearbyService,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( NearbyService nearbyService,  String selectedProject,  String selectedBoundaryCode,  List<Device> connectedDevice)  dataTransfer,required TResult Function( String projectId,  String selectedBoundaryCode,  NearbyService nearbyService,  dynamic data)  dataReceiver,}) {final _that = this;
switch (_that) {
case DataTransferEvent():
return dataTransfer(_that.nearbyService,_that.selectedProject,_that.selectedBoundaryCode,_that.connectedDevice);case DataReceiverEvent():
return dataReceiver(_that.projectId,_that.selectedBoundaryCode,_that.nearbyService,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( NearbyService nearbyService,  String selectedProject,  String selectedBoundaryCode,  List<Device> connectedDevice)?  dataTransfer,TResult? Function( String projectId,  String selectedBoundaryCode,  NearbyService nearbyService,  dynamic data)?  dataReceiver,}) {final _that = this;
switch (_that) {
case DataTransferEvent() when dataTransfer != null:
return dataTransfer(_that.nearbyService,_that.selectedProject,_that.selectedBoundaryCode,_that.connectedDevice);case DataReceiverEvent() when dataReceiver != null:
return dataReceiver(_that.projectId,_that.selectedBoundaryCode,_that.nearbyService,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class DataTransferEvent with DiagnosticableTreeMixin implements PeerToPeerEvent {
  const DataTransferEvent({required this.nearbyService, required this.selectedProject, required this.selectedBoundaryCode, required final  List<Device> connectedDevice}): _connectedDevice = connectedDevice;
  

@override final  NearbyService nearbyService;
 final  String selectedProject;
@override final  String selectedBoundaryCode;
 final  List<Device> _connectedDevice;
 List<Device> get connectedDevice {
  if (_connectedDevice is EqualUnmodifiableListView) return _connectedDevice;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connectedDevice);
}


/// Create a copy of PeerToPeerEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataTransferEventCopyWith<DataTransferEvent> get copyWith => _$DataTransferEventCopyWithImpl<DataTransferEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PeerToPeerEvent.dataTransfer'))
    ..add(DiagnosticsProperty('nearbyService', nearbyService))..add(DiagnosticsProperty('selectedProject', selectedProject))..add(DiagnosticsProperty('selectedBoundaryCode', selectedBoundaryCode))..add(DiagnosticsProperty('connectedDevice', connectedDevice));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataTransferEvent&&(identical(other.nearbyService, nearbyService) || other.nearbyService == nearbyService)&&(identical(other.selectedProject, selectedProject) || other.selectedProject == selectedProject)&&(identical(other.selectedBoundaryCode, selectedBoundaryCode) || other.selectedBoundaryCode == selectedBoundaryCode)&&const DeepCollectionEquality().equals(other._connectedDevice, _connectedDevice));
}


@override
int get hashCode => Object.hash(runtimeType,nearbyService,selectedProject,selectedBoundaryCode,const DeepCollectionEquality().hash(_connectedDevice));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PeerToPeerEvent.dataTransfer(nearbyService: $nearbyService, selectedProject: $selectedProject, selectedBoundaryCode: $selectedBoundaryCode, connectedDevice: $connectedDevice)';
}


}

/// @nodoc
abstract mixin class $DataTransferEventCopyWith<$Res> implements $PeerToPeerEventCopyWith<$Res> {
  factory $DataTransferEventCopyWith(DataTransferEvent value, $Res Function(DataTransferEvent) _then) = _$DataTransferEventCopyWithImpl;
@override @useResult
$Res call({
 NearbyService nearbyService, String selectedProject, String selectedBoundaryCode, List<Device> connectedDevice
});




}
/// @nodoc
class _$DataTransferEventCopyWithImpl<$Res>
    implements $DataTransferEventCopyWith<$Res> {
  _$DataTransferEventCopyWithImpl(this._self, this._then);

  final DataTransferEvent _self;
  final $Res Function(DataTransferEvent) _then;

/// Create a copy of PeerToPeerEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nearbyService = null,Object? selectedProject = null,Object? selectedBoundaryCode = null,Object? connectedDevice = null,}) {
  return _then(DataTransferEvent(
nearbyService: null == nearbyService ? _self.nearbyService : nearbyService // ignore: cast_nullable_to_non_nullable
as NearbyService,selectedProject: null == selectedProject ? _self.selectedProject : selectedProject // ignore: cast_nullable_to_non_nullable
as String,selectedBoundaryCode: null == selectedBoundaryCode ? _self.selectedBoundaryCode : selectedBoundaryCode // ignore: cast_nullable_to_non_nullable
as String,connectedDevice: null == connectedDevice ? _self._connectedDevice : connectedDevice // ignore: cast_nullable_to_non_nullable
as List<Device>,
  ));
}


}

/// @nodoc


class DataReceiverEvent with DiagnosticableTreeMixin implements PeerToPeerEvent {
  const DataReceiverEvent({required this.projectId, required this.selectedBoundaryCode, required this.nearbyService, required this.data});
  

 final  String projectId;
@override final  String selectedBoundaryCode;
@override final  NearbyService nearbyService;
 final  dynamic data;

/// Create a copy of PeerToPeerEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataReceiverEventCopyWith<DataReceiverEvent> get copyWith => _$DataReceiverEventCopyWithImpl<DataReceiverEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PeerToPeerEvent.dataReceiver'))
    ..add(DiagnosticsProperty('projectId', projectId))..add(DiagnosticsProperty('selectedBoundaryCode', selectedBoundaryCode))..add(DiagnosticsProperty('nearbyService', nearbyService))..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataReceiverEvent&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.selectedBoundaryCode, selectedBoundaryCode) || other.selectedBoundaryCode == selectedBoundaryCode)&&(identical(other.nearbyService, nearbyService) || other.nearbyService == nearbyService)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,selectedBoundaryCode,nearbyService,const DeepCollectionEquality().hash(data));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PeerToPeerEvent.dataReceiver(projectId: $projectId, selectedBoundaryCode: $selectedBoundaryCode, nearbyService: $nearbyService, data: $data)';
}


}

/// @nodoc
abstract mixin class $DataReceiverEventCopyWith<$Res> implements $PeerToPeerEventCopyWith<$Res> {
  factory $DataReceiverEventCopyWith(DataReceiverEvent value, $Res Function(DataReceiverEvent) _then) = _$DataReceiverEventCopyWithImpl;
@override @useResult
$Res call({
 String projectId, String selectedBoundaryCode, NearbyService nearbyService, dynamic data
});




}
/// @nodoc
class _$DataReceiverEventCopyWithImpl<$Res>
    implements $DataReceiverEventCopyWith<$Res> {
  _$DataReceiverEventCopyWithImpl(this._self, this._then);

  final DataReceiverEvent _self;
  final $Res Function(DataReceiverEvent) _then;

/// Create a copy of PeerToPeerEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? selectedBoundaryCode = null,Object? nearbyService = null,Object? data = freezed,}) {
  return _then(DataReceiverEvent(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,selectedBoundaryCode: null == selectedBoundaryCode ? _self.selectedBoundaryCode : selectedBoundaryCode // ignore: cast_nullable_to_non_nullable
as String,nearbyService: null == nearbyService ? _self.nearbyService : nearbyService // ignore: cast_nullable_to_non_nullable
as NearbyService,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc
mixin _$PeerToPeerState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PeerToPeerState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeerToPeerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PeerToPeerState()';
}


}

/// @nodoc
class $PeerToPeerStateCopyWith<$Res>  {
$PeerToPeerStateCopyWith(PeerToPeerState _, $Res Function(PeerToPeerState) __);
}


/// Adds pattern-matching-related methods to [PeerToPeerState].
extension PeerToPeerStatePatterns on PeerToPeerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PeerToPeerInitial value)?  initial,TResult Function( PeerToPeerLoading value)?  loading,TResult Function( TransferInProgress value)?  transferInProgress,TResult Function( CompletedDataTransfer value)?  completedDataTransfer,TResult Function( FailedToTransfer value)?  failedToTransfer,TResult Function( ReceivingInProgress value)?  receivingInProgress,TResult Function( DataReceived value)?  dataReceived,TResult Function( FailedDataTransfer value)?  failedToReceive,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PeerToPeerInitial() when initial != null:
return initial(_that);case PeerToPeerLoading() when loading != null:
return loading(_that);case TransferInProgress() when transferInProgress != null:
return transferInProgress(_that);case CompletedDataTransfer() when completedDataTransfer != null:
return completedDataTransfer(_that);case FailedToTransfer() when failedToTransfer != null:
return failedToTransfer(_that);case ReceivingInProgress() when receivingInProgress != null:
return receivingInProgress(_that);case DataReceived() when dataReceived != null:
return dataReceived(_that);case FailedDataTransfer() when failedToReceive != null:
return failedToReceive(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PeerToPeerInitial value)  initial,required TResult Function( PeerToPeerLoading value)  loading,required TResult Function( TransferInProgress value)  transferInProgress,required TResult Function( CompletedDataTransfer value)  completedDataTransfer,required TResult Function( FailedToTransfer value)  failedToTransfer,required TResult Function( ReceivingInProgress value)  receivingInProgress,required TResult Function( DataReceived value)  dataReceived,required TResult Function( FailedDataTransfer value)  failedToReceive,}){
final _that = this;
switch (_that) {
case PeerToPeerInitial():
return initial(_that);case PeerToPeerLoading():
return loading(_that);case TransferInProgress():
return transferInProgress(_that);case CompletedDataTransfer():
return completedDataTransfer(_that);case FailedToTransfer():
return failedToTransfer(_that);case ReceivingInProgress():
return receivingInProgress(_that);case DataReceived():
return dataReceived(_that);case FailedDataTransfer():
return failedToReceive(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PeerToPeerInitial value)?  initial,TResult? Function( PeerToPeerLoading value)?  loading,TResult? Function( TransferInProgress value)?  transferInProgress,TResult? Function( CompletedDataTransfer value)?  completedDataTransfer,TResult? Function( FailedToTransfer value)?  failedToTransfer,TResult? Function( ReceivingInProgress value)?  receivingInProgress,TResult? Function( DataReceived value)?  dataReceived,TResult? Function( FailedDataTransfer value)?  failedToReceive,}){
final _that = this;
switch (_that) {
case PeerToPeerInitial() when initial != null:
return initial(_that);case PeerToPeerLoading() when loading != null:
return loading(_that);case TransferInProgress() when transferInProgress != null:
return transferInProgress(_that);case CompletedDataTransfer() when completedDataTransfer != null:
return completedDataTransfer(_that);case FailedToTransfer() when failedToTransfer != null:
return failedToTransfer(_that);case ReceivingInProgress() when receivingInProgress != null:
return receivingInProgress(_that);case DataReceived() when dataReceived != null:
return dataReceived(_that);case FailedDataTransfer() when failedToReceive != null:
return failedToReceive(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( double progress,  int offset,  int totalCount)?  transferInProgress,TResult Function()?  completedDataTransfer,TResult Function( String error)?  failedToTransfer,TResult Function( double progress,  int offset,  int totalCount,  Set<String> receivedBoundaries)?  receivingInProgress,TResult Function( Set<String> receivedBoundaries)?  dataReceived,TResult Function( String error)?  failedToReceive,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PeerToPeerInitial() when initial != null:
return initial();case PeerToPeerLoading() when loading != null:
return loading();case TransferInProgress() when transferInProgress != null:
return transferInProgress(_that.progress,_that.offset,_that.totalCount);case CompletedDataTransfer() when completedDataTransfer != null:
return completedDataTransfer();case FailedToTransfer() when failedToTransfer != null:
return failedToTransfer(_that.error);case ReceivingInProgress() when receivingInProgress != null:
return receivingInProgress(_that.progress,_that.offset,_that.totalCount,_that.receivedBoundaries);case DataReceived() when dataReceived != null:
return dataReceived(_that.receivedBoundaries);case FailedDataTransfer() when failedToReceive != null:
return failedToReceive(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( double progress,  int offset,  int totalCount)  transferInProgress,required TResult Function()  completedDataTransfer,required TResult Function( String error)  failedToTransfer,required TResult Function( double progress,  int offset,  int totalCount,  Set<String> receivedBoundaries)  receivingInProgress,required TResult Function( Set<String> receivedBoundaries)  dataReceived,required TResult Function( String error)  failedToReceive,}) {final _that = this;
switch (_that) {
case PeerToPeerInitial():
return initial();case PeerToPeerLoading():
return loading();case TransferInProgress():
return transferInProgress(_that.progress,_that.offset,_that.totalCount);case CompletedDataTransfer():
return completedDataTransfer();case FailedToTransfer():
return failedToTransfer(_that.error);case ReceivingInProgress():
return receivingInProgress(_that.progress,_that.offset,_that.totalCount,_that.receivedBoundaries);case DataReceived():
return dataReceived(_that.receivedBoundaries);case FailedDataTransfer():
return failedToReceive(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( double progress,  int offset,  int totalCount)?  transferInProgress,TResult? Function()?  completedDataTransfer,TResult? Function( String error)?  failedToTransfer,TResult? Function( double progress,  int offset,  int totalCount,  Set<String> receivedBoundaries)?  receivingInProgress,TResult? Function( Set<String> receivedBoundaries)?  dataReceived,TResult? Function( String error)?  failedToReceive,}) {final _that = this;
switch (_that) {
case PeerToPeerInitial() when initial != null:
return initial();case PeerToPeerLoading() when loading != null:
return loading();case TransferInProgress() when transferInProgress != null:
return transferInProgress(_that.progress,_that.offset,_that.totalCount);case CompletedDataTransfer() when completedDataTransfer != null:
return completedDataTransfer();case FailedToTransfer() when failedToTransfer != null:
return failedToTransfer(_that.error);case ReceivingInProgress() when receivingInProgress != null:
return receivingInProgress(_that.progress,_that.offset,_that.totalCount,_that.receivedBoundaries);case DataReceived() when dataReceived != null:
return dataReceived(_that.receivedBoundaries);case FailedDataTransfer() when failedToReceive != null:
return failedToReceive(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class PeerToPeerInitial with DiagnosticableTreeMixin implements PeerToPeerState {
  const PeerToPeerInitial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PeerToPeerState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeerToPeerInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PeerToPeerState.initial()';
}


}




/// @nodoc


class PeerToPeerLoading with DiagnosticableTreeMixin implements PeerToPeerState {
  const PeerToPeerLoading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PeerToPeerState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeerToPeerLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PeerToPeerState.loading()';
}


}




/// @nodoc


class TransferInProgress with DiagnosticableTreeMixin implements PeerToPeerState {
  const TransferInProgress({required this.progress, required this.offset, required this.totalCount});
  

 final  double progress;
 final  int offset;
 final  int totalCount;

/// Create a copy of PeerToPeerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferInProgressCopyWith<TransferInProgress> get copyWith => _$TransferInProgressCopyWithImpl<TransferInProgress>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PeerToPeerState.transferInProgress'))
    ..add(DiagnosticsProperty('progress', progress))..add(DiagnosticsProperty('offset', offset))..add(DiagnosticsProperty('totalCount', totalCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferInProgress&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,progress,offset,totalCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PeerToPeerState.transferInProgress(progress: $progress, offset: $offset, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $TransferInProgressCopyWith<$Res> implements $PeerToPeerStateCopyWith<$Res> {
  factory $TransferInProgressCopyWith(TransferInProgress value, $Res Function(TransferInProgress) _then) = _$TransferInProgressCopyWithImpl;
@useResult
$Res call({
 double progress, int offset, int totalCount
});




}
/// @nodoc
class _$TransferInProgressCopyWithImpl<$Res>
    implements $TransferInProgressCopyWith<$Res> {
  _$TransferInProgressCopyWithImpl(this._self, this._then);

  final TransferInProgress _self;
  final $Res Function(TransferInProgress) _then;

/// Create a copy of PeerToPeerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,Object? offset = null,Object? totalCount = null,}) {
  return _then(TransferInProgress(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class CompletedDataTransfer with DiagnosticableTreeMixin implements PeerToPeerState {
  const CompletedDataTransfer();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PeerToPeerState.completedDataTransfer'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompletedDataTransfer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PeerToPeerState.completedDataTransfer()';
}


}




/// @nodoc


class FailedToTransfer with DiagnosticableTreeMixin implements PeerToPeerState {
  const FailedToTransfer({required this.error});
  

 final  String error;

/// Create a copy of PeerToPeerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailedToTransferCopyWith<FailedToTransfer> get copyWith => _$FailedToTransferCopyWithImpl<FailedToTransfer>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PeerToPeerState.failedToTransfer'))
    ..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailedToTransfer&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PeerToPeerState.failedToTransfer(error: $error)';
}


}

/// @nodoc
abstract mixin class $FailedToTransferCopyWith<$Res> implements $PeerToPeerStateCopyWith<$Res> {
  factory $FailedToTransferCopyWith(FailedToTransfer value, $Res Function(FailedToTransfer) _then) = _$FailedToTransferCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$FailedToTransferCopyWithImpl<$Res>
    implements $FailedToTransferCopyWith<$Res> {
  _$FailedToTransferCopyWithImpl(this._self, this._then);

  final FailedToTransfer _self;
  final $Res Function(FailedToTransfer) _then;

/// Create a copy of PeerToPeerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(FailedToTransfer(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReceivingInProgress with DiagnosticableTreeMixin implements PeerToPeerState {
  const ReceivingInProgress({required this.progress, required this.offset, required this.totalCount, required final  Set<String> receivedBoundaries}): _receivedBoundaries = receivedBoundaries;
  

 final  double progress;
 final  int offset;
 final  int totalCount;
 final  Set<String> _receivedBoundaries;
 Set<String> get receivedBoundaries {
  if (_receivedBoundaries is EqualUnmodifiableSetView) return _receivedBoundaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_receivedBoundaries);
}


/// Create a copy of PeerToPeerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceivingInProgressCopyWith<ReceivingInProgress> get copyWith => _$ReceivingInProgressCopyWithImpl<ReceivingInProgress>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PeerToPeerState.receivingInProgress'))
    ..add(DiagnosticsProperty('progress', progress))..add(DiagnosticsProperty('offset', offset))..add(DiagnosticsProperty('totalCount', totalCount))..add(DiagnosticsProperty('receivedBoundaries', receivedBoundaries));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceivingInProgress&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other._receivedBoundaries, _receivedBoundaries));
}


@override
int get hashCode => Object.hash(runtimeType,progress,offset,totalCount,const DeepCollectionEquality().hash(_receivedBoundaries));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PeerToPeerState.receivingInProgress(progress: $progress, offset: $offset, totalCount: $totalCount, receivedBoundaries: $receivedBoundaries)';
}


}

/// @nodoc
abstract mixin class $ReceivingInProgressCopyWith<$Res> implements $PeerToPeerStateCopyWith<$Res> {
  factory $ReceivingInProgressCopyWith(ReceivingInProgress value, $Res Function(ReceivingInProgress) _then) = _$ReceivingInProgressCopyWithImpl;
@useResult
$Res call({
 double progress, int offset, int totalCount, Set<String> receivedBoundaries
});




}
/// @nodoc
class _$ReceivingInProgressCopyWithImpl<$Res>
    implements $ReceivingInProgressCopyWith<$Res> {
  _$ReceivingInProgressCopyWithImpl(this._self, this._then);

  final ReceivingInProgress _self;
  final $Res Function(ReceivingInProgress) _then;

/// Create a copy of PeerToPeerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,Object? offset = null,Object? totalCount = null,Object? receivedBoundaries = null,}) {
  return _then(ReceivingInProgress(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,receivedBoundaries: null == receivedBoundaries ? _self._receivedBoundaries : receivedBoundaries // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

/// @nodoc


class DataReceived with DiagnosticableTreeMixin implements PeerToPeerState {
  const DataReceived({required final  Set<String> receivedBoundaries}): _receivedBoundaries = receivedBoundaries;
  

 final  Set<String> _receivedBoundaries;
 Set<String> get receivedBoundaries {
  if (_receivedBoundaries is EqualUnmodifiableSetView) return _receivedBoundaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_receivedBoundaries);
}


/// Create a copy of PeerToPeerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataReceivedCopyWith<DataReceived> get copyWith => _$DataReceivedCopyWithImpl<DataReceived>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PeerToPeerState.dataReceived'))
    ..add(DiagnosticsProperty('receivedBoundaries', receivedBoundaries));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataReceived&&const DeepCollectionEquality().equals(other._receivedBoundaries, _receivedBoundaries));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_receivedBoundaries));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PeerToPeerState.dataReceived(receivedBoundaries: $receivedBoundaries)';
}


}

/// @nodoc
abstract mixin class $DataReceivedCopyWith<$Res> implements $PeerToPeerStateCopyWith<$Res> {
  factory $DataReceivedCopyWith(DataReceived value, $Res Function(DataReceived) _then) = _$DataReceivedCopyWithImpl;
@useResult
$Res call({
 Set<String> receivedBoundaries
});




}
/// @nodoc
class _$DataReceivedCopyWithImpl<$Res>
    implements $DataReceivedCopyWith<$Res> {
  _$DataReceivedCopyWithImpl(this._self, this._then);

  final DataReceived _self;
  final $Res Function(DataReceived) _then;

/// Create a copy of PeerToPeerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? receivedBoundaries = null,}) {
  return _then(DataReceived(
receivedBoundaries: null == receivedBoundaries ? _self._receivedBoundaries : receivedBoundaries // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

/// @nodoc


class FailedDataTransfer with DiagnosticableTreeMixin implements PeerToPeerState {
  const FailedDataTransfer({required this.error});
  

 final  String error;

/// Create a copy of PeerToPeerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailedDataTransferCopyWith<FailedDataTransfer> get copyWith => _$FailedDataTransferCopyWithImpl<FailedDataTransfer>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PeerToPeerState.failedToReceive'))
    ..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailedDataTransfer&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PeerToPeerState.failedToReceive(error: $error)';
}


}

/// @nodoc
abstract mixin class $FailedDataTransferCopyWith<$Res> implements $PeerToPeerStateCopyWith<$Res> {
  factory $FailedDataTransferCopyWith(FailedDataTransfer value, $Res Function(FailedDataTransfer) _then) = _$FailedDataTransferCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$FailedDataTransferCopyWithImpl<$Res>
    implements $FailedDataTransferCopyWith<$Res> {
  _$FailedDataTransferCopyWithImpl(this._self, this._then);

  final FailedDataTransfer _self;
  final $Res Function(FailedDataTransfer) _then;

/// Create a copy of PeerToPeerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(FailedDataTransfer(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peer_to_peer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PeerToPeerEvent {
  NearbyService get nearbyService => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            NearbyService nearbyService,
            String selectedProject,
            String selectedBoundaryCode,
            List<Device> connectedDevice)
        dataTransfer,
    required TResult Function(NearbyService nearbyService, dynamic data)
        dataReceiver,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NearbyService nearbyService, String selectedProject,
            String selectedBoundaryCode, List<Device> connectedDevice)?
        dataTransfer,
    TResult? Function(NearbyService nearbyService, dynamic data)? dataReceiver,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NearbyService nearbyService, String selectedProject,
            String selectedBoundaryCode, List<Device> connectedDevice)?
        dataTransfer,
    TResult Function(NearbyService nearbyService, dynamic data)? dataReceiver,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataTransferEvent value) dataTransfer,
    required TResult Function(DataReceiverEvent value) dataReceiver,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataTransferEvent value)? dataTransfer,
    TResult? Function(DataReceiverEvent value)? dataReceiver,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataTransferEvent value)? dataTransfer,
    TResult Function(DataReceiverEvent value)? dataReceiver,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeerToPeerEventCopyWith<PeerToPeerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeerToPeerEventCopyWith<$Res> {
  factory $PeerToPeerEventCopyWith(
          PeerToPeerEvent value, $Res Function(PeerToPeerEvent) then) =
      _$PeerToPeerEventCopyWithImpl<$Res, PeerToPeerEvent>;
  @useResult
  $Res call({NearbyService nearbyService});
}

/// @nodoc
class _$PeerToPeerEventCopyWithImpl<$Res, $Val extends PeerToPeerEvent>
    implements $PeerToPeerEventCopyWith<$Res> {
  _$PeerToPeerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nearbyService = null,
  }) {
    return _then(_value.copyWith(
      nearbyService: null == nearbyService
          ? _value.nearbyService
          : nearbyService // ignore: cast_nullable_to_non_nullable
              as NearbyService,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataTransferEventImplCopyWith<$Res>
    implements $PeerToPeerEventCopyWith<$Res> {
  factory _$$DataTransferEventImplCopyWith(_$DataTransferEventImpl value,
          $Res Function(_$DataTransferEventImpl) then) =
      __$$DataTransferEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NearbyService nearbyService,
      String selectedProject,
      String selectedBoundaryCode,
      List<Device> connectedDevice});
}

/// @nodoc
class __$$DataTransferEventImplCopyWithImpl<$Res>
    extends _$PeerToPeerEventCopyWithImpl<$Res, _$DataTransferEventImpl>
    implements _$$DataTransferEventImplCopyWith<$Res> {
  __$$DataTransferEventImplCopyWithImpl(_$DataTransferEventImpl _value,
      $Res Function(_$DataTransferEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nearbyService = null,
    Object? selectedProject = null,
    Object? selectedBoundaryCode = null,
    Object? connectedDevice = null,
  }) {
    return _then(_$DataTransferEventImpl(
      nearbyService: null == nearbyService
          ? _value.nearbyService
          : nearbyService // ignore: cast_nullable_to_non_nullable
              as NearbyService,
      selectedProject: null == selectedProject
          ? _value.selectedProject
          : selectedProject // ignore: cast_nullable_to_non_nullable
              as String,
      selectedBoundaryCode: null == selectedBoundaryCode
          ? _value.selectedBoundaryCode
          : selectedBoundaryCode // ignore: cast_nullable_to_non_nullable
              as String,
      connectedDevice: null == connectedDevice
          ? _value._connectedDevice
          : connectedDevice // ignore: cast_nullable_to_non_nullable
              as List<Device>,
    ));
  }
}

/// @nodoc

class _$DataTransferEventImpl
    with DiagnosticableTreeMixin
    implements DataTransferEvent {
  const _$DataTransferEventImpl(
      {required this.nearbyService,
      required this.selectedProject,
      required this.selectedBoundaryCode,
      required final List<Device> connectedDevice})
      : _connectedDevice = connectedDevice;

  @override
  final NearbyService nearbyService;
  @override
  final String selectedProject;
  @override
  final String selectedBoundaryCode;
  final List<Device> _connectedDevice;
  @override
  List<Device> get connectedDevice {
    if (_connectedDevice is EqualUnmodifiableListView) return _connectedDevice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_connectedDevice);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PeerToPeerEvent.dataTransfer(nearbyService: $nearbyService, selectedProject: $selectedProject, selectedBoundaryCode: $selectedBoundaryCode, connectedDevice: $connectedDevice)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PeerToPeerEvent.dataTransfer'))
      ..add(DiagnosticsProperty('nearbyService', nearbyService))
      ..add(DiagnosticsProperty('selectedProject', selectedProject))
      ..add(DiagnosticsProperty('selectedBoundaryCode', selectedBoundaryCode))
      ..add(DiagnosticsProperty('connectedDevice', connectedDevice));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataTransferEventImpl &&
            (identical(other.nearbyService, nearbyService) ||
                other.nearbyService == nearbyService) &&
            (identical(other.selectedProject, selectedProject) ||
                other.selectedProject == selectedProject) &&
            (identical(other.selectedBoundaryCode, selectedBoundaryCode) ||
                other.selectedBoundaryCode == selectedBoundaryCode) &&
            const DeepCollectionEquality()
                .equals(other._connectedDevice, _connectedDevice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      nearbyService,
      selectedProject,
      selectedBoundaryCode,
      const DeepCollectionEquality().hash(_connectedDevice));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataTransferEventImplCopyWith<_$DataTransferEventImpl> get copyWith =>
      __$$DataTransferEventImplCopyWithImpl<_$DataTransferEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            NearbyService nearbyService,
            String selectedProject,
            String selectedBoundaryCode,
            List<Device> connectedDevice)
        dataTransfer,
    required TResult Function(NearbyService nearbyService, dynamic data)
        dataReceiver,
  }) {
    return dataTransfer(
        nearbyService, selectedProject, selectedBoundaryCode, connectedDevice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NearbyService nearbyService, String selectedProject,
            String selectedBoundaryCode, List<Device> connectedDevice)?
        dataTransfer,
    TResult? Function(NearbyService nearbyService, dynamic data)? dataReceiver,
  }) {
    return dataTransfer?.call(
        nearbyService, selectedProject, selectedBoundaryCode, connectedDevice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NearbyService nearbyService, String selectedProject,
            String selectedBoundaryCode, List<Device> connectedDevice)?
        dataTransfer,
    TResult Function(NearbyService nearbyService, dynamic data)? dataReceiver,
    required TResult orElse(),
  }) {
    if (dataTransfer != null) {
      return dataTransfer(nearbyService, selectedProject, selectedBoundaryCode,
          connectedDevice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataTransferEvent value) dataTransfer,
    required TResult Function(DataReceiverEvent value) dataReceiver,
  }) {
    return dataTransfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataTransferEvent value)? dataTransfer,
    TResult? Function(DataReceiverEvent value)? dataReceiver,
  }) {
    return dataTransfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataTransferEvent value)? dataTransfer,
    TResult Function(DataReceiverEvent value)? dataReceiver,
    required TResult orElse(),
  }) {
    if (dataTransfer != null) {
      return dataTransfer(this);
    }
    return orElse();
  }
}

abstract class DataTransferEvent implements PeerToPeerEvent {
  const factory DataTransferEvent(
      {required final NearbyService nearbyService,
      required final String selectedProject,
      required final String selectedBoundaryCode,
      required final List<Device> connectedDevice}) = _$DataTransferEventImpl;

  @override
  NearbyService get nearbyService;
  String get selectedProject;
  String get selectedBoundaryCode;
  List<Device> get connectedDevice;
  @override
  @JsonKey(ignore: true)
  _$$DataTransferEventImplCopyWith<_$DataTransferEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataReceiverEventImplCopyWith<$Res>
    implements $PeerToPeerEventCopyWith<$Res> {
  factory _$$DataReceiverEventImplCopyWith(_$DataReceiverEventImpl value,
          $Res Function(_$DataReceiverEventImpl) then) =
      __$$DataReceiverEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NearbyService nearbyService, dynamic data});
}

/// @nodoc
class __$$DataReceiverEventImplCopyWithImpl<$Res>
    extends _$PeerToPeerEventCopyWithImpl<$Res, _$DataReceiverEventImpl>
    implements _$$DataReceiverEventImplCopyWith<$Res> {
  __$$DataReceiverEventImplCopyWithImpl(_$DataReceiverEventImpl _value,
      $Res Function(_$DataReceiverEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nearbyService = null,
    Object? data = freezed,
  }) {
    return _then(_$DataReceiverEventImpl(
      nearbyService: null == nearbyService
          ? _value.nearbyService
          : nearbyService // ignore: cast_nullable_to_non_nullable
              as NearbyService,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$DataReceiverEventImpl
    with DiagnosticableTreeMixin
    implements DataReceiverEvent {
  const _$DataReceiverEventImpl(
      {required this.nearbyService, required this.data});

  @override
  final NearbyService nearbyService;
  @override
  final dynamic data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PeerToPeerEvent.dataReceiver(nearbyService: $nearbyService, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PeerToPeerEvent.dataReceiver'))
      ..add(DiagnosticsProperty('nearbyService', nearbyService))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataReceiverEventImpl &&
            (identical(other.nearbyService, nearbyService) ||
                other.nearbyService == nearbyService) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, nearbyService, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataReceiverEventImplCopyWith<_$DataReceiverEventImpl> get copyWith =>
      __$$DataReceiverEventImplCopyWithImpl<_$DataReceiverEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            NearbyService nearbyService,
            String selectedProject,
            String selectedBoundaryCode,
            List<Device> connectedDevice)
        dataTransfer,
    required TResult Function(NearbyService nearbyService, dynamic data)
        dataReceiver,
  }) {
    return dataReceiver(nearbyService, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NearbyService nearbyService, String selectedProject,
            String selectedBoundaryCode, List<Device> connectedDevice)?
        dataTransfer,
    TResult? Function(NearbyService nearbyService, dynamic data)? dataReceiver,
  }) {
    return dataReceiver?.call(nearbyService, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NearbyService nearbyService, String selectedProject,
            String selectedBoundaryCode, List<Device> connectedDevice)?
        dataTransfer,
    TResult Function(NearbyService nearbyService, dynamic data)? dataReceiver,
    required TResult orElse(),
  }) {
    if (dataReceiver != null) {
      return dataReceiver(nearbyService, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataTransferEvent value) dataTransfer,
    required TResult Function(DataReceiverEvent value) dataReceiver,
  }) {
    return dataReceiver(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataTransferEvent value)? dataTransfer,
    TResult? Function(DataReceiverEvent value)? dataReceiver,
  }) {
    return dataReceiver?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataTransferEvent value)? dataTransfer,
    TResult Function(DataReceiverEvent value)? dataReceiver,
    required TResult orElse(),
  }) {
    if (dataReceiver != null) {
      return dataReceiver(this);
    }
    return orElse();
  }
}

abstract class DataReceiverEvent implements PeerToPeerEvent {
  const factory DataReceiverEvent(
      {required final NearbyService nearbyService,
      required final dynamic data}) = _$DataReceiverEventImpl;

  @override
  NearbyService get nearbyService;
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$DataReceiverEventImplCopyWith<_$DataReceiverEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PeerToPeerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(double progress, int offset, int totalCount)
        transferInProgress,
    required TResult Function() completedDataTransfer,
    required TResult Function(String error) failedToTransfer,
    required TResult Function(double progress, int offset, int totalCount)
        receivingInProgress,
    required TResult Function() dataReceived,
    required TResult Function(String error) failedToReceive,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult? Function()? completedDataTransfer,
    TResult? Function(String error)? failedToTransfer,
    TResult? Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult? Function()? dataReceived,
    TResult? Function(String error)? failedToReceive,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult Function()? completedDataTransfer,
    TResult Function(String error)? failedToTransfer,
    TResult Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult Function()? dataReceived,
    TResult Function(String error)? failedToReceive,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PeerToPeerInitial value) initial,
    required TResult Function(PeerToPeerLoading value) loading,
    required TResult Function(TransferInProgress value) transferInProgress,
    required TResult Function(CompletedDataTransfer value)
        completedDataTransfer,
    required TResult Function(FailedToTransfer value) failedToTransfer,
    required TResult Function(ReceivingInProgress value) receivingInProgress,
    required TResult Function(DataReceived value) dataReceived,
    required TResult Function(FailedDataTransfer value) failedToReceive,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PeerToPeerInitial value)? initial,
    TResult? Function(PeerToPeerLoading value)? loading,
    TResult? Function(TransferInProgress value)? transferInProgress,
    TResult? Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult? Function(FailedToTransfer value)? failedToTransfer,
    TResult? Function(ReceivingInProgress value)? receivingInProgress,
    TResult? Function(DataReceived value)? dataReceived,
    TResult? Function(FailedDataTransfer value)? failedToReceive,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PeerToPeerInitial value)? initial,
    TResult Function(PeerToPeerLoading value)? loading,
    TResult Function(TransferInProgress value)? transferInProgress,
    TResult Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult Function(FailedToTransfer value)? failedToTransfer,
    TResult Function(ReceivingInProgress value)? receivingInProgress,
    TResult Function(DataReceived value)? dataReceived,
    TResult Function(FailedDataTransfer value)? failedToReceive,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeerToPeerStateCopyWith<$Res> {
  factory $PeerToPeerStateCopyWith(
          PeerToPeerState value, $Res Function(PeerToPeerState) then) =
      _$PeerToPeerStateCopyWithImpl<$Res, PeerToPeerState>;
}

/// @nodoc
class _$PeerToPeerStateCopyWithImpl<$Res, $Val extends PeerToPeerState>
    implements $PeerToPeerStateCopyWith<$Res> {
  _$PeerToPeerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PeerToPeerInitialImplCopyWith<$Res> {
  factory _$$PeerToPeerInitialImplCopyWith(_$PeerToPeerInitialImpl value,
          $Res Function(_$PeerToPeerInitialImpl) then) =
      __$$PeerToPeerInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PeerToPeerInitialImplCopyWithImpl<$Res>
    extends _$PeerToPeerStateCopyWithImpl<$Res, _$PeerToPeerInitialImpl>
    implements _$$PeerToPeerInitialImplCopyWith<$Res> {
  __$$PeerToPeerInitialImplCopyWithImpl(_$PeerToPeerInitialImpl _value,
      $Res Function(_$PeerToPeerInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PeerToPeerInitialImpl
    with DiagnosticableTreeMixin
    implements PeerToPeerInitial {
  const _$PeerToPeerInitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PeerToPeerState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PeerToPeerState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PeerToPeerInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(double progress, int offset, int totalCount)
        transferInProgress,
    required TResult Function() completedDataTransfer,
    required TResult Function(String error) failedToTransfer,
    required TResult Function(double progress, int offset, int totalCount)
        receivingInProgress,
    required TResult Function() dataReceived,
    required TResult Function(String error) failedToReceive,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult? Function()? completedDataTransfer,
    TResult? Function(String error)? failedToTransfer,
    TResult? Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult? Function()? dataReceived,
    TResult? Function(String error)? failedToReceive,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult Function()? completedDataTransfer,
    TResult Function(String error)? failedToTransfer,
    TResult Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult Function()? dataReceived,
    TResult Function(String error)? failedToReceive,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PeerToPeerInitial value) initial,
    required TResult Function(PeerToPeerLoading value) loading,
    required TResult Function(TransferInProgress value) transferInProgress,
    required TResult Function(CompletedDataTransfer value)
        completedDataTransfer,
    required TResult Function(FailedToTransfer value) failedToTransfer,
    required TResult Function(ReceivingInProgress value) receivingInProgress,
    required TResult Function(DataReceived value) dataReceived,
    required TResult Function(FailedDataTransfer value) failedToReceive,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PeerToPeerInitial value)? initial,
    TResult? Function(PeerToPeerLoading value)? loading,
    TResult? Function(TransferInProgress value)? transferInProgress,
    TResult? Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult? Function(FailedToTransfer value)? failedToTransfer,
    TResult? Function(ReceivingInProgress value)? receivingInProgress,
    TResult? Function(DataReceived value)? dataReceived,
    TResult? Function(FailedDataTransfer value)? failedToReceive,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PeerToPeerInitial value)? initial,
    TResult Function(PeerToPeerLoading value)? loading,
    TResult Function(TransferInProgress value)? transferInProgress,
    TResult Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult Function(FailedToTransfer value)? failedToTransfer,
    TResult Function(ReceivingInProgress value)? receivingInProgress,
    TResult Function(DataReceived value)? dataReceived,
    TResult Function(FailedDataTransfer value)? failedToReceive,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PeerToPeerInitial implements PeerToPeerState {
  const factory PeerToPeerInitial() = _$PeerToPeerInitialImpl;
}

/// @nodoc
abstract class _$$PeerToPeerLoadingImplCopyWith<$Res> {
  factory _$$PeerToPeerLoadingImplCopyWith(_$PeerToPeerLoadingImpl value,
          $Res Function(_$PeerToPeerLoadingImpl) then) =
      __$$PeerToPeerLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PeerToPeerLoadingImplCopyWithImpl<$Res>
    extends _$PeerToPeerStateCopyWithImpl<$Res, _$PeerToPeerLoadingImpl>
    implements _$$PeerToPeerLoadingImplCopyWith<$Res> {
  __$$PeerToPeerLoadingImplCopyWithImpl(_$PeerToPeerLoadingImpl _value,
      $Res Function(_$PeerToPeerLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PeerToPeerLoadingImpl
    with DiagnosticableTreeMixin
    implements PeerToPeerLoading {
  const _$PeerToPeerLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PeerToPeerState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PeerToPeerState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PeerToPeerLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(double progress, int offset, int totalCount)
        transferInProgress,
    required TResult Function() completedDataTransfer,
    required TResult Function(String error) failedToTransfer,
    required TResult Function(double progress, int offset, int totalCount)
        receivingInProgress,
    required TResult Function() dataReceived,
    required TResult Function(String error) failedToReceive,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult? Function()? completedDataTransfer,
    TResult? Function(String error)? failedToTransfer,
    TResult? Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult? Function()? dataReceived,
    TResult? Function(String error)? failedToReceive,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult Function()? completedDataTransfer,
    TResult Function(String error)? failedToTransfer,
    TResult Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult Function()? dataReceived,
    TResult Function(String error)? failedToReceive,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PeerToPeerInitial value) initial,
    required TResult Function(PeerToPeerLoading value) loading,
    required TResult Function(TransferInProgress value) transferInProgress,
    required TResult Function(CompletedDataTransfer value)
        completedDataTransfer,
    required TResult Function(FailedToTransfer value) failedToTransfer,
    required TResult Function(ReceivingInProgress value) receivingInProgress,
    required TResult Function(DataReceived value) dataReceived,
    required TResult Function(FailedDataTransfer value) failedToReceive,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PeerToPeerInitial value)? initial,
    TResult? Function(PeerToPeerLoading value)? loading,
    TResult? Function(TransferInProgress value)? transferInProgress,
    TResult? Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult? Function(FailedToTransfer value)? failedToTransfer,
    TResult? Function(ReceivingInProgress value)? receivingInProgress,
    TResult? Function(DataReceived value)? dataReceived,
    TResult? Function(FailedDataTransfer value)? failedToReceive,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PeerToPeerInitial value)? initial,
    TResult Function(PeerToPeerLoading value)? loading,
    TResult Function(TransferInProgress value)? transferInProgress,
    TResult Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult Function(FailedToTransfer value)? failedToTransfer,
    TResult Function(ReceivingInProgress value)? receivingInProgress,
    TResult Function(DataReceived value)? dataReceived,
    TResult Function(FailedDataTransfer value)? failedToReceive,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PeerToPeerLoading implements PeerToPeerState {
  const factory PeerToPeerLoading() = _$PeerToPeerLoadingImpl;
}

/// @nodoc
abstract class _$$TransferInProgressImplCopyWith<$Res> {
  factory _$$TransferInProgressImplCopyWith(_$TransferInProgressImpl value,
          $Res Function(_$TransferInProgressImpl) then) =
      __$$TransferInProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double progress, int offset, int totalCount});
}

/// @nodoc
class __$$TransferInProgressImplCopyWithImpl<$Res>
    extends _$PeerToPeerStateCopyWithImpl<$Res, _$TransferInProgressImpl>
    implements _$$TransferInProgressImplCopyWith<$Res> {
  __$$TransferInProgressImplCopyWithImpl(_$TransferInProgressImpl _value,
      $Res Function(_$TransferInProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? offset = null,
    Object? totalCount = null,
  }) {
    return _then(_$TransferInProgressImpl(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TransferInProgressImpl
    with DiagnosticableTreeMixin
    implements TransferInProgress {
  const _$TransferInProgressImpl(
      {required this.progress, required this.offset, required this.totalCount});

  @override
  final double progress;
  @override
  final int offset;
  @override
  final int totalCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PeerToPeerState.transferInProgress(progress: $progress, offset: $offset, totalCount: $totalCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PeerToPeerState.transferInProgress'))
      ..add(DiagnosticsProperty('progress', progress))
      ..add(DiagnosticsProperty('offset', offset))
      ..add(DiagnosticsProperty('totalCount', totalCount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferInProgressImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress, offset, totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferInProgressImplCopyWith<_$TransferInProgressImpl> get copyWith =>
      __$$TransferInProgressImplCopyWithImpl<_$TransferInProgressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(double progress, int offset, int totalCount)
        transferInProgress,
    required TResult Function() completedDataTransfer,
    required TResult Function(String error) failedToTransfer,
    required TResult Function(double progress, int offset, int totalCount)
        receivingInProgress,
    required TResult Function() dataReceived,
    required TResult Function(String error) failedToReceive,
  }) {
    return transferInProgress(progress, offset, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult? Function()? completedDataTransfer,
    TResult? Function(String error)? failedToTransfer,
    TResult? Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult? Function()? dataReceived,
    TResult? Function(String error)? failedToReceive,
  }) {
    return transferInProgress?.call(progress, offset, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult Function()? completedDataTransfer,
    TResult Function(String error)? failedToTransfer,
    TResult Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult Function()? dataReceived,
    TResult Function(String error)? failedToReceive,
    required TResult orElse(),
  }) {
    if (transferInProgress != null) {
      return transferInProgress(progress, offset, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PeerToPeerInitial value) initial,
    required TResult Function(PeerToPeerLoading value) loading,
    required TResult Function(TransferInProgress value) transferInProgress,
    required TResult Function(CompletedDataTransfer value)
        completedDataTransfer,
    required TResult Function(FailedToTransfer value) failedToTransfer,
    required TResult Function(ReceivingInProgress value) receivingInProgress,
    required TResult Function(DataReceived value) dataReceived,
    required TResult Function(FailedDataTransfer value) failedToReceive,
  }) {
    return transferInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PeerToPeerInitial value)? initial,
    TResult? Function(PeerToPeerLoading value)? loading,
    TResult? Function(TransferInProgress value)? transferInProgress,
    TResult? Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult? Function(FailedToTransfer value)? failedToTransfer,
    TResult? Function(ReceivingInProgress value)? receivingInProgress,
    TResult? Function(DataReceived value)? dataReceived,
    TResult? Function(FailedDataTransfer value)? failedToReceive,
  }) {
    return transferInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PeerToPeerInitial value)? initial,
    TResult Function(PeerToPeerLoading value)? loading,
    TResult Function(TransferInProgress value)? transferInProgress,
    TResult Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult Function(FailedToTransfer value)? failedToTransfer,
    TResult Function(ReceivingInProgress value)? receivingInProgress,
    TResult Function(DataReceived value)? dataReceived,
    TResult Function(FailedDataTransfer value)? failedToReceive,
    required TResult orElse(),
  }) {
    if (transferInProgress != null) {
      return transferInProgress(this);
    }
    return orElse();
  }
}

abstract class TransferInProgress implements PeerToPeerState {
  const factory TransferInProgress(
      {required final double progress,
      required final int offset,
      required final int totalCount}) = _$TransferInProgressImpl;

  double get progress;
  int get offset;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$TransferInProgressImplCopyWith<_$TransferInProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompletedDataTransferImplCopyWith<$Res> {
  factory _$$CompletedDataTransferImplCopyWith(
          _$CompletedDataTransferImpl value,
          $Res Function(_$CompletedDataTransferImpl) then) =
      __$$CompletedDataTransferImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompletedDataTransferImplCopyWithImpl<$Res>
    extends _$PeerToPeerStateCopyWithImpl<$Res, _$CompletedDataTransferImpl>
    implements _$$CompletedDataTransferImplCopyWith<$Res> {
  __$$CompletedDataTransferImplCopyWithImpl(_$CompletedDataTransferImpl _value,
      $Res Function(_$CompletedDataTransferImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CompletedDataTransferImpl
    with DiagnosticableTreeMixin
    implements CompletedDataTransfer {
  const _$CompletedDataTransferImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PeerToPeerState.completedDataTransfer()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'PeerToPeerState.completedDataTransfer'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletedDataTransferImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(double progress, int offset, int totalCount)
        transferInProgress,
    required TResult Function() completedDataTransfer,
    required TResult Function(String error) failedToTransfer,
    required TResult Function(double progress, int offset, int totalCount)
        receivingInProgress,
    required TResult Function() dataReceived,
    required TResult Function(String error) failedToReceive,
  }) {
    return completedDataTransfer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult? Function()? completedDataTransfer,
    TResult? Function(String error)? failedToTransfer,
    TResult? Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult? Function()? dataReceived,
    TResult? Function(String error)? failedToReceive,
  }) {
    return completedDataTransfer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult Function()? completedDataTransfer,
    TResult Function(String error)? failedToTransfer,
    TResult Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult Function()? dataReceived,
    TResult Function(String error)? failedToReceive,
    required TResult orElse(),
  }) {
    if (completedDataTransfer != null) {
      return completedDataTransfer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PeerToPeerInitial value) initial,
    required TResult Function(PeerToPeerLoading value) loading,
    required TResult Function(TransferInProgress value) transferInProgress,
    required TResult Function(CompletedDataTransfer value)
        completedDataTransfer,
    required TResult Function(FailedToTransfer value) failedToTransfer,
    required TResult Function(ReceivingInProgress value) receivingInProgress,
    required TResult Function(DataReceived value) dataReceived,
    required TResult Function(FailedDataTransfer value) failedToReceive,
  }) {
    return completedDataTransfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PeerToPeerInitial value)? initial,
    TResult? Function(PeerToPeerLoading value)? loading,
    TResult? Function(TransferInProgress value)? transferInProgress,
    TResult? Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult? Function(FailedToTransfer value)? failedToTransfer,
    TResult? Function(ReceivingInProgress value)? receivingInProgress,
    TResult? Function(DataReceived value)? dataReceived,
    TResult? Function(FailedDataTransfer value)? failedToReceive,
  }) {
    return completedDataTransfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PeerToPeerInitial value)? initial,
    TResult Function(PeerToPeerLoading value)? loading,
    TResult Function(TransferInProgress value)? transferInProgress,
    TResult Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult Function(FailedToTransfer value)? failedToTransfer,
    TResult Function(ReceivingInProgress value)? receivingInProgress,
    TResult Function(DataReceived value)? dataReceived,
    TResult Function(FailedDataTransfer value)? failedToReceive,
    required TResult orElse(),
  }) {
    if (completedDataTransfer != null) {
      return completedDataTransfer(this);
    }
    return orElse();
  }
}

abstract class CompletedDataTransfer implements PeerToPeerState {
  const factory CompletedDataTransfer() = _$CompletedDataTransferImpl;
}

/// @nodoc
abstract class _$$FailedToTransferImplCopyWith<$Res> {
  factory _$$FailedToTransferImplCopyWith(_$FailedToTransferImpl value,
          $Res Function(_$FailedToTransferImpl) then) =
      __$$FailedToTransferImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FailedToTransferImplCopyWithImpl<$Res>
    extends _$PeerToPeerStateCopyWithImpl<$Res, _$FailedToTransferImpl>
    implements _$$FailedToTransferImplCopyWith<$Res> {
  __$$FailedToTransferImplCopyWithImpl(_$FailedToTransferImpl _value,
      $Res Function(_$FailedToTransferImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FailedToTransferImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailedToTransferImpl
    with DiagnosticableTreeMixin
    implements FailedToTransfer {
  const _$FailedToTransferImpl({required this.error});

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PeerToPeerState.failedToTransfer(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PeerToPeerState.failedToTransfer'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedToTransferImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedToTransferImplCopyWith<_$FailedToTransferImpl> get copyWith =>
      __$$FailedToTransferImplCopyWithImpl<_$FailedToTransferImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(double progress, int offset, int totalCount)
        transferInProgress,
    required TResult Function() completedDataTransfer,
    required TResult Function(String error) failedToTransfer,
    required TResult Function(double progress, int offset, int totalCount)
        receivingInProgress,
    required TResult Function() dataReceived,
    required TResult Function(String error) failedToReceive,
  }) {
    return failedToTransfer(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult? Function()? completedDataTransfer,
    TResult? Function(String error)? failedToTransfer,
    TResult? Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult? Function()? dataReceived,
    TResult? Function(String error)? failedToReceive,
  }) {
    return failedToTransfer?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult Function()? completedDataTransfer,
    TResult Function(String error)? failedToTransfer,
    TResult Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult Function()? dataReceived,
    TResult Function(String error)? failedToReceive,
    required TResult orElse(),
  }) {
    if (failedToTransfer != null) {
      return failedToTransfer(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PeerToPeerInitial value) initial,
    required TResult Function(PeerToPeerLoading value) loading,
    required TResult Function(TransferInProgress value) transferInProgress,
    required TResult Function(CompletedDataTransfer value)
        completedDataTransfer,
    required TResult Function(FailedToTransfer value) failedToTransfer,
    required TResult Function(ReceivingInProgress value) receivingInProgress,
    required TResult Function(DataReceived value) dataReceived,
    required TResult Function(FailedDataTransfer value) failedToReceive,
  }) {
    return failedToTransfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PeerToPeerInitial value)? initial,
    TResult? Function(PeerToPeerLoading value)? loading,
    TResult? Function(TransferInProgress value)? transferInProgress,
    TResult? Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult? Function(FailedToTransfer value)? failedToTransfer,
    TResult? Function(ReceivingInProgress value)? receivingInProgress,
    TResult? Function(DataReceived value)? dataReceived,
    TResult? Function(FailedDataTransfer value)? failedToReceive,
  }) {
    return failedToTransfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PeerToPeerInitial value)? initial,
    TResult Function(PeerToPeerLoading value)? loading,
    TResult Function(TransferInProgress value)? transferInProgress,
    TResult Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult Function(FailedToTransfer value)? failedToTransfer,
    TResult Function(ReceivingInProgress value)? receivingInProgress,
    TResult Function(DataReceived value)? dataReceived,
    TResult Function(FailedDataTransfer value)? failedToReceive,
    required TResult orElse(),
  }) {
    if (failedToTransfer != null) {
      return failedToTransfer(this);
    }
    return orElse();
  }
}

abstract class FailedToTransfer implements PeerToPeerState {
  const factory FailedToTransfer({required final String error}) =
      _$FailedToTransferImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$FailedToTransferImplCopyWith<_$FailedToTransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceivingInProgressImplCopyWith<$Res> {
  factory _$$ReceivingInProgressImplCopyWith(_$ReceivingInProgressImpl value,
          $Res Function(_$ReceivingInProgressImpl) then) =
      __$$ReceivingInProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double progress, int offset, int totalCount});
}

/// @nodoc
class __$$ReceivingInProgressImplCopyWithImpl<$Res>
    extends _$PeerToPeerStateCopyWithImpl<$Res, _$ReceivingInProgressImpl>
    implements _$$ReceivingInProgressImplCopyWith<$Res> {
  __$$ReceivingInProgressImplCopyWithImpl(_$ReceivingInProgressImpl _value,
      $Res Function(_$ReceivingInProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? offset = null,
    Object? totalCount = null,
  }) {
    return _then(_$ReceivingInProgressImpl(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReceivingInProgressImpl
    with DiagnosticableTreeMixin
    implements ReceivingInProgress {
  const _$ReceivingInProgressImpl(
      {required this.progress, required this.offset, required this.totalCount});

  @override
  final double progress;
  @override
  final int offset;
  @override
  final int totalCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PeerToPeerState.receivingInProgress(progress: $progress, offset: $offset, totalCount: $totalCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PeerToPeerState.receivingInProgress'))
      ..add(DiagnosticsProperty('progress', progress))
      ..add(DiagnosticsProperty('offset', offset))
      ..add(DiagnosticsProperty('totalCount', totalCount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceivingInProgressImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress, offset, totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceivingInProgressImplCopyWith<_$ReceivingInProgressImpl> get copyWith =>
      __$$ReceivingInProgressImplCopyWithImpl<_$ReceivingInProgressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(double progress, int offset, int totalCount)
        transferInProgress,
    required TResult Function() completedDataTransfer,
    required TResult Function(String error) failedToTransfer,
    required TResult Function(double progress, int offset, int totalCount)
        receivingInProgress,
    required TResult Function() dataReceived,
    required TResult Function(String error) failedToReceive,
  }) {
    return receivingInProgress(progress, offset, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult? Function()? completedDataTransfer,
    TResult? Function(String error)? failedToTransfer,
    TResult? Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult? Function()? dataReceived,
    TResult? Function(String error)? failedToReceive,
  }) {
    return receivingInProgress?.call(progress, offset, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult Function()? completedDataTransfer,
    TResult Function(String error)? failedToTransfer,
    TResult Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult Function()? dataReceived,
    TResult Function(String error)? failedToReceive,
    required TResult orElse(),
  }) {
    if (receivingInProgress != null) {
      return receivingInProgress(progress, offset, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PeerToPeerInitial value) initial,
    required TResult Function(PeerToPeerLoading value) loading,
    required TResult Function(TransferInProgress value) transferInProgress,
    required TResult Function(CompletedDataTransfer value)
        completedDataTransfer,
    required TResult Function(FailedToTransfer value) failedToTransfer,
    required TResult Function(ReceivingInProgress value) receivingInProgress,
    required TResult Function(DataReceived value) dataReceived,
    required TResult Function(FailedDataTransfer value) failedToReceive,
  }) {
    return receivingInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PeerToPeerInitial value)? initial,
    TResult? Function(PeerToPeerLoading value)? loading,
    TResult? Function(TransferInProgress value)? transferInProgress,
    TResult? Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult? Function(FailedToTransfer value)? failedToTransfer,
    TResult? Function(ReceivingInProgress value)? receivingInProgress,
    TResult? Function(DataReceived value)? dataReceived,
    TResult? Function(FailedDataTransfer value)? failedToReceive,
  }) {
    return receivingInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PeerToPeerInitial value)? initial,
    TResult Function(PeerToPeerLoading value)? loading,
    TResult Function(TransferInProgress value)? transferInProgress,
    TResult Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult Function(FailedToTransfer value)? failedToTransfer,
    TResult Function(ReceivingInProgress value)? receivingInProgress,
    TResult Function(DataReceived value)? dataReceived,
    TResult Function(FailedDataTransfer value)? failedToReceive,
    required TResult orElse(),
  }) {
    if (receivingInProgress != null) {
      return receivingInProgress(this);
    }
    return orElse();
  }
}

abstract class ReceivingInProgress implements PeerToPeerState {
  const factory ReceivingInProgress(
      {required final double progress,
      required final int offset,
      required final int totalCount}) = _$ReceivingInProgressImpl;

  double get progress;
  int get offset;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$ReceivingInProgressImplCopyWith<_$ReceivingInProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataReceivedImplCopyWith<$Res> {
  factory _$$DataReceivedImplCopyWith(
          _$DataReceivedImpl value, $Res Function(_$DataReceivedImpl) then) =
      __$$DataReceivedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DataReceivedImplCopyWithImpl<$Res>
    extends _$PeerToPeerStateCopyWithImpl<$Res, _$DataReceivedImpl>
    implements _$$DataReceivedImplCopyWith<$Res> {
  __$$DataReceivedImplCopyWithImpl(
      _$DataReceivedImpl _value, $Res Function(_$DataReceivedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DataReceivedImpl with DiagnosticableTreeMixin implements DataReceived {
  const _$DataReceivedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PeerToPeerState.dataReceived()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PeerToPeerState.dataReceived'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DataReceivedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(double progress, int offset, int totalCount)
        transferInProgress,
    required TResult Function() completedDataTransfer,
    required TResult Function(String error) failedToTransfer,
    required TResult Function(double progress, int offset, int totalCount)
        receivingInProgress,
    required TResult Function() dataReceived,
    required TResult Function(String error) failedToReceive,
  }) {
    return dataReceived();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult? Function()? completedDataTransfer,
    TResult? Function(String error)? failedToTransfer,
    TResult? Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult? Function()? dataReceived,
    TResult? Function(String error)? failedToReceive,
  }) {
    return dataReceived?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult Function()? completedDataTransfer,
    TResult Function(String error)? failedToTransfer,
    TResult Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult Function()? dataReceived,
    TResult Function(String error)? failedToReceive,
    required TResult orElse(),
  }) {
    if (dataReceived != null) {
      return dataReceived();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PeerToPeerInitial value) initial,
    required TResult Function(PeerToPeerLoading value) loading,
    required TResult Function(TransferInProgress value) transferInProgress,
    required TResult Function(CompletedDataTransfer value)
        completedDataTransfer,
    required TResult Function(FailedToTransfer value) failedToTransfer,
    required TResult Function(ReceivingInProgress value) receivingInProgress,
    required TResult Function(DataReceived value) dataReceived,
    required TResult Function(FailedDataTransfer value) failedToReceive,
  }) {
    return dataReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PeerToPeerInitial value)? initial,
    TResult? Function(PeerToPeerLoading value)? loading,
    TResult? Function(TransferInProgress value)? transferInProgress,
    TResult? Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult? Function(FailedToTransfer value)? failedToTransfer,
    TResult? Function(ReceivingInProgress value)? receivingInProgress,
    TResult? Function(DataReceived value)? dataReceived,
    TResult? Function(FailedDataTransfer value)? failedToReceive,
  }) {
    return dataReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PeerToPeerInitial value)? initial,
    TResult Function(PeerToPeerLoading value)? loading,
    TResult Function(TransferInProgress value)? transferInProgress,
    TResult Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult Function(FailedToTransfer value)? failedToTransfer,
    TResult Function(ReceivingInProgress value)? receivingInProgress,
    TResult Function(DataReceived value)? dataReceived,
    TResult Function(FailedDataTransfer value)? failedToReceive,
    required TResult orElse(),
  }) {
    if (dataReceived != null) {
      return dataReceived(this);
    }
    return orElse();
  }
}

abstract class DataReceived implements PeerToPeerState {
  const factory DataReceived() = _$DataReceivedImpl;
}

/// @nodoc
abstract class _$$FailedDataTransferImplCopyWith<$Res> {
  factory _$$FailedDataTransferImplCopyWith(_$FailedDataTransferImpl value,
          $Res Function(_$FailedDataTransferImpl) then) =
      __$$FailedDataTransferImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FailedDataTransferImplCopyWithImpl<$Res>
    extends _$PeerToPeerStateCopyWithImpl<$Res, _$FailedDataTransferImpl>
    implements _$$FailedDataTransferImplCopyWith<$Res> {
  __$$FailedDataTransferImplCopyWithImpl(_$FailedDataTransferImpl _value,
      $Res Function(_$FailedDataTransferImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FailedDataTransferImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailedDataTransferImpl
    with DiagnosticableTreeMixin
    implements FailedDataTransfer {
  const _$FailedDataTransferImpl({required this.error});

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PeerToPeerState.failedToReceive(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PeerToPeerState.failedToReceive'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedDataTransferImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedDataTransferImplCopyWith<_$FailedDataTransferImpl> get copyWith =>
      __$$FailedDataTransferImplCopyWithImpl<_$FailedDataTransferImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(double progress, int offset, int totalCount)
        transferInProgress,
    required TResult Function() completedDataTransfer,
    required TResult Function(String error) failedToTransfer,
    required TResult Function(double progress, int offset, int totalCount)
        receivingInProgress,
    required TResult Function() dataReceived,
    required TResult Function(String error) failedToReceive,
  }) {
    return failedToReceive(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult? Function()? completedDataTransfer,
    TResult? Function(String error)? failedToTransfer,
    TResult? Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult? Function()? dataReceived,
    TResult? Function(String error)? failedToReceive,
  }) {
    return failedToReceive?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(double progress, int offset, int totalCount)?
        transferInProgress,
    TResult Function()? completedDataTransfer,
    TResult Function(String error)? failedToTransfer,
    TResult Function(double progress, int offset, int totalCount)?
        receivingInProgress,
    TResult Function()? dataReceived,
    TResult Function(String error)? failedToReceive,
    required TResult orElse(),
  }) {
    if (failedToReceive != null) {
      return failedToReceive(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PeerToPeerInitial value) initial,
    required TResult Function(PeerToPeerLoading value) loading,
    required TResult Function(TransferInProgress value) transferInProgress,
    required TResult Function(CompletedDataTransfer value)
        completedDataTransfer,
    required TResult Function(FailedToTransfer value) failedToTransfer,
    required TResult Function(ReceivingInProgress value) receivingInProgress,
    required TResult Function(DataReceived value) dataReceived,
    required TResult Function(FailedDataTransfer value) failedToReceive,
  }) {
    return failedToReceive(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PeerToPeerInitial value)? initial,
    TResult? Function(PeerToPeerLoading value)? loading,
    TResult? Function(TransferInProgress value)? transferInProgress,
    TResult? Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult? Function(FailedToTransfer value)? failedToTransfer,
    TResult? Function(ReceivingInProgress value)? receivingInProgress,
    TResult? Function(DataReceived value)? dataReceived,
    TResult? Function(FailedDataTransfer value)? failedToReceive,
  }) {
    return failedToReceive?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PeerToPeerInitial value)? initial,
    TResult Function(PeerToPeerLoading value)? loading,
    TResult Function(TransferInProgress value)? transferInProgress,
    TResult Function(CompletedDataTransfer value)? completedDataTransfer,
    TResult Function(FailedToTransfer value)? failedToTransfer,
    TResult Function(ReceivingInProgress value)? receivingInProgress,
    TResult Function(DataReceived value)? dataReceived,
    TResult Function(FailedDataTransfer value)? failedToReceive,
    required TResult orElse(),
  }) {
    if (failedToReceive != null) {
      return failedToReceive(this);
    }
    return orElse();
  }
}

abstract class FailedDataTransfer implements PeerToPeerState {
  const factory FailedDataTransfer({required final String error}) =
      _$FailedDataTransferImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$FailedDataTransferImplCopyWith<_$FailedDataTransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

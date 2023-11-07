// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project_beneficiaries_downsync.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeneficiaryDownSyncEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId, String boundaryCode,
            int batchSize, int initialServerCount)
        downSync,
    required TResult Function(String projectId, String boundaryCode)
        checkForData,
    required TResult Function() resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount)?
        downSync,
    TResult? Function(String projectId, String boundaryCode)? checkForData,
    TResult? Function()? resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount)?
        downSync,
    TResult Function(String projectId, String boundaryCode)? checkForData,
    TResult Function()? resetState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownSyncBeneficiaryEvent value) downSync,
    required TResult Function(DownSyncCheckTotalCountEvent value) checkForData,
    required TResult Function(DownSyncResetStateEvent value) resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult? Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult? Function(DownSyncResetStateEvent value)? resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult Function(DownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeneficiaryDownSyncEventCopyWith<$Res> {
  factory $BeneficiaryDownSyncEventCopyWith(BeneficiaryDownSyncEvent value,
          $Res Function(BeneficiaryDownSyncEvent) then) =
      _$BeneficiaryDownSyncEventCopyWithImpl<$Res, BeneficiaryDownSyncEvent>;
}

/// @nodoc
class _$BeneficiaryDownSyncEventCopyWithImpl<$Res,
        $Val extends BeneficiaryDownSyncEvent>
    implements $BeneficiaryDownSyncEventCopyWith<$Res> {
  _$BeneficiaryDownSyncEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DownSyncBeneficiaryEventCopyWith<$Res> {
  factory _$$DownSyncBeneficiaryEventCopyWith(_$DownSyncBeneficiaryEvent value,
          $Res Function(_$DownSyncBeneficiaryEvent) then) =
      __$$DownSyncBeneficiaryEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      String boundaryCode,
      int batchSize,
      int initialServerCount});
}

/// @nodoc
class __$$DownSyncBeneficiaryEventCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncEventCopyWithImpl<$Res,
        _$DownSyncBeneficiaryEvent>
    implements _$$DownSyncBeneficiaryEventCopyWith<$Res> {
  __$$DownSyncBeneficiaryEventCopyWithImpl(_$DownSyncBeneficiaryEvent _value,
      $Res Function(_$DownSyncBeneficiaryEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? boundaryCode = null,
    Object? batchSize = null,
    Object? initialServerCount = null,
  }) {
    return _then(_$DownSyncBeneficiaryEvent(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      boundaryCode: null == boundaryCode
          ? _value.boundaryCode
          : boundaryCode // ignore: cast_nullable_to_non_nullable
              as String,
      batchSize: null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
      initialServerCount: null == initialServerCount
          ? _value.initialServerCount
          : initialServerCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DownSyncBeneficiaryEvent implements DownSyncBeneficiaryEvent {
  const _$DownSyncBeneficiaryEvent(
      {required this.projectId,
      required this.boundaryCode,
      required this.batchSize,
      required this.initialServerCount});

  @override
  final String projectId;
  @override
  final String boundaryCode;
  @override
  final int batchSize;
  @override
  final int initialServerCount;

  @override
  String toString() {
    return 'BeneficiaryDownSyncEvent.downSync(projectId: $projectId, boundaryCode: $boundaryCode, batchSize: $batchSize, initialServerCount: $initialServerCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncBeneficiaryEvent &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.boundaryCode, boundaryCode) ||
                other.boundaryCode == boundaryCode) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize) &&
            (identical(other.initialServerCount, initialServerCount) ||
                other.initialServerCount == initialServerCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, projectId, boundaryCode, batchSize, initialServerCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownSyncBeneficiaryEventCopyWith<_$DownSyncBeneficiaryEvent>
      get copyWith =>
          __$$DownSyncBeneficiaryEventCopyWithImpl<_$DownSyncBeneficiaryEvent>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId, String boundaryCode,
            int batchSize, int initialServerCount)
        downSync,
    required TResult Function(String projectId, String boundaryCode)
        checkForData,
    required TResult Function() resetState,
  }) {
    return downSync(projectId, boundaryCode, batchSize, initialServerCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount)?
        downSync,
    TResult? Function(String projectId, String boundaryCode)? checkForData,
    TResult? Function()? resetState,
  }) {
    return downSync?.call(
        projectId, boundaryCode, batchSize, initialServerCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount)?
        downSync,
    TResult Function(String projectId, String boundaryCode)? checkForData,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (downSync != null) {
      return downSync(projectId, boundaryCode, batchSize, initialServerCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownSyncBeneficiaryEvent value) downSync,
    required TResult Function(DownSyncCheckTotalCountEvent value) checkForData,
    required TResult Function(DownSyncResetStateEvent value) resetState,
  }) {
    return downSync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult? Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult? Function(DownSyncResetStateEvent value)? resetState,
  }) {
    return downSync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult Function(DownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (downSync != null) {
      return downSync(this);
    }
    return orElse();
  }
}

abstract class DownSyncBeneficiaryEvent implements BeneficiaryDownSyncEvent {
  const factory DownSyncBeneficiaryEvent(
      {required final String projectId,
      required final String boundaryCode,
      required final int batchSize,
      required final int initialServerCount}) = _$DownSyncBeneficiaryEvent;

  String get projectId;
  String get boundaryCode;
  int get batchSize;
  int get initialServerCount;
  @JsonKey(ignore: true)
  _$$DownSyncBeneficiaryEventCopyWith<_$DownSyncBeneficiaryEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownSyncCheckTotalCountEventCopyWith<$Res> {
  factory _$$DownSyncCheckTotalCountEventCopyWith(
          _$DownSyncCheckTotalCountEvent value,
          $Res Function(_$DownSyncCheckTotalCountEvent) then) =
      __$$DownSyncCheckTotalCountEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectId, String boundaryCode});
}

/// @nodoc
class __$$DownSyncCheckTotalCountEventCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncEventCopyWithImpl<$Res,
        _$DownSyncCheckTotalCountEvent>
    implements _$$DownSyncCheckTotalCountEventCopyWith<$Res> {
  __$$DownSyncCheckTotalCountEventCopyWithImpl(
      _$DownSyncCheckTotalCountEvent _value,
      $Res Function(_$DownSyncCheckTotalCountEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? boundaryCode = null,
  }) {
    return _then(_$DownSyncCheckTotalCountEvent(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      boundaryCode: null == boundaryCode
          ? _value.boundaryCode
          : boundaryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DownSyncCheckTotalCountEvent implements DownSyncCheckTotalCountEvent {
  const _$DownSyncCheckTotalCountEvent(
      {required this.projectId, required this.boundaryCode});

  @override
  final String projectId;
  @override
  final String boundaryCode;

  @override
  String toString() {
    return 'BeneficiaryDownSyncEvent.checkForData(projectId: $projectId, boundaryCode: $boundaryCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncCheckTotalCountEvent &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.boundaryCode, boundaryCode) ||
                other.boundaryCode == boundaryCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId, boundaryCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownSyncCheckTotalCountEventCopyWith<_$DownSyncCheckTotalCountEvent>
      get copyWith => __$$DownSyncCheckTotalCountEventCopyWithImpl<
          _$DownSyncCheckTotalCountEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId, String boundaryCode,
            int batchSize, int initialServerCount)
        downSync,
    required TResult Function(String projectId, String boundaryCode)
        checkForData,
    required TResult Function() resetState,
  }) {
    return checkForData(projectId, boundaryCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount)?
        downSync,
    TResult? Function(String projectId, String boundaryCode)? checkForData,
    TResult? Function()? resetState,
  }) {
    return checkForData?.call(projectId, boundaryCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount)?
        downSync,
    TResult Function(String projectId, String boundaryCode)? checkForData,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (checkForData != null) {
      return checkForData(projectId, boundaryCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownSyncBeneficiaryEvent value) downSync,
    required TResult Function(DownSyncCheckTotalCountEvent value) checkForData,
    required TResult Function(DownSyncResetStateEvent value) resetState,
  }) {
    return checkForData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult? Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult? Function(DownSyncResetStateEvent value)? resetState,
  }) {
    return checkForData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult Function(DownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (checkForData != null) {
      return checkForData(this);
    }
    return orElse();
  }
}

abstract class DownSyncCheckTotalCountEvent
    implements BeneficiaryDownSyncEvent {
  const factory DownSyncCheckTotalCountEvent(
      {required final String projectId,
      required final String boundaryCode}) = _$DownSyncCheckTotalCountEvent;

  String get projectId;
  String get boundaryCode;
  @JsonKey(ignore: true)
  _$$DownSyncCheckTotalCountEventCopyWith<_$DownSyncCheckTotalCountEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownSyncResetStateEventCopyWith<$Res> {
  factory _$$DownSyncResetStateEventCopyWith(_$DownSyncResetStateEvent value,
          $Res Function(_$DownSyncResetStateEvent) then) =
      __$$DownSyncResetStateEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownSyncResetStateEventCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncEventCopyWithImpl<$Res,
        _$DownSyncResetStateEvent>
    implements _$$DownSyncResetStateEventCopyWith<$Res> {
  __$$DownSyncResetStateEventCopyWithImpl(_$DownSyncResetStateEvent _value,
      $Res Function(_$DownSyncResetStateEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownSyncResetStateEvent implements DownSyncResetStateEvent {
  const _$DownSyncResetStateEvent();

  @override
  String toString() {
    return 'BeneficiaryDownSyncEvent.resetState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncResetStateEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId, String boundaryCode,
            int batchSize, int initialServerCount)
        downSync,
    required TResult Function(String projectId, String boundaryCode)
        checkForData,
    required TResult Function() resetState,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount)?
        downSync,
    TResult? Function(String projectId, String boundaryCode)? checkForData,
    TResult? Function()? resetState,
  }) {
    return resetState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount)?
        downSync,
    TResult Function(String projectId, String boundaryCode)? checkForData,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownSyncBeneficiaryEvent value) downSync,
    required TResult Function(DownSyncCheckTotalCountEvent value) checkForData,
    required TResult Function(DownSyncResetStateEvent value) resetState,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult? Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult? Function(DownSyncResetStateEvent value)? resetState,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult Function(DownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState(this);
    }
    return orElse();
  }
}

abstract class DownSyncResetStateEvent implements BeneficiaryDownSyncEvent {
  const factory DownSyncResetStateEvent() = _$DownSyncResetStateEvent;
}

/// @nodoc
mixin _$BeneficiaryDownSyncState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function() success,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount) dataFound,
    required TResult Function() resetState,
    required TResult Function() failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function()? success,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function()? success,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount)? dataFound,
    TResult Function()? resetState,
    TResult Function()? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSyncFailureState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSyncFailureState value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSyncFailureState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeneficiaryDownSyncStateCopyWith<$Res> {
  factory $BeneficiaryDownSyncStateCopyWith(BeneficiaryDownSyncState value,
          $Res Function(BeneficiaryDownSyncState) then) =
      _$BeneficiaryDownSyncStateCopyWithImpl<$Res, BeneficiaryDownSyncState>;
}

/// @nodoc
class _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        $Val extends BeneficiaryDownSyncState>
    implements $BeneficiaryDownSyncStateCopyWith<$Res> {
  _$BeneficiaryDownSyncStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_DownSyncInProgressStateCopyWith<$Res> {
  factory _$$_DownSyncInProgressStateCopyWith(_$_DownSyncInProgressState value,
          $Res Function(_$_DownSyncInProgressState) then) =
      __$$_DownSyncInProgressStateCopyWithImpl<$Res>;
  @useResult
  $Res call({int syncedCount, int totalCount});
}

/// @nodoc
class __$$_DownSyncInProgressStateCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$_DownSyncInProgressState>
    implements _$$_DownSyncInProgressStateCopyWith<$Res> {
  __$$_DownSyncInProgressStateCopyWithImpl(_$_DownSyncInProgressState _value,
      $Res Function(_$_DownSyncInProgressState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syncedCount = null,
    Object? totalCount = null,
  }) {
    return _then(_$_DownSyncInProgressState(
      null == syncedCount
          ? _value.syncedCount
          : syncedCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DownSyncInProgressState extends _DownSyncInProgressState {
  const _$_DownSyncInProgressState(this.syncedCount, this.totalCount)
      : super._();

  @override
  final int syncedCount;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.inProgress(syncedCount: $syncedCount, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownSyncInProgressState &&
            (identical(other.syncedCount, syncedCount) ||
                other.syncedCount == syncedCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, syncedCount, totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownSyncInProgressStateCopyWith<_$_DownSyncInProgressState>
      get copyWith =>
          __$$_DownSyncInProgressStateCopyWithImpl<_$_DownSyncInProgressState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function() success,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount) dataFound,
    required TResult Function() resetState,
    required TResult Function() failed,
  }) {
    return inProgress(syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function()? success,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? failed,
  }) {
    return inProgress?.call(syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function()? success,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount)? dataFound,
    TResult Function()? resetState,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(syncedCount, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSyncFailureState value) failed,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSyncFailureState value)? failed,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSyncFailureState value)? failed,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _DownSyncInProgressState extends BeneficiaryDownSyncState {
  const factory _DownSyncInProgressState(
      final int syncedCount, final int totalCount) = _$_DownSyncInProgressState;
  const _DownSyncInProgressState._() : super._();

  int get syncedCount;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$_DownSyncInProgressStateCopyWith<_$_DownSyncInProgressState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DownSyncSuccessStateCopyWith<$Res> {
  factory _$$_DownSyncSuccessStateCopyWith(_$_DownSyncSuccessState value,
          $Res Function(_$_DownSyncSuccessState) then) =
      __$$_DownSyncSuccessStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DownSyncSuccessStateCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$_DownSyncSuccessState>
    implements _$$_DownSyncSuccessStateCopyWith<$Res> {
  __$$_DownSyncSuccessStateCopyWithImpl(_$_DownSyncSuccessState _value,
      $Res Function(_$_DownSyncSuccessState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DownSyncSuccessState extends _DownSyncSuccessState {
  const _$_DownSyncSuccessState() : super._();

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DownSyncSuccessState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function() success,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount) dataFound,
    required TResult Function() resetState,
    required TResult Function() failed,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function()? success,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? failed,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function()? success,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount)? dataFound,
    TResult Function()? resetState,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSyncFailureState value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSyncFailureState value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSyncFailureState value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _DownSyncSuccessState extends BeneficiaryDownSyncState {
  const factory _DownSyncSuccessState() = _$_DownSyncSuccessState;
  const _DownSyncSuccessState._() : super._();
}

/// @nodoc
abstract class _$$_DownSyncInsufficientStorageStateCopyWith<$Res> {
  factory _$$_DownSyncInsufficientStorageStateCopyWith(
          _$_DownSyncInsufficientStorageState value,
          $Res Function(_$_DownSyncInsufficientStorageState) then) =
      __$$_DownSyncInsufficientStorageStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DownSyncInsufficientStorageStateCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$_DownSyncInsufficientStorageState>
    implements _$$_DownSyncInsufficientStorageStateCopyWith<$Res> {
  __$$_DownSyncInsufficientStorageStateCopyWithImpl(
      _$_DownSyncInsufficientStorageState _value,
      $Res Function(_$_DownSyncInsufficientStorageState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DownSyncInsufficientStorageState
    extends _DownSyncInsufficientStorageState {
  const _$_DownSyncInsufficientStorageState() : super._();

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.insufficientStorage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownSyncInsufficientStorageState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function() success,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount) dataFound,
    required TResult Function() resetState,
    required TResult Function() failed,
  }) {
    return insufficientStorage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function()? success,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? failed,
  }) {
    return insufficientStorage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function()? success,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount)? dataFound,
    TResult Function()? resetState,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (insufficientStorage != null) {
      return insufficientStorage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSyncFailureState value) failed,
  }) {
    return insufficientStorage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSyncFailureState value)? failed,
  }) {
    return insufficientStorage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSyncFailureState value)? failed,
    required TResult orElse(),
  }) {
    if (insufficientStorage != null) {
      return insufficientStorage(this);
    }
    return orElse();
  }
}

abstract class _DownSyncInsufficientStorageState
    extends BeneficiaryDownSyncState {
  const factory _DownSyncInsufficientStorageState() =
      _$_DownSyncInsufficientStorageState;
  const _DownSyncInsufficientStorageState._() : super._();
}

/// @nodoc
abstract class _$$_DownSyncDataFoundStateCopyWith<$Res> {
  factory _$$_DownSyncDataFoundStateCopyWith(_$_DownSyncDataFoundState value,
          $Res Function(_$_DownSyncDataFoundState) then) =
      __$$_DownSyncDataFoundStateCopyWithImpl<$Res>;
  @useResult
  $Res call({int initialServerCount});
}

/// @nodoc
class __$$_DownSyncDataFoundStateCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$_DownSyncDataFoundState>
    implements _$$_DownSyncDataFoundStateCopyWith<$Res> {
  __$$_DownSyncDataFoundStateCopyWithImpl(_$_DownSyncDataFoundState _value,
      $Res Function(_$_DownSyncDataFoundState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialServerCount = null,
  }) {
    return _then(_$_DownSyncDataFoundState(
      null == initialServerCount
          ? _value.initialServerCount
          : initialServerCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DownSyncDataFoundState extends _DownSyncDataFoundState {
  const _$_DownSyncDataFoundState(this.initialServerCount) : super._();

  @override
  final int initialServerCount;

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.dataFound(initialServerCount: $initialServerCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownSyncDataFoundState &&
            (identical(other.initialServerCount, initialServerCount) ||
                other.initialServerCount == initialServerCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, initialServerCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownSyncDataFoundStateCopyWith<_$_DownSyncDataFoundState> get copyWith =>
      __$$_DownSyncDataFoundStateCopyWithImpl<_$_DownSyncDataFoundState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function() success,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount) dataFound,
    required TResult Function() resetState,
    required TResult Function() failed,
  }) {
    return dataFound(initialServerCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function()? success,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? failed,
  }) {
    return dataFound?.call(initialServerCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function()? success,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount)? dataFound,
    TResult Function()? resetState,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (dataFound != null) {
      return dataFound(initialServerCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSyncFailureState value) failed,
  }) {
    return dataFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSyncFailureState value)? failed,
  }) {
    return dataFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSyncFailureState value)? failed,
    required TResult orElse(),
  }) {
    if (dataFound != null) {
      return dataFound(this);
    }
    return orElse();
  }
}

abstract class _DownSyncDataFoundState extends BeneficiaryDownSyncState {
  const factory _DownSyncDataFoundState(final int initialServerCount) =
      _$_DownSyncDataFoundState;
  const _DownSyncDataFoundState._() : super._();

  int get initialServerCount;
  @JsonKey(ignore: true)
  _$$_DownSyncDataFoundStateCopyWith<_$_DownSyncDataFoundState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DownSyncResetStateCopyWith<$Res> {
  factory _$$_DownSyncResetStateCopyWith(_$_DownSyncResetState value,
          $Res Function(_$_DownSyncResetState) then) =
      __$$_DownSyncResetStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DownSyncResetStateCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res, _$_DownSyncResetState>
    implements _$$_DownSyncResetStateCopyWith<$Res> {
  __$$_DownSyncResetStateCopyWithImpl(
      _$_DownSyncResetState _value, $Res Function(_$_DownSyncResetState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DownSyncResetState extends _DownSyncResetState {
  const _$_DownSyncResetState() : super._();

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.resetState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DownSyncResetState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function() success,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount) dataFound,
    required TResult Function() resetState,
    required TResult Function() failed,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function()? success,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? failed,
  }) {
    return resetState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function()? success,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount)? dataFound,
    TResult Function()? resetState,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSyncFailureState value) failed,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSyncFailureState value)? failed,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSyncFailureState value)? failed,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState(this);
    }
    return orElse();
  }
}

abstract class _DownSyncResetState extends BeneficiaryDownSyncState {
  const factory _DownSyncResetState() = _$_DownSyncResetState;
  const _DownSyncResetState._() : super._();
}

/// @nodoc
abstract class _$$_DownSyncFailureStateCopyWith<$Res> {
  factory _$$_DownSyncFailureStateCopyWith(_$_DownSyncFailureState value,
          $Res Function(_$_DownSyncFailureState) then) =
      __$$_DownSyncFailureStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DownSyncFailureStateCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$_DownSyncFailureState>
    implements _$$_DownSyncFailureStateCopyWith<$Res> {
  __$$_DownSyncFailureStateCopyWithImpl(_$_DownSyncFailureState _value,
      $Res Function(_$_DownSyncFailureState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DownSyncFailureState extends _DownSyncFailureState {
  const _$_DownSyncFailureState() : super._();

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.failed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DownSyncFailureState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function() success,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount) dataFound,
    required TResult Function() resetState,
    required TResult Function() failed,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function()? success,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? failed,
  }) {
    return failed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function()? success,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount)? dataFound,
    TResult Function()? resetState,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSyncFailureState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSyncFailureState value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSyncFailureState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _DownSyncFailureState extends BeneficiaryDownSyncState {
  const factory _DownSyncFailureState() = _$_DownSyncFailureState;
  const _DownSyncFailureState._() : super._();
}

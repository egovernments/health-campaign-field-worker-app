// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hf_referral_downsync.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HFReferralDownSyncEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId, String boundaryCode,
            int batchSize, int initialServerCount, String boundaryName)
        downSync,
    required TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)
        checkForData,
    required TResult Function(
            List<AppConfiguration> appConfiguration,
            String projectId,
            List<BoundaryModel> boundaries,
            int pendingSyncCount)
        getBatchSize,
    required TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)
        downSyncAll,
    required TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)
        downloadAll,
    required TResult Function() resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount, String boundaryName)?
        downSync,
    TResult? Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)?
        checkForData,
    TResult? Function(List<AppConfiguration> appConfiguration, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)?
        downSyncAll,
    TResult? Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)?
        downloadAll,
    TResult? Function()? resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount, String boundaryName)?
        downSync,
    TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)?
        checkForData,
    TResult Function(List<AppConfiguration> appConfiguration, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)?
        downSyncAll,
    TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)?
        downloadAll,
    TResult Function()? resetState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferralDownSyncStartEvent value) downSync,
    required TResult Function(HFReferralDownSyncCheckTotalCountEvent value)
        checkForData,
    required TResult Function(HFReferralDownSyncGetBatchSizeEvent value)
        getBatchSize,
    required TResult Function(HFReferralDownSyncAllBoundariesEvent value)
        downSyncAll,
    required TResult Function(HFReferralDownSyncDownloadAllEvent value)
        downloadAll,
    required TResult Function(HFReferralDownSyncResetStateEvent value)
        resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferralDownSyncStartEvent value)? downSync,
    TResult? Function(HFReferralDownSyncCheckTotalCountEvent value)?
        checkForData,
    TResult? Function(HFReferralDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(HFReferralDownSyncAllBoundariesEvent value)? downSyncAll,
    TResult? Function(HFReferralDownSyncDownloadAllEvent value)? downloadAll,
    TResult? Function(HFReferralDownSyncResetStateEvent value)? resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferralDownSyncStartEvent value)? downSync,
    TResult Function(HFReferralDownSyncCheckTotalCountEvent value)?
        checkForData,
    TResult Function(HFReferralDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(HFReferralDownSyncAllBoundariesEvent value)? downSyncAll,
    TResult Function(HFReferralDownSyncDownloadAllEvent value)? downloadAll,
    TResult Function(HFReferralDownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HFReferralDownSyncEventCopyWith<$Res> {
  factory $HFReferralDownSyncEventCopyWith(HFReferralDownSyncEvent value,
          $Res Function(HFReferralDownSyncEvent) then) =
      _$HFReferralDownSyncEventCopyWithImpl<$Res, HFReferralDownSyncEvent>;
}

/// @nodoc
class _$HFReferralDownSyncEventCopyWithImpl<$Res,
        $Val extends HFReferralDownSyncEvent>
    implements $HFReferralDownSyncEventCopyWith<$Res> {
  _$HFReferralDownSyncEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HFReferralDownSyncStartEventImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncStartEventImplCopyWith(
          _$HFReferralDownSyncStartEventImpl value,
          $Res Function(_$HFReferralDownSyncStartEventImpl) then) =
      __$$HFReferralDownSyncStartEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      String boundaryCode,
      int batchSize,
      int initialServerCount,
      String boundaryName});
}

/// @nodoc
class __$$HFReferralDownSyncStartEventImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncEventCopyWithImpl<$Res,
        _$HFReferralDownSyncStartEventImpl>
    implements _$$HFReferralDownSyncStartEventImplCopyWith<$Res> {
  __$$HFReferralDownSyncStartEventImplCopyWithImpl(
      _$HFReferralDownSyncStartEventImpl _value,
      $Res Function(_$HFReferralDownSyncStartEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? boundaryCode = null,
    Object? batchSize = null,
    Object? initialServerCount = null,
    Object? boundaryName = null,
  }) {
    return _then(_$HFReferralDownSyncStartEventImpl(
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
      boundaryName: null == boundaryName
          ? _value.boundaryName
          : boundaryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HFReferralDownSyncStartEventImpl
    implements HFReferralDownSyncStartEvent {
  const _$HFReferralDownSyncStartEventImpl(
      {required this.projectId,
      required this.boundaryCode,
      required this.batchSize,
      required this.initialServerCount,
      required this.boundaryName});

  @override
  final String projectId;
  @override
  final String boundaryCode;
  @override
  final int batchSize;
  @override
  final int initialServerCount;
  @override
  final String boundaryName;

  @override
  String toString() {
    return 'HFReferralDownSyncEvent.downSync(projectId: $projectId, boundaryCode: $boundaryCode, batchSize: $batchSize, initialServerCount: $initialServerCount, boundaryName: $boundaryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncStartEventImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.boundaryCode, boundaryCode) ||
                other.boundaryCode == boundaryCode) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize) &&
            (identical(other.initialServerCount, initialServerCount) ||
                other.initialServerCount == initialServerCount) &&
            (identical(other.boundaryName, boundaryName) ||
                other.boundaryName == boundaryName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId, boundaryCode,
      batchSize, initialServerCount, boundaryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferralDownSyncStartEventImplCopyWith<
          _$HFReferralDownSyncStartEventImpl>
      get copyWith => __$$HFReferralDownSyncStartEventImplCopyWithImpl<
          _$HFReferralDownSyncStartEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId, String boundaryCode,
            int batchSize, int initialServerCount, String boundaryName)
        downSync,
    required TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)
        checkForData,
    required TResult Function(
            List<AppConfiguration> appConfiguration,
            String projectId,
            List<BoundaryModel> boundaries,
            int pendingSyncCount)
        getBatchSize,
    required TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)
        downSyncAll,
    required TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)
        downloadAll,
    required TResult Function() resetState,
  }) {
    return downSync(
        projectId, boundaryCode, batchSize, initialServerCount, boundaryName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount, String boundaryName)?
        downSync,
    TResult? Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)?
        checkForData,
    TResult? Function(List<AppConfiguration> appConfiguration, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)?
        downSyncAll,
    TResult? Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)?
        downloadAll,
    TResult? Function()? resetState,
  }) {
    return downSync?.call(
        projectId, boundaryCode, batchSize, initialServerCount, boundaryName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount, String boundaryName)?
        downSync,
    TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)?
        checkForData,
    TResult Function(List<AppConfiguration> appConfiguration, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)?
        downSyncAll,
    TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)?
        downloadAll,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (downSync != null) {
      return downSync(
          projectId, boundaryCode, batchSize, initialServerCount, boundaryName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferralDownSyncStartEvent value) downSync,
    required TResult Function(HFReferralDownSyncCheckTotalCountEvent value)
        checkForData,
    required TResult Function(HFReferralDownSyncGetBatchSizeEvent value)
        getBatchSize,
    required TResult Function(HFReferralDownSyncAllBoundariesEvent value)
        downSyncAll,
    required TResult Function(HFReferralDownSyncDownloadAllEvent value)
        downloadAll,
    required TResult Function(HFReferralDownSyncResetStateEvent value)
        resetState,
  }) {
    return downSync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferralDownSyncStartEvent value)? downSync,
    TResult? Function(HFReferralDownSyncCheckTotalCountEvent value)?
        checkForData,
    TResult? Function(HFReferralDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(HFReferralDownSyncAllBoundariesEvent value)? downSyncAll,
    TResult? Function(HFReferralDownSyncDownloadAllEvent value)? downloadAll,
    TResult? Function(HFReferralDownSyncResetStateEvent value)? resetState,
  }) {
    return downSync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferralDownSyncStartEvent value)? downSync,
    TResult Function(HFReferralDownSyncCheckTotalCountEvent value)?
        checkForData,
    TResult Function(HFReferralDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(HFReferralDownSyncAllBoundariesEvent value)? downSyncAll,
    TResult Function(HFReferralDownSyncDownloadAllEvent value)? downloadAll,
    TResult Function(HFReferralDownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (downSync != null) {
      return downSync(this);
    }
    return orElse();
  }
}

abstract class HFReferralDownSyncStartEvent implements HFReferralDownSyncEvent {
  const factory HFReferralDownSyncStartEvent(
      {required final String projectId,
      required final String boundaryCode,
      required final int batchSize,
      required final int initialServerCount,
      required final String boundaryName}) = _$HFReferralDownSyncStartEventImpl;

  String get projectId;
  String get boundaryCode;
  int get batchSize;
  int get initialServerCount;
  String get boundaryName;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncStartEventImplCopyWith<
          _$HFReferralDownSyncStartEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HFReferralDownSyncCheckTotalCountEventImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncCheckTotalCountEventImplCopyWith(
          _$HFReferralDownSyncCheckTotalCountEventImpl value,
          $Res Function(_$HFReferralDownSyncCheckTotalCountEventImpl) then) =
      __$$HFReferralDownSyncCheckTotalCountEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      String boundaryCode,
      int pendingSyncCount,
      int batchSize,
      String boundaryName});
}

/// @nodoc
class __$$HFReferralDownSyncCheckTotalCountEventImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncEventCopyWithImpl<$Res,
        _$HFReferralDownSyncCheckTotalCountEventImpl>
    implements _$$HFReferralDownSyncCheckTotalCountEventImplCopyWith<$Res> {
  __$$HFReferralDownSyncCheckTotalCountEventImplCopyWithImpl(
      _$HFReferralDownSyncCheckTotalCountEventImpl _value,
      $Res Function(_$HFReferralDownSyncCheckTotalCountEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? boundaryCode = null,
    Object? pendingSyncCount = null,
    Object? batchSize = null,
    Object? boundaryName = null,
  }) {
    return _then(_$HFReferralDownSyncCheckTotalCountEventImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      boundaryCode: null == boundaryCode
          ? _value.boundaryCode
          : boundaryCode // ignore: cast_nullable_to_non_nullable
              as String,
      pendingSyncCount: null == pendingSyncCount
          ? _value.pendingSyncCount
          : pendingSyncCount // ignore: cast_nullable_to_non_nullable
              as int,
      batchSize: null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
      boundaryName: null == boundaryName
          ? _value.boundaryName
          : boundaryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HFReferralDownSyncCheckTotalCountEventImpl
    implements HFReferralDownSyncCheckTotalCountEvent {
  const _$HFReferralDownSyncCheckTotalCountEventImpl(
      {required this.projectId,
      required this.boundaryCode,
      required this.pendingSyncCount,
      required this.batchSize,
      required this.boundaryName});

  @override
  final String projectId;
  @override
  final String boundaryCode;
  @override
  final int pendingSyncCount;
  @override
  final int batchSize;
  @override
  final String boundaryName;

  @override
  String toString() {
    return 'HFReferralDownSyncEvent.checkForData(projectId: $projectId, boundaryCode: $boundaryCode, pendingSyncCount: $pendingSyncCount, batchSize: $batchSize, boundaryName: $boundaryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncCheckTotalCountEventImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.boundaryCode, boundaryCode) ||
                other.boundaryCode == boundaryCode) &&
            (identical(other.pendingSyncCount, pendingSyncCount) ||
                other.pendingSyncCount == pendingSyncCount) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize) &&
            (identical(other.boundaryName, boundaryName) ||
                other.boundaryName == boundaryName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId, boundaryCode,
      pendingSyncCount, batchSize, boundaryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferralDownSyncCheckTotalCountEventImplCopyWith<
          _$HFReferralDownSyncCheckTotalCountEventImpl>
      get copyWith =>
          __$$HFReferralDownSyncCheckTotalCountEventImplCopyWithImpl<
              _$HFReferralDownSyncCheckTotalCountEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId, String boundaryCode,
            int batchSize, int initialServerCount, String boundaryName)
        downSync,
    required TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)
        checkForData,
    required TResult Function(
            List<AppConfiguration> appConfiguration,
            String projectId,
            List<BoundaryModel> boundaries,
            int pendingSyncCount)
        getBatchSize,
    required TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)
        downSyncAll,
    required TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)
        downloadAll,
    required TResult Function() resetState,
  }) {
    return checkForData(
        projectId, boundaryCode, pendingSyncCount, batchSize, boundaryName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount, String boundaryName)?
        downSync,
    TResult? Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)?
        checkForData,
    TResult? Function(List<AppConfiguration> appConfiguration, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)?
        downSyncAll,
    TResult? Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)?
        downloadAll,
    TResult? Function()? resetState,
  }) {
    return checkForData?.call(
        projectId, boundaryCode, pendingSyncCount, batchSize, boundaryName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount, String boundaryName)?
        downSync,
    TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)?
        checkForData,
    TResult Function(List<AppConfiguration> appConfiguration, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)?
        downSyncAll,
    TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)?
        downloadAll,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (checkForData != null) {
      return checkForData(
          projectId, boundaryCode, pendingSyncCount, batchSize, boundaryName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferralDownSyncStartEvent value) downSync,
    required TResult Function(HFReferralDownSyncCheckTotalCountEvent value)
        checkForData,
    required TResult Function(HFReferralDownSyncGetBatchSizeEvent value)
        getBatchSize,
    required TResult Function(HFReferralDownSyncAllBoundariesEvent value)
        downSyncAll,
    required TResult Function(HFReferralDownSyncDownloadAllEvent value)
        downloadAll,
    required TResult Function(HFReferralDownSyncResetStateEvent value)
        resetState,
  }) {
    return checkForData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferralDownSyncStartEvent value)? downSync,
    TResult? Function(HFReferralDownSyncCheckTotalCountEvent value)?
        checkForData,
    TResult? Function(HFReferralDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(HFReferralDownSyncAllBoundariesEvent value)? downSyncAll,
    TResult? Function(HFReferralDownSyncDownloadAllEvent value)? downloadAll,
    TResult? Function(HFReferralDownSyncResetStateEvent value)? resetState,
  }) {
    return checkForData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferralDownSyncStartEvent value)? downSync,
    TResult Function(HFReferralDownSyncCheckTotalCountEvent value)?
        checkForData,
    TResult Function(HFReferralDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(HFReferralDownSyncAllBoundariesEvent value)? downSyncAll,
    TResult Function(HFReferralDownSyncDownloadAllEvent value)? downloadAll,
    TResult Function(HFReferralDownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (checkForData != null) {
      return checkForData(this);
    }
    return orElse();
  }
}

abstract class HFReferralDownSyncCheckTotalCountEvent
    implements HFReferralDownSyncEvent {
  const factory HFReferralDownSyncCheckTotalCountEvent(
          {required final String projectId,
          required final String boundaryCode,
          required final int pendingSyncCount,
          required final int batchSize,
          required final String boundaryName}) =
      _$HFReferralDownSyncCheckTotalCountEventImpl;

  String get projectId;
  String get boundaryCode;
  int get pendingSyncCount;
  int get batchSize;
  String get boundaryName;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncCheckTotalCountEventImplCopyWith<
          _$HFReferralDownSyncCheckTotalCountEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HFReferralDownSyncGetBatchSizeEventImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncGetBatchSizeEventImplCopyWith(
          _$HFReferralDownSyncGetBatchSizeEventImpl value,
          $Res Function(_$HFReferralDownSyncGetBatchSizeEventImpl) then) =
      __$$HFReferralDownSyncGetBatchSizeEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<AppConfiguration> appConfiguration,
      String projectId,
      List<BoundaryModel> boundaries,
      int pendingSyncCount});
}

/// @nodoc
class __$$HFReferralDownSyncGetBatchSizeEventImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncEventCopyWithImpl<$Res,
        _$HFReferralDownSyncGetBatchSizeEventImpl>
    implements _$$HFReferralDownSyncGetBatchSizeEventImplCopyWith<$Res> {
  __$$HFReferralDownSyncGetBatchSizeEventImplCopyWithImpl(
      _$HFReferralDownSyncGetBatchSizeEventImpl _value,
      $Res Function(_$HFReferralDownSyncGetBatchSizeEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfiguration = null,
    Object? projectId = null,
    Object? boundaries = null,
    Object? pendingSyncCount = null,
  }) {
    return _then(_$HFReferralDownSyncGetBatchSizeEventImpl(
      appConfiguration: null == appConfiguration
          ? _value._appConfiguration
          : appConfiguration // ignore: cast_nullable_to_non_nullable
              as List<AppConfiguration>,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      boundaries: null == boundaries
          ? _value._boundaries
          : boundaries // ignore: cast_nullable_to_non_nullable
              as List<BoundaryModel>,
      pendingSyncCount: null == pendingSyncCount
          ? _value.pendingSyncCount
          : pendingSyncCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HFReferralDownSyncGetBatchSizeEventImpl
    implements HFReferralDownSyncGetBatchSizeEvent {
  const _$HFReferralDownSyncGetBatchSizeEventImpl(
      {required final List<AppConfiguration> appConfiguration,
      required this.projectId,
      required final List<BoundaryModel> boundaries,
      required this.pendingSyncCount})
      : _appConfiguration = appConfiguration,
        _boundaries = boundaries;

  final List<AppConfiguration> _appConfiguration;
  @override
  List<AppConfiguration> get appConfiguration {
    if (_appConfiguration is EqualUnmodifiableListView)
      return _appConfiguration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appConfiguration);
  }

  @override
  final String projectId;
  final List<BoundaryModel> _boundaries;
  @override
  List<BoundaryModel> get boundaries {
    if (_boundaries is EqualUnmodifiableListView) return _boundaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boundaries);
  }

  @override
  final int pendingSyncCount;

  @override
  String toString() {
    return 'HFReferralDownSyncEvent.getBatchSize(appConfiguration: $appConfiguration, projectId: $projectId, boundaries: $boundaries, pendingSyncCount: $pendingSyncCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncGetBatchSizeEventImpl &&
            const DeepCollectionEquality()
                .equals(other._appConfiguration, _appConfiguration) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality()
                .equals(other._boundaries, _boundaries) &&
            (identical(other.pendingSyncCount, pendingSyncCount) ||
                other.pendingSyncCount == pendingSyncCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_appConfiguration),
      projectId,
      const DeepCollectionEquality().hash(_boundaries),
      pendingSyncCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferralDownSyncGetBatchSizeEventImplCopyWith<
          _$HFReferralDownSyncGetBatchSizeEventImpl>
      get copyWith => __$$HFReferralDownSyncGetBatchSizeEventImplCopyWithImpl<
          _$HFReferralDownSyncGetBatchSizeEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId, String boundaryCode,
            int batchSize, int initialServerCount, String boundaryName)
        downSync,
    required TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)
        checkForData,
    required TResult Function(
            List<AppConfiguration> appConfiguration,
            String projectId,
            List<BoundaryModel> boundaries,
            int pendingSyncCount)
        getBatchSize,
    required TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)
        downSyncAll,
    required TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)
        downloadAll,
    required TResult Function() resetState,
  }) {
    return getBatchSize(
        appConfiguration, projectId, boundaries, pendingSyncCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount, String boundaryName)?
        downSync,
    TResult? Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)?
        checkForData,
    TResult? Function(List<AppConfiguration> appConfiguration, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)?
        downSyncAll,
    TResult? Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)?
        downloadAll,
    TResult? Function()? resetState,
  }) {
    return getBatchSize?.call(
        appConfiguration, projectId, boundaries, pendingSyncCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount, String boundaryName)?
        downSync,
    TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)?
        checkForData,
    TResult Function(List<AppConfiguration> appConfiguration, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)?
        downSyncAll,
    TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)?
        downloadAll,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (getBatchSize != null) {
      return getBatchSize(
          appConfiguration, projectId, boundaries, pendingSyncCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferralDownSyncStartEvent value) downSync,
    required TResult Function(HFReferralDownSyncCheckTotalCountEvent value)
        checkForData,
    required TResult Function(HFReferralDownSyncGetBatchSizeEvent value)
        getBatchSize,
    required TResult Function(HFReferralDownSyncAllBoundariesEvent value)
        downSyncAll,
    required TResult Function(HFReferralDownSyncDownloadAllEvent value)
        downloadAll,
    required TResult Function(HFReferralDownSyncResetStateEvent value)
        resetState,
  }) {
    return getBatchSize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferralDownSyncStartEvent value)? downSync,
    TResult? Function(HFReferralDownSyncCheckTotalCountEvent value)?
        checkForData,
    TResult? Function(HFReferralDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(HFReferralDownSyncAllBoundariesEvent value)? downSyncAll,
    TResult? Function(HFReferralDownSyncDownloadAllEvent value)? downloadAll,
    TResult? Function(HFReferralDownSyncResetStateEvent value)? resetState,
  }) {
    return getBatchSize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferralDownSyncStartEvent value)? downSync,
    TResult Function(HFReferralDownSyncCheckTotalCountEvent value)?
        checkForData,
    TResult Function(HFReferralDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(HFReferralDownSyncAllBoundariesEvent value)? downSyncAll,
    TResult Function(HFReferralDownSyncDownloadAllEvent value)? downloadAll,
    TResult Function(HFReferralDownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (getBatchSize != null) {
      return getBatchSize(this);
    }
    return orElse();
  }
}

abstract class HFReferralDownSyncGetBatchSizeEvent
    implements HFReferralDownSyncEvent {
  const factory HFReferralDownSyncGetBatchSizeEvent(
          {required final List<AppConfiguration> appConfiguration,
          required final String projectId,
          required final List<BoundaryModel> boundaries,
          required final int pendingSyncCount}) =
      _$HFReferralDownSyncGetBatchSizeEventImpl;

  List<AppConfiguration> get appConfiguration;
  String get projectId;
  List<BoundaryModel> get boundaries;
  int get pendingSyncCount;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncGetBatchSizeEventImplCopyWith<
          _$HFReferralDownSyncGetBatchSizeEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HFReferralDownSyncAllBoundariesEventImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncAllBoundariesEventImplCopyWith(
          _$HFReferralDownSyncAllBoundariesEventImpl value,
          $Res Function(_$HFReferralDownSyncAllBoundariesEventImpl) then) =
      __$$HFReferralDownSyncAllBoundariesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      List<BoundaryModel> boundaries,
      int batchSize,
      int pendingSyncCount});
}

/// @nodoc
class __$$HFReferralDownSyncAllBoundariesEventImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncEventCopyWithImpl<$Res,
        _$HFReferralDownSyncAllBoundariesEventImpl>
    implements _$$HFReferralDownSyncAllBoundariesEventImplCopyWith<$Res> {
  __$$HFReferralDownSyncAllBoundariesEventImplCopyWithImpl(
      _$HFReferralDownSyncAllBoundariesEventImpl _value,
      $Res Function(_$HFReferralDownSyncAllBoundariesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? boundaries = null,
    Object? batchSize = null,
    Object? pendingSyncCount = null,
  }) {
    return _then(_$HFReferralDownSyncAllBoundariesEventImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      boundaries: null == boundaries
          ? _value._boundaries
          : boundaries // ignore: cast_nullable_to_non_nullable
              as List<BoundaryModel>,
      batchSize: null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
      pendingSyncCount: null == pendingSyncCount
          ? _value.pendingSyncCount
          : pendingSyncCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HFReferralDownSyncAllBoundariesEventImpl
    implements HFReferralDownSyncAllBoundariesEvent {
  const _$HFReferralDownSyncAllBoundariesEventImpl(
      {required this.projectId,
      required final List<BoundaryModel> boundaries,
      required this.batchSize,
      required this.pendingSyncCount})
      : _boundaries = boundaries;

  @override
  final String projectId;
  final List<BoundaryModel> _boundaries;
  @override
  List<BoundaryModel> get boundaries {
    if (_boundaries is EqualUnmodifiableListView) return _boundaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boundaries);
  }

  @override
  final int batchSize;
  @override
  final int pendingSyncCount;

  @override
  String toString() {
    return 'HFReferralDownSyncEvent.downSyncAll(projectId: $projectId, boundaries: $boundaries, batchSize: $batchSize, pendingSyncCount: $pendingSyncCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncAllBoundariesEventImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality()
                .equals(other._boundaries, _boundaries) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize) &&
            (identical(other.pendingSyncCount, pendingSyncCount) ||
                other.pendingSyncCount == pendingSyncCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectId,
      const DeepCollectionEquality().hash(_boundaries),
      batchSize,
      pendingSyncCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferralDownSyncAllBoundariesEventImplCopyWith<
          _$HFReferralDownSyncAllBoundariesEventImpl>
      get copyWith => __$$HFReferralDownSyncAllBoundariesEventImplCopyWithImpl<
          _$HFReferralDownSyncAllBoundariesEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId, String boundaryCode,
            int batchSize, int initialServerCount, String boundaryName)
        downSync,
    required TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)
        checkForData,
    required TResult Function(
            List<AppConfiguration> appConfiguration,
            String projectId,
            List<BoundaryModel> boundaries,
            int pendingSyncCount)
        getBatchSize,
    required TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)
        downSyncAll,
    required TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)
        downloadAll,
    required TResult Function() resetState,
  }) {
    return downSyncAll(projectId, boundaries, batchSize, pendingSyncCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount, String boundaryName)?
        downSync,
    TResult? Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)?
        checkForData,
    TResult? Function(List<AppConfiguration> appConfiguration, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)?
        downSyncAll,
    TResult? Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)?
        downloadAll,
    TResult? Function()? resetState,
  }) {
    return downSyncAll?.call(
        projectId, boundaries, batchSize, pendingSyncCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount, String boundaryName)?
        downSync,
    TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)?
        checkForData,
    TResult Function(List<AppConfiguration> appConfiguration, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)?
        downSyncAll,
    TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)?
        downloadAll,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (downSyncAll != null) {
      return downSyncAll(projectId, boundaries, batchSize, pendingSyncCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferralDownSyncStartEvent value) downSync,
    required TResult Function(HFReferralDownSyncCheckTotalCountEvent value)
        checkForData,
    required TResult Function(HFReferralDownSyncGetBatchSizeEvent value)
        getBatchSize,
    required TResult Function(HFReferralDownSyncAllBoundariesEvent value)
        downSyncAll,
    required TResult Function(HFReferralDownSyncDownloadAllEvent value)
        downloadAll,
    required TResult Function(HFReferralDownSyncResetStateEvent value)
        resetState,
  }) {
    return downSyncAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferralDownSyncStartEvent value)? downSync,
    TResult? Function(HFReferralDownSyncCheckTotalCountEvent value)?
        checkForData,
    TResult? Function(HFReferralDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(HFReferralDownSyncAllBoundariesEvent value)? downSyncAll,
    TResult? Function(HFReferralDownSyncDownloadAllEvent value)? downloadAll,
    TResult? Function(HFReferralDownSyncResetStateEvent value)? resetState,
  }) {
    return downSyncAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferralDownSyncStartEvent value)? downSync,
    TResult Function(HFReferralDownSyncCheckTotalCountEvent value)?
        checkForData,
    TResult Function(HFReferralDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(HFReferralDownSyncAllBoundariesEvent value)? downSyncAll,
    TResult Function(HFReferralDownSyncDownloadAllEvent value)? downloadAll,
    TResult Function(HFReferralDownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (downSyncAll != null) {
      return downSyncAll(this);
    }
    return orElse();
  }
}

abstract class HFReferralDownSyncAllBoundariesEvent
    implements HFReferralDownSyncEvent {
  const factory HFReferralDownSyncAllBoundariesEvent(
          {required final String projectId,
          required final List<BoundaryModel> boundaries,
          required final int batchSize,
          required final int pendingSyncCount}) =
      _$HFReferralDownSyncAllBoundariesEventImpl;

  String get projectId;
  List<BoundaryModel> get boundaries;
  int get batchSize;
  int get pendingSyncCount;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncAllBoundariesEventImplCopyWith<
          _$HFReferralDownSyncAllBoundariesEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HFReferralDownSyncDownloadAllEventImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncDownloadAllEventImplCopyWith(
          _$HFReferralDownSyncDownloadAllEventImpl value,
          $Res Function(_$HFReferralDownSyncDownloadAllEventImpl) then) =
      __$$HFReferralDownSyncDownloadAllEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      List<BoundaryModel> boundaries,
      int batchSize,
      Map<String, int> boundaryCounts});
}

/// @nodoc
class __$$HFReferralDownSyncDownloadAllEventImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncEventCopyWithImpl<$Res,
        _$HFReferralDownSyncDownloadAllEventImpl>
    implements _$$HFReferralDownSyncDownloadAllEventImplCopyWith<$Res> {
  __$$HFReferralDownSyncDownloadAllEventImplCopyWithImpl(
      _$HFReferralDownSyncDownloadAllEventImpl _value,
      $Res Function(_$HFReferralDownSyncDownloadAllEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? boundaries = null,
    Object? batchSize = null,
    Object? boundaryCounts = null,
  }) {
    return _then(_$HFReferralDownSyncDownloadAllEventImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      boundaries: null == boundaries
          ? _value._boundaries
          : boundaries // ignore: cast_nullable_to_non_nullable
              as List<BoundaryModel>,
      batchSize: null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
      boundaryCounts: null == boundaryCounts
          ? _value._boundaryCounts
          : boundaryCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc

class _$HFReferralDownSyncDownloadAllEventImpl
    implements HFReferralDownSyncDownloadAllEvent {
  const _$HFReferralDownSyncDownloadAllEventImpl(
      {required this.projectId,
      required final List<BoundaryModel> boundaries,
      required this.batchSize,
      required final Map<String, int> boundaryCounts})
      : _boundaries = boundaries,
        _boundaryCounts = boundaryCounts;

  @override
  final String projectId;
  final List<BoundaryModel> _boundaries;
  @override
  List<BoundaryModel> get boundaries {
    if (_boundaries is EqualUnmodifiableListView) return _boundaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boundaries);
  }

  @override
  final int batchSize;
  final Map<String, int> _boundaryCounts;
  @override
  Map<String, int> get boundaryCounts {
    if (_boundaryCounts is EqualUnmodifiableMapView) return _boundaryCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_boundaryCounts);
  }

  @override
  String toString() {
    return 'HFReferralDownSyncEvent.downloadAll(projectId: $projectId, boundaries: $boundaries, batchSize: $batchSize, boundaryCounts: $boundaryCounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncDownloadAllEventImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality()
                .equals(other._boundaries, _boundaries) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize) &&
            const DeepCollectionEquality()
                .equals(other._boundaryCounts, _boundaryCounts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectId,
      const DeepCollectionEquality().hash(_boundaries),
      batchSize,
      const DeepCollectionEquality().hash(_boundaryCounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferralDownSyncDownloadAllEventImplCopyWith<
          _$HFReferralDownSyncDownloadAllEventImpl>
      get copyWith => __$$HFReferralDownSyncDownloadAllEventImplCopyWithImpl<
          _$HFReferralDownSyncDownloadAllEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId, String boundaryCode,
            int batchSize, int initialServerCount, String boundaryName)
        downSync,
    required TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)
        checkForData,
    required TResult Function(
            List<AppConfiguration> appConfiguration,
            String projectId,
            List<BoundaryModel> boundaries,
            int pendingSyncCount)
        getBatchSize,
    required TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)
        downSyncAll,
    required TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)
        downloadAll,
    required TResult Function() resetState,
  }) {
    return downloadAll(projectId, boundaries, batchSize, boundaryCounts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount, String boundaryName)?
        downSync,
    TResult? Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)?
        checkForData,
    TResult? Function(List<AppConfiguration> appConfiguration, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)?
        downSyncAll,
    TResult? Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)?
        downloadAll,
    TResult? Function()? resetState,
  }) {
    return downloadAll?.call(projectId, boundaries, batchSize, boundaryCounts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount, String boundaryName)?
        downSync,
    TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)?
        checkForData,
    TResult Function(List<AppConfiguration> appConfiguration, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)?
        downSyncAll,
    TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)?
        downloadAll,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (downloadAll != null) {
      return downloadAll(projectId, boundaries, batchSize, boundaryCounts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferralDownSyncStartEvent value) downSync,
    required TResult Function(HFReferralDownSyncCheckTotalCountEvent value)
        checkForData,
    required TResult Function(HFReferralDownSyncGetBatchSizeEvent value)
        getBatchSize,
    required TResult Function(HFReferralDownSyncAllBoundariesEvent value)
        downSyncAll,
    required TResult Function(HFReferralDownSyncDownloadAllEvent value)
        downloadAll,
    required TResult Function(HFReferralDownSyncResetStateEvent value)
        resetState,
  }) {
    return downloadAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferralDownSyncStartEvent value)? downSync,
    TResult? Function(HFReferralDownSyncCheckTotalCountEvent value)?
        checkForData,
    TResult? Function(HFReferralDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(HFReferralDownSyncAllBoundariesEvent value)? downSyncAll,
    TResult? Function(HFReferralDownSyncDownloadAllEvent value)? downloadAll,
    TResult? Function(HFReferralDownSyncResetStateEvent value)? resetState,
  }) {
    return downloadAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferralDownSyncStartEvent value)? downSync,
    TResult Function(HFReferralDownSyncCheckTotalCountEvent value)?
        checkForData,
    TResult Function(HFReferralDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(HFReferralDownSyncAllBoundariesEvent value)? downSyncAll,
    TResult Function(HFReferralDownSyncDownloadAllEvent value)? downloadAll,
    TResult Function(HFReferralDownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (downloadAll != null) {
      return downloadAll(this);
    }
    return orElse();
  }
}

abstract class HFReferralDownSyncDownloadAllEvent
    implements HFReferralDownSyncEvent {
  const factory HFReferralDownSyncDownloadAllEvent(
          {required final String projectId,
          required final List<BoundaryModel> boundaries,
          required final int batchSize,
          required final Map<String, int> boundaryCounts}) =
      _$HFReferralDownSyncDownloadAllEventImpl;

  String get projectId;
  List<BoundaryModel> get boundaries;
  int get batchSize;
  Map<String, int> get boundaryCounts;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncDownloadAllEventImplCopyWith<
          _$HFReferralDownSyncDownloadAllEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HFReferralDownSyncResetStateEventImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncResetStateEventImplCopyWith(
          _$HFReferralDownSyncResetStateEventImpl value,
          $Res Function(_$HFReferralDownSyncResetStateEventImpl) then) =
      __$$HFReferralDownSyncResetStateEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HFReferralDownSyncResetStateEventImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncEventCopyWithImpl<$Res,
        _$HFReferralDownSyncResetStateEventImpl>
    implements _$$HFReferralDownSyncResetStateEventImplCopyWith<$Res> {
  __$$HFReferralDownSyncResetStateEventImplCopyWithImpl(
      _$HFReferralDownSyncResetStateEventImpl _value,
      $Res Function(_$HFReferralDownSyncResetStateEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HFReferralDownSyncResetStateEventImpl
    implements HFReferralDownSyncResetStateEvent {
  const _$HFReferralDownSyncResetStateEventImpl();

  @override
  String toString() {
    return 'HFReferralDownSyncEvent.resetState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncResetStateEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId, String boundaryCode,
            int batchSize, int initialServerCount, String boundaryName)
        downSync,
    required TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)
        checkForData,
    required TResult Function(
            List<AppConfiguration> appConfiguration,
            String projectId,
            List<BoundaryModel> boundaries,
            int pendingSyncCount)
        getBatchSize,
    required TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)
        downSyncAll,
    required TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)
        downloadAll,
    required TResult Function() resetState,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount, String boundaryName)?
        downSync,
    TResult? Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)?
        checkForData,
    TResult? Function(List<AppConfiguration> appConfiguration, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)?
        downSyncAll,
    TResult? Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)?
        downloadAll,
    TResult? Function()? resetState,
  }) {
    return resetState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, String boundaryCode, int batchSize,
            int initialServerCount, String boundaryName)?
        downSync,
    TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)?
        checkForData,
    TResult Function(List<AppConfiguration> appConfiguration, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, int pendingSyncCount)?
        downSyncAll,
    TResult Function(String projectId, List<BoundaryModel> boundaries,
            int batchSize, Map<String, int> boundaryCounts)?
        downloadAll,
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
    required TResult Function(HFReferralDownSyncStartEvent value) downSync,
    required TResult Function(HFReferralDownSyncCheckTotalCountEvent value)
        checkForData,
    required TResult Function(HFReferralDownSyncGetBatchSizeEvent value)
        getBatchSize,
    required TResult Function(HFReferralDownSyncAllBoundariesEvent value)
        downSyncAll,
    required TResult Function(HFReferralDownSyncDownloadAllEvent value)
        downloadAll,
    required TResult Function(HFReferralDownSyncResetStateEvent value)
        resetState,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferralDownSyncStartEvent value)? downSync,
    TResult? Function(HFReferralDownSyncCheckTotalCountEvent value)?
        checkForData,
    TResult? Function(HFReferralDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(HFReferralDownSyncAllBoundariesEvent value)? downSyncAll,
    TResult? Function(HFReferralDownSyncDownloadAllEvent value)? downloadAll,
    TResult? Function(HFReferralDownSyncResetStateEvent value)? resetState,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferralDownSyncStartEvent value)? downSync,
    TResult Function(HFReferralDownSyncCheckTotalCountEvent value)?
        checkForData,
    TResult Function(HFReferralDownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(HFReferralDownSyncAllBoundariesEvent value)? downSyncAll,
    TResult Function(HFReferralDownSyncDownloadAllEvent value)? downloadAll,
    TResult Function(HFReferralDownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState(this);
    }
    return orElse();
  }
}

abstract class HFReferralDownSyncResetStateEvent
    implements HFReferralDownSyncEvent {
  const factory HFReferralDownSyncResetStateEvent() =
      _$HFReferralDownSyncResetStateEventImpl;
}

/// @nodoc
mixin _$HFReferralDownSyncState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)
        allBoundariesDataFound,
    required TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)
        multiBoundaryInProgress,
    required TResult Function(List<DownsyncModel> results) multiBoundarySuccess,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function() pendingSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult? Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult? Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function()? pendingSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function()? pendingSync,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(
            _HFReferralDownSyncAllBoundariesDataFoundState value)
        allBoundariesDataFound,
    required TResult Function(
            _HFReferralDownSyncMultiBoundaryInProgressState value)
        multiBoundaryInProgress,
    required TResult Function(
            _HFReferralDownSyncMultiBoundarySuccessState value)
        multiBoundarySuccess,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
    required TResult Function(_HFReferralDownSyncPendingSyncState value)
        pendingSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult? Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult? Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
    TResult? Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
    TResult Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HFReferralDownSyncStateCopyWith<$Res> {
  factory $HFReferralDownSyncStateCopyWith(HFReferralDownSyncState value,
          $Res Function(HFReferralDownSyncState) then) =
      _$HFReferralDownSyncStateCopyWithImpl<$Res, HFReferralDownSyncState>;
}

/// @nodoc
class _$HFReferralDownSyncStateCopyWithImpl<$Res,
        $Val extends HFReferralDownSyncState>
    implements $HFReferralDownSyncStateCopyWith<$Res> {
  _$HFReferralDownSyncStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HFReferralDownSyncInProgressStateImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncInProgressStateImplCopyWith(
          _$HFReferralDownSyncInProgressStateImpl value,
          $Res Function(_$HFReferralDownSyncInProgressStateImpl) then) =
      __$$HFReferralDownSyncInProgressStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int syncedCount, int totalCount});
}

/// @nodoc
class __$$HFReferralDownSyncInProgressStateImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncStateCopyWithImpl<$Res,
        _$HFReferralDownSyncInProgressStateImpl>
    implements _$$HFReferralDownSyncInProgressStateImplCopyWith<$Res> {
  __$$HFReferralDownSyncInProgressStateImplCopyWithImpl(
      _$HFReferralDownSyncInProgressStateImpl _value,
      $Res Function(_$HFReferralDownSyncInProgressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syncedCount = null,
    Object? totalCount = null,
  }) {
    return _then(_$HFReferralDownSyncInProgressStateImpl(
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

class _$HFReferralDownSyncInProgressStateImpl
    extends _HFReferralDownSyncInProgressState {
  const _$HFReferralDownSyncInProgressStateImpl(
      this.syncedCount, this.totalCount)
      : super._();

  @override
  final int syncedCount;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'HFReferralDownSyncState.inProgress(syncedCount: $syncedCount, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncInProgressStateImpl &&
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
  _$$HFReferralDownSyncInProgressStateImplCopyWith<
          _$HFReferralDownSyncInProgressStateImpl>
      get copyWith => __$$HFReferralDownSyncInProgressStateImplCopyWithImpl<
          _$HFReferralDownSyncInProgressStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)
        allBoundariesDataFound,
    required TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)
        multiBoundaryInProgress,
    required TResult Function(List<DownsyncModel> results) multiBoundarySuccess,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function() pendingSync,
  }) {
    return inProgress(syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult? Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult? Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function()? pendingSync,
  }) {
    return inProgress?.call(syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function()? pendingSync,
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
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(
            _HFReferralDownSyncAllBoundariesDataFoundState value)
        allBoundariesDataFound,
    required TResult Function(
            _HFReferralDownSyncMultiBoundaryInProgressState value)
        multiBoundaryInProgress,
    required TResult Function(
            _HFReferralDownSyncMultiBoundarySuccessState value)
        multiBoundarySuccess,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
    required TResult Function(_HFReferralDownSyncPendingSyncState value)
        pendingSync,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult? Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult? Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
    TResult? Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
    TResult Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _HFReferralDownSyncInProgressState
    extends HFReferralDownSyncState {
  const factory _HFReferralDownSyncInProgressState(
          final int syncedCount, final int totalCount) =
      _$HFReferralDownSyncInProgressStateImpl;
  const _HFReferralDownSyncInProgressState._() : super._();

  int get syncedCount;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncInProgressStateImplCopyWith<
          _$HFReferralDownSyncInProgressStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HFReferralDownSyncSuccessStateImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncSuccessStateImplCopyWith(
          _$HFReferralDownSyncSuccessStateImpl value,
          $Res Function(_$HFReferralDownSyncSuccessStateImpl) then) =
      __$$HFReferralDownSyncSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DownsyncModel downSyncResult});
}

/// @nodoc
class __$$HFReferralDownSyncSuccessStateImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncStateCopyWithImpl<$Res,
        _$HFReferralDownSyncSuccessStateImpl>
    implements _$$HFReferralDownSyncSuccessStateImplCopyWith<$Res> {
  __$$HFReferralDownSyncSuccessStateImplCopyWithImpl(
      _$HFReferralDownSyncSuccessStateImpl _value,
      $Res Function(_$HFReferralDownSyncSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downSyncResult = null,
  }) {
    return _then(_$HFReferralDownSyncSuccessStateImpl(
      null == downSyncResult
          ? _value.downSyncResult
          : downSyncResult // ignore: cast_nullable_to_non_nullable
              as DownsyncModel,
    ));
  }
}

/// @nodoc

class _$HFReferralDownSyncSuccessStateImpl
    extends _HFReferralDownSyncSuccessState {
  const _$HFReferralDownSyncSuccessStateImpl(this.downSyncResult) : super._();

  @override
  final DownsyncModel downSyncResult;

  @override
  String toString() {
    return 'HFReferralDownSyncState.success(downSyncResult: $downSyncResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncSuccessStateImpl &&
            (identical(other.downSyncResult, downSyncResult) ||
                other.downSyncResult == downSyncResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, downSyncResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferralDownSyncSuccessStateImplCopyWith<
          _$HFReferralDownSyncSuccessStateImpl>
      get copyWith => __$$HFReferralDownSyncSuccessStateImplCopyWithImpl<
          _$HFReferralDownSyncSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)
        allBoundariesDataFound,
    required TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)
        multiBoundaryInProgress,
    required TResult Function(List<DownsyncModel> results) multiBoundarySuccess,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function() pendingSync,
  }) {
    return success(downSyncResult);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult? Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult? Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function()? pendingSync,
  }) {
    return success?.call(downSyncResult);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function()? pendingSync,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(downSyncResult);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(
            _HFReferralDownSyncAllBoundariesDataFoundState value)
        allBoundariesDataFound,
    required TResult Function(
            _HFReferralDownSyncMultiBoundaryInProgressState value)
        multiBoundaryInProgress,
    required TResult Function(
            _HFReferralDownSyncMultiBoundarySuccessState value)
        multiBoundarySuccess,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
    required TResult Function(_HFReferralDownSyncPendingSyncState value)
        pendingSync,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult? Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult? Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
    TResult? Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
    TResult Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _HFReferralDownSyncSuccessState extends HFReferralDownSyncState {
  const factory _HFReferralDownSyncSuccessState(
          final DownsyncModel downSyncResult) =
      _$HFReferralDownSyncSuccessStateImpl;
  const _HFReferralDownSyncSuccessState._() : super._();

  DownsyncModel get downSyncResult;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncSuccessStateImplCopyWith<
          _$HFReferralDownSyncSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HFReferralDownSyncGetBatchSizeStateImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncGetBatchSizeStateImplCopyWith(
          _$HFReferralDownSyncGetBatchSizeStateImpl value,
          $Res Function(_$HFReferralDownSyncGetBatchSizeStateImpl) then) =
      __$$HFReferralDownSyncGetBatchSizeStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int batchSize,
      String projectId,
      List<BoundaryModel> boundaries,
      int pendingSyncCount});
}

/// @nodoc
class __$$HFReferralDownSyncGetBatchSizeStateImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncStateCopyWithImpl<$Res,
        _$HFReferralDownSyncGetBatchSizeStateImpl>
    implements _$$HFReferralDownSyncGetBatchSizeStateImplCopyWith<$Res> {
  __$$HFReferralDownSyncGetBatchSizeStateImplCopyWithImpl(
      _$HFReferralDownSyncGetBatchSizeStateImpl _value,
      $Res Function(_$HFReferralDownSyncGetBatchSizeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batchSize = null,
    Object? projectId = null,
    Object? boundaries = null,
    Object? pendingSyncCount = null,
  }) {
    return _then(_$HFReferralDownSyncGetBatchSizeStateImpl(
      null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
      null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      null == boundaries
          ? _value._boundaries
          : boundaries // ignore: cast_nullable_to_non_nullable
              as List<BoundaryModel>,
      null == pendingSyncCount
          ? _value.pendingSyncCount
          : pendingSyncCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HFReferralDownSyncGetBatchSizeStateImpl
    extends _HFReferralDownSyncGetBatchSizeState {
  const _$HFReferralDownSyncGetBatchSizeStateImpl(
      this.batchSize,
      this.projectId,
      final List<BoundaryModel> boundaries,
      this.pendingSyncCount)
      : _boundaries = boundaries,
        super._();

  @override
  final int batchSize;
  @override
  final String projectId;
  final List<BoundaryModel> _boundaries;
  @override
  List<BoundaryModel> get boundaries {
    if (_boundaries is EqualUnmodifiableListView) return _boundaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boundaries);
  }

  @override
  final int pendingSyncCount;

  @override
  String toString() {
    return 'HFReferralDownSyncState.getBatchSize(batchSize: $batchSize, projectId: $projectId, boundaries: $boundaries, pendingSyncCount: $pendingSyncCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncGetBatchSizeStateImpl &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality()
                .equals(other._boundaries, _boundaries) &&
            (identical(other.pendingSyncCount, pendingSyncCount) ||
                other.pendingSyncCount == pendingSyncCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, batchSize, projectId,
      const DeepCollectionEquality().hash(_boundaries), pendingSyncCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferralDownSyncGetBatchSizeStateImplCopyWith<
          _$HFReferralDownSyncGetBatchSizeStateImpl>
      get copyWith => __$$HFReferralDownSyncGetBatchSizeStateImplCopyWithImpl<
          _$HFReferralDownSyncGetBatchSizeStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)
        allBoundariesDataFound,
    required TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)
        multiBoundaryInProgress,
    required TResult Function(List<DownsyncModel> results) multiBoundarySuccess,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function() pendingSync,
  }) {
    return getBatchSize(batchSize, projectId, boundaries, pendingSyncCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult? Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult? Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function()? pendingSync,
  }) {
    return getBatchSize?.call(
        batchSize, projectId, boundaries, pendingSyncCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function()? pendingSync,
    required TResult orElse(),
  }) {
    if (getBatchSize != null) {
      return getBatchSize(batchSize, projectId, boundaries, pendingSyncCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(
            _HFReferralDownSyncAllBoundariesDataFoundState value)
        allBoundariesDataFound,
    required TResult Function(
            _HFReferralDownSyncMultiBoundaryInProgressState value)
        multiBoundaryInProgress,
    required TResult Function(
            _HFReferralDownSyncMultiBoundarySuccessState value)
        multiBoundarySuccess,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
    required TResult Function(_HFReferralDownSyncPendingSyncState value)
        pendingSync,
  }) {
    return getBatchSize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult? Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult? Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
    TResult? Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
  }) {
    return getBatchSize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
    TResult Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (getBatchSize != null) {
      return getBatchSize(this);
    }
    return orElse();
  }
}

abstract class _HFReferralDownSyncGetBatchSizeState
    extends HFReferralDownSyncState {
  const factory _HFReferralDownSyncGetBatchSizeState(
      final int batchSize,
      final String projectId,
      final List<BoundaryModel> boundaries,
      final int pendingSyncCount) = _$HFReferralDownSyncGetBatchSizeStateImpl;
  const _HFReferralDownSyncGetBatchSizeState._() : super._();

  int get batchSize;
  String get projectId;
  List<BoundaryModel> get boundaries;
  int get pendingSyncCount;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncGetBatchSizeStateImplCopyWith<
          _$HFReferralDownSyncGetBatchSizeStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HFReferralDownSyncLoadingStateImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncLoadingStateImplCopyWith(
          _$HFReferralDownSyncLoadingStateImpl value,
          $Res Function(_$HFReferralDownSyncLoadingStateImpl) then) =
      __$$HFReferralDownSyncLoadingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isPop});
}

/// @nodoc
class __$$HFReferralDownSyncLoadingStateImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncStateCopyWithImpl<$Res,
        _$HFReferralDownSyncLoadingStateImpl>
    implements _$$HFReferralDownSyncLoadingStateImplCopyWith<$Res> {
  __$$HFReferralDownSyncLoadingStateImplCopyWithImpl(
      _$HFReferralDownSyncLoadingStateImpl _value,
      $Res Function(_$HFReferralDownSyncLoadingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPop = null,
  }) {
    return _then(_$HFReferralDownSyncLoadingStateImpl(
      null == isPop
          ? _value.isPop
          : isPop // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HFReferralDownSyncLoadingStateImpl
    extends _HFReferralDownSyncLoadingState {
  const _$HFReferralDownSyncLoadingStateImpl(this.isPop) : super._();

  @override
  final bool isPop;

  @override
  String toString() {
    return 'HFReferralDownSyncState.loading(isPop: $isPop)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncLoadingStateImpl &&
            (identical(other.isPop, isPop) || other.isPop == isPop));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPop);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferralDownSyncLoadingStateImplCopyWith<
          _$HFReferralDownSyncLoadingStateImpl>
      get copyWith => __$$HFReferralDownSyncLoadingStateImplCopyWithImpl<
          _$HFReferralDownSyncLoadingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)
        allBoundariesDataFound,
    required TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)
        multiBoundaryInProgress,
    required TResult Function(List<DownsyncModel> results) multiBoundarySuccess,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function() pendingSync,
  }) {
    return loading(isPop);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult? Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult? Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function()? pendingSync,
  }) {
    return loading?.call(isPop);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function()? pendingSync,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(isPop);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(
            _HFReferralDownSyncAllBoundariesDataFoundState value)
        allBoundariesDataFound,
    required TResult Function(
            _HFReferralDownSyncMultiBoundaryInProgressState value)
        multiBoundaryInProgress,
    required TResult Function(
            _HFReferralDownSyncMultiBoundarySuccessState value)
        multiBoundarySuccess,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
    required TResult Function(_HFReferralDownSyncPendingSyncState value)
        pendingSync,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult? Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult? Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
    TResult? Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
    TResult Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _HFReferralDownSyncLoadingState extends HFReferralDownSyncState {
  const factory _HFReferralDownSyncLoadingState(final bool isPop) =
      _$HFReferralDownSyncLoadingStateImpl;
  const _HFReferralDownSyncLoadingState._() : super._();

  bool get isPop;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncLoadingStateImplCopyWith<
          _$HFReferralDownSyncLoadingStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HFReferralDownSyncDataFoundStateImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncDataFoundStateImplCopyWith(
          _$HFReferralDownSyncDataFoundStateImpl value,
          $Res Function(_$HFReferralDownSyncDataFoundStateImpl) then) =
      __$$HFReferralDownSyncDataFoundStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int initialServerCount, int batchSize, int offset, int? lastSyncedTime});
}

/// @nodoc
class __$$HFReferralDownSyncDataFoundStateImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncStateCopyWithImpl<$Res,
        _$HFReferralDownSyncDataFoundStateImpl>
    implements _$$HFReferralDownSyncDataFoundStateImplCopyWith<$Res> {
  __$$HFReferralDownSyncDataFoundStateImplCopyWithImpl(
      _$HFReferralDownSyncDataFoundStateImpl _value,
      $Res Function(_$HFReferralDownSyncDataFoundStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialServerCount = null,
    Object? batchSize = null,
    Object? offset = null,
    Object? lastSyncedTime = freezed,
  }) {
    return _then(_$HFReferralDownSyncDataFoundStateImpl(
      null == initialServerCount
          ? _value.initialServerCount
          : initialServerCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
      null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == lastSyncedTime
          ? _value.lastSyncedTime
          : lastSyncedTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$HFReferralDownSyncDataFoundStateImpl
    extends _HFReferralDownSyncDataFoundState {
  const _$HFReferralDownSyncDataFoundStateImpl(
      this.initialServerCount, this.batchSize, this.offset, this.lastSyncedTime)
      : super._();

  @override
  final int initialServerCount;
  @override
  final int batchSize;
  @override
  final int offset;
  @override
  final int? lastSyncedTime;

  @override
  String toString() {
    return 'HFReferralDownSyncState.dataFound(initialServerCount: $initialServerCount, batchSize: $batchSize, offset: $offset, lastSyncedTime: $lastSyncedTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncDataFoundStateImpl &&
            (identical(other.initialServerCount, initialServerCount) ||
                other.initialServerCount == initialServerCount) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.lastSyncedTime, lastSyncedTime) ||
                other.lastSyncedTime == lastSyncedTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, initialServerCount, batchSize, offset, lastSyncedTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferralDownSyncDataFoundStateImplCopyWith<
          _$HFReferralDownSyncDataFoundStateImpl>
      get copyWith => __$$HFReferralDownSyncDataFoundStateImplCopyWithImpl<
          _$HFReferralDownSyncDataFoundStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)
        allBoundariesDataFound,
    required TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)
        multiBoundaryInProgress,
    required TResult Function(List<DownsyncModel> results) multiBoundarySuccess,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function() pendingSync,
  }) {
    return dataFound(initialServerCount, batchSize, offset, lastSyncedTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult? Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult? Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function()? pendingSync,
  }) {
    return dataFound?.call(
        initialServerCount, batchSize, offset, lastSyncedTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function()? pendingSync,
    required TResult orElse(),
  }) {
    if (dataFound != null) {
      return dataFound(initialServerCount, batchSize, offset, lastSyncedTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(
            _HFReferralDownSyncAllBoundariesDataFoundState value)
        allBoundariesDataFound,
    required TResult Function(
            _HFReferralDownSyncMultiBoundaryInProgressState value)
        multiBoundaryInProgress,
    required TResult Function(
            _HFReferralDownSyncMultiBoundarySuccessState value)
        multiBoundarySuccess,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
    required TResult Function(_HFReferralDownSyncPendingSyncState value)
        pendingSync,
  }) {
    return dataFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult? Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult? Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
    TResult? Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
  }) {
    return dataFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
    TResult Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (dataFound != null) {
      return dataFound(this);
    }
    return orElse();
  }
}

abstract class _HFReferralDownSyncDataFoundState
    extends HFReferralDownSyncState {
  const factory _HFReferralDownSyncDataFoundState(
      final int initialServerCount,
      final int batchSize,
      final int offset,
      final int? lastSyncedTime) = _$HFReferralDownSyncDataFoundStateImpl;
  const _HFReferralDownSyncDataFoundState._() : super._();

  int get initialServerCount;
  int get batchSize;
  int get offset;
  int? get lastSyncedTime;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncDataFoundStateImplCopyWith<
          _$HFReferralDownSyncDataFoundStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HFReferralDownSyncAllBoundariesDataFoundStateImplCopyWith<
    $Res> {
  factory _$$HFReferralDownSyncAllBoundariesDataFoundStateImplCopyWith(
          _$HFReferralDownSyncAllBoundariesDataFoundStateImpl value,
          $Res Function(_$HFReferralDownSyncAllBoundariesDataFoundStateImpl)
              then) =
      __$$HFReferralDownSyncAllBoundariesDataFoundStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int initialServerCount, int batchSize, Map<String, int> boundaryCounts});
}

/// @nodoc
class __$$HFReferralDownSyncAllBoundariesDataFoundStateImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncStateCopyWithImpl<$Res,
        _$HFReferralDownSyncAllBoundariesDataFoundStateImpl>
    implements
        _$$HFReferralDownSyncAllBoundariesDataFoundStateImplCopyWith<$Res> {
  __$$HFReferralDownSyncAllBoundariesDataFoundStateImplCopyWithImpl(
      _$HFReferralDownSyncAllBoundariesDataFoundStateImpl _value,
      $Res Function(_$HFReferralDownSyncAllBoundariesDataFoundStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialServerCount = null,
    Object? batchSize = null,
    Object? boundaryCounts = null,
  }) {
    return _then(_$HFReferralDownSyncAllBoundariesDataFoundStateImpl(
      null == initialServerCount
          ? _value.initialServerCount
          : initialServerCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
      null == boundaryCounts
          ? _value._boundaryCounts
          : boundaryCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc

class _$HFReferralDownSyncAllBoundariesDataFoundStateImpl
    extends _HFReferralDownSyncAllBoundariesDataFoundState {
  const _$HFReferralDownSyncAllBoundariesDataFoundStateImpl(
      this.initialServerCount,
      this.batchSize,
      final Map<String, int> boundaryCounts)
      : _boundaryCounts = boundaryCounts,
        super._();

  @override
  final int initialServerCount;
  @override
  final int batchSize;
  final Map<String, int> _boundaryCounts;
  @override
  Map<String, int> get boundaryCounts {
    if (_boundaryCounts is EqualUnmodifiableMapView) return _boundaryCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_boundaryCounts);
  }

  @override
  String toString() {
    return 'HFReferralDownSyncState.allBoundariesDataFound(initialServerCount: $initialServerCount, batchSize: $batchSize, boundaryCounts: $boundaryCounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncAllBoundariesDataFoundStateImpl &&
            (identical(other.initialServerCount, initialServerCount) ||
                other.initialServerCount == initialServerCount) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize) &&
            const DeepCollectionEquality()
                .equals(other._boundaryCounts, _boundaryCounts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, initialServerCount, batchSize,
      const DeepCollectionEquality().hash(_boundaryCounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferralDownSyncAllBoundariesDataFoundStateImplCopyWith<
          _$HFReferralDownSyncAllBoundariesDataFoundStateImpl>
      get copyWith =>
          __$$HFReferralDownSyncAllBoundariesDataFoundStateImplCopyWithImpl<
                  _$HFReferralDownSyncAllBoundariesDataFoundStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)
        allBoundariesDataFound,
    required TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)
        multiBoundaryInProgress,
    required TResult Function(List<DownsyncModel> results) multiBoundarySuccess,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function() pendingSync,
  }) {
    return allBoundariesDataFound(
        initialServerCount, batchSize, boundaryCounts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult? Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult? Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function()? pendingSync,
  }) {
    return allBoundariesDataFound?.call(
        initialServerCount, batchSize, boundaryCounts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function()? pendingSync,
    required TResult orElse(),
  }) {
    if (allBoundariesDataFound != null) {
      return allBoundariesDataFound(
          initialServerCount, batchSize, boundaryCounts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(
            _HFReferralDownSyncAllBoundariesDataFoundState value)
        allBoundariesDataFound,
    required TResult Function(
            _HFReferralDownSyncMultiBoundaryInProgressState value)
        multiBoundaryInProgress,
    required TResult Function(
            _HFReferralDownSyncMultiBoundarySuccessState value)
        multiBoundarySuccess,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
    required TResult Function(_HFReferralDownSyncPendingSyncState value)
        pendingSync,
  }) {
    return allBoundariesDataFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult? Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult? Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
    TResult? Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
  }) {
    return allBoundariesDataFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
    TResult Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (allBoundariesDataFound != null) {
      return allBoundariesDataFound(this);
    }
    return orElse();
  }
}

abstract class _HFReferralDownSyncAllBoundariesDataFoundState
    extends HFReferralDownSyncState {
  const factory _HFReferralDownSyncAllBoundariesDataFoundState(
          final int initialServerCount,
          final int batchSize,
          final Map<String, int> boundaryCounts) =
      _$HFReferralDownSyncAllBoundariesDataFoundStateImpl;
  const _HFReferralDownSyncAllBoundariesDataFoundState._() : super._();

  int get initialServerCount;
  int get batchSize;
  Map<String, int> get boundaryCounts;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncAllBoundariesDataFoundStateImplCopyWith<
          _$HFReferralDownSyncAllBoundariesDataFoundStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HFReferralDownSyncMultiBoundaryInProgressStateImplCopyWith<
    $Res> {
  factory _$$HFReferralDownSyncMultiBoundaryInProgressStateImplCopyWith(
          _$HFReferralDownSyncMultiBoundaryInProgressStateImpl value,
          $Res Function(_$HFReferralDownSyncMultiBoundaryInProgressStateImpl)
              then) =
      __$$HFReferralDownSyncMultiBoundaryInProgressStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int currentBoundaryIndex,
      int totalBoundaries,
      String currentBoundaryName,
      int syncedCount,
      int totalCount});
}

/// @nodoc
class __$$HFReferralDownSyncMultiBoundaryInProgressStateImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncStateCopyWithImpl<$Res,
        _$HFReferralDownSyncMultiBoundaryInProgressStateImpl>
    implements
        _$$HFReferralDownSyncMultiBoundaryInProgressStateImplCopyWith<$Res> {
  __$$HFReferralDownSyncMultiBoundaryInProgressStateImplCopyWithImpl(
      _$HFReferralDownSyncMultiBoundaryInProgressStateImpl _value,
      $Res Function(_$HFReferralDownSyncMultiBoundaryInProgressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentBoundaryIndex = null,
    Object? totalBoundaries = null,
    Object? currentBoundaryName = null,
    Object? syncedCount = null,
    Object? totalCount = null,
  }) {
    return _then(_$HFReferralDownSyncMultiBoundaryInProgressStateImpl(
      null == currentBoundaryIndex
          ? _value.currentBoundaryIndex
          : currentBoundaryIndex // ignore: cast_nullable_to_non_nullable
              as int,
      null == totalBoundaries
          ? _value.totalBoundaries
          : totalBoundaries // ignore: cast_nullable_to_non_nullable
              as int,
      null == currentBoundaryName
          ? _value.currentBoundaryName
          : currentBoundaryName // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$HFReferralDownSyncMultiBoundaryInProgressStateImpl
    extends _HFReferralDownSyncMultiBoundaryInProgressState {
  const _$HFReferralDownSyncMultiBoundaryInProgressStateImpl(
      this.currentBoundaryIndex,
      this.totalBoundaries,
      this.currentBoundaryName,
      this.syncedCount,
      this.totalCount)
      : super._();

  @override
  final int currentBoundaryIndex;
  @override
  final int totalBoundaries;
  @override
  final String currentBoundaryName;
  @override
  final int syncedCount;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'HFReferralDownSyncState.multiBoundaryInProgress(currentBoundaryIndex: $currentBoundaryIndex, totalBoundaries: $totalBoundaries, currentBoundaryName: $currentBoundaryName, syncedCount: $syncedCount, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncMultiBoundaryInProgressStateImpl &&
            (identical(other.currentBoundaryIndex, currentBoundaryIndex) ||
                other.currentBoundaryIndex == currentBoundaryIndex) &&
            (identical(other.totalBoundaries, totalBoundaries) ||
                other.totalBoundaries == totalBoundaries) &&
            (identical(other.currentBoundaryName, currentBoundaryName) ||
                other.currentBoundaryName == currentBoundaryName) &&
            (identical(other.syncedCount, syncedCount) ||
                other.syncedCount == syncedCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentBoundaryIndex,
      totalBoundaries, currentBoundaryName, syncedCount, totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferralDownSyncMultiBoundaryInProgressStateImplCopyWith<
          _$HFReferralDownSyncMultiBoundaryInProgressStateImpl>
      get copyWith =>
          __$$HFReferralDownSyncMultiBoundaryInProgressStateImplCopyWithImpl<
                  _$HFReferralDownSyncMultiBoundaryInProgressStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)
        allBoundariesDataFound,
    required TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)
        multiBoundaryInProgress,
    required TResult Function(List<DownsyncModel> results) multiBoundarySuccess,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function() pendingSync,
  }) {
    return multiBoundaryInProgress(currentBoundaryIndex, totalBoundaries,
        currentBoundaryName, syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult? Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult? Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function()? pendingSync,
  }) {
    return multiBoundaryInProgress?.call(currentBoundaryIndex, totalBoundaries,
        currentBoundaryName, syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function()? pendingSync,
    required TResult orElse(),
  }) {
    if (multiBoundaryInProgress != null) {
      return multiBoundaryInProgress(currentBoundaryIndex, totalBoundaries,
          currentBoundaryName, syncedCount, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(
            _HFReferralDownSyncAllBoundariesDataFoundState value)
        allBoundariesDataFound,
    required TResult Function(
            _HFReferralDownSyncMultiBoundaryInProgressState value)
        multiBoundaryInProgress,
    required TResult Function(
            _HFReferralDownSyncMultiBoundarySuccessState value)
        multiBoundarySuccess,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
    required TResult Function(_HFReferralDownSyncPendingSyncState value)
        pendingSync,
  }) {
    return multiBoundaryInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult? Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult? Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
    TResult? Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
  }) {
    return multiBoundaryInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
    TResult Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (multiBoundaryInProgress != null) {
      return multiBoundaryInProgress(this);
    }
    return orElse();
  }
}

abstract class _HFReferralDownSyncMultiBoundaryInProgressState
    extends HFReferralDownSyncState {
  const factory _HFReferralDownSyncMultiBoundaryInProgressState(
          final int currentBoundaryIndex,
          final int totalBoundaries,
          final String currentBoundaryName,
          final int syncedCount,
          final int totalCount) =
      _$HFReferralDownSyncMultiBoundaryInProgressStateImpl;
  const _HFReferralDownSyncMultiBoundaryInProgressState._() : super._();

  int get currentBoundaryIndex;
  int get totalBoundaries;
  String get currentBoundaryName;
  int get syncedCount;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncMultiBoundaryInProgressStateImplCopyWith<
          _$HFReferralDownSyncMultiBoundaryInProgressStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HFReferralDownSyncMultiBoundarySuccessStateImplCopyWith<
    $Res> {
  factory _$$HFReferralDownSyncMultiBoundarySuccessStateImplCopyWith(
          _$HFReferralDownSyncMultiBoundarySuccessStateImpl value,
          $Res Function(_$HFReferralDownSyncMultiBoundarySuccessStateImpl)
              then) =
      __$$HFReferralDownSyncMultiBoundarySuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DownsyncModel> results});
}

/// @nodoc
class __$$HFReferralDownSyncMultiBoundarySuccessStateImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncStateCopyWithImpl<$Res,
        _$HFReferralDownSyncMultiBoundarySuccessStateImpl>
    implements
        _$$HFReferralDownSyncMultiBoundarySuccessStateImplCopyWith<$Res> {
  __$$HFReferralDownSyncMultiBoundarySuccessStateImplCopyWithImpl(
      _$HFReferralDownSyncMultiBoundarySuccessStateImpl _value,
      $Res Function(_$HFReferralDownSyncMultiBoundarySuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$HFReferralDownSyncMultiBoundarySuccessStateImpl(
      null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<DownsyncModel>,
    ));
  }
}

/// @nodoc

class _$HFReferralDownSyncMultiBoundarySuccessStateImpl
    extends _HFReferralDownSyncMultiBoundarySuccessState {
  const _$HFReferralDownSyncMultiBoundarySuccessStateImpl(
      final List<DownsyncModel> results)
      : _results = results,
        super._();

  final List<DownsyncModel> _results;
  @override
  List<DownsyncModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'HFReferralDownSyncState.multiBoundarySuccess(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncMultiBoundarySuccessStateImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferralDownSyncMultiBoundarySuccessStateImplCopyWith<
          _$HFReferralDownSyncMultiBoundarySuccessStateImpl>
      get copyWith =>
          __$$HFReferralDownSyncMultiBoundarySuccessStateImplCopyWithImpl<
                  _$HFReferralDownSyncMultiBoundarySuccessStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)
        allBoundariesDataFound,
    required TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)
        multiBoundaryInProgress,
    required TResult Function(List<DownsyncModel> results) multiBoundarySuccess,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function() pendingSync,
  }) {
    return multiBoundarySuccess(results);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult? Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult? Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function()? pendingSync,
  }) {
    return multiBoundarySuccess?.call(results);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function()? pendingSync,
    required TResult orElse(),
  }) {
    if (multiBoundarySuccess != null) {
      return multiBoundarySuccess(results);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(
            _HFReferralDownSyncAllBoundariesDataFoundState value)
        allBoundariesDataFound,
    required TResult Function(
            _HFReferralDownSyncMultiBoundaryInProgressState value)
        multiBoundaryInProgress,
    required TResult Function(
            _HFReferralDownSyncMultiBoundarySuccessState value)
        multiBoundarySuccess,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
    required TResult Function(_HFReferralDownSyncPendingSyncState value)
        pendingSync,
  }) {
    return multiBoundarySuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult? Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult? Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
    TResult? Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
  }) {
    return multiBoundarySuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
    TResult Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (multiBoundarySuccess != null) {
      return multiBoundarySuccess(this);
    }
    return orElse();
  }
}

abstract class _HFReferralDownSyncMultiBoundarySuccessState
    extends HFReferralDownSyncState {
  const factory _HFReferralDownSyncMultiBoundarySuccessState(
          final List<DownsyncModel> results) =
      _$HFReferralDownSyncMultiBoundarySuccessStateImpl;
  const _HFReferralDownSyncMultiBoundarySuccessState._() : super._();

  List<DownsyncModel> get results;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncMultiBoundarySuccessStateImplCopyWith<
          _$HFReferralDownSyncMultiBoundarySuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HFReferralDownSyncResetStateImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncResetStateImplCopyWith(
          _$HFReferralDownSyncResetStateImpl value,
          $Res Function(_$HFReferralDownSyncResetStateImpl) then) =
      __$$HFReferralDownSyncResetStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HFReferralDownSyncResetStateImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncStateCopyWithImpl<$Res,
        _$HFReferralDownSyncResetStateImpl>
    implements _$$HFReferralDownSyncResetStateImplCopyWith<$Res> {
  __$$HFReferralDownSyncResetStateImplCopyWithImpl(
      _$HFReferralDownSyncResetStateImpl _value,
      $Res Function(_$HFReferralDownSyncResetStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HFReferralDownSyncResetStateImpl extends _HFReferralDownSyncResetState {
  const _$HFReferralDownSyncResetStateImpl() : super._();

  @override
  String toString() {
    return 'HFReferralDownSyncState.resetState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncResetStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)
        allBoundariesDataFound,
    required TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)
        multiBoundaryInProgress,
    required TResult Function(List<DownsyncModel> results) multiBoundarySuccess,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function() pendingSync,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult? Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult? Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function()? pendingSync,
  }) {
    return resetState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function()? pendingSync,
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
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(
            _HFReferralDownSyncAllBoundariesDataFoundState value)
        allBoundariesDataFound,
    required TResult Function(
            _HFReferralDownSyncMultiBoundaryInProgressState value)
        multiBoundaryInProgress,
    required TResult Function(
            _HFReferralDownSyncMultiBoundarySuccessState value)
        multiBoundarySuccess,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
    required TResult Function(_HFReferralDownSyncPendingSyncState value)
        pendingSync,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult? Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult? Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
    TResult? Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
    TResult Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState(this);
    }
    return orElse();
  }
}

abstract class _HFReferralDownSyncResetState extends HFReferralDownSyncState {
  const factory _HFReferralDownSyncResetState() =
      _$HFReferralDownSyncResetStateImpl;
  const _HFReferralDownSyncResetState._() : super._();
}

/// @nodoc
abstract class _$$HFReferralDownSyncCountCheckFailedStateImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncCountCheckFailedStateImplCopyWith(
          _$HFReferralDownSyncCountCheckFailedStateImpl value,
          $Res Function(_$HFReferralDownSyncCountCheckFailedStateImpl) then) =
      __$$HFReferralDownSyncCountCheckFailedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HFReferralDownSyncCountCheckFailedStateImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncStateCopyWithImpl<$Res,
        _$HFReferralDownSyncCountCheckFailedStateImpl>
    implements _$$HFReferralDownSyncCountCheckFailedStateImplCopyWith<$Res> {
  __$$HFReferralDownSyncCountCheckFailedStateImplCopyWithImpl(
      _$HFReferralDownSyncCountCheckFailedStateImpl _value,
      $Res Function(_$HFReferralDownSyncCountCheckFailedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HFReferralDownSyncCountCheckFailedStateImpl
    extends _HFReferralDownSyncCountCheckFailedState {
  const _$HFReferralDownSyncCountCheckFailedStateImpl() : super._();

  @override
  String toString() {
    return 'HFReferralDownSyncState.totalCountCheckFailed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncCountCheckFailedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)
        allBoundariesDataFound,
    required TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)
        multiBoundaryInProgress,
    required TResult Function(List<DownsyncModel> results) multiBoundarySuccess,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function() pendingSync,
  }) {
    return totalCountCheckFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult? Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult? Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function()? pendingSync,
  }) {
    return totalCountCheckFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function()? pendingSync,
    required TResult orElse(),
  }) {
    if (totalCountCheckFailed != null) {
      return totalCountCheckFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(
            _HFReferralDownSyncAllBoundariesDataFoundState value)
        allBoundariesDataFound,
    required TResult Function(
            _HFReferralDownSyncMultiBoundaryInProgressState value)
        multiBoundaryInProgress,
    required TResult Function(
            _HFReferralDownSyncMultiBoundarySuccessState value)
        multiBoundarySuccess,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
    required TResult Function(_HFReferralDownSyncPendingSyncState value)
        pendingSync,
  }) {
    return totalCountCheckFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult? Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult? Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
    TResult? Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
  }) {
    return totalCountCheckFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
    TResult Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (totalCountCheckFailed != null) {
      return totalCountCheckFailed(this);
    }
    return orElse();
  }
}

abstract class _HFReferralDownSyncCountCheckFailedState
    extends HFReferralDownSyncState {
  const factory _HFReferralDownSyncCountCheckFailedState() =
      _$HFReferralDownSyncCountCheckFailedStateImpl;
  const _HFReferralDownSyncCountCheckFailedState._() : super._();
}

/// @nodoc
abstract class _$$HFReferralDownSyncFailureStateImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncFailureStateImplCopyWith(
          _$HFReferralDownSyncFailureStateImpl value,
          $Res Function(_$HFReferralDownSyncFailureStateImpl) then) =
      __$$HFReferralDownSyncFailureStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HFReferralDownSyncFailureStateImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncStateCopyWithImpl<$Res,
        _$HFReferralDownSyncFailureStateImpl>
    implements _$$HFReferralDownSyncFailureStateImplCopyWith<$Res> {
  __$$HFReferralDownSyncFailureStateImplCopyWithImpl(
      _$HFReferralDownSyncFailureStateImpl _value,
      $Res Function(_$HFReferralDownSyncFailureStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HFReferralDownSyncFailureStateImpl
    extends _HFReferralDownSyncFailureState {
  const _$HFReferralDownSyncFailureStateImpl() : super._();

  @override
  String toString() {
    return 'HFReferralDownSyncState.failed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncFailureStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)
        allBoundariesDataFound,
    required TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)
        multiBoundaryInProgress,
    required TResult Function(List<DownsyncModel> results) multiBoundarySuccess,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function() pendingSync,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult? Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult? Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function()? pendingSync,
  }) {
    return failed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function()? pendingSync,
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
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(
            _HFReferralDownSyncAllBoundariesDataFoundState value)
        allBoundariesDataFound,
    required TResult Function(
            _HFReferralDownSyncMultiBoundaryInProgressState value)
        multiBoundaryInProgress,
    required TResult Function(
            _HFReferralDownSyncMultiBoundarySuccessState value)
        multiBoundarySuccess,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
    required TResult Function(_HFReferralDownSyncPendingSyncState value)
        pendingSync,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult? Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult? Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
    TResult? Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
    TResult Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _HFReferralDownSyncFailureState extends HFReferralDownSyncState {
  const factory _HFReferralDownSyncFailureState() =
      _$HFReferralDownSyncFailureStateImpl;
  const _HFReferralDownSyncFailureState._() : super._();
}

/// @nodoc
abstract class _$$HFReferralDownSyncPendingSyncStateImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncPendingSyncStateImplCopyWith(
          _$HFReferralDownSyncPendingSyncStateImpl value,
          $Res Function(_$HFReferralDownSyncPendingSyncStateImpl) then) =
      __$$HFReferralDownSyncPendingSyncStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HFReferralDownSyncPendingSyncStateImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncStateCopyWithImpl<$Res,
        _$HFReferralDownSyncPendingSyncStateImpl>
    implements _$$HFReferralDownSyncPendingSyncStateImplCopyWith<$Res> {
  __$$HFReferralDownSyncPendingSyncStateImplCopyWithImpl(
      _$HFReferralDownSyncPendingSyncStateImpl _value,
      $Res Function(_$HFReferralDownSyncPendingSyncStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HFReferralDownSyncPendingSyncStateImpl
    extends _HFReferralDownSyncPendingSyncState {
  const _$HFReferralDownSyncPendingSyncStateImpl() : super._();

  @override
  String toString() {
    return 'HFReferralDownSyncState.pendingSync()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncPendingSyncStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)
        dataFound,
    required TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)
        allBoundariesDataFound,
    required TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)
        multiBoundaryInProgress,
    required TResult Function(List<DownsyncModel> results) multiBoundarySuccess,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function() pendingSync,
  }) {
    return pendingSync();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult? Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult? Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult? Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function()? pendingSync,
  }) {
    return pendingSync?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId,
            List<BoundaryModel> boundaries, int pendingSyncCount)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function(int initialServerCount, int batchSize, int offset,
            int? lastSyncedTime)?
        dataFound,
    TResult Function(int initialServerCount, int batchSize,
            Map<String, int> boundaryCounts)?
        allBoundariesDataFound,
    TResult Function(int currentBoundaryIndex, int totalBoundaries,
            String currentBoundaryName, int syncedCount, int totalCount)?
        multiBoundaryInProgress,
    TResult Function(List<DownsyncModel> results)? multiBoundarySuccess,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function()? pendingSync,
    required TResult orElse(),
  }) {
    if (pendingSync != null) {
      return pendingSync();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncGetBatchSizeState value)
        getBatchSize,
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(
            _HFReferralDownSyncAllBoundariesDataFoundState value)
        allBoundariesDataFound,
    required TResult Function(
            _HFReferralDownSyncMultiBoundaryInProgressState value)
        multiBoundaryInProgress,
    required TResult Function(
            _HFReferralDownSyncMultiBoundarySuccessState value)
        multiBoundarySuccess,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
    required TResult Function(_HFReferralDownSyncPendingSyncState value)
        pendingSync,
  }) {
    return pendingSync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult? Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult? Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
    TResult? Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
  }) {
    return pendingSync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncAllBoundariesDataFoundState value)?
        allBoundariesDataFound,
    TResult Function(_HFReferralDownSyncMultiBoundaryInProgressState value)?
        multiBoundaryInProgress,
    TResult Function(_HFReferralDownSyncMultiBoundarySuccessState value)?
        multiBoundarySuccess,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
    TResult Function(_HFReferralDownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (pendingSync != null) {
      return pendingSync(this);
    }
    return orElse();
  }
}

abstract class _HFReferralDownSyncPendingSyncState
    extends HFReferralDownSyncState {
  const factory _HFReferralDownSyncPendingSyncState() =
      _$HFReferralDownSyncPendingSyncStateImpl;
  const _HFReferralDownSyncPendingSyncState._() : super._();
}

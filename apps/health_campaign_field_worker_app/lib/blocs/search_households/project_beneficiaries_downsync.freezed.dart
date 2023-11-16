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
            int batchSize, int initialServerCount, String boundaryName)
        downSync,
    required TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)
        checkForData,
    required TResult Function(
            List<AppConfiguration> appConfiguration,
            String projectId,
            String boundaryCode,
            int pendingSyncCount,
            String boundaryName)
        getBatchSize,
    required TResult Function() downSyncReport,
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
            String boundaryCode, int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function()? downSyncReport,
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
            String boundaryCode, int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function()? downSyncReport,
    TResult Function()? resetState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownSyncBeneficiaryEvent value) downSync,
    required TResult Function(DownSyncCheckTotalCountEvent value) checkForData,
    required TResult Function(DownSyncGetBatchSizeEvent value) getBatchSize,
    required TResult Function(DownSyncReportEvent value) downSyncReport,
    required TResult Function(DownSyncResetStateEvent value) resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult? Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult? Function(DownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(DownSyncReportEvent value)? downSyncReport,
    TResult? Function(DownSyncResetStateEvent value)? resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult Function(DownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(DownSyncReportEvent value)? downSyncReport,
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
      int initialServerCount,
      String boundaryName});
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
    Object? boundaryName = null,
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
      boundaryName: null == boundaryName
          ? _value.boundaryName
          : boundaryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DownSyncBeneficiaryEvent implements DownSyncBeneficiaryEvent {
  const _$DownSyncBeneficiaryEvent(
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
    return 'BeneficiaryDownSyncEvent.downSync(projectId: $projectId, boundaryCode: $boundaryCode, batchSize: $batchSize, initialServerCount: $initialServerCount, boundaryName: $boundaryName)';
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
  _$$DownSyncBeneficiaryEventCopyWith<_$DownSyncBeneficiaryEvent>
      get copyWith =>
          __$$DownSyncBeneficiaryEventCopyWithImpl<_$DownSyncBeneficiaryEvent>(
              this, _$identity);

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
            String boundaryCode,
            int pendingSyncCount,
            String boundaryName)
        getBatchSize,
    required TResult Function() downSyncReport,
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
            String boundaryCode, int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function()? downSyncReport,
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
            String boundaryCode, int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function()? downSyncReport,
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
    required TResult Function(DownSyncBeneficiaryEvent value) downSync,
    required TResult Function(DownSyncCheckTotalCountEvent value) checkForData,
    required TResult Function(DownSyncGetBatchSizeEvent value) getBatchSize,
    required TResult Function(DownSyncReportEvent value) downSyncReport,
    required TResult Function(DownSyncResetStateEvent value) resetState,
  }) {
    return downSync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult? Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult? Function(DownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(DownSyncReportEvent value)? downSyncReport,
    TResult? Function(DownSyncResetStateEvent value)? resetState,
  }) {
    return downSync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult Function(DownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(DownSyncReportEvent value)? downSyncReport,
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
      required final int initialServerCount,
      required final String boundaryName}) = _$DownSyncBeneficiaryEvent;

  String get projectId;
  String get boundaryCode;
  int get batchSize;
  int get initialServerCount;
  String get boundaryName;
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
  $Res call(
      {String projectId,
      String boundaryCode,
      int pendingSyncCount,
      int batchSize,
      String boundaryName});
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
    Object? pendingSyncCount = null,
    Object? batchSize = null,
    Object? boundaryName = null,
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

class _$DownSyncCheckTotalCountEvent implements DownSyncCheckTotalCountEvent {
  const _$DownSyncCheckTotalCountEvent(
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
    return 'BeneficiaryDownSyncEvent.checkForData(projectId: $projectId, boundaryCode: $boundaryCode, pendingSyncCount: $pendingSyncCount, batchSize: $batchSize, boundaryName: $boundaryName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncCheckTotalCountEvent &&
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
  _$$DownSyncCheckTotalCountEventCopyWith<_$DownSyncCheckTotalCountEvent>
      get copyWith => __$$DownSyncCheckTotalCountEventCopyWithImpl<
          _$DownSyncCheckTotalCountEvent>(this, _$identity);

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
            String boundaryCode,
            int pendingSyncCount,
            String boundaryName)
        getBatchSize,
    required TResult Function() downSyncReport,
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
            String boundaryCode, int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function()? downSyncReport,
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
            String boundaryCode, int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function()? downSyncReport,
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
    required TResult Function(DownSyncBeneficiaryEvent value) downSync,
    required TResult Function(DownSyncCheckTotalCountEvent value) checkForData,
    required TResult Function(DownSyncGetBatchSizeEvent value) getBatchSize,
    required TResult Function(DownSyncReportEvent value) downSyncReport,
    required TResult Function(DownSyncResetStateEvent value) resetState,
  }) {
    return checkForData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult? Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult? Function(DownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(DownSyncReportEvent value)? downSyncReport,
    TResult? Function(DownSyncResetStateEvent value)? resetState,
  }) {
    return checkForData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult Function(DownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(DownSyncReportEvent value)? downSyncReport,
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
      required final String boundaryCode,
      required final int pendingSyncCount,
      required final int batchSize,
      required final String boundaryName}) = _$DownSyncCheckTotalCountEvent;

  String get projectId;
  String get boundaryCode;
  int get pendingSyncCount;
  int get batchSize;
  String get boundaryName;
  @JsonKey(ignore: true)
  _$$DownSyncCheckTotalCountEventCopyWith<_$DownSyncCheckTotalCountEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownSyncGetBatchSizeEventCopyWith<$Res> {
  factory _$$DownSyncGetBatchSizeEventCopyWith(
          _$DownSyncGetBatchSizeEvent value,
          $Res Function(_$DownSyncGetBatchSizeEvent) then) =
      __$$DownSyncGetBatchSizeEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<AppConfiguration> appConfiguration,
      String projectId,
      String boundaryCode,
      int pendingSyncCount,
      String boundaryName});
}

/// @nodoc
class __$$DownSyncGetBatchSizeEventCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncEventCopyWithImpl<$Res,
        _$DownSyncGetBatchSizeEvent>
    implements _$$DownSyncGetBatchSizeEventCopyWith<$Res> {
  __$$DownSyncGetBatchSizeEventCopyWithImpl(_$DownSyncGetBatchSizeEvent _value,
      $Res Function(_$DownSyncGetBatchSizeEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfiguration = null,
    Object? projectId = null,
    Object? boundaryCode = null,
    Object? pendingSyncCount = null,
    Object? boundaryName = null,
  }) {
    return _then(_$DownSyncGetBatchSizeEvent(
      appConfiguration: null == appConfiguration
          ? _value._appConfiguration
          : appConfiguration // ignore: cast_nullable_to_non_nullable
              as List<AppConfiguration>,
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
      boundaryName: null == boundaryName
          ? _value.boundaryName
          : boundaryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DownSyncGetBatchSizeEvent implements DownSyncGetBatchSizeEvent {
  const _$DownSyncGetBatchSizeEvent(
      {required final List<AppConfiguration> appConfiguration,
      required this.projectId,
      required this.boundaryCode,
      required this.pendingSyncCount,
      required this.boundaryName})
      : _appConfiguration = appConfiguration;

  final List<AppConfiguration> _appConfiguration;
  @override
  List<AppConfiguration> get appConfiguration {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appConfiguration);
  }

  @override
  final String projectId;
  @override
  final String boundaryCode;
  @override
  final int pendingSyncCount;
  @override
  final String boundaryName;

  @override
  String toString() {
    return 'BeneficiaryDownSyncEvent.getBatchSize(appConfiguration: $appConfiguration, projectId: $projectId, boundaryCode: $boundaryCode, pendingSyncCount: $pendingSyncCount, boundaryName: $boundaryName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncGetBatchSizeEvent &&
            const DeepCollectionEquality()
                .equals(other._appConfiguration, _appConfiguration) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.boundaryCode, boundaryCode) ||
                other.boundaryCode == boundaryCode) &&
            (identical(other.pendingSyncCount, pendingSyncCount) ||
                other.pendingSyncCount == pendingSyncCount) &&
            (identical(other.boundaryName, boundaryName) ||
                other.boundaryName == boundaryName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_appConfiguration),
      projectId,
      boundaryCode,
      pendingSyncCount,
      boundaryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownSyncGetBatchSizeEventCopyWith<_$DownSyncGetBatchSizeEvent>
      get copyWith => __$$DownSyncGetBatchSizeEventCopyWithImpl<
          _$DownSyncGetBatchSizeEvent>(this, _$identity);

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
            String boundaryCode,
            int pendingSyncCount,
            String boundaryName)
        getBatchSize,
    required TResult Function() downSyncReport,
    required TResult Function() resetState,
  }) {
    return getBatchSize(appConfiguration, projectId, boundaryCode,
        pendingSyncCount, boundaryName);
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
            String boundaryCode, int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function()? downSyncReport,
    TResult? Function()? resetState,
  }) {
    return getBatchSize?.call(appConfiguration, projectId, boundaryCode,
        pendingSyncCount, boundaryName);
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
            String boundaryCode, int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function()? downSyncReport,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (getBatchSize != null) {
      return getBatchSize(appConfiguration, projectId, boundaryCode,
          pendingSyncCount, boundaryName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownSyncBeneficiaryEvent value) downSync,
    required TResult Function(DownSyncCheckTotalCountEvent value) checkForData,
    required TResult Function(DownSyncGetBatchSizeEvent value) getBatchSize,
    required TResult Function(DownSyncReportEvent value) downSyncReport,
    required TResult Function(DownSyncResetStateEvent value) resetState,
  }) {
    return getBatchSize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult? Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult? Function(DownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(DownSyncReportEvent value)? downSyncReport,
    TResult? Function(DownSyncResetStateEvent value)? resetState,
  }) {
    return getBatchSize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult Function(DownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(DownSyncReportEvent value)? downSyncReport,
    TResult Function(DownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (getBatchSize != null) {
      return getBatchSize(this);
    }
    return orElse();
  }
}

abstract class DownSyncGetBatchSizeEvent implements BeneficiaryDownSyncEvent {
  const factory DownSyncGetBatchSizeEvent(
      {required final List<AppConfiguration> appConfiguration,
      required final String projectId,
      required final String boundaryCode,
      required final int pendingSyncCount,
      required final String boundaryName}) = _$DownSyncGetBatchSizeEvent;

  List<AppConfiguration> get appConfiguration;
  String get projectId;
  String get boundaryCode;
  int get pendingSyncCount;
  String get boundaryName;
  @JsonKey(ignore: true)
  _$$DownSyncGetBatchSizeEventCopyWith<_$DownSyncGetBatchSizeEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownSyncReportEventCopyWith<$Res> {
  factory _$$DownSyncReportEventCopyWith(_$DownSyncReportEvent value,
          $Res Function(_$DownSyncReportEvent) then) =
      __$$DownSyncReportEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownSyncReportEventCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncEventCopyWithImpl<$Res, _$DownSyncReportEvent>
    implements _$$DownSyncReportEventCopyWith<$Res> {
  __$$DownSyncReportEventCopyWithImpl(
      _$DownSyncReportEvent _value, $Res Function(_$DownSyncReportEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownSyncReportEvent implements DownSyncReportEvent {
  const _$DownSyncReportEvent();

  @override
  String toString() {
    return 'BeneficiaryDownSyncEvent.downSyncReport()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownSyncReportEvent);
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
            String boundaryCode,
            int pendingSyncCount,
            String boundaryName)
        getBatchSize,
    required TResult Function() downSyncReport,
    required TResult Function() resetState,
  }) {
    return downSyncReport();
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
            String boundaryCode, int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function()? downSyncReport,
    TResult? Function()? resetState,
  }) {
    return downSyncReport?.call();
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
            String boundaryCode, int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function()? downSyncReport,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (downSyncReport != null) {
      return downSyncReport();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownSyncBeneficiaryEvent value) downSync,
    required TResult Function(DownSyncCheckTotalCountEvent value) checkForData,
    required TResult Function(DownSyncGetBatchSizeEvent value) getBatchSize,
    required TResult Function(DownSyncReportEvent value) downSyncReport,
    required TResult Function(DownSyncResetStateEvent value) resetState,
  }) {
    return downSyncReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult? Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult? Function(DownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(DownSyncReportEvent value)? downSyncReport,
    TResult? Function(DownSyncResetStateEvent value)? resetState,
  }) {
    return downSyncReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult Function(DownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(DownSyncReportEvent value)? downSyncReport,
    TResult Function(DownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (downSyncReport != null) {
      return downSyncReport(this);
    }
    return orElse();
  }
}

abstract class DownSyncReportEvent implements BeneficiaryDownSyncEvent {
  const factory DownSyncReportEvent() = _$DownSyncReportEvent;
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
            int batchSize, int initialServerCount, String boundaryName)
        downSync,
    required TResult Function(String projectId, String boundaryCode,
            int pendingSyncCount, int batchSize, String boundaryName)
        checkForData,
    required TResult Function(
            List<AppConfiguration> appConfiguration,
            String projectId,
            String boundaryCode,
            int pendingSyncCount,
            String boundaryName)
        getBatchSize,
    required TResult Function() downSyncReport,
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
            String boundaryCode, int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function()? downSyncReport,
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
            String boundaryCode, int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function()? downSyncReport,
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
    required TResult Function(DownSyncGetBatchSizeEvent value) getBatchSize,
    required TResult Function(DownSyncReportEvent value) downSyncReport,
    required TResult Function(DownSyncResetStateEvent value) resetState,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult? Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult? Function(DownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult? Function(DownSyncReportEvent value)? downSyncReport,
    TResult? Function(DownSyncResetStateEvent value)? resetState,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownSyncBeneficiaryEvent value)? downSync,
    TResult Function(DownSyncCheckTotalCountEvent value)? checkForData,
    TResult Function(DownSyncGetBatchSizeEvent value)? getBatchSize,
    TResult Function(DownSyncReportEvent value)? downSyncReport,
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
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            String boundaryCode, int pendingSyncCount, String boundaryName)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount, int batchSize) dataFound,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function(List<DownsyncModel> downsyncCriteriaList) report,
    required TResult Function() pendingSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount, int batchSize)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult? Function()? pendingSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount, int batchSize)? dataFound,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult Function()? pendingSync,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncGetBatchSizeState value) getBatchSize,
    required TResult Function(_DownSyncLoadingState value) loading,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSynnCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_DownSyncFailureState value) failed,
    required TResult Function(_DownSyncReportState value) report,
    required TResult Function(_DownSyncPendingSyncState value) pendingSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_DownSyncLoadingState value)? loading,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_DownSyncFailureState value)? failed,
    TResult? Function(_DownSyncReportState value)? report,
    TResult? Function(_DownSyncPendingSyncState value)? pendingSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_DownSyncLoadingState value)? loading,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_DownSyncFailureState value)? failed,
    TResult Function(_DownSyncReportState value)? report,
    TResult Function(_DownSyncPendingSyncState value)? pendingSync,
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
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            String boundaryCode, int pendingSyncCount, String boundaryName)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount, int batchSize) dataFound,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function(List<DownsyncModel> downsyncCriteriaList) report,
    required TResult Function() pendingSync,
  }) {
    return inProgress(syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount, int batchSize)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult? Function()? pendingSync,
  }) {
    return inProgress?.call(syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount, int batchSize)? dataFound,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function(List<DownsyncModel> downsyncCriteriaList)? report,
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
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncGetBatchSizeState value) getBatchSize,
    required TResult Function(_DownSyncLoadingState value) loading,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSynnCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_DownSyncFailureState value) failed,
    required TResult Function(_DownSyncReportState value) report,
    required TResult Function(_DownSyncPendingSyncState value) pendingSync,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_DownSyncLoadingState value)? loading,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_DownSyncFailureState value)? failed,
    TResult? Function(_DownSyncReportState value)? report,
    TResult? Function(_DownSyncPendingSyncState value)? pendingSync,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_DownSyncLoadingState value)? loading,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_DownSyncFailureState value)? failed,
    TResult Function(_DownSyncReportState value)? report,
    TResult Function(_DownSyncPendingSyncState value)? pendingSync,
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
  @useResult
  $Res call({DownsyncModel downSyncResult});
}

/// @nodoc
class __$$_DownSyncSuccessStateCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$_DownSyncSuccessState>
    implements _$$_DownSyncSuccessStateCopyWith<$Res> {
  __$$_DownSyncSuccessStateCopyWithImpl(_$_DownSyncSuccessState _value,
      $Res Function(_$_DownSyncSuccessState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downSyncResult = null,
  }) {
    return _then(_$_DownSyncSuccessState(
      null == downSyncResult
          ? _value.downSyncResult
          : downSyncResult // ignore: cast_nullable_to_non_nullable
              as DownsyncModel,
    ));
  }
}

/// @nodoc

class _$_DownSyncSuccessState extends _DownSyncSuccessState {
  const _$_DownSyncSuccessState(this.downSyncResult) : super._();

  @override
  final DownsyncModel downSyncResult;

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.success(downSyncResult: $downSyncResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownSyncSuccessState &&
            (identical(other.downSyncResult, downSyncResult) ||
                other.downSyncResult == downSyncResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, downSyncResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownSyncSuccessStateCopyWith<_$_DownSyncSuccessState> get copyWith =>
      __$$_DownSyncSuccessStateCopyWithImpl<_$_DownSyncSuccessState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            String boundaryCode, int pendingSyncCount, String boundaryName)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount, int batchSize) dataFound,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function(List<DownsyncModel> downsyncCriteriaList) report,
    required TResult Function() pendingSync,
  }) {
    return success(downSyncResult);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount, int batchSize)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult? Function()? pendingSync,
  }) {
    return success?.call(downSyncResult);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount, int batchSize)? dataFound,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function(List<DownsyncModel> downsyncCriteriaList)? report,
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
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncGetBatchSizeState value) getBatchSize,
    required TResult Function(_DownSyncLoadingState value) loading,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSynnCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_DownSyncFailureState value) failed,
    required TResult Function(_DownSyncReportState value) report,
    required TResult Function(_DownSyncPendingSyncState value) pendingSync,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_DownSyncLoadingState value)? loading,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_DownSyncFailureState value)? failed,
    TResult? Function(_DownSyncReportState value)? report,
    TResult? Function(_DownSyncPendingSyncState value)? pendingSync,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_DownSyncLoadingState value)? loading,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_DownSyncFailureState value)? failed,
    TResult Function(_DownSyncReportState value)? report,
    TResult Function(_DownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _DownSyncSuccessState extends BeneficiaryDownSyncState {
  const factory _DownSyncSuccessState(final DownsyncModel downSyncResult) =
      _$_DownSyncSuccessState;
  const _DownSyncSuccessState._() : super._();

  DownsyncModel get downSyncResult;
  @JsonKey(ignore: true)
  _$$_DownSyncSuccessStateCopyWith<_$_DownSyncSuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DownSyncGetBatchSizeStateCopyWith<$Res> {
  factory _$$_DownSyncGetBatchSizeStateCopyWith(
          _$_DownSyncGetBatchSizeState value,
          $Res Function(_$_DownSyncGetBatchSizeState) then) =
      __$$_DownSyncGetBatchSizeStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int batchSize,
      String projectId,
      String boundaryCode,
      int pendingSyncCount,
      String boundaryName});
}

/// @nodoc
class __$$_DownSyncGetBatchSizeStateCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$_DownSyncGetBatchSizeState>
    implements _$$_DownSyncGetBatchSizeStateCopyWith<$Res> {
  __$$_DownSyncGetBatchSizeStateCopyWithImpl(
      _$_DownSyncGetBatchSizeState _value,
      $Res Function(_$_DownSyncGetBatchSizeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batchSize = null,
    Object? projectId = null,
    Object? boundaryCode = null,
    Object? pendingSyncCount = null,
    Object? boundaryName = null,
  }) {
    return _then(_$_DownSyncGetBatchSizeState(
      null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
      null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      null == boundaryCode
          ? _value.boundaryCode
          : boundaryCode // ignore: cast_nullable_to_non_nullable
              as String,
      null == pendingSyncCount
          ? _value.pendingSyncCount
          : pendingSyncCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == boundaryName
          ? _value.boundaryName
          : boundaryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DownSyncGetBatchSizeState extends _DownSyncGetBatchSizeState {
  const _$_DownSyncGetBatchSizeState(this.batchSize, this.projectId,
      this.boundaryCode, this.pendingSyncCount, this.boundaryName)
      : super._();

  @override
  final int batchSize;
  @override
  final String projectId;
  @override
  final String boundaryCode;
  @override
  final int pendingSyncCount;
  @override
  final String boundaryName;

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.getBatchSize(batchSize: $batchSize, projectId: $projectId, boundaryCode: $boundaryCode, pendingSyncCount: $pendingSyncCount, boundaryName: $boundaryName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownSyncGetBatchSizeState &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.boundaryCode, boundaryCode) ||
                other.boundaryCode == boundaryCode) &&
            (identical(other.pendingSyncCount, pendingSyncCount) ||
                other.pendingSyncCount == pendingSyncCount) &&
            (identical(other.boundaryName, boundaryName) ||
                other.boundaryName == boundaryName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, batchSize, projectId,
      boundaryCode, pendingSyncCount, boundaryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownSyncGetBatchSizeStateCopyWith<_$_DownSyncGetBatchSizeState>
      get copyWith => __$$_DownSyncGetBatchSizeStateCopyWithImpl<
          _$_DownSyncGetBatchSizeState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            String boundaryCode, int pendingSyncCount, String boundaryName)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount, int batchSize) dataFound,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function(List<DownsyncModel> downsyncCriteriaList) report,
    required TResult Function() pendingSync,
  }) {
    return getBatchSize(
        batchSize, projectId, boundaryCode, pendingSyncCount, boundaryName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount, int batchSize)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult? Function()? pendingSync,
  }) {
    return getBatchSize?.call(
        batchSize, projectId, boundaryCode, pendingSyncCount, boundaryName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount, int batchSize)? dataFound,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult Function()? pendingSync,
    required TResult orElse(),
  }) {
    if (getBatchSize != null) {
      return getBatchSize(
          batchSize, projectId, boundaryCode, pendingSyncCount, boundaryName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncGetBatchSizeState value) getBatchSize,
    required TResult Function(_DownSyncLoadingState value) loading,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSynnCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_DownSyncFailureState value) failed,
    required TResult Function(_DownSyncReportState value) report,
    required TResult Function(_DownSyncPendingSyncState value) pendingSync,
  }) {
    return getBatchSize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_DownSyncLoadingState value)? loading,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_DownSyncFailureState value)? failed,
    TResult? Function(_DownSyncReportState value)? report,
    TResult? Function(_DownSyncPendingSyncState value)? pendingSync,
  }) {
    return getBatchSize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_DownSyncLoadingState value)? loading,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_DownSyncFailureState value)? failed,
    TResult Function(_DownSyncReportState value)? report,
    TResult Function(_DownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (getBatchSize != null) {
      return getBatchSize(this);
    }
    return orElse();
  }
}

abstract class _DownSyncGetBatchSizeState extends BeneficiaryDownSyncState {
  const factory _DownSyncGetBatchSizeState(
      final int batchSize,
      final String projectId,
      final String boundaryCode,
      final int pendingSyncCount,
      final String boundaryName) = _$_DownSyncGetBatchSizeState;
  const _DownSyncGetBatchSizeState._() : super._();

  int get batchSize;
  String get projectId;
  String get boundaryCode;
  int get pendingSyncCount;
  String get boundaryName;
  @JsonKey(ignore: true)
  _$$_DownSyncGetBatchSizeStateCopyWith<_$_DownSyncGetBatchSizeState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DownSyncLoadingStateCopyWith<$Res> {
  factory _$$_DownSyncLoadingStateCopyWith(_$_DownSyncLoadingState value,
          $Res Function(_$_DownSyncLoadingState) then) =
      __$$_DownSyncLoadingStateCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isPop});
}

/// @nodoc
class __$$_DownSyncLoadingStateCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$_DownSyncLoadingState>
    implements _$$_DownSyncLoadingStateCopyWith<$Res> {
  __$$_DownSyncLoadingStateCopyWithImpl(_$_DownSyncLoadingState _value,
      $Res Function(_$_DownSyncLoadingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPop = null,
  }) {
    return _then(_$_DownSyncLoadingState(
      null == isPop
          ? _value.isPop
          : isPop // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DownSyncLoadingState extends _DownSyncLoadingState {
  const _$_DownSyncLoadingState(this.isPop) : super._();

  @override
  final bool isPop;

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.loading(isPop: $isPop)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownSyncLoadingState &&
            (identical(other.isPop, isPop) || other.isPop == isPop));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPop);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownSyncLoadingStateCopyWith<_$_DownSyncLoadingState> get copyWith =>
      __$$_DownSyncLoadingStateCopyWithImpl<_$_DownSyncLoadingState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            String boundaryCode, int pendingSyncCount, String boundaryName)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount, int batchSize) dataFound,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function(List<DownsyncModel> downsyncCriteriaList) report,
    required TResult Function() pendingSync,
  }) {
    return loading(isPop);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount, int batchSize)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult? Function()? pendingSync,
  }) {
    return loading?.call(isPop);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount, int batchSize)? dataFound,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function(List<DownsyncModel> downsyncCriteriaList)? report,
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
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncGetBatchSizeState value) getBatchSize,
    required TResult Function(_DownSyncLoadingState value) loading,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSynnCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_DownSyncFailureState value) failed,
    required TResult Function(_DownSyncReportState value) report,
    required TResult Function(_DownSyncPendingSyncState value) pendingSync,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_DownSyncLoadingState value)? loading,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_DownSyncFailureState value)? failed,
    TResult? Function(_DownSyncReportState value)? report,
    TResult? Function(_DownSyncPendingSyncState value)? pendingSync,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_DownSyncLoadingState value)? loading,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_DownSyncFailureState value)? failed,
    TResult Function(_DownSyncReportState value)? report,
    TResult Function(_DownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _DownSyncLoadingState extends BeneficiaryDownSyncState {
  const factory _DownSyncLoadingState(final bool isPop) =
      _$_DownSyncLoadingState;
  const _DownSyncLoadingState._() : super._();

  bool get isPop;
  @JsonKey(ignore: true)
  _$$_DownSyncLoadingStateCopyWith<_$_DownSyncLoadingState> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            String boundaryCode, int pendingSyncCount, String boundaryName)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount, int batchSize) dataFound,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function(List<DownsyncModel> downsyncCriteriaList) report,
    required TResult Function() pendingSync,
  }) {
    return insufficientStorage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount, int batchSize)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult? Function()? pendingSync,
  }) {
    return insufficientStorage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount, int batchSize)? dataFound,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult Function()? pendingSync,
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
    required TResult Function(_DownSyncGetBatchSizeState value) getBatchSize,
    required TResult Function(_DownSyncLoadingState value) loading,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSynnCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_DownSyncFailureState value) failed,
    required TResult Function(_DownSyncReportState value) report,
    required TResult Function(_DownSyncPendingSyncState value) pendingSync,
  }) {
    return insufficientStorage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_DownSyncLoadingState value)? loading,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_DownSyncFailureState value)? failed,
    TResult? Function(_DownSyncReportState value)? report,
    TResult? Function(_DownSyncPendingSyncState value)? pendingSync,
  }) {
    return insufficientStorage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_DownSyncLoadingState value)? loading,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_DownSyncFailureState value)? failed,
    TResult Function(_DownSyncReportState value)? report,
    TResult Function(_DownSyncPendingSyncState value)? pendingSync,
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
  $Res call({int initialServerCount, int batchSize});
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
    Object? batchSize = null,
  }) {
    return _then(_$_DownSyncDataFoundState(
      null == initialServerCount
          ? _value.initialServerCount
          : initialServerCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DownSyncDataFoundState extends _DownSyncDataFoundState {
  const _$_DownSyncDataFoundState(this.initialServerCount, this.batchSize)
      : super._();

  @override
  final int initialServerCount;
  @override
  final int batchSize;

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.dataFound(initialServerCount: $initialServerCount, batchSize: $batchSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownSyncDataFoundState &&
            (identical(other.initialServerCount, initialServerCount) ||
                other.initialServerCount == initialServerCount) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, initialServerCount, batchSize);

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
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            String boundaryCode, int pendingSyncCount, String boundaryName)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount, int batchSize) dataFound,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function(List<DownsyncModel> downsyncCriteriaList) report,
    required TResult Function() pendingSync,
  }) {
    return dataFound(initialServerCount, batchSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount, int batchSize)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult? Function()? pendingSync,
  }) {
    return dataFound?.call(initialServerCount, batchSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount, int batchSize)? dataFound,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult Function()? pendingSync,
    required TResult orElse(),
  }) {
    if (dataFound != null) {
      return dataFound(initialServerCount, batchSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncGetBatchSizeState value) getBatchSize,
    required TResult Function(_DownSyncLoadingState value) loading,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSynnCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_DownSyncFailureState value) failed,
    required TResult Function(_DownSyncReportState value) report,
    required TResult Function(_DownSyncPendingSyncState value) pendingSync,
  }) {
    return dataFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_DownSyncLoadingState value)? loading,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_DownSyncFailureState value)? failed,
    TResult? Function(_DownSyncReportState value)? report,
    TResult? Function(_DownSyncPendingSyncState value)? pendingSync,
  }) {
    return dataFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_DownSyncLoadingState value)? loading,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_DownSyncFailureState value)? failed,
    TResult Function(_DownSyncReportState value)? report,
    TResult Function(_DownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (dataFound != null) {
      return dataFound(this);
    }
    return orElse();
  }
}

abstract class _DownSyncDataFoundState extends BeneficiaryDownSyncState {
  const factory _DownSyncDataFoundState(
          final int initialServerCount, final int batchSize) =
      _$_DownSyncDataFoundState;
  const _DownSyncDataFoundState._() : super._();

  int get initialServerCount;
  int get batchSize;
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
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            String boundaryCode, int pendingSyncCount, String boundaryName)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount, int batchSize) dataFound,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function(List<DownsyncModel> downsyncCriteriaList) report,
    required TResult Function() pendingSync,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount, int batchSize)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult? Function()? pendingSync,
  }) {
    return resetState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount, int batchSize)? dataFound,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function(List<DownsyncModel> downsyncCriteriaList)? report,
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
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncGetBatchSizeState value) getBatchSize,
    required TResult Function(_DownSyncLoadingState value) loading,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSynnCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_DownSyncFailureState value) failed,
    required TResult Function(_DownSyncReportState value) report,
    required TResult Function(_DownSyncPendingSyncState value) pendingSync,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_DownSyncLoadingState value)? loading,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_DownSyncFailureState value)? failed,
    TResult? Function(_DownSyncReportState value)? report,
    TResult? Function(_DownSyncPendingSyncState value)? pendingSync,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_DownSyncLoadingState value)? loading,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_DownSyncFailureState value)? failed,
    TResult Function(_DownSyncReportState value)? report,
    TResult Function(_DownSyncPendingSyncState value)? pendingSync,
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
abstract class _$$_DownSynnCountCheckFailedStateCopyWith<$Res> {
  factory _$$_DownSynnCountCheckFailedStateCopyWith(
          _$_DownSynnCountCheckFailedState value,
          $Res Function(_$_DownSynnCountCheckFailedState) then) =
      __$$_DownSynnCountCheckFailedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DownSynnCountCheckFailedStateCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$_DownSynnCountCheckFailedState>
    implements _$$_DownSynnCountCheckFailedStateCopyWith<$Res> {
  __$$_DownSynnCountCheckFailedStateCopyWithImpl(
      _$_DownSynnCountCheckFailedState _value,
      $Res Function(_$_DownSynnCountCheckFailedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DownSynnCountCheckFailedState extends _DownSynnCountCheckFailedState {
  const _$_DownSynnCountCheckFailedState() : super._();

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.totalCountCheckFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownSynnCountCheckFailedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            String boundaryCode, int pendingSyncCount, String boundaryName)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount, int batchSize) dataFound,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function(List<DownsyncModel> downsyncCriteriaList) report,
    required TResult Function() pendingSync,
  }) {
    return totalCountCheckFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount, int batchSize)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult? Function()? pendingSync,
  }) {
    return totalCountCheckFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount, int batchSize)? dataFound,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function(List<DownsyncModel> downsyncCriteriaList)? report,
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
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncGetBatchSizeState value) getBatchSize,
    required TResult Function(_DownSyncLoadingState value) loading,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSynnCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_DownSyncFailureState value) failed,
    required TResult Function(_DownSyncReportState value) report,
    required TResult Function(_DownSyncPendingSyncState value) pendingSync,
  }) {
    return totalCountCheckFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_DownSyncLoadingState value)? loading,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_DownSyncFailureState value)? failed,
    TResult? Function(_DownSyncReportState value)? report,
    TResult? Function(_DownSyncPendingSyncState value)? pendingSync,
  }) {
    return totalCountCheckFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_DownSyncLoadingState value)? loading,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_DownSyncFailureState value)? failed,
    TResult Function(_DownSyncReportState value)? report,
    TResult Function(_DownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (totalCountCheckFailed != null) {
      return totalCountCheckFailed(this);
    }
    return orElse();
  }
}

abstract class _DownSynnCountCheckFailedState extends BeneficiaryDownSyncState {
  const factory _DownSynnCountCheckFailedState() =
      _$_DownSynnCountCheckFailedState;
  const _DownSynnCountCheckFailedState._() : super._();
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
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            String boundaryCode, int pendingSyncCount, String boundaryName)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount, int batchSize) dataFound,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function(List<DownsyncModel> downsyncCriteriaList) report,
    required TResult Function() pendingSync,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount, int batchSize)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult? Function()? pendingSync,
  }) {
    return failed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount, int batchSize)? dataFound,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function(List<DownsyncModel> downsyncCriteriaList)? report,
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
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncGetBatchSizeState value) getBatchSize,
    required TResult Function(_DownSyncLoadingState value) loading,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSynnCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_DownSyncFailureState value) failed,
    required TResult Function(_DownSyncReportState value) report,
    required TResult Function(_DownSyncPendingSyncState value) pendingSync,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_DownSyncLoadingState value)? loading,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_DownSyncFailureState value)? failed,
    TResult? Function(_DownSyncReportState value)? report,
    TResult? Function(_DownSyncPendingSyncState value)? pendingSync,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_DownSyncLoadingState value)? loading,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_DownSyncFailureState value)? failed,
    TResult Function(_DownSyncReportState value)? report,
    TResult Function(_DownSyncPendingSyncState value)? pendingSync,
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

/// @nodoc
abstract class _$$_DownSyncReportStateCopyWith<$Res> {
  factory _$$_DownSyncReportStateCopyWith(_$_DownSyncReportState value,
          $Res Function(_$_DownSyncReportState) then) =
      __$$_DownSyncReportStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DownsyncModel> downsyncCriteriaList});
}

/// @nodoc
class __$$_DownSyncReportStateCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res, _$_DownSyncReportState>
    implements _$$_DownSyncReportStateCopyWith<$Res> {
  __$$_DownSyncReportStateCopyWithImpl(_$_DownSyncReportState _value,
      $Res Function(_$_DownSyncReportState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downsyncCriteriaList = null,
  }) {
    return _then(_$_DownSyncReportState(
      null == downsyncCriteriaList
          ? _value._downsyncCriteriaList
          : downsyncCriteriaList // ignore: cast_nullable_to_non_nullable
              as List<DownsyncModel>,
    ));
  }
}

/// @nodoc

class _$_DownSyncReportState extends _DownSyncReportState {
  const _$_DownSyncReportState(final List<DownsyncModel> downsyncCriteriaList)
      : _downsyncCriteriaList = downsyncCriteriaList,
        super._();

  final List<DownsyncModel> _downsyncCriteriaList;
  @override
  List<DownsyncModel> get downsyncCriteriaList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_downsyncCriteriaList);
  }

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.report(downsyncCriteriaList: $downsyncCriteriaList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownSyncReportState &&
            const DeepCollectionEquality()
                .equals(other._downsyncCriteriaList, _downsyncCriteriaList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_downsyncCriteriaList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownSyncReportStateCopyWith<_$_DownSyncReportState> get copyWith =>
      __$$_DownSyncReportStateCopyWithImpl<_$_DownSyncReportState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            String boundaryCode, int pendingSyncCount, String boundaryName)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount, int batchSize) dataFound,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function(List<DownsyncModel> downsyncCriteriaList) report,
    required TResult Function() pendingSync,
  }) {
    return report(downsyncCriteriaList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount, int batchSize)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult? Function()? pendingSync,
  }) {
    return report?.call(downsyncCriteriaList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount, int batchSize)? dataFound,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult Function()? pendingSync,
    required TResult orElse(),
  }) {
    if (report != null) {
      return report(downsyncCriteriaList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncGetBatchSizeState value) getBatchSize,
    required TResult Function(_DownSyncLoadingState value) loading,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSynnCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_DownSyncFailureState value) failed,
    required TResult Function(_DownSyncReportState value) report,
    required TResult Function(_DownSyncPendingSyncState value) pendingSync,
  }) {
    return report(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_DownSyncLoadingState value)? loading,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_DownSyncFailureState value)? failed,
    TResult? Function(_DownSyncReportState value)? report,
    TResult? Function(_DownSyncPendingSyncState value)? pendingSync,
  }) {
    return report?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_DownSyncLoadingState value)? loading,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_DownSyncFailureState value)? failed,
    TResult Function(_DownSyncReportState value)? report,
    TResult Function(_DownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (report != null) {
      return report(this);
    }
    return orElse();
  }
}

abstract class _DownSyncReportState extends BeneficiaryDownSyncState {
  const factory _DownSyncReportState(
      final List<DownsyncModel> downsyncCriteriaList) = _$_DownSyncReportState;
  const _DownSyncReportState._() : super._();

  List<DownsyncModel> get downsyncCriteriaList;
  @JsonKey(ignore: true)
  _$$_DownSyncReportStateCopyWith<_$_DownSyncReportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DownSyncPendingSyncStateCopyWith<$Res> {
  factory _$$_DownSyncPendingSyncStateCopyWith(
          _$_DownSyncPendingSyncState value,
          $Res Function(_$_DownSyncPendingSyncState) then) =
      __$$_DownSyncPendingSyncStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DownSyncPendingSyncStateCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$_DownSyncPendingSyncState>
    implements _$$_DownSyncPendingSyncStateCopyWith<$Res> {
  __$$_DownSyncPendingSyncStateCopyWithImpl(_$_DownSyncPendingSyncState _value,
      $Res Function(_$_DownSyncPendingSyncState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DownSyncPendingSyncState extends _DownSyncPendingSyncState {
  const _$_DownSyncPendingSyncState() : super._();

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.pendingSync()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownSyncPendingSyncState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(DownsyncModel downSyncResult) success,
    required TResult Function(int batchSize, String projectId,
            String boundaryCode, int pendingSyncCount, String boundaryName)
        getBatchSize,
    required TResult Function(bool isPop) loading,
    required TResult Function() insufficientStorage,
    required TResult Function(int initialServerCount, int batchSize) dataFound,
    required TResult Function() resetState,
    required TResult Function() totalCountCheckFailed,
    required TResult Function() failed,
    required TResult Function(List<DownsyncModel> downsyncCriteriaList) report,
    required TResult Function() pendingSync,
  }) {
    return pendingSync();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(DownsyncModel downSyncResult)? success,
    TResult? Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult? Function(bool isPop)? loading,
    TResult? Function()? insufficientStorage,
    TResult? Function(int initialServerCount, int batchSize)? dataFound,
    TResult? Function()? resetState,
    TResult? Function()? totalCountCheckFailed,
    TResult? Function()? failed,
    TResult? Function(List<DownsyncModel> downsyncCriteriaList)? report,
    TResult? Function()? pendingSync,
  }) {
    return pendingSync?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(DownsyncModel downSyncResult)? success,
    TResult Function(int batchSize, String projectId, String boundaryCode,
            int pendingSyncCount, String boundaryName)?
        getBatchSize,
    TResult Function(bool isPop)? loading,
    TResult Function()? insufficientStorage,
    TResult Function(int initialServerCount, int batchSize)? dataFound,
    TResult Function()? resetState,
    TResult Function()? totalCountCheckFailed,
    TResult Function()? failed,
    TResult Function(List<DownsyncModel> downsyncCriteriaList)? report,
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
    required TResult Function(_DownSyncInProgressState value) inProgress,
    required TResult Function(_DownSyncSuccessState value) success,
    required TResult Function(_DownSyncGetBatchSizeState value) getBatchSize,
    required TResult Function(_DownSyncLoadingState value) loading,
    required TResult Function(_DownSyncInsufficientStorageState value)
        insufficientStorage,
    required TResult Function(_DownSyncDataFoundState value) dataFound,
    required TResult Function(_DownSyncResetState value) resetState,
    required TResult Function(_DownSynnCountCheckFailedState value)
        totalCountCheckFailed,
    required TResult Function(_DownSyncFailureState value) failed,
    required TResult Function(_DownSyncReportState value) report,
    required TResult Function(_DownSyncPendingSyncState value) pendingSync,
  }) {
    return pendingSync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownSyncInProgressState value)? inProgress,
    TResult? Function(_DownSyncSuccessState value)? success,
    TResult? Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult? Function(_DownSyncLoadingState value)? loading,
    TResult? Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult? Function(_DownSyncDataFoundState value)? dataFound,
    TResult? Function(_DownSyncResetState value)? resetState,
    TResult? Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult? Function(_DownSyncFailureState value)? failed,
    TResult? Function(_DownSyncReportState value)? report,
    TResult? Function(_DownSyncPendingSyncState value)? pendingSync,
  }) {
    return pendingSync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownSyncInProgressState value)? inProgress,
    TResult Function(_DownSyncSuccessState value)? success,
    TResult Function(_DownSyncGetBatchSizeState value)? getBatchSize,
    TResult Function(_DownSyncLoadingState value)? loading,
    TResult Function(_DownSyncInsufficientStorageState value)?
        insufficientStorage,
    TResult Function(_DownSyncDataFoundState value)? dataFound,
    TResult Function(_DownSyncResetState value)? resetState,
    TResult Function(_DownSynnCountCheckFailedState value)?
        totalCountCheckFailed,
    TResult Function(_DownSyncFailureState value)? failed,
    TResult Function(_DownSyncReportState value)? report,
    TResult Function(_DownSyncPendingSyncState value)? pendingSync,
    required TResult orElse(),
  }) {
    if (pendingSync != null) {
      return pendingSync(this);
    }
    return orElse();
  }
}

abstract class _DownSyncPendingSyncState extends BeneficiaryDownSyncState {
  const factory _DownSyncPendingSyncState() = _$_DownSyncPendingSyncState;
  const _DownSyncPendingSyncState._() : super._();
}

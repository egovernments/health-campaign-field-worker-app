// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_beneficiaries_downsync.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$DownSyncBeneficiaryEventImplCopyWith<$Res> {
  factory _$$DownSyncBeneficiaryEventImplCopyWith(
          _$DownSyncBeneficiaryEventImpl value,
          $Res Function(_$DownSyncBeneficiaryEventImpl) then) =
      __$$DownSyncBeneficiaryEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      String boundaryCode,
      int batchSize,
      int initialServerCount,
      String boundaryName});
}

/// @nodoc
class __$$DownSyncBeneficiaryEventImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncEventCopyWithImpl<$Res,
        _$DownSyncBeneficiaryEventImpl>
    implements _$$DownSyncBeneficiaryEventImplCopyWith<$Res> {
  __$$DownSyncBeneficiaryEventImplCopyWithImpl(
      _$DownSyncBeneficiaryEventImpl _value,
      $Res Function(_$DownSyncBeneficiaryEventImpl) _then)
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
    return _then(_$DownSyncBeneficiaryEventImpl(
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

class _$DownSyncBeneficiaryEventImpl implements DownSyncBeneficiaryEvent {
  const _$DownSyncBeneficiaryEventImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncBeneficiaryEventImpl &&
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
  _$$DownSyncBeneficiaryEventImplCopyWith<_$DownSyncBeneficiaryEventImpl>
      get copyWith => __$$DownSyncBeneficiaryEventImplCopyWithImpl<
          _$DownSyncBeneficiaryEventImpl>(this, _$identity);

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
      required final String boundaryName}) = _$DownSyncBeneficiaryEventImpl;

  String get projectId;
  String get boundaryCode;
  int get batchSize;
  int get initialServerCount;
  String get boundaryName;
  @JsonKey(ignore: true)
  _$$DownSyncBeneficiaryEventImplCopyWith<_$DownSyncBeneficiaryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownSyncCheckTotalCountEventImplCopyWith<$Res> {
  factory _$$DownSyncCheckTotalCountEventImplCopyWith(
          _$DownSyncCheckTotalCountEventImpl value,
          $Res Function(_$DownSyncCheckTotalCountEventImpl) then) =
      __$$DownSyncCheckTotalCountEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      String boundaryCode,
      int pendingSyncCount,
      int batchSize,
      String boundaryName});
}

/// @nodoc
class __$$DownSyncCheckTotalCountEventImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncEventCopyWithImpl<$Res,
        _$DownSyncCheckTotalCountEventImpl>
    implements _$$DownSyncCheckTotalCountEventImplCopyWith<$Res> {
  __$$DownSyncCheckTotalCountEventImplCopyWithImpl(
      _$DownSyncCheckTotalCountEventImpl _value,
      $Res Function(_$DownSyncCheckTotalCountEventImpl) _then)
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
    return _then(_$DownSyncCheckTotalCountEventImpl(
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

class _$DownSyncCheckTotalCountEventImpl
    implements DownSyncCheckTotalCountEvent {
  const _$DownSyncCheckTotalCountEventImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncCheckTotalCountEventImpl &&
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
  _$$DownSyncCheckTotalCountEventImplCopyWith<
          _$DownSyncCheckTotalCountEventImpl>
      get copyWith => __$$DownSyncCheckTotalCountEventImplCopyWithImpl<
          _$DownSyncCheckTotalCountEventImpl>(this, _$identity);

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
      required final String boundaryName}) = _$DownSyncCheckTotalCountEventImpl;

  String get projectId;
  String get boundaryCode;
  int get pendingSyncCount;
  int get batchSize;
  String get boundaryName;
  @JsonKey(ignore: true)
  _$$DownSyncCheckTotalCountEventImplCopyWith<
          _$DownSyncCheckTotalCountEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownSyncGetBatchSizeEventImplCopyWith<$Res> {
  factory _$$DownSyncGetBatchSizeEventImplCopyWith(
          _$DownSyncGetBatchSizeEventImpl value,
          $Res Function(_$DownSyncGetBatchSizeEventImpl) then) =
      __$$DownSyncGetBatchSizeEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<AppConfiguration> appConfiguration,
      String projectId,
      String boundaryCode,
      int pendingSyncCount,
      String boundaryName});
}

/// @nodoc
class __$$DownSyncGetBatchSizeEventImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncEventCopyWithImpl<$Res,
        _$DownSyncGetBatchSizeEventImpl>
    implements _$$DownSyncGetBatchSizeEventImplCopyWith<$Res> {
  __$$DownSyncGetBatchSizeEventImplCopyWithImpl(
      _$DownSyncGetBatchSizeEventImpl _value,
      $Res Function(_$DownSyncGetBatchSizeEventImpl) _then)
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
    return _then(_$DownSyncGetBatchSizeEventImpl(
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

class _$DownSyncGetBatchSizeEventImpl implements DownSyncGetBatchSizeEvent {
  const _$DownSyncGetBatchSizeEventImpl(
      {required final List<AppConfiguration> appConfiguration,
      required this.projectId,
      required this.boundaryCode,
      required this.pendingSyncCount,
      required this.boundaryName})
      : _appConfiguration = appConfiguration;

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncGetBatchSizeEventImpl &&
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
  _$$DownSyncGetBatchSizeEventImplCopyWith<_$DownSyncGetBatchSizeEventImpl>
      get copyWith => __$$DownSyncGetBatchSizeEventImplCopyWithImpl<
          _$DownSyncGetBatchSizeEventImpl>(this, _$identity);

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
      required final String boundaryName}) = _$DownSyncGetBatchSizeEventImpl;

  List<AppConfiguration> get appConfiguration;
  String get projectId;
  String get boundaryCode;
  int get pendingSyncCount;
  String get boundaryName;
  @JsonKey(ignore: true)
  _$$DownSyncGetBatchSizeEventImplCopyWith<_$DownSyncGetBatchSizeEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownSyncReportEventImplCopyWith<$Res> {
  factory _$$DownSyncReportEventImplCopyWith(_$DownSyncReportEventImpl value,
          $Res Function(_$DownSyncReportEventImpl) then) =
      __$$DownSyncReportEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownSyncReportEventImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncEventCopyWithImpl<$Res,
        _$DownSyncReportEventImpl>
    implements _$$DownSyncReportEventImplCopyWith<$Res> {
  __$$DownSyncReportEventImplCopyWithImpl(_$DownSyncReportEventImpl _value,
      $Res Function(_$DownSyncReportEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownSyncReportEventImpl implements DownSyncReportEvent {
  const _$DownSyncReportEventImpl();

  @override
  String toString() {
    return 'BeneficiaryDownSyncEvent.downSyncReport()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncReportEventImpl);
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
  const factory DownSyncReportEvent() = _$DownSyncReportEventImpl;
}

/// @nodoc
abstract class _$$DownSyncResetStateEventImplCopyWith<$Res> {
  factory _$$DownSyncResetStateEventImplCopyWith(
          _$DownSyncResetStateEventImpl value,
          $Res Function(_$DownSyncResetStateEventImpl) then) =
      __$$DownSyncResetStateEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownSyncResetStateEventImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncEventCopyWithImpl<$Res,
        _$DownSyncResetStateEventImpl>
    implements _$$DownSyncResetStateEventImplCopyWith<$Res> {
  __$$DownSyncResetStateEventImplCopyWithImpl(
      _$DownSyncResetStateEventImpl _value,
      $Res Function(_$DownSyncResetStateEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownSyncResetStateEventImpl implements DownSyncResetStateEvent {
  const _$DownSyncResetStateEventImpl();

  @override
  String toString() {
    return 'BeneficiaryDownSyncEvent.resetState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncResetStateEventImpl);
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
  const factory DownSyncResetStateEvent() = _$DownSyncResetStateEventImpl;
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
abstract class _$$DownSyncInProgressStateImplCopyWith<$Res> {
  factory _$$DownSyncInProgressStateImplCopyWith(
          _$DownSyncInProgressStateImpl value,
          $Res Function(_$DownSyncInProgressStateImpl) then) =
      __$$DownSyncInProgressStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int syncedCount, int totalCount});
}

/// @nodoc
class __$$DownSyncInProgressStateImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$DownSyncInProgressStateImpl>
    implements _$$DownSyncInProgressStateImplCopyWith<$Res> {
  __$$DownSyncInProgressStateImplCopyWithImpl(
      _$DownSyncInProgressStateImpl _value,
      $Res Function(_$DownSyncInProgressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syncedCount = null,
    Object? totalCount = null,
  }) {
    return _then(_$DownSyncInProgressStateImpl(
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

class _$DownSyncInProgressStateImpl extends _DownSyncInProgressState {
  const _$DownSyncInProgressStateImpl(this.syncedCount, this.totalCount)
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncInProgressStateImpl &&
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
  _$$DownSyncInProgressStateImplCopyWith<_$DownSyncInProgressStateImpl>
      get copyWith => __$$DownSyncInProgressStateImplCopyWithImpl<
          _$DownSyncInProgressStateImpl>(this, _$identity);

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
          final int syncedCount, final int totalCount) =
      _$DownSyncInProgressStateImpl;
  const _DownSyncInProgressState._() : super._();

  int get syncedCount;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$DownSyncInProgressStateImplCopyWith<_$DownSyncInProgressStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownSyncSuccessStateImplCopyWith<$Res> {
  factory _$$DownSyncSuccessStateImplCopyWith(_$DownSyncSuccessStateImpl value,
          $Res Function(_$DownSyncSuccessStateImpl) then) =
      __$$DownSyncSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DownsyncModel downSyncResult});
}

/// @nodoc
class __$$DownSyncSuccessStateImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$DownSyncSuccessStateImpl>
    implements _$$DownSyncSuccessStateImplCopyWith<$Res> {
  __$$DownSyncSuccessStateImplCopyWithImpl(_$DownSyncSuccessStateImpl _value,
      $Res Function(_$DownSyncSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downSyncResult = null,
  }) {
    return _then(_$DownSyncSuccessStateImpl(
      null == downSyncResult
          ? _value.downSyncResult
          : downSyncResult // ignore: cast_nullable_to_non_nullable
              as DownsyncModel,
    ));
  }
}

/// @nodoc

class _$DownSyncSuccessStateImpl extends _DownSyncSuccessState {
  const _$DownSyncSuccessStateImpl(this.downSyncResult) : super._();

  @override
  final DownsyncModel downSyncResult;

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.success(downSyncResult: $downSyncResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncSuccessStateImpl &&
            (identical(other.downSyncResult, downSyncResult) ||
                other.downSyncResult == downSyncResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, downSyncResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownSyncSuccessStateImplCopyWith<_$DownSyncSuccessStateImpl>
      get copyWith =>
          __$$DownSyncSuccessStateImplCopyWithImpl<_$DownSyncSuccessStateImpl>(
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
      _$DownSyncSuccessStateImpl;
  const _DownSyncSuccessState._() : super._();

  DownsyncModel get downSyncResult;
  @JsonKey(ignore: true)
  _$$DownSyncSuccessStateImplCopyWith<_$DownSyncSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownSyncGetBatchSizeStateImplCopyWith<$Res> {
  factory _$$DownSyncGetBatchSizeStateImplCopyWith(
          _$DownSyncGetBatchSizeStateImpl value,
          $Res Function(_$DownSyncGetBatchSizeStateImpl) then) =
      __$$DownSyncGetBatchSizeStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int batchSize,
      String projectId,
      String boundaryCode,
      int pendingSyncCount,
      String boundaryName});
}

/// @nodoc
class __$$DownSyncGetBatchSizeStateImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$DownSyncGetBatchSizeStateImpl>
    implements _$$DownSyncGetBatchSizeStateImplCopyWith<$Res> {
  __$$DownSyncGetBatchSizeStateImplCopyWithImpl(
      _$DownSyncGetBatchSizeStateImpl _value,
      $Res Function(_$DownSyncGetBatchSizeStateImpl) _then)
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
    return _then(_$DownSyncGetBatchSizeStateImpl(
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

class _$DownSyncGetBatchSizeStateImpl extends _DownSyncGetBatchSizeState {
  const _$DownSyncGetBatchSizeStateImpl(this.batchSize, this.projectId,
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncGetBatchSizeStateImpl &&
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
  _$$DownSyncGetBatchSizeStateImplCopyWith<_$DownSyncGetBatchSizeStateImpl>
      get copyWith => __$$DownSyncGetBatchSizeStateImplCopyWithImpl<
          _$DownSyncGetBatchSizeStateImpl>(this, _$identity);

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
      final String boundaryName) = _$DownSyncGetBatchSizeStateImpl;
  const _DownSyncGetBatchSizeState._() : super._();

  int get batchSize;
  String get projectId;
  String get boundaryCode;
  int get pendingSyncCount;
  String get boundaryName;
  @JsonKey(ignore: true)
  _$$DownSyncGetBatchSizeStateImplCopyWith<_$DownSyncGetBatchSizeStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownSyncLoadingStateImplCopyWith<$Res> {
  factory _$$DownSyncLoadingStateImplCopyWith(_$DownSyncLoadingStateImpl value,
          $Res Function(_$DownSyncLoadingStateImpl) then) =
      __$$DownSyncLoadingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isPop});
}

/// @nodoc
class __$$DownSyncLoadingStateImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$DownSyncLoadingStateImpl>
    implements _$$DownSyncLoadingStateImplCopyWith<$Res> {
  __$$DownSyncLoadingStateImplCopyWithImpl(_$DownSyncLoadingStateImpl _value,
      $Res Function(_$DownSyncLoadingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPop = null,
  }) {
    return _then(_$DownSyncLoadingStateImpl(
      null == isPop
          ? _value.isPop
          : isPop // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DownSyncLoadingStateImpl extends _DownSyncLoadingState {
  const _$DownSyncLoadingStateImpl(this.isPop) : super._();

  @override
  final bool isPop;

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.loading(isPop: $isPop)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncLoadingStateImpl &&
            (identical(other.isPop, isPop) || other.isPop == isPop));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPop);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownSyncLoadingStateImplCopyWith<_$DownSyncLoadingStateImpl>
      get copyWith =>
          __$$DownSyncLoadingStateImplCopyWithImpl<_$DownSyncLoadingStateImpl>(
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
      _$DownSyncLoadingStateImpl;
  const _DownSyncLoadingState._() : super._();

  bool get isPop;
  @JsonKey(ignore: true)
  _$$DownSyncLoadingStateImplCopyWith<_$DownSyncLoadingStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownSyncInsufficientStorageStateImplCopyWith<$Res> {
  factory _$$DownSyncInsufficientStorageStateImplCopyWith(
          _$DownSyncInsufficientStorageStateImpl value,
          $Res Function(_$DownSyncInsufficientStorageStateImpl) then) =
      __$$DownSyncInsufficientStorageStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownSyncInsufficientStorageStateImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$DownSyncInsufficientStorageStateImpl>
    implements _$$DownSyncInsufficientStorageStateImplCopyWith<$Res> {
  __$$DownSyncInsufficientStorageStateImplCopyWithImpl(
      _$DownSyncInsufficientStorageStateImpl _value,
      $Res Function(_$DownSyncInsufficientStorageStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownSyncInsufficientStorageStateImpl
    extends _DownSyncInsufficientStorageState {
  const _$DownSyncInsufficientStorageStateImpl() : super._();

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.insufficientStorage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncInsufficientStorageStateImpl);
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
      _$DownSyncInsufficientStorageStateImpl;
  const _DownSyncInsufficientStorageState._() : super._();
}

/// @nodoc
abstract class _$$DownSyncDataFoundStateImplCopyWith<$Res> {
  factory _$$DownSyncDataFoundStateImplCopyWith(
          _$DownSyncDataFoundStateImpl value,
          $Res Function(_$DownSyncDataFoundStateImpl) then) =
      __$$DownSyncDataFoundStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int initialServerCount, int batchSize});
}

/// @nodoc
class __$$DownSyncDataFoundStateImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$DownSyncDataFoundStateImpl>
    implements _$$DownSyncDataFoundStateImplCopyWith<$Res> {
  __$$DownSyncDataFoundStateImplCopyWithImpl(
      _$DownSyncDataFoundStateImpl _value,
      $Res Function(_$DownSyncDataFoundStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialServerCount = null,
    Object? batchSize = null,
  }) {
    return _then(_$DownSyncDataFoundStateImpl(
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

class _$DownSyncDataFoundStateImpl extends _DownSyncDataFoundState {
  const _$DownSyncDataFoundStateImpl(this.initialServerCount, this.batchSize)
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncDataFoundStateImpl &&
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
  _$$DownSyncDataFoundStateImplCopyWith<_$DownSyncDataFoundStateImpl>
      get copyWith => __$$DownSyncDataFoundStateImplCopyWithImpl<
          _$DownSyncDataFoundStateImpl>(this, _$identity);

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
      _$DownSyncDataFoundStateImpl;
  const _DownSyncDataFoundState._() : super._();

  int get initialServerCount;
  int get batchSize;
  @JsonKey(ignore: true)
  _$$DownSyncDataFoundStateImplCopyWith<_$DownSyncDataFoundStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownSyncResetStateImplCopyWith<$Res> {
  factory _$$DownSyncResetStateImplCopyWith(_$DownSyncResetStateImpl value,
          $Res Function(_$DownSyncResetStateImpl) then) =
      __$$DownSyncResetStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownSyncResetStateImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$DownSyncResetStateImpl>
    implements _$$DownSyncResetStateImplCopyWith<$Res> {
  __$$DownSyncResetStateImplCopyWithImpl(_$DownSyncResetStateImpl _value,
      $Res Function(_$DownSyncResetStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownSyncResetStateImpl extends _DownSyncResetState {
  const _$DownSyncResetStateImpl() : super._();

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.resetState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownSyncResetStateImpl);
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
  const factory _DownSyncResetState() = _$DownSyncResetStateImpl;
  const _DownSyncResetState._() : super._();
}

/// @nodoc
abstract class _$$DownSynnCountCheckFailedStateImplCopyWith<$Res> {
  factory _$$DownSynnCountCheckFailedStateImplCopyWith(
          _$DownSynnCountCheckFailedStateImpl value,
          $Res Function(_$DownSynnCountCheckFailedStateImpl) then) =
      __$$DownSynnCountCheckFailedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownSynnCountCheckFailedStateImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$DownSynnCountCheckFailedStateImpl>
    implements _$$DownSynnCountCheckFailedStateImplCopyWith<$Res> {
  __$$DownSynnCountCheckFailedStateImplCopyWithImpl(
      _$DownSynnCountCheckFailedStateImpl _value,
      $Res Function(_$DownSynnCountCheckFailedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownSynnCountCheckFailedStateImpl
    extends _DownSynnCountCheckFailedState {
  const _$DownSynnCountCheckFailedStateImpl() : super._();

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.totalCountCheckFailed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSynnCountCheckFailedStateImpl);
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
      _$DownSynnCountCheckFailedStateImpl;
  const _DownSynnCountCheckFailedState._() : super._();
}

/// @nodoc
abstract class _$$DownSyncFailureStateImplCopyWith<$Res> {
  factory _$$DownSyncFailureStateImplCopyWith(_$DownSyncFailureStateImpl value,
          $Res Function(_$DownSyncFailureStateImpl) then) =
      __$$DownSyncFailureStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownSyncFailureStateImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$DownSyncFailureStateImpl>
    implements _$$DownSyncFailureStateImplCopyWith<$Res> {
  __$$DownSyncFailureStateImplCopyWithImpl(_$DownSyncFailureStateImpl _value,
      $Res Function(_$DownSyncFailureStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownSyncFailureStateImpl extends _DownSyncFailureState {
  const _$DownSyncFailureStateImpl() : super._();

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.failed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncFailureStateImpl);
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
  const factory _DownSyncFailureState() = _$DownSyncFailureStateImpl;
  const _DownSyncFailureState._() : super._();
}

/// @nodoc
abstract class _$$DownSyncReportStateImplCopyWith<$Res> {
  factory _$$DownSyncReportStateImplCopyWith(_$DownSyncReportStateImpl value,
          $Res Function(_$DownSyncReportStateImpl) then) =
      __$$DownSyncReportStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DownsyncModel> downsyncCriteriaList});
}

/// @nodoc
class __$$DownSyncReportStateImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$DownSyncReportStateImpl>
    implements _$$DownSyncReportStateImplCopyWith<$Res> {
  __$$DownSyncReportStateImplCopyWithImpl(_$DownSyncReportStateImpl _value,
      $Res Function(_$DownSyncReportStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downsyncCriteriaList = null,
  }) {
    return _then(_$DownSyncReportStateImpl(
      null == downsyncCriteriaList
          ? _value._downsyncCriteriaList
          : downsyncCriteriaList // ignore: cast_nullable_to_non_nullable
              as List<DownsyncModel>,
    ));
  }
}

/// @nodoc

class _$DownSyncReportStateImpl extends _DownSyncReportState {
  const _$DownSyncReportStateImpl(
      final List<DownsyncModel> downsyncCriteriaList)
      : _downsyncCriteriaList = downsyncCriteriaList,
        super._();

  final List<DownsyncModel> _downsyncCriteriaList;
  @override
  List<DownsyncModel> get downsyncCriteriaList {
    if (_downsyncCriteriaList is EqualUnmodifiableListView)
      return _downsyncCriteriaList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_downsyncCriteriaList);
  }

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.report(downsyncCriteriaList: $downsyncCriteriaList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncReportStateImpl &&
            const DeepCollectionEquality()
                .equals(other._downsyncCriteriaList, _downsyncCriteriaList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_downsyncCriteriaList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownSyncReportStateImplCopyWith<_$DownSyncReportStateImpl> get copyWith =>
      __$$DownSyncReportStateImplCopyWithImpl<_$DownSyncReportStateImpl>(
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
          final List<DownsyncModel> downsyncCriteriaList) =
      _$DownSyncReportStateImpl;
  const _DownSyncReportState._() : super._();

  List<DownsyncModel> get downsyncCriteriaList;
  @JsonKey(ignore: true)
  _$$DownSyncReportStateImplCopyWith<_$DownSyncReportStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownSyncPendingSyncStateImplCopyWith<$Res> {
  factory _$$DownSyncPendingSyncStateImplCopyWith(
          _$DownSyncPendingSyncStateImpl value,
          $Res Function(_$DownSyncPendingSyncStateImpl) then) =
      __$$DownSyncPendingSyncStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownSyncPendingSyncStateImplCopyWithImpl<$Res>
    extends _$BeneficiaryDownSyncStateCopyWithImpl<$Res,
        _$DownSyncPendingSyncStateImpl>
    implements _$$DownSyncPendingSyncStateImplCopyWith<$Res> {
  __$$DownSyncPendingSyncStateImplCopyWithImpl(
      _$DownSyncPendingSyncStateImpl _value,
      $Res Function(_$DownSyncPendingSyncStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownSyncPendingSyncStateImpl extends _DownSyncPendingSyncState {
  const _$DownSyncPendingSyncStateImpl() : super._();

  @override
  String toString() {
    return 'BeneficiaryDownSyncState.pendingSync()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncPendingSyncStateImpl);
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
  const factory _DownSyncPendingSyncState() = _$DownSyncPendingSyncStateImpl;
  const _DownSyncPendingSyncState._() : super._();
}

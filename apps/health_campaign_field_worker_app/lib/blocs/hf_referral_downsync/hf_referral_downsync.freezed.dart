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
    required TResult Function(
            String projectId, List<AppConfiguration> appConfiguration)
        start,
    required TResult Function(
            String projectId,
            List<AppConfiguration> appConfiguration,
            int totalCount,
            int serverTotalCount)
        download,
    required TResult Function() resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String projectId, List<AppConfiguration> appConfiguration)?
        start,
    TResult? Function(String projectId, List<AppConfiguration> appConfiguration,
            int totalCount, int serverTotalCount)?
        download,
    TResult? Function()? resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, List<AppConfiguration> appConfiguration)?
        start,
    TResult Function(String projectId, List<AppConfiguration> appConfiguration,
            int totalCount, int serverTotalCount)?
        download,
    TResult Function()? resetState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferralDownSyncStartEvent value) start,
    required TResult Function(HFReferralDownSyncDownloadEvent value) download,
    required TResult Function(HFReferralDownSyncResetStateEvent value)
        resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferralDownSyncStartEvent value)? start,
    TResult? Function(HFReferralDownSyncDownloadEvent value)? download,
    TResult? Function(HFReferralDownSyncResetStateEvent value)? resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferralDownSyncStartEvent value)? start,
    TResult Function(HFReferralDownSyncDownloadEvent value)? download,
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
  $Res call({String projectId, List<AppConfiguration> appConfiguration});
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
    Object? appConfiguration = null,
  }) {
    return _then(_$HFReferralDownSyncStartEventImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      appConfiguration: null == appConfiguration
          ? _value._appConfiguration
          : appConfiguration // ignore: cast_nullable_to_non_nullable
              as List<AppConfiguration>,
    ));
  }
}

/// @nodoc

class _$HFReferralDownSyncStartEventImpl
    implements HFReferralDownSyncStartEvent {
  const _$HFReferralDownSyncStartEventImpl(
      {required this.projectId,
      required final List<AppConfiguration> appConfiguration})
      : _appConfiguration = appConfiguration;

  @override
  final String projectId;
  final List<AppConfiguration> _appConfiguration;
  @override
  List<AppConfiguration> get appConfiguration {
    if (_appConfiguration is EqualUnmodifiableListView)
      return _appConfiguration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appConfiguration);
  }

  @override
  String toString() {
    return 'HFReferralDownSyncEvent.start(projectId: $projectId, appConfiguration: $appConfiguration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncStartEventImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality()
                .equals(other._appConfiguration, _appConfiguration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId,
      const DeepCollectionEquality().hash(_appConfiguration));

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
    required TResult Function(
            String projectId, List<AppConfiguration> appConfiguration)
        start,
    required TResult Function(
            String projectId,
            List<AppConfiguration> appConfiguration,
            int totalCount,
            int serverTotalCount)
        download,
    required TResult Function() resetState,
  }) {
    return start(projectId, appConfiguration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String projectId, List<AppConfiguration> appConfiguration)?
        start,
    TResult? Function(String projectId, List<AppConfiguration> appConfiguration,
            int totalCount, int serverTotalCount)?
        download,
    TResult? Function()? resetState,
  }) {
    return start?.call(projectId, appConfiguration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, List<AppConfiguration> appConfiguration)?
        start,
    TResult Function(String projectId, List<AppConfiguration> appConfiguration,
            int totalCount, int serverTotalCount)?
        download,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(projectId, appConfiguration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferralDownSyncStartEvent value) start,
    required TResult Function(HFReferralDownSyncDownloadEvent value) download,
    required TResult Function(HFReferralDownSyncResetStateEvent value)
        resetState,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferralDownSyncStartEvent value)? start,
    TResult? Function(HFReferralDownSyncDownloadEvent value)? download,
    TResult? Function(HFReferralDownSyncResetStateEvent value)? resetState,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferralDownSyncStartEvent value)? start,
    TResult Function(HFReferralDownSyncDownloadEvent value)? download,
    TResult Function(HFReferralDownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class HFReferralDownSyncStartEvent implements HFReferralDownSyncEvent {
  const factory HFReferralDownSyncStartEvent(
          {required final String projectId,
          required final List<AppConfiguration> appConfiguration}) =
      _$HFReferralDownSyncStartEventImpl;

  String get projectId;
  List<AppConfiguration> get appConfiguration;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncStartEventImplCopyWith<
          _$HFReferralDownSyncStartEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HFReferralDownSyncDownloadEventImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncDownloadEventImplCopyWith(
          _$HFReferralDownSyncDownloadEventImpl value,
          $Res Function(_$HFReferralDownSyncDownloadEventImpl) then) =
      __$$HFReferralDownSyncDownloadEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      List<AppConfiguration> appConfiguration,
      int totalCount,
      int serverTotalCount});
}

/// @nodoc
class __$$HFReferralDownSyncDownloadEventImplCopyWithImpl<$Res>
    extends _$HFReferralDownSyncEventCopyWithImpl<$Res,
        _$HFReferralDownSyncDownloadEventImpl>
    implements _$$HFReferralDownSyncDownloadEventImplCopyWith<$Res> {
  __$$HFReferralDownSyncDownloadEventImplCopyWithImpl(
      _$HFReferralDownSyncDownloadEventImpl _value,
      $Res Function(_$HFReferralDownSyncDownloadEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? appConfiguration = null,
    Object? totalCount = null,
    Object? serverTotalCount = null,
  }) {
    return _then(_$HFReferralDownSyncDownloadEventImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      appConfiguration: null == appConfiguration
          ? _value._appConfiguration
          : appConfiguration // ignore: cast_nullable_to_non_nullable
              as List<AppConfiguration>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      serverTotalCount: null == serverTotalCount
          ? _value.serverTotalCount
          : serverTotalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HFReferralDownSyncDownloadEventImpl
    implements HFReferralDownSyncDownloadEvent {
  const _$HFReferralDownSyncDownloadEventImpl(
      {required this.projectId,
      required final List<AppConfiguration> appConfiguration,
      required this.totalCount,
      required this.serverTotalCount})
      : _appConfiguration = appConfiguration;

  @override
  final String projectId;
  final List<AppConfiguration> _appConfiguration;
  @override
  List<AppConfiguration> get appConfiguration {
    if (_appConfiguration is EqualUnmodifiableListView)
      return _appConfiguration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appConfiguration);
  }

  @override
  final int totalCount;
  @override
  final int serverTotalCount;

  @override
  String toString() {
    return 'HFReferralDownSyncEvent.download(projectId: $projectId, appConfiguration: $appConfiguration, totalCount: $totalCount, serverTotalCount: $serverTotalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncDownloadEventImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality()
                .equals(other._appConfiguration, _appConfiguration) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.serverTotalCount, serverTotalCount) ||
                other.serverTotalCount == serverTotalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectId,
      const DeepCollectionEquality().hash(_appConfiguration),
      totalCount,
      serverTotalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HFReferralDownSyncDownloadEventImplCopyWith<
          _$HFReferralDownSyncDownloadEventImpl>
      get copyWith => __$$HFReferralDownSyncDownloadEventImplCopyWithImpl<
          _$HFReferralDownSyncDownloadEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String projectId, List<AppConfiguration> appConfiguration)
        start,
    required TResult Function(
            String projectId,
            List<AppConfiguration> appConfiguration,
            int totalCount,
            int serverTotalCount)
        download,
    required TResult Function() resetState,
  }) {
    return download(projectId, appConfiguration, totalCount, serverTotalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String projectId, List<AppConfiguration> appConfiguration)?
        start,
    TResult? Function(String projectId, List<AppConfiguration> appConfiguration,
            int totalCount, int serverTotalCount)?
        download,
    TResult? Function()? resetState,
  }) {
    return download?.call(
        projectId, appConfiguration, totalCount, serverTotalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, List<AppConfiguration> appConfiguration)?
        start,
    TResult Function(String projectId, List<AppConfiguration> appConfiguration,
            int totalCount, int serverTotalCount)?
        download,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (download != null) {
      return download(
          projectId, appConfiguration, totalCount, serverTotalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HFReferralDownSyncStartEvent value) start,
    required TResult Function(HFReferralDownSyncDownloadEvent value) download,
    required TResult Function(HFReferralDownSyncResetStateEvent value)
        resetState,
  }) {
    return download(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferralDownSyncStartEvent value)? start,
    TResult? Function(HFReferralDownSyncDownloadEvent value)? download,
    TResult? Function(HFReferralDownSyncResetStateEvent value)? resetState,
  }) {
    return download?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferralDownSyncStartEvent value)? start,
    TResult Function(HFReferralDownSyncDownloadEvent value)? download,
    TResult Function(HFReferralDownSyncResetStateEvent value)? resetState,
    required TResult orElse(),
  }) {
    if (download != null) {
      return download(this);
    }
    return orElse();
  }
}

abstract class HFReferralDownSyncDownloadEvent
    implements HFReferralDownSyncEvent {
  const factory HFReferralDownSyncDownloadEvent(
          {required final String projectId,
          required final List<AppConfiguration> appConfiguration,
          required final int totalCount,
          required final int serverTotalCount}) =
      _$HFReferralDownSyncDownloadEventImpl;

  String get projectId;
  List<AppConfiguration> get appConfiguration;
  int get totalCount;
  int get serverTotalCount;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncDownloadEventImplCopyWith<
          _$HFReferralDownSyncDownloadEventImpl>
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
    required TResult Function(
            String projectId, List<AppConfiguration> appConfiguration)
        start,
    required TResult Function(
            String projectId,
            List<AppConfiguration> appConfiguration,
            int totalCount,
            int serverTotalCount)
        download,
    required TResult Function() resetState,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String projectId, List<AppConfiguration> appConfiguration)?
        start,
    TResult? Function(String projectId, List<AppConfiguration> appConfiguration,
            int totalCount, int serverTotalCount)?
        download,
    TResult? Function()? resetState,
  }) {
    return resetState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, List<AppConfiguration> appConfiguration)?
        start,
    TResult Function(String projectId, List<AppConfiguration> appConfiguration,
            int totalCount, int serverTotalCount)?
        download,
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
    required TResult Function(HFReferralDownSyncStartEvent value) start,
    required TResult Function(HFReferralDownSyncDownloadEvent value) download,
    required TResult Function(HFReferralDownSyncResetStateEvent value)
        resetState,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HFReferralDownSyncStartEvent value)? start,
    TResult? Function(HFReferralDownSyncDownloadEvent value)? download,
    TResult? Function(HFReferralDownSyncResetStateEvent value)? resetState,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HFReferralDownSyncStartEvent value)? start,
    TResult Function(HFReferralDownSyncDownloadEvent value)? download,
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
    required TResult Function() loading,
    required TResult Function(int newCount, int serverTotalCount) dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() resetState,
    required TResult Function() failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int newCount, int serverTotalCount)? dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? resetState,
    TResult? Function()? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int newCount, int serverTotalCount)? dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
    TResult Function()? resetState,
    TResult Function()? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
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
abstract class _$$HFReferralDownSyncLoadingStateImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncLoadingStateImplCopyWith(
          _$HFReferralDownSyncLoadingStateImpl value,
          $Res Function(_$HFReferralDownSyncLoadingStateImpl) then) =
      __$$HFReferralDownSyncLoadingStateImplCopyWithImpl<$Res>;
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
}

/// @nodoc

class _$HFReferralDownSyncLoadingStateImpl
    extends _HFReferralDownSyncLoadingState {
  const _$HFReferralDownSyncLoadingStateImpl() : super._();

  @override
  String toString() {
    return 'HFReferralDownSyncState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int newCount, int serverTotalCount) dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() resetState,
    required TResult Function() failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int newCount, int serverTotalCount)? dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? resetState,
    TResult? Function()? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int newCount, int serverTotalCount)? dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
    TResult Function()? resetState,
    TResult Function()? failed,
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
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _HFReferralDownSyncLoadingState extends HFReferralDownSyncState {
  const factory _HFReferralDownSyncLoadingState() =
      _$HFReferralDownSyncLoadingStateImpl;
  const _HFReferralDownSyncLoadingState._() : super._();
}

/// @nodoc
abstract class _$$HFReferralDownSyncDataFoundStateImplCopyWith<$Res> {
  factory _$$HFReferralDownSyncDataFoundStateImplCopyWith(
          _$HFReferralDownSyncDataFoundStateImpl value,
          $Res Function(_$HFReferralDownSyncDataFoundStateImpl) then) =
      __$$HFReferralDownSyncDataFoundStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int newCount, int serverTotalCount});
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
    Object? newCount = null,
    Object? serverTotalCount = null,
  }) {
    return _then(_$HFReferralDownSyncDataFoundStateImpl(
      null == newCount
          ? _value.newCount
          : newCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == serverTotalCount
          ? _value.serverTotalCount
          : serverTotalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HFReferralDownSyncDataFoundStateImpl
    extends _HFReferralDownSyncDataFoundState {
  const _$HFReferralDownSyncDataFoundStateImpl(
      this.newCount, this.serverTotalCount)
      : super._();

  @override
  final int newCount;
  @override
  final int serverTotalCount;

  @override
  String toString() {
    return 'HFReferralDownSyncState.dataFound(newCount: $newCount, serverTotalCount: $serverTotalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncDataFoundStateImpl &&
            (identical(other.newCount, newCount) ||
                other.newCount == newCount) &&
            (identical(other.serverTotalCount, serverTotalCount) ||
                other.serverTotalCount == serverTotalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newCount, serverTotalCount);

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
    required TResult Function() loading,
    required TResult Function(int newCount, int serverTotalCount) dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() resetState,
    required TResult Function() failed,
  }) {
    return dataFound(newCount, serverTotalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int newCount, int serverTotalCount)? dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? resetState,
    TResult? Function()? failed,
  }) {
    return dataFound?.call(newCount, serverTotalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int newCount, int serverTotalCount)? dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
    TResult Function()? resetState,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (dataFound != null) {
      return dataFound(newCount, serverTotalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
  }) {
    return dataFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
  }) {
    return dataFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
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
          final int newCount, final int serverTotalCount) =
      _$HFReferralDownSyncDataFoundStateImpl;
  const _HFReferralDownSyncDataFoundState._() : super._();

  int get newCount;
  int get serverTotalCount;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncDataFoundStateImplCopyWith<
          _$HFReferralDownSyncDataFoundStateImpl>
      get copyWith => throw _privateConstructorUsedError;
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
    required TResult Function() loading,
    required TResult Function(int newCount, int serverTotalCount) dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() resetState,
    required TResult Function() failed,
  }) {
    return inProgress(syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int newCount, int serverTotalCount)? dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? resetState,
    TResult? Function()? failed,
  }) {
    return inProgress?.call(syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int newCount, int serverTotalCount)? dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
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
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
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
  $Res call({int syncedCount, int totalCount});
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
    Object? syncedCount = null,
    Object? totalCount = null,
  }) {
    return _then(_$HFReferralDownSyncSuccessStateImpl(
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

class _$HFReferralDownSyncSuccessStateImpl
    extends _HFReferralDownSyncSuccessState {
  const _$HFReferralDownSyncSuccessStateImpl(this.syncedCount, this.totalCount)
      : super._();

  @override
  final int syncedCount;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'HFReferralDownSyncState.success(syncedCount: $syncedCount, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HFReferralDownSyncSuccessStateImpl &&
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
  _$$HFReferralDownSyncSuccessStateImplCopyWith<
          _$HFReferralDownSyncSuccessStateImpl>
      get copyWith => __$$HFReferralDownSyncSuccessStateImplCopyWithImpl<
          _$HFReferralDownSyncSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int newCount, int serverTotalCount) dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() resetState,
    required TResult Function() failed,
  }) {
    return success(syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int newCount, int serverTotalCount)? dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? resetState,
    TResult? Function()? failed,
  }) {
    return success?.call(syncedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int newCount, int serverTotalCount)? dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
    TResult Function()? resetState,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(syncedCount, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
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
          final int syncedCount, final int totalCount) =
      _$HFReferralDownSyncSuccessStateImpl;
  const _HFReferralDownSyncSuccessState._() : super._();

  int get syncedCount;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$HFReferralDownSyncSuccessStateImplCopyWith<
          _$HFReferralDownSyncSuccessStateImpl>
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
    required TResult Function() loading,
    required TResult Function(int newCount, int serverTotalCount) dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() resetState,
    required TResult Function() failed,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int newCount, int serverTotalCount)? dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? resetState,
    TResult? Function()? failed,
  }) {
    return resetState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int newCount, int serverTotalCount)? dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
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
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
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
    required TResult Function() loading,
    required TResult Function(int newCount, int serverTotalCount) dataFound,
    required TResult Function(int syncedCount, int totalCount) inProgress,
    required TResult Function(int syncedCount, int totalCount) success,
    required TResult Function() resetState,
    required TResult Function() failed,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int newCount, int serverTotalCount)? dataFound,
    TResult? Function(int syncedCount, int totalCount)? inProgress,
    TResult? Function(int syncedCount, int totalCount)? success,
    TResult? Function()? resetState,
    TResult? Function()? failed,
  }) {
    return failed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int newCount, int serverTotalCount)? dataFound,
    TResult Function(int syncedCount, int totalCount)? inProgress,
    TResult Function(int syncedCount, int totalCount)? success,
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
    required TResult Function(_HFReferralDownSyncLoadingState value) loading,
    required TResult Function(_HFReferralDownSyncDataFoundState value)
        dataFound,
    required TResult Function(_HFReferralDownSyncInProgressState value)
        inProgress,
    required TResult Function(_HFReferralDownSyncSuccessState value) success,
    required TResult Function(_HFReferralDownSyncResetState value) resetState,
    required TResult Function(_HFReferralDownSyncFailureState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult? Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult? Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult? Function(_HFReferralDownSyncSuccessState value)? success,
    TResult? Function(_HFReferralDownSyncResetState value)? resetState,
    TResult? Function(_HFReferralDownSyncFailureState value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HFReferralDownSyncLoadingState value)? loading,
    TResult Function(_HFReferralDownSyncDataFoundState value)? dataFound,
    TResult Function(_HFReferralDownSyncInProgressState value)? inProgress,
    TResult Function(_HFReferralDownSyncSuccessState value)? success,
    TResult Function(_HFReferralDownSyncResetState value)? resetState,
    TResult Function(_HFReferralDownSyncFailureState value)? failed,
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

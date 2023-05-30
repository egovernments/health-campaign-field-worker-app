// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sync.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SyncEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String createdBy, int? count) refresh,
    required TResult Function(
            String userId,
            List<LocalRepository<EntityModel, EntitySearchModel>>
                localRepositories,
            List<RemoteRepository<EntityModel, EntitySearchModel>>
                remoteRepositories)
        syncUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String createdBy, int? count)? refresh,
    TResult? Function(
            String userId,
            List<LocalRepository<EntityModel, EntitySearchModel>>
                localRepositories,
            List<RemoteRepository<EntityModel, EntitySearchModel>>
                remoteRepositories)?
        syncUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String createdBy, int? count)? refresh,
    TResult Function(
            String userId,
            List<LocalRepository<EntityModel, EntitySearchModel>>
                localRepositories,
            List<RemoteRepository<EntityModel, EntitySearchModel>>
                remoteRepositories)?
        syncUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncRefreshEvent value) refresh,
    required TResult Function(SyncSyncUpEvent value) syncUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncRefreshEvent value)? refresh,
    TResult? Function(SyncSyncUpEvent value)? syncUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncRefreshEvent value)? refresh,
    TResult Function(SyncSyncUpEvent value)? syncUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncEventCopyWith<$Res> {
  factory $SyncEventCopyWith(SyncEvent value, $Res Function(SyncEvent) then) =
      _$SyncEventCopyWithImpl<$Res, SyncEvent>;
}

/// @nodoc
class _$SyncEventCopyWithImpl<$Res, $Val extends SyncEvent>
    implements $SyncEventCopyWith<$Res> {
  _$SyncEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SyncRefreshEventCopyWith<$Res> {
  factory _$$SyncRefreshEventCopyWith(
          _$SyncRefreshEvent value, $Res Function(_$SyncRefreshEvent) then) =
      __$$SyncRefreshEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String createdBy, int? count});
}

/// @nodoc
class __$$SyncRefreshEventCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$SyncRefreshEvent>
    implements _$$SyncRefreshEventCopyWith<$Res> {
  __$$SyncRefreshEventCopyWithImpl(
      _$SyncRefreshEvent _value, $Res Function(_$SyncRefreshEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = null,
    Object? count = freezed,
  }) {
    return _then(_$SyncRefreshEvent(
      null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SyncRefreshEvent implements SyncRefreshEvent {
  const _$SyncRefreshEvent(this.createdBy, [this.count]);

  @override
  final String createdBy;
  @override
  final int? count;

  @override
  String toString() {
    return 'SyncEvent.refresh(createdBy: $createdBy, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncRefreshEvent &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdBy, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncRefreshEventCopyWith<_$SyncRefreshEvent> get copyWith =>
      __$$SyncRefreshEventCopyWithImpl<_$SyncRefreshEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String createdBy, int? count) refresh,
    required TResult Function(
            String userId,
            List<LocalRepository<EntityModel, EntitySearchModel>>
                localRepositories,
            List<RemoteRepository<EntityModel, EntitySearchModel>>
                remoteRepositories)
        syncUp,
  }) {
    return refresh(createdBy, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String createdBy, int? count)? refresh,
    TResult? Function(
            String userId,
            List<LocalRepository<EntityModel, EntitySearchModel>>
                localRepositories,
            List<RemoteRepository<EntityModel, EntitySearchModel>>
                remoteRepositories)?
        syncUp,
  }) {
    return refresh?.call(createdBy, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String createdBy, int? count)? refresh,
    TResult Function(
            String userId,
            List<LocalRepository<EntityModel, EntitySearchModel>>
                localRepositories,
            List<RemoteRepository<EntityModel, EntitySearchModel>>
                remoteRepositories)?
        syncUp,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(createdBy, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncRefreshEvent value) refresh,
    required TResult Function(SyncSyncUpEvent value) syncUp,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncRefreshEvent value)? refresh,
    TResult? Function(SyncSyncUpEvent value)? syncUp,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncRefreshEvent value)? refresh,
    TResult Function(SyncSyncUpEvent value)? syncUp,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class SyncRefreshEvent implements SyncEvent {
  const factory SyncRefreshEvent(final String createdBy, [final int? count]) =
      _$SyncRefreshEvent;

  String get createdBy;
  int? get count;
  @JsonKey(ignore: true)
  _$$SyncRefreshEventCopyWith<_$SyncRefreshEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncSyncUpEventCopyWith<$Res> {
  factory _$$SyncSyncUpEventCopyWith(
          _$SyncSyncUpEvent value, $Res Function(_$SyncSyncUpEvent) then) =
      __$$SyncSyncUpEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String userId,
      List<LocalRepository<EntityModel, EntitySearchModel>> localRepositories,
      List<RemoteRepository<EntityModel, EntitySearchModel>>
          remoteRepositories});
}

/// @nodoc
class __$$SyncSyncUpEventCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$SyncSyncUpEvent>
    implements _$$SyncSyncUpEventCopyWith<$Res> {
  __$$SyncSyncUpEventCopyWithImpl(
      _$SyncSyncUpEvent _value, $Res Function(_$SyncSyncUpEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? localRepositories = null,
    Object? remoteRepositories = null,
  }) {
    return _then(_$SyncSyncUpEvent(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      localRepositories: null == localRepositories
          ? _value._localRepositories
          : localRepositories // ignore: cast_nullable_to_non_nullable
              as List<LocalRepository<EntityModel, EntitySearchModel>>,
      remoteRepositories: null == remoteRepositories
          ? _value._remoteRepositories
          : remoteRepositories // ignore: cast_nullable_to_non_nullable
              as List<RemoteRepository<EntityModel, EntitySearchModel>>,
    ));
  }
}

/// @nodoc

class _$SyncSyncUpEvent implements SyncSyncUpEvent {
  const _$SyncSyncUpEvent(
      {required this.userId,
      required final List<LocalRepository<EntityModel, EntitySearchModel>>
          localRepositories,
      required final List<RemoteRepository<EntityModel, EntitySearchModel>>
          remoteRepositories})
      : _localRepositories = localRepositories,
        _remoteRepositories = remoteRepositories;

  @override
  final String userId;
  final List<LocalRepository<EntityModel, EntitySearchModel>>
      _localRepositories;
  @override
  List<LocalRepository<EntityModel, EntitySearchModel>> get localRepositories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_localRepositories);
  }

  final List<RemoteRepository<EntityModel, EntitySearchModel>>
      _remoteRepositories;
  @override
  List<RemoteRepository<EntityModel, EntitySearchModel>>
      get remoteRepositories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_remoteRepositories);
  }

  @override
  String toString() {
    return 'SyncEvent.syncUp(userId: $userId, localRepositories: $localRepositories, remoteRepositories: $remoteRepositories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncSyncUpEvent &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._localRepositories, _localRepositories) &&
            const DeepCollectionEquality()
                .equals(other._remoteRepositories, _remoteRepositories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      const DeepCollectionEquality().hash(_localRepositories),
      const DeepCollectionEquality().hash(_remoteRepositories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncSyncUpEventCopyWith<_$SyncSyncUpEvent> get copyWith =>
      __$$SyncSyncUpEventCopyWithImpl<_$SyncSyncUpEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String createdBy, int? count) refresh,
    required TResult Function(
            String userId,
            List<LocalRepository<EntityModel, EntitySearchModel>>
                localRepositories,
            List<RemoteRepository<EntityModel, EntitySearchModel>>
                remoteRepositories)
        syncUp,
  }) {
    return syncUp(userId, localRepositories, remoteRepositories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String createdBy, int? count)? refresh,
    TResult? Function(
            String userId,
            List<LocalRepository<EntityModel, EntitySearchModel>>
                localRepositories,
            List<RemoteRepository<EntityModel, EntitySearchModel>>
                remoteRepositories)?
        syncUp,
  }) {
    return syncUp?.call(userId, localRepositories, remoteRepositories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String createdBy, int? count)? refresh,
    TResult Function(
            String userId,
            List<LocalRepository<EntityModel, EntitySearchModel>>
                localRepositories,
            List<RemoteRepository<EntityModel, EntitySearchModel>>
                remoteRepositories)?
        syncUp,
    required TResult orElse(),
  }) {
    if (syncUp != null) {
      return syncUp(userId, localRepositories, remoteRepositories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncRefreshEvent value) refresh,
    required TResult Function(SyncSyncUpEvent value) syncUp,
  }) {
    return syncUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncRefreshEvent value)? refresh,
    TResult? Function(SyncSyncUpEvent value)? syncUp,
  }) {
    return syncUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncRefreshEvent value)? refresh,
    TResult Function(SyncSyncUpEvent value)? syncUp,
    required TResult orElse(),
  }) {
    if (syncUp != null) {
      return syncUp(this);
    }
    return orElse();
  }
}

abstract class SyncSyncUpEvent implements SyncEvent {
  const factory SyncSyncUpEvent(
      {required final String userId,
      required final List<LocalRepository<EntityModel, EntitySearchModel>>
          localRepositories,
      required final List<RemoteRepository<EntityModel, EntitySearchModel>>
          remoteRepositories}) = _$SyncSyncUpEvent;

  String get userId;
  List<LocalRepository<EntityModel, EntitySearchModel>> get localRepositories;
  List<RemoteRepository<EntityModel, EntitySearchModel>> get remoteRepositories;
  @JsonKey(ignore: true)
  _$$SyncSyncUpEventCopyWith<_$SyncSyncUpEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SyncState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() syncInProgress,
    required TResult Function(int count) pendingSync,
    required TResult Function() completedSync,
    required TResult Function() failedSync,
    required TResult Function() failedDownSync,
    required TResult Function() failedUpSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? syncInProgress,
    TResult? Function(int count)? pendingSync,
    TResult? Function()? completedSync,
    TResult? Function()? failedSync,
    TResult? Function()? failedDownSync,
    TResult? Function()? failedUpSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? syncInProgress,
    TResult Function(int count)? pendingSync,
    TResult Function()? completedSync,
    TResult Function()? failedSync,
    TResult Function()? failedDownSync,
    TResult Function()? failedUpSync,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncLoadingState value) loading,
    required TResult Function(SyncInProgressState value) syncInProgress,
    required TResult Function(SyncPendingState value) pendingSync,
    required TResult Function(SyncCompletedState value) completedSync,
    required TResult Function(SyncFailedState value) failedSync,
    required TResult Function(DownSyncFailedState value) failedDownSync,
    required TResult Function(UpSyncFailedState value) failedUpSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncLoadingState value)? loading,
    TResult? Function(SyncInProgressState value)? syncInProgress,
    TResult? Function(SyncPendingState value)? pendingSync,
    TResult? Function(SyncCompletedState value)? completedSync,
    TResult? Function(SyncFailedState value)? failedSync,
    TResult? Function(DownSyncFailedState value)? failedDownSync,
    TResult? Function(UpSyncFailedState value)? failedUpSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncLoadingState value)? loading,
    TResult Function(SyncInProgressState value)? syncInProgress,
    TResult Function(SyncPendingState value)? pendingSync,
    TResult Function(SyncCompletedState value)? completedSync,
    TResult Function(SyncFailedState value)? failedSync,
    TResult Function(DownSyncFailedState value)? failedDownSync,
    TResult Function(UpSyncFailedState value)? failedUpSync,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncStateCopyWith<$Res> {
  factory $SyncStateCopyWith(SyncState value, $Res Function(SyncState) then) =
      _$SyncStateCopyWithImpl<$Res, SyncState>;
}

/// @nodoc
class _$SyncStateCopyWithImpl<$Res, $Val extends SyncState>
    implements $SyncStateCopyWith<$Res> {
  _$SyncStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SyncLoadingStateCopyWith<$Res> {
  factory _$$SyncLoadingStateCopyWith(
          _$SyncLoadingState value, $Res Function(_$SyncLoadingState) then) =
      __$$SyncLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncLoadingStateCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncLoadingState>
    implements _$$SyncLoadingStateCopyWith<$Res> {
  __$$SyncLoadingStateCopyWithImpl(
      _$SyncLoadingState _value, $Res Function(_$SyncLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncLoadingState implements SyncLoadingState {
  const _$SyncLoadingState();

  @override
  String toString() {
    return 'SyncState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() syncInProgress,
    required TResult Function(int count) pendingSync,
    required TResult Function() completedSync,
    required TResult Function() failedSync,
    required TResult Function() failedDownSync,
    required TResult Function() failedUpSync,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? syncInProgress,
    TResult? Function(int count)? pendingSync,
    TResult? Function()? completedSync,
    TResult? Function()? failedSync,
    TResult? Function()? failedDownSync,
    TResult? Function()? failedUpSync,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? syncInProgress,
    TResult Function(int count)? pendingSync,
    TResult Function()? completedSync,
    TResult Function()? failedSync,
    TResult Function()? failedDownSync,
    TResult Function()? failedUpSync,
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
    required TResult Function(SyncLoadingState value) loading,
    required TResult Function(SyncInProgressState value) syncInProgress,
    required TResult Function(SyncPendingState value) pendingSync,
    required TResult Function(SyncCompletedState value) completedSync,
    required TResult Function(SyncFailedState value) failedSync,
    required TResult Function(DownSyncFailedState value) failedDownSync,
    required TResult Function(UpSyncFailedState value) failedUpSync,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncLoadingState value)? loading,
    TResult? Function(SyncInProgressState value)? syncInProgress,
    TResult? Function(SyncPendingState value)? pendingSync,
    TResult? Function(SyncCompletedState value)? completedSync,
    TResult? Function(SyncFailedState value)? failedSync,
    TResult? Function(DownSyncFailedState value)? failedDownSync,
    TResult? Function(UpSyncFailedState value)? failedUpSync,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncLoadingState value)? loading,
    TResult Function(SyncInProgressState value)? syncInProgress,
    TResult Function(SyncPendingState value)? pendingSync,
    TResult Function(SyncCompletedState value)? completedSync,
    TResult Function(SyncFailedState value)? failedSync,
    TResult Function(DownSyncFailedState value)? failedDownSync,
    TResult Function(UpSyncFailedState value)? failedUpSync,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SyncLoadingState implements SyncState {
  const factory SyncLoadingState() = _$SyncLoadingState;
}

/// @nodoc
abstract class _$$SyncInProgressStateCopyWith<$Res> {
  factory _$$SyncInProgressStateCopyWith(_$SyncInProgressState value,
          $Res Function(_$SyncInProgressState) then) =
      __$$SyncInProgressStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncInProgressStateCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncInProgressState>
    implements _$$SyncInProgressStateCopyWith<$Res> {
  __$$SyncInProgressStateCopyWithImpl(
      _$SyncInProgressState _value, $Res Function(_$SyncInProgressState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncInProgressState implements SyncInProgressState {
  const _$SyncInProgressState();

  @override
  String toString() {
    return 'SyncState.syncInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncInProgressState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() syncInProgress,
    required TResult Function(int count) pendingSync,
    required TResult Function() completedSync,
    required TResult Function() failedSync,
    required TResult Function() failedDownSync,
    required TResult Function() failedUpSync,
  }) {
    return syncInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? syncInProgress,
    TResult? Function(int count)? pendingSync,
    TResult? Function()? completedSync,
    TResult? Function()? failedSync,
    TResult? Function()? failedDownSync,
    TResult? Function()? failedUpSync,
  }) {
    return syncInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? syncInProgress,
    TResult Function(int count)? pendingSync,
    TResult Function()? completedSync,
    TResult Function()? failedSync,
    TResult Function()? failedDownSync,
    TResult Function()? failedUpSync,
    required TResult orElse(),
  }) {
    if (syncInProgress != null) {
      return syncInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncLoadingState value) loading,
    required TResult Function(SyncInProgressState value) syncInProgress,
    required TResult Function(SyncPendingState value) pendingSync,
    required TResult Function(SyncCompletedState value) completedSync,
    required TResult Function(SyncFailedState value) failedSync,
    required TResult Function(DownSyncFailedState value) failedDownSync,
    required TResult Function(UpSyncFailedState value) failedUpSync,
  }) {
    return syncInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncLoadingState value)? loading,
    TResult? Function(SyncInProgressState value)? syncInProgress,
    TResult? Function(SyncPendingState value)? pendingSync,
    TResult? Function(SyncCompletedState value)? completedSync,
    TResult? Function(SyncFailedState value)? failedSync,
    TResult? Function(DownSyncFailedState value)? failedDownSync,
    TResult? Function(UpSyncFailedState value)? failedUpSync,
  }) {
    return syncInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncLoadingState value)? loading,
    TResult Function(SyncInProgressState value)? syncInProgress,
    TResult Function(SyncPendingState value)? pendingSync,
    TResult Function(SyncCompletedState value)? completedSync,
    TResult Function(SyncFailedState value)? failedSync,
    TResult Function(DownSyncFailedState value)? failedDownSync,
    TResult Function(UpSyncFailedState value)? failedUpSync,
    required TResult orElse(),
  }) {
    if (syncInProgress != null) {
      return syncInProgress(this);
    }
    return orElse();
  }
}

abstract class SyncInProgressState implements SyncState {
  const factory SyncInProgressState() = _$SyncInProgressState;
}

/// @nodoc
abstract class _$$SyncPendingStateCopyWith<$Res> {
  factory _$$SyncPendingStateCopyWith(
          _$SyncPendingState value, $Res Function(_$SyncPendingState) then) =
      __$$SyncPendingStateCopyWithImpl<$Res>;
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$SyncPendingStateCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncPendingState>
    implements _$$SyncPendingStateCopyWith<$Res> {
  __$$SyncPendingStateCopyWithImpl(
      _$SyncPendingState _value, $Res Function(_$SyncPendingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$SyncPendingState(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SyncPendingState implements SyncPendingState {
  const _$SyncPendingState({this.count = 0});

  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'SyncState.pendingSync(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncPendingState &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncPendingStateCopyWith<_$SyncPendingState> get copyWith =>
      __$$SyncPendingStateCopyWithImpl<_$SyncPendingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() syncInProgress,
    required TResult Function(int count) pendingSync,
    required TResult Function() completedSync,
    required TResult Function() failedSync,
    required TResult Function() failedDownSync,
    required TResult Function() failedUpSync,
  }) {
    return pendingSync(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? syncInProgress,
    TResult? Function(int count)? pendingSync,
    TResult? Function()? completedSync,
    TResult? Function()? failedSync,
    TResult? Function()? failedDownSync,
    TResult? Function()? failedUpSync,
  }) {
    return pendingSync?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? syncInProgress,
    TResult Function(int count)? pendingSync,
    TResult Function()? completedSync,
    TResult Function()? failedSync,
    TResult Function()? failedDownSync,
    TResult Function()? failedUpSync,
    required TResult orElse(),
  }) {
    if (pendingSync != null) {
      return pendingSync(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncLoadingState value) loading,
    required TResult Function(SyncInProgressState value) syncInProgress,
    required TResult Function(SyncPendingState value) pendingSync,
    required TResult Function(SyncCompletedState value) completedSync,
    required TResult Function(SyncFailedState value) failedSync,
    required TResult Function(DownSyncFailedState value) failedDownSync,
    required TResult Function(UpSyncFailedState value) failedUpSync,
  }) {
    return pendingSync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncLoadingState value)? loading,
    TResult? Function(SyncInProgressState value)? syncInProgress,
    TResult? Function(SyncPendingState value)? pendingSync,
    TResult? Function(SyncCompletedState value)? completedSync,
    TResult? Function(SyncFailedState value)? failedSync,
    TResult? Function(DownSyncFailedState value)? failedDownSync,
    TResult? Function(UpSyncFailedState value)? failedUpSync,
  }) {
    return pendingSync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncLoadingState value)? loading,
    TResult Function(SyncInProgressState value)? syncInProgress,
    TResult Function(SyncPendingState value)? pendingSync,
    TResult Function(SyncCompletedState value)? completedSync,
    TResult Function(SyncFailedState value)? failedSync,
    TResult Function(DownSyncFailedState value)? failedDownSync,
    TResult Function(UpSyncFailedState value)? failedUpSync,
    required TResult orElse(),
  }) {
    if (pendingSync != null) {
      return pendingSync(this);
    }
    return orElse();
  }
}

abstract class SyncPendingState implements SyncState {
  const factory SyncPendingState({final int count}) = _$SyncPendingState;

  int get count;
  @JsonKey(ignore: true)
  _$$SyncPendingStateCopyWith<_$SyncPendingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncCompletedStateCopyWith<$Res> {
  factory _$$SyncCompletedStateCopyWith(_$SyncCompletedState value,
          $Res Function(_$SyncCompletedState) then) =
      __$$SyncCompletedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncCompletedStateCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncCompletedState>
    implements _$$SyncCompletedStateCopyWith<$Res> {
  __$$SyncCompletedStateCopyWithImpl(
      _$SyncCompletedState _value, $Res Function(_$SyncCompletedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncCompletedState implements SyncCompletedState {
  const _$SyncCompletedState();

  @override
  String toString() {
    return 'SyncState.completedSync()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncCompletedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() syncInProgress,
    required TResult Function(int count) pendingSync,
    required TResult Function() completedSync,
    required TResult Function() failedSync,
    required TResult Function() failedDownSync,
    required TResult Function() failedUpSync,
  }) {
    return completedSync();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? syncInProgress,
    TResult? Function(int count)? pendingSync,
    TResult? Function()? completedSync,
    TResult? Function()? failedSync,
    TResult? Function()? failedDownSync,
    TResult? Function()? failedUpSync,
  }) {
    return completedSync?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? syncInProgress,
    TResult Function(int count)? pendingSync,
    TResult Function()? completedSync,
    TResult Function()? failedSync,
    TResult Function()? failedDownSync,
    TResult Function()? failedUpSync,
    required TResult orElse(),
  }) {
    if (completedSync != null) {
      return completedSync();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncLoadingState value) loading,
    required TResult Function(SyncInProgressState value) syncInProgress,
    required TResult Function(SyncPendingState value) pendingSync,
    required TResult Function(SyncCompletedState value) completedSync,
    required TResult Function(SyncFailedState value) failedSync,
    required TResult Function(DownSyncFailedState value) failedDownSync,
    required TResult Function(UpSyncFailedState value) failedUpSync,
  }) {
    return completedSync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncLoadingState value)? loading,
    TResult? Function(SyncInProgressState value)? syncInProgress,
    TResult? Function(SyncPendingState value)? pendingSync,
    TResult? Function(SyncCompletedState value)? completedSync,
    TResult? Function(SyncFailedState value)? failedSync,
    TResult? Function(DownSyncFailedState value)? failedDownSync,
    TResult? Function(UpSyncFailedState value)? failedUpSync,
  }) {
    return completedSync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncLoadingState value)? loading,
    TResult Function(SyncInProgressState value)? syncInProgress,
    TResult Function(SyncPendingState value)? pendingSync,
    TResult Function(SyncCompletedState value)? completedSync,
    TResult Function(SyncFailedState value)? failedSync,
    TResult Function(DownSyncFailedState value)? failedDownSync,
    TResult Function(UpSyncFailedState value)? failedUpSync,
    required TResult orElse(),
  }) {
    if (completedSync != null) {
      return completedSync(this);
    }
    return orElse();
  }
}

abstract class SyncCompletedState implements SyncState {
  const factory SyncCompletedState() = _$SyncCompletedState;
}

/// @nodoc
abstract class _$$SyncFailedStateCopyWith<$Res> {
  factory _$$SyncFailedStateCopyWith(
          _$SyncFailedState value, $Res Function(_$SyncFailedState) then) =
      __$$SyncFailedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncFailedStateCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncFailedState>
    implements _$$SyncFailedStateCopyWith<$Res> {
  __$$SyncFailedStateCopyWithImpl(
      _$SyncFailedState _value, $Res Function(_$SyncFailedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncFailedState implements SyncFailedState {
  const _$SyncFailedState();

  @override
  String toString() {
    return 'SyncState.failedSync()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncFailedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() syncInProgress,
    required TResult Function(int count) pendingSync,
    required TResult Function() completedSync,
    required TResult Function() failedSync,
    required TResult Function() failedDownSync,
    required TResult Function() failedUpSync,
  }) {
    return failedSync();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? syncInProgress,
    TResult? Function(int count)? pendingSync,
    TResult? Function()? completedSync,
    TResult? Function()? failedSync,
    TResult? Function()? failedDownSync,
    TResult? Function()? failedUpSync,
  }) {
    return failedSync?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? syncInProgress,
    TResult Function(int count)? pendingSync,
    TResult Function()? completedSync,
    TResult Function()? failedSync,
    TResult Function()? failedDownSync,
    TResult Function()? failedUpSync,
    required TResult orElse(),
  }) {
    if (failedSync != null) {
      return failedSync();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncLoadingState value) loading,
    required TResult Function(SyncInProgressState value) syncInProgress,
    required TResult Function(SyncPendingState value) pendingSync,
    required TResult Function(SyncCompletedState value) completedSync,
    required TResult Function(SyncFailedState value) failedSync,
    required TResult Function(DownSyncFailedState value) failedDownSync,
    required TResult Function(UpSyncFailedState value) failedUpSync,
  }) {
    return failedSync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncLoadingState value)? loading,
    TResult? Function(SyncInProgressState value)? syncInProgress,
    TResult? Function(SyncPendingState value)? pendingSync,
    TResult? Function(SyncCompletedState value)? completedSync,
    TResult? Function(SyncFailedState value)? failedSync,
    TResult? Function(DownSyncFailedState value)? failedDownSync,
    TResult? Function(UpSyncFailedState value)? failedUpSync,
  }) {
    return failedSync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncLoadingState value)? loading,
    TResult Function(SyncInProgressState value)? syncInProgress,
    TResult Function(SyncPendingState value)? pendingSync,
    TResult Function(SyncCompletedState value)? completedSync,
    TResult Function(SyncFailedState value)? failedSync,
    TResult Function(DownSyncFailedState value)? failedDownSync,
    TResult Function(UpSyncFailedState value)? failedUpSync,
    required TResult orElse(),
  }) {
    if (failedSync != null) {
      return failedSync(this);
    }
    return orElse();
  }
}

abstract class SyncFailedState implements SyncState {
  const factory SyncFailedState() = _$SyncFailedState;
}

/// @nodoc
abstract class _$$DownSyncFailedStateCopyWith<$Res> {
  factory _$$DownSyncFailedStateCopyWith(_$DownSyncFailedState value,
          $Res Function(_$DownSyncFailedState) then) =
      __$$DownSyncFailedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownSyncFailedStateCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$DownSyncFailedState>
    implements _$$DownSyncFailedStateCopyWith<$Res> {
  __$$DownSyncFailedStateCopyWithImpl(
      _$DownSyncFailedState _value, $Res Function(_$DownSyncFailedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownSyncFailedState implements DownSyncFailedState {
  const _$DownSyncFailedState();

  @override
  String toString() {
    return 'SyncState.failedDownSync()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownSyncFailedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() syncInProgress,
    required TResult Function(int count) pendingSync,
    required TResult Function() completedSync,
    required TResult Function() failedSync,
    required TResult Function() failedDownSync,
    required TResult Function() failedUpSync,
  }) {
    return failedDownSync();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? syncInProgress,
    TResult? Function(int count)? pendingSync,
    TResult? Function()? completedSync,
    TResult? Function()? failedSync,
    TResult? Function()? failedDownSync,
    TResult? Function()? failedUpSync,
  }) {
    return failedDownSync?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? syncInProgress,
    TResult Function(int count)? pendingSync,
    TResult Function()? completedSync,
    TResult Function()? failedSync,
    TResult Function()? failedDownSync,
    TResult Function()? failedUpSync,
    required TResult orElse(),
  }) {
    if (failedDownSync != null) {
      return failedDownSync();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncLoadingState value) loading,
    required TResult Function(SyncInProgressState value) syncInProgress,
    required TResult Function(SyncPendingState value) pendingSync,
    required TResult Function(SyncCompletedState value) completedSync,
    required TResult Function(SyncFailedState value) failedSync,
    required TResult Function(DownSyncFailedState value) failedDownSync,
    required TResult Function(UpSyncFailedState value) failedUpSync,
  }) {
    return failedDownSync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncLoadingState value)? loading,
    TResult? Function(SyncInProgressState value)? syncInProgress,
    TResult? Function(SyncPendingState value)? pendingSync,
    TResult? Function(SyncCompletedState value)? completedSync,
    TResult? Function(SyncFailedState value)? failedSync,
    TResult? Function(DownSyncFailedState value)? failedDownSync,
    TResult? Function(UpSyncFailedState value)? failedUpSync,
  }) {
    return failedDownSync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncLoadingState value)? loading,
    TResult Function(SyncInProgressState value)? syncInProgress,
    TResult Function(SyncPendingState value)? pendingSync,
    TResult Function(SyncCompletedState value)? completedSync,
    TResult Function(SyncFailedState value)? failedSync,
    TResult Function(DownSyncFailedState value)? failedDownSync,
    TResult Function(UpSyncFailedState value)? failedUpSync,
    required TResult orElse(),
  }) {
    if (failedDownSync != null) {
      return failedDownSync(this);
    }
    return orElse();
  }
}

abstract class DownSyncFailedState implements SyncState {
  const factory DownSyncFailedState() = _$DownSyncFailedState;
}

/// @nodoc
abstract class _$$UpSyncFailedStateCopyWith<$Res> {
  factory _$$UpSyncFailedStateCopyWith(
          _$UpSyncFailedState value, $Res Function(_$UpSyncFailedState) then) =
      __$$UpSyncFailedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpSyncFailedStateCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$UpSyncFailedState>
    implements _$$UpSyncFailedStateCopyWith<$Res> {
  __$$UpSyncFailedStateCopyWithImpl(
      _$UpSyncFailedState _value, $Res Function(_$UpSyncFailedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpSyncFailedState implements UpSyncFailedState {
  const _$UpSyncFailedState();

  @override
  String toString() {
    return 'SyncState.failedUpSync()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpSyncFailedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() syncInProgress,
    required TResult Function(int count) pendingSync,
    required TResult Function() completedSync,
    required TResult Function() failedSync,
    required TResult Function() failedDownSync,
    required TResult Function() failedUpSync,
  }) {
    return failedUpSync();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? syncInProgress,
    TResult? Function(int count)? pendingSync,
    TResult? Function()? completedSync,
    TResult? Function()? failedSync,
    TResult? Function()? failedDownSync,
    TResult? Function()? failedUpSync,
  }) {
    return failedUpSync?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? syncInProgress,
    TResult Function(int count)? pendingSync,
    TResult Function()? completedSync,
    TResult Function()? failedSync,
    TResult Function()? failedDownSync,
    TResult Function()? failedUpSync,
    required TResult orElse(),
  }) {
    if (failedUpSync != null) {
      return failedUpSync();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncLoadingState value) loading,
    required TResult Function(SyncInProgressState value) syncInProgress,
    required TResult Function(SyncPendingState value) pendingSync,
    required TResult Function(SyncCompletedState value) completedSync,
    required TResult Function(SyncFailedState value) failedSync,
    required TResult Function(DownSyncFailedState value) failedDownSync,
    required TResult Function(UpSyncFailedState value) failedUpSync,
  }) {
    return failedUpSync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncLoadingState value)? loading,
    TResult? Function(SyncInProgressState value)? syncInProgress,
    TResult? Function(SyncPendingState value)? pendingSync,
    TResult? Function(SyncCompletedState value)? completedSync,
    TResult? Function(SyncFailedState value)? failedSync,
    TResult? Function(DownSyncFailedState value)? failedDownSync,
    TResult? Function(UpSyncFailedState value)? failedUpSync,
  }) {
    return failedUpSync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncLoadingState value)? loading,
    TResult Function(SyncInProgressState value)? syncInProgress,
    TResult Function(SyncPendingState value)? pendingSync,
    TResult Function(SyncCompletedState value)? completedSync,
    TResult Function(SyncFailedState value)? failedSync,
    TResult Function(DownSyncFailedState value)? failedDownSync,
    TResult Function(UpSyncFailedState value)? failedUpSync,
    required TResult orElse(),
  }) {
    if (failedUpSync != null) {
      return failedUpSync(this);
    }
    return orElse();
  }
}

abstract class UpSyncFailedState implements SyncState {
  const factory UpSyncFailedState() = _$UpSyncFailedState;
}

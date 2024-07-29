// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$SyncRefreshEventImplCopyWith<$Res> {
  factory _$$SyncRefreshEventImplCopyWith(_$SyncRefreshEventImpl value,
          $Res Function(_$SyncRefreshEventImpl) then) =
      __$$SyncRefreshEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String createdBy, int? count});
}

/// @nodoc
class __$$SyncRefreshEventImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$SyncRefreshEventImpl>
    implements _$$SyncRefreshEventImplCopyWith<$Res> {
  __$$SyncRefreshEventImplCopyWithImpl(_$SyncRefreshEventImpl _value,
      $Res Function(_$SyncRefreshEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = null,
    Object? count = freezed,
  }) {
    return _then(_$SyncRefreshEventImpl(
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

class _$SyncRefreshEventImpl implements SyncRefreshEvent {
  const _$SyncRefreshEventImpl(this.createdBy, [this.count]);

  @override
  final String createdBy;
  @override
  final int? count;

  @override
  String toString() {
    return 'SyncEvent.refresh(createdBy: $createdBy, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncRefreshEventImpl &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdBy, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncRefreshEventImplCopyWith<_$SyncRefreshEventImpl> get copyWith =>
      __$$SyncRefreshEventImplCopyWithImpl<_$SyncRefreshEventImpl>(
          this, _$identity);

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
      _$SyncRefreshEventImpl;

  String get createdBy;
  int? get count;
  @JsonKey(ignore: true)
  _$$SyncRefreshEventImplCopyWith<_$SyncRefreshEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncSyncUpEventImplCopyWith<$Res> {
  factory _$$SyncSyncUpEventImplCopyWith(_$SyncSyncUpEventImpl value,
          $Res Function(_$SyncSyncUpEventImpl) then) =
      __$$SyncSyncUpEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String userId,
      List<LocalRepository<EntityModel, EntitySearchModel>> localRepositories,
      List<RemoteRepository<EntityModel, EntitySearchModel>>
          remoteRepositories});
}

/// @nodoc
class __$$SyncSyncUpEventImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$SyncSyncUpEventImpl>
    implements _$$SyncSyncUpEventImplCopyWith<$Res> {
  __$$SyncSyncUpEventImplCopyWithImpl(
      _$SyncSyncUpEventImpl _value, $Res Function(_$SyncSyncUpEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? localRepositories = null,
    Object? remoteRepositories = null,
  }) {
    return _then(_$SyncSyncUpEventImpl(
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

class _$SyncSyncUpEventImpl implements SyncSyncUpEvent {
  const _$SyncSyncUpEventImpl(
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
    if (_localRepositories is EqualUnmodifiableListView)
      return _localRepositories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_localRepositories);
  }

  final List<RemoteRepository<EntityModel, EntitySearchModel>>
      _remoteRepositories;
  @override
  List<RemoteRepository<EntityModel, EntitySearchModel>>
      get remoteRepositories {
    if (_remoteRepositories is EqualUnmodifiableListView)
      return _remoteRepositories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_remoteRepositories);
  }

  @override
  String toString() {
    return 'SyncEvent.syncUp(userId: $userId, localRepositories: $localRepositories, remoteRepositories: $remoteRepositories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncSyncUpEventImpl &&
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
  _$$SyncSyncUpEventImplCopyWith<_$SyncSyncUpEventImpl> get copyWith =>
      __$$SyncSyncUpEventImplCopyWithImpl<_$SyncSyncUpEventImpl>(
          this, _$identity);

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
          remoteRepositories}) = _$SyncSyncUpEventImpl;

  String get userId;
  List<LocalRepository<EntityModel, EntitySearchModel>> get localRepositories;
  List<RemoteRepository<EntityModel, EntitySearchModel>> get remoteRepositories;
  @JsonKey(ignore: true)
  _$$SyncSyncUpEventImplCopyWith<_$SyncSyncUpEventImpl> get copyWith =>
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
abstract class _$$SyncLoadingStateImplCopyWith<$Res> {
  factory _$$SyncLoadingStateImplCopyWith(_$SyncLoadingStateImpl value,
          $Res Function(_$SyncLoadingStateImpl) then) =
      __$$SyncLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncLoadingStateImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncLoadingStateImpl>
    implements _$$SyncLoadingStateImplCopyWith<$Res> {
  __$$SyncLoadingStateImplCopyWithImpl(_$SyncLoadingStateImpl _value,
      $Res Function(_$SyncLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncLoadingStateImpl implements SyncLoadingState {
  const _$SyncLoadingStateImpl();

  @override
  String toString() {
    return 'SyncState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncLoadingStateImpl);
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
  const factory SyncLoadingState() = _$SyncLoadingStateImpl;
}

/// @nodoc
abstract class _$$SyncInProgressStateImplCopyWith<$Res> {
  factory _$$SyncInProgressStateImplCopyWith(_$SyncInProgressStateImpl value,
          $Res Function(_$SyncInProgressStateImpl) then) =
      __$$SyncInProgressStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncInProgressStateImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncInProgressStateImpl>
    implements _$$SyncInProgressStateImplCopyWith<$Res> {
  __$$SyncInProgressStateImplCopyWithImpl(_$SyncInProgressStateImpl _value,
      $Res Function(_$SyncInProgressStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncInProgressStateImpl implements SyncInProgressState {
  const _$SyncInProgressStateImpl();

  @override
  String toString() {
    return 'SyncState.syncInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncInProgressStateImpl);
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
  const factory SyncInProgressState() = _$SyncInProgressStateImpl;
}

/// @nodoc
abstract class _$$SyncPendingStateImplCopyWith<$Res> {
  factory _$$SyncPendingStateImplCopyWith(_$SyncPendingStateImpl value,
          $Res Function(_$SyncPendingStateImpl) then) =
      __$$SyncPendingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$SyncPendingStateImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncPendingStateImpl>
    implements _$$SyncPendingStateImplCopyWith<$Res> {
  __$$SyncPendingStateImplCopyWithImpl(_$SyncPendingStateImpl _value,
      $Res Function(_$SyncPendingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$SyncPendingStateImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SyncPendingStateImpl implements SyncPendingState {
  const _$SyncPendingStateImpl({this.count = 0});

  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'SyncState.pendingSync(count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncPendingStateImpl &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncPendingStateImplCopyWith<_$SyncPendingStateImpl> get copyWith =>
      __$$SyncPendingStateImplCopyWithImpl<_$SyncPendingStateImpl>(
          this, _$identity);

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
  const factory SyncPendingState({final int count}) = _$SyncPendingStateImpl;

  int get count;
  @JsonKey(ignore: true)
  _$$SyncPendingStateImplCopyWith<_$SyncPendingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncCompletedStateImplCopyWith<$Res> {
  factory _$$SyncCompletedStateImplCopyWith(_$SyncCompletedStateImpl value,
          $Res Function(_$SyncCompletedStateImpl) then) =
      __$$SyncCompletedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncCompletedStateImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncCompletedStateImpl>
    implements _$$SyncCompletedStateImplCopyWith<$Res> {
  __$$SyncCompletedStateImplCopyWithImpl(_$SyncCompletedStateImpl _value,
      $Res Function(_$SyncCompletedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncCompletedStateImpl implements SyncCompletedState {
  const _$SyncCompletedStateImpl();

  @override
  String toString() {
    return 'SyncState.completedSync()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncCompletedStateImpl);
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
  const factory SyncCompletedState() = _$SyncCompletedStateImpl;
}

/// @nodoc
abstract class _$$SyncFailedStateImplCopyWith<$Res> {
  factory _$$SyncFailedStateImplCopyWith(_$SyncFailedStateImpl value,
          $Res Function(_$SyncFailedStateImpl) then) =
      __$$SyncFailedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncFailedStateImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncFailedStateImpl>
    implements _$$SyncFailedStateImplCopyWith<$Res> {
  __$$SyncFailedStateImplCopyWithImpl(
      _$SyncFailedStateImpl _value, $Res Function(_$SyncFailedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncFailedStateImpl implements SyncFailedState {
  const _$SyncFailedStateImpl();

  @override
  String toString() {
    return 'SyncState.failedSync()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncFailedStateImpl);
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
  const factory SyncFailedState() = _$SyncFailedStateImpl;
}

/// @nodoc
abstract class _$$DownSyncFailedStateImplCopyWith<$Res> {
  factory _$$DownSyncFailedStateImplCopyWith(_$DownSyncFailedStateImpl value,
          $Res Function(_$DownSyncFailedStateImpl) then) =
      __$$DownSyncFailedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownSyncFailedStateImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$DownSyncFailedStateImpl>
    implements _$$DownSyncFailedStateImplCopyWith<$Res> {
  __$$DownSyncFailedStateImplCopyWithImpl(_$DownSyncFailedStateImpl _value,
      $Res Function(_$DownSyncFailedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownSyncFailedStateImpl implements DownSyncFailedState {
  const _$DownSyncFailedStateImpl();

  @override
  String toString() {
    return 'SyncState.failedDownSync()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownSyncFailedStateImpl);
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
  const factory DownSyncFailedState() = _$DownSyncFailedStateImpl;
}

/// @nodoc
abstract class _$$UpSyncFailedStateImplCopyWith<$Res> {
  factory _$$UpSyncFailedStateImplCopyWith(_$UpSyncFailedStateImpl value,
          $Res Function(_$UpSyncFailedStateImpl) then) =
      __$$UpSyncFailedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpSyncFailedStateImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$UpSyncFailedStateImpl>
    implements _$$UpSyncFailedStateImplCopyWith<$Res> {
  __$$UpSyncFailedStateImplCopyWithImpl(_$UpSyncFailedStateImpl _value,
      $Res Function(_$UpSyncFailedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpSyncFailedStateImpl implements UpSyncFailedState {
  const _$UpSyncFailedStateImpl();

  @override
  String toString() {
    return 'SyncState.failedUpSync()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpSyncFailedStateImpl);
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
  const factory UpSyncFailedState() = _$UpSyncFailedStateImpl;
}

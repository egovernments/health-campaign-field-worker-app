// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unique_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UniqueIdEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchIdCount,
    required TResult Function(bool? reFetch) fetchUniqueIdsFromServer,
    required TResult Function() fetchAUniqueId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchIdCount,
    TResult? Function(bool? reFetch)? fetchUniqueIdsFromServer,
    TResult? Function()? fetchAUniqueId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchIdCount,
    TResult Function(bool? reFetch)? fetchUniqueIdsFromServer,
    TResult Function()? fetchAUniqueId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UniqueIdCountEvent value) fetchIdCount,
    required TResult Function(FetchUniqueIdsEvent value)
        fetchUniqueIdsFromServer,
    required TResult Function(FetchAUniqueIdEvent value) fetchAUniqueId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UniqueIdCountEvent value)? fetchIdCount,
    TResult? Function(FetchUniqueIdsEvent value)? fetchUniqueIdsFromServer,
    TResult? Function(FetchAUniqueIdEvent value)? fetchAUniqueId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UniqueIdCountEvent value)? fetchIdCount,
    TResult Function(FetchUniqueIdsEvent value)? fetchUniqueIdsFromServer,
    TResult Function(FetchAUniqueIdEvent value)? fetchAUniqueId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UniqueIdEventCopyWith<$Res> {
  factory $UniqueIdEventCopyWith(
          UniqueIdEvent value, $Res Function(UniqueIdEvent) then) =
      _$UniqueIdEventCopyWithImpl<$Res, UniqueIdEvent>;
}

/// @nodoc
class _$UniqueIdEventCopyWithImpl<$Res, $Val extends UniqueIdEvent>
    implements $UniqueIdEventCopyWith<$Res> {
  _$UniqueIdEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UniqueIdCountEventImplCopyWith<$Res> {
  factory _$$UniqueIdCountEventImplCopyWith(_$UniqueIdCountEventImpl value,
          $Res Function(_$UniqueIdCountEventImpl) then) =
      __$$UniqueIdCountEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UniqueIdCountEventImplCopyWithImpl<$Res>
    extends _$UniqueIdEventCopyWithImpl<$Res, _$UniqueIdCountEventImpl>
    implements _$$UniqueIdCountEventImplCopyWith<$Res> {
  __$$UniqueIdCountEventImplCopyWithImpl(_$UniqueIdCountEventImpl _value,
      $Res Function(_$UniqueIdCountEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UniqueIdCountEventImpl implements UniqueIdCountEvent {
  const _$UniqueIdCountEventImpl();

  @override
  String toString() {
    return 'UniqueIdEvent.fetchIdCount()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UniqueIdCountEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchIdCount,
    required TResult Function(bool? reFetch) fetchUniqueIdsFromServer,
    required TResult Function() fetchAUniqueId,
  }) {
    return fetchIdCount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchIdCount,
    TResult? Function(bool? reFetch)? fetchUniqueIdsFromServer,
    TResult? Function()? fetchAUniqueId,
  }) {
    return fetchIdCount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchIdCount,
    TResult Function(bool? reFetch)? fetchUniqueIdsFromServer,
    TResult Function()? fetchAUniqueId,
    required TResult orElse(),
  }) {
    if (fetchIdCount != null) {
      return fetchIdCount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UniqueIdCountEvent value) fetchIdCount,
    required TResult Function(FetchUniqueIdsEvent value)
        fetchUniqueIdsFromServer,
    required TResult Function(FetchAUniqueIdEvent value) fetchAUniqueId,
  }) {
    return fetchIdCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UniqueIdCountEvent value)? fetchIdCount,
    TResult? Function(FetchUniqueIdsEvent value)? fetchUniqueIdsFromServer,
    TResult? Function(FetchAUniqueIdEvent value)? fetchAUniqueId,
  }) {
    return fetchIdCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UniqueIdCountEvent value)? fetchIdCount,
    TResult Function(FetchUniqueIdsEvent value)? fetchUniqueIdsFromServer,
    TResult Function(FetchAUniqueIdEvent value)? fetchAUniqueId,
    required TResult orElse(),
  }) {
    if (fetchIdCount != null) {
      return fetchIdCount(this);
    }
    return orElse();
  }
}

abstract class UniqueIdCountEvent implements UniqueIdEvent {
  const factory UniqueIdCountEvent() = _$UniqueIdCountEventImpl;
}

/// @nodoc
abstract class _$$FetchUniqueIdsEventImplCopyWith<$Res> {
  factory _$$FetchUniqueIdsEventImplCopyWith(_$FetchUniqueIdsEventImpl value,
          $Res Function(_$FetchUniqueIdsEventImpl) then) =
      __$$FetchUniqueIdsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool? reFetch});
}

/// @nodoc
class __$$FetchUniqueIdsEventImplCopyWithImpl<$Res>
    extends _$UniqueIdEventCopyWithImpl<$Res, _$FetchUniqueIdsEventImpl>
    implements _$$FetchUniqueIdsEventImplCopyWith<$Res> {
  __$$FetchUniqueIdsEventImplCopyWithImpl(_$FetchUniqueIdsEventImpl _value,
      $Res Function(_$FetchUniqueIdsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reFetch = freezed,
  }) {
    return _then(_$FetchUniqueIdsEventImpl(
      reFetch: freezed == reFetch
          ? _value.reFetch
          : reFetch // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$FetchUniqueIdsEventImpl implements FetchUniqueIdsEvent {
  const _$FetchUniqueIdsEventImpl({this.reFetch});

  @override
  final bool? reFetch;

  @override
  String toString() {
    return 'UniqueIdEvent.fetchUniqueIdsFromServer(reFetch: $reFetch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchUniqueIdsEventImpl &&
            (identical(other.reFetch, reFetch) || other.reFetch == reFetch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reFetch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchUniqueIdsEventImplCopyWith<_$FetchUniqueIdsEventImpl> get copyWith =>
      __$$FetchUniqueIdsEventImplCopyWithImpl<_$FetchUniqueIdsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchIdCount,
    required TResult Function(bool? reFetch) fetchUniqueIdsFromServer,
    required TResult Function() fetchAUniqueId,
  }) {
    return fetchUniqueIdsFromServer(reFetch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchIdCount,
    TResult? Function(bool? reFetch)? fetchUniqueIdsFromServer,
    TResult? Function()? fetchAUniqueId,
  }) {
    return fetchUniqueIdsFromServer?.call(reFetch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchIdCount,
    TResult Function(bool? reFetch)? fetchUniqueIdsFromServer,
    TResult Function()? fetchAUniqueId,
    required TResult orElse(),
  }) {
    if (fetchUniqueIdsFromServer != null) {
      return fetchUniqueIdsFromServer(reFetch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UniqueIdCountEvent value) fetchIdCount,
    required TResult Function(FetchUniqueIdsEvent value)
        fetchUniqueIdsFromServer,
    required TResult Function(FetchAUniqueIdEvent value) fetchAUniqueId,
  }) {
    return fetchUniqueIdsFromServer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UniqueIdCountEvent value)? fetchIdCount,
    TResult? Function(FetchUniqueIdsEvent value)? fetchUniqueIdsFromServer,
    TResult? Function(FetchAUniqueIdEvent value)? fetchAUniqueId,
  }) {
    return fetchUniqueIdsFromServer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UniqueIdCountEvent value)? fetchIdCount,
    TResult Function(FetchUniqueIdsEvent value)? fetchUniqueIdsFromServer,
    TResult Function(FetchAUniqueIdEvent value)? fetchAUniqueId,
    required TResult orElse(),
  }) {
    if (fetchUniqueIdsFromServer != null) {
      return fetchUniqueIdsFromServer(this);
    }
    return orElse();
  }
}

abstract class FetchUniqueIdsEvent implements UniqueIdEvent {
  const factory FetchUniqueIdsEvent({final bool? reFetch}) =
      _$FetchUniqueIdsEventImpl;

  bool? get reFetch;
  @JsonKey(ignore: true)
  _$$FetchUniqueIdsEventImplCopyWith<_$FetchUniqueIdsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAUniqueIdEventImplCopyWith<$Res> {
  factory _$$FetchAUniqueIdEventImplCopyWith(_$FetchAUniqueIdEventImpl value,
          $Res Function(_$FetchAUniqueIdEventImpl) then) =
      __$$FetchAUniqueIdEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAUniqueIdEventImplCopyWithImpl<$Res>
    extends _$UniqueIdEventCopyWithImpl<$Res, _$FetchAUniqueIdEventImpl>
    implements _$$FetchAUniqueIdEventImplCopyWith<$Res> {
  __$$FetchAUniqueIdEventImplCopyWithImpl(_$FetchAUniqueIdEventImpl _value,
      $Res Function(_$FetchAUniqueIdEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchAUniqueIdEventImpl implements FetchAUniqueIdEvent {
  const _$FetchAUniqueIdEventImpl();

  @override
  String toString() {
    return 'UniqueIdEvent.fetchAUniqueId()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAUniqueIdEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchIdCount,
    required TResult Function(bool? reFetch) fetchUniqueIdsFromServer,
    required TResult Function() fetchAUniqueId,
  }) {
    return fetchAUniqueId();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchIdCount,
    TResult? Function(bool? reFetch)? fetchUniqueIdsFromServer,
    TResult? Function()? fetchAUniqueId,
  }) {
    return fetchAUniqueId?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchIdCount,
    TResult Function(bool? reFetch)? fetchUniqueIdsFromServer,
    TResult Function()? fetchAUniqueId,
    required TResult orElse(),
  }) {
    if (fetchAUniqueId != null) {
      return fetchAUniqueId();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UniqueIdCountEvent value) fetchIdCount,
    required TResult Function(FetchUniqueIdsEvent value)
        fetchUniqueIdsFromServer,
    required TResult Function(FetchAUniqueIdEvent value) fetchAUniqueId,
  }) {
    return fetchAUniqueId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UniqueIdCountEvent value)? fetchIdCount,
    TResult? Function(FetchUniqueIdsEvent value)? fetchUniqueIdsFromServer,
    TResult? Function(FetchAUniqueIdEvent value)? fetchAUniqueId,
  }) {
    return fetchAUniqueId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UniqueIdCountEvent value)? fetchIdCount,
    TResult Function(FetchUniqueIdsEvent value)? fetchUniqueIdsFromServer,
    TResult Function(FetchAUniqueIdEvent value)? fetchAUniqueId,
    required TResult orElse(),
  }) {
    if (fetchAUniqueId != null) {
      return fetchAUniqueId(this);
    }
    return orElse();
  }
}

abstract class FetchAUniqueIdEvent implements UniqueIdEvent {
  const factory FetchAUniqueIdEvent() = _$FetchAUniqueIdEventImpl;
}

/// @nodoc
mixin _$UniqueIdState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int progress, int totalCount) fetching,
    required TResult Function(int count, int totalCount) idCount,
    required TResult Function(List<UniqueIdPoolModel> ids) ids,
    required TResult Function(String? error) failed,
    required TResult Function(UniqueIdPoolModel aUniqueId) aUniqueId,
    required TResult Function() noInternet,
    required TResult Function(String message) limitExceeded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int progress, int totalCount)? fetching,
    TResult? Function(int count, int totalCount)? idCount,
    TResult? Function(List<UniqueIdPoolModel> ids)? ids,
    TResult? Function(String? error)? failed,
    TResult? Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult? Function()? noInternet,
    TResult? Function(String message)? limitExceeded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int progress, int totalCount)? fetching,
    TResult Function(int count, int totalCount)? idCount,
    TResult Function(List<UniqueIdPoolModel> ids)? ids,
    TResult Function(String? error)? failed,
    TResult Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult Function()? noInternet,
    TResult Function(String message)? limitExceeded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(FetchingState value) fetching,
    required TResult Function(FetchedIdCountState value) idCount,
    required TResult Function(FetchedUniqueIdsState value) ids,
    required TResult Function(FailedState value) failed,
    required TResult Function(FetchedUniqueIdState value) aUniqueId,
    required TResult Function(NoInternetState value) noInternet,
    required TResult Function(LimitExceeded value) limitExceeded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState value)? loading,
    TResult? Function(FetchingState value)? fetching,
    TResult? Function(FetchedIdCountState value)? idCount,
    TResult? Function(FetchedUniqueIdsState value)? ids,
    TResult? Function(FailedState value)? failed,
    TResult? Function(FetchedUniqueIdState value)? aUniqueId,
    TResult? Function(NoInternetState value)? noInternet,
    TResult? Function(LimitExceeded value)? limitExceeded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(FetchingState value)? fetching,
    TResult Function(FetchedIdCountState value)? idCount,
    TResult Function(FetchedUniqueIdsState value)? ids,
    TResult Function(FailedState value)? failed,
    TResult Function(FetchedUniqueIdState value)? aUniqueId,
    TResult Function(NoInternetState value)? noInternet,
    TResult Function(LimitExceeded value)? limitExceeded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UniqueIdStateCopyWith<$Res> {
  factory $UniqueIdStateCopyWith(
          UniqueIdState value, $Res Function(UniqueIdState) then) =
      _$UniqueIdStateCopyWithImpl<$Res, UniqueIdState>;
}

/// @nodoc
class _$UniqueIdStateCopyWithImpl<$Res, $Val extends UniqueIdState>
    implements $UniqueIdStateCopyWith<$Res> {
  _$UniqueIdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$UniqueIdStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingStateImpl implements LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'UniqueIdState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int progress, int totalCount) fetching,
    required TResult Function(int count, int totalCount) idCount,
    required TResult Function(List<UniqueIdPoolModel> ids) ids,
    required TResult Function(String? error) failed,
    required TResult Function(UniqueIdPoolModel aUniqueId) aUniqueId,
    required TResult Function() noInternet,
    required TResult Function(String message) limitExceeded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int progress, int totalCount)? fetching,
    TResult? Function(int count, int totalCount)? idCount,
    TResult? Function(List<UniqueIdPoolModel> ids)? ids,
    TResult? Function(String? error)? failed,
    TResult? Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult? Function()? noInternet,
    TResult? Function(String message)? limitExceeded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int progress, int totalCount)? fetching,
    TResult Function(int count, int totalCount)? idCount,
    TResult Function(List<UniqueIdPoolModel> ids)? ids,
    TResult Function(String? error)? failed,
    TResult Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult Function()? noInternet,
    TResult Function(String message)? limitExceeded,
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
    required TResult Function(LoadingState value) loading,
    required TResult Function(FetchingState value) fetching,
    required TResult Function(FetchedIdCountState value) idCount,
    required TResult Function(FetchedUniqueIdsState value) ids,
    required TResult Function(FailedState value) failed,
    required TResult Function(FetchedUniqueIdState value) aUniqueId,
    required TResult Function(NoInternetState value) noInternet,
    required TResult Function(LimitExceeded value) limitExceeded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState value)? loading,
    TResult? Function(FetchingState value)? fetching,
    TResult? Function(FetchedIdCountState value)? idCount,
    TResult? Function(FetchedUniqueIdsState value)? ids,
    TResult? Function(FailedState value)? failed,
    TResult? Function(FetchedUniqueIdState value)? aUniqueId,
    TResult? Function(NoInternetState value)? noInternet,
    TResult? Function(LimitExceeded value)? limitExceeded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(FetchingState value)? fetching,
    TResult Function(FetchedIdCountState value)? idCount,
    TResult Function(FetchedUniqueIdsState value)? ids,
    TResult Function(FailedState value)? failed,
    TResult Function(FetchedUniqueIdState value)? aUniqueId,
    TResult Function(NoInternetState value)? noInternet,
    TResult Function(LimitExceeded value)? limitExceeded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements UniqueIdState {
  const factory LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$FetchingStateImplCopyWith<$Res> {
  factory _$$FetchingStateImplCopyWith(
          _$FetchingStateImpl value, $Res Function(_$FetchingStateImpl) then) =
      __$$FetchingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int progress, int totalCount});
}

/// @nodoc
class __$$FetchingStateImplCopyWithImpl<$Res>
    extends _$UniqueIdStateCopyWithImpl<$Res, _$FetchingStateImpl>
    implements _$$FetchingStateImplCopyWith<$Res> {
  __$$FetchingStateImplCopyWithImpl(
      _$FetchingStateImpl _value, $Res Function(_$FetchingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? totalCount = null,
  }) {
    return _then(_$FetchingStateImpl(
      null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchingStateImpl implements FetchingState {
  const _$FetchingStateImpl(this.progress, this.totalCount);

  @override
  final int progress;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'UniqueIdState.fetching(progress: $progress, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchingStateImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress, totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchingStateImplCopyWith<_$FetchingStateImpl> get copyWith =>
      __$$FetchingStateImplCopyWithImpl<_$FetchingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int progress, int totalCount) fetching,
    required TResult Function(int count, int totalCount) idCount,
    required TResult Function(List<UniqueIdPoolModel> ids) ids,
    required TResult Function(String? error) failed,
    required TResult Function(UniqueIdPoolModel aUniqueId) aUniqueId,
    required TResult Function() noInternet,
    required TResult Function(String message) limitExceeded,
  }) {
    return fetching(progress, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int progress, int totalCount)? fetching,
    TResult? Function(int count, int totalCount)? idCount,
    TResult? Function(List<UniqueIdPoolModel> ids)? ids,
    TResult? Function(String? error)? failed,
    TResult? Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult? Function()? noInternet,
    TResult? Function(String message)? limitExceeded,
  }) {
    return fetching?.call(progress, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int progress, int totalCount)? fetching,
    TResult Function(int count, int totalCount)? idCount,
    TResult Function(List<UniqueIdPoolModel> ids)? ids,
    TResult Function(String? error)? failed,
    TResult Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult Function()? noInternet,
    TResult Function(String message)? limitExceeded,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(progress, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(FetchingState value) fetching,
    required TResult Function(FetchedIdCountState value) idCount,
    required TResult Function(FetchedUniqueIdsState value) ids,
    required TResult Function(FailedState value) failed,
    required TResult Function(FetchedUniqueIdState value) aUniqueId,
    required TResult Function(NoInternetState value) noInternet,
    required TResult Function(LimitExceeded value) limitExceeded,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState value)? loading,
    TResult? Function(FetchingState value)? fetching,
    TResult? Function(FetchedIdCountState value)? idCount,
    TResult? Function(FetchedUniqueIdsState value)? ids,
    TResult? Function(FailedState value)? failed,
    TResult? Function(FetchedUniqueIdState value)? aUniqueId,
    TResult? Function(NoInternetState value)? noInternet,
    TResult? Function(LimitExceeded value)? limitExceeded,
  }) {
    return fetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(FetchingState value)? fetching,
    TResult Function(FetchedIdCountState value)? idCount,
    TResult Function(FetchedUniqueIdsState value)? ids,
    TResult Function(FailedState value)? failed,
    TResult Function(FetchedUniqueIdState value)? aUniqueId,
    TResult Function(NoInternetState value)? noInternet,
    TResult Function(LimitExceeded value)? limitExceeded,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class FetchingState implements UniqueIdState {
  const factory FetchingState(final int progress, final int totalCount) =
      _$FetchingStateImpl;

  int get progress;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$FetchingStateImplCopyWith<_$FetchingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchedIdCountStateImplCopyWith<$Res> {
  factory _$$FetchedIdCountStateImplCopyWith(_$FetchedIdCountStateImpl value,
          $Res Function(_$FetchedIdCountStateImpl) then) =
      __$$FetchedIdCountStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int count, int totalCount});
}

/// @nodoc
class __$$FetchedIdCountStateImplCopyWithImpl<$Res>
    extends _$UniqueIdStateCopyWithImpl<$Res, _$FetchedIdCountStateImpl>
    implements _$$FetchedIdCountStateImplCopyWith<$Res> {
  __$$FetchedIdCountStateImplCopyWithImpl(_$FetchedIdCountStateImpl _value,
      $Res Function(_$FetchedIdCountStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? totalCount = null,
  }) {
    return _then(_$FetchedIdCountStateImpl(
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchedIdCountStateImpl implements FetchedIdCountState {
  const _$FetchedIdCountStateImpl(this.count, this.totalCount);

  @override
  final int count;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'UniqueIdState.idCount(count: $count, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchedIdCountStateImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count, totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchedIdCountStateImplCopyWith<_$FetchedIdCountStateImpl> get copyWith =>
      __$$FetchedIdCountStateImplCopyWithImpl<_$FetchedIdCountStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int progress, int totalCount) fetching,
    required TResult Function(int count, int totalCount) idCount,
    required TResult Function(List<UniqueIdPoolModel> ids) ids,
    required TResult Function(String? error) failed,
    required TResult Function(UniqueIdPoolModel aUniqueId) aUniqueId,
    required TResult Function() noInternet,
    required TResult Function(String message) limitExceeded,
  }) {
    return idCount(count, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int progress, int totalCount)? fetching,
    TResult? Function(int count, int totalCount)? idCount,
    TResult? Function(List<UniqueIdPoolModel> ids)? ids,
    TResult? Function(String? error)? failed,
    TResult? Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult? Function()? noInternet,
    TResult? Function(String message)? limitExceeded,
  }) {
    return idCount?.call(count, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int progress, int totalCount)? fetching,
    TResult Function(int count, int totalCount)? idCount,
    TResult Function(List<UniqueIdPoolModel> ids)? ids,
    TResult Function(String? error)? failed,
    TResult Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult Function()? noInternet,
    TResult Function(String message)? limitExceeded,
    required TResult orElse(),
  }) {
    if (idCount != null) {
      return idCount(count, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(FetchingState value) fetching,
    required TResult Function(FetchedIdCountState value) idCount,
    required TResult Function(FetchedUniqueIdsState value) ids,
    required TResult Function(FailedState value) failed,
    required TResult Function(FetchedUniqueIdState value) aUniqueId,
    required TResult Function(NoInternetState value) noInternet,
    required TResult Function(LimitExceeded value) limitExceeded,
  }) {
    return idCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState value)? loading,
    TResult? Function(FetchingState value)? fetching,
    TResult? Function(FetchedIdCountState value)? idCount,
    TResult? Function(FetchedUniqueIdsState value)? ids,
    TResult? Function(FailedState value)? failed,
    TResult? Function(FetchedUniqueIdState value)? aUniqueId,
    TResult? Function(NoInternetState value)? noInternet,
    TResult? Function(LimitExceeded value)? limitExceeded,
  }) {
    return idCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(FetchingState value)? fetching,
    TResult Function(FetchedIdCountState value)? idCount,
    TResult Function(FetchedUniqueIdsState value)? ids,
    TResult Function(FailedState value)? failed,
    TResult Function(FetchedUniqueIdState value)? aUniqueId,
    TResult Function(NoInternetState value)? noInternet,
    TResult Function(LimitExceeded value)? limitExceeded,
    required TResult orElse(),
  }) {
    if (idCount != null) {
      return idCount(this);
    }
    return orElse();
  }
}

abstract class FetchedIdCountState implements UniqueIdState {
  const factory FetchedIdCountState(final int count, final int totalCount) =
      _$FetchedIdCountStateImpl;

  int get count;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$FetchedIdCountStateImplCopyWith<_$FetchedIdCountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchedUniqueIdsStateImplCopyWith<$Res> {
  factory _$$FetchedUniqueIdsStateImplCopyWith(
          _$FetchedUniqueIdsStateImpl value,
          $Res Function(_$FetchedUniqueIdsStateImpl) then) =
      __$$FetchedUniqueIdsStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UniqueIdPoolModel> ids});
}

/// @nodoc
class __$$FetchedUniqueIdsStateImplCopyWithImpl<$Res>
    extends _$UniqueIdStateCopyWithImpl<$Res, _$FetchedUniqueIdsStateImpl>
    implements _$$FetchedUniqueIdsStateImplCopyWith<$Res> {
  __$$FetchedUniqueIdsStateImplCopyWithImpl(_$FetchedUniqueIdsStateImpl _value,
      $Res Function(_$FetchedUniqueIdsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
  }) {
    return _then(_$FetchedUniqueIdsStateImpl(
      null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<UniqueIdPoolModel>,
    ));
  }
}

/// @nodoc

class _$FetchedUniqueIdsStateImpl implements FetchedUniqueIdsState {
  const _$FetchedUniqueIdsStateImpl(final List<UniqueIdPoolModel> ids)
      : _ids = ids;

  final List<UniqueIdPoolModel> _ids;
  @override
  List<UniqueIdPoolModel> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  @override
  String toString() {
    return 'UniqueIdState.ids(ids: $ids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchedUniqueIdsStateImpl &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_ids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchedUniqueIdsStateImplCopyWith<_$FetchedUniqueIdsStateImpl>
      get copyWith => __$$FetchedUniqueIdsStateImplCopyWithImpl<
          _$FetchedUniqueIdsStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int progress, int totalCount) fetching,
    required TResult Function(int count, int totalCount) idCount,
    required TResult Function(List<UniqueIdPoolModel> ids) ids,
    required TResult Function(String? error) failed,
    required TResult Function(UniqueIdPoolModel aUniqueId) aUniqueId,
    required TResult Function() noInternet,
    required TResult Function(String message) limitExceeded,
  }) {
    return ids(this.ids);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int progress, int totalCount)? fetching,
    TResult? Function(int count, int totalCount)? idCount,
    TResult? Function(List<UniqueIdPoolModel> ids)? ids,
    TResult? Function(String? error)? failed,
    TResult? Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult? Function()? noInternet,
    TResult? Function(String message)? limitExceeded,
  }) {
    return ids?.call(this.ids);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int progress, int totalCount)? fetching,
    TResult Function(int count, int totalCount)? idCount,
    TResult Function(List<UniqueIdPoolModel> ids)? ids,
    TResult Function(String? error)? failed,
    TResult Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult Function()? noInternet,
    TResult Function(String message)? limitExceeded,
    required TResult orElse(),
  }) {
    if (ids != null) {
      return ids(this.ids);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(FetchingState value) fetching,
    required TResult Function(FetchedIdCountState value) idCount,
    required TResult Function(FetchedUniqueIdsState value) ids,
    required TResult Function(FailedState value) failed,
    required TResult Function(FetchedUniqueIdState value) aUniqueId,
    required TResult Function(NoInternetState value) noInternet,
    required TResult Function(LimitExceeded value) limitExceeded,
  }) {
    return ids(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState value)? loading,
    TResult? Function(FetchingState value)? fetching,
    TResult? Function(FetchedIdCountState value)? idCount,
    TResult? Function(FetchedUniqueIdsState value)? ids,
    TResult? Function(FailedState value)? failed,
    TResult? Function(FetchedUniqueIdState value)? aUniqueId,
    TResult? Function(NoInternetState value)? noInternet,
    TResult? Function(LimitExceeded value)? limitExceeded,
  }) {
    return ids?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(FetchingState value)? fetching,
    TResult Function(FetchedIdCountState value)? idCount,
    TResult Function(FetchedUniqueIdsState value)? ids,
    TResult Function(FailedState value)? failed,
    TResult Function(FetchedUniqueIdState value)? aUniqueId,
    TResult Function(NoInternetState value)? noInternet,
    TResult Function(LimitExceeded value)? limitExceeded,
    required TResult orElse(),
  }) {
    if (ids != null) {
      return ids(this);
    }
    return orElse();
  }
}

abstract class FetchedUniqueIdsState implements UniqueIdState {
  const factory FetchedUniqueIdsState(final List<UniqueIdPoolModel> ids) =
      _$FetchedUniqueIdsStateImpl;

  List<UniqueIdPoolModel> get ids;
  @JsonKey(ignore: true)
  _$$FetchedUniqueIdsStateImplCopyWith<_$FetchedUniqueIdsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedStateImplCopyWith<$Res> {
  factory _$$FailedStateImplCopyWith(
          _$FailedStateImpl value, $Res Function(_$FailedStateImpl) then) =
      __$$FailedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$FailedStateImplCopyWithImpl<$Res>
    extends _$UniqueIdStateCopyWithImpl<$Res, _$FailedStateImpl>
    implements _$$FailedStateImplCopyWith<$Res> {
  __$$FailedStateImplCopyWithImpl(
      _$FailedStateImpl _value, $Res Function(_$FailedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$FailedStateImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FailedStateImpl implements FailedState {
  const _$FailedStateImpl(this.error);

  @override
  final String? error;

  @override
  String toString() {
    return 'UniqueIdState.failed(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedStateImplCopyWith<_$FailedStateImpl> get copyWith =>
      __$$FailedStateImplCopyWithImpl<_$FailedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int progress, int totalCount) fetching,
    required TResult Function(int count, int totalCount) idCount,
    required TResult Function(List<UniqueIdPoolModel> ids) ids,
    required TResult Function(String? error) failed,
    required TResult Function(UniqueIdPoolModel aUniqueId) aUniqueId,
    required TResult Function() noInternet,
    required TResult Function(String message) limitExceeded,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int progress, int totalCount)? fetching,
    TResult? Function(int count, int totalCount)? idCount,
    TResult? Function(List<UniqueIdPoolModel> ids)? ids,
    TResult? Function(String? error)? failed,
    TResult? Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult? Function()? noInternet,
    TResult? Function(String message)? limitExceeded,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int progress, int totalCount)? fetching,
    TResult Function(int count, int totalCount)? idCount,
    TResult Function(List<UniqueIdPoolModel> ids)? ids,
    TResult Function(String? error)? failed,
    TResult Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult Function()? noInternet,
    TResult Function(String message)? limitExceeded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(FetchingState value) fetching,
    required TResult Function(FetchedIdCountState value) idCount,
    required TResult Function(FetchedUniqueIdsState value) ids,
    required TResult Function(FailedState value) failed,
    required TResult Function(FetchedUniqueIdState value) aUniqueId,
    required TResult Function(NoInternetState value) noInternet,
    required TResult Function(LimitExceeded value) limitExceeded,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState value)? loading,
    TResult? Function(FetchingState value)? fetching,
    TResult? Function(FetchedIdCountState value)? idCount,
    TResult? Function(FetchedUniqueIdsState value)? ids,
    TResult? Function(FailedState value)? failed,
    TResult? Function(FetchedUniqueIdState value)? aUniqueId,
    TResult? Function(NoInternetState value)? noInternet,
    TResult? Function(LimitExceeded value)? limitExceeded,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(FetchingState value)? fetching,
    TResult Function(FetchedIdCountState value)? idCount,
    TResult Function(FetchedUniqueIdsState value)? ids,
    TResult Function(FailedState value)? failed,
    TResult Function(FetchedUniqueIdState value)? aUniqueId,
    TResult Function(NoInternetState value)? noInternet,
    TResult Function(LimitExceeded value)? limitExceeded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FailedState implements UniqueIdState {
  const factory FailedState(final String? error) = _$FailedStateImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$FailedStateImplCopyWith<_$FailedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchedUniqueIdStateImplCopyWith<$Res> {
  factory _$$FetchedUniqueIdStateImplCopyWith(_$FetchedUniqueIdStateImpl value,
          $Res Function(_$FetchedUniqueIdStateImpl) then) =
      __$$FetchedUniqueIdStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UniqueIdPoolModel aUniqueId});
}

/// @nodoc
class __$$FetchedUniqueIdStateImplCopyWithImpl<$Res>
    extends _$UniqueIdStateCopyWithImpl<$Res, _$FetchedUniqueIdStateImpl>
    implements _$$FetchedUniqueIdStateImplCopyWith<$Res> {
  __$$FetchedUniqueIdStateImplCopyWithImpl(_$FetchedUniqueIdStateImpl _value,
      $Res Function(_$FetchedUniqueIdStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aUniqueId = null,
  }) {
    return _then(_$FetchedUniqueIdStateImpl(
      null == aUniqueId
          ? _value.aUniqueId
          : aUniqueId // ignore: cast_nullable_to_non_nullable
              as UniqueIdPoolModel,
    ));
  }
}

/// @nodoc

class _$FetchedUniqueIdStateImpl implements FetchedUniqueIdState {
  const _$FetchedUniqueIdStateImpl(this.aUniqueId);

  @override
  final UniqueIdPoolModel aUniqueId;

  @override
  String toString() {
    return 'UniqueIdState.aUniqueId(aUniqueId: $aUniqueId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchedUniqueIdStateImpl &&
            (identical(other.aUniqueId, aUniqueId) ||
                other.aUniqueId == aUniqueId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, aUniqueId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchedUniqueIdStateImplCopyWith<_$FetchedUniqueIdStateImpl>
      get copyWith =>
          __$$FetchedUniqueIdStateImplCopyWithImpl<_$FetchedUniqueIdStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int progress, int totalCount) fetching,
    required TResult Function(int count, int totalCount) idCount,
    required TResult Function(List<UniqueIdPoolModel> ids) ids,
    required TResult Function(String? error) failed,
    required TResult Function(UniqueIdPoolModel aUniqueId) aUniqueId,
    required TResult Function() noInternet,
    required TResult Function(String message) limitExceeded,
  }) {
    return aUniqueId(this.aUniqueId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int progress, int totalCount)? fetching,
    TResult? Function(int count, int totalCount)? idCount,
    TResult? Function(List<UniqueIdPoolModel> ids)? ids,
    TResult? Function(String? error)? failed,
    TResult? Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult? Function()? noInternet,
    TResult? Function(String message)? limitExceeded,
  }) {
    return aUniqueId?.call(this.aUniqueId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int progress, int totalCount)? fetching,
    TResult Function(int count, int totalCount)? idCount,
    TResult Function(List<UniqueIdPoolModel> ids)? ids,
    TResult Function(String? error)? failed,
    TResult Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult Function()? noInternet,
    TResult Function(String message)? limitExceeded,
    required TResult orElse(),
  }) {
    if (aUniqueId != null) {
      return aUniqueId(this.aUniqueId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(FetchingState value) fetching,
    required TResult Function(FetchedIdCountState value) idCount,
    required TResult Function(FetchedUniqueIdsState value) ids,
    required TResult Function(FailedState value) failed,
    required TResult Function(FetchedUniqueIdState value) aUniqueId,
    required TResult Function(NoInternetState value) noInternet,
    required TResult Function(LimitExceeded value) limitExceeded,
  }) {
    return aUniqueId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState value)? loading,
    TResult? Function(FetchingState value)? fetching,
    TResult? Function(FetchedIdCountState value)? idCount,
    TResult? Function(FetchedUniqueIdsState value)? ids,
    TResult? Function(FailedState value)? failed,
    TResult? Function(FetchedUniqueIdState value)? aUniqueId,
    TResult? Function(NoInternetState value)? noInternet,
    TResult? Function(LimitExceeded value)? limitExceeded,
  }) {
    return aUniqueId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(FetchingState value)? fetching,
    TResult Function(FetchedIdCountState value)? idCount,
    TResult Function(FetchedUniqueIdsState value)? ids,
    TResult Function(FailedState value)? failed,
    TResult Function(FetchedUniqueIdState value)? aUniqueId,
    TResult Function(NoInternetState value)? noInternet,
    TResult Function(LimitExceeded value)? limitExceeded,
    required TResult orElse(),
  }) {
    if (aUniqueId != null) {
      return aUniqueId(this);
    }
    return orElse();
  }
}

abstract class FetchedUniqueIdState implements UniqueIdState {
  const factory FetchedUniqueIdState(final UniqueIdPoolModel aUniqueId) =
      _$FetchedUniqueIdStateImpl;

  UniqueIdPoolModel get aUniqueId;
  @JsonKey(ignore: true)
  _$$FetchedUniqueIdStateImplCopyWith<_$FetchedUniqueIdStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoInternetStateImplCopyWith<$Res> {
  factory _$$NoInternetStateImplCopyWith(_$NoInternetStateImpl value,
          $Res Function(_$NoInternetStateImpl) then) =
      __$$NoInternetStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoInternetStateImplCopyWithImpl<$Res>
    extends _$UniqueIdStateCopyWithImpl<$Res, _$NoInternetStateImpl>
    implements _$$NoInternetStateImplCopyWith<$Res> {
  __$$NoInternetStateImplCopyWithImpl(
      _$NoInternetStateImpl _value, $Res Function(_$NoInternetStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoInternetStateImpl implements NoInternetState {
  const _$NoInternetStateImpl();

  @override
  String toString() {
    return 'UniqueIdState.noInternet()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoInternetStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int progress, int totalCount) fetching,
    required TResult Function(int count, int totalCount) idCount,
    required TResult Function(List<UniqueIdPoolModel> ids) ids,
    required TResult Function(String? error) failed,
    required TResult Function(UniqueIdPoolModel aUniqueId) aUniqueId,
    required TResult Function() noInternet,
    required TResult Function(String message) limitExceeded,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int progress, int totalCount)? fetching,
    TResult? Function(int count, int totalCount)? idCount,
    TResult? Function(List<UniqueIdPoolModel> ids)? ids,
    TResult? Function(String? error)? failed,
    TResult? Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult? Function()? noInternet,
    TResult? Function(String message)? limitExceeded,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int progress, int totalCount)? fetching,
    TResult Function(int count, int totalCount)? idCount,
    TResult Function(List<UniqueIdPoolModel> ids)? ids,
    TResult Function(String? error)? failed,
    TResult Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult Function()? noInternet,
    TResult Function(String message)? limitExceeded,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(FetchingState value) fetching,
    required TResult Function(FetchedIdCountState value) idCount,
    required TResult Function(FetchedUniqueIdsState value) ids,
    required TResult Function(FailedState value) failed,
    required TResult Function(FetchedUniqueIdState value) aUniqueId,
    required TResult Function(NoInternetState value) noInternet,
    required TResult Function(LimitExceeded value) limitExceeded,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState value)? loading,
    TResult? Function(FetchingState value)? fetching,
    TResult? Function(FetchedIdCountState value)? idCount,
    TResult? Function(FetchedUniqueIdsState value)? ids,
    TResult? Function(FailedState value)? failed,
    TResult? Function(FetchedUniqueIdState value)? aUniqueId,
    TResult? Function(NoInternetState value)? noInternet,
    TResult? Function(LimitExceeded value)? limitExceeded,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(FetchingState value)? fetching,
    TResult Function(FetchedIdCountState value)? idCount,
    TResult Function(FetchedUniqueIdsState value)? ids,
    TResult Function(FailedState value)? failed,
    TResult Function(FetchedUniqueIdState value)? aUniqueId,
    TResult Function(NoInternetState value)? noInternet,
    TResult Function(LimitExceeded value)? limitExceeded,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class NoInternetState implements UniqueIdState {
  const factory NoInternetState() = _$NoInternetStateImpl;
}

/// @nodoc
abstract class _$$LimitExceededImplCopyWith<$Res> {
  factory _$$LimitExceededImplCopyWith(
          _$LimitExceededImpl value, $Res Function(_$LimitExceededImpl) then) =
      __$$LimitExceededImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LimitExceededImplCopyWithImpl<$Res>
    extends _$UniqueIdStateCopyWithImpl<$Res, _$LimitExceededImpl>
    implements _$$LimitExceededImplCopyWith<$Res> {
  __$$LimitExceededImplCopyWithImpl(
      _$LimitExceededImpl _value, $Res Function(_$LimitExceededImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LimitExceededImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LimitExceededImpl implements LimitExceeded {
  const _$LimitExceededImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UniqueIdState.limitExceeded(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LimitExceededImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LimitExceededImplCopyWith<_$LimitExceededImpl> get copyWith =>
      __$$LimitExceededImplCopyWithImpl<_$LimitExceededImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int progress, int totalCount) fetching,
    required TResult Function(int count, int totalCount) idCount,
    required TResult Function(List<UniqueIdPoolModel> ids) ids,
    required TResult Function(String? error) failed,
    required TResult Function(UniqueIdPoolModel aUniqueId) aUniqueId,
    required TResult Function() noInternet,
    required TResult Function(String message) limitExceeded,
  }) {
    return limitExceeded(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int progress, int totalCount)? fetching,
    TResult? Function(int count, int totalCount)? idCount,
    TResult? Function(List<UniqueIdPoolModel> ids)? ids,
    TResult? Function(String? error)? failed,
    TResult? Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult? Function()? noInternet,
    TResult? Function(String message)? limitExceeded,
  }) {
    return limitExceeded?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int progress, int totalCount)? fetching,
    TResult Function(int count, int totalCount)? idCount,
    TResult Function(List<UniqueIdPoolModel> ids)? ids,
    TResult Function(String? error)? failed,
    TResult Function(UniqueIdPoolModel aUniqueId)? aUniqueId,
    TResult Function()? noInternet,
    TResult Function(String message)? limitExceeded,
    required TResult orElse(),
  }) {
    if (limitExceeded != null) {
      return limitExceeded(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(FetchingState value) fetching,
    required TResult Function(FetchedIdCountState value) idCount,
    required TResult Function(FetchedUniqueIdsState value) ids,
    required TResult Function(FailedState value) failed,
    required TResult Function(FetchedUniqueIdState value) aUniqueId,
    required TResult Function(NoInternetState value) noInternet,
    required TResult Function(LimitExceeded value) limitExceeded,
  }) {
    return limitExceeded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState value)? loading,
    TResult? Function(FetchingState value)? fetching,
    TResult? Function(FetchedIdCountState value)? idCount,
    TResult? Function(FetchedUniqueIdsState value)? ids,
    TResult? Function(FailedState value)? failed,
    TResult? Function(FetchedUniqueIdState value)? aUniqueId,
    TResult? Function(NoInternetState value)? noInternet,
    TResult? Function(LimitExceeded value)? limitExceeded,
  }) {
    return limitExceeded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(FetchingState value)? fetching,
    TResult Function(FetchedIdCountState value)? idCount,
    TResult Function(FetchedUniqueIdsState value)? ids,
    TResult Function(FailedState value)? failed,
    TResult Function(FetchedUniqueIdState value)? aUniqueId,
    TResult Function(NoInternetState value)? noInternet,
    TResult Function(LimitExceeded value)? limitExceeded,
    required TResult orElse(),
  }) {
    if (limitExceeded != null) {
      return limitExceeded(this);
    }
    return orElse();
  }
}

abstract class LimitExceeded implements UniqueIdState {
  const factory LimitExceeded(final String message) = _$LimitExceededImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$LimitExceededImplCopyWith<_$LimitExceededImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

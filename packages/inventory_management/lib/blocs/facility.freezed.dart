// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FacilityEvent {
  String get projectId => throw _privateConstructorUsedError;
  bool get loadAllProjects => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId, bool loadAllProjects)
        loadForProjectId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId, bool loadAllProjects)? loadForProjectId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, bool loadAllProjects)? loadForProjectId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacilityLoadForProjectEvent value)
        loadForProjectId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityLoadForProjectEvent value)? loadForProjectId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityLoadForProjectEvent value)? loadForProjectId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FacilityEventCopyWith<FacilityEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityEventCopyWith<$Res> {
  factory $FacilityEventCopyWith(
          FacilityEvent value, $Res Function(FacilityEvent) then) =
      _$FacilityEventCopyWithImpl<$Res, FacilityEvent>;
  @useResult
  $Res call({String projectId, bool loadAllProjects});
}

/// @nodoc
class _$FacilityEventCopyWithImpl<$Res, $Val extends FacilityEvent>
    implements $FacilityEventCopyWith<$Res> {
  _$FacilityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? loadAllProjects = null,
  }) {
    return _then(_value.copyWith(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      loadAllProjects: null == loadAllProjects
          ? _value.loadAllProjects
          : loadAllProjects // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacilityLoadForProjectEventImplCopyWith<$Res>
    implements $FacilityEventCopyWith<$Res> {
  factory _$$FacilityLoadForProjectEventImplCopyWith(
          _$FacilityLoadForProjectEventImpl value,
          $Res Function(_$FacilityLoadForProjectEventImpl) then) =
      __$$FacilityLoadForProjectEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String projectId, bool loadAllProjects});
}

/// @nodoc
class __$$FacilityLoadForProjectEventImplCopyWithImpl<$Res>
    extends _$FacilityEventCopyWithImpl<$Res, _$FacilityLoadForProjectEventImpl>
    implements _$$FacilityLoadForProjectEventImplCopyWith<$Res> {
  __$$FacilityLoadForProjectEventImplCopyWithImpl(
      _$FacilityLoadForProjectEventImpl _value,
      $Res Function(_$FacilityLoadForProjectEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? loadAllProjects = null,
  }) {
    return _then(_$FacilityLoadForProjectEventImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      loadAllProjects: null == loadAllProjects
          ? _value.loadAllProjects
          : loadAllProjects // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FacilityLoadForProjectEventImpl implements FacilityLoadForProjectEvent {
  const _$FacilityLoadForProjectEventImpl(
      {required this.projectId, this.loadAllProjects = true});

  @override
  final String projectId;
  @override
  @JsonKey()
  final bool loadAllProjects;

  @override
  String toString() {
    return 'FacilityEvent.loadForProjectId(projectId: $projectId, loadAllProjects: $loadAllProjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityLoadForProjectEventImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.loadAllProjects, loadAllProjects) ||
                other.loadAllProjects == loadAllProjects));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId, loadAllProjects);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityLoadForProjectEventImplCopyWith<_$FacilityLoadForProjectEventImpl>
      get copyWith => __$$FacilityLoadForProjectEventImplCopyWithImpl<
          _$FacilityLoadForProjectEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId, bool loadAllProjects)
        loadForProjectId,
  }) {
    return loadForProjectId(projectId, loadAllProjects);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId, bool loadAllProjects)? loadForProjectId,
  }) {
    return loadForProjectId?.call(projectId, loadAllProjects);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId, bool loadAllProjects)? loadForProjectId,
    required TResult orElse(),
  }) {
    if (loadForProjectId != null) {
      return loadForProjectId(projectId, loadAllProjects);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacilityLoadForProjectEvent value)
        loadForProjectId,
  }) {
    return loadForProjectId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityLoadForProjectEvent value)? loadForProjectId,
  }) {
    return loadForProjectId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityLoadForProjectEvent value)? loadForProjectId,
    required TResult orElse(),
  }) {
    if (loadForProjectId != null) {
      return loadForProjectId(this);
    }
    return orElse();
  }
}

abstract class FacilityLoadForProjectEvent implements FacilityEvent {
  const factory FacilityLoadForProjectEvent(
      {required final String projectId,
      final bool loadAllProjects}) = _$FacilityLoadForProjectEventImpl;

  @override
  String get projectId;
  @override
  bool get loadAllProjects;
  @override
  @JsonKey(ignore: true)
  _$$FacilityLoadForProjectEventImplCopyWith<_$FacilityLoadForProjectEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FacilityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<FacilityModel> facilities) fetched,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<FacilityModel> facilities)? fetched,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<FacilityModel> facilities)? fetched,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacilityEmptyState value) empty,
    required TResult Function(FacilityLoadingState value) loading,
    required TResult Function(FacilityFetchedState value) fetched,
    required TResult Function(FacilityErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityEmptyState value)? empty,
    TResult? Function(FacilityLoadingState value)? loading,
    TResult? Function(FacilityFetchedState value)? fetched,
    TResult? Function(FacilityErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityEmptyState value)? empty,
    TResult Function(FacilityLoadingState value)? loading,
    TResult Function(FacilityFetchedState value)? fetched,
    TResult Function(FacilityErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityStateCopyWith<$Res> {
  factory $FacilityStateCopyWith(
          FacilityState value, $Res Function(FacilityState) then) =
      _$FacilityStateCopyWithImpl<$Res, FacilityState>;
}

/// @nodoc
class _$FacilityStateCopyWithImpl<$Res, $Val extends FacilityState>
    implements $FacilityStateCopyWith<$Res> {
  _$FacilityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FacilityEmptyStateImplCopyWith<$Res> {
  factory _$$FacilityEmptyStateImplCopyWith(_$FacilityEmptyStateImpl value,
          $Res Function(_$FacilityEmptyStateImpl) then) =
      __$$FacilityEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FacilityEmptyStateImplCopyWithImpl<$Res>
    extends _$FacilityStateCopyWithImpl<$Res, _$FacilityEmptyStateImpl>
    implements _$$FacilityEmptyStateImplCopyWith<$Res> {
  __$$FacilityEmptyStateImplCopyWithImpl(_$FacilityEmptyStateImpl _value,
      $Res Function(_$FacilityEmptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FacilityEmptyStateImpl implements FacilityEmptyState {
  const _$FacilityEmptyStateImpl();

  @override
  String toString() {
    return 'FacilityState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FacilityEmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<FacilityModel> facilities) fetched,
    required TResult Function() error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<FacilityModel> facilities)? fetched,
    TResult? Function()? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<FacilityModel> facilities)? fetched,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacilityEmptyState value) empty,
    required TResult Function(FacilityLoadingState value) loading,
    required TResult Function(FacilityFetchedState value) fetched,
    required TResult Function(FacilityErrorState value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityEmptyState value)? empty,
    TResult? Function(FacilityLoadingState value)? loading,
    TResult? Function(FacilityFetchedState value)? fetched,
    TResult? Function(FacilityErrorState value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityEmptyState value)? empty,
    TResult Function(FacilityLoadingState value)? loading,
    TResult Function(FacilityFetchedState value)? fetched,
    TResult Function(FacilityErrorState value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class FacilityEmptyState implements FacilityState {
  const factory FacilityEmptyState() = _$FacilityEmptyStateImpl;
}

/// @nodoc
abstract class _$$FacilityLoadingStateImplCopyWith<$Res> {
  factory _$$FacilityLoadingStateImplCopyWith(_$FacilityLoadingStateImpl value,
          $Res Function(_$FacilityLoadingStateImpl) then) =
      __$$FacilityLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FacilityLoadingStateImplCopyWithImpl<$Res>
    extends _$FacilityStateCopyWithImpl<$Res, _$FacilityLoadingStateImpl>
    implements _$$FacilityLoadingStateImplCopyWith<$Res> {
  __$$FacilityLoadingStateImplCopyWithImpl(_$FacilityLoadingStateImpl _value,
      $Res Function(_$FacilityLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FacilityLoadingStateImpl implements FacilityLoadingState {
  const _$FacilityLoadingStateImpl();

  @override
  String toString() {
    return 'FacilityState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<FacilityModel> facilities) fetched,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<FacilityModel> facilities)? fetched,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<FacilityModel> facilities)? fetched,
    TResult Function()? error,
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
    required TResult Function(FacilityEmptyState value) empty,
    required TResult Function(FacilityLoadingState value) loading,
    required TResult Function(FacilityFetchedState value) fetched,
    required TResult Function(FacilityErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityEmptyState value)? empty,
    TResult? Function(FacilityLoadingState value)? loading,
    TResult? Function(FacilityFetchedState value)? fetched,
    TResult? Function(FacilityErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityEmptyState value)? empty,
    TResult Function(FacilityLoadingState value)? loading,
    TResult Function(FacilityFetchedState value)? fetched,
    TResult Function(FacilityErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FacilityLoadingState implements FacilityState {
  const factory FacilityLoadingState() = _$FacilityLoadingStateImpl;
}

/// @nodoc
abstract class _$$FacilityFetchedStateImplCopyWith<$Res> {
  factory _$$FacilityFetchedStateImplCopyWith(_$FacilityFetchedStateImpl value,
          $Res Function(_$FacilityFetchedStateImpl) then) =
      __$$FacilityFetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FacilityModel> facilities});
}

/// @nodoc
class __$$FacilityFetchedStateImplCopyWithImpl<$Res>
    extends _$FacilityStateCopyWithImpl<$Res, _$FacilityFetchedStateImpl>
    implements _$$FacilityFetchedStateImplCopyWith<$Res> {
  __$$FacilityFetchedStateImplCopyWithImpl(_$FacilityFetchedStateImpl _value,
      $Res Function(_$FacilityFetchedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
  }) {
    return _then(_$FacilityFetchedStateImpl(
      facilities: null == facilities
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<FacilityModel>,
    ));
  }
}

/// @nodoc

class _$FacilityFetchedStateImpl implements FacilityFetchedState {
  const _$FacilityFetchedStateImpl(
      {required final List<FacilityModel> facilities})
      : _facilities = facilities;

  final List<FacilityModel> _facilities;
  @override
  List<FacilityModel> get facilities {
    if (_facilities is EqualUnmodifiableListView) return _facilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilities);
  }

  @override
  String toString() {
    return 'FacilityState.fetched(facilities: $facilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityFetchedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._facilities, _facilities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_facilities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityFetchedStateImplCopyWith<_$FacilityFetchedStateImpl>
      get copyWith =>
          __$$FacilityFetchedStateImplCopyWithImpl<_$FacilityFetchedStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<FacilityModel> facilities) fetched,
    required TResult Function() error,
  }) {
    return fetched(facilities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<FacilityModel> facilities)? fetched,
    TResult? Function()? error,
  }) {
    return fetched?.call(facilities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<FacilityModel> facilities)? fetched,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(facilities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacilityEmptyState value) empty,
    required TResult Function(FacilityLoadingState value) loading,
    required TResult Function(FacilityFetchedState value) fetched,
    required TResult Function(FacilityErrorState value) error,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityEmptyState value)? empty,
    TResult? Function(FacilityLoadingState value)? loading,
    TResult? Function(FacilityFetchedState value)? fetched,
    TResult? Function(FacilityErrorState value)? error,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityEmptyState value)? empty,
    TResult Function(FacilityLoadingState value)? loading,
    TResult Function(FacilityFetchedState value)? fetched,
    TResult Function(FacilityErrorState value)? error,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class FacilityFetchedState implements FacilityState {
  const factory FacilityFetchedState(
          {required final List<FacilityModel> facilities}) =
      _$FacilityFetchedStateImpl;

  List<FacilityModel> get facilities;
  @JsonKey(ignore: true)
  _$$FacilityFetchedStateImplCopyWith<_$FacilityFetchedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FacilityErrorStateImplCopyWith<$Res> {
  factory _$$FacilityErrorStateImplCopyWith(_$FacilityErrorStateImpl value,
          $Res Function(_$FacilityErrorStateImpl) then) =
      __$$FacilityErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FacilityErrorStateImplCopyWithImpl<$Res>
    extends _$FacilityStateCopyWithImpl<$Res, _$FacilityErrorStateImpl>
    implements _$$FacilityErrorStateImplCopyWith<$Res> {
  __$$FacilityErrorStateImplCopyWithImpl(_$FacilityErrorStateImpl _value,
      $Res Function(_$FacilityErrorStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FacilityErrorStateImpl implements FacilityErrorState {
  const _$FacilityErrorStateImpl();

  @override
  String toString() {
    return 'FacilityState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FacilityErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<FacilityModel> facilities) fetched,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<FacilityModel> facilities)? fetched,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<FacilityModel> facilities)? fetched,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacilityEmptyState value) empty,
    required TResult Function(FacilityLoadingState value) loading,
    required TResult Function(FacilityFetchedState value) fetched,
    required TResult Function(FacilityErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityEmptyState value)? empty,
    TResult? Function(FacilityLoadingState value)? loading,
    TResult? Function(FacilityFetchedState value)? fetched,
    TResult? Function(FacilityErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityEmptyState value)? empty,
    TResult Function(FacilityLoadingState value)? loading,
    TResult Function(FacilityFetchedState value)? fetched,
    TResult Function(FacilityErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FacilityErrorState implements FacilityState {
  const factory FacilityErrorState() = _$FacilityErrorStateImpl;
}

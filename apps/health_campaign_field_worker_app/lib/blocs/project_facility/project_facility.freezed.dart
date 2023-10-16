// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project_facility.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProjectFacilityEvent {
  ProjectFacilitySearchModel get query => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProjectFacilitySearchModel query) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProjectFacilitySearchModel query)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProjectFacilitySearchModel query)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectFacilityLoadEvent value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectFacilityLoadEvent value)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectFacilityLoadEvent value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectFacilityEventCopyWith<ProjectFacilityEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectFacilityEventCopyWith<$Res> {
  factory $ProjectFacilityEventCopyWith(ProjectFacilityEvent value,
          $Res Function(ProjectFacilityEvent) then) =
      _$ProjectFacilityEventCopyWithImpl<$Res, ProjectFacilityEvent>;
  @useResult
  $Res call({ProjectFacilitySearchModel query});
}

/// @nodoc
class _$ProjectFacilityEventCopyWithImpl<$Res,
        $Val extends ProjectFacilityEvent>
    implements $ProjectFacilityEventCopyWith<$Res> {
  _$ProjectFacilityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as ProjectFacilitySearchModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectFacilityLoadEventCopyWith<$Res>
    implements $ProjectFacilityEventCopyWith<$Res> {
  factory _$$ProjectFacilityLoadEventCopyWith(_$ProjectFacilityLoadEvent value,
          $Res Function(_$ProjectFacilityLoadEvent) then) =
      __$$ProjectFacilityLoadEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProjectFacilitySearchModel query});
}

/// @nodoc
class __$$ProjectFacilityLoadEventCopyWithImpl<$Res>
    extends _$ProjectFacilityEventCopyWithImpl<$Res, _$ProjectFacilityLoadEvent>
    implements _$$ProjectFacilityLoadEventCopyWith<$Res> {
  __$$ProjectFacilityLoadEventCopyWithImpl(_$ProjectFacilityLoadEvent _value,
      $Res Function(_$ProjectFacilityLoadEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$ProjectFacilityLoadEvent(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as ProjectFacilitySearchModel,
    ));
  }
}

/// @nodoc

class _$ProjectFacilityLoadEvent implements ProjectFacilityLoadEvent {
  const _$ProjectFacilityLoadEvent({required this.query});

  @override
  final ProjectFacilitySearchModel query;

  @override
  String toString() {
    return 'ProjectFacilityEvent.load(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectFacilityLoadEvent &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectFacilityLoadEventCopyWith<_$ProjectFacilityLoadEvent>
      get copyWith =>
          __$$ProjectFacilityLoadEventCopyWithImpl<_$ProjectFacilityLoadEvent>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProjectFacilitySearchModel query) load,
  }) {
    return load(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProjectFacilitySearchModel query)? load,
  }) {
    return load?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProjectFacilitySearchModel query)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectFacilityLoadEvent value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectFacilityLoadEvent value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectFacilityLoadEvent value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class ProjectFacilityLoadEvent implements ProjectFacilityEvent {
  const factory ProjectFacilityLoadEvent(
          {required final ProjectFacilitySearchModel query}) =
      _$ProjectFacilityLoadEvent;

  @override
  ProjectFacilitySearchModel get query;
  @override
  @JsonKey(ignore: true)
  _$$ProjectFacilityLoadEventCopyWith<_$ProjectFacilityLoadEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectFacilityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<ProjectFacilityModel> projectFacilities)
        fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<ProjectFacilityModel> projectFacilities)? fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<ProjectFacilityModel> projectFacilities)? fetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectFacilityEmptyState value) empty,
    required TResult Function(ProjectFacilityLoadingState value) loading,
    required TResult Function(ProjectFacilityFetchedState value) fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectFacilityEmptyState value)? empty,
    TResult? Function(ProjectFacilityLoadingState value)? loading,
    TResult? Function(ProjectFacilityFetchedState value)? fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectFacilityEmptyState value)? empty,
    TResult Function(ProjectFacilityLoadingState value)? loading,
    TResult Function(ProjectFacilityFetchedState value)? fetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectFacilityStateCopyWith<$Res> {
  factory $ProjectFacilityStateCopyWith(ProjectFacilityState value,
          $Res Function(ProjectFacilityState) then) =
      _$ProjectFacilityStateCopyWithImpl<$Res, ProjectFacilityState>;
}

/// @nodoc
class _$ProjectFacilityStateCopyWithImpl<$Res,
        $Val extends ProjectFacilityState>
    implements $ProjectFacilityStateCopyWith<$Res> {
  _$ProjectFacilityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProjectFacilityEmptyStateCopyWith<$Res> {
  factory _$$ProjectFacilityEmptyStateCopyWith(
          _$ProjectFacilityEmptyState value,
          $Res Function(_$ProjectFacilityEmptyState) then) =
      __$$ProjectFacilityEmptyStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectFacilityEmptyStateCopyWithImpl<$Res>
    extends _$ProjectFacilityStateCopyWithImpl<$Res,
        _$ProjectFacilityEmptyState>
    implements _$$ProjectFacilityEmptyStateCopyWith<$Res> {
  __$$ProjectFacilityEmptyStateCopyWithImpl(_$ProjectFacilityEmptyState _value,
      $Res Function(_$ProjectFacilityEmptyState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProjectFacilityEmptyState implements ProjectFacilityEmptyState {
  const _$ProjectFacilityEmptyState();

  @override
  String toString() {
    return 'ProjectFacilityState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectFacilityEmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<ProjectFacilityModel> projectFacilities)
        fetched,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<ProjectFacilityModel> projectFacilities)? fetched,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<ProjectFacilityModel> projectFacilities)? fetched,
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
    required TResult Function(ProjectFacilityEmptyState value) empty,
    required TResult Function(ProjectFacilityLoadingState value) loading,
    required TResult Function(ProjectFacilityFetchedState value) fetched,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectFacilityEmptyState value)? empty,
    TResult? Function(ProjectFacilityLoadingState value)? loading,
    TResult? Function(ProjectFacilityFetchedState value)? fetched,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectFacilityEmptyState value)? empty,
    TResult Function(ProjectFacilityLoadingState value)? loading,
    TResult Function(ProjectFacilityFetchedState value)? fetched,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class ProjectFacilityEmptyState implements ProjectFacilityState {
  const factory ProjectFacilityEmptyState() = _$ProjectFacilityEmptyState;
}

/// @nodoc
abstract class _$$ProjectFacilityLoadingStateCopyWith<$Res> {
  factory _$$ProjectFacilityLoadingStateCopyWith(
          _$ProjectFacilityLoadingState value,
          $Res Function(_$ProjectFacilityLoadingState) then) =
      __$$ProjectFacilityLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectFacilityLoadingStateCopyWithImpl<$Res>
    extends _$ProjectFacilityStateCopyWithImpl<$Res,
        _$ProjectFacilityLoadingState>
    implements _$$ProjectFacilityLoadingStateCopyWith<$Res> {
  __$$ProjectFacilityLoadingStateCopyWithImpl(
      _$ProjectFacilityLoadingState _value,
      $Res Function(_$ProjectFacilityLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProjectFacilityLoadingState implements ProjectFacilityLoadingState {
  const _$ProjectFacilityLoadingState();

  @override
  String toString() {
    return 'ProjectFacilityState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectFacilityLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<ProjectFacilityModel> projectFacilities)
        fetched,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<ProjectFacilityModel> projectFacilities)? fetched,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<ProjectFacilityModel> projectFacilities)? fetched,
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
    required TResult Function(ProjectFacilityEmptyState value) empty,
    required TResult Function(ProjectFacilityLoadingState value) loading,
    required TResult Function(ProjectFacilityFetchedState value) fetched,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectFacilityEmptyState value)? empty,
    TResult? Function(ProjectFacilityLoadingState value)? loading,
    TResult? Function(ProjectFacilityFetchedState value)? fetched,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectFacilityEmptyState value)? empty,
    TResult Function(ProjectFacilityLoadingState value)? loading,
    TResult Function(ProjectFacilityFetchedState value)? fetched,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProjectFacilityLoadingState implements ProjectFacilityState {
  const factory ProjectFacilityLoadingState() = _$ProjectFacilityLoadingState;
}

/// @nodoc
abstract class _$$ProjectFacilityFetchedStateCopyWith<$Res> {
  factory _$$ProjectFacilityFetchedStateCopyWith(
          _$ProjectFacilityFetchedState value,
          $Res Function(_$ProjectFacilityFetchedState) then) =
      __$$ProjectFacilityFetchedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProjectFacilityModel> projectFacilities});
}

/// @nodoc
class __$$ProjectFacilityFetchedStateCopyWithImpl<$Res>
    extends _$ProjectFacilityStateCopyWithImpl<$Res,
        _$ProjectFacilityFetchedState>
    implements _$$ProjectFacilityFetchedStateCopyWith<$Res> {
  __$$ProjectFacilityFetchedStateCopyWithImpl(
      _$ProjectFacilityFetchedState _value,
      $Res Function(_$ProjectFacilityFetchedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectFacilities = null,
  }) {
    return _then(_$ProjectFacilityFetchedState(
      projectFacilities: null == projectFacilities
          ? _value._projectFacilities
          : projectFacilities // ignore: cast_nullable_to_non_nullable
              as List<ProjectFacilityModel>,
    ));
  }
}

/// @nodoc

class _$ProjectFacilityFetchedState implements ProjectFacilityFetchedState {
  const _$ProjectFacilityFetchedState(
      {required final List<ProjectFacilityModel> projectFacilities})
      : _projectFacilities = projectFacilities;

  final List<ProjectFacilityModel> _projectFacilities;
  @override
  List<ProjectFacilityModel> get projectFacilities {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectFacilities);
  }

  @override
  String toString() {
    return 'ProjectFacilityState.fetched(projectFacilities: $projectFacilities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectFacilityFetchedState &&
            const DeepCollectionEquality()
                .equals(other._projectFacilities, _projectFacilities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_projectFacilities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectFacilityFetchedStateCopyWith<_$ProjectFacilityFetchedState>
      get copyWith => __$$ProjectFacilityFetchedStateCopyWithImpl<
          _$ProjectFacilityFetchedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<ProjectFacilityModel> projectFacilities)
        fetched,
  }) {
    return fetched(projectFacilities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<ProjectFacilityModel> projectFacilities)? fetched,
  }) {
    return fetched?.call(projectFacilities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<ProjectFacilityModel> projectFacilities)? fetched,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(projectFacilities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectFacilityEmptyState value) empty,
    required TResult Function(ProjectFacilityLoadingState value) loading,
    required TResult Function(ProjectFacilityFetchedState value) fetched,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectFacilityEmptyState value)? empty,
    TResult? Function(ProjectFacilityLoadingState value)? loading,
    TResult? Function(ProjectFacilityFetchedState value)? fetched,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectFacilityEmptyState value)? empty,
    TResult Function(ProjectFacilityLoadingState value)? loading,
    TResult Function(ProjectFacilityFetchedState value)? fetched,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class ProjectFacilityFetchedState implements ProjectFacilityState {
  const factory ProjectFacilityFetchedState(
          {required final List<ProjectFacilityModel> projectFacilities}) =
      _$ProjectFacilityFetchedState;

  List<ProjectFacilityModel> get projectFacilities;
  @JsonKey(ignore: true)
  _$$ProjectFacilityFetchedStateCopyWith<_$ProjectFacilityFetchedState>
      get copyWith => throw _privateConstructorUsedError;
}

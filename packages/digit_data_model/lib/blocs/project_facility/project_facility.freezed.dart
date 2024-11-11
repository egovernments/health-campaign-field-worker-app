// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_facility.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$ProjectFacilityLoadEventImplCopyWith<$Res>
    implements $ProjectFacilityEventCopyWith<$Res> {
  factory _$$ProjectFacilityLoadEventImplCopyWith(
          _$ProjectFacilityLoadEventImpl value,
          $Res Function(_$ProjectFacilityLoadEventImpl) then) =
      __$$ProjectFacilityLoadEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProjectFacilitySearchModel query});
}

/// @nodoc
class __$$ProjectFacilityLoadEventImplCopyWithImpl<$Res>
    extends _$ProjectFacilityEventCopyWithImpl<$Res,
        _$ProjectFacilityLoadEventImpl>
    implements _$$ProjectFacilityLoadEventImplCopyWith<$Res> {
  __$$ProjectFacilityLoadEventImplCopyWithImpl(
      _$ProjectFacilityLoadEventImpl _value,
      $Res Function(_$ProjectFacilityLoadEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$ProjectFacilityLoadEventImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as ProjectFacilitySearchModel,
    ));
  }
}

/// @nodoc

class _$ProjectFacilityLoadEventImpl implements ProjectFacilityLoadEvent {
  const _$ProjectFacilityLoadEventImpl({required this.query});

  @override
  final ProjectFacilitySearchModel query;

  @override
  String toString() {
    return 'ProjectFacilityEvent.load(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectFacilityLoadEventImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectFacilityLoadEventImplCopyWith<_$ProjectFacilityLoadEventImpl>
      get copyWith => __$$ProjectFacilityLoadEventImplCopyWithImpl<
          _$ProjectFacilityLoadEventImpl>(this, _$identity);

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
      _$ProjectFacilityLoadEventImpl;

  @override
  ProjectFacilitySearchModel get query;
  @override
  @JsonKey(ignore: true)
  _$$ProjectFacilityLoadEventImplCopyWith<_$ProjectFacilityLoadEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectFacilityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<ProjectFacilityModel> projectFacilities,
            Map<String, String> facilityMap)
        fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<ProjectFacilityModel> projectFacilities,
            Map<String, String> facilityMap)?
        fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<ProjectFacilityModel> projectFacilities,
            Map<String, String> facilityMap)?
        fetched,
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
abstract class _$$ProjectFacilityEmptyStateImplCopyWith<$Res> {
  factory _$$ProjectFacilityEmptyStateImplCopyWith(
          _$ProjectFacilityEmptyStateImpl value,
          $Res Function(_$ProjectFacilityEmptyStateImpl) then) =
      __$$ProjectFacilityEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectFacilityEmptyStateImplCopyWithImpl<$Res>
    extends _$ProjectFacilityStateCopyWithImpl<$Res,
        _$ProjectFacilityEmptyStateImpl>
    implements _$$ProjectFacilityEmptyStateImplCopyWith<$Res> {
  __$$ProjectFacilityEmptyStateImplCopyWithImpl(
      _$ProjectFacilityEmptyStateImpl _value,
      $Res Function(_$ProjectFacilityEmptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProjectFacilityEmptyStateImpl implements ProjectFacilityEmptyState {
  const _$ProjectFacilityEmptyStateImpl();

  @override
  String toString() {
    return 'ProjectFacilityState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectFacilityEmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<ProjectFacilityModel> projectFacilities,
            Map<String, String> facilityMap)
        fetched,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<ProjectFacilityModel> projectFacilities,
            Map<String, String> facilityMap)?
        fetched,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<ProjectFacilityModel> projectFacilities,
            Map<String, String> facilityMap)?
        fetched,
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
  const factory ProjectFacilityEmptyState() = _$ProjectFacilityEmptyStateImpl;
}

/// @nodoc
abstract class _$$ProjectFacilityLoadingStateImplCopyWith<$Res> {
  factory _$$ProjectFacilityLoadingStateImplCopyWith(
          _$ProjectFacilityLoadingStateImpl value,
          $Res Function(_$ProjectFacilityLoadingStateImpl) then) =
      __$$ProjectFacilityLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectFacilityLoadingStateImplCopyWithImpl<$Res>
    extends _$ProjectFacilityStateCopyWithImpl<$Res,
        _$ProjectFacilityLoadingStateImpl>
    implements _$$ProjectFacilityLoadingStateImplCopyWith<$Res> {
  __$$ProjectFacilityLoadingStateImplCopyWithImpl(
      _$ProjectFacilityLoadingStateImpl _value,
      $Res Function(_$ProjectFacilityLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProjectFacilityLoadingStateImpl implements ProjectFacilityLoadingState {
  const _$ProjectFacilityLoadingStateImpl();

  @override
  String toString() {
    return 'ProjectFacilityState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectFacilityLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<ProjectFacilityModel> projectFacilities,
            Map<String, String> facilityMap)
        fetched,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<ProjectFacilityModel> projectFacilities,
            Map<String, String> facilityMap)?
        fetched,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<ProjectFacilityModel> projectFacilities,
            Map<String, String> facilityMap)?
        fetched,
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
  const factory ProjectFacilityLoadingState() =
      _$ProjectFacilityLoadingStateImpl;
}

/// @nodoc
abstract class _$$ProjectFacilityFetchedStateImplCopyWith<$Res> {
  factory _$$ProjectFacilityFetchedStateImplCopyWith(
          _$ProjectFacilityFetchedStateImpl value,
          $Res Function(_$ProjectFacilityFetchedStateImpl) then) =
      __$$ProjectFacilityFetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ProjectFacilityModel> projectFacilities,
      Map<String, String> facilityMap});
}

/// @nodoc
class __$$ProjectFacilityFetchedStateImplCopyWithImpl<$Res>
    extends _$ProjectFacilityStateCopyWithImpl<$Res,
        _$ProjectFacilityFetchedStateImpl>
    implements _$$ProjectFacilityFetchedStateImplCopyWith<$Res> {
  __$$ProjectFacilityFetchedStateImplCopyWithImpl(
      _$ProjectFacilityFetchedStateImpl _value,
      $Res Function(_$ProjectFacilityFetchedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectFacilities = null,
    Object? facilityMap = null,
  }) {
    return _then(_$ProjectFacilityFetchedStateImpl(
      projectFacilities: null == projectFacilities
          ? _value._projectFacilities
          : projectFacilities // ignore: cast_nullable_to_non_nullable
              as List<ProjectFacilityModel>,
      facilityMap: null == facilityMap
          ? _value._facilityMap
          : facilityMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$ProjectFacilityFetchedStateImpl implements ProjectFacilityFetchedState {
  const _$ProjectFacilityFetchedStateImpl(
      {required final List<ProjectFacilityModel> projectFacilities,
      required final Map<String, String> facilityMap})
      : _projectFacilities = projectFacilities,
        _facilityMap = facilityMap;

  final List<ProjectFacilityModel> _projectFacilities;
  @override
  List<ProjectFacilityModel> get projectFacilities {
    if (_projectFacilities is EqualUnmodifiableListView)
      return _projectFacilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectFacilities);
  }

  final Map<String, String> _facilityMap;
  @override
  Map<String, String> get facilityMap {
    if (_facilityMap is EqualUnmodifiableMapView) return _facilityMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_facilityMap);
  }

  @override
  String toString() {
    return 'ProjectFacilityState.fetched(projectFacilities: $projectFacilities, facilityMap: $facilityMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectFacilityFetchedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._projectFacilities, _projectFacilities) &&
            const DeepCollectionEquality()
                .equals(other._facilityMap, _facilityMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_projectFacilities),
      const DeepCollectionEquality().hash(_facilityMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectFacilityFetchedStateImplCopyWith<_$ProjectFacilityFetchedStateImpl>
      get copyWith => __$$ProjectFacilityFetchedStateImplCopyWithImpl<
          _$ProjectFacilityFetchedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<ProjectFacilityModel> projectFacilities,
            Map<String, String> facilityMap)
        fetched,
  }) {
    return fetched(projectFacilities, facilityMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<ProjectFacilityModel> projectFacilities,
            Map<String, String> facilityMap)?
        fetched,
  }) {
    return fetched?.call(projectFacilities, facilityMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<ProjectFacilityModel> projectFacilities,
            Map<String, String> facilityMap)?
        fetched,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(projectFacilities, facilityMap);
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
          {required final List<ProjectFacilityModel> projectFacilities,
          required final Map<String, String> facilityMap}) =
      _$ProjectFacilityFetchedStateImpl;

  List<ProjectFacilityModel> get projectFacilities;
  Map<String, String> get facilityMap;
  @JsonKey(ignore: true)
  _$$ProjectFacilityFetchedStateImplCopyWith<_$ProjectFacilityFetchedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

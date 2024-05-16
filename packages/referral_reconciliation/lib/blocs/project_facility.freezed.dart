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
mixin _$ReferralReconProjectFacilityEvent {
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
    required TResult Function(ProjectFacilityLoadForProjectEvent value)
        loadForProjectId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectFacilityLoadForProjectEvent value)?
        loadForProjectId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectFacilityLoadForProjectEvent value)?
        loadForProjectId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReferralReconProjectFacilityEventCopyWith<ReferralReconProjectFacilityEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralReconProjectFacilityEventCopyWith<$Res> {
  factory $ReferralReconProjectFacilityEventCopyWith(
          ReferralReconProjectFacilityEvent value,
          $Res Function(ReferralReconProjectFacilityEvent) then) =
      _$ReferralReconProjectFacilityEventCopyWithImpl<$Res,
          ReferralReconProjectFacilityEvent>;
  @useResult
  $Res call({String projectId, bool loadAllProjects});
}

/// @nodoc
class _$ReferralReconProjectFacilityEventCopyWithImpl<$Res,
        $Val extends ReferralReconProjectFacilityEvent>
    implements $ReferralReconProjectFacilityEventCopyWith<$Res> {
  _$ReferralReconProjectFacilityEventCopyWithImpl(this._value, this._then);

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
abstract class _$$ProjectFacilityLoadForProjectEventImplCopyWith<$Res>
    implements $ReferralReconProjectFacilityEventCopyWith<$Res> {
  factory _$$ProjectFacilityLoadForProjectEventImplCopyWith(
          _$ProjectFacilityLoadForProjectEventImpl value,
          $Res Function(_$ProjectFacilityLoadForProjectEventImpl) then) =
      __$$ProjectFacilityLoadForProjectEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String projectId, bool loadAllProjects});
}

/// @nodoc
class __$$ProjectFacilityLoadForProjectEventImplCopyWithImpl<$Res>
    extends _$ReferralReconProjectFacilityEventCopyWithImpl<$Res,
        _$ProjectFacilityLoadForProjectEventImpl>
    implements _$$ProjectFacilityLoadForProjectEventImplCopyWith<$Res> {
  __$$ProjectFacilityLoadForProjectEventImplCopyWithImpl(
      _$ProjectFacilityLoadForProjectEventImpl _value,
      $Res Function(_$ProjectFacilityLoadForProjectEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? loadAllProjects = null,
  }) {
    return _then(_$ProjectFacilityLoadForProjectEventImpl(
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

class _$ProjectFacilityLoadForProjectEventImpl
    implements ProjectFacilityLoadForProjectEvent {
  const _$ProjectFacilityLoadForProjectEventImpl(
      {required this.projectId, this.loadAllProjects = true});

  @override
  final String projectId;
  @override
  @JsonKey()
  final bool loadAllProjects;

  @override
  String toString() {
    return 'ReferralReconProjectFacilityEvent.loadForProjectId(projectId: $projectId, loadAllProjects: $loadAllProjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectFacilityLoadForProjectEventImpl &&
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
  _$$ProjectFacilityLoadForProjectEventImplCopyWith<
          _$ProjectFacilityLoadForProjectEventImpl>
      get copyWith => __$$ProjectFacilityLoadForProjectEventImplCopyWithImpl<
          _$ProjectFacilityLoadForProjectEventImpl>(this, _$identity);

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
    required TResult Function(ProjectFacilityLoadForProjectEvent value)
        loadForProjectId,
  }) {
    return loadForProjectId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectFacilityLoadForProjectEvent value)?
        loadForProjectId,
  }) {
    return loadForProjectId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectFacilityLoadForProjectEvent value)?
        loadForProjectId,
    required TResult orElse(),
  }) {
    if (loadForProjectId != null) {
      return loadForProjectId(this);
    }
    return orElse();
  }
}

abstract class ProjectFacilityLoadForProjectEvent
    implements ReferralReconProjectFacilityEvent {
  const factory ProjectFacilityLoadForProjectEvent(
      {required final String projectId,
      final bool loadAllProjects}) = _$ProjectFacilityLoadForProjectEventImpl;

  @override
  String get projectId;
  @override
  bool get loadAllProjects;
  @override
  @JsonKey(ignore: true)
  _$$ProjectFacilityLoadForProjectEventImplCopyWith<
          _$ProjectFacilityLoadForProjectEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReferralReconProjectFacilityState {
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
abstract class $ReferralReconProjectFacilityStateCopyWith<$Res> {
  factory $ReferralReconProjectFacilityStateCopyWith(
          ReferralReconProjectFacilityState value,
          $Res Function(ReferralReconProjectFacilityState) then) =
      _$ReferralReconProjectFacilityStateCopyWithImpl<$Res,
          ReferralReconProjectFacilityState>;
}

/// @nodoc
class _$ReferralReconProjectFacilityStateCopyWithImpl<$Res,
        $Val extends ReferralReconProjectFacilityState>
    implements $ReferralReconProjectFacilityStateCopyWith<$Res> {
  _$ReferralReconProjectFacilityStateCopyWithImpl(this._value, this._then);

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
    extends _$ReferralReconProjectFacilityStateCopyWithImpl<$Res,
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
    return 'ReferralReconProjectFacilityState.empty()';
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

abstract class ProjectFacilityEmptyState
    implements ReferralReconProjectFacilityState {
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
    extends _$ReferralReconProjectFacilityStateCopyWithImpl<$Res,
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
    return 'ReferralReconProjectFacilityState.loading()';
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

abstract class ProjectFacilityLoadingState
    implements ReferralReconProjectFacilityState {
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
  $Res call({List<ProjectFacilityModel> projectFacilities});
}

/// @nodoc
class __$$ProjectFacilityFetchedStateImplCopyWithImpl<$Res>
    extends _$ReferralReconProjectFacilityStateCopyWithImpl<$Res,
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
  }) {
    return _then(_$ProjectFacilityFetchedStateImpl(
      projectFacilities: null == projectFacilities
          ? _value._projectFacilities
          : projectFacilities // ignore: cast_nullable_to_non_nullable
              as List<ProjectFacilityModel>,
    ));
  }
}

/// @nodoc

class _$ProjectFacilityFetchedStateImpl implements ProjectFacilityFetchedState {
  const _$ProjectFacilityFetchedStateImpl(
      {required final List<ProjectFacilityModel> projectFacilities})
      : _projectFacilities = projectFacilities;

  final List<ProjectFacilityModel> _projectFacilities;
  @override
  List<ProjectFacilityModel> get projectFacilities {
    if (_projectFacilities is EqualUnmodifiableListView)
      return _projectFacilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectFacilities);
  }

  @override
  String toString() {
    return 'ReferralReconProjectFacilityState.fetched(projectFacilities: $projectFacilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectFacilityFetchedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._projectFacilities, _projectFacilities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_projectFacilities));

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

abstract class ProjectFacilityFetchedState
    implements ReferralReconProjectFacilityState {
  const factory ProjectFacilityFetchedState(
          {required final List<ProjectFacilityModel> projectFacilities}) =
      _$ProjectFacilityFetchedStateImpl;

  List<ProjectFacilityModel> get projectFacilities;
  @JsonKey(ignore: true)
  _$$ProjectFacilityFetchedStateImplCopyWith<_$ProjectFacilityFetchedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'facility.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$FacilityLoadForProjectEventCopyWith<$Res>
    implements $FacilityEventCopyWith<$Res> {
  factory _$$FacilityLoadForProjectEventCopyWith(
          _$FacilityLoadForProjectEvent value,
          $Res Function(_$FacilityLoadForProjectEvent) then) =
      __$$FacilityLoadForProjectEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String projectId, bool loadAllProjects});
}

/// @nodoc
class __$$FacilityLoadForProjectEventCopyWithImpl<$Res>
    extends _$FacilityEventCopyWithImpl<$Res, _$FacilityLoadForProjectEvent>
    implements _$$FacilityLoadForProjectEventCopyWith<$Res> {
  __$$FacilityLoadForProjectEventCopyWithImpl(
      _$FacilityLoadForProjectEvent _value,
      $Res Function(_$FacilityLoadForProjectEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? loadAllProjects = null,
  }) {
    return _then(_$FacilityLoadForProjectEvent(
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

class _$FacilityLoadForProjectEvent implements FacilityLoadForProjectEvent {
  const _$FacilityLoadForProjectEvent(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityLoadForProjectEvent &&
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
  _$$FacilityLoadForProjectEventCopyWith<_$FacilityLoadForProjectEvent>
      get copyWith => __$$FacilityLoadForProjectEventCopyWithImpl<
          _$FacilityLoadForProjectEvent>(this, _$identity);

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
      final bool loadAllProjects}) = _$FacilityLoadForProjectEvent;

  @override
  String get projectId;
  @override
  bool get loadAllProjects;
  @override
  @JsonKey(ignore: true)
  _$$FacilityLoadForProjectEventCopyWith<_$FacilityLoadForProjectEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FacilityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(
            List<FacilityModel> facilities, List<FacilityModel> allFacilities)
        fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(
            List<FacilityModel> facilities, List<FacilityModel> allFacilities)?
        fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(
            List<FacilityModel> facilities, List<FacilityModel> allFacilities)?
        fetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacilityEmptyState value) empty,
    required TResult Function(FacilityLoadingState value) loading,
    required TResult Function(FacilityFetchedState value) fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityEmptyState value)? empty,
    TResult? Function(FacilityLoadingState value)? loading,
    TResult? Function(FacilityFetchedState value)? fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityEmptyState value)? empty,
    TResult Function(FacilityLoadingState value)? loading,
    TResult Function(FacilityFetchedState value)? fetched,
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
abstract class _$$FacilityEmptyStateCopyWith<$Res> {
  factory _$$FacilityEmptyStateCopyWith(_$FacilityEmptyState value,
          $Res Function(_$FacilityEmptyState) then) =
      __$$FacilityEmptyStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FacilityEmptyStateCopyWithImpl<$Res>
    extends _$FacilityStateCopyWithImpl<$Res, _$FacilityEmptyState>
    implements _$$FacilityEmptyStateCopyWith<$Res> {
  __$$FacilityEmptyStateCopyWithImpl(
      _$FacilityEmptyState _value, $Res Function(_$FacilityEmptyState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FacilityEmptyState implements FacilityEmptyState {
  const _$FacilityEmptyState();

  @override
  String toString() {
    return 'FacilityState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FacilityEmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(
            List<FacilityModel> facilities, List<FacilityModel> allFacilities)
        fetched,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(
            List<FacilityModel> facilities, List<FacilityModel> allFacilities)?
        fetched,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(
            List<FacilityModel> facilities, List<FacilityModel> allFacilities)?
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
    required TResult Function(FacilityEmptyState value) empty,
    required TResult Function(FacilityLoadingState value) loading,
    required TResult Function(FacilityFetchedState value) fetched,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityEmptyState value)? empty,
    TResult? Function(FacilityLoadingState value)? loading,
    TResult? Function(FacilityFetchedState value)? fetched,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityEmptyState value)? empty,
    TResult Function(FacilityLoadingState value)? loading,
    TResult Function(FacilityFetchedState value)? fetched,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class FacilityEmptyState implements FacilityState {
  const factory FacilityEmptyState() = _$FacilityEmptyState;
}

/// @nodoc
abstract class _$$FacilityLoadingStateCopyWith<$Res> {
  factory _$$FacilityLoadingStateCopyWith(_$FacilityLoadingState value,
          $Res Function(_$FacilityLoadingState) then) =
      __$$FacilityLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FacilityLoadingStateCopyWithImpl<$Res>
    extends _$FacilityStateCopyWithImpl<$Res, _$FacilityLoadingState>
    implements _$$FacilityLoadingStateCopyWith<$Res> {
  __$$FacilityLoadingStateCopyWithImpl(_$FacilityLoadingState _value,
      $Res Function(_$FacilityLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FacilityLoadingState implements FacilityLoadingState {
  const _$FacilityLoadingState();

  @override
  String toString() {
    return 'FacilityState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FacilityLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(
            List<FacilityModel> facilities, List<FacilityModel> allFacilities)
        fetched,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(
            List<FacilityModel> facilities, List<FacilityModel> allFacilities)?
        fetched,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(
            List<FacilityModel> facilities, List<FacilityModel> allFacilities)?
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
    required TResult Function(FacilityEmptyState value) empty,
    required TResult Function(FacilityLoadingState value) loading,
    required TResult Function(FacilityFetchedState value) fetched,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityEmptyState value)? empty,
    TResult? Function(FacilityLoadingState value)? loading,
    TResult? Function(FacilityFetchedState value)? fetched,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityEmptyState value)? empty,
    TResult Function(FacilityLoadingState value)? loading,
    TResult Function(FacilityFetchedState value)? fetched,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FacilityLoadingState implements FacilityState {
  const factory FacilityLoadingState() = _$FacilityLoadingState;
}

/// @nodoc
abstract class _$$FacilityFetchedStateCopyWith<$Res> {
  factory _$$FacilityFetchedStateCopyWith(_$FacilityFetchedState value,
          $Res Function(_$FacilityFetchedState) then) =
      __$$FacilityFetchedStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<FacilityModel> facilities, List<FacilityModel> allFacilities});
}

/// @nodoc
class __$$FacilityFetchedStateCopyWithImpl<$Res>
    extends _$FacilityStateCopyWithImpl<$Res, _$FacilityFetchedState>
    implements _$$FacilityFetchedStateCopyWith<$Res> {
  __$$FacilityFetchedStateCopyWithImpl(_$FacilityFetchedState _value,
      $Res Function(_$FacilityFetchedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
    Object? allFacilities = null,
  }) {
    return _then(_$FacilityFetchedState(
      facilities: null == facilities
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<FacilityModel>,
      allFacilities: null == allFacilities
          ? _value._allFacilities
          : allFacilities // ignore: cast_nullable_to_non_nullable
              as List<FacilityModel>,
    ));
  }
}

/// @nodoc

class _$FacilityFetchedState implements FacilityFetchedState {
  const _$FacilityFetchedState(
      {required final List<FacilityModel> facilities,
      final List<FacilityModel> allFacilities = const []})
      : _facilities = facilities,
        _allFacilities = allFacilities;

  final List<FacilityModel> _facilities;
  @override
  List<FacilityModel> get facilities {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilities);
  }

  final List<FacilityModel> _allFacilities;
  @override
  @JsonKey()
  List<FacilityModel> get allFacilities {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allFacilities);
  }

  @override
  String toString() {
    return 'FacilityState.fetched(facilities: $facilities, allFacilities: $allFacilities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityFetchedState &&
            const DeepCollectionEquality()
                .equals(other._facilities, _facilities) &&
            const DeepCollectionEquality()
                .equals(other._allFacilities, _allFacilities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_facilities),
      const DeepCollectionEquality().hash(_allFacilities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityFetchedStateCopyWith<_$FacilityFetchedState> get copyWith =>
      __$$FacilityFetchedStateCopyWithImpl<_$FacilityFetchedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(
            List<FacilityModel> facilities, List<FacilityModel> allFacilities)
        fetched,
  }) {
    return fetched(facilities, allFacilities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(
            List<FacilityModel> facilities, List<FacilityModel> allFacilities)?
        fetched,
  }) {
    return fetched?.call(facilities, allFacilities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(
            List<FacilityModel> facilities, List<FacilityModel> allFacilities)?
        fetched,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(facilities, allFacilities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacilityEmptyState value) empty,
    required TResult Function(FacilityLoadingState value) loading,
    required TResult Function(FacilityFetchedState value) fetched,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityEmptyState value)? empty,
    TResult? Function(FacilityLoadingState value)? loading,
    TResult? Function(FacilityFetchedState value)? fetched,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityEmptyState value)? empty,
    TResult Function(FacilityLoadingState value)? loading,
    TResult Function(FacilityFetchedState value)? fetched,
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
      {required final List<FacilityModel> facilities,
      final List<FacilityModel> allFacilities}) = _$FacilityFetchedState;

  List<FacilityModel> get facilities;
  List<FacilityModel> get allFacilities;
  @JsonKey(ignore: true)
  _$$FacilityFetchedStateCopyWith<_$FacilityFetchedState> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parent_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ParentOverviewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IndividualModel individualModel)
        selectedIndividual,
    required TResult Function(
            String projectId,
            BeneficiaryType projectBeneficiaryType,
            int? offset,
            int? limit,
            List<String>? selectedFilter,
            String? searchByName)
        reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IndividualModel individualModel)? selectedIndividual,
    TResult? Function(
            String projectId,
            BeneficiaryType projectBeneficiaryType,
            int? offset,
            int? limit,
            List<String>? selectedFilter,
            String? searchByName)?
        reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IndividualModel individualModel)? selectedIndividual,
    TResult Function(
            String projectId,
            BeneficiaryType projectBeneficiaryType,
            int? offset,
            int? limit,
            List<String>? selectedFilter,
            String? searchByName)?
        reload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParentOverviewSelectIndividualEvent value)
        selectedIndividual,
    required TResult Function(ParentOverviewReloadEvent value) reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParentOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult? Function(ParentOverviewReloadEvent value)? reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParentOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult Function(ParentOverviewReloadEvent value)? reload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentOverviewEventCopyWith<$Res> {
  factory $ParentOverviewEventCopyWith(
          ParentOverviewEvent value, $Res Function(ParentOverviewEvent) then) =
      _$ParentOverviewEventCopyWithImpl<$Res, ParentOverviewEvent>;
}

/// @nodoc
class _$ParentOverviewEventCopyWithImpl<$Res, $Val extends ParentOverviewEvent>
    implements $ParentOverviewEventCopyWith<$Res> {
  _$ParentOverviewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ParentOverviewSelectIndividualEventImplCopyWith<$Res> {
  factory _$$ParentOverviewSelectIndividualEventImplCopyWith(
          _$ParentOverviewSelectIndividualEventImpl value,
          $Res Function(_$ParentOverviewSelectIndividualEventImpl) then) =
      __$$ParentOverviewSelectIndividualEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({IndividualModel individualModel});
}

/// @nodoc
class __$$ParentOverviewSelectIndividualEventImplCopyWithImpl<$Res>
    extends _$ParentOverviewEventCopyWithImpl<$Res,
        _$ParentOverviewSelectIndividualEventImpl>
    implements _$$ParentOverviewSelectIndividualEventImplCopyWith<$Res> {
  __$$ParentOverviewSelectIndividualEventImplCopyWithImpl(
      _$ParentOverviewSelectIndividualEventImpl _value,
      $Res Function(_$ParentOverviewSelectIndividualEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? individualModel = null,
  }) {
    return _then(_$ParentOverviewSelectIndividualEventImpl(
      individualModel: null == individualModel
          ? _value.individualModel
          : individualModel // ignore: cast_nullable_to_non_nullable
              as IndividualModel,
    ));
  }
}

/// @nodoc

class _$ParentOverviewSelectIndividualEventImpl
    implements ParentOverviewSelectIndividualEvent {
  const _$ParentOverviewSelectIndividualEventImpl(
      {required this.individualModel});

  @override
  final IndividualModel individualModel;

  @override
  String toString() {
    return 'ParentOverviewEvent.selectedIndividual(individualModel: $individualModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentOverviewSelectIndividualEventImpl &&
            (identical(other.individualModel, individualModel) ||
                other.individualModel == individualModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, individualModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentOverviewSelectIndividualEventImplCopyWith<
          _$ParentOverviewSelectIndividualEventImpl>
      get copyWith => __$$ParentOverviewSelectIndividualEventImplCopyWithImpl<
          _$ParentOverviewSelectIndividualEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IndividualModel individualModel)
        selectedIndividual,
    required TResult Function(
            String projectId,
            BeneficiaryType projectBeneficiaryType,
            int? offset,
            int? limit,
            List<String>? selectedFilter,
            String? searchByName)
        reload,
  }) {
    return selectedIndividual(individualModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IndividualModel individualModel)? selectedIndividual,
    TResult? Function(
            String projectId,
            BeneficiaryType projectBeneficiaryType,
            int? offset,
            int? limit,
            List<String>? selectedFilter,
            String? searchByName)?
        reload,
  }) {
    return selectedIndividual?.call(individualModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IndividualModel individualModel)? selectedIndividual,
    TResult Function(
            String projectId,
            BeneficiaryType projectBeneficiaryType,
            int? offset,
            int? limit,
            List<String>? selectedFilter,
            String? searchByName)?
        reload,
    required TResult orElse(),
  }) {
    if (selectedIndividual != null) {
      return selectedIndividual(individualModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParentOverviewSelectIndividualEvent value)
        selectedIndividual,
    required TResult Function(ParentOverviewReloadEvent value) reload,
  }) {
    return selectedIndividual(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParentOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult? Function(ParentOverviewReloadEvent value)? reload,
  }) {
    return selectedIndividual?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParentOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult Function(ParentOverviewReloadEvent value)? reload,
    required TResult orElse(),
  }) {
    if (selectedIndividual != null) {
      return selectedIndividual(this);
    }
    return orElse();
  }
}

abstract class ParentOverviewSelectIndividualEvent
    implements ParentOverviewEvent {
  const factory ParentOverviewSelectIndividualEvent(
          {required final IndividualModel individualModel}) =
      _$ParentOverviewSelectIndividualEventImpl;

  IndividualModel get individualModel;
  @JsonKey(ignore: true)
  _$$ParentOverviewSelectIndividualEventImplCopyWith<
          _$ParentOverviewSelectIndividualEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParentOverviewReloadEventImplCopyWith<$Res> {
  factory _$$ParentOverviewReloadEventImplCopyWith(
          _$ParentOverviewReloadEventImpl value,
          $Res Function(_$ParentOverviewReloadEventImpl) then) =
      __$$ParentOverviewReloadEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      BeneficiaryType projectBeneficiaryType,
      int? offset,
      int? limit,
      List<String>? selectedFilter,
      String? searchByName});
}

/// @nodoc
class __$$ParentOverviewReloadEventImplCopyWithImpl<$Res>
    extends _$ParentOverviewEventCopyWithImpl<$Res,
        _$ParentOverviewReloadEventImpl>
    implements _$$ParentOverviewReloadEventImplCopyWith<$Res> {
  __$$ParentOverviewReloadEventImplCopyWithImpl(
      _$ParentOverviewReloadEventImpl _value,
      $Res Function(_$ParentOverviewReloadEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? projectBeneficiaryType = null,
    Object? offset = freezed,
    Object? limit = freezed,
    Object? selectedFilter = freezed,
    Object? searchByName = freezed,
  }) {
    return _then(_$ParentOverviewReloadEventImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      projectBeneficiaryType: null == projectBeneficiaryType
          ? _value.projectBeneficiaryType
          : projectBeneficiaryType // ignore: cast_nullable_to_non_nullable
              as BeneficiaryType,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedFilter: freezed == selectedFilter
          ? _value._selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      searchByName: freezed == searchByName
          ? _value.searchByName
          : searchByName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ParentOverviewReloadEventImpl implements ParentOverviewReloadEvent {
  const _$ParentOverviewReloadEventImpl(
      {required this.projectId,
      required this.projectBeneficiaryType,
      this.offset,
      this.limit,
      final List<String>? selectedFilter,
      this.searchByName})
      : _selectedFilter = selectedFilter;

  @override
  final String projectId;
  @override
  final BeneficiaryType projectBeneficiaryType;
  @override
  final int? offset;
  @override
  final int? limit;
  final List<String>? _selectedFilter;
  @override
  List<String>? get selectedFilter {
    final value = _selectedFilter;
    if (value == null) return null;
    if (_selectedFilter is EqualUnmodifiableListView) return _selectedFilter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? searchByName;

  @override
  String toString() {
    return 'ParentOverviewEvent.reload(projectId: $projectId, projectBeneficiaryType: $projectBeneficiaryType, offset: $offset, limit: $limit, selectedFilter: $selectedFilter, searchByName: $searchByName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentOverviewReloadEventImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectBeneficiaryType, projectBeneficiaryType) ||
                other.projectBeneficiaryType == projectBeneficiaryType) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            const DeepCollectionEquality()
                .equals(other._selectedFilter, _selectedFilter) &&
            (identical(other.searchByName, searchByName) ||
                other.searchByName == searchByName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectId,
      projectBeneficiaryType,
      offset,
      limit,
      const DeepCollectionEquality().hash(_selectedFilter),
      searchByName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentOverviewReloadEventImplCopyWith<_$ParentOverviewReloadEventImpl>
      get copyWith => __$$ParentOverviewReloadEventImplCopyWithImpl<
          _$ParentOverviewReloadEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IndividualModel individualModel)
        selectedIndividual,
    required TResult Function(
            String projectId,
            BeneficiaryType projectBeneficiaryType,
            int? offset,
            int? limit,
            List<String>? selectedFilter,
            String? searchByName)
        reload,
  }) {
    return reload(projectId, projectBeneficiaryType, offset, limit,
        selectedFilter, searchByName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IndividualModel individualModel)? selectedIndividual,
    TResult? Function(
            String projectId,
            BeneficiaryType projectBeneficiaryType,
            int? offset,
            int? limit,
            List<String>? selectedFilter,
            String? searchByName)?
        reload,
  }) {
    return reload?.call(projectId, projectBeneficiaryType, offset, limit,
        selectedFilter, searchByName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IndividualModel individualModel)? selectedIndividual,
    TResult Function(
            String projectId,
            BeneficiaryType projectBeneficiaryType,
            int? offset,
            int? limit,
            List<String>? selectedFilter,
            String? searchByName)?
        reload,
    required TResult orElse(),
  }) {
    if (reload != null) {
      return reload(projectId, projectBeneficiaryType, offset, limit,
          selectedFilter, searchByName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParentOverviewSelectIndividualEvent value)
        selectedIndividual,
    required TResult Function(ParentOverviewReloadEvent value) reload,
  }) {
    return reload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParentOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult? Function(ParentOverviewReloadEvent value)? reload,
  }) {
    return reload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParentOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult Function(ParentOverviewReloadEvent value)? reload,
    required TResult orElse(),
  }) {
    if (reload != null) {
      return reload(this);
    }
    return orElse();
  }
}

abstract class ParentOverviewReloadEvent implements ParentOverviewEvent {
  const factory ParentOverviewReloadEvent(
      {required final String projectId,
      required final BeneficiaryType projectBeneficiaryType,
      final int? offset,
      final int? limit,
      final List<String>? selectedFilter,
      final String? searchByName}) = _$ParentOverviewReloadEventImpl;

  String get projectId;
  BeneficiaryType get projectBeneficiaryType;
  int? get offset;
  int? get limit;
  List<String>? get selectedFilter;
  String? get searchByName;
  @JsonKey(ignore: true)
  _$$ParentOverviewReloadEventImplCopyWith<_$ParentOverviewReloadEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ParentOverviewState {
  bool get loading => throw _privateConstructorUsedError;
  HouseholdMemberWrapper get householdMemberWrapper =>
      throw _privateConstructorUsedError;
  IndividualModel? get selectedIndividual => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ParentOverviewStateCopyWith<ParentOverviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentOverviewStateCopyWith<$Res> {
  factory $ParentOverviewStateCopyWith(
          ParentOverviewState value, $Res Function(ParentOverviewState) then) =
      _$ParentOverviewStateCopyWithImpl<$Res, ParentOverviewState>;
  @useResult
  $Res call(
      {bool loading,
      HouseholdMemberWrapper householdMemberWrapper,
      IndividualModel? selectedIndividual,
      int? offset,
      int? limit});

  $HouseholdMemberWrapperCopyWith<$Res> get householdMemberWrapper;
}

/// @nodoc
class _$ParentOverviewStateCopyWithImpl<$Res, $Val extends ParentOverviewState>
    implements $ParentOverviewStateCopyWith<$Res> {
  _$ParentOverviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? householdMemberWrapper = null,
    Object? selectedIndividual = freezed,
    Object? offset = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      householdMemberWrapper: null == householdMemberWrapper
          ? _value.householdMemberWrapper
          : householdMemberWrapper // ignore: cast_nullable_to_non_nullable
              as HouseholdMemberWrapper,
      selectedIndividual: freezed == selectedIndividual
          ? _value.selectedIndividual
          : selectedIndividual // ignore: cast_nullable_to_non_nullable
              as IndividualModel?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HouseholdMemberWrapperCopyWith<$Res> get householdMemberWrapper {
    return $HouseholdMemberWrapperCopyWith<$Res>(_value.householdMemberWrapper,
        (value) {
      return _then(_value.copyWith(householdMemberWrapper: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ParentOverviewStateImplCopyWith<$Res>
    implements $ParentOverviewStateCopyWith<$Res> {
  factory _$$ParentOverviewStateImplCopyWith(_$ParentOverviewStateImpl value,
          $Res Function(_$ParentOverviewStateImpl) then) =
      __$$ParentOverviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      HouseholdMemberWrapper householdMemberWrapper,
      IndividualModel? selectedIndividual,
      int? offset,
      int? limit});

  @override
  $HouseholdMemberWrapperCopyWith<$Res> get householdMemberWrapper;
}

/// @nodoc
class __$$ParentOverviewStateImplCopyWithImpl<$Res>
    extends _$ParentOverviewStateCopyWithImpl<$Res, _$ParentOverviewStateImpl>
    implements _$$ParentOverviewStateImplCopyWith<$Res> {
  __$$ParentOverviewStateImplCopyWithImpl(_$ParentOverviewStateImpl _value,
      $Res Function(_$ParentOverviewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? householdMemberWrapper = null,
    Object? selectedIndividual = freezed,
    Object? offset = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$ParentOverviewStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      householdMemberWrapper: null == householdMemberWrapper
          ? _value.householdMemberWrapper
          : householdMemberWrapper // ignore: cast_nullable_to_non_nullable
              as HouseholdMemberWrapper,
      selectedIndividual: freezed == selectedIndividual
          ? _value.selectedIndividual
          : selectedIndividual // ignore: cast_nullable_to_non_nullable
              as IndividualModel?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ParentOverviewStateImpl implements _ParentOverviewState {
  const _$ParentOverviewStateImpl(
      {this.loading = false,
      required this.householdMemberWrapper,
      this.selectedIndividual,
      this.offset,
      this.limit});

  @override
  @JsonKey()
  final bool loading;
  @override
  final HouseholdMemberWrapper householdMemberWrapper;
  @override
  final IndividualModel? selectedIndividual;
  @override
  final int? offset;
  @override
  final int? limit;

  @override
  String toString() {
    return 'ParentOverviewState(loading: $loading, householdMemberWrapper: $householdMemberWrapper, selectedIndividual: $selectedIndividual, offset: $offset, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentOverviewStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.householdMemberWrapper, householdMemberWrapper) ||
                other.householdMemberWrapper == householdMemberWrapper) &&
            (identical(other.selectedIndividual, selectedIndividual) ||
                other.selectedIndividual == selectedIndividual) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, householdMemberWrapper,
      selectedIndividual, offset, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentOverviewStateImplCopyWith<_$ParentOverviewStateImpl> get copyWith =>
      __$$ParentOverviewStateImplCopyWithImpl<_$ParentOverviewStateImpl>(
          this, _$identity);
}

abstract class _ParentOverviewState implements ParentOverviewState {
  const factory _ParentOverviewState(
      {final bool loading,
      required final HouseholdMemberWrapper householdMemberWrapper,
      final IndividualModel? selectedIndividual,
      final int? offset,
      final int? limit}) = _$ParentOverviewStateImpl;

  @override
  bool get loading;
  @override
  HouseholdMemberWrapper get householdMemberWrapper;
  @override
  IndividualModel? get selectedIndividual;
  @override
  int? get offset;
  @override
  int? get limit;
  @override
  @JsonKey(ignore: true)
  _$$ParentOverviewStateImplCopyWith<_$ParentOverviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

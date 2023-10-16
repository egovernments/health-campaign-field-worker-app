// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'household_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HouseholdOverviewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)
        deleteHousehold,
    required TResult Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)
        deleteIndividual,
    required TResult Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)
        setAsHead,
    required TResult Function(IndividualModel individualModel)
        selectedIndividual,
    required TResult Function(
            String projectId, BeneficiaryType projectBeneficiaryType)
        reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteHousehold,
    TResult? Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteIndividual,
    TResult? Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)?
        setAsHead,
    TResult? Function(IndividualModel individualModel)? selectedIndividual,
    TResult? Function(String projectId, BeneficiaryType projectBeneficiaryType)?
        reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteHousehold,
    TResult Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteIndividual,
    TResult Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)?
        setAsHead,
    TResult Function(IndividualModel individualModel)? selectedIndividual,
    TResult Function(String projectId, BeneficiaryType projectBeneficiaryType)?
        reload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HouseholdOverviewDeleteHouseholdEvent value)
        deleteHousehold,
    required TResult Function(HouseholdOverviewDeleteIndividualEvent value)
        deleteIndividual,
    required TResult Function(HouseholdOverviewSetAsHeadEvent value) setAsHead,
    required TResult Function(HouseholdOverviewSelectIndividualEvent value)
        selectedIndividual,
    required TResult Function(HouseholdOverviewReloadEvent value) reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HouseholdOverviewDeleteHouseholdEvent value)?
        deleteHousehold,
    TResult? Function(HouseholdOverviewDeleteIndividualEvent value)?
        deleteIndividual,
    TResult? Function(HouseholdOverviewSetAsHeadEvent value)? setAsHead,
    TResult? Function(HouseholdOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult? Function(HouseholdOverviewReloadEvent value)? reload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HouseholdOverviewDeleteHouseholdEvent value)?
        deleteHousehold,
    TResult Function(HouseholdOverviewDeleteIndividualEvent value)?
        deleteIndividual,
    TResult Function(HouseholdOverviewSetAsHeadEvent value)? setAsHead,
    TResult Function(HouseholdOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult Function(HouseholdOverviewReloadEvent value)? reload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdOverviewEventCopyWith<$Res> {
  factory $HouseholdOverviewEventCopyWith(HouseholdOverviewEvent value,
          $Res Function(HouseholdOverviewEvent) then) =
      _$HouseholdOverviewEventCopyWithImpl<$Res, HouseholdOverviewEvent>;
}

/// @nodoc
class _$HouseholdOverviewEventCopyWithImpl<$Res,
        $Val extends HouseholdOverviewEvent>
    implements $HouseholdOverviewEventCopyWith<$Res> {
  _$HouseholdOverviewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HouseholdOverviewDeleteHouseholdEventCopyWith<$Res> {
  factory _$$HouseholdOverviewDeleteHouseholdEventCopyWith(
          _$HouseholdOverviewDeleteHouseholdEvent value,
          $Res Function(_$HouseholdOverviewDeleteHouseholdEvent) then) =
      __$$HouseholdOverviewDeleteHouseholdEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      HouseholdModel householdModel,
      List<IndividualModel> members,
      ProjectBeneficiaryModel projectBeneficiaryModel,
      BeneficiaryType projectBeneficiaryType});
}

/// @nodoc
class __$$HouseholdOverviewDeleteHouseholdEventCopyWithImpl<$Res>
    extends _$HouseholdOverviewEventCopyWithImpl<$Res,
        _$HouseholdOverviewDeleteHouseholdEvent>
    implements _$$HouseholdOverviewDeleteHouseholdEventCopyWith<$Res> {
  __$$HouseholdOverviewDeleteHouseholdEventCopyWithImpl(
      _$HouseholdOverviewDeleteHouseholdEvent _value,
      $Res Function(_$HouseholdOverviewDeleteHouseholdEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? householdModel = null,
    Object? members = null,
    Object? projectBeneficiaryModel = null,
    Object? projectBeneficiaryType = null,
  }) {
    return _then(_$HouseholdOverviewDeleteHouseholdEvent(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      householdModel: null == householdModel
          ? _value.householdModel
          : householdModel // ignore: cast_nullable_to_non_nullable
              as HouseholdModel,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<IndividualModel>,
      projectBeneficiaryModel: null == projectBeneficiaryModel
          ? _value.projectBeneficiaryModel
          : projectBeneficiaryModel // ignore: cast_nullable_to_non_nullable
              as ProjectBeneficiaryModel,
      projectBeneficiaryType: null == projectBeneficiaryType
          ? _value.projectBeneficiaryType
          : projectBeneficiaryType // ignore: cast_nullable_to_non_nullable
              as BeneficiaryType,
    ));
  }
}

/// @nodoc

class _$HouseholdOverviewDeleteHouseholdEvent
    implements HouseholdOverviewDeleteHouseholdEvent {
  const _$HouseholdOverviewDeleteHouseholdEvent(
      {required this.projectId,
      required this.householdModel,
      required final List<IndividualModel> members,
      required this.projectBeneficiaryModel,
      required this.projectBeneficiaryType})
      : _members = members;

  @override
  final String projectId;
  @override
  final HouseholdModel householdModel;
  final List<IndividualModel> _members;
  @override
  List<IndividualModel> get members {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  final ProjectBeneficiaryModel projectBeneficiaryModel;
  @override
  final BeneficiaryType projectBeneficiaryType;

  @override
  String toString() {
    return 'HouseholdOverviewEvent.deleteHousehold(projectId: $projectId, householdModel: $householdModel, members: $members, projectBeneficiaryModel: $projectBeneficiaryModel, projectBeneficiaryType: $projectBeneficiaryType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdOverviewDeleteHouseholdEvent &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.householdModel, householdModel) ||
                other.householdModel == householdModel) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(
                    other.projectBeneficiaryModel, projectBeneficiaryModel) ||
                other.projectBeneficiaryModel == projectBeneficiaryModel) &&
            (identical(other.projectBeneficiaryType, projectBeneficiaryType) ||
                other.projectBeneficiaryType == projectBeneficiaryType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectId,
      householdModel,
      const DeepCollectionEquality().hash(_members),
      projectBeneficiaryModel,
      projectBeneficiaryType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdOverviewDeleteHouseholdEventCopyWith<
          _$HouseholdOverviewDeleteHouseholdEvent>
      get copyWith => __$$HouseholdOverviewDeleteHouseholdEventCopyWithImpl<
          _$HouseholdOverviewDeleteHouseholdEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)
        deleteHousehold,
    required TResult Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)
        deleteIndividual,
    required TResult Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)
        setAsHead,
    required TResult Function(IndividualModel individualModel)
        selectedIndividual,
    required TResult Function(
            String projectId, BeneficiaryType projectBeneficiaryType)
        reload,
  }) {
    return deleteHousehold(projectId, householdModel, members,
        projectBeneficiaryModel, projectBeneficiaryType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteHousehold,
    TResult? Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteIndividual,
    TResult? Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)?
        setAsHead,
    TResult? Function(IndividualModel individualModel)? selectedIndividual,
    TResult? Function(String projectId, BeneficiaryType projectBeneficiaryType)?
        reload,
  }) {
    return deleteHousehold?.call(projectId, householdModel, members,
        projectBeneficiaryModel, projectBeneficiaryType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteHousehold,
    TResult Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteIndividual,
    TResult Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)?
        setAsHead,
    TResult Function(IndividualModel individualModel)? selectedIndividual,
    TResult Function(String projectId, BeneficiaryType projectBeneficiaryType)?
        reload,
    required TResult orElse(),
  }) {
    if (deleteHousehold != null) {
      return deleteHousehold(projectId, householdModel, members,
          projectBeneficiaryModel, projectBeneficiaryType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HouseholdOverviewDeleteHouseholdEvent value)
        deleteHousehold,
    required TResult Function(HouseholdOverviewDeleteIndividualEvent value)
        deleteIndividual,
    required TResult Function(HouseholdOverviewSetAsHeadEvent value) setAsHead,
    required TResult Function(HouseholdOverviewSelectIndividualEvent value)
        selectedIndividual,
    required TResult Function(HouseholdOverviewReloadEvent value) reload,
  }) {
    return deleteHousehold(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HouseholdOverviewDeleteHouseholdEvent value)?
        deleteHousehold,
    TResult? Function(HouseholdOverviewDeleteIndividualEvent value)?
        deleteIndividual,
    TResult? Function(HouseholdOverviewSetAsHeadEvent value)? setAsHead,
    TResult? Function(HouseholdOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult? Function(HouseholdOverviewReloadEvent value)? reload,
  }) {
    return deleteHousehold?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HouseholdOverviewDeleteHouseholdEvent value)?
        deleteHousehold,
    TResult Function(HouseholdOverviewDeleteIndividualEvent value)?
        deleteIndividual,
    TResult Function(HouseholdOverviewSetAsHeadEvent value)? setAsHead,
    TResult Function(HouseholdOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult Function(HouseholdOverviewReloadEvent value)? reload,
    required TResult orElse(),
  }) {
    if (deleteHousehold != null) {
      return deleteHousehold(this);
    }
    return orElse();
  }
}

abstract class HouseholdOverviewDeleteHouseholdEvent
    implements HouseholdOverviewEvent {
  const factory HouseholdOverviewDeleteHouseholdEvent(
          {required final String projectId,
          required final HouseholdModel householdModel,
          required final List<IndividualModel> members,
          required final ProjectBeneficiaryModel projectBeneficiaryModel,
          required final BeneficiaryType projectBeneficiaryType}) =
      _$HouseholdOverviewDeleteHouseholdEvent;

  String get projectId;
  HouseholdModel get householdModel;
  List<IndividualModel> get members;
  ProjectBeneficiaryModel get projectBeneficiaryModel;
  BeneficiaryType get projectBeneficiaryType;
  @JsonKey(ignore: true)
  _$$HouseholdOverviewDeleteHouseholdEventCopyWith<
          _$HouseholdOverviewDeleteHouseholdEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HouseholdOverviewDeleteIndividualEventCopyWith<$Res> {
  factory _$$HouseholdOverviewDeleteIndividualEventCopyWith(
          _$HouseholdOverviewDeleteIndividualEvent value,
          $Res Function(_$HouseholdOverviewDeleteIndividualEvent) then) =
      __$$HouseholdOverviewDeleteIndividualEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      HouseholdModel householdModel,
      IndividualModel individualModel,
      BeneficiaryType projectBeneficiaryType});
}

/// @nodoc
class __$$HouseholdOverviewDeleteIndividualEventCopyWithImpl<$Res>
    extends _$HouseholdOverviewEventCopyWithImpl<$Res,
        _$HouseholdOverviewDeleteIndividualEvent>
    implements _$$HouseholdOverviewDeleteIndividualEventCopyWith<$Res> {
  __$$HouseholdOverviewDeleteIndividualEventCopyWithImpl(
      _$HouseholdOverviewDeleteIndividualEvent _value,
      $Res Function(_$HouseholdOverviewDeleteIndividualEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? householdModel = null,
    Object? individualModel = null,
    Object? projectBeneficiaryType = null,
  }) {
    return _then(_$HouseholdOverviewDeleteIndividualEvent(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      householdModel: null == householdModel
          ? _value.householdModel
          : householdModel // ignore: cast_nullable_to_non_nullable
              as HouseholdModel,
      individualModel: null == individualModel
          ? _value.individualModel
          : individualModel // ignore: cast_nullable_to_non_nullable
              as IndividualModel,
      projectBeneficiaryType: null == projectBeneficiaryType
          ? _value.projectBeneficiaryType
          : projectBeneficiaryType // ignore: cast_nullable_to_non_nullable
              as BeneficiaryType,
    ));
  }
}

/// @nodoc

class _$HouseholdOverviewDeleteIndividualEvent
    implements HouseholdOverviewDeleteIndividualEvent {
  const _$HouseholdOverviewDeleteIndividualEvent(
      {required this.projectId,
      required this.householdModel,
      required this.individualModel,
      required this.projectBeneficiaryType});

  @override
  final String projectId;
  @override
  final HouseholdModel householdModel;
  @override
  final IndividualModel individualModel;
  @override
  final BeneficiaryType projectBeneficiaryType;

  @override
  String toString() {
    return 'HouseholdOverviewEvent.deleteIndividual(projectId: $projectId, householdModel: $householdModel, individualModel: $individualModel, projectBeneficiaryType: $projectBeneficiaryType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdOverviewDeleteIndividualEvent &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.householdModel, householdModel) ||
                other.householdModel == householdModel) &&
            (identical(other.individualModel, individualModel) ||
                other.individualModel == individualModel) &&
            (identical(other.projectBeneficiaryType, projectBeneficiaryType) ||
                other.projectBeneficiaryType == projectBeneficiaryType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId, householdModel,
      individualModel, projectBeneficiaryType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdOverviewDeleteIndividualEventCopyWith<
          _$HouseholdOverviewDeleteIndividualEvent>
      get copyWith => __$$HouseholdOverviewDeleteIndividualEventCopyWithImpl<
          _$HouseholdOverviewDeleteIndividualEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)
        deleteHousehold,
    required TResult Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)
        deleteIndividual,
    required TResult Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)
        setAsHead,
    required TResult Function(IndividualModel individualModel)
        selectedIndividual,
    required TResult Function(
            String projectId, BeneficiaryType projectBeneficiaryType)
        reload,
  }) {
    return deleteIndividual(
        projectId, householdModel, individualModel, projectBeneficiaryType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteHousehold,
    TResult? Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteIndividual,
    TResult? Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)?
        setAsHead,
    TResult? Function(IndividualModel individualModel)? selectedIndividual,
    TResult? Function(String projectId, BeneficiaryType projectBeneficiaryType)?
        reload,
  }) {
    return deleteIndividual?.call(
        projectId, householdModel, individualModel, projectBeneficiaryType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteHousehold,
    TResult Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteIndividual,
    TResult Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)?
        setAsHead,
    TResult Function(IndividualModel individualModel)? selectedIndividual,
    TResult Function(String projectId, BeneficiaryType projectBeneficiaryType)?
        reload,
    required TResult orElse(),
  }) {
    if (deleteIndividual != null) {
      return deleteIndividual(
          projectId, householdModel, individualModel, projectBeneficiaryType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HouseholdOverviewDeleteHouseholdEvent value)
        deleteHousehold,
    required TResult Function(HouseholdOverviewDeleteIndividualEvent value)
        deleteIndividual,
    required TResult Function(HouseholdOverviewSetAsHeadEvent value) setAsHead,
    required TResult Function(HouseholdOverviewSelectIndividualEvent value)
        selectedIndividual,
    required TResult Function(HouseholdOverviewReloadEvent value) reload,
  }) {
    return deleteIndividual(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HouseholdOverviewDeleteHouseholdEvent value)?
        deleteHousehold,
    TResult? Function(HouseholdOverviewDeleteIndividualEvent value)?
        deleteIndividual,
    TResult? Function(HouseholdOverviewSetAsHeadEvent value)? setAsHead,
    TResult? Function(HouseholdOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult? Function(HouseholdOverviewReloadEvent value)? reload,
  }) {
    return deleteIndividual?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HouseholdOverviewDeleteHouseholdEvent value)?
        deleteHousehold,
    TResult Function(HouseholdOverviewDeleteIndividualEvent value)?
        deleteIndividual,
    TResult Function(HouseholdOverviewSetAsHeadEvent value)? setAsHead,
    TResult Function(HouseholdOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult Function(HouseholdOverviewReloadEvent value)? reload,
    required TResult orElse(),
  }) {
    if (deleteIndividual != null) {
      return deleteIndividual(this);
    }
    return orElse();
  }
}

abstract class HouseholdOverviewDeleteIndividualEvent
    implements HouseholdOverviewEvent {
  const factory HouseholdOverviewDeleteIndividualEvent(
          {required final String projectId,
          required final HouseholdModel householdModel,
          required final IndividualModel individualModel,
          required final BeneficiaryType projectBeneficiaryType}) =
      _$HouseholdOverviewDeleteIndividualEvent;

  String get projectId;
  HouseholdModel get householdModel;
  IndividualModel get individualModel;
  BeneficiaryType get projectBeneficiaryType;
  @JsonKey(ignore: true)
  _$$HouseholdOverviewDeleteIndividualEventCopyWith<
          _$HouseholdOverviewDeleteIndividualEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HouseholdOverviewSetAsHeadEventCopyWith<$Res> {
  factory _$$HouseholdOverviewSetAsHeadEventCopyWith(
          _$HouseholdOverviewSetAsHeadEvent value,
          $Res Function(_$HouseholdOverviewSetAsHeadEvent) then) =
      __$$HouseholdOverviewSetAsHeadEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      IndividualModel individualModel,
      HouseholdModel householdModel,
      BeneficiaryType projectBeneficiaryType});
}

/// @nodoc
class __$$HouseholdOverviewSetAsHeadEventCopyWithImpl<$Res>
    extends _$HouseholdOverviewEventCopyWithImpl<$Res,
        _$HouseholdOverviewSetAsHeadEvent>
    implements _$$HouseholdOverviewSetAsHeadEventCopyWith<$Res> {
  __$$HouseholdOverviewSetAsHeadEventCopyWithImpl(
      _$HouseholdOverviewSetAsHeadEvent _value,
      $Res Function(_$HouseholdOverviewSetAsHeadEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? individualModel = null,
    Object? householdModel = null,
    Object? projectBeneficiaryType = null,
  }) {
    return _then(_$HouseholdOverviewSetAsHeadEvent(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      individualModel: null == individualModel
          ? _value.individualModel
          : individualModel // ignore: cast_nullable_to_non_nullable
              as IndividualModel,
      householdModel: null == householdModel
          ? _value.householdModel
          : householdModel // ignore: cast_nullable_to_non_nullable
              as HouseholdModel,
      projectBeneficiaryType: null == projectBeneficiaryType
          ? _value.projectBeneficiaryType
          : projectBeneficiaryType // ignore: cast_nullable_to_non_nullable
              as BeneficiaryType,
    ));
  }
}

/// @nodoc

class _$HouseholdOverviewSetAsHeadEvent
    implements HouseholdOverviewSetAsHeadEvent {
  const _$HouseholdOverviewSetAsHeadEvent(
      {required this.projectId,
      required this.individualModel,
      required this.householdModel,
      required this.projectBeneficiaryType});

  @override
  final String projectId;
  @override
  final IndividualModel individualModel;
  @override
  final HouseholdModel householdModel;
  @override
  final BeneficiaryType projectBeneficiaryType;

  @override
  String toString() {
    return 'HouseholdOverviewEvent.setAsHead(projectId: $projectId, individualModel: $individualModel, householdModel: $householdModel, projectBeneficiaryType: $projectBeneficiaryType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdOverviewSetAsHeadEvent &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.individualModel, individualModel) ||
                other.individualModel == individualModel) &&
            (identical(other.householdModel, householdModel) ||
                other.householdModel == householdModel) &&
            (identical(other.projectBeneficiaryType, projectBeneficiaryType) ||
                other.projectBeneficiaryType == projectBeneficiaryType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId, individualModel,
      householdModel, projectBeneficiaryType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdOverviewSetAsHeadEventCopyWith<_$HouseholdOverviewSetAsHeadEvent>
      get copyWith => __$$HouseholdOverviewSetAsHeadEventCopyWithImpl<
          _$HouseholdOverviewSetAsHeadEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)
        deleteHousehold,
    required TResult Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)
        deleteIndividual,
    required TResult Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)
        setAsHead,
    required TResult Function(IndividualModel individualModel)
        selectedIndividual,
    required TResult Function(
            String projectId, BeneficiaryType projectBeneficiaryType)
        reload,
  }) {
    return setAsHead(
        projectId, individualModel, householdModel, projectBeneficiaryType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteHousehold,
    TResult? Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteIndividual,
    TResult? Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)?
        setAsHead,
    TResult? Function(IndividualModel individualModel)? selectedIndividual,
    TResult? Function(String projectId, BeneficiaryType projectBeneficiaryType)?
        reload,
  }) {
    return setAsHead?.call(
        projectId, individualModel, householdModel, projectBeneficiaryType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteHousehold,
    TResult Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteIndividual,
    TResult Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)?
        setAsHead,
    TResult Function(IndividualModel individualModel)? selectedIndividual,
    TResult Function(String projectId, BeneficiaryType projectBeneficiaryType)?
        reload,
    required TResult orElse(),
  }) {
    if (setAsHead != null) {
      return setAsHead(
          projectId, individualModel, householdModel, projectBeneficiaryType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HouseholdOverviewDeleteHouseholdEvent value)
        deleteHousehold,
    required TResult Function(HouseholdOverviewDeleteIndividualEvent value)
        deleteIndividual,
    required TResult Function(HouseholdOverviewSetAsHeadEvent value) setAsHead,
    required TResult Function(HouseholdOverviewSelectIndividualEvent value)
        selectedIndividual,
    required TResult Function(HouseholdOverviewReloadEvent value) reload,
  }) {
    return setAsHead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HouseholdOverviewDeleteHouseholdEvent value)?
        deleteHousehold,
    TResult? Function(HouseholdOverviewDeleteIndividualEvent value)?
        deleteIndividual,
    TResult? Function(HouseholdOverviewSetAsHeadEvent value)? setAsHead,
    TResult? Function(HouseholdOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult? Function(HouseholdOverviewReloadEvent value)? reload,
  }) {
    return setAsHead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HouseholdOverviewDeleteHouseholdEvent value)?
        deleteHousehold,
    TResult Function(HouseholdOverviewDeleteIndividualEvent value)?
        deleteIndividual,
    TResult Function(HouseholdOverviewSetAsHeadEvent value)? setAsHead,
    TResult Function(HouseholdOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult Function(HouseholdOverviewReloadEvent value)? reload,
    required TResult orElse(),
  }) {
    if (setAsHead != null) {
      return setAsHead(this);
    }
    return orElse();
  }
}

abstract class HouseholdOverviewSetAsHeadEvent
    implements HouseholdOverviewEvent {
  const factory HouseholdOverviewSetAsHeadEvent(
          {required final String projectId,
          required final IndividualModel individualModel,
          required final HouseholdModel householdModel,
          required final BeneficiaryType projectBeneficiaryType}) =
      _$HouseholdOverviewSetAsHeadEvent;

  String get projectId;
  IndividualModel get individualModel;
  HouseholdModel get householdModel;
  BeneficiaryType get projectBeneficiaryType;
  @JsonKey(ignore: true)
  _$$HouseholdOverviewSetAsHeadEventCopyWith<_$HouseholdOverviewSetAsHeadEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HouseholdOverviewSelectIndividualEventCopyWith<$Res> {
  factory _$$HouseholdOverviewSelectIndividualEventCopyWith(
          _$HouseholdOverviewSelectIndividualEvent value,
          $Res Function(_$HouseholdOverviewSelectIndividualEvent) then) =
      __$$HouseholdOverviewSelectIndividualEventCopyWithImpl<$Res>;
  @useResult
  $Res call({IndividualModel individualModel});
}

/// @nodoc
class __$$HouseholdOverviewSelectIndividualEventCopyWithImpl<$Res>
    extends _$HouseholdOverviewEventCopyWithImpl<$Res,
        _$HouseholdOverviewSelectIndividualEvent>
    implements _$$HouseholdOverviewSelectIndividualEventCopyWith<$Res> {
  __$$HouseholdOverviewSelectIndividualEventCopyWithImpl(
      _$HouseholdOverviewSelectIndividualEvent _value,
      $Res Function(_$HouseholdOverviewSelectIndividualEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? individualModel = null,
  }) {
    return _then(_$HouseholdOverviewSelectIndividualEvent(
      individualModel: null == individualModel
          ? _value.individualModel
          : individualModel // ignore: cast_nullable_to_non_nullable
              as IndividualModel,
    ));
  }
}

/// @nodoc

class _$HouseholdOverviewSelectIndividualEvent
    implements HouseholdOverviewSelectIndividualEvent {
  const _$HouseholdOverviewSelectIndividualEvent(
      {required this.individualModel});

  @override
  final IndividualModel individualModel;

  @override
  String toString() {
    return 'HouseholdOverviewEvent.selectedIndividual(individualModel: $individualModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdOverviewSelectIndividualEvent &&
            (identical(other.individualModel, individualModel) ||
                other.individualModel == individualModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, individualModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdOverviewSelectIndividualEventCopyWith<
          _$HouseholdOverviewSelectIndividualEvent>
      get copyWith => __$$HouseholdOverviewSelectIndividualEventCopyWithImpl<
          _$HouseholdOverviewSelectIndividualEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)
        deleteHousehold,
    required TResult Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)
        deleteIndividual,
    required TResult Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)
        setAsHead,
    required TResult Function(IndividualModel individualModel)
        selectedIndividual,
    required TResult Function(
            String projectId, BeneficiaryType projectBeneficiaryType)
        reload,
  }) {
    return selectedIndividual(individualModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteHousehold,
    TResult? Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteIndividual,
    TResult? Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)?
        setAsHead,
    TResult? Function(IndividualModel individualModel)? selectedIndividual,
    TResult? Function(String projectId, BeneficiaryType projectBeneficiaryType)?
        reload,
  }) {
    return selectedIndividual?.call(individualModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteHousehold,
    TResult Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteIndividual,
    TResult Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)?
        setAsHead,
    TResult Function(IndividualModel individualModel)? selectedIndividual,
    TResult Function(String projectId, BeneficiaryType projectBeneficiaryType)?
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
    required TResult Function(HouseholdOverviewDeleteHouseholdEvent value)
        deleteHousehold,
    required TResult Function(HouseholdOverviewDeleteIndividualEvent value)
        deleteIndividual,
    required TResult Function(HouseholdOverviewSetAsHeadEvent value) setAsHead,
    required TResult Function(HouseholdOverviewSelectIndividualEvent value)
        selectedIndividual,
    required TResult Function(HouseholdOverviewReloadEvent value) reload,
  }) {
    return selectedIndividual(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HouseholdOverviewDeleteHouseholdEvent value)?
        deleteHousehold,
    TResult? Function(HouseholdOverviewDeleteIndividualEvent value)?
        deleteIndividual,
    TResult? Function(HouseholdOverviewSetAsHeadEvent value)? setAsHead,
    TResult? Function(HouseholdOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult? Function(HouseholdOverviewReloadEvent value)? reload,
  }) {
    return selectedIndividual?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HouseholdOverviewDeleteHouseholdEvent value)?
        deleteHousehold,
    TResult Function(HouseholdOverviewDeleteIndividualEvent value)?
        deleteIndividual,
    TResult Function(HouseholdOverviewSetAsHeadEvent value)? setAsHead,
    TResult Function(HouseholdOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult Function(HouseholdOverviewReloadEvent value)? reload,
    required TResult orElse(),
  }) {
    if (selectedIndividual != null) {
      return selectedIndividual(this);
    }
    return orElse();
  }
}

abstract class HouseholdOverviewSelectIndividualEvent
    implements HouseholdOverviewEvent {
  const factory HouseholdOverviewSelectIndividualEvent(
          {required final IndividualModel individualModel}) =
      _$HouseholdOverviewSelectIndividualEvent;

  IndividualModel get individualModel;
  @JsonKey(ignore: true)
  _$$HouseholdOverviewSelectIndividualEventCopyWith<
          _$HouseholdOverviewSelectIndividualEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HouseholdOverviewReloadEventCopyWith<$Res> {
  factory _$$HouseholdOverviewReloadEventCopyWith(
          _$HouseholdOverviewReloadEvent value,
          $Res Function(_$HouseholdOverviewReloadEvent) then) =
      __$$HouseholdOverviewReloadEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectId, BeneficiaryType projectBeneficiaryType});
}

/// @nodoc
class __$$HouseholdOverviewReloadEventCopyWithImpl<$Res>
    extends _$HouseholdOverviewEventCopyWithImpl<$Res,
        _$HouseholdOverviewReloadEvent>
    implements _$$HouseholdOverviewReloadEventCopyWith<$Res> {
  __$$HouseholdOverviewReloadEventCopyWithImpl(
      _$HouseholdOverviewReloadEvent _value,
      $Res Function(_$HouseholdOverviewReloadEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? projectBeneficiaryType = null,
  }) {
    return _then(_$HouseholdOverviewReloadEvent(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      projectBeneficiaryType: null == projectBeneficiaryType
          ? _value.projectBeneficiaryType
          : projectBeneficiaryType // ignore: cast_nullable_to_non_nullable
              as BeneficiaryType,
    ));
  }
}

/// @nodoc

class _$HouseholdOverviewReloadEvent implements HouseholdOverviewReloadEvent {
  const _$HouseholdOverviewReloadEvent(
      {required this.projectId, required this.projectBeneficiaryType});

  @override
  final String projectId;
  @override
  final BeneficiaryType projectBeneficiaryType;

  @override
  String toString() {
    return 'HouseholdOverviewEvent.reload(projectId: $projectId, projectBeneficiaryType: $projectBeneficiaryType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdOverviewReloadEvent &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectBeneficiaryType, projectBeneficiaryType) ||
                other.projectBeneficiaryType == projectBeneficiaryType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, projectId, projectBeneficiaryType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdOverviewReloadEventCopyWith<_$HouseholdOverviewReloadEvent>
      get copyWith => __$$HouseholdOverviewReloadEventCopyWithImpl<
          _$HouseholdOverviewReloadEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)
        deleteHousehold,
    required TResult Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)
        deleteIndividual,
    required TResult Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)
        setAsHead,
    required TResult Function(IndividualModel individualModel)
        selectedIndividual,
    required TResult Function(
            String projectId, BeneficiaryType projectBeneficiaryType)
        reload,
  }) {
    return reload(projectId, projectBeneficiaryType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteHousehold,
    TResult? Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteIndividual,
    TResult? Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)?
        setAsHead,
    TResult? Function(IndividualModel individualModel)? selectedIndividual,
    TResult? Function(String projectId, BeneficiaryType projectBeneficiaryType)?
        reload,
  }) {
    return reload?.call(projectId, projectBeneficiaryType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String projectId,
            HouseholdModel householdModel,
            List<IndividualModel> members,
            ProjectBeneficiaryModel projectBeneficiaryModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteHousehold,
    TResult Function(
            String projectId,
            HouseholdModel householdModel,
            IndividualModel individualModel,
            BeneficiaryType projectBeneficiaryType)?
        deleteIndividual,
    TResult Function(
            String projectId,
            IndividualModel individualModel,
            HouseholdModel householdModel,
            BeneficiaryType projectBeneficiaryType)?
        setAsHead,
    TResult Function(IndividualModel individualModel)? selectedIndividual,
    TResult Function(String projectId, BeneficiaryType projectBeneficiaryType)?
        reload,
    required TResult orElse(),
  }) {
    if (reload != null) {
      return reload(projectId, projectBeneficiaryType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HouseholdOverviewDeleteHouseholdEvent value)
        deleteHousehold,
    required TResult Function(HouseholdOverviewDeleteIndividualEvent value)
        deleteIndividual,
    required TResult Function(HouseholdOverviewSetAsHeadEvent value) setAsHead,
    required TResult Function(HouseholdOverviewSelectIndividualEvent value)
        selectedIndividual,
    required TResult Function(HouseholdOverviewReloadEvent value) reload,
  }) {
    return reload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HouseholdOverviewDeleteHouseholdEvent value)?
        deleteHousehold,
    TResult? Function(HouseholdOverviewDeleteIndividualEvent value)?
        deleteIndividual,
    TResult? Function(HouseholdOverviewSetAsHeadEvent value)? setAsHead,
    TResult? Function(HouseholdOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult? Function(HouseholdOverviewReloadEvent value)? reload,
  }) {
    return reload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HouseholdOverviewDeleteHouseholdEvent value)?
        deleteHousehold,
    TResult Function(HouseholdOverviewDeleteIndividualEvent value)?
        deleteIndividual,
    TResult Function(HouseholdOverviewSetAsHeadEvent value)? setAsHead,
    TResult Function(HouseholdOverviewSelectIndividualEvent value)?
        selectedIndividual,
    TResult Function(HouseholdOverviewReloadEvent value)? reload,
    required TResult orElse(),
  }) {
    if (reload != null) {
      return reload(this);
    }
    return orElse();
  }
}

abstract class HouseholdOverviewReloadEvent implements HouseholdOverviewEvent {
  const factory HouseholdOverviewReloadEvent(
          {required final String projectId,
          required final BeneficiaryType projectBeneficiaryType}) =
      _$HouseholdOverviewReloadEvent;

  String get projectId;
  BeneficiaryType get projectBeneficiaryType;
  @JsonKey(ignore: true)
  _$$HouseholdOverviewReloadEventCopyWith<_$HouseholdOverviewReloadEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HouseholdOverviewState {
  bool get loading => throw _privateConstructorUsedError;
  HouseholdMemberWrapper get householdMemberWrapper =>
      throw _privateConstructorUsedError;
  IndividualModel? get selectedIndividual => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HouseholdOverviewStateCopyWith<HouseholdOverviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdOverviewStateCopyWith<$Res> {
  factory $HouseholdOverviewStateCopyWith(HouseholdOverviewState value,
          $Res Function(HouseholdOverviewState) then) =
      _$HouseholdOverviewStateCopyWithImpl<$Res, HouseholdOverviewState>;
  @useResult
  $Res call(
      {bool loading,
      HouseholdMemberWrapper householdMemberWrapper,
      IndividualModel? selectedIndividual});

  $HouseholdMemberWrapperCopyWith<$Res> get householdMemberWrapper;
}

/// @nodoc
class _$HouseholdOverviewStateCopyWithImpl<$Res,
        $Val extends HouseholdOverviewState>
    implements $HouseholdOverviewStateCopyWith<$Res> {
  _$HouseholdOverviewStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_HouseholdOverviewStateCopyWith<$Res>
    implements $HouseholdOverviewStateCopyWith<$Res> {
  factory _$$_HouseholdOverviewStateCopyWith(_$_HouseholdOverviewState value,
          $Res Function(_$_HouseholdOverviewState) then) =
      __$$_HouseholdOverviewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      HouseholdMemberWrapper householdMemberWrapper,
      IndividualModel? selectedIndividual});

  @override
  $HouseholdMemberWrapperCopyWith<$Res> get householdMemberWrapper;
}

/// @nodoc
class __$$_HouseholdOverviewStateCopyWithImpl<$Res>
    extends _$HouseholdOverviewStateCopyWithImpl<$Res,
        _$_HouseholdOverviewState>
    implements _$$_HouseholdOverviewStateCopyWith<$Res> {
  __$$_HouseholdOverviewStateCopyWithImpl(_$_HouseholdOverviewState _value,
      $Res Function(_$_HouseholdOverviewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? householdMemberWrapper = null,
    Object? selectedIndividual = freezed,
  }) {
    return _then(_$_HouseholdOverviewState(
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
    ));
  }
}

/// @nodoc

class _$_HouseholdOverviewState implements _HouseholdOverviewState {
  const _$_HouseholdOverviewState(
      {this.loading = false,
      required this.householdMemberWrapper,
      this.selectedIndividual});

  @override
  @JsonKey()
  final bool loading;
  @override
  final HouseholdMemberWrapper householdMemberWrapper;
  @override
  final IndividualModel? selectedIndividual;

  @override
  String toString() {
    return 'HouseholdOverviewState(loading: $loading, householdMemberWrapper: $householdMemberWrapper, selectedIndividual: $selectedIndividual)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HouseholdOverviewState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.householdMemberWrapper, householdMemberWrapper) ||
                other.householdMemberWrapper == householdMemberWrapper) &&
            (identical(other.selectedIndividual, selectedIndividual) ||
                other.selectedIndividual == selectedIndividual));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, householdMemberWrapper, selectedIndividual);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HouseholdOverviewStateCopyWith<_$_HouseholdOverviewState> get copyWith =>
      __$$_HouseholdOverviewStateCopyWithImpl<_$_HouseholdOverviewState>(
          this, _$identity);
}

abstract class _HouseholdOverviewState implements HouseholdOverviewState {
  const factory _HouseholdOverviewState(
      {final bool loading,
      required final HouseholdMemberWrapper householdMemberWrapper,
      final IndividualModel? selectedIndividual}) = _$_HouseholdOverviewState;

  @override
  bool get loading;
  @override
  HouseholdMemberWrapper get householdMemberWrapper;
  @override
  IndividualModel? get selectedIndividual;
  @override
  @JsonKey(ignore: true)
  _$$_HouseholdOverviewStateCopyWith<_$_HouseholdOverviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deliver_intervention.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeliverInterventionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TaskModel task,
            bool isEditing,
            BoundaryModel boundaryModel,
            bool navigateToSummary,
            HouseholdMemberDeliveryWrapper? householdMemberWrapper)
        handleSubmit,
    required TResult Function(TaskSearchModel taskSearch) handleSearch,
    required TResult Function(
            int dose, ProjectCycle cycle, IndividualModel? individualModel)
        selectFutureCycleDose,
    required TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectTypeModel projectType)
        setActiveCycleDose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TaskModel task,
            bool isEditing,
            BoundaryModel boundaryModel,
            bool navigateToSummary,
            HouseholdMemberDeliveryWrapper? householdMemberWrapper)?
        handleSubmit,
    TResult? Function(TaskSearchModel taskSearch)? handleSearch,
    TResult? Function(
            int dose, ProjectCycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult? Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectTypeModel projectType)?
        setActiveCycleDose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TaskModel task,
            bool isEditing,
            BoundaryModel boundaryModel,
            bool navigateToSummary,
            HouseholdMemberDeliveryWrapper? householdMemberWrapper)?
        handleSubmit,
    TResult Function(TaskSearchModel taskSearch)? handleSearch,
    TResult Function(
            int dose, ProjectCycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectTypeModel projectType)?
        setActiveCycleDose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeliverInterventionSubmitEvent value)
        handleSubmit,
    required TResult Function(DeliverInterventionSearchEvent value)
        handleSearch,
    required TResult Function(
            DeliverInterventionCycleFutureDoseSelectionEvent value)
        selectFutureCycleDose,
    required TResult Function(
            DeliverInterventionActiveCycleDoseSelectionEvent value)
        setActiveCycleDose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult? Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult? Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult? Function(DeliverInterventionActiveCycleDoseSelectionEvent value)?
        setActiveCycleDose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult Function(DeliverInterventionActiveCycleDoseSelectionEvent value)?
        setActiveCycleDose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliverInterventionEventCopyWith<$Res> {
  factory $DeliverInterventionEventCopyWith(DeliverInterventionEvent value,
          $Res Function(DeliverInterventionEvent) then) =
      _$DeliverInterventionEventCopyWithImpl<$Res, DeliverInterventionEvent>;
}

/// @nodoc
class _$DeliverInterventionEventCopyWithImpl<$Res,
        $Val extends DeliverInterventionEvent>
    implements $DeliverInterventionEventCopyWith<$Res> {
  _$DeliverInterventionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DeliverInterventionSubmitEventImplCopyWith<$Res> {
  factory _$$DeliverInterventionSubmitEventImplCopyWith(
          _$DeliverInterventionSubmitEventImpl value,
          $Res Function(_$DeliverInterventionSubmitEventImpl) then) =
      __$$DeliverInterventionSubmitEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {TaskModel task,
      bool isEditing,
      BoundaryModel boundaryModel,
      bool navigateToSummary,
      HouseholdMemberDeliveryWrapper? householdMemberWrapper});

  $HouseholdMemberDeliveryWrapperCopyWith<$Res>? get householdMemberWrapper;
}

/// @nodoc
class __$$DeliverInterventionSubmitEventImplCopyWithImpl<$Res>
    extends _$DeliverInterventionEventCopyWithImpl<$Res,
        _$DeliverInterventionSubmitEventImpl>
    implements _$$DeliverInterventionSubmitEventImplCopyWith<$Res> {
  __$$DeliverInterventionSubmitEventImplCopyWithImpl(
      _$DeliverInterventionSubmitEventImpl _value,
      $Res Function(_$DeliverInterventionSubmitEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? isEditing = null,
    Object? boundaryModel = null,
    Object? navigateToSummary = null,
    Object? householdMemberWrapper = freezed,
  }) {
    return _then(_$DeliverInterventionSubmitEventImpl(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      boundaryModel: null == boundaryModel
          ? _value.boundaryModel
          : boundaryModel // ignore: cast_nullable_to_non_nullable
              as BoundaryModel,
      navigateToSummary: null == navigateToSummary
          ? _value.navigateToSummary
          : navigateToSummary // ignore: cast_nullable_to_non_nullable
              as bool,
      householdMemberWrapper: freezed == householdMemberWrapper
          ? _value.householdMemberWrapper
          : householdMemberWrapper // ignore: cast_nullable_to_non_nullable
              as HouseholdMemberDeliveryWrapper?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $HouseholdMemberDeliveryWrapperCopyWith<$Res>? get householdMemberWrapper {
    if (_value.householdMemberWrapper == null) {
      return null;
    }

    return $HouseholdMemberDeliveryWrapperCopyWith<$Res>(
        _value.householdMemberWrapper!, (value) {
      return _then(_value.copyWith(householdMemberWrapper: value));
    });
  }
}

/// @nodoc

class _$DeliverInterventionSubmitEventImpl
    implements DeliverInterventionSubmitEvent {
  const _$DeliverInterventionSubmitEventImpl(
      {required this.task,
      required this.isEditing,
      required this.boundaryModel,
      this.navigateToSummary = false,
      this.householdMemberWrapper});

  @override
  final TaskModel task;
  @override
  final bool isEditing;
  @override
  final BoundaryModel boundaryModel;
  @override
  @JsonKey()
  final bool navigateToSummary;
  @override
  final HouseholdMemberDeliveryWrapper? householdMemberWrapper;

  @override
  String toString() {
    return 'DeliverInterventionEvent.handleSubmit(task: $task, isEditing: $isEditing, boundaryModel: $boundaryModel, navigateToSummary: $navigateToSummary, householdMemberWrapper: $householdMemberWrapper)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliverInterventionSubmitEventImpl &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            (identical(other.boundaryModel, boundaryModel) ||
                other.boundaryModel == boundaryModel) &&
            (identical(other.navigateToSummary, navigateToSummary) ||
                other.navigateToSummary == navigateToSummary) &&
            (identical(other.householdMemberWrapper, householdMemberWrapper) ||
                other.householdMemberWrapper == householdMemberWrapper));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, isEditing, boundaryModel,
      navigateToSummary, householdMemberWrapper);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliverInterventionSubmitEventImplCopyWith<
          _$DeliverInterventionSubmitEventImpl>
      get copyWith => __$$DeliverInterventionSubmitEventImplCopyWithImpl<
          _$DeliverInterventionSubmitEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TaskModel task,
            bool isEditing,
            BoundaryModel boundaryModel,
            bool navigateToSummary,
            HouseholdMemberDeliveryWrapper? householdMemberWrapper)
        handleSubmit,
    required TResult Function(TaskSearchModel taskSearch) handleSearch,
    required TResult Function(
            int dose, ProjectCycle cycle, IndividualModel? individualModel)
        selectFutureCycleDose,
    required TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectTypeModel projectType)
        setActiveCycleDose,
  }) {
    return handleSubmit(task, isEditing, boundaryModel, navigateToSummary,
        householdMemberWrapper);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TaskModel task,
            bool isEditing,
            BoundaryModel boundaryModel,
            bool navigateToSummary,
            HouseholdMemberDeliveryWrapper? householdMemberWrapper)?
        handleSubmit,
    TResult? Function(TaskSearchModel taskSearch)? handleSearch,
    TResult? Function(
            int dose, ProjectCycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult? Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectTypeModel projectType)?
        setActiveCycleDose,
  }) {
    return handleSubmit?.call(task, isEditing, boundaryModel, navigateToSummary,
        householdMemberWrapper);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TaskModel task,
            bool isEditing,
            BoundaryModel boundaryModel,
            bool navigateToSummary,
            HouseholdMemberDeliveryWrapper? householdMemberWrapper)?
        handleSubmit,
    TResult Function(TaskSearchModel taskSearch)? handleSearch,
    TResult Function(
            int dose, ProjectCycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectTypeModel projectType)?
        setActiveCycleDose,
    required TResult orElse(),
  }) {
    if (handleSubmit != null) {
      return handleSubmit(task, isEditing, boundaryModel, navigateToSummary,
          householdMemberWrapper);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeliverInterventionSubmitEvent value)
        handleSubmit,
    required TResult Function(DeliverInterventionSearchEvent value)
        handleSearch,
    required TResult Function(
            DeliverInterventionCycleFutureDoseSelectionEvent value)
        selectFutureCycleDose,
    required TResult Function(
            DeliverInterventionActiveCycleDoseSelectionEvent value)
        setActiveCycleDose,
  }) {
    return handleSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult? Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult? Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult? Function(DeliverInterventionActiveCycleDoseSelectionEvent value)?
        setActiveCycleDose,
  }) {
    return handleSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult Function(DeliverInterventionActiveCycleDoseSelectionEvent value)?
        setActiveCycleDose,
    required TResult orElse(),
  }) {
    if (handleSubmit != null) {
      return handleSubmit(this);
    }
    return orElse();
  }
}

abstract class DeliverInterventionSubmitEvent
    implements DeliverInterventionEvent {
  const factory DeliverInterventionSubmitEvent(
          {required final TaskModel task,
          required final bool isEditing,
          required final BoundaryModel boundaryModel,
          final bool navigateToSummary,
          final HouseholdMemberDeliveryWrapper? householdMemberWrapper}) =
      _$DeliverInterventionSubmitEventImpl;

  TaskModel get task;
  bool get isEditing;
  BoundaryModel get boundaryModel;
  bool get navigateToSummary;
  HouseholdMemberDeliveryWrapper? get householdMemberWrapper;
  @JsonKey(ignore: true)
  _$$DeliverInterventionSubmitEventImplCopyWith<
          _$DeliverInterventionSubmitEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeliverInterventionSearchEventImplCopyWith<$Res> {
  factory _$$DeliverInterventionSearchEventImplCopyWith(
          _$DeliverInterventionSearchEventImpl value,
          $Res Function(_$DeliverInterventionSearchEventImpl) then) =
      __$$DeliverInterventionSearchEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TaskSearchModel taskSearch});
}

/// @nodoc
class __$$DeliverInterventionSearchEventImplCopyWithImpl<$Res>
    extends _$DeliverInterventionEventCopyWithImpl<$Res,
        _$DeliverInterventionSearchEventImpl>
    implements _$$DeliverInterventionSearchEventImplCopyWith<$Res> {
  __$$DeliverInterventionSearchEventImplCopyWithImpl(
      _$DeliverInterventionSearchEventImpl _value,
      $Res Function(_$DeliverInterventionSearchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskSearch = null,
  }) {
    return _then(_$DeliverInterventionSearchEventImpl(
      taskSearch: null == taskSearch
          ? _value.taskSearch
          : taskSearch // ignore: cast_nullable_to_non_nullable
              as TaskSearchModel,
    ));
  }
}

/// @nodoc

class _$DeliverInterventionSearchEventImpl
    implements DeliverInterventionSearchEvent {
  const _$DeliverInterventionSearchEventImpl({required this.taskSearch});

  @override
  final TaskSearchModel taskSearch;

  @override
  String toString() {
    return 'DeliverInterventionEvent.handleSearch(taskSearch: $taskSearch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliverInterventionSearchEventImpl &&
            (identical(other.taskSearch, taskSearch) ||
                other.taskSearch == taskSearch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskSearch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliverInterventionSearchEventImplCopyWith<
          _$DeliverInterventionSearchEventImpl>
      get copyWith => __$$DeliverInterventionSearchEventImplCopyWithImpl<
          _$DeliverInterventionSearchEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TaskModel task,
            bool isEditing,
            BoundaryModel boundaryModel,
            bool navigateToSummary,
            HouseholdMemberDeliveryWrapper? householdMemberWrapper)
        handleSubmit,
    required TResult Function(TaskSearchModel taskSearch) handleSearch,
    required TResult Function(
            int dose, ProjectCycle cycle, IndividualModel? individualModel)
        selectFutureCycleDose,
    required TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectTypeModel projectType)
        setActiveCycleDose,
  }) {
    return handleSearch(taskSearch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TaskModel task,
            bool isEditing,
            BoundaryModel boundaryModel,
            bool navigateToSummary,
            HouseholdMemberDeliveryWrapper? householdMemberWrapper)?
        handleSubmit,
    TResult? Function(TaskSearchModel taskSearch)? handleSearch,
    TResult? Function(
            int dose, ProjectCycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult? Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectTypeModel projectType)?
        setActiveCycleDose,
  }) {
    return handleSearch?.call(taskSearch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TaskModel task,
            bool isEditing,
            BoundaryModel boundaryModel,
            bool navigateToSummary,
            HouseholdMemberDeliveryWrapper? householdMemberWrapper)?
        handleSubmit,
    TResult Function(TaskSearchModel taskSearch)? handleSearch,
    TResult Function(
            int dose, ProjectCycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectTypeModel projectType)?
        setActiveCycleDose,
    required TResult orElse(),
  }) {
    if (handleSearch != null) {
      return handleSearch(taskSearch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeliverInterventionSubmitEvent value)
        handleSubmit,
    required TResult Function(DeliverInterventionSearchEvent value)
        handleSearch,
    required TResult Function(
            DeliverInterventionCycleFutureDoseSelectionEvent value)
        selectFutureCycleDose,
    required TResult Function(
            DeliverInterventionActiveCycleDoseSelectionEvent value)
        setActiveCycleDose,
  }) {
    return handleSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult? Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult? Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult? Function(DeliverInterventionActiveCycleDoseSelectionEvent value)?
        setActiveCycleDose,
  }) {
    return handleSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult Function(DeliverInterventionActiveCycleDoseSelectionEvent value)?
        setActiveCycleDose,
    required TResult orElse(),
  }) {
    if (handleSearch != null) {
      return handleSearch(this);
    }
    return orElse();
  }
}

abstract class DeliverInterventionSearchEvent
    implements DeliverInterventionEvent {
  const factory DeliverInterventionSearchEvent(
          {required final TaskSearchModel taskSearch}) =
      _$DeliverInterventionSearchEventImpl;

  TaskSearchModel get taskSearch;
  @JsonKey(ignore: true)
  _$$DeliverInterventionSearchEventImplCopyWith<
          _$DeliverInterventionSearchEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeliverInterventionCycleFutureDoseSelectionEventImplCopyWith<
    $Res> {
  factory _$$DeliverInterventionCycleFutureDoseSelectionEventImplCopyWith(
          _$DeliverInterventionCycleFutureDoseSelectionEventImpl value,
          $Res Function(_$DeliverInterventionCycleFutureDoseSelectionEventImpl)
              then) =
      __$$DeliverInterventionCycleFutureDoseSelectionEventImplCopyWithImpl<
          $Res>;
  @useResult
  $Res call({int dose, ProjectCycle cycle, IndividualModel? individualModel});
}

/// @nodoc
class __$$DeliverInterventionCycleFutureDoseSelectionEventImplCopyWithImpl<$Res>
    extends _$DeliverInterventionEventCopyWithImpl<$Res,
        _$DeliverInterventionCycleFutureDoseSelectionEventImpl>
    implements
        _$$DeliverInterventionCycleFutureDoseSelectionEventImplCopyWith<$Res> {
  __$$DeliverInterventionCycleFutureDoseSelectionEventImplCopyWithImpl(
      _$DeliverInterventionCycleFutureDoseSelectionEventImpl _value,
      $Res Function(_$DeliverInterventionCycleFutureDoseSelectionEventImpl)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dose = null,
    Object? cycle = null,
    Object? individualModel = freezed,
  }) {
    return _then(_$DeliverInterventionCycleFutureDoseSelectionEventImpl(
      dose: null == dose
          ? _value.dose
          : dose // ignore: cast_nullable_to_non_nullable
              as int,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as ProjectCycle,
      individualModel: freezed == individualModel
          ? _value.individualModel
          : individualModel // ignore: cast_nullable_to_non_nullable
              as IndividualModel?,
    ));
  }
}

/// @nodoc

class _$DeliverInterventionCycleFutureDoseSelectionEventImpl
    implements DeliverInterventionCycleFutureDoseSelectionEvent {
  const _$DeliverInterventionCycleFutureDoseSelectionEventImpl(
      {required this.dose, required this.cycle, required this.individualModel});

  @override
  final int dose;
  @override
  final ProjectCycle cycle;
  @override
  final IndividualModel? individualModel;

  @override
  String toString() {
    return 'DeliverInterventionEvent.selectFutureCycleDose(dose: $dose, cycle: $cycle, individualModel: $individualModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliverInterventionCycleFutureDoseSelectionEventImpl &&
            (identical(other.dose, dose) || other.dose == dose) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.individualModel, individualModel) ||
                other.individualModel == individualModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dose, cycle, individualModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliverInterventionCycleFutureDoseSelectionEventImplCopyWith<
          _$DeliverInterventionCycleFutureDoseSelectionEventImpl>
      get copyWith =>
          __$$DeliverInterventionCycleFutureDoseSelectionEventImplCopyWithImpl<
                  _$DeliverInterventionCycleFutureDoseSelectionEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TaskModel task,
            bool isEditing,
            BoundaryModel boundaryModel,
            bool navigateToSummary,
            HouseholdMemberDeliveryWrapper? householdMemberWrapper)
        handleSubmit,
    required TResult Function(TaskSearchModel taskSearch) handleSearch,
    required TResult Function(
            int dose, ProjectCycle cycle, IndividualModel? individualModel)
        selectFutureCycleDose,
    required TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectTypeModel projectType)
        setActiveCycleDose,
  }) {
    return selectFutureCycleDose(dose, cycle, individualModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TaskModel task,
            bool isEditing,
            BoundaryModel boundaryModel,
            bool navigateToSummary,
            HouseholdMemberDeliveryWrapper? householdMemberWrapper)?
        handleSubmit,
    TResult? Function(TaskSearchModel taskSearch)? handleSearch,
    TResult? Function(
            int dose, ProjectCycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult? Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectTypeModel projectType)?
        setActiveCycleDose,
  }) {
    return selectFutureCycleDose?.call(dose, cycle, individualModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TaskModel task,
            bool isEditing,
            BoundaryModel boundaryModel,
            bool navigateToSummary,
            HouseholdMemberDeliveryWrapper? householdMemberWrapper)?
        handleSubmit,
    TResult Function(TaskSearchModel taskSearch)? handleSearch,
    TResult Function(
            int dose, ProjectCycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectTypeModel projectType)?
        setActiveCycleDose,
    required TResult orElse(),
  }) {
    if (selectFutureCycleDose != null) {
      return selectFutureCycleDose(dose, cycle, individualModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeliverInterventionSubmitEvent value)
        handleSubmit,
    required TResult Function(DeliverInterventionSearchEvent value)
        handleSearch,
    required TResult Function(
            DeliverInterventionCycleFutureDoseSelectionEvent value)
        selectFutureCycleDose,
    required TResult Function(
            DeliverInterventionActiveCycleDoseSelectionEvent value)
        setActiveCycleDose,
  }) {
    return selectFutureCycleDose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult? Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult? Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult? Function(DeliverInterventionActiveCycleDoseSelectionEvent value)?
        setActiveCycleDose,
  }) {
    return selectFutureCycleDose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult Function(DeliverInterventionActiveCycleDoseSelectionEvent value)?
        setActiveCycleDose,
    required TResult orElse(),
  }) {
    if (selectFutureCycleDose != null) {
      return selectFutureCycleDose(this);
    }
    return orElse();
  }
}

abstract class DeliverInterventionCycleFutureDoseSelectionEvent
    implements DeliverInterventionEvent {
  const factory DeliverInterventionCycleFutureDoseSelectionEvent(
          {required final int dose,
          required final ProjectCycle cycle,
          required final IndividualModel? individualModel}) =
      _$DeliverInterventionCycleFutureDoseSelectionEventImpl;

  int get dose;
  ProjectCycle get cycle;
  IndividualModel? get individualModel;
  @JsonKey(ignore: true)
  _$$DeliverInterventionCycleFutureDoseSelectionEventImplCopyWith<
          _$DeliverInterventionCycleFutureDoseSelectionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeliverInterventionActiveCycleDoseSelectionEventImplCopyWith<
    $Res> {
  factory _$$DeliverInterventionActiveCycleDoseSelectionEventImplCopyWith(
          _$DeliverInterventionActiveCycleDoseSelectionEventImpl value,
          $Res Function(_$DeliverInterventionActiveCycleDoseSelectionEventImpl)
              then) =
      __$$DeliverInterventionActiveCycleDoseSelectionEventImplCopyWithImpl<
          $Res>;
  @useResult
  $Res call(
      {int lastDose,
      int lastCycle,
      IndividualModel? individualModel,
      ProjectTypeModel projectType});
}

/// @nodoc
class __$$DeliverInterventionActiveCycleDoseSelectionEventImplCopyWithImpl<$Res>
    extends _$DeliverInterventionEventCopyWithImpl<$Res,
        _$DeliverInterventionActiveCycleDoseSelectionEventImpl>
    implements
        _$$DeliverInterventionActiveCycleDoseSelectionEventImplCopyWith<$Res> {
  __$$DeliverInterventionActiveCycleDoseSelectionEventImplCopyWithImpl(
      _$DeliverInterventionActiveCycleDoseSelectionEventImpl _value,
      $Res Function(_$DeliverInterventionActiveCycleDoseSelectionEventImpl)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastDose = null,
    Object? lastCycle = null,
    Object? individualModel = freezed,
    Object? projectType = null,
  }) {
    return _then(_$DeliverInterventionActiveCycleDoseSelectionEventImpl(
      lastDose: null == lastDose
          ? _value.lastDose
          : lastDose // ignore: cast_nullable_to_non_nullable
              as int,
      lastCycle: null == lastCycle
          ? _value.lastCycle
          : lastCycle // ignore: cast_nullable_to_non_nullable
              as int,
      individualModel: freezed == individualModel
          ? _value.individualModel
          : individualModel // ignore: cast_nullable_to_non_nullable
              as IndividualModel?,
      projectType: null == projectType
          ? _value.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as ProjectTypeModel,
    ));
  }
}

/// @nodoc

class _$DeliverInterventionActiveCycleDoseSelectionEventImpl
    implements DeliverInterventionActiveCycleDoseSelectionEvent {
  const _$DeliverInterventionActiveCycleDoseSelectionEventImpl(
      {required this.lastDose,
      required this.lastCycle,
      required this.individualModel,
      required this.projectType});

  @override
  final int lastDose;
  @override
  final int lastCycle;
  @override
  final IndividualModel? individualModel;
  @override
  final ProjectTypeModel projectType;

  @override
  String toString() {
    return 'DeliverInterventionEvent.setActiveCycleDose(lastDose: $lastDose, lastCycle: $lastCycle, individualModel: $individualModel, projectType: $projectType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliverInterventionActiveCycleDoseSelectionEventImpl &&
            (identical(other.lastDose, lastDose) ||
                other.lastDose == lastDose) &&
            (identical(other.lastCycle, lastCycle) ||
                other.lastCycle == lastCycle) &&
            (identical(other.individualModel, individualModel) ||
                other.individualModel == individualModel) &&
            (identical(other.projectType, projectType) ||
                other.projectType == projectType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, lastDose, lastCycle, individualModel, projectType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliverInterventionActiveCycleDoseSelectionEventImplCopyWith<
          _$DeliverInterventionActiveCycleDoseSelectionEventImpl>
      get copyWith =>
          __$$DeliverInterventionActiveCycleDoseSelectionEventImplCopyWithImpl<
                  _$DeliverInterventionActiveCycleDoseSelectionEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TaskModel task,
            bool isEditing,
            BoundaryModel boundaryModel,
            bool navigateToSummary,
            HouseholdMemberDeliveryWrapper? householdMemberWrapper)
        handleSubmit,
    required TResult Function(TaskSearchModel taskSearch) handleSearch,
    required TResult Function(
            int dose, ProjectCycle cycle, IndividualModel? individualModel)
        selectFutureCycleDose,
    required TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectTypeModel projectType)
        setActiveCycleDose,
  }) {
    return setActiveCycleDose(
        lastDose, lastCycle, individualModel, projectType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TaskModel task,
            bool isEditing,
            BoundaryModel boundaryModel,
            bool navigateToSummary,
            HouseholdMemberDeliveryWrapper? householdMemberWrapper)?
        handleSubmit,
    TResult? Function(TaskSearchModel taskSearch)? handleSearch,
    TResult? Function(
            int dose, ProjectCycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult? Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectTypeModel projectType)?
        setActiveCycleDose,
  }) {
    return setActiveCycleDose?.call(
        lastDose, lastCycle, individualModel, projectType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TaskModel task,
            bool isEditing,
            BoundaryModel boundaryModel,
            bool navigateToSummary,
            HouseholdMemberDeliveryWrapper? householdMemberWrapper)?
        handleSubmit,
    TResult Function(TaskSearchModel taskSearch)? handleSearch,
    TResult Function(
            int dose, ProjectCycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectTypeModel projectType)?
        setActiveCycleDose,
    required TResult orElse(),
  }) {
    if (setActiveCycleDose != null) {
      return setActiveCycleDose(
          lastDose, lastCycle, individualModel, projectType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeliverInterventionSubmitEvent value)
        handleSubmit,
    required TResult Function(DeliverInterventionSearchEvent value)
        handleSearch,
    required TResult Function(
            DeliverInterventionCycleFutureDoseSelectionEvent value)
        selectFutureCycleDose,
    required TResult Function(
            DeliverInterventionActiveCycleDoseSelectionEvent value)
        setActiveCycleDose,
  }) {
    return setActiveCycleDose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult? Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult? Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult? Function(DeliverInterventionActiveCycleDoseSelectionEvent value)?
        setActiveCycleDose,
  }) {
    return setActiveCycleDose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult Function(DeliverInterventionActiveCycleDoseSelectionEvent value)?
        setActiveCycleDose,
    required TResult orElse(),
  }) {
    if (setActiveCycleDose != null) {
      return setActiveCycleDose(this);
    }
    return orElse();
  }
}

abstract class DeliverInterventionActiveCycleDoseSelectionEvent
    implements DeliverInterventionEvent {
  const factory DeliverInterventionActiveCycleDoseSelectionEvent(
          {required final int lastDose,
          required final int lastCycle,
          required final IndividualModel? individualModel,
          required final ProjectTypeModel projectType}) =
      _$DeliverInterventionActiveCycleDoseSelectionEventImpl;

  int get lastDose;
  int get lastCycle;
  IndividualModel? get individualModel;
  ProjectTypeModel get projectType;
  @JsonKey(ignore: true)
  _$$DeliverInterventionActiveCycleDoseSelectionEventImplCopyWith<
          _$DeliverInterventionActiveCycleDoseSelectionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeliverInterventionState {
  bool get loading => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  int get cycle => throw _privateConstructorUsedError;
  int get dose => throw _privateConstructorUsedError;
  List<ProjectCycle>? get pastCycles => throw _privateConstructorUsedError;
  bool get hasCycleArrived => throw _privateConstructorUsedError;
  bool get isLastDoseOfCycle => throw _privateConstructorUsedError;
  HouseholdMemberDeliveryWrapper? get householdMemberWrapper =>
      throw _privateConstructorUsedError;
  List<TaskModel>? get tasks => throw _privateConstructorUsedError;
  List<ProjectCycleDelivery>? get futureDeliveries =>
      throw _privateConstructorUsedError;
  List<TaskModel>? get futureTask => throw _privateConstructorUsedError;
  TaskModel? get oldTask => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeliverInterventionStateCopyWith<DeliverInterventionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliverInterventionStateCopyWith<$Res> {
  factory $DeliverInterventionStateCopyWith(DeliverInterventionState value,
          $Res Function(DeliverInterventionState) then) =
      _$DeliverInterventionStateCopyWithImpl<$Res, DeliverInterventionState>;
  @useResult
  $Res call(
      {bool loading,
      bool isEditing,
      int cycle,
      int dose,
      List<ProjectCycle>? pastCycles,
      bool hasCycleArrived,
      bool isLastDoseOfCycle,
      HouseholdMemberDeliveryWrapper? householdMemberWrapper,
      List<TaskModel>? tasks,
      List<ProjectCycleDelivery>? futureDeliveries,
      List<TaskModel>? futureTask,
      TaskModel? oldTask});

  $HouseholdMemberDeliveryWrapperCopyWith<$Res>? get householdMemberWrapper;
}

/// @nodoc
class _$DeliverInterventionStateCopyWithImpl<$Res,
        $Val extends DeliverInterventionState>
    implements $DeliverInterventionStateCopyWith<$Res> {
  _$DeliverInterventionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditing = null,
    Object? cycle = null,
    Object? dose = null,
    Object? pastCycles = freezed,
    Object? hasCycleArrived = null,
    Object? isLastDoseOfCycle = null,
    Object? householdMemberWrapper = freezed,
    Object? tasks = freezed,
    Object? futureDeliveries = freezed,
    Object? futureTask = freezed,
    Object? oldTask = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as int,
      dose: null == dose
          ? _value.dose
          : dose // ignore: cast_nullable_to_non_nullable
              as int,
      pastCycles: freezed == pastCycles
          ? _value.pastCycles
          : pastCycles // ignore: cast_nullable_to_non_nullable
              as List<ProjectCycle>?,
      hasCycleArrived: null == hasCycleArrived
          ? _value.hasCycleArrived
          : hasCycleArrived // ignore: cast_nullable_to_non_nullable
              as bool,
      isLastDoseOfCycle: null == isLastDoseOfCycle
          ? _value.isLastDoseOfCycle
          : isLastDoseOfCycle // ignore: cast_nullable_to_non_nullable
              as bool,
      householdMemberWrapper: freezed == householdMemberWrapper
          ? _value.householdMemberWrapper
          : householdMemberWrapper // ignore: cast_nullable_to_non_nullable
              as HouseholdMemberDeliveryWrapper?,
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      futureDeliveries: freezed == futureDeliveries
          ? _value.futureDeliveries
          : futureDeliveries // ignore: cast_nullable_to_non_nullable
              as List<ProjectCycleDelivery>?,
      futureTask: freezed == futureTask
          ? _value.futureTask
          : futureTask // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      oldTask: freezed == oldTask
          ? _value.oldTask
          : oldTask // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HouseholdMemberDeliveryWrapperCopyWith<$Res>? get householdMemberWrapper {
    if (_value.householdMemberWrapper == null) {
      return null;
    }

    return $HouseholdMemberDeliveryWrapperCopyWith<$Res>(
        _value.householdMemberWrapper!, (value) {
      return _then(_value.copyWith(householdMemberWrapper: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeliverInterventionStateImplCopyWith<$Res>
    implements $DeliverInterventionStateCopyWith<$Res> {
  factory _$$DeliverInterventionStateImplCopyWith(
          _$DeliverInterventionStateImpl value,
          $Res Function(_$DeliverInterventionStateImpl) then) =
      __$$DeliverInterventionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool isEditing,
      int cycle,
      int dose,
      List<ProjectCycle>? pastCycles,
      bool hasCycleArrived,
      bool isLastDoseOfCycle,
      HouseholdMemberDeliveryWrapper? householdMemberWrapper,
      List<TaskModel>? tasks,
      List<ProjectCycleDelivery>? futureDeliveries,
      List<TaskModel>? futureTask,
      TaskModel? oldTask});

  @override
  $HouseholdMemberDeliveryWrapperCopyWith<$Res>? get householdMemberWrapper;
}

/// @nodoc
class __$$DeliverInterventionStateImplCopyWithImpl<$Res>
    extends _$DeliverInterventionStateCopyWithImpl<$Res,
        _$DeliverInterventionStateImpl>
    implements _$$DeliverInterventionStateImplCopyWith<$Res> {
  __$$DeliverInterventionStateImplCopyWithImpl(
      _$DeliverInterventionStateImpl _value,
      $Res Function(_$DeliverInterventionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditing = null,
    Object? cycle = null,
    Object? dose = null,
    Object? pastCycles = freezed,
    Object? hasCycleArrived = null,
    Object? isLastDoseOfCycle = null,
    Object? householdMemberWrapper = freezed,
    Object? tasks = freezed,
    Object? futureDeliveries = freezed,
    Object? futureTask = freezed,
    Object? oldTask = freezed,
  }) {
    return _then(_$DeliverInterventionStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as int,
      dose: null == dose
          ? _value.dose
          : dose // ignore: cast_nullable_to_non_nullable
              as int,
      pastCycles: freezed == pastCycles
          ? _value._pastCycles
          : pastCycles // ignore: cast_nullable_to_non_nullable
              as List<ProjectCycle>?,
      hasCycleArrived: null == hasCycleArrived
          ? _value.hasCycleArrived
          : hasCycleArrived // ignore: cast_nullable_to_non_nullable
              as bool,
      isLastDoseOfCycle: null == isLastDoseOfCycle
          ? _value.isLastDoseOfCycle
          : isLastDoseOfCycle // ignore: cast_nullable_to_non_nullable
              as bool,
      householdMemberWrapper: freezed == householdMemberWrapper
          ? _value.householdMemberWrapper
          : householdMemberWrapper // ignore: cast_nullable_to_non_nullable
              as HouseholdMemberDeliveryWrapper?,
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      futureDeliveries: freezed == futureDeliveries
          ? _value._futureDeliveries
          : futureDeliveries // ignore: cast_nullable_to_non_nullable
              as List<ProjectCycleDelivery>?,
      futureTask: freezed == futureTask
          ? _value._futureTask
          : futureTask // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      oldTask: freezed == oldTask
          ? _value.oldTask
          : oldTask // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
    ));
  }
}

/// @nodoc

class _$DeliverInterventionStateImpl implements _DeliverInterventionState {
  const _$DeliverInterventionStateImpl(
      {this.loading = false,
      this.isEditing = false,
      this.cycle = 1,
      this.dose = 1,
      final List<ProjectCycle>? pastCycles,
      this.hasCycleArrived = true,
      this.isLastDoseOfCycle = false,
      this.householdMemberWrapper,
      final List<TaskModel>? tasks,
      final List<ProjectCycleDelivery>? futureDeliveries,
      final List<TaskModel>? futureTask,
      this.oldTask})
      : _pastCycles = pastCycles,
        _tasks = tasks,
        _futureDeliveries = futureDeliveries,
        _futureTask = futureTask;

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isEditing;
  @override
  @JsonKey()
  final int cycle;
  @override
  @JsonKey()
  final int dose;
  final List<ProjectCycle>? _pastCycles;
  @override
  List<ProjectCycle>? get pastCycles {
    final value = _pastCycles;
    if (value == null) return null;
    if (_pastCycles is EqualUnmodifiableListView) return _pastCycles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool hasCycleArrived;
  @override
  @JsonKey()
  final bool isLastDoseOfCycle;
  @override
  final HouseholdMemberDeliveryWrapper? householdMemberWrapper;
  final List<TaskModel>? _tasks;
  @override
  List<TaskModel>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProjectCycleDelivery>? _futureDeliveries;
  @override
  List<ProjectCycleDelivery>? get futureDeliveries {
    final value = _futureDeliveries;
    if (value == null) return null;
    if (_futureDeliveries is EqualUnmodifiableListView)
      return _futureDeliveries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TaskModel>? _futureTask;
  @override
  List<TaskModel>? get futureTask {
    final value = _futureTask;
    if (value == null) return null;
    if (_futureTask is EqualUnmodifiableListView) return _futureTask;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TaskModel? oldTask;

  @override
  String toString() {
    return 'DeliverInterventionState(loading: $loading, isEditing: $isEditing, cycle: $cycle, dose: $dose, pastCycles: $pastCycles, hasCycleArrived: $hasCycleArrived, isLastDoseOfCycle: $isLastDoseOfCycle, householdMemberWrapper: $householdMemberWrapper, tasks: $tasks, futureDeliveries: $futureDeliveries, futureTask: $futureTask, oldTask: $oldTask)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliverInterventionStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.dose, dose) || other.dose == dose) &&
            const DeepCollectionEquality()
                .equals(other._pastCycles, _pastCycles) &&
            (identical(other.hasCycleArrived, hasCycleArrived) ||
                other.hasCycleArrived == hasCycleArrived) &&
            (identical(other.isLastDoseOfCycle, isLastDoseOfCycle) ||
                other.isLastDoseOfCycle == isLastDoseOfCycle) &&
            (identical(other.householdMemberWrapper, householdMemberWrapper) ||
                other.householdMemberWrapper == householdMemberWrapper) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._futureDeliveries, _futureDeliveries) &&
            const DeepCollectionEquality()
                .equals(other._futureTask, _futureTask) &&
            (identical(other.oldTask, oldTask) || other.oldTask == oldTask));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      isEditing,
      cycle,
      dose,
      const DeepCollectionEquality().hash(_pastCycles),
      hasCycleArrived,
      isLastDoseOfCycle,
      householdMemberWrapper,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_futureDeliveries),
      const DeepCollectionEquality().hash(_futureTask),
      oldTask);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliverInterventionStateImplCopyWith<_$DeliverInterventionStateImpl>
      get copyWith => __$$DeliverInterventionStateImplCopyWithImpl<
          _$DeliverInterventionStateImpl>(this, _$identity);
}

abstract class _DeliverInterventionState implements DeliverInterventionState {
  const factory _DeliverInterventionState(
      {final bool loading,
      final bool isEditing,
      final int cycle,
      final int dose,
      final List<ProjectCycle>? pastCycles,
      final bool hasCycleArrived,
      final bool isLastDoseOfCycle,
      final HouseholdMemberDeliveryWrapper? householdMemberWrapper,
      final List<TaskModel>? tasks,
      final List<ProjectCycleDelivery>? futureDeliveries,
      final List<TaskModel>? futureTask,
      final TaskModel? oldTask}) = _$DeliverInterventionStateImpl;

  @override
  bool get loading;
  @override
  bool get isEditing;
  @override
  int get cycle;
  @override
  int get dose;
  @override
  List<ProjectCycle>? get pastCycles;
  @override
  bool get hasCycleArrived;
  @override
  bool get isLastDoseOfCycle;
  @override
  HouseholdMemberDeliveryWrapper? get householdMemberWrapper;
  @override
  List<TaskModel>? get tasks;
  @override
  List<ProjectCycleDelivery>? get futureDeliveries;
  @override
  List<TaskModel>? get futureTask;
  @override
  TaskModel? get oldTask;
  @override
  @JsonKey(ignore: true)
  _$$DeliverInterventionStateImplCopyWith<_$DeliverInterventionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

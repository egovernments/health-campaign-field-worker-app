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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeliverInterventionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)
        handleSubmit,
    required TResult Function(TaskSearchModel taskSearch) handleSearch,
    required TResult Function(
            int dose, Cycle cycle, IndividualModel? individualModel)
        selectFutureCycleDose,
    required TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectType projectType)
        setActiveCycleDose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult? Function(TaskSearchModel taskSearch)? handleSearch,
    TResult? Function(int dose, Cycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult? Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectType projectType)?
        setActiveCycleDose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult Function(TaskSearchModel taskSearch)? handleSearch,
    TResult Function(int dose, Cycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectType projectType)?
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
  $Res call({TaskModel task, bool isEditing, BoundaryModel boundaryModel});
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
  }) {
    return _then(_$DeliverInterventionSubmitEventImpl(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
      null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      null == boundaryModel
          ? _value.boundaryModel
          : boundaryModel // ignore: cast_nullable_to_non_nullable
              as BoundaryModel,
    ));
  }
}

/// @nodoc

class _$DeliverInterventionSubmitEventImpl
    implements DeliverInterventionSubmitEvent {
  const _$DeliverInterventionSubmitEventImpl(
      this.task, this.isEditing, this.boundaryModel);

  @override
  final TaskModel task;
  @override
  final bool isEditing;
  @override
  final BoundaryModel boundaryModel;

  @override
  String toString() {
    return 'DeliverInterventionEvent.handleSubmit(task: $task, isEditing: $isEditing, boundaryModel: $boundaryModel)';
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
                other.boundaryModel == boundaryModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, isEditing, boundaryModel);

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
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)
        handleSubmit,
    required TResult Function(TaskSearchModel taskSearch) handleSearch,
    required TResult Function(
            int dose, Cycle cycle, IndividualModel? individualModel)
        selectFutureCycleDose,
    required TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectType projectType)
        setActiveCycleDose,
  }) {
    return handleSubmit(task, isEditing, boundaryModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult? Function(TaskSearchModel taskSearch)? handleSearch,
    TResult? Function(int dose, Cycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult? Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectType projectType)?
        setActiveCycleDose,
  }) {
    return handleSubmit?.call(task, isEditing, boundaryModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult Function(TaskSearchModel taskSearch)? handleSearch,
    TResult Function(int dose, Cycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectType projectType)?
        setActiveCycleDose,
    required TResult orElse(),
  }) {
    if (handleSubmit != null) {
      return handleSubmit(task, isEditing, boundaryModel);
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
      final TaskModel task,
      final bool isEditing,
      final BoundaryModel boundaryModel) = _$DeliverInterventionSubmitEventImpl;

  TaskModel get task;
  bool get isEditing;
  BoundaryModel get boundaryModel;
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
      null == taskSearch
          ? _value.taskSearch
          : taskSearch // ignore: cast_nullable_to_non_nullable
              as TaskSearchModel,
    ));
  }
}

/// @nodoc

class _$DeliverInterventionSearchEventImpl
    implements DeliverInterventionSearchEvent {
  const _$DeliverInterventionSearchEventImpl(this.taskSearch);

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
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)
        handleSubmit,
    required TResult Function(TaskSearchModel taskSearch) handleSearch,
    required TResult Function(
            int dose, Cycle cycle, IndividualModel? individualModel)
        selectFutureCycleDose,
    required TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectType projectType)
        setActiveCycleDose,
  }) {
    return handleSearch(taskSearch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult? Function(TaskSearchModel taskSearch)? handleSearch,
    TResult? Function(int dose, Cycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult? Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectType projectType)?
        setActiveCycleDose,
  }) {
    return handleSearch?.call(taskSearch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult Function(TaskSearchModel taskSearch)? handleSearch,
    TResult Function(int dose, Cycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectType projectType)?
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
      final TaskSearchModel taskSearch) = _$DeliverInterventionSearchEventImpl;

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
  $Res call({int dose, Cycle cycle, IndividualModel? individualModel});

  $CycleCopyWith<$Res> get cycle;
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
      null == dose
          ? _value.dose
          : dose // ignore: cast_nullable_to_non_nullable
              as int,
      null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as Cycle,
      freezed == individualModel
          ? _value.individualModel
          : individualModel // ignore: cast_nullable_to_non_nullable
              as IndividualModel?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CycleCopyWith<$Res> get cycle {
    return $CycleCopyWith<$Res>(_value.cycle, (value) {
      return _then(_value.copyWith(cycle: value));
    });
  }
}

/// @nodoc

class _$DeliverInterventionCycleFutureDoseSelectionEventImpl
    implements DeliverInterventionCycleFutureDoseSelectionEvent {
  const _$DeliverInterventionCycleFutureDoseSelectionEventImpl(
      this.dose, this.cycle, this.individualModel);

  @override
  final int dose;
  @override
  final Cycle cycle;
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
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)
        handleSubmit,
    required TResult Function(TaskSearchModel taskSearch) handleSearch,
    required TResult Function(
            int dose, Cycle cycle, IndividualModel? individualModel)
        selectFutureCycleDose,
    required TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectType projectType)
        setActiveCycleDose,
  }) {
    return selectFutureCycleDose(dose, cycle, individualModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult? Function(TaskSearchModel taskSearch)? handleSearch,
    TResult? Function(int dose, Cycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult? Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectType projectType)?
        setActiveCycleDose,
  }) {
    return selectFutureCycleDose?.call(dose, cycle, individualModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult Function(TaskSearchModel taskSearch)? handleSearch,
    TResult Function(int dose, Cycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectType projectType)?
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
  const factory DeliverInterventionCycleFutureDoseSelectionEvent(final int dose,
          final Cycle cycle, final IndividualModel? individualModel) =
      _$DeliverInterventionCycleFutureDoseSelectionEventImpl;

  int get dose;
  Cycle get cycle;
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
      ProjectType projectType});

  $ProjectTypeCopyWith<$Res> get projectType;
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
      null == lastDose
          ? _value.lastDose
          : lastDose // ignore: cast_nullable_to_non_nullable
              as int,
      null == lastCycle
          ? _value.lastCycle
          : lastCycle // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == individualModel
          ? _value.individualModel
          : individualModel // ignore: cast_nullable_to_non_nullable
              as IndividualModel?,
      null == projectType
          ? _value.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as ProjectType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectTypeCopyWith<$Res> get projectType {
    return $ProjectTypeCopyWith<$Res>(_value.projectType, (value) {
      return _then(_value.copyWith(projectType: value));
    });
  }
}

/// @nodoc

class _$DeliverInterventionActiveCycleDoseSelectionEventImpl
    implements DeliverInterventionActiveCycleDoseSelectionEvent {
  const _$DeliverInterventionActiveCycleDoseSelectionEventImpl(
      this.lastDose, this.lastCycle, this.individualModel, this.projectType);

  @override
  final int lastDose;
  @override
  final int lastCycle;
  @override
  final IndividualModel? individualModel;
  @override
  final ProjectType projectType;

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
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)
        handleSubmit,
    required TResult Function(TaskSearchModel taskSearch) handleSearch,
    required TResult Function(
            int dose, Cycle cycle, IndividualModel? individualModel)
        selectFutureCycleDose,
    required TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectType projectType)
        setActiveCycleDose,
  }) {
    return setActiveCycleDose(
        lastDose, lastCycle, individualModel, projectType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult? Function(TaskSearchModel taskSearch)? handleSearch,
    TResult? Function(int dose, Cycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult? Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectType projectType)?
        setActiveCycleDose,
  }) {
    return setActiveCycleDose?.call(
        lastDose, lastCycle, individualModel, projectType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult Function(TaskSearchModel taskSearch)? handleSearch,
    TResult Function(int dose, Cycle cycle, IndividualModel? individualModel)?
        selectFutureCycleDose,
    TResult Function(int lastDose, int lastCycle,
            IndividualModel? individualModel, ProjectType projectType)?
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
          final int lastDose,
          final int lastCycle,
          final IndividualModel? individualModel,
          final ProjectType projectType) =
      _$DeliverInterventionActiveCycleDoseSelectionEventImpl;

  int get lastDose;
  int get lastCycle;
  IndividualModel? get individualModel;
  ProjectType get projectType;
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
  List<Cycle>? get pastCycles => throw _privateConstructorUsedError;
  bool get hasCycleArrived => throw _privateConstructorUsedError;
  bool get isLastDoseOfCycle => throw _privateConstructorUsedError;
  List<TaskModel>? get tasks => throw _privateConstructorUsedError;
  List<DeliveryModel>? get futureDeliveries =>
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
      List<Cycle>? pastCycles,
      bool hasCycleArrived,
      bool isLastDoseOfCycle,
      List<TaskModel>? tasks,
      List<DeliveryModel>? futureDeliveries,
      List<TaskModel>? futureTask,
      TaskModel? oldTask});
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
              as List<Cycle>?,
      hasCycleArrived: null == hasCycleArrived
          ? _value.hasCycleArrived
          : hasCycleArrived // ignore: cast_nullable_to_non_nullable
              as bool,
      isLastDoseOfCycle: null == isLastDoseOfCycle
          ? _value.isLastDoseOfCycle
          : isLastDoseOfCycle // ignore: cast_nullable_to_non_nullable
              as bool,
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      futureDeliveries: freezed == futureDeliveries
          ? _value.futureDeliveries
          : futureDeliveries // ignore: cast_nullable_to_non_nullable
              as List<DeliveryModel>?,
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
      List<Cycle>? pastCycles,
      bool hasCycleArrived,
      bool isLastDoseOfCycle,
      List<TaskModel>? tasks,
      List<DeliveryModel>? futureDeliveries,
      List<TaskModel>? futureTask,
      TaskModel? oldTask});
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
              as List<Cycle>?,
      hasCycleArrived: null == hasCycleArrived
          ? _value.hasCycleArrived
          : hasCycleArrived // ignore: cast_nullable_to_non_nullable
              as bool,
      isLastDoseOfCycle: null == isLastDoseOfCycle
          ? _value.isLastDoseOfCycle
          : isLastDoseOfCycle // ignore: cast_nullable_to_non_nullable
              as bool,
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      futureDeliveries: freezed == futureDeliveries
          ? _value._futureDeliveries
          : futureDeliveries // ignore: cast_nullable_to_non_nullable
              as List<DeliveryModel>?,
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
      final List<Cycle>? pastCycles,
      this.hasCycleArrived = true,
      this.isLastDoseOfCycle = false,
      final List<TaskModel>? tasks,
      final List<DeliveryModel>? futureDeliveries,
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
  final List<Cycle>? _pastCycles;
  @override
  List<Cycle>? get pastCycles {
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
  final List<TaskModel>? _tasks;
  @override
  List<TaskModel>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<DeliveryModel>? _futureDeliveries;
  @override
  List<DeliveryModel>? get futureDeliveries {
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
    return 'DeliverInterventionState(loading: $loading, isEditing: $isEditing, cycle: $cycle, dose: $dose, pastCycles: $pastCycles, hasCycleArrived: $hasCycleArrived, isLastDoseOfCycle: $isLastDoseOfCycle, tasks: $tasks, futureDeliveries: $futureDeliveries, futureTask: $futureTask, oldTask: $oldTask)';
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
      final List<Cycle>? pastCycles,
      final bool hasCycleArrived,
      final bool isLastDoseOfCycle,
      final List<TaskModel>? tasks,
      final List<DeliveryModel>? futureDeliveries,
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
  List<Cycle>? get pastCycles;
  @override
  bool get hasCycleArrived;
  @override
  bool get isLastDoseOfCycle;
  @override
  List<TaskModel>? get tasks;
  @override
  List<DeliveryModel>? get futureDeliveries;
  @override
  List<TaskModel>? get futureTask;
  @override
  TaskModel? get oldTask;
  @override
  @JsonKey(ignore: true)
  _$$DeliverInterventionStateImplCopyWith<_$DeliverInterventionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

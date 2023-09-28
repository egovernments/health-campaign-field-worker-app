// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
    required TResult Function(int dose, int cycle) selectCycleDose,
    required TResult Function(int dose, Cycle cycle) selectFutureCycleDose,
    required TResult Function(List<TaskModel> task) updateFutureTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult? Function(TaskSearchModel taskSearch)? handleSearch,
    TResult? Function(int dose, int cycle)? selectCycleDose,
    TResult? Function(int dose, Cycle cycle)? selectFutureCycleDose,
    TResult? Function(List<TaskModel> task)? updateFutureTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult Function(TaskSearchModel taskSearch)? handleSearch,
    TResult Function(int dose, int cycle)? selectCycleDose,
    TResult Function(int dose, Cycle cycle)? selectFutureCycleDose,
    TResult Function(List<TaskModel> task)? updateFutureTask,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeliverInterventionSubmitEvent value)
        handleSubmit,
    required TResult Function(DeliverInterventionSearchEvent value)
        handleSearch,
    required TResult Function(DeliverInterventionCycleDoseSelectionEvent value)
        selectCycleDose,
    required TResult Function(
            DeliverInterventionCycleFutureDoseSelectionEvent value)
        selectFutureCycleDose,
    required TResult Function(DeliverInterventionUpdateFutureTaskEvent value)
        updateFutureTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult? Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult? Function(DeliverInterventionCycleDoseSelectionEvent value)?
        selectCycleDose,
    TResult? Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult? Function(DeliverInterventionUpdateFutureTaskEvent value)?
        updateFutureTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult Function(DeliverInterventionCycleDoseSelectionEvent value)?
        selectCycleDose,
    TResult Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult Function(DeliverInterventionUpdateFutureTaskEvent value)?
        updateFutureTask,
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
abstract class _$$DeliverInterventionSubmitEventCopyWith<$Res> {
  factory _$$DeliverInterventionSubmitEventCopyWith(
          _$DeliverInterventionSubmitEvent value,
          $Res Function(_$DeliverInterventionSubmitEvent) then) =
      __$$DeliverInterventionSubmitEventCopyWithImpl<$Res>;
  @useResult
  $Res call({TaskModel task, bool isEditing, BoundaryModel boundaryModel});
}

/// @nodoc
class __$$DeliverInterventionSubmitEventCopyWithImpl<$Res>
    extends _$DeliverInterventionEventCopyWithImpl<$Res,
        _$DeliverInterventionSubmitEvent>
    implements _$$DeliverInterventionSubmitEventCopyWith<$Res> {
  __$$DeliverInterventionSubmitEventCopyWithImpl(
      _$DeliverInterventionSubmitEvent _value,
      $Res Function(_$DeliverInterventionSubmitEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? isEditing = null,
    Object? boundaryModel = null,
  }) {
    return _then(_$DeliverInterventionSubmitEvent(
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

class _$DeliverInterventionSubmitEvent
    implements DeliverInterventionSubmitEvent {
  const _$DeliverInterventionSubmitEvent(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliverInterventionSubmitEvent &&
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
  _$$DeliverInterventionSubmitEventCopyWith<_$DeliverInterventionSubmitEvent>
      get copyWith => __$$DeliverInterventionSubmitEventCopyWithImpl<
          _$DeliverInterventionSubmitEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)
        handleSubmit,
    required TResult Function(TaskSearchModel taskSearch) handleSearch,
    required TResult Function(int dose, int cycle) selectCycleDose,
    required TResult Function(int dose, Cycle cycle) selectFutureCycleDose,
    required TResult Function(List<TaskModel> task) updateFutureTask,
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
    TResult? Function(int dose, int cycle)? selectCycleDose,
    TResult? Function(int dose, Cycle cycle)? selectFutureCycleDose,
    TResult? Function(List<TaskModel> task)? updateFutureTask,
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
    TResult Function(int dose, int cycle)? selectCycleDose,
    TResult Function(int dose, Cycle cycle)? selectFutureCycleDose,
    TResult Function(List<TaskModel> task)? updateFutureTask,
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
    required TResult Function(DeliverInterventionCycleDoseSelectionEvent value)
        selectCycleDose,
    required TResult Function(
            DeliverInterventionCycleFutureDoseSelectionEvent value)
        selectFutureCycleDose,
    required TResult Function(DeliverInterventionUpdateFutureTaskEvent value)
        updateFutureTask,
  }) {
    return handleSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult? Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult? Function(DeliverInterventionCycleDoseSelectionEvent value)?
        selectCycleDose,
    TResult? Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult? Function(DeliverInterventionUpdateFutureTaskEvent value)?
        updateFutureTask,
  }) {
    return handleSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult Function(DeliverInterventionCycleDoseSelectionEvent value)?
        selectCycleDose,
    TResult Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult Function(DeliverInterventionUpdateFutureTaskEvent value)?
        updateFutureTask,
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
      final BoundaryModel boundaryModel) = _$DeliverInterventionSubmitEvent;

  TaskModel get task;
  bool get isEditing;
  BoundaryModel get boundaryModel;
  @JsonKey(ignore: true)
  _$$DeliverInterventionSubmitEventCopyWith<_$DeliverInterventionSubmitEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeliverInterventionSearchEventCopyWith<$Res> {
  factory _$$DeliverInterventionSearchEventCopyWith(
          _$DeliverInterventionSearchEvent value,
          $Res Function(_$DeliverInterventionSearchEvent) then) =
      __$$DeliverInterventionSearchEventCopyWithImpl<$Res>;
  @useResult
  $Res call({TaskSearchModel taskSearch});
}

/// @nodoc
class __$$DeliverInterventionSearchEventCopyWithImpl<$Res>
    extends _$DeliverInterventionEventCopyWithImpl<$Res,
        _$DeliverInterventionSearchEvent>
    implements _$$DeliverInterventionSearchEventCopyWith<$Res> {
  __$$DeliverInterventionSearchEventCopyWithImpl(
      _$DeliverInterventionSearchEvent _value,
      $Res Function(_$DeliverInterventionSearchEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskSearch = null,
  }) {
    return _then(_$DeliverInterventionSearchEvent(
      null == taskSearch
          ? _value.taskSearch
          : taskSearch // ignore: cast_nullable_to_non_nullable
              as TaskSearchModel,
    ));
  }
}

/// @nodoc

class _$DeliverInterventionSearchEvent
    implements DeliverInterventionSearchEvent {
  const _$DeliverInterventionSearchEvent(this.taskSearch);

  @override
  final TaskSearchModel taskSearch;

  @override
  String toString() {
    return 'DeliverInterventionEvent.handleSearch(taskSearch: $taskSearch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliverInterventionSearchEvent &&
            (identical(other.taskSearch, taskSearch) ||
                other.taskSearch == taskSearch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskSearch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliverInterventionSearchEventCopyWith<_$DeliverInterventionSearchEvent>
      get copyWith => __$$DeliverInterventionSearchEventCopyWithImpl<
          _$DeliverInterventionSearchEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)
        handleSubmit,
    required TResult Function(TaskSearchModel taskSearch) handleSearch,
    required TResult Function(int dose, int cycle) selectCycleDose,
    required TResult Function(int dose, Cycle cycle) selectFutureCycleDose,
    required TResult Function(List<TaskModel> task) updateFutureTask,
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
    TResult? Function(int dose, int cycle)? selectCycleDose,
    TResult? Function(int dose, Cycle cycle)? selectFutureCycleDose,
    TResult? Function(List<TaskModel> task)? updateFutureTask,
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
    TResult Function(int dose, int cycle)? selectCycleDose,
    TResult Function(int dose, Cycle cycle)? selectFutureCycleDose,
    TResult Function(List<TaskModel> task)? updateFutureTask,
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
    required TResult Function(DeliverInterventionCycleDoseSelectionEvent value)
        selectCycleDose,
    required TResult Function(
            DeliverInterventionCycleFutureDoseSelectionEvent value)
        selectFutureCycleDose,
    required TResult Function(DeliverInterventionUpdateFutureTaskEvent value)
        updateFutureTask,
  }) {
    return handleSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult? Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult? Function(DeliverInterventionCycleDoseSelectionEvent value)?
        selectCycleDose,
    TResult? Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult? Function(DeliverInterventionUpdateFutureTaskEvent value)?
        updateFutureTask,
  }) {
    return handleSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult Function(DeliverInterventionCycleDoseSelectionEvent value)?
        selectCycleDose,
    TResult Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult Function(DeliverInterventionUpdateFutureTaskEvent value)?
        updateFutureTask,
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
      final TaskSearchModel taskSearch) = _$DeliverInterventionSearchEvent;

  TaskSearchModel get taskSearch;
  @JsonKey(ignore: true)
  _$$DeliverInterventionSearchEventCopyWith<_$DeliverInterventionSearchEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeliverInterventionCycleDoseSelectionEventCopyWith<$Res> {
  factory _$$DeliverInterventionCycleDoseSelectionEventCopyWith(
          _$DeliverInterventionCycleDoseSelectionEvent value,
          $Res Function(_$DeliverInterventionCycleDoseSelectionEvent) then) =
      __$$DeliverInterventionCycleDoseSelectionEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int dose, int cycle});
}

/// @nodoc
class __$$DeliverInterventionCycleDoseSelectionEventCopyWithImpl<$Res>
    extends _$DeliverInterventionEventCopyWithImpl<$Res,
        _$DeliverInterventionCycleDoseSelectionEvent>
    implements _$$DeliverInterventionCycleDoseSelectionEventCopyWith<$Res> {
  __$$DeliverInterventionCycleDoseSelectionEventCopyWithImpl(
      _$DeliverInterventionCycleDoseSelectionEvent _value,
      $Res Function(_$DeliverInterventionCycleDoseSelectionEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dose = null,
    Object? cycle = null,
  }) {
    return _then(_$DeliverInterventionCycleDoseSelectionEvent(
      null == dose
          ? _value.dose
          : dose // ignore: cast_nullable_to_non_nullable
              as int,
      null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeliverInterventionCycleDoseSelectionEvent
    implements DeliverInterventionCycleDoseSelectionEvent {
  const _$DeliverInterventionCycleDoseSelectionEvent(this.dose, this.cycle);

  @override
  final int dose;
  @override
  final int cycle;

  @override
  String toString() {
    return 'DeliverInterventionEvent.selectCycleDose(dose: $dose, cycle: $cycle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliverInterventionCycleDoseSelectionEvent &&
            (identical(other.dose, dose) || other.dose == dose) &&
            (identical(other.cycle, cycle) || other.cycle == cycle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dose, cycle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliverInterventionCycleDoseSelectionEventCopyWith<
          _$DeliverInterventionCycleDoseSelectionEvent>
      get copyWith =>
          __$$DeliverInterventionCycleDoseSelectionEventCopyWithImpl<
              _$DeliverInterventionCycleDoseSelectionEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)
        handleSubmit,
    required TResult Function(TaskSearchModel taskSearch) handleSearch,
    required TResult Function(int dose, int cycle) selectCycleDose,
    required TResult Function(int dose, Cycle cycle) selectFutureCycleDose,
    required TResult Function(List<TaskModel> task) updateFutureTask,
  }) {
    return selectCycleDose(dose, cycle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult? Function(TaskSearchModel taskSearch)? handleSearch,
    TResult? Function(int dose, int cycle)? selectCycleDose,
    TResult? Function(int dose, Cycle cycle)? selectFutureCycleDose,
    TResult? Function(List<TaskModel> task)? updateFutureTask,
  }) {
    return selectCycleDose?.call(dose, cycle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult Function(TaskSearchModel taskSearch)? handleSearch,
    TResult Function(int dose, int cycle)? selectCycleDose,
    TResult Function(int dose, Cycle cycle)? selectFutureCycleDose,
    TResult Function(List<TaskModel> task)? updateFutureTask,
    required TResult orElse(),
  }) {
    if (selectCycleDose != null) {
      return selectCycleDose(dose, cycle);
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
    required TResult Function(DeliverInterventionCycleDoseSelectionEvent value)
        selectCycleDose,
    required TResult Function(
            DeliverInterventionCycleFutureDoseSelectionEvent value)
        selectFutureCycleDose,
    required TResult Function(DeliverInterventionUpdateFutureTaskEvent value)
        updateFutureTask,
  }) {
    return selectCycleDose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult? Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult? Function(DeliverInterventionCycleDoseSelectionEvent value)?
        selectCycleDose,
    TResult? Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult? Function(DeliverInterventionUpdateFutureTaskEvent value)?
        updateFutureTask,
  }) {
    return selectCycleDose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult Function(DeliverInterventionCycleDoseSelectionEvent value)?
        selectCycleDose,
    TResult Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult Function(DeliverInterventionUpdateFutureTaskEvent value)?
        updateFutureTask,
    required TResult orElse(),
  }) {
    if (selectCycleDose != null) {
      return selectCycleDose(this);
    }
    return orElse();
  }
}

abstract class DeliverInterventionCycleDoseSelectionEvent
    implements DeliverInterventionEvent {
  const factory DeliverInterventionCycleDoseSelectionEvent(
          final int dose, final int cycle) =
      _$DeliverInterventionCycleDoseSelectionEvent;

  int get dose;
  int get cycle;
  @JsonKey(ignore: true)
  _$$DeliverInterventionCycleDoseSelectionEventCopyWith<
          _$DeliverInterventionCycleDoseSelectionEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeliverInterventionCycleFutureDoseSelectionEventCopyWith<
    $Res> {
  factory _$$DeliverInterventionCycleFutureDoseSelectionEventCopyWith(
          _$DeliverInterventionCycleFutureDoseSelectionEvent value,
          $Res Function(_$DeliverInterventionCycleFutureDoseSelectionEvent)
              then) =
      __$$DeliverInterventionCycleFutureDoseSelectionEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int dose, Cycle cycle});

  $CycleCopyWith<$Res> get cycle;
}

/// @nodoc
class __$$DeliverInterventionCycleFutureDoseSelectionEventCopyWithImpl<$Res>
    extends _$DeliverInterventionEventCopyWithImpl<$Res,
        _$DeliverInterventionCycleFutureDoseSelectionEvent>
    implements
        _$$DeliverInterventionCycleFutureDoseSelectionEventCopyWith<$Res> {
  __$$DeliverInterventionCycleFutureDoseSelectionEventCopyWithImpl(
      _$DeliverInterventionCycleFutureDoseSelectionEvent _value,
      $Res Function(_$DeliverInterventionCycleFutureDoseSelectionEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dose = null,
    Object? cycle = null,
  }) {
    return _then(_$DeliverInterventionCycleFutureDoseSelectionEvent(
      null == dose
          ? _value.dose
          : dose // ignore: cast_nullable_to_non_nullable
              as int,
      null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as Cycle,
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

class _$DeliverInterventionCycleFutureDoseSelectionEvent
    implements DeliverInterventionCycleFutureDoseSelectionEvent {
  const _$DeliverInterventionCycleFutureDoseSelectionEvent(
      this.dose, this.cycle);

  @override
  final int dose;
  @override
  final Cycle cycle;

  @override
  String toString() {
    return 'DeliverInterventionEvent.selectFutureCycleDose(dose: $dose, cycle: $cycle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliverInterventionCycleFutureDoseSelectionEvent &&
            (identical(other.dose, dose) || other.dose == dose) &&
            (identical(other.cycle, cycle) || other.cycle == cycle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dose, cycle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliverInterventionCycleFutureDoseSelectionEventCopyWith<
          _$DeliverInterventionCycleFutureDoseSelectionEvent>
      get copyWith =>
          __$$DeliverInterventionCycleFutureDoseSelectionEventCopyWithImpl<
                  _$DeliverInterventionCycleFutureDoseSelectionEvent>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)
        handleSubmit,
    required TResult Function(TaskSearchModel taskSearch) handleSearch,
    required TResult Function(int dose, int cycle) selectCycleDose,
    required TResult Function(int dose, Cycle cycle) selectFutureCycleDose,
    required TResult Function(List<TaskModel> task) updateFutureTask,
  }) {
    return selectFutureCycleDose(dose, cycle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult? Function(TaskSearchModel taskSearch)? handleSearch,
    TResult? Function(int dose, int cycle)? selectCycleDose,
    TResult? Function(int dose, Cycle cycle)? selectFutureCycleDose,
    TResult? Function(List<TaskModel> task)? updateFutureTask,
  }) {
    return selectFutureCycleDose?.call(dose, cycle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult Function(TaskSearchModel taskSearch)? handleSearch,
    TResult Function(int dose, int cycle)? selectCycleDose,
    TResult Function(int dose, Cycle cycle)? selectFutureCycleDose,
    TResult Function(List<TaskModel> task)? updateFutureTask,
    required TResult orElse(),
  }) {
    if (selectFutureCycleDose != null) {
      return selectFutureCycleDose(dose, cycle);
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
    required TResult Function(DeliverInterventionCycleDoseSelectionEvent value)
        selectCycleDose,
    required TResult Function(
            DeliverInterventionCycleFutureDoseSelectionEvent value)
        selectFutureCycleDose,
    required TResult Function(DeliverInterventionUpdateFutureTaskEvent value)
        updateFutureTask,
  }) {
    return selectFutureCycleDose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult? Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult? Function(DeliverInterventionCycleDoseSelectionEvent value)?
        selectCycleDose,
    TResult? Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult? Function(DeliverInterventionUpdateFutureTaskEvent value)?
        updateFutureTask,
  }) {
    return selectFutureCycleDose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult Function(DeliverInterventionCycleDoseSelectionEvent value)?
        selectCycleDose,
    TResult Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult Function(DeliverInterventionUpdateFutureTaskEvent value)?
        updateFutureTask,
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
          final int dose, final Cycle cycle) =
      _$DeliverInterventionCycleFutureDoseSelectionEvent;

  int get dose;
  Cycle get cycle;
  @JsonKey(ignore: true)
  _$$DeliverInterventionCycleFutureDoseSelectionEventCopyWith<
          _$DeliverInterventionCycleFutureDoseSelectionEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeliverInterventionUpdateFutureTaskEventCopyWith<$Res> {
  factory _$$DeliverInterventionUpdateFutureTaskEventCopyWith(
          _$DeliverInterventionUpdateFutureTaskEvent value,
          $Res Function(_$DeliverInterventionUpdateFutureTaskEvent) then) =
      __$$DeliverInterventionUpdateFutureTaskEventCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TaskModel> task});
}

/// @nodoc
class __$$DeliverInterventionUpdateFutureTaskEventCopyWithImpl<$Res>
    extends _$DeliverInterventionEventCopyWithImpl<$Res,
        _$DeliverInterventionUpdateFutureTaskEvent>
    implements _$$DeliverInterventionUpdateFutureTaskEventCopyWith<$Res> {
  __$$DeliverInterventionUpdateFutureTaskEventCopyWithImpl(
      _$DeliverInterventionUpdateFutureTaskEvent _value,
      $Res Function(_$DeliverInterventionUpdateFutureTaskEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$DeliverInterventionUpdateFutureTaskEvent(
      null == task
          ? _value._task
          : task // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ));
  }
}

/// @nodoc

class _$DeliverInterventionUpdateFutureTaskEvent
    implements DeliverInterventionUpdateFutureTaskEvent {
  const _$DeliverInterventionUpdateFutureTaskEvent(final List<TaskModel> task)
      : _task = task;

  final List<TaskModel> _task;
  @override
  List<TaskModel> get task {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_task);
  }

  @override
  String toString() {
    return 'DeliverInterventionEvent.updateFutureTask(task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliverInterventionUpdateFutureTaskEvent &&
            const DeepCollectionEquality().equals(other._task, _task));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_task));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliverInterventionUpdateFutureTaskEventCopyWith<
          _$DeliverInterventionUpdateFutureTaskEvent>
      get copyWith => __$$DeliverInterventionUpdateFutureTaskEventCopyWithImpl<
          _$DeliverInterventionUpdateFutureTaskEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)
        handleSubmit,
    required TResult Function(TaskSearchModel taskSearch) handleSearch,
    required TResult Function(int dose, int cycle) selectCycleDose,
    required TResult Function(int dose, Cycle cycle) selectFutureCycleDose,
    required TResult Function(List<TaskModel> task) updateFutureTask,
  }) {
    return updateFutureTask(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult? Function(TaskSearchModel taskSearch)? handleSearch,
    TResult? Function(int dose, int cycle)? selectCycleDose,
    TResult? Function(int dose, Cycle cycle)? selectFutureCycleDose,
    TResult? Function(List<TaskModel> task)? updateFutureTask,
  }) {
    return updateFutureTask?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TaskModel task, bool isEditing, BoundaryModel boundaryModel)?
        handleSubmit,
    TResult Function(TaskSearchModel taskSearch)? handleSearch,
    TResult Function(int dose, int cycle)? selectCycleDose,
    TResult Function(int dose, Cycle cycle)? selectFutureCycleDose,
    TResult Function(List<TaskModel> task)? updateFutureTask,
    required TResult orElse(),
  }) {
    if (updateFutureTask != null) {
      return updateFutureTask(task);
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
    required TResult Function(DeliverInterventionCycleDoseSelectionEvent value)
        selectCycleDose,
    required TResult Function(
            DeliverInterventionCycleFutureDoseSelectionEvent value)
        selectFutureCycleDose,
    required TResult Function(DeliverInterventionUpdateFutureTaskEvent value)
        updateFutureTask,
  }) {
    return updateFutureTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult? Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult? Function(DeliverInterventionCycleDoseSelectionEvent value)?
        selectCycleDose,
    TResult? Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult? Function(DeliverInterventionUpdateFutureTaskEvent value)?
        updateFutureTask,
  }) {
    return updateFutureTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeliverInterventionSubmitEvent value)? handleSubmit,
    TResult Function(DeliverInterventionSearchEvent value)? handleSearch,
    TResult Function(DeliverInterventionCycleDoseSelectionEvent value)?
        selectCycleDose,
    TResult Function(DeliverInterventionCycleFutureDoseSelectionEvent value)?
        selectFutureCycleDose,
    TResult Function(DeliverInterventionUpdateFutureTaskEvent value)?
        updateFutureTask,
    required TResult orElse(),
  }) {
    if (updateFutureTask != null) {
      return updateFutureTask(this);
    }
    return orElse();
  }
}

abstract class DeliverInterventionUpdateFutureTaskEvent
    implements DeliverInterventionEvent {
  const factory DeliverInterventionUpdateFutureTaskEvent(
      final List<TaskModel> task) = _$DeliverInterventionUpdateFutureTaskEvent;

  List<TaskModel> get task;
  @JsonKey(ignore: true)
  _$$DeliverInterventionUpdateFutureTaskEventCopyWith<
          _$DeliverInterventionUpdateFutureTaskEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeliverInterventionState {
  bool get loading => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  int get cycle => throw _privateConstructorUsedError;
  int get dose => throw _privateConstructorUsedError;
  List<TaskModel>? get tasks => throw _privateConstructorUsedError;
  List<DeliveryModel>? get futureDeliveries =>
      throw _privateConstructorUsedError;
  List<TaskModel>? get filteredFutureTask => throw _privateConstructorUsedError;

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
      List<TaskModel>? tasks,
      List<DeliveryModel>? futureDeliveries,
      List<TaskModel>? filteredFutureTask});
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
    Object? tasks = freezed,
    Object? futureDeliveries = freezed,
    Object? filteredFutureTask = freezed,
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
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      futureDeliveries: freezed == futureDeliveries
          ? _value.futureDeliveries
          : futureDeliveries // ignore: cast_nullable_to_non_nullable
              as List<DeliveryModel>?,
      filteredFutureTask: freezed == filteredFutureTask
          ? _value.filteredFutureTask
          : filteredFutureTask // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliverInterventionStateCopyWith<$Res>
    implements $DeliverInterventionStateCopyWith<$Res> {
  factory _$$_DeliverInterventionStateCopyWith(
          _$_DeliverInterventionState value,
          $Res Function(_$_DeliverInterventionState) then) =
      __$$_DeliverInterventionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool isEditing,
      int cycle,
      int dose,
      List<TaskModel>? tasks,
      List<DeliveryModel>? futureDeliveries,
      List<TaskModel>? filteredFutureTask});
}

/// @nodoc
class __$$_DeliverInterventionStateCopyWithImpl<$Res>
    extends _$DeliverInterventionStateCopyWithImpl<$Res,
        _$_DeliverInterventionState>
    implements _$$_DeliverInterventionStateCopyWith<$Res> {
  __$$_DeliverInterventionStateCopyWithImpl(_$_DeliverInterventionState _value,
      $Res Function(_$_DeliverInterventionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditing = null,
    Object? cycle = null,
    Object? dose = null,
    Object? tasks = freezed,
    Object? futureDeliveries = freezed,
    Object? filteredFutureTask = freezed,
  }) {
    return _then(_$_DeliverInterventionState(
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
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      futureDeliveries: freezed == futureDeliveries
          ? _value._futureDeliveries
          : futureDeliveries // ignore: cast_nullable_to_non_nullable
              as List<DeliveryModel>?,
      filteredFutureTask: freezed == filteredFutureTask
          ? _value._filteredFutureTask
          : filteredFutureTask // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
    ));
  }
}

/// @nodoc

class _$_DeliverInterventionState implements _DeliverInterventionState {
  const _$_DeliverInterventionState(
      {this.loading = false,
      this.isEditing = false,
      this.cycle = 0,
      this.dose = 0,
      final List<TaskModel>? tasks,
      final List<DeliveryModel>? futureDeliveries,
      final List<TaskModel>? filteredFutureTask})
      : _tasks = tasks,
        _futureDeliveries = futureDeliveries,
        _filteredFutureTask = filteredFutureTask;

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
  final List<TaskModel>? _tasks;
  @override
  List<TaskModel>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<DeliveryModel>? _futureDeliveries;
  @override
  List<DeliveryModel>? get futureDeliveries {
    final value = _futureDeliveries;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TaskModel>? _filteredFutureTask;
  @override
  List<TaskModel>? get filteredFutureTask {
    final value = _filteredFutureTask;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DeliverInterventionState(loading: $loading, isEditing: $isEditing, cycle: $cycle, dose: $dose, tasks: $tasks, futureDeliveries: $futureDeliveries, filteredFutureTask: $filteredFutureTask)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliverInterventionState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.dose, dose) || other.dose == dose) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._futureDeliveries, _futureDeliveries) &&
            const DeepCollectionEquality()
                .equals(other._filteredFutureTask, _filteredFutureTask));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      isEditing,
      cycle,
      dose,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_futureDeliveries),
      const DeepCollectionEquality().hash(_filteredFutureTask));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeliverInterventionStateCopyWith<_$_DeliverInterventionState>
      get copyWith => __$$_DeliverInterventionStateCopyWithImpl<
          _$_DeliverInterventionState>(this, _$identity);
}

abstract class _DeliverInterventionState implements DeliverInterventionState {
  const factory _DeliverInterventionState(
      {final bool loading,
      final bool isEditing,
      final int cycle,
      final int dose,
      final List<TaskModel>? tasks,
      final List<DeliveryModel>? futureDeliveries,
      final List<TaskModel>? filteredFutureTask}) = _$_DeliverInterventionState;

  @override
  bool get loading;
  @override
  bool get isEditing;
  @override
  int get cycle;
  @override
  int get dose;
  @override
  List<TaskModel>? get tasks;
  @override
  List<DeliveryModel>? get futureDeliveries;
  @override
  List<TaskModel>? get filteredFutureTask;
  @override
  @JsonKey(ignore: true)
  _$$_DeliverInterventionStateCopyWith<_$_DeliverInterventionState>
      get copyWith => throw _privateConstructorUsedError;
}

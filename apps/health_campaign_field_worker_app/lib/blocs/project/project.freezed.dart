// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectEvent()';
}


}

/// @nodoc
class $ProjectEventCopyWith<$Res>  {
$ProjectEventCopyWith(ProjectEvent _, $Res Function(ProjectEvent) __);
}


/// Adds pattern-matching-related methods to [ProjectEvent].
extension ProjectEventPatterns on ProjectEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProjectInitializeEvent value)?  initialize,TResult Function( ProjectSelectProjectEvent value)?  selectProject,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProjectInitializeEvent() when initialize != null:
return initialize(_that);case ProjectSelectProjectEvent() when selectProject != null:
return selectProject(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProjectInitializeEvent value)  initialize,required TResult Function( ProjectSelectProjectEvent value)  selectProject,}){
final _that = this;
switch (_that) {
case ProjectInitializeEvent():
return initialize(_that);case ProjectSelectProjectEvent():
return selectProject(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProjectInitializeEvent value)?  initialize,TResult? Function( ProjectSelectProjectEvent value)?  selectProject,}){
final _that = this;
switch (_that) {
case ProjectInitializeEvent() when initialize != null:
return initialize(_that);case ProjectSelectProjectEvent() when selectProject != null:
return selectProject(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialize,TResult Function( ProjectModel model)?  selectProject,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProjectInitializeEvent() when initialize != null:
return initialize();case ProjectSelectProjectEvent() when selectProject != null:
return selectProject(_that.model);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialize,required TResult Function( ProjectModel model)  selectProject,}) {final _that = this;
switch (_that) {
case ProjectInitializeEvent():
return initialize();case ProjectSelectProjectEvent():
return selectProject(_that.model);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialize,TResult? Function( ProjectModel model)?  selectProject,}) {final _that = this;
switch (_that) {
case ProjectInitializeEvent() when initialize != null:
return initialize();case ProjectSelectProjectEvent() when selectProject != null:
return selectProject(_that.model);case _:
  return null;

}
}

}

/// @nodoc


class ProjectInitializeEvent implements ProjectEvent {
  const ProjectInitializeEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectInitializeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectEvent.initialize()';
}


}




/// @nodoc


class ProjectSelectProjectEvent implements ProjectEvent {
  const ProjectSelectProjectEvent(this.model);
  

 final  ProjectModel model;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectSelectProjectEventCopyWith<ProjectSelectProjectEvent> get copyWith => _$ProjectSelectProjectEventCopyWithImpl<ProjectSelectProjectEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectSelectProjectEvent&&(identical(other.model, model) || other.model == model));
}


@override
int get hashCode => Object.hash(runtimeType,model);

@override
String toString() {
  return 'ProjectEvent.selectProject(model: $model)';
}


}

/// @nodoc
abstract mixin class $ProjectSelectProjectEventCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory $ProjectSelectProjectEventCopyWith(ProjectSelectProjectEvent value, $Res Function(ProjectSelectProjectEvent) _then) = _$ProjectSelectProjectEventCopyWithImpl;
@useResult
$Res call({
 ProjectModel model
});




}
/// @nodoc
class _$ProjectSelectProjectEventCopyWithImpl<$Res>
    implements $ProjectSelectProjectEventCopyWith<$Res> {
  _$ProjectSelectProjectEventCopyWithImpl(this._self, this._then);

  final ProjectSelectProjectEvent _self;
  final $Res Function(ProjectSelectProjectEvent) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? model = null,}) {
  return _then(ProjectSelectProjectEvent(
null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as ProjectModel,
  ));
}


}

/// @nodoc
mixin _$ProjectState {

 List<ProjectModel> get projects; ProjectType? get projectType; ProjectCycle? get selectedCycle; ProjectModel? get selectedProject; bool get loading; ProjectSyncErrorType? get syncError;
/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectStateCopyWith<ProjectState> get copyWith => _$ProjectStateCopyWithImpl<ProjectState>(this as ProjectState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectState&&const DeepCollectionEquality().equals(other.projects, projects)&&(identical(other.projectType, projectType) || other.projectType == projectType)&&(identical(other.selectedCycle, selectedCycle) || other.selectedCycle == selectedCycle)&&(identical(other.selectedProject, selectedProject) || other.selectedProject == selectedProject)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.syncError, syncError) || other.syncError == syncError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(projects),projectType,selectedCycle,selectedProject,loading,syncError);

@override
String toString() {
  return 'ProjectState(projects: $projects, projectType: $projectType, selectedCycle: $selectedCycle, selectedProject: $selectedProject, loading: $loading, syncError: $syncError)';
}


}

/// @nodoc
abstract mixin class $ProjectStateCopyWith<$Res>  {
  factory $ProjectStateCopyWith(ProjectState value, $Res Function(ProjectState) _then) = _$ProjectStateCopyWithImpl;
@useResult
$Res call({
 List<ProjectModel> projects, ProjectType? projectType, ProjectCycle? selectedCycle, ProjectModel? selectedProject, bool loading, ProjectSyncErrorType? syncError
});


$ProjectTypeCopyWith<$Res>? get projectType;

}
/// @nodoc
class _$ProjectStateCopyWithImpl<$Res>
    implements $ProjectStateCopyWith<$Res> {
  _$ProjectStateCopyWithImpl(this._self, this._then);

  final ProjectState _self;
  final $Res Function(ProjectState) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projects = null,Object? projectType = freezed,Object? selectedCycle = freezed,Object? selectedProject = freezed,Object? loading = null,Object? syncError = freezed,}) {
  return _then(_self.copyWith(
projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectModel>,projectType: freezed == projectType ? _self.projectType : projectType // ignore: cast_nullable_to_non_nullable
as ProjectType?,selectedCycle: freezed == selectedCycle ? _self.selectedCycle : selectedCycle // ignore: cast_nullable_to_non_nullable
as ProjectCycle?,selectedProject: freezed == selectedProject ? _self.selectedProject : selectedProject // ignore: cast_nullable_to_non_nullable
as ProjectModel?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as ProjectSyncErrorType?,
  ));
}
/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectTypeCopyWith<$Res>? get projectType {
    if (_self.projectType == null) {
    return null;
  }

  return $ProjectTypeCopyWith<$Res>(_self.projectType!, (value) {
    return _then(_self.copyWith(projectType: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectState].
extension ProjectStatePatterns on ProjectState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectState value)  $default,){
final _that = this;
switch (_that) {
case _ProjectState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectState value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProjectModel> projects,  ProjectType? projectType,  ProjectCycle? selectedCycle,  ProjectModel? selectedProject,  bool loading,  ProjectSyncErrorType? syncError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectState() when $default != null:
return $default(_that.projects,_that.projectType,_that.selectedCycle,_that.selectedProject,_that.loading,_that.syncError);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProjectModel> projects,  ProjectType? projectType,  ProjectCycle? selectedCycle,  ProjectModel? selectedProject,  bool loading,  ProjectSyncErrorType? syncError)  $default,) {final _that = this;
switch (_that) {
case _ProjectState():
return $default(_that.projects,_that.projectType,_that.selectedCycle,_that.selectedProject,_that.loading,_that.syncError);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProjectModel> projects,  ProjectType? projectType,  ProjectCycle? selectedCycle,  ProjectModel? selectedProject,  bool loading,  ProjectSyncErrorType? syncError)?  $default,) {final _that = this;
switch (_that) {
case _ProjectState() when $default != null:
return $default(_that.projects,_that.projectType,_that.selectedCycle,_that.selectedProject,_that.loading,_that.syncError);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectState extends ProjectState {
  const _ProjectState({final  List<ProjectModel> projects = const [], this.projectType, this.selectedCycle, this.selectedProject, this.loading = false, this.syncError}): _projects = projects,super._();
  

 final  List<ProjectModel> _projects;
@override@JsonKey() List<ProjectModel> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

@override final  ProjectType? projectType;
@override final  ProjectCycle? selectedCycle;
@override final  ProjectModel? selectedProject;
@override@JsonKey() final  bool loading;
@override final  ProjectSyncErrorType? syncError;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectStateCopyWith<_ProjectState> get copyWith => __$ProjectStateCopyWithImpl<_ProjectState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectState&&const DeepCollectionEquality().equals(other._projects, _projects)&&(identical(other.projectType, projectType) || other.projectType == projectType)&&(identical(other.selectedCycle, selectedCycle) || other.selectedCycle == selectedCycle)&&(identical(other.selectedProject, selectedProject) || other.selectedProject == selectedProject)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.syncError, syncError) || other.syncError == syncError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects),projectType,selectedCycle,selectedProject,loading,syncError);

@override
String toString() {
  return 'ProjectState(projects: $projects, projectType: $projectType, selectedCycle: $selectedCycle, selectedProject: $selectedProject, loading: $loading, syncError: $syncError)';
}


}

/// @nodoc
abstract mixin class _$ProjectStateCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory _$ProjectStateCopyWith(_ProjectState value, $Res Function(_ProjectState) _then) = __$ProjectStateCopyWithImpl;
@override @useResult
$Res call({
 List<ProjectModel> projects, ProjectType? projectType, ProjectCycle? selectedCycle, ProjectModel? selectedProject, bool loading, ProjectSyncErrorType? syncError
});


@override $ProjectTypeCopyWith<$Res>? get projectType;

}
/// @nodoc
class __$ProjectStateCopyWithImpl<$Res>
    implements _$ProjectStateCopyWith<$Res> {
  __$ProjectStateCopyWithImpl(this._self, this._then);

  final _ProjectState _self;
  final $Res Function(_ProjectState) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projects = null,Object? projectType = freezed,Object? selectedCycle = freezed,Object? selectedProject = freezed,Object? loading = null,Object? syncError = freezed,}) {
  return _then(_ProjectState(
projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectModel>,projectType: freezed == projectType ? _self.projectType : projectType // ignore: cast_nullable_to_non_nullable
as ProjectType?,selectedCycle: freezed == selectedCycle ? _self.selectedCycle : selectedCycle // ignore: cast_nullable_to_non_nullable
as ProjectCycle?,selectedProject: freezed == selectedProject ? _self.selectedProject : selectedProject // ignore: cast_nullable_to_non_nullable
as ProjectModel?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as ProjectSyncErrorType?,
  ));
}

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectTypeCopyWith<$Res>? get projectType {
    if (_self.projectType == null) {
    return null;
  }

  return $ProjectTypeCopyWith<$Res>(_self.projectType!, (value) {
    return _then(_self.copyWith(projectType: value));
  });
}
}

// dart format on

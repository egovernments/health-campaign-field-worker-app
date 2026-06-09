// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServiceEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServiceEvent()';
  }
}

/// @nodoc
class $ServiceEventCopyWith<$Res> {
  $ServiceEventCopyWith(ServiceEvent _, $Res Function(ServiceEvent) __);
}

/// Adds pattern-matching-related methods to [ServiceEvent].
extension ServiceEventPatterns on ServiceEvent {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceUpdateEvent value)? update,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ServiceCreateEvent() when create != null:
        return create(_that);
      case ServiceUpdateEvent() when update != null:
        return update(_that);
      case ServiceSearchEvent() when search != null:
        return search(_that);
      case ServiceSurveyFormEvent() when multiSurveyFormChanged != null:
        return multiSurveyFormChanged(_that);
      case ServiceSelectionEvent() when selectService != null:
        return selectService(_that);
      case ServiceResetEvent() when resetSelected != null:
        return resetSelected(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceCreateEvent value) create,
    required TResult Function(ServiceUpdateEvent value) update,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceSurveyFormEvent value)
        multiSurveyFormChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceCreateEvent():
        return create(_that);
      case ServiceUpdateEvent():
        return update(_that);
      case ServiceSearchEvent():
        return search(_that);
      case ServiceSurveyFormEvent():
        return multiSurveyFormChanged(_that);
      case ServiceSelectionEvent():
        return selectService(_that);
      case ServiceResetEvent():
        return resetSelected(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceUpdateEvent value)? update,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceCreateEvent() when create != null:
        return create(_that);
      case ServiceUpdateEvent() when update != null:
        return update(_that);
      case ServiceSearchEvent() when search != null:
        return search(_that);
      case ServiceSurveyFormEvent() when multiSurveyFormChanged != null:
        return multiSurveyFormChanged(_that);
      case ServiceSelectionEvent() when selectService != null:
        return selectService(_that);
      case ServiceResetEvent() when resetSelected != null:
        return resetSelected(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceModel serviceModel)? update,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ServiceCreateEvent() when create != null:
        return create(_that.serviceModel);
      case ServiceUpdateEvent() when update != null:
        return update(_that.serviceModel);
      case ServiceSearchEvent() when search != null:
        return search(_that.serviceSearchModel);
      case ServiceSurveyFormEvent() when multiSurveyFormChanged != null:
        return multiSurveyFormChanged(_that.value, _that.submitTriggered);
      case ServiceSelectionEvent() when selectService != null:
        return selectService(_that.service);
      case ServiceResetEvent() when resetSelected != null:
        return resetSelected(_that.serviceList);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ServiceModel serviceModel) create,
    required TResult Function(ServiceModel serviceModel) update,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multiSurveyFormChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceCreateEvent():
        return create(_that.serviceModel);
      case ServiceUpdateEvent():
        return update(_that.serviceModel);
      case ServiceSearchEvent():
        return search(_that.serviceSearchModel);
      case ServiceSurveyFormEvent():
        return multiSurveyFormChanged(_that.value, _that.submitTriggered);
      case ServiceSelectionEvent():
        return selectService(_that.service);
      case ServiceResetEvent():
        return resetSelected(_that.serviceList);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceModel serviceModel)? update,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceCreateEvent() when create != null:
        return create(_that.serviceModel);
      case ServiceUpdateEvent() when update != null:
        return update(_that.serviceModel);
      case ServiceSearchEvent() when search != null:
        return search(_that.serviceSearchModel);
      case ServiceSurveyFormEvent() when multiSurveyFormChanged != null:
        return multiSurveyFormChanged(_that.value, _that.submitTriggered);
      case ServiceSelectionEvent() when selectService != null:
        return selectService(_that.service);
      case ServiceResetEvent() when resetSelected != null:
        return resetSelected(_that.serviceList);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ServiceCreateEvent implements ServiceEvent {
  const ServiceCreateEvent({required this.serviceModel});

  final ServiceModel serviceModel;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceCreateEventCopyWith<ServiceCreateEvent> get copyWith =>
      _$ServiceCreateEventCopyWithImpl<ServiceCreateEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceCreateEvent &&
            (identical(other.serviceModel, serviceModel) ||
                other.serviceModel == serviceModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceModel);

  @override
  String toString() {
    return 'ServiceEvent.create(serviceModel: $serviceModel)';
  }
}

/// @nodoc
abstract mixin class $ServiceCreateEventCopyWith<$Res>
    implements $ServiceEventCopyWith<$Res> {
  factory $ServiceCreateEventCopyWith(
          ServiceCreateEvent value, $Res Function(ServiceCreateEvent) _then) =
      _$ServiceCreateEventCopyWithImpl;
  @useResult
  $Res call({ServiceModel serviceModel});
}

/// @nodoc
class _$ServiceCreateEventCopyWithImpl<$Res>
    implements $ServiceCreateEventCopyWith<$Res> {
  _$ServiceCreateEventCopyWithImpl(this._self, this._then);

  final ServiceCreateEvent _self;
  final $Res Function(ServiceCreateEvent) _then;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceModel = null,
  }) {
    return _then(ServiceCreateEvent(
      serviceModel: null == serviceModel
          ? _self.serviceModel
          : serviceModel // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
    ));
  }
}

/// @nodoc

class ServiceUpdateEvent implements ServiceEvent {
  const ServiceUpdateEvent({required this.serviceModel});

  final ServiceModel serviceModel;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceUpdateEventCopyWith<ServiceUpdateEvent> get copyWith =>
      _$ServiceUpdateEventCopyWithImpl<ServiceUpdateEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceUpdateEvent &&
            (identical(other.serviceModel, serviceModel) ||
                other.serviceModel == serviceModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceModel);

  @override
  String toString() {
    return 'ServiceEvent.update(serviceModel: $serviceModel)';
  }
}

/// @nodoc
abstract mixin class $ServiceUpdateEventCopyWith<$Res>
    implements $ServiceEventCopyWith<$Res> {
  factory $ServiceUpdateEventCopyWith(
          ServiceUpdateEvent value, $Res Function(ServiceUpdateEvent) _then) =
      _$ServiceUpdateEventCopyWithImpl;
  @useResult
  $Res call({ServiceModel serviceModel});
}

/// @nodoc
class _$ServiceUpdateEventCopyWithImpl<$Res>
    implements $ServiceUpdateEventCopyWith<$Res> {
  _$ServiceUpdateEventCopyWithImpl(this._self, this._then);

  final ServiceUpdateEvent _self;
  final $Res Function(ServiceUpdateEvent) _then;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceModel = null,
  }) {
    return _then(ServiceUpdateEvent(
      serviceModel: null == serviceModel
          ? _self.serviceModel
          : serviceModel // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
    ));
  }
}

/// @nodoc

class ServiceSearchEvent implements ServiceEvent {
  const ServiceSearchEvent({required this.serviceSearchModel});

  final ServiceSearchModel serviceSearchModel;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceSearchEventCopyWith<ServiceSearchEvent> get copyWith =>
      _$ServiceSearchEventCopyWithImpl<ServiceSearchEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceSearchEvent &&
            (identical(other.serviceSearchModel, serviceSearchModel) ||
                other.serviceSearchModel == serviceSearchModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceSearchModel);

  @override
  String toString() {
    return 'ServiceEvent.search(serviceSearchModel: $serviceSearchModel)';
  }
}

/// @nodoc
abstract mixin class $ServiceSearchEventCopyWith<$Res>
    implements $ServiceEventCopyWith<$Res> {
  factory $ServiceSearchEventCopyWith(
          ServiceSearchEvent value, $Res Function(ServiceSearchEvent) _then) =
      _$ServiceSearchEventCopyWithImpl;
  @useResult
  $Res call({ServiceSearchModel serviceSearchModel});
}

/// @nodoc
class _$ServiceSearchEventCopyWithImpl<$Res>
    implements $ServiceSearchEventCopyWith<$Res> {
  _$ServiceSearchEventCopyWithImpl(this._self, this._then);

  final ServiceSearchEvent _self;
  final $Res Function(ServiceSearchEvent) _then;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceSearchModel = null,
  }) {
    return _then(ServiceSearchEvent(
      serviceSearchModel: null == serviceSearchModel
          ? _self.serviceSearchModel
          : serviceSearchModel // ignore: cast_nullable_to_non_nullable
              as ServiceSearchModel,
    ));
  }
}

/// @nodoc

class ServiceSurveyFormEvent implements ServiceEvent {
  const ServiceSurveyFormEvent(
      {required this.value, required this.submitTriggered});

  final String value;
  final bool submitTriggered;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceSurveyFormEventCopyWith<ServiceSurveyFormEvent> get copyWith =>
      _$ServiceSurveyFormEventCopyWithImpl<ServiceSurveyFormEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceSurveyFormEvent &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.submitTriggered, submitTriggered) ||
                other.submitTriggered == submitTriggered));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, submitTriggered);

  @override
  String toString() {
    return 'ServiceEvent.multiSurveyFormChanged(value: $value, submitTriggered: $submitTriggered)';
  }
}

/// @nodoc
abstract mixin class $ServiceSurveyFormEventCopyWith<$Res>
    implements $ServiceEventCopyWith<$Res> {
  factory $ServiceSurveyFormEventCopyWith(ServiceSurveyFormEvent value,
          $Res Function(ServiceSurveyFormEvent) _then) =
      _$ServiceSurveyFormEventCopyWithImpl;
  @useResult
  $Res call({String value, bool submitTriggered});
}

/// @nodoc
class _$ServiceSurveyFormEventCopyWithImpl<$Res>
    implements $ServiceSurveyFormEventCopyWith<$Res> {
  _$ServiceSurveyFormEventCopyWithImpl(this._self, this._then);

  final ServiceSurveyFormEvent _self;
  final $Res Function(ServiceSurveyFormEvent) _then;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
    Object? submitTriggered = null,
  }) {
    return _then(ServiceSurveyFormEvent(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      submitTriggered: null == submitTriggered
          ? _self.submitTriggered
          : submitTriggered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ServiceSelectionEvent implements ServiceEvent {
  const ServiceSelectionEvent({required this.service});

  final ServiceModel service;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceSelectionEventCopyWith<ServiceSelectionEvent> get copyWith =>
      _$ServiceSelectionEventCopyWithImpl<ServiceSelectionEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceSelectionEvent &&
            (identical(other.service, service) || other.service == service));
  }

  @override
  int get hashCode => Object.hash(runtimeType, service);

  @override
  String toString() {
    return 'ServiceEvent.selectService(service: $service)';
  }
}

/// @nodoc
abstract mixin class $ServiceSelectionEventCopyWith<$Res>
    implements $ServiceEventCopyWith<$Res> {
  factory $ServiceSelectionEventCopyWith(ServiceSelectionEvent value,
          $Res Function(ServiceSelectionEvent) _then) =
      _$ServiceSelectionEventCopyWithImpl;
  @useResult
  $Res call({ServiceModel service});
}

/// @nodoc
class _$ServiceSelectionEventCopyWithImpl<$Res>
    implements $ServiceSelectionEventCopyWith<$Res> {
  _$ServiceSelectionEventCopyWithImpl(this._self, this._then);

  final ServiceSelectionEvent _self;
  final $Res Function(ServiceSelectionEvent) _then;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? service = null,
  }) {
    return _then(ServiceSelectionEvent(
      service: null == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
    ));
  }
}

/// @nodoc

class ServiceResetEvent implements ServiceEvent {
  const ServiceResetEvent({required final List<ServiceModel> serviceList})
      : _serviceList = serviceList;

  final List<ServiceModel> _serviceList;
  List<ServiceModel> get serviceList {
    if (_serviceList is EqualUnmodifiableListView) return _serviceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceList);
  }

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceResetEventCopyWith<ServiceResetEvent> get copyWith =>
      _$ServiceResetEventCopyWithImpl<ServiceResetEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceResetEvent &&
            const DeepCollectionEquality()
                .equals(other._serviceList, _serviceList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_serviceList));

  @override
  String toString() {
    return 'ServiceEvent.resetSelected(serviceList: $serviceList)';
  }
}

/// @nodoc
abstract mixin class $ServiceResetEventCopyWith<$Res>
    implements $ServiceEventCopyWith<$Res> {
  factory $ServiceResetEventCopyWith(
          ServiceResetEvent value, $Res Function(ServiceResetEvent) _then) =
      _$ServiceResetEventCopyWithImpl;
  @useResult
  $Res call({List<ServiceModel> serviceList});
}

/// @nodoc
class _$ServiceResetEventCopyWithImpl<$Res>
    implements $ServiceResetEventCopyWith<$Res> {
  _$ServiceResetEventCopyWithImpl(this._self, this._then);

  final ServiceResetEvent _self;
  final $Res Function(ServiceResetEvent) _then;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceList = null,
  }) {
    return _then(ServiceResetEvent(
      serviceList: null == serviceList
          ? _self._serviceList
          : serviceList // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
    ));
  }
}

/// @nodoc
mixin _$ServiceState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServiceState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServiceState()';
  }
}

/// @nodoc
class $ServiceStateCopyWith<$Res> {
  $ServiceStateCopyWith(ServiceState _, $Res Function(ServiceState) __);
}

/// Adds pattern-matching-related methods to [ServiceState].
extension ServiceStatePatterns on ServiceState {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEmptyState value)? empty,
    TResult Function(ServiceIsloadingState value)? isloading,
    TResult Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult Function(ServiceCreateState value)? serviceCreate,
    TResult Function(ServiceSearchState value)? serviceSearch,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ServiceEmptyState() when empty != null:
        return empty(_that);
      case ServiceIsloadingState() when isloading != null:
        return isloading(_that);
      case ServiceMultiSurveyFormChangedState()
          when multiSurveyFormChanged != null:
        return multiSurveyFormChanged(_that);
      case ServiceCreateState() when serviceCreate != null:
        return serviceCreate(_that);
      case ServiceSearchState() when serviceSearch != null:
        return serviceSearch(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceEmptyState value) empty,
    required TResult Function(ServiceIsloadingState value) isloading,
    required TResult Function(ServiceMultiSurveyFormChangedState value)
        multiSurveyFormChanged,
    required TResult Function(ServiceCreateState value) serviceCreate,
    required TResult Function(ServiceSearchState value) serviceSearch,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceEmptyState():
        return empty(_that);
      case ServiceIsloadingState():
        return isloading(_that);
      case ServiceMultiSurveyFormChangedState():
        return multiSurveyFormChanged(_that);
      case ServiceCreateState():
        return serviceCreate(_that);
      case ServiceSearchState():
        return serviceSearch(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEmptyState value)? empty,
    TResult? Function(ServiceIsloadingState value)? isloading,
    TResult? Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult? Function(ServiceCreateState value)? serviceCreate,
    TResult? Function(ServiceSearchState value)? serviceSearch,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceEmptyState() when empty != null:
        return empty(_that);
      case ServiceIsloadingState() when isloading != null:
        return isloading(_that);
      case ServiceMultiSurveyFormChangedState()
          when multiSurveyFormChanged != null:
        return multiSurveyFormChanged(_that);
      case ServiceCreateState() when serviceCreate != null:
        return serviceCreate(_that);
      case ServiceSearchState() when serviceSearch != null:
        return serviceSearch(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isloading,
    TResult Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing)?
        serviceCreate,
    TResult Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)?
        serviceSearch,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ServiceEmptyState() when empty != null:
        return empty();
      case ServiceIsloadingState() when isloading != null:
        return isloading();
      case ServiceMultiSurveyFormChangedState()
          when multiSurveyFormChanged != null:
        return multiSurveyFormChanged(_that.value, _that.submitTriggered);
      case ServiceCreateState() when serviceCreate != null:
        return serviceCreate(_that.serviceList, _that.selectedService,
            _that.loading, _that.isEditing);
      case ServiceSearchState() when serviceSearch != null:
        return serviceSearch(
            _that.serviceList, _that.selectedService, _that.loading);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isloading,
    required TResult Function(String value, bool submitTriggered)
        multiSurveyFormChanged,
    required TResult Function(ServiceModel serviceList,
            ServiceModel? selectedService, bool loading, bool isEditing)
        serviceCreate,
    required TResult Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)
        serviceSearch,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceEmptyState():
        return empty();
      case ServiceIsloadingState():
        return isloading();
      case ServiceMultiSurveyFormChangedState():
        return multiSurveyFormChanged(_that.value, _that.submitTriggered);
      case ServiceCreateState():
        return serviceCreate(_that.serviceList, _that.selectedService,
            _that.loading, _that.isEditing);
      case ServiceSearchState():
        return serviceSearch(
            _that.serviceList, _that.selectedService, _that.loading);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isloading,
    TResult? Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing)?
        serviceCreate,
    TResult? Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)?
        serviceSearch,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceEmptyState() when empty != null:
        return empty();
      case ServiceIsloadingState() when isloading != null:
        return isloading();
      case ServiceMultiSurveyFormChangedState()
          when multiSurveyFormChanged != null:
        return multiSurveyFormChanged(_that.value, _that.submitTriggered);
      case ServiceCreateState() when serviceCreate != null:
        return serviceCreate(_that.serviceList, _that.selectedService,
            _that.loading, _that.isEditing);
      case ServiceSearchState() when serviceSearch != null:
        return serviceSearch(
            _that.serviceList, _that.selectedService, _that.loading);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ServiceEmptyState implements ServiceState {
  const ServiceEmptyState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServiceEmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServiceState.empty()';
  }
}

/// @nodoc

class ServiceIsloadingState implements ServiceState {
  const ServiceIsloadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServiceIsloadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServiceState.isloading()';
  }
}

/// @nodoc

class ServiceMultiSurveyFormChangedState implements ServiceState {
  const ServiceMultiSurveyFormChangedState(
      {this.value = '', this.submitTriggered = false});

  @JsonKey()
  final String value;
  @JsonKey()
  final bool submitTriggered;

  /// Create a copy of ServiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceMultiSurveyFormChangedStateCopyWith<
          ServiceMultiSurveyFormChangedState>
      get copyWith => _$ServiceMultiSurveyFormChangedStateCopyWithImpl<
          ServiceMultiSurveyFormChangedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceMultiSurveyFormChangedState &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.submitTriggered, submitTriggered) ||
                other.submitTriggered == submitTriggered));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, submitTriggered);

  @override
  String toString() {
    return 'ServiceState.multiSurveyFormChanged(value: $value, submitTriggered: $submitTriggered)';
  }
}

/// @nodoc
abstract mixin class $ServiceMultiSurveyFormChangedStateCopyWith<$Res>
    implements $ServiceStateCopyWith<$Res> {
  factory $ServiceMultiSurveyFormChangedStateCopyWith(
          ServiceMultiSurveyFormChangedState value,
          $Res Function(ServiceMultiSurveyFormChangedState) _then) =
      _$ServiceMultiSurveyFormChangedStateCopyWithImpl;
  @useResult
  $Res call({String value, bool submitTriggered});
}

/// @nodoc
class _$ServiceMultiSurveyFormChangedStateCopyWithImpl<$Res>
    implements $ServiceMultiSurveyFormChangedStateCopyWith<$Res> {
  _$ServiceMultiSurveyFormChangedStateCopyWithImpl(this._self, this._then);

  final ServiceMultiSurveyFormChangedState _self;
  final $Res Function(ServiceMultiSurveyFormChangedState) _then;

  /// Create a copy of ServiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
    Object? submitTriggered = null,
  }) {
    return _then(ServiceMultiSurveyFormChangedState(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      submitTriggered: null == submitTriggered
          ? _self.submitTriggered
          : submitTriggered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ServiceCreateState implements ServiceState {
  const ServiceCreateState(
      {required this.serviceList,
      this.selectedService,
      this.loading = false,
      this.isEditing = false});

  final ServiceModel serviceList;
  final ServiceModel? selectedService;
  @JsonKey()
  final bool loading;
  @JsonKey()
  final bool isEditing;

  /// Create a copy of ServiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceCreateStateCopyWith<ServiceCreateState> get copyWith =>
      _$ServiceCreateStateCopyWithImpl<ServiceCreateState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceCreateState &&
            (identical(other.serviceList, serviceList) ||
                other.serviceList == serviceList) &&
            (identical(other.selectedService, selectedService) ||
                other.selectedService == selectedService) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, serviceList, selectedService, loading, isEditing);

  @override
  String toString() {
    return 'ServiceState.serviceCreate(serviceList: $serviceList, selectedService: $selectedService, loading: $loading, isEditing: $isEditing)';
  }
}

/// @nodoc
abstract mixin class $ServiceCreateStateCopyWith<$Res>
    implements $ServiceStateCopyWith<$Res> {
  factory $ServiceCreateStateCopyWith(
          ServiceCreateState value, $Res Function(ServiceCreateState) _then) =
      _$ServiceCreateStateCopyWithImpl;
  @useResult
  $Res call(
      {ServiceModel serviceList,
      ServiceModel? selectedService,
      bool loading,
      bool isEditing});
}

/// @nodoc
class _$ServiceCreateStateCopyWithImpl<$Res>
    implements $ServiceCreateStateCopyWith<$Res> {
  _$ServiceCreateStateCopyWithImpl(this._self, this._then);

  final ServiceCreateState _self;
  final $Res Function(ServiceCreateState) _then;

  /// Create a copy of ServiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceList = null,
    Object? selectedService = freezed,
    Object? loading = null,
    Object? isEditing = null,
  }) {
    return _then(ServiceCreateState(
      serviceList: null == serviceList
          ? _self.serviceList
          : serviceList // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
      selectedService: freezed == selectedService
          ? _self.selectedService
          : selectedService // ignore: cast_nullable_to_non_nullable
              as ServiceModel?,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _self.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ServiceSearchState implements ServiceState {
  const ServiceSearchState(
      {required final List<ServiceModel> serviceList,
      this.selectedService,
      this.loading = false})
      : _serviceList = serviceList;

  final List<ServiceModel> _serviceList;
  List<ServiceModel> get serviceList {
    if (_serviceList is EqualUnmodifiableListView) return _serviceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceList);
  }

  final ServiceModel? selectedService;
  @JsonKey()
  final bool loading;

  /// Create a copy of ServiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceSearchStateCopyWith<ServiceSearchState> get copyWith =>
      _$ServiceSearchStateCopyWithImpl<ServiceSearchState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceSearchState &&
            const DeepCollectionEquality()
                .equals(other._serviceList, _serviceList) &&
            (identical(other.selectedService, selectedService) ||
                other.selectedService == selectedService) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_serviceList),
      selectedService,
      loading);

  @override
  String toString() {
    return 'ServiceState.serviceSearch(serviceList: $serviceList, selectedService: $selectedService, loading: $loading)';
  }
}

/// @nodoc
abstract mixin class $ServiceSearchStateCopyWith<$Res>
    implements $ServiceStateCopyWith<$Res> {
  factory $ServiceSearchStateCopyWith(
          ServiceSearchState value, $Res Function(ServiceSearchState) _then) =
      _$ServiceSearchStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ServiceModel> serviceList,
      ServiceModel? selectedService,
      bool loading});
}

/// @nodoc
class _$ServiceSearchStateCopyWithImpl<$Res>
    implements $ServiceSearchStateCopyWith<$Res> {
  _$ServiceSearchStateCopyWithImpl(this._self, this._then);

  final ServiceSearchState _self;
  final $Res Function(ServiceSearchState) _then;

  /// Create a copy of ServiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceList = null,
    Object? selectedService = freezed,
    Object? loading = null,
  }) {
    return _then(ServiceSearchState(
      serviceList: null == serviceList
          ? _self._serviceList
          : serviceList // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
      selectedService: freezed == selectedService
          ? _self.selectedService
          : selectedService // ignore: cast_nullable_to_non_nullable
              as ServiceModel?,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

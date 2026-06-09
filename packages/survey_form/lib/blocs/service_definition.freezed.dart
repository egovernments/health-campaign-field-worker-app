// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_definition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceDefinitionEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServiceDefinitionEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServiceDefinitionEvent()';
  }
}

/// @nodoc
class $ServiceDefinitionEventCopyWith<$Res> {
  $ServiceDefinitionEventCopyWith(
      ServiceDefinitionEvent _, $Res Function(ServiceDefinitionEvent) __);
}

/// Adds pattern-matching-related methods to [ServiceDefinitionEvent].
extension ServiceDefinitionEventPatterns on ServiceDefinitionEvent {
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
    TResult Function(ServiceDefinitionFetchEvent value)? fetch,
    TResult Function(ServiceDefinitionSelectionEvent value)?
        selectServiceDefinition,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ServiceDefinitionFetchEvent() when fetch != null:
        return fetch(_that);
      case ServiceDefinitionSelectionEvent()
          when selectServiceDefinition != null:
        return selectServiceDefinition(_that);
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
    required TResult Function(ServiceDefinitionFetchEvent value) fetch,
    required TResult Function(ServiceDefinitionSelectionEvent value)
        selectServiceDefinition,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceDefinitionFetchEvent():
        return fetch(_that);
      case ServiceDefinitionSelectionEvent():
        return selectServiceDefinition(_that);
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
    TResult? Function(ServiceDefinitionFetchEvent value)? fetch,
    TResult? Function(ServiceDefinitionSelectionEvent value)?
        selectServiceDefinition,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceDefinitionFetchEvent() when fetch != null:
        return fetch(_that);
      case ServiceDefinitionSelectionEvent()
          when selectServiceDefinition != null:
        return selectServiceDefinition(_that);
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
    TResult Function()? fetch,
    TResult Function(ServiceDefinitionModel serviceDefinition)?
        selectServiceDefinition,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ServiceDefinitionFetchEvent() when fetch != null:
        return fetch();
      case ServiceDefinitionSelectionEvent()
          when selectServiceDefinition != null:
        return selectServiceDefinition(_that.serviceDefinition);
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
    required TResult Function() fetch,
    required TResult Function(ServiceDefinitionModel serviceDefinition)
        selectServiceDefinition,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceDefinitionFetchEvent():
        return fetch();
      case ServiceDefinitionSelectionEvent():
        return selectServiceDefinition(_that.serviceDefinition);
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
    TResult? Function()? fetch,
    TResult? Function(ServiceDefinitionModel serviceDefinition)?
        selectServiceDefinition,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceDefinitionFetchEvent() when fetch != null:
        return fetch();
      case ServiceDefinitionSelectionEvent()
          when selectServiceDefinition != null:
        return selectServiceDefinition(_that.serviceDefinition);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ServiceDefinitionFetchEvent implements ServiceDefinitionEvent {
  const ServiceDefinitionFetchEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceDefinitionFetchEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServiceDefinitionEvent.fetch()';
  }
}

/// @nodoc

class ServiceDefinitionSelectionEvent implements ServiceDefinitionEvent {
  const ServiceDefinitionSelectionEvent({required this.serviceDefinition});

  final ServiceDefinitionModel serviceDefinition;

  /// Create a copy of ServiceDefinitionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceDefinitionSelectionEventCopyWith<ServiceDefinitionSelectionEvent>
      get copyWith => _$ServiceDefinitionSelectionEventCopyWithImpl<
          ServiceDefinitionSelectionEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceDefinitionSelectionEvent &&
            (identical(other.serviceDefinition, serviceDefinition) ||
                other.serviceDefinition == serviceDefinition));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceDefinition);

  @override
  String toString() {
    return 'ServiceDefinitionEvent.selectServiceDefinition(serviceDefinition: $serviceDefinition)';
  }
}

/// @nodoc
abstract mixin class $ServiceDefinitionSelectionEventCopyWith<$Res>
    implements $ServiceDefinitionEventCopyWith<$Res> {
  factory $ServiceDefinitionSelectionEventCopyWith(
          ServiceDefinitionSelectionEvent value,
          $Res Function(ServiceDefinitionSelectionEvent) _then) =
      _$ServiceDefinitionSelectionEventCopyWithImpl;
  @useResult
  $Res call({ServiceDefinitionModel serviceDefinition});
}

/// @nodoc
class _$ServiceDefinitionSelectionEventCopyWithImpl<$Res>
    implements $ServiceDefinitionSelectionEventCopyWith<$Res> {
  _$ServiceDefinitionSelectionEventCopyWithImpl(this._self, this._then);

  final ServiceDefinitionSelectionEvent _self;
  final $Res Function(ServiceDefinitionSelectionEvent) _then;

  /// Create a copy of ServiceDefinitionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceDefinition = null,
  }) {
    return _then(ServiceDefinitionSelectionEvent(
      serviceDefinition: null == serviceDefinition
          ? _self.serviceDefinition
          : serviceDefinition // ignore: cast_nullable_to_non_nullable
              as ServiceDefinitionModel,
    ));
  }
}

/// @nodoc
mixin _$ServiceDefinitionState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServiceDefinitionState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServiceDefinitionState()';
  }
}

/// @nodoc
class $ServiceDefinitionStateCopyWith<$Res> {
  $ServiceDefinitionStateCopyWith(
      ServiceDefinitionState _, $Res Function(ServiceDefinitionState) __);
}

/// Adds pattern-matching-related methods to [ServiceDefinitionState].
extension ServiceDefinitionStatePatterns on ServiceDefinitionState {
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
    TResult Function(ServiceDefinitionEmptyState value)? empty,
    TResult Function(ServiceDefinitionIsloadingState value)? isloading,
    TResult Function(ServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ServiceDefinitionEmptyState() when empty != null:
        return empty(_that);
      case ServiceDefinitionIsloadingState() when isloading != null:
        return isloading(_that);
      case ServiceDefinitionServiceFetchedState()
          when serviceDefinitionFetch != null:
        return serviceDefinitionFetch(_that);
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
    required TResult Function(ServiceDefinitionEmptyState value) empty,
    required TResult Function(ServiceDefinitionIsloadingState value) isloading,
    required TResult Function(ServiceDefinitionServiceFetchedState value)
        serviceDefinitionFetch,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceDefinitionEmptyState():
        return empty(_that);
      case ServiceDefinitionIsloadingState():
        return isloading(_that);
      case ServiceDefinitionServiceFetchedState():
        return serviceDefinitionFetch(_that);
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
    TResult? Function(ServiceDefinitionEmptyState value)? empty,
    TResult? Function(ServiceDefinitionIsloadingState value)? isloading,
    TResult? Function(ServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceDefinitionEmptyState() when empty != null:
        return empty(_that);
      case ServiceDefinitionIsloadingState() when isloading != null:
        return isloading(_that);
      case ServiceDefinitionServiceFetchedState()
          when serviceDefinitionFetch != null:
        return serviceDefinitionFetch(_that);
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
    TResult Function(List<ServiceDefinitionModel> serviceDefinitionList,
            ServiceDefinitionModel? selectedServiceDefinition)?
        serviceDefinitionFetch,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ServiceDefinitionEmptyState() when empty != null:
        return empty();
      case ServiceDefinitionIsloadingState() when isloading != null:
        return isloading();
      case ServiceDefinitionServiceFetchedState()
          when serviceDefinitionFetch != null:
        return serviceDefinitionFetch(
            _that.serviceDefinitionList, _that.selectedServiceDefinition);
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
    required TResult Function(
            List<ServiceDefinitionModel> serviceDefinitionList,
            ServiceDefinitionModel? selectedServiceDefinition)
        serviceDefinitionFetch,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceDefinitionEmptyState():
        return empty();
      case ServiceDefinitionIsloadingState():
        return isloading();
      case ServiceDefinitionServiceFetchedState():
        return serviceDefinitionFetch(
            _that.serviceDefinitionList, _that.selectedServiceDefinition);
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
    TResult? Function(List<ServiceDefinitionModel> serviceDefinitionList,
            ServiceDefinitionModel? selectedServiceDefinition)?
        serviceDefinitionFetch,
  }) {
    final _that = this;
    switch (_that) {
      case ServiceDefinitionEmptyState() when empty != null:
        return empty();
      case ServiceDefinitionIsloadingState() when isloading != null:
        return isloading();
      case ServiceDefinitionServiceFetchedState()
          when serviceDefinitionFetch != null:
        return serviceDefinitionFetch(
            _that.serviceDefinitionList, _that.selectedServiceDefinition);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ServiceDefinitionEmptyState implements ServiceDefinitionState {
  const ServiceDefinitionEmptyState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceDefinitionEmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServiceDefinitionState.empty()';
  }
}

/// @nodoc

class ServiceDefinitionIsloadingState implements ServiceDefinitionState {
  const ServiceDefinitionIsloadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceDefinitionIsloadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServiceDefinitionState.isloading()';
  }
}

/// @nodoc

class ServiceDefinitionServiceFetchedState implements ServiceDefinitionState {
  const ServiceDefinitionServiceFetchedState(
      {required final List<ServiceDefinitionModel> serviceDefinitionList,
      this.selectedServiceDefinition})
      : _serviceDefinitionList = serviceDefinitionList;

  final List<ServiceDefinitionModel> _serviceDefinitionList;
  List<ServiceDefinitionModel> get serviceDefinitionList {
    if (_serviceDefinitionList is EqualUnmodifiableListView)
      return _serviceDefinitionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceDefinitionList);
  }

  final ServiceDefinitionModel? selectedServiceDefinition;

  /// Create a copy of ServiceDefinitionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceDefinitionServiceFetchedStateCopyWith<
          ServiceDefinitionServiceFetchedState>
      get copyWith => _$ServiceDefinitionServiceFetchedStateCopyWithImpl<
          ServiceDefinitionServiceFetchedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceDefinitionServiceFetchedState &&
            const DeepCollectionEquality()
                .equals(other._serviceDefinitionList, _serviceDefinitionList) &&
            (identical(other.selectedServiceDefinition,
                    selectedServiceDefinition) ||
                other.selectedServiceDefinition == selectedServiceDefinition));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_serviceDefinitionList),
      selectedServiceDefinition);

  @override
  String toString() {
    return 'ServiceDefinitionState.serviceDefinitionFetch(serviceDefinitionList: $serviceDefinitionList, selectedServiceDefinition: $selectedServiceDefinition)';
  }
}

/// @nodoc
abstract mixin class $ServiceDefinitionServiceFetchedStateCopyWith<$Res>
    implements $ServiceDefinitionStateCopyWith<$Res> {
  factory $ServiceDefinitionServiceFetchedStateCopyWith(
          ServiceDefinitionServiceFetchedState value,
          $Res Function(ServiceDefinitionServiceFetchedState) _then) =
      _$ServiceDefinitionServiceFetchedStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ServiceDefinitionModel> serviceDefinitionList,
      ServiceDefinitionModel? selectedServiceDefinition});
}

/// @nodoc
class _$ServiceDefinitionServiceFetchedStateCopyWithImpl<$Res>
    implements $ServiceDefinitionServiceFetchedStateCopyWith<$Res> {
  _$ServiceDefinitionServiceFetchedStateCopyWithImpl(this._self, this._then);

  final ServiceDefinitionServiceFetchedState _self;
  final $Res Function(ServiceDefinitionServiceFetchedState) _then;

  /// Create a copy of ServiceDefinitionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceDefinitionList = null,
    Object? selectedServiceDefinition = freezed,
  }) {
    return _then(ServiceDefinitionServiceFetchedState(
      serviceDefinitionList: null == serviceDefinitionList
          ? _self._serviceDefinitionList
          : serviceDefinitionList // ignore: cast_nullable_to_non_nullable
              as List<ServiceDefinitionModel>,
      selectedServiceDefinition: freezed == selectedServiceDefinition
          ? _self.selectedServiceDefinition
          : selectedServiceDefinition // ignore: cast_nullable_to_non_nullable
              as ServiceDefinitionModel?,
    ));
  }
}

// dart format on

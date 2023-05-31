// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_definition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServiceDefinitionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(ServiceDefinitionModel serviceDefinition)
        selectServiceDefinition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(ServiceDefinitionModel serviceDefinition)?
        selectServiceDefinition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(ServiceDefinitionModel serviceDefinition)?
        selectServiceDefinition,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceDefinitionFetchEvent value) fetch,
    required TResult Function(ServiceDefinitionSelectionEvent value)
        selectServiceDefinition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceDefinitionFetchEvent value)? fetch,
    TResult? Function(ServiceDefinitionSelectionEvent value)?
        selectServiceDefinition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceDefinitionFetchEvent value)? fetch,
    TResult Function(ServiceDefinitionSelectionEvent value)?
        selectServiceDefinition,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceDefinitionEventCopyWith<$Res> {
  factory $ServiceDefinitionEventCopyWith(ServiceDefinitionEvent value,
          $Res Function(ServiceDefinitionEvent) then) =
      _$ServiceDefinitionEventCopyWithImpl<$Res, ServiceDefinitionEvent>;
}

/// @nodoc
class _$ServiceDefinitionEventCopyWithImpl<$Res,
        $Val extends ServiceDefinitionEvent>
    implements $ServiceDefinitionEventCopyWith<$Res> {
  _$ServiceDefinitionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServiceDefinitionFetchEventCopyWith<$Res> {
  factory _$$ServiceDefinitionFetchEventCopyWith(
          _$ServiceDefinitionFetchEvent value,
          $Res Function(_$ServiceDefinitionFetchEvent) then) =
      __$$ServiceDefinitionFetchEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceDefinitionFetchEventCopyWithImpl<$Res>
    extends _$ServiceDefinitionEventCopyWithImpl<$Res,
        _$ServiceDefinitionFetchEvent>
    implements _$$ServiceDefinitionFetchEventCopyWith<$Res> {
  __$$ServiceDefinitionFetchEventCopyWithImpl(
      _$ServiceDefinitionFetchEvent _value,
      $Res Function(_$ServiceDefinitionFetchEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServiceDefinitionFetchEvent implements ServiceDefinitionFetchEvent {
  const _$ServiceDefinitionFetchEvent();

  @override
  String toString() {
    return 'ServiceDefinitionEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceDefinitionFetchEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(ServiceDefinitionModel serviceDefinition)
        selectServiceDefinition,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(ServiceDefinitionModel serviceDefinition)?
        selectServiceDefinition,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(ServiceDefinitionModel serviceDefinition)?
        selectServiceDefinition,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceDefinitionFetchEvent value) fetch,
    required TResult Function(ServiceDefinitionSelectionEvent value)
        selectServiceDefinition,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceDefinitionFetchEvent value)? fetch,
    TResult? Function(ServiceDefinitionSelectionEvent value)?
        selectServiceDefinition,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceDefinitionFetchEvent value)? fetch,
    TResult Function(ServiceDefinitionSelectionEvent value)?
        selectServiceDefinition,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class ServiceDefinitionFetchEvent implements ServiceDefinitionEvent {
  const factory ServiceDefinitionFetchEvent() = _$ServiceDefinitionFetchEvent;
}

/// @nodoc
abstract class _$$ServiceDefinitionSelectionEventCopyWith<$Res> {
  factory _$$ServiceDefinitionSelectionEventCopyWith(
          _$ServiceDefinitionSelectionEvent value,
          $Res Function(_$ServiceDefinitionSelectionEvent) then) =
      __$$ServiceDefinitionSelectionEventCopyWithImpl<$Res>;
  @useResult
  $Res call({ServiceDefinitionModel serviceDefinition});
}

/// @nodoc
class __$$ServiceDefinitionSelectionEventCopyWithImpl<$Res>
    extends _$ServiceDefinitionEventCopyWithImpl<$Res,
        _$ServiceDefinitionSelectionEvent>
    implements _$$ServiceDefinitionSelectionEventCopyWith<$Res> {
  __$$ServiceDefinitionSelectionEventCopyWithImpl(
      _$ServiceDefinitionSelectionEvent _value,
      $Res Function(_$ServiceDefinitionSelectionEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceDefinition = null,
  }) {
    return _then(_$ServiceDefinitionSelectionEvent(
      serviceDefinition: null == serviceDefinition
          ? _value.serviceDefinition
          : serviceDefinition // ignore: cast_nullable_to_non_nullable
              as ServiceDefinitionModel,
    ));
  }
}

/// @nodoc

class _$ServiceDefinitionSelectionEvent
    implements ServiceDefinitionSelectionEvent {
  const _$ServiceDefinitionSelectionEvent({required this.serviceDefinition});

  @override
  final ServiceDefinitionModel serviceDefinition;

  @override
  String toString() {
    return 'ServiceDefinitionEvent.selectServiceDefinition(serviceDefinition: $serviceDefinition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceDefinitionSelectionEvent &&
            (identical(other.serviceDefinition, serviceDefinition) ||
                other.serviceDefinition == serviceDefinition));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceDefinition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceDefinitionSelectionEventCopyWith<_$ServiceDefinitionSelectionEvent>
      get copyWith => __$$ServiceDefinitionSelectionEventCopyWithImpl<
          _$ServiceDefinitionSelectionEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(ServiceDefinitionModel serviceDefinition)
        selectServiceDefinition,
  }) {
    return selectServiceDefinition(serviceDefinition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(ServiceDefinitionModel serviceDefinition)?
        selectServiceDefinition,
  }) {
    return selectServiceDefinition?.call(serviceDefinition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(ServiceDefinitionModel serviceDefinition)?
        selectServiceDefinition,
    required TResult orElse(),
  }) {
    if (selectServiceDefinition != null) {
      return selectServiceDefinition(serviceDefinition);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceDefinitionFetchEvent value) fetch,
    required TResult Function(ServiceDefinitionSelectionEvent value)
        selectServiceDefinition,
  }) {
    return selectServiceDefinition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceDefinitionFetchEvent value)? fetch,
    TResult? Function(ServiceDefinitionSelectionEvent value)?
        selectServiceDefinition,
  }) {
    return selectServiceDefinition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceDefinitionFetchEvent value)? fetch,
    TResult Function(ServiceDefinitionSelectionEvent value)?
        selectServiceDefinition,
    required TResult orElse(),
  }) {
    if (selectServiceDefinition != null) {
      return selectServiceDefinition(this);
    }
    return orElse();
  }
}

abstract class ServiceDefinitionSelectionEvent
    implements ServiceDefinitionEvent {
  const factory ServiceDefinitionSelectionEvent(
          {required final ServiceDefinitionModel serviceDefinition}) =
      _$ServiceDefinitionSelectionEvent;

  ServiceDefinitionModel get serviceDefinition;
  @JsonKey(ignore: true)
  _$$ServiceDefinitionSelectionEventCopyWith<_$ServiceDefinitionSelectionEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ServiceDefinitionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isloading,
    required TResult Function(
            List<ServiceDefinitionModel> serviceDefinitionList,
            ServiceDefinitionModel? selectedServiceDefinition)
        serviceDefinitionFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isloading,
    TResult? Function(List<ServiceDefinitionModel> serviceDefinitionList,
            ServiceDefinitionModel? selectedServiceDefinition)?
        serviceDefinitionFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isloading,
    TResult Function(List<ServiceDefinitionModel> serviceDefinitionList,
            ServiceDefinitionModel? selectedServiceDefinition)?
        serviceDefinitionFetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceDefinitionEmptyState value) empty,
    required TResult Function(ServiceDefinitionIsloadingState value) isloading,
    required TResult Function(ServiceDefinitionServiceFetchedState value)
        serviceDefinitionFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceDefinitionEmptyState value)? empty,
    TResult? Function(ServiceDefinitionIsloadingState value)? isloading,
    TResult? Function(ServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceDefinitionEmptyState value)? empty,
    TResult Function(ServiceDefinitionIsloadingState value)? isloading,
    TResult Function(ServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceDefinitionStateCopyWith<$Res> {
  factory $ServiceDefinitionStateCopyWith(ServiceDefinitionState value,
          $Res Function(ServiceDefinitionState) then) =
      _$ServiceDefinitionStateCopyWithImpl<$Res, ServiceDefinitionState>;
}

/// @nodoc
class _$ServiceDefinitionStateCopyWithImpl<$Res,
        $Val extends ServiceDefinitionState>
    implements $ServiceDefinitionStateCopyWith<$Res> {
  _$ServiceDefinitionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServiceDefinitionEmptyStateCopyWith<$Res> {
  factory _$$ServiceDefinitionEmptyStateCopyWith(
          _$ServiceDefinitionEmptyState value,
          $Res Function(_$ServiceDefinitionEmptyState) then) =
      __$$ServiceDefinitionEmptyStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceDefinitionEmptyStateCopyWithImpl<$Res>
    extends _$ServiceDefinitionStateCopyWithImpl<$Res,
        _$ServiceDefinitionEmptyState>
    implements _$$ServiceDefinitionEmptyStateCopyWith<$Res> {
  __$$ServiceDefinitionEmptyStateCopyWithImpl(
      _$ServiceDefinitionEmptyState _value,
      $Res Function(_$ServiceDefinitionEmptyState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServiceDefinitionEmptyState implements ServiceDefinitionEmptyState {
  const _$ServiceDefinitionEmptyState();

  @override
  String toString() {
    return 'ServiceDefinitionState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceDefinitionEmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isloading,
    required TResult Function(
            List<ServiceDefinitionModel> serviceDefinitionList,
            ServiceDefinitionModel? selectedServiceDefinition)
        serviceDefinitionFetch,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isloading,
    TResult? Function(List<ServiceDefinitionModel> serviceDefinitionList,
            ServiceDefinitionModel? selectedServiceDefinition)?
        serviceDefinitionFetch,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isloading,
    TResult Function(List<ServiceDefinitionModel> serviceDefinitionList,
            ServiceDefinitionModel? selectedServiceDefinition)?
        serviceDefinitionFetch,
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
    required TResult Function(ServiceDefinitionEmptyState value) empty,
    required TResult Function(ServiceDefinitionIsloadingState value) isloading,
    required TResult Function(ServiceDefinitionServiceFetchedState value)
        serviceDefinitionFetch,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceDefinitionEmptyState value)? empty,
    TResult? Function(ServiceDefinitionIsloadingState value)? isloading,
    TResult? Function(ServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceDefinitionEmptyState value)? empty,
    TResult Function(ServiceDefinitionIsloadingState value)? isloading,
    TResult Function(ServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class ServiceDefinitionEmptyState implements ServiceDefinitionState {
  const factory ServiceDefinitionEmptyState() = _$ServiceDefinitionEmptyState;
}

/// @nodoc
abstract class _$$ServiceDefinitionIsloadingStateCopyWith<$Res> {
  factory _$$ServiceDefinitionIsloadingStateCopyWith(
          _$ServiceDefinitionIsloadingState value,
          $Res Function(_$ServiceDefinitionIsloadingState) then) =
      __$$ServiceDefinitionIsloadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceDefinitionIsloadingStateCopyWithImpl<$Res>
    extends _$ServiceDefinitionStateCopyWithImpl<$Res,
        _$ServiceDefinitionIsloadingState>
    implements _$$ServiceDefinitionIsloadingStateCopyWith<$Res> {
  __$$ServiceDefinitionIsloadingStateCopyWithImpl(
      _$ServiceDefinitionIsloadingState _value,
      $Res Function(_$ServiceDefinitionIsloadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServiceDefinitionIsloadingState
    implements ServiceDefinitionIsloadingState {
  const _$ServiceDefinitionIsloadingState();

  @override
  String toString() {
    return 'ServiceDefinitionState.isloading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceDefinitionIsloadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isloading,
    required TResult Function(
            List<ServiceDefinitionModel> serviceDefinitionList,
            ServiceDefinitionModel? selectedServiceDefinition)
        serviceDefinitionFetch,
  }) {
    return isloading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isloading,
    TResult? Function(List<ServiceDefinitionModel> serviceDefinitionList,
            ServiceDefinitionModel? selectedServiceDefinition)?
        serviceDefinitionFetch,
  }) {
    return isloading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isloading,
    TResult Function(List<ServiceDefinitionModel> serviceDefinitionList,
            ServiceDefinitionModel? selectedServiceDefinition)?
        serviceDefinitionFetch,
    required TResult orElse(),
  }) {
    if (isloading != null) {
      return isloading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceDefinitionEmptyState value) empty,
    required TResult Function(ServiceDefinitionIsloadingState value) isloading,
    required TResult Function(ServiceDefinitionServiceFetchedState value)
        serviceDefinitionFetch,
  }) {
    return isloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceDefinitionEmptyState value)? empty,
    TResult? Function(ServiceDefinitionIsloadingState value)? isloading,
    TResult? Function(ServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
  }) {
    return isloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceDefinitionEmptyState value)? empty,
    TResult Function(ServiceDefinitionIsloadingState value)? isloading,
    TResult Function(ServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
    required TResult orElse(),
  }) {
    if (isloading != null) {
      return isloading(this);
    }
    return orElse();
  }
}

abstract class ServiceDefinitionIsloadingState
    implements ServiceDefinitionState {
  const factory ServiceDefinitionIsloadingState() =
      _$ServiceDefinitionIsloadingState;
}

/// @nodoc
abstract class _$$ServiceDefinitionServiceFetchedStateCopyWith<$Res> {
  factory _$$ServiceDefinitionServiceFetchedStateCopyWith(
          _$ServiceDefinitionServiceFetchedState value,
          $Res Function(_$ServiceDefinitionServiceFetchedState) then) =
      __$$ServiceDefinitionServiceFetchedStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ServiceDefinitionModel> serviceDefinitionList,
      ServiceDefinitionModel? selectedServiceDefinition});
}

/// @nodoc
class __$$ServiceDefinitionServiceFetchedStateCopyWithImpl<$Res>
    extends _$ServiceDefinitionStateCopyWithImpl<$Res,
        _$ServiceDefinitionServiceFetchedState>
    implements _$$ServiceDefinitionServiceFetchedStateCopyWith<$Res> {
  __$$ServiceDefinitionServiceFetchedStateCopyWithImpl(
      _$ServiceDefinitionServiceFetchedState _value,
      $Res Function(_$ServiceDefinitionServiceFetchedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceDefinitionList = null,
    Object? selectedServiceDefinition = freezed,
  }) {
    return _then(_$ServiceDefinitionServiceFetchedState(
      serviceDefinitionList: null == serviceDefinitionList
          ? _value._serviceDefinitionList
          : serviceDefinitionList // ignore: cast_nullable_to_non_nullable
              as List<ServiceDefinitionModel>,
      selectedServiceDefinition: freezed == selectedServiceDefinition
          ? _value.selectedServiceDefinition
          : selectedServiceDefinition // ignore: cast_nullable_to_non_nullable
              as ServiceDefinitionModel?,
    ));
  }
}

/// @nodoc

class _$ServiceDefinitionServiceFetchedState
    implements ServiceDefinitionServiceFetchedState {
  const _$ServiceDefinitionServiceFetchedState(
      {required final List<ServiceDefinitionModel> serviceDefinitionList,
      this.selectedServiceDefinition})
      : _serviceDefinitionList = serviceDefinitionList;

  final List<ServiceDefinitionModel> _serviceDefinitionList;
  @override
  List<ServiceDefinitionModel> get serviceDefinitionList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceDefinitionList);
  }

  @override
  final ServiceDefinitionModel? selectedServiceDefinition;

  @override
  String toString() {
    return 'ServiceDefinitionState.serviceDefinitionFetch(serviceDefinitionList: $serviceDefinitionList, selectedServiceDefinition: $selectedServiceDefinition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceDefinitionServiceFetchedState &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceDefinitionServiceFetchedStateCopyWith<
          _$ServiceDefinitionServiceFetchedState>
      get copyWith => __$$ServiceDefinitionServiceFetchedStateCopyWithImpl<
          _$ServiceDefinitionServiceFetchedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isloading,
    required TResult Function(
            List<ServiceDefinitionModel> serviceDefinitionList,
            ServiceDefinitionModel? selectedServiceDefinition)
        serviceDefinitionFetch,
  }) {
    return serviceDefinitionFetch(
        serviceDefinitionList, selectedServiceDefinition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isloading,
    TResult? Function(List<ServiceDefinitionModel> serviceDefinitionList,
            ServiceDefinitionModel? selectedServiceDefinition)?
        serviceDefinitionFetch,
  }) {
    return serviceDefinitionFetch?.call(
        serviceDefinitionList, selectedServiceDefinition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isloading,
    TResult Function(List<ServiceDefinitionModel> serviceDefinitionList,
            ServiceDefinitionModel? selectedServiceDefinition)?
        serviceDefinitionFetch,
    required TResult orElse(),
  }) {
    if (serviceDefinitionFetch != null) {
      return serviceDefinitionFetch(
          serviceDefinitionList, selectedServiceDefinition);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceDefinitionEmptyState value) empty,
    required TResult Function(ServiceDefinitionIsloadingState value) isloading,
    required TResult Function(ServiceDefinitionServiceFetchedState value)
        serviceDefinitionFetch,
  }) {
    return serviceDefinitionFetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceDefinitionEmptyState value)? empty,
    TResult? Function(ServiceDefinitionIsloadingState value)? isloading,
    TResult? Function(ServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
  }) {
    return serviceDefinitionFetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceDefinitionEmptyState value)? empty,
    TResult Function(ServiceDefinitionIsloadingState value)? isloading,
    TResult Function(ServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
    required TResult orElse(),
  }) {
    if (serviceDefinitionFetch != null) {
      return serviceDefinitionFetch(this);
    }
    return orElse();
  }
}

abstract class ServiceDefinitionServiceFetchedState
    implements ServiceDefinitionState {
  const factory ServiceDefinitionServiceFetchedState(
          {required final List<ServiceDefinitionModel> serviceDefinitionList,
          final ServiceDefinitionModel? selectedServiceDefinition}) =
      _$ServiceDefinitionServiceFetchedState;

  List<ServiceDefinitionModel> get serviceDefinitionList;
  ServiceDefinitionModel? get selectedServiceDefinition;
  @JsonKey(ignore: true)
  _$$ServiceDefinitionServiceFetchedStateCopyWith<
          _$ServiceDefinitionServiceFetchedState>
      get copyWith => throw _privateConstructorUsedError;
}

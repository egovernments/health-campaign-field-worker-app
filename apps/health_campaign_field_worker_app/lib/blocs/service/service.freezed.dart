// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServiceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ServiceModel serviceModel) create,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceCreateEvent value) create,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceChecklistEvent value)
        multichecklistChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceChecklistEvent value)? multichecklistChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceChecklistEvent value)? multichecklistChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceEventCopyWith<$Res> {
  factory $ServiceEventCopyWith(
          ServiceEvent value, $Res Function(ServiceEvent) then) =
      _$ServiceEventCopyWithImpl<$Res, ServiceEvent>;
}

/// @nodoc
class _$ServiceEventCopyWithImpl<$Res, $Val extends ServiceEvent>
    implements $ServiceEventCopyWith<$Res> {
  _$ServiceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServiceCreateEventCopyWith<$Res> {
  factory _$$ServiceCreateEventCopyWith(_$ServiceCreateEvent value,
          $Res Function(_$ServiceCreateEvent) then) =
      __$$ServiceCreateEventCopyWithImpl<$Res>;
  @useResult
  $Res call({ServiceModel serviceModel});
}

/// @nodoc
class __$$ServiceCreateEventCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$ServiceCreateEvent>
    implements _$$ServiceCreateEventCopyWith<$Res> {
  __$$ServiceCreateEventCopyWithImpl(
      _$ServiceCreateEvent _value, $Res Function(_$ServiceCreateEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceModel = null,
  }) {
    return _then(_$ServiceCreateEvent(
      serviceModel: null == serviceModel
          ? _value.serviceModel
          : serviceModel // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
    ));
  }
}

/// @nodoc

class _$ServiceCreateEvent implements ServiceCreateEvent {
  const _$ServiceCreateEvent({required this.serviceModel});

  @override
  final ServiceModel serviceModel;

  @override
  String toString() {
    return 'ServiceEvent.create(serviceModel: $serviceModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceCreateEvent &&
            (identical(other.serviceModel, serviceModel) ||
                other.serviceModel == serviceModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceCreateEventCopyWith<_$ServiceCreateEvent> get copyWith =>
      __$$ServiceCreateEventCopyWithImpl<_$ServiceCreateEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ServiceModel serviceModel) create,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
  }) {
    return create(serviceModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
  }) {
    return create?.call(serviceModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(serviceModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceCreateEvent value) create,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceChecklistEvent value)
        multichecklistChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceChecklistEvent value)? multichecklistChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceChecklistEvent value)? multichecklistChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class ServiceCreateEvent implements ServiceEvent {
  const factory ServiceCreateEvent({required final ServiceModel serviceModel}) =
      _$ServiceCreateEvent;

  ServiceModel get serviceModel;
  @JsonKey(ignore: true)
  _$$ServiceCreateEventCopyWith<_$ServiceCreateEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceSearchEventCopyWith<$Res> {
  factory _$$ServiceSearchEventCopyWith(_$ServiceSearchEvent value,
          $Res Function(_$ServiceSearchEvent) then) =
      __$$ServiceSearchEventCopyWithImpl<$Res>;
  @useResult
  $Res call({ServiceSearchModel serviceSearchModel});
}

/// @nodoc
class __$$ServiceSearchEventCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$ServiceSearchEvent>
    implements _$$ServiceSearchEventCopyWith<$Res> {
  __$$ServiceSearchEventCopyWithImpl(
      _$ServiceSearchEvent _value, $Res Function(_$ServiceSearchEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceSearchModel = null,
  }) {
    return _then(_$ServiceSearchEvent(
      serviceSearchModel: null == serviceSearchModel
          ? _value.serviceSearchModel
          : serviceSearchModel // ignore: cast_nullable_to_non_nullable
              as ServiceSearchModel,
    ));
  }
}

/// @nodoc

class _$ServiceSearchEvent implements ServiceSearchEvent {
  const _$ServiceSearchEvent({required this.serviceSearchModel});

  @override
  final ServiceSearchModel serviceSearchModel;

  @override
  String toString() {
    return 'ServiceEvent.search(serviceSearchModel: $serviceSearchModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceSearchEvent &&
            (identical(other.serviceSearchModel, serviceSearchModel) ||
                other.serviceSearchModel == serviceSearchModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceSearchModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceSearchEventCopyWith<_$ServiceSearchEvent> get copyWith =>
      __$$ServiceSearchEventCopyWithImpl<_$ServiceSearchEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ServiceModel serviceModel) create,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
  }) {
    return search(serviceSearchModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
  }) {
    return search?.call(serviceSearchModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(serviceSearchModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceCreateEvent value) create,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceChecklistEvent value)
        multichecklistChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceChecklistEvent value)? multichecklistChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceChecklistEvent value)? multichecklistChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class ServiceSearchEvent implements ServiceEvent {
  const factory ServiceSearchEvent(
          {required final ServiceSearchModel serviceSearchModel}) =
      _$ServiceSearchEvent;

  ServiceSearchModel get serviceSearchModel;
  @JsonKey(ignore: true)
  _$$ServiceSearchEventCopyWith<_$ServiceSearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceChecklistEventCopyWith<$Res> {
  factory _$$ServiceChecklistEventCopyWith(_$ServiceChecklistEvent value,
          $Res Function(_$ServiceChecklistEvent) then) =
      __$$ServiceChecklistEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String value, bool submitTriggered});
}

/// @nodoc
class __$$ServiceChecklistEventCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$ServiceChecklistEvent>
    implements _$$ServiceChecklistEventCopyWith<$Res> {
  __$$ServiceChecklistEventCopyWithImpl(_$ServiceChecklistEvent _value,
      $Res Function(_$ServiceChecklistEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? submitTriggered = null,
  }) {
    return _then(_$ServiceChecklistEvent(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      submitTriggered: null == submitTriggered
          ? _value.submitTriggered
          : submitTriggered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ServiceChecklistEvent implements ServiceChecklistEvent {
  const _$ServiceChecklistEvent(
      {required this.value, required this.submitTriggered});

  @override
  final String value;
  @override
  final bool submitTriggered;

  @override
  String toString() {
    return 'ServiceEvent.multichecklistChanged(value: $value, submitTriggered: $submitTriggered)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceChecklistEvent &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.submitTriggered, submitTriggered) ||
                other.submitTriggered == submitTriggered));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, submitTriggered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceChecklistEventCopyWith<_$ServiceChecklistEvent> get copyWith =>
      __$$ServiceChecklistEventCopyWithImpl<_$ServiceChecklistEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ServiceModel serviceModel) create,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
  }) {
    return multichecklistChanged(value, submitTriggered);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
  }) {
    return multichecklistChanged?.call(value, submitTriggered);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    required TResult orElse(),
  }) {
    if (multichecklistChanged != null) {
      return multichecklistChanged(value, submitTriggered);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceCreateEvent value) create,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceChecklistEvent value)
        multichecklistChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
  }) {
    return multichecklistChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceChecklistEvent value)? multichecklistChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
  }) {
    return multichecklistChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceChecklistEvent value)? multichecklistChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    required TResult orElse(),
  }) {
    if (multichecklistChanged != null) {
      return multichecklistChanged(this);
    }
    return orElse();
  }
}

abstract class ServiceChecklistEvent implements ServiceEvent {
  const factory ServiceChecklistEvent(
      {required final String value,
      required final bool submitTriggered}) = _$ServiceChecklistEvent;

  String get value;
  bool get submitTriggered;
  @JsonKey(ignore: true)
  _$$ServiceChecklistEventCopyWith<_$ServiceChecklistEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceSelectionEventCopyWith<$Res> {
  factory _$$ServiceSelectionEventCopyWith(_$ServiceSelectionEvent value,
          $Res Function(_$ServiceSelectionEvent) then) =
      __$$ServiceSelectionEventCopyWithImpl<$Res>;
  @useResult
  $Res call({ServiceModel service});
}

/// @nodoc
class __$$ServiceSelectionEventCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$ServiceSelectionEvent>
    implements _$$ServiceSelectionEventCopyWith<$Res> {
  __$$ServiceSelectionEventCopyWithImpl(_$ServiceSelectionEvent _value,
      $Res Function(_$ServiceSelectionEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
  }) {
    return _then(_$ServiceSelectionEvent(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
    ));
  }
}

/// @nodoc

class _$ServiceSelectionEvent implements ServiceSelectionEvent {
  const _$ServiceSelectionEvent({required this.service});

  @override
  final ServiceModel service;

  @override
  String toString() {
    return 'ServiceEvent.selectService(service: $service)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceSelectionEvent &&
            (identical(other.service, service) || other.service == service));
  }

  @override
  int get hashCode => Object.hash(runtimeType, service);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceSelectionEventCopyWith<_$ServiceSelectionEvent> get copyWith =>
      __$$ServiceSelectionEventCopyWithImpl<_$ServiceSelectionEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ServiceModel serviceModel) create,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
  }) {
    return selectService(service);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
  }) {
    return selectService?.call(service);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    required TResult orElse(),
  }) {
    if (selectService != null) {
      return selectService(service);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceCreateEvent value) create,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceChecklistEvent value)
        multichecklistChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
  }) {
    return selectService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceChecklistEvent value)? multichecklistChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
  }) {
    return selectService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceChecklistEvent value)? multichecklistChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    required TResult orElse(),
  }) {
    if (selectService != null) {
      return selectService(this);
    }
    return orElse();
  }
}

abstract class ServiceSelectionEvent implements ServiceEvent {
  const factory ServiceSelectionEvent({required final ServiceModel service}) =
      _$ServiceSelectionEvent;

  ServiceModel get service;
  @JsonKey(ignore: true)
  _$$ServiceSelectionEventCopyWith<_$ServiceSelectionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceResetEventCopyWith<$Res> {
  factory _$$ServiceResetEventCopyWith(
          _$ServiceResetEvent value, $Res Function(_$ServiceResetEvent) then) =
      __$$ServiceResetEventCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ServiceModel> serviceList});
}

/// @nodoc
class __$$ServiceResetEventCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$ServiceResetEvent>
    implements _$$ServiceResetEventCopyWith<$Res> {
  __$$ServiceResetEventCopyWithImpl(
      _$ServiceResetEvent _value, $Res Function(_$ServiceResetEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceList = null,
  }) {
    return _then(_$ServiceResetEvent(
      serviceList: null == serviceList
          ? _value._serviceList
          : serviceList // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
    ));
  }
}

/// @nodoc

class _$ServiceResetEvent implements ServiceResetEvent {
  const _$ServiceResetEvent({required final List<ServiceModel> serviceList})
      : _serviceList = serviceList;

  final List<ServiceModel> _serviceList;
  @override
  List<ServiceModel> get serviceList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceList);
  }

  @override
  String toString() {
    return 'ServiceEvent.resetSelected(serviceList: $serviceList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceResetEvent &&
            const DeepCollectionEquality()
                .equals(other._serviceList, _serviceList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_serviceList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceResetEventCopyWith<_$ServiceResetEvent> get copyWith =>
      __$$ServiceResetEventCopyWithImpl<_$ServiceResetEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ServiceModel serviceModel) create,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
  }) {
    return resetSelected(serviceList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
  }) {
    return resetSelected?.call(serviceList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    required TResult orElse(),
  }) {
    if (resetSelected != null) {
      return resetSelected(serviceList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceCreateEvent value) create,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceChecklistEvent value)
        multichecklistChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
  }) {
    return resetSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceChecklistEvent value)? multichecklistChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
  }) {
    return resetSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceChecklistEvent value)? multichecklistChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    required TResult orElse(),
  }) {
    if (resetSelected != null) {
      return resetSelected(this);
    }
    return orElse();
  }
}

abstract class ServiceResetEvent implements ServiceEvent {
  const factory ServiceResetEvent(
      {required final List<ServiceModel> serviceList}) = _$ServiceResetEvent;

  List<ServiceModel> get serviceList;
  @JsonKey(ignore: true)
  _$$ServiceResetEventCopyWith<_$ServiceResetEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ServiceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isloading,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ServiceModel serviceList,
            ServiceModel? selectedService, bool loading, bool isEditing)
        serviceCreate,
    required TResult Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)
        serviceSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isloading,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing)?
        serviceCreate,
    TResult? Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)?
        serviceSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isloading,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing)?
        serviceCreate,
    TResult Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)?
        serviceSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceEmptyState value) empty,
    required TResult Function(ServiceIsloadingState value) isloading,
    required TResult Function(ServiceMultichecklistChangedState value)
        multichecklistChanged,
    required TResult Function(ServiceCreateState value) serviceCreate,
    required TResult Function(ServiceSearchState value) serviceSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEmptyState value)? empty,
    TResult? Function(ServiceIsloadingState value)? isloading,
    TResult? Function(ServiceMultichecklistChangedState value)?
        multichecklistChanged,
    TResult? Function(ServiceCreateState value)? serviceCreate,
    TResult? Function(ServiceSearchState value)? serviceSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEmptyState value)? empty,
    TResult Function(ServiceIsloadingState value)? isloading,
    TResult Function(ServiceMultichecklistChangedState value)?
        multichecklistChanged,
    TResult Function(ServiceCreateState value)? serviceCreate,
    TResult Function(ServiceSearchState value)? serviceSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceStateCopyWith<$Res> {
  factory $ServiceStateCopyWith(
          ServiceState value, $Res Function(ServiceState) then) =
      _$ServiceStateCopyWithImpl<$Res, ServiceState>;
}

/// @nodoc
class _$ServiceStateCopyWithImpl<$Res, $Val extends ServiceState>
    implements $ServiceStateCopyWith<$Res> {
  _$ServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServiceEmptyStateCopyWith<$Res> {
  factory _$$ServiceEmptyStateCopyWith(
          _$ServiceEmptyState value, $Res Function(_$ServiceEmptyState) then) =
      __$$ServiceEmptyStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceEmptyStateCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceEmptyState>
    implements _$$ServiceEmptyStateCopyWith<$Res> {
  __$$ServiceEmptyStateCopyWithImpl(
      _$ServiceEmptyState _value, $Res Function(_$ServiceEmptyState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServiceEmptyState implements ServiceEmptyState {
  const _$ServiceEmptyState();

  @override
  String toString() {
    return 'ServiceState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServiceEmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isloading,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ServiceModel serviceList,
            ServiceModel? selectedService, bool loading, bool isEditing)
        serviceCreate,
    required TResult Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)
        serviceSearch,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isloading,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing)?
        serviceCreate,
    TResult? Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)?
        serviceSearch,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isloading,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing)?
        serviceCreate,
    TResult Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)?
        serviceSearch,
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
    required TResult Function(ServiceEmptyState value) empty,
    required TResult Function(ServiceIsloadingState value) isloading,
    required TResult Function(ServiceMultichecklistChangedState value)
        multichecklistChanged,
    required TResult Function(ServiceCreateState value) serviceCreate,
    required TResult Function(ServiceSearchState value) serviceSearch,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEmptyState value)? empty,
    TResult? Function(ServiceIsloadingState value)? isloading,
    TResult? Function(ServiceMultichecklistChangedState value)?
        multichecklistChanged,
    TResult? Function(ServiceCreateState value)? serviceCreate,
    TResult? Function(ServiceSearchState value)? serviceSearch,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEmptyState value)? empty,
    TResult Function(ServiceIsloadingState value)? isloading,
    TResult Function(ServiceMultichecklistChangedState value)?
        multichecklistChanged,
    TResult Function(ServiceCreateState value)? serviceCreate,
    TResult Function(ServiceSearchState value)? serviceSearch,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class ServiceEmptyState implements ServiceState {
  const factory ServiceEmptyState() = _$ServiceEmptyState;
}

/// @nodoc
abstract class _$$ServiceIsloadingStateCopyWith<$Res> {
  factory _$$ServiceIsloadingStateCopyWith(_$ServiceIsloadingState value,
          $Res Function(_$ServiceIsloadingState) then) =
      __$$ServiceIsloadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceIsloadingStateCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceIsloadingState>
    implements _$$ServiceIsloadingStateCopyWith<$Res> {
  __$$ServiceIsloadingStateCopyWithImpl(_$ServiceIsloadingState _value,
      $Res Function(_$ServiceIsloadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServiceIsloadingState implements ServiceIsloadingState {
  const _$ServiceIsloadingState();

  @override
  String toString() {
    return 'ServiceState.isloading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServiceIsloadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isloading,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ServiceModel serviceList,
            ServiceModel? selectedService, bool loading, bool isEditing)
        serviceCreate,
    required TResult Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)
        serviceSearch,
  }) {
    return isloading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isloading,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing)?
        serviceCreate,
    TResult? Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)?
        serviceSearch,
  }) {
    return isloading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isloading,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing)?
        serviceCreate,
    TResult Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)?
        serviceSearch,
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
    required TResult Function(ServiceEmptyState value) empty,
    required TResult Function(ServiceIsloadingState value) isloading,
    required TResult Function(ServiceMultichecklistChangedState value)
        multichecklistChanged,
    required TResult Function(ServiceCreateState value) serviceCreate,
    required TResult Function(ServiceSearchState value) serviceSearch,
  }) {
    return isloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEmptyState value)? empty,
    TResult? Function(ServiceIsloadingState value)? isloading,
    TResult? Function(ServiceMultichecklistChangedState value)?
        multichecklistChanged,
    TResult? Function(ServiceCreateState value)? serviceCreate,
    TResult? Function(ServiceSearchState value)? serviceSearch,
  }) {
    return isloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEmptyState value)? empty,
    TResult Function(ServiceIsloadingState value)? isloading,
    TResult Function(ServiceMultichecklistChangedState value)?
        multichecklistChanged,
    TResult Function(ServiceCreateState value)? serviceCreate,
    TResult Function(ServiceSearchState value)? serviceSearch,
    required TResult orElse(),
  }) {
    if (isloading != null) {
      return isloading(this);
    }
    return orElse();
  }
}

abstract class ServiceIsloadingState implements ServiceState {
  const factory ServiceIsloadingState() = _$ServiceIsloadingState;
}

/// @nodoc
abstract class _$$ServiceMultichecklistChangedStateCopyWith<$Res> {
  factory _$$ServiceMultichecklistChangedStateCopyWith(
          _$ServiceMultichecklistChangedState value,
          $Res Function(_$ServiceMultichecklistChangedState) then) =
      __$$ServiceMultichecklistChangedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String value, bool submitTriggered});
}

/// @nodoc
class __$$ServiceMultichecklistChangedStateCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res,
        _$ServiceMultichecklistChangedState>
    implements _$$ServiceMultichecklistChangedStateCopyWith<$Res> {
  __$$ServiceMultichecklistChangedStateCopyWithImpl(
      _$ServiceMultichecklistChangedState _value,
      $Res Function(_$ServiceMultichecklistChangedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? submitTriggered = null,
  }) {
    return _then(_$ServiceMultichecklistChangedState(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      submitTriggered: null == submitTriggered
          ? _value.submitTriggered
          : submitTriggered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ServiceMultichecklistChangedState
    implements ServiceMultichecklistChangedState {
  const _$ServiceMultichecklistChangedState(
      {this.value = '', this.submitTriggered = false});

  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final bool submitTriggered;

  @override
  String toString() {
    return 'ServiceState.multichecklistChanged(value: $value, submitTriggered: $submitTriggered)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceMultichecklistChangedState &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.submitTriggered, submitTriggered) ||
                other.submitTriggered == submitTriggered));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, submitTriggered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceMultichecklistChangedStateCopyWith<
          _$ServiceMultichecklistChangedState>
      get copyWith => __$$ServiceMultichecklistChangedStateCopyWithImpl<
          _$ServiceMultichecklistChangedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isloading,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ServiceModel serviceList,
            ServiceModel? selectedService, bool loading, bool isEditing)
        serviceCreate,
    required TResult Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)
        serviceSearch,
  }) {
    return multichecklistChanged(value, submitTriggered);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isloading,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing)?
        serviceCreate,
    TResult? Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)?
        serviceSearch,
  }) {
    return multichecklistChanged?.call(value, submitTriggered);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isloading,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing)?
        serviceCreate,
    TResult Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)?
        serviceSearch,
    required TResult orElse(),
  }) {
    if (multichecklistChanged != null) {
      return multichecklistChanged(value, submitTriggered);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceEmptyState value) empty,
    required TResult Function(ServiceIsloadingState value) isloading,
    required TResult Function(ServiceMultichecklistChangedState value)
        multichecklistChanged,
    required TResult Function(ServiceCreateState value) serviceCreate,
    required TResult Function(ServiceSearchState value) serviceSearch,
  }) {
    return multichecklistChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEmptyState value)? empty,
    TResult? Function(ServiceIsloadingState value)? isloading,
    TResult? Function(ServiceMultichecklistChangedState value)?
        multichecklistChanged,
    TResult? Function(ServiceCreateState value)? serviceCreate,
    TResult? Function(ServiceSearchState value)? serviceSearch,
  }) {
    return multichecklistChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEmptyState value)? empty,
    TResult Function(ServiceIsloadingState value)? isloading,
    TResult Function(ServiceMultichecklistChangedState value)?
        multichecklistChanged,
    TResult Function(ServiceCreateState value)? serviceCreate,
    TResult Function(ServiceSearchState value)? serviceSearch,
    required TResult orElse(),
  }) {
    if (multichecklistChanged != null) {
      return multichecklistChanged(this);
    }
    return orElse();
  }
}

abstract class ServiceMultichecklistChangedState implements ServiceState {
  const factory ServiceMultichecklistChangedState(
      {final String value,
      final bool submitTriggered}) = _$ServiceMultichecklistChangedState;

  String get value;
  bool get submitTriggered;
  @JsonKey(ignore: true)
  _$$ServiceMultichecklistChangedStateCopyWith<
          _$ServiceMultichecklistChangedState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceCreateStateCopyWith<$Res> {
  factory _$$ServiceCreateStateCopyWith(_$ServiceCreateState value,
          $Res Function(_$ServiceCreateState) then) =
      __$$ServiceCreateStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ServiceModel serviceList,
      ServiceModel? selectedService,
      bool loading,
      bool isEditing});
}

/// @nodoc
class __$$ServiceCreateStateCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceCreateState>
    implements _$$ServiceCreateStateCopyWith<$Res> {
  __$$ServiceCreateStateCopyWithImpl(
      _$ServiceCreateState _value, $Res Function(_$ServiceCreateState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceList = null,
    Object? selectedService = freezed,
    Object? loading = null,
    Object? isEditing = null,
  }) {
    return _then(_$ServiceCreateState(
      serviceList: null == serviceList
          ? _value.serviceList
          : serviceList // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
      selectedService: freezed == selectedService
          ? _value.selectedService
          : selectedService // ignore: cast_nullable_to_non_nullable
              as ServiceModel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ServiceCreateState implements ServiceCreateState {
  const _$ServiceCreateState(
      {required this.serviceList,
      this.selectedService,
      this.loading = false,
      this.isEditing = false});

  @override
  final ServiceModel serviceList;
  @override
  final ServiceModel? selectedService;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isEditing;

  @override
  String toString() {
    return 'ServiceState.serviceCreate(serviceList: $serviceList, selectedService: $selectedService, loading: $loading, isEditing: $isEditing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceCreateState &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceCreateStateCopyWith<_$ServiceCreateState> get copyWith =>
      __$$ServiceCreateStateCopyWithImpl<_$ServiceCreateState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isloading,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ServiceModel serviceList,
            ServiceModel? selectedService, bool loading, bool isEditing)
        serviceCreate,
    required TResult Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)
        serviceSearch,
  }) {
    return serviceCreate(serviceList, selectedService, loading, isEditing);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isloading,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing)?
        serviceCreate,
    TResult? Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)?
        serviceSearch,
  }) {
    return serviceCreate?.call(
        serviceList, selectedService, loading, isEditing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isloading,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing)?
        serviceCreate,
    TResult Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)?
        serviceSearch,
    required TResult orElse(),
  }) {
    if (serviceCreate != null) {
      return serviceCreate(serviceList, selectedService, loading, isEditing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceEmptyState value) empty,
    required TResult Function(ServiceIsloadingState value) isloading,
    required TResult Function(ServiceMultichecklistChangedState value)
        multichecklistChanged,
    required TResult Function(ServiceCreateState value) serviceCreate,
    required TResult Function(ServiceSearchState value) serviceSearch,
  }) {
    return serviceCreate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEmptyState value)? empty,
    TResult? Function(ServiceIsloadingState value)? isloading,
    TResult? Function(ServiceMultichecklistChangedState value)?
        multichecklistChanged,
    TResult? Function(ServiceCreateState value)? serviceCreate,
    TResult? Function(ServiceSearchState value)? serviceSearch,
  }) {
    return serviceCreate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEmptyState value)? empty,
    TResult Function(ServiceIsloadingState value)? isloading,
    TResult Function(ServiceMultichecklistChangedState value)?
        multichecklistChanged,
    TResult Function(ServiceCreateState value)? serviceCreate,
    TResult Function(ServiceSearchState value)? serviceSearch,
    required TResult orElse(),
  }) {
    if (serviceCreate != null) {
      return serviceCreate(this);
    }
    return orElse();
  }
}

abstract class ServiceCreateState implements ServiceState {
  const factory ServiceCreateState(
      {required final ServiceModel serviceList,
      final ServiceModel? selectedService,
      final bool loading,
      final bool isEditing}) = _$ServiceCreateState;

  ServiceModel get serviceList;
  ServiceModel? get selectedService;
  bool get loading;
  bool get isEditing;
  @JsonKey(ignore: true)
  _$$ServiceCreateStateCopyWith<_$ServiceCreateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceSearchStateCopyWith<$Res> {
  factory _$$ServiceSearchStateCopyWith(_$ServiceSearchState value,
          $Res Function(_$ServiceSearchState) then) =
      __$$ServiceSearchStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ServiceModel> serviceList,
      ServiceModel? selectedService,
      bool loading});
}

/// @nodoc
class __$$ServiceSearchStateCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceSearchState>
    implements _$$ServiceSearchStateCopyWith<$Res> {
  __$$ServiceSearchStateCopyWithImpl(
      _$ServiceSearchState _value, $Res Function(_$ServiceSearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceList = null,
    Object? selectedService = freezed,
    Object? loading = null,
  }) {
    return _then(_$ServiceSearchState(
      serviceList: null == serviceList
          ? _value._serviceList
          : serviceList // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
      selectedService: freezed == selectedService
          ? _value.selectedService
          : selectedService // ignore: cast_nullable_to_non_nullable
              as ServiceModel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ServiceSearchState implements ServiceSearchState {
  const _$ServiceSearchState(
      {required final List<ServiceModel> serviceList,
      this.selectedService,
      this.loading = false})
      : _serviceList = serviceList;

  final List<ServiceModel> _serviceList;
  @override
  List<ServiceModel> get serviceList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceList);
  }

  @override
  final ServiceModel? selectedService;
  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'ServiceState.serviceSearch(serviceList: $serviceList, selectedService: $selectedService, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceSearchState &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceSearchStateCopyWith<_$ServiceSearchState> get copyWith =>
      __$$ServiceSearchStateCopyWithImpl<_$ServiceSearchState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isloading,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ServiceModel serviceList,
            ServiceModel? selectedService, bool loading, bool isEditing)
        serviceCreate,
    required TResult Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)
        serviceSearch,
  }) {
    return serviceSearch(serviceList, selectedService, loading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isloading,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing)?
        serviceCreate,
    TResult? Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)?
        serviceSearch,
  }) {
    return serviceSearch?.call(serviceList, selectedService, loading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isloading,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing)?
        serviceCreate,
    TResult Function(List<ServiceModel> serviceList,
            ServiceModel? selectedService, bool loading)?
        serviceSearch,
    required TResult orElse(),
  }) {
    if (serviceSearch != null) {
      return serviceSearch(serviceList, selectedService, loading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceEmptyState value) empty,
    required TResult Function(ServiceIsloadingState value) isloading,
    required TResult Function(ServiceMultichecklistChangedState value)
        multichecklistChanged,
    required TResult Function(ServiceCreateState value) serviceCreate,
    required TResult Function(ServiceSearchState value) serviceSearch,
  }) {
    return serviceSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEmptyState value)? empty,
    TResult? Function(ServiceIsloadingState value)? isloading,
    TResult? Function(ServiceMultichecklistChangedState value)?
        multichecklistChanged,
    TResult? Function(ServiceCreateState value)? serviceCreate,
    TResult? Function(ServiceSearchState value)? serviceSearch,
  }) {
    return serviceSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEmptyState value)? empty,
    TResult Function(ServiceIsloadingState value)? isloading,
    TResult Function(ServiceMultichecklistChangedState value)?
        multichecklistChanged,
    TResult Function(ServiceCreateState value)? serviceCreate,
    TResult Function(ServiceSearchState value)? serviceSearch,
    required TResult orElse(),
  }) {
    if (serviceSearch != null) {
      return serviceSearch(this);
    }
    return orElse();
  }
}

abstract class ServiceSearchState implements ServiceState {
  const factory ServiceSearchState(
      {required final List<ServiceModel> serviceList,
      final ServiceModel? selectedService,
      final bool loading}) = _$ServiceSearchState;

  List<ServiceModel> get serviceList;
  ServiceModel? get selectedService;
  bool get loading;
  @JsonKey(ignore: true)
  _$$ServiceSearchStateCopyWith<_$ServiceSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

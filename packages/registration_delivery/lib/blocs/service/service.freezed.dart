// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$ServiceCreateEventImplCopyWith<$Res> {
  factory _$$ServiceCreateEventImplCopyWith(_$ServiceCreateEventImpl value,
          $Res Function(_$ServiceCreateEventImpl) then) =
      __$$ServiceCreateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ServiceModel serviceModel});
}

/// @nodoc
class __$$ServiceCreateEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$ServiceCreateEventImpl>
    implements _$$ServiceCreateEventImplCopyWith<$Res> {
  __$$ServiceCreateEventImplCopyWithImpl(_$ServiceCreateEventImpl _value,
      $Res Function(_$ServiceCreateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceModel = null,
  }) {
    return _then(_$ServiceCreateEventImpl(
      serviceModel: null == serviceModel
          ? _value.serviceModel
          : serviceModel // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
    ));
  }
}

/// @nodoc

class _$ServiceCreateEventImpl implements ServiceCreateEvent {
  const _$ServiceCreateEventImpl({required this.serviceModel});

  @override
  final ServiceModel serviceModel;

  @override
  String toString() {
    return 'ServiceEvent.create(serviceModel: $serviceModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceCreateEventImpl &&
            (identical(other.serviceModel, serviceModel) ||
                other.serviceModel == serviceModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceCreateEventImplCopyWith<_$ServiceCreateEventImpl> get copyWith =>
      __$$ServiceCreateEventImplCopyWithImpl<_$ServiceCreateEventImpl>(
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
      _$ServiceCreateEventImpl;

  ServiceModel get serviceModel;
  @JsonKey(ignore: true)
  _$$ServiceCreateEventImplCopyWith<_$ServiceCreateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceSearchEventImplCopyWith<$Res> {
  factory _$$ServiceSearchEventImplCopyWith(_$ServiceSearchEventImpl value,
          $Res Function(_$ServiceSearchEventImpl) then) =
      __$$ServiceSearchEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ServiceSearchModel serviceSearchModel});
}

/// @nodoc
class __$$ServiceSearchEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$ServiceSearchEventImpl>
    implements _$$ServiceSearchEventImplCopyWith<$Res> {
  __$$ServiceSearchEventImplCopyWithImpl(_$ServiceSearchEventImpl _value,
      $Res Function(_$ServiceSearchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceSearchModel = null,
  }) {
    return _then(_$ServiceSearchEventImpl(
      serviceSearchModel: null == serviceSearchModel
          ? _value.serviceSearchModel
          : serviceSearchModel // ignore: cast_nullable_to_non_nullable
              as ServiceSearchModel,
    ));
  }
}

/// @nodoc

class _$ServiceSearchEventImpl implements ServiceSearchEvent {
  const _$ServiceSearchEventImpl({required this.serviceSearchModel});

  @override
  final ServiceSearchModel serviceSearchModel;

  @override
  String toString() {
    return 'ServiceEvent.search(serviceSearchModel: $serviceSearchModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceSearchEventImpl &&
            (identical(other.serviceSearchModel, serviceSearchModel) ||
                other.serviceSearchModel == serviceSearchModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceSearchModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceSearchEventImplCopyWith<_$ServiceSearchEventImpl> get copyWith =>
      __$$ServiceSearchEventImplCopyWithImpl<_$ServiceSearchEventImpl>(
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
      _$ServiceSearchEventImpl;

  ServiceSearchModel get serviceSearchModel;
  @JsonKey(ignore: true)
  _$$ServiceSearchEventImplCopyWith<_$ServiceSearchEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceChecklistEventImplCopyWith<$Res> {
  factory _$$ServiceChecklistEventImplCopyWith(
          _$ServiceChecklistEventImpl value,
          $Res Function(_$ServiceChecklistEventImpl) then) =
      __$$ServiceChecklistEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value, bool submitTriggered});
}

/// @nodoc
class __$$ServiceChecklistEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$ServiceChecklistEventImpl>
    implements _$$ServiceChecklistEventImplCopyWith<$Res> {
  __$$ServiceChecklistEventImplCopyWithImpl(_$ServiceChecklistEventImpl _value,
      $Res Function(_$ServiceChecklistEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? submitTriggered = null,
  }) {
    return _then(_$ServiceChecklistEventImpl(
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

class _$ServiceChecklistEventImpl implements ServiceChecklistEvent {
  const _$ServiceChecklistEventImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceChecklistEventImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.submitTriggered, submitTriggered) ||
                other.submitTriggered == submitTriggered));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, submitTriggered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceChecklistEventImplCopyWith<_$ServiceChecklistEventImpl>
      get copyWith => __$$ServiceChecklistEventImplCopyWithImpl<
          _$ServiceChecklistEventImpl>(this, _$identity);

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
      required final bool submitTriggered}) = _$ServiceChecklistEventImpl;

  String get value;
  bool get submitTriggered;
  @JsonKey(ignore: true)
  _$$ServiceChecklistEventImplCopyWith<_$ServiceChecklistEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceSelectionEventImplCopyWith<$Res> {
  factory _$$ServiceSelectionEventImplCopyWith(
          _$ServiceSelectionEventImpl value,
          $Res Function(_$ServiceSelectionEventImpl) then) =
      __$$ServiceSelectionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ServiceModel service});
}

/// @nodoc
class __$$ServiceSelectionEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$ServiceSelectionEventImpl>
    implements _$$ServiceSelectionEventImplCopyWith<$Res> {
  __$$ServiceSelectionEventImplCopyWithImpl(_$ServiceSelectionEventImpl _value,
      $Res Function(_$ServiceSelectionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
  }) {
    return _then(_$ServiceSelectionEventImpl(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
    ));
  }
}

/// @nodoc

class _$ServiceSelectionEventImpl implements ServiceSelectionEvent {
  const _$ServiceSelectionEventImpl({required this.service});

  @override
  final ServiceModel service;

  @override
  String toString() {
    return 'ServiceEvent.selectService(service: $service)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceSelectionEventImpl &&
            (identical(other.service, service) || other.service == service));
  }

  @override
  int get hashCode => Object.hash(runtimeType, service);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceSelectionEventImplCopyWith<_$ServiceSelectionEventImpl>
      get copyWith => __$$ServiceSelectionEventImplCopyWithImpl<
          _$ServiceSelectionEventImpl>(this, _$identity);

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
      _$ServiceSelectionEventImpl;

  ServiceModel get service;
  @JsonKey(ignore: true)
  _$$ServiceSelectionEventImplCopyWith<_$ServiceSelectionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceResetEventImplCopyWith<$Res> {
  factory _$$ServiceResetEventImplCopyWith(_$ServiceResetEventImpl value,
          $Res Function(_$ServiceResetEventImpl) then) =
      __$$ServiceResetEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ServiceModel> serviceList});
}

/// @nodoc
class __$$ServiceResetEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$ServiceResetEventImpl>
    implements _$$ServiceResetEventImplCopyWith<$Res> {
  __$$ServiceResetEventImplCopyWithImpl(_$ServiceResetEventImpl _value,
      $Res Function(_$ServiceResetEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceList = null,
  }) {
    return _then(_$ServiceResetEventImpl(
      serviceList: null == serviceList
          ? _value._serviceList
          : serviceList // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
    ));
  }
}

/// @nodoc

class _$ServiceResetEventImpl implements ServiceResetEvent {
  const _$ServiceResetEventImpl({required final List<ServiceModel> serviceList})
      : _serviceList = serviceList;

  final List<ServiceModel> _serviceList;
  @override
  List<ServiceModel> get serviceList {
    if (_serviceList is EqualUnmodifiableListView) return _serviceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceList);
  }

  @override
  String toString() {
    return 'ServiceEvent.resetSelected(serviceList: $serviceList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceResetEventImpl &&
            const DeepCollectionEquality()
                .equals(other._serviceList, _serviceList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_serviceList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceResetEventImplCopyWith<_$ServiceResetEventImpl> get copyWith =>
      __$$ServiceResetEventImplCopyWithImpl<_$ServiceResetEventImpl>(
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
          {required final List<ServiceModel> serviceList}) =
      _$ServiceResetEventImpl;

  List<ServiceModel> get serviceList;
  @JsonKey(ignore: true)
  _$$ServiceResetEventImplCopyWith<_$ServiceResetEventImpl> get copyWith =>
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
abstract class _$$ServiceEmptyStateImplCopyWith<$Res> {
  factory _$$ServiceEmptyStateImplCopyWith(_$ServiceEmptyStateImpl value,
          $Res Function(_$ServiceEmptyStateImpl) then) =
      __$$ServiceEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceEmptyStateImplCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceEmptyStateImpl>
    implements _$$ServiceEmptyStateImplCopyWith<$Res> {
  __$$ServiceEmptyStateImplCopyWithImpl(_$ServiceEmptyStateImpl _value,
      $Res Function(_$ServiceEmptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServiceEmptyStateImpl implements ServiceEmptyState {
  const _$ServiceEmptyStateImpl();

  @override
  String toString() {
    return 'ServiceState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServiceEmptyStateImpl);
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
  const factory ServiceEmptyState() = _$ServiceEmptyStateImpl;
}

/// @nodoc
abstract class _$$ServiceIsloadingStateImplCopyWith<$Res> {
  factory _$$ServiceIsloadingStateImplCopyWith(
          _$ServiceIsloadingStateImpl value,
          $Res Function(_$ServiceIsloadingStateImpl) then) =
      __$$ServiceIsloadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceIsloadingStateImplCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceIsloadingStateImpl>
    implements _$$ServiceIsloadingStateImplCopyWith<$Res> {
  __$$ServiceIsloadingStateImplCopyWithImpl(_$ServiceIsloadingStateImpl _value,
      $Res Function(_$ServiceIsloadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServiceIsloadingStateImpl implements ServiceIsloadingState {
  const _$ServiceIsloadingStateImpl();

  @override
  String toString() {
    return 'ServiceState.isloading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceIsloadingStateImpl);
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
  const factory ServiceIsloadingState() = _$ServiceIsloadingStateImpl;
}

/// @nodoc
abstract class _$$ServiceMultichecklistChangedStateImplCopyWith<$Res> {
  factory _$$ServiceMultichecklistChangedStateImplCopyWith(
          _$ServiceMultichecklistChangedStateImpl value,
          $Res Function(_$ServiceMultichecklistChangedStateImpl) then) =
      __$$ServiceMultichecklistChangedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value, bool submitTriggered});
}

/// @nodoc
class __$$ServiceMultichecklistChangedStateImplCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res,
        _$ServiceMultichecklistChangedStateImpl>
    implements _$$ServiceMultichecklistChangedStateImplCopyWith<$Res> {
  __$$ServiceMultichecklistChangedStateImplCopyWithImpl(
      _$ServiceMultichecklistChangedStateImpl _value,
      $Res Function(_$ServiceMultichecklistChangedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? submitTriggered = null,
  }) {
    return _then(_$ServiceMultichecklistChangedStateImpl(
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

class _$ServiceMultichecklistChangedStateImpl
    implements ServiceMultichecklistChangedState {
  const _$ServiceMultichecklistChangedStateImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceMultichecklistChangedStateImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.submitTriggered, submitTriggered) ||
                other.submitTriggered == submitTriggered));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, submitTriggered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceMultichecklistChangedStateImplCopyWith<
          _$ServiceMultichecklistChangedStateImpl>
      get copyWith => __$$ServiceMultichecklistChangedStateImplCopyWithImpl<
          _$ServiceMultichecklistChangedStateImpl>(this, _$identity);

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
      final bool submitTriggered}) = _$ServiceMultichecklistChangedStateImpl;

  String get value;
  bool get submitTriggered;
  @JsonKey(ignore: true)
  _$$ServiceMultichecklistChangedStateImplCopyWith<
          _$ServiceMultichecklistChangedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceCreateStateImplCopyWith<$Res> {
  factory _$$ServiceCreateStateImplCopyWith(_$ServiceCreateStateImpl value,
          $Res Function(_$ServiceCreateStateImpl) then) =
      __$$ServiceCreateStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ServiceModel serviceList,
      ServiceModel? selectedService,
      bool loading,
      bool isEditing});
}

/// @nodoc
class __$$ServiceCreateStateImplCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceCreateStateImpl>
    implements _$$ServiceCreateStateImplCopyWith<$Res> {
  __$$ServiceCreateStateImplCopyWithImpl(_$ServiceCreateStateImpl _value,
      $Res Function(_$ServiceCreateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceList = null,
    Object? selectedService = freezed,
    Object? loading = null,
    Object? isEditing = null,
  }) {
    return _then(_$ServiceCreateStateImpl(
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

class _$ServiceCreateStateImpl implements ServiceCreateState {
  const _$ServiceCreateStateImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceCreateStateImpl &&
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
  _$$ServiceCreateStateImplCopyWith<_$ServiceCreateStateImpl> get copyWith =>
      __$$ServiceCreateStateImplCopyWithImpl<_$ServiceCreateStateImpl>(
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
      final bool isEditing}) = _$ServiceCreateStateImpl;

  ServiceModel get serviceList;
  ServiceModel? get selectedService;
  bool get loading;
  bool get isEditing;
  @JsonKey(ignore: true)
  _$$ServiceCreateStateImplCopyWith<_$ServiceCreateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceSearchStateImplCopyWith<$Res> {
  factory _$$ServiceSearchStateImplCopyWith(_$ServiceSearchStateImpl value,
          $Res Function(_$ServiceSearchStateImpl) then) =
      __$$ServiceSearchStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ServiceModel> serviceList,
      ServiceModel? selectedService,
      bool loading});
}

/// @nodoc
class __$$ServiceSearchStateImplCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceSearchStateImpl>
    implements _$$ServiceSearchStateImplCopyWith<$Res> {
  __$$ServiceSearchStateImplCopyWithImpl(_$ServiceSearchStateImpl _value,
      $Res Function(_$ServiceSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceList = null,
    Object? selectedService = freezed,
    Object? loading = null,
  }) {
    return _then(_$ServiceSearchStateImpl(
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

class _$ServiceSearchStateImpl implements ServiceSearchState {
  const _$ServiceSearchStateImpl(
      {required final List<ServiceModel> serviceList,
      this.selectedService,
      this.loading = false})
      : _serviceList = serviceList;

  final List<ServiceModel> _serviceList;
  @override
  List<ServiceModel> get serviceList {
    if (_serviceList is EqualUnmodifiableListView) return _serviceList;
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceSearchStateImpl &&
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
  _$$ServiceSearchStateImplCopyWith<_$ServiceSearchStateImpl> get copyWith =>
      __$$ServiceSearchStateImplCopyWithImpl<_$ServiceSearchStateImpl>(
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
      final bool loading}) = _$ServiceSearchStateImpl;

  List<ServiceModel> get serviceList;
  ServiceModel? get selectedService;
  bool get loading;
  @JsonKey(ignore: true)
  _$$ServiceSearchStateImplCopyWith<_$ServiceSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

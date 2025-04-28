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
    required TResult Function(ServiceModel serviceModel) update,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multiSurveyFormChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
    required TResult Function(ServiceModel draftService) draftService,
    required TResult Function() clearDrafts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceModel serviceModel)? update,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
    TResult? Function(ServiceModel draftService)? draftService,
    TResult? Function()? clearDrafts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceModel serviceModel)? update,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    TResult Function(ServiceModel draftService)? draftService,
    TResult Function()? clearDrafts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceCreateEvent value) create,
    required TResult Function(ServiceUpdateEvent value) update,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceSurveyFormEvent value)
        multiSurveyFormChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
    required TResult Function(ServiceDraftEvent value) draftService,
    required TResult Function(ServiceClearDraftsEvent value) clearDrafts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceUpdateEvent value)? update,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
    TResult? Function(ServiceDraftEvent value)? draftService,
    TResult? Function(ServiceClearDraftsEvent value)? clearDrafts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceUpdateEvent value)? update,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    TResult Function(ServiceDraftEvent value)? draftService,
    TResult Function(ServiceClearDraftsEvent value)? clearDrafts,
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
    required TResult Function(ServiceModel serviceModel) update,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multiSurveyFormChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
    required TResult Function(ServiceModel draftService) draftService,
    required TResult Function() clearDrafts,
  }) {
    return create(serviceModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceModel serviceModel)? update,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
    TResult? Function(ServiceModel draftService)? draftService,
    TResult? Function()? clearDrafts,
  }) {
    return create?.call(serviceModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceModel serviceModel)? update,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    TResult Function(ServiceModel draftService)? draftService,
    TResult Function()? clearDrafts,
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
    required TResult Function(ServiceUpdateEvent value) update,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceSurveyFormEvent value)
        multiSurveyFormChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
    required TResult Function(ServiceDraftEvent value) draftService,
    required TResult Function(ServiceClearDraftsEvent value) clearDrafts,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceUpdateEvent value)? update,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
    TResult? Function(ServiceDraftEvent value)? draftService,
    TResult? Function(ServiceClearDraftsEvent value)? clearDrafts,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceUpdateEvent value)? update,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    TResult Function(ServiceDraftEvent value)? draftService,
    TResult Function(ServiceClearDraftsEvent value)? clearDrafts,
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
abstract class _$$ServiceUpdateEventImplCopyWith<$Res> {
  factory _$$ServiceUpdateEventImplCopyWith(_$ServiceUpdateEventImpl value,
          $Res Function(_$ServiceUpdateEventImpl) then) =
      __$$ServiceUpdateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ServiceModel serviceModel});
}

/// @nodoc
class __$$ServiceUpdateEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$ServiceUpdateEventImpl>
    implements _$$ServiceUpdateEventImplCopyWith<$Res> {
  __$$ServiceUpdateEventImplCopyWithImpl(_$ServiceUpdateEventImpl _value,
      $Res Function(_$ServiceUpdateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceModel = null,
  }) {
    return _then(_$ServiceUpdateEventImpl(
      serviceModel: null == serviceModel
          ? _value.serviceModel
          : serviceModel // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
    ));
  }
}

/// @nodoc

class _$ServiceUpdateEventImpl implements ServiceUpdateEvent {
  const _$ServiceUpdateEventImpl({required this.serviceModel});

  @override
  final ServiceModel serviceModel;

  @override
  String toString() {
    return 'ServiceEvent.update(serviceModel: $serviceModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceUpdateEventImpl &&
            (identical(other.serviceModel, serviceModel) ||
                other.serviceModel == serviceModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceUpdateEventImplCopyWith<_$ServiceUpdateEventImpl> get copyWith =>
      __$$ServiceUpdateEventImplCopyWithImpl<_$ServiceUpdateEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ServiceModel serviceModel) create,
    required TResult Function(ServiceModel serviceModel) update,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multiSurveyFormChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
    required TResult Function(ServiceModel draftService) draftService,
    required TResult Function() clearDrafts,
  }) {
    return update(serviceModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceModel serviceModel)? update,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
    TResult? Function(ServiceModel draftService)? draftService,
    TResult? Function()? clearDrafts,
  }) {
    return update?.call(serviceModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceModel serviceModel)? update,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    TResult Function(ServiceModel draftService)? draftService,
    TResult Function()? clearDrafts,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(serviceModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceCreateEvent value) create,
    required TResult Function(ServiceUpdateEvent value) update,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceSurveyFormEvent value)
        multiSurveyFormChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
    required TResult Function(ServiceDraftEvent value) draftService,
    required TResult Function(ServiceClearDraftsEvent value) clearDrafts,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceUpdateEvent value)? update,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
    TResult? Function(ServiceDraftEvent value)? draftService,
    TResult? Function(ServiceClearDraftsEvent value)? clearDrafts,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceUpdateEvent value)? update,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    TResult Function(ServiceDraftEvent value)? draftService,
    TResult Function(ServiceClearDraftsEvent value)? clearDrafts,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class ServiceUpdateEvent implements ServiceEvent {
  const factory ServiceUpdateEvent({required final ServiceModel serviceModel}) =
      _$ServiceUpdateEventImpl;

  ServiceModel get serviceModel;
  @JsonKey(ignore: true)
  _$$ServiceUpdateEventImplCopyWith<_$ServiceUpdateEventImpl> get copyWith =>
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
    required TResult Function(ServiceModel serviceModel) update,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multiSurveyFormChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
    required TResult Function(ServiceModel draftService) draftService,
    required TResult Function() clearDrafts,
  }) {
    return search(serviceSearchModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceModel serviceModel)? update,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
    TResult? Function(ServiceModel draftService)? draftService,
    TResult? Function()? clearDrafts,
  }) {
    return search?.call(serviceSearchModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceModel serviceModel)? update,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    TResult Function(ServiceModel draftService)? draftService,
    TResult Function()? clearDrafts,
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
    required TResult Function(ServiceUpdateEvent value) update,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceSurveyFormEvent value)
        multiSurveyFormChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
    required TResult Function(ServiceDraftEvent value) draftService,
    required TResult Function(ServiceClearDraftsEvent value) clearDrafts,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceUpdateEvent value)? update,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
    TResult? Function(ServiceDraftEvent value)? draftService,
    TResult? Function(ServiceClearDraftsEvent value)? clearDrafts,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceUpdateEvent value)? update,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    TResult Function(ServiceDraftEvent value)? draftService,
    TResult Function(ServiceClearDraftsEvent value)? clearDrafts,
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
abstract class _$$ServiceSurveyFormEventImplCopyWith<$Res> {
  factory _$$ServiceSurveyFormEventImplCopyWith(
          _$ServiceSurveyFormEventImpl value,
          $Res Function(_$ServiceSurveyFormEventImpl) then) =
      __$$ServiceSurveyFormEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value, bool submitTriggered});
}

/// @nodoc
class __$$ServiceSurveyFormEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$ServiceSurveyFormEventImpl>
    implements _$$ServiceSurveyFormEventImplCopyWith<$Res> {
  __$$ServiceSurveyFormEventImplCopyWithImpl(
      _$ServiceSurveyFormEventImpl _value,
      $Res Function(_$ServiceSurveyFormEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? submitTriggered = null,
  }) {
    return _then(_$ServiceSurveyFormEventImpl(
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

class _$ServiceSurveyFormEventImpl implements ServiceSurveyFormEvent {
  const _$ServiceSurveyFormEventImpl(
      {required this.value, required this.submitTriggered});

  @override
  final String value;
  @override
  final bool submitTriggered;

  @override
  String toString() {
    return 'ServiceEvent.multiSurveyFormChanged(value: $value, submitTriggered: $submitTriggered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceSurveyFormEventImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.submitTriggered, submitTriggered) ||
                other.submitTriggered == submitTriggered));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, submitTriggered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceSurveyFormEventImplCopyWith<_$ServiceSurveyFormEventImpl>
      get copyWith => __$$ServiceSurveyFormEventImplCopyWithImpl<
          _$ServiceSurveyFormEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ServiceModel serviceModel) create,
    required TResult Function(ServiceModel serviceModel) update,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multiSurveyFormChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
    required TResult Function(ServiceModel draftService) draftService,
    required TResult Function() clearDrafts,
  }) {
    return multiSurveyFormChanged(value, submitTriggered);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceModel serviceModel)? update,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
    TResult? Function(ServiceModel draftService)? draftService,
    TResult? Function()? clearDrafts,
  }) {
    return multiSurveyFormChanged?.call(value, submitTriggered);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceModel serviceModel)? update,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    TResult Function(ServiceModel draftService)? draftService,
    TResult Function()? clearDrafts,
    required TResult orElse(),
  }) {
    if (multiSurveyFormChanged != null) {
      return multiSurveyFormChanged(value, submitTriggered);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceCreateEvent value) create,
    required TResult Function(ServiceUpdateEvent value) update,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceSurveyFormEvent value)
        multiSurveyFormChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
    required TResult Function(ServiceDraftEvent value) draftService,
    required TResult Function(ServiceClearDraftsEvent value) clearDrafts,
  }) {
    return multiSurveyFormChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceUpdateEvent value)? update,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
    TResult? Function(ServiceDraftEvent value)? draftService,
    TResult? Function(ServiceClearDraftsEvent value)? clearDrafts,
  }) {
    return multiSurveyFormChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceUpdateEvent value)? update,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    TResult Function(ServiceDraftEvent value)? draftService,
    TResult Function(ServiceClearDraftsEvent value)? clearDrafts,
    required TResult orElse(),
  }) {
    if (multiSurveyFormChanged != null) {
      return multiSurveyFormChanged(this);
    }
    return orElse();
  }
}

abstract class ServiceSurveyFormEvent implements ServiceEvent {
  const factory ServiceSurveyFormEvent(
      {required final String value,
      required final bool submitTriggered}) = _$ServiceSurveyFormEventImpl;

  String get value;
  bool get submitTriggered;
  @JsonKey(ignore: true)
  _$$ServiceSurveyFormEventImplCopyWith<_$ServiceSurveyFormEventImpl>
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
    required TResult Function(ServiceModel serviceModel) update,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multiSurveyFormChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
    required TResult Function(ServiceModel draftService) draftService,
    required TResult Function() clearDrafts,
  }) {
    return selectService(service);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceModel serviceModel)? update,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
    TResult? Function(ServiceModel draftService)? draftService,
    TResult? Function()? clearDrafts,
  }) {
    return selectService?.call(service);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceModel serviceModel)? update,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    TResult Function(ServiceModel draftService)? draftService,
    TResult Function()? clearDrafts,
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
    required TResult Function(ServiceUpdateEvent value) update,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceSurveyFormEvent value)
        multiSurveyFormChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
    required TResult Function(ServiceDraftEvent value) draftService,
    required TResult Function(ServiceClearDraftsEvent value) clearDrafts,
  }) {
    return selectService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceUpdateEvent value)? update,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
    TResult? Function(ServiceDraftEvent value)? draftService,
    TResult? Function(ServiceClearDraftsEvent value)? clearDrafts,
  }) {
    return selectService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceUpdateEvent value)? update,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    TResult Function(ServiceDraftEvent value)? draftService,
    TResult Function(ServiceClearDraftsEvent value)? clearDrafts,
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
    required TResult Function(ServiceModel serviceModel) update,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multiSurveyFormChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
    required TResult Function(ServiceModel draftService) draftService,
    required TResult Function() clearDrafts,
  }) {
    return resetSelected(serviceList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceModel serviceModel)? update,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
    TResult? Function(ServiceModel draftService)? draftService,
    TResult? Function()? clearDrafts,
  }) {
    return resetSelected?.call(serviceList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceModel serviceModel)? update,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    TResult Function(ServiceModel draftService)? draftService,
    TResult Function()? clearDrafts,
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
    required TResult Function(ServiceUpdateEvent value) update,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceSurveyFormEvent value)
        multiSurveyFormChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
    required TResult Function(ServiceDraftEvent value) draftService,
    required TResult Function(ServiceClearDraftsEvent value) clearDrafts,
  }) {
    return resetSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceUpdateEvent value)? update,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
    TResult? Function(ServiceDraftEvent value)? draftService,
    TResult? Function(ServiceClearDraftsEvent value)? clearDrafts,
  }) {
    return resetSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceUpdateEvent value)? update,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    TResult Function(ServiceDraftEvent value)? draftService,
    TResult Function(ServiceClearDraftsEvent value)? clearDrafts,
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
abstract class _$$ServiceDraftEventImplCopyWith<$Res> {
  factory _$$ServiceDraftEventImplCopyWith(_$ServiceDraftEventImpl value,
          $Res Function(_$ServiceDraftEventImpl) then) =
      __$$ServiceDraftEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ServiceModel draftService});
}

/// @nodoc
class __$$ServiceDraftEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$ServiceDraftEventImpl>
    implements _$$ServiceDraftEventImplCopyWith<$Res> {
  __$$ServiceDraftEventImplCopyWithImpl(_$ServiceDraftEventImpl _value,
      $Res Function(_$ServiceDraftEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draftService = null,
  }) {
    return _then(_$ServiceDraftEventImpl(
      draftService: null == draftService
          ? _value.draftService
          : draftService // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
    ));
  }
}

/// @nodoc

class _$ServiceDraftEventImpl implements ServiceDraftEvent {
  const _$ServiceDraftEventImpl({required this.draftService});

  @override
  final ServiceModel draftService;

  @override
  String toString() {
    return 'ServiceEvent.draftService(draftService: $draftService)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceDraftEventImpl &&
            (identical(other.draftService, draftService) ||
                other.draftService == draftService));
  }

  @override
  int get hashCode => Object.hash(runtimeType, draftService);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceDraftEventImplCopyWith<_$ServiceDraftEventImpl> get copyWith =>
      __$$ServiceDraftEventImplCopyWithImpl<_$ServiceDraftEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ServiceModel serviceModel) create,
    required TResult Function(ServiceModel serviceModel) update,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multiSurveyFormChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
    required TResult Function(ServiceModel draftService) draftService,
    required TResult Function() clearDrafts,
  }) {
    return draftService(this.draftService);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceModel serviceModel)? update,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
    TResult? Function(ServiceModel draftService)? draftService,
    TResult? Function()? clearDrafts,
  }) {
    return draftService?.call(this.draftService);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceModel serviceModel)? update,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    TResult Function(ServiceModel draftService)? draftService,
    TResult Function()? clearDrafts,
    required TResult orElse(),
  }) {
    if (draftService != null) {
      return draftService(this.draftService);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceCreateEvent value) create,
    required TResult Function(ServiceUpdateEvent value) update,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceSurveyFormEvent value)
        multiSurveyFormChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
    required TResult Function(ServiceDraftEvent value) draftService,
    required TResult Function(ServiceClearDraftsEvent value) clearDrafts,
  }) {
    return draftService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceUpdateEvent value)? update,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
    TResult? Function(ServiceDraftEvent value)? draftService,
    TResult? Function(ServiceClearDraftsEvent value)? clearDrafts,
  }) {
    return draftService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceUpdateEvent value)? update,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    TResult Function(ServiceDraftEvent value)? draftService,
    TResult Function(ServiceClearDraftsEvent value)? clearDrafts,
    required TResult orElse(),
  }) {
    if (draftService != null) {
      return draftService(this);
    }
    return orElse();
  }
}

abstract class ServiceDraftEvent implements ServiceEvent {
  const factory ServiceDraftEvent({required final ServiceModel draftService}) =
      _$ServiceDraftEventImpl;

  ServiceModel get draftService;
  @JsonKey(ignore: true)
  _$$ServiceDraftEventImplCopyWith<_$ServiceDraftEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceClearDraftsEventImplCopyWith<$Res> {
  factory _$$ServiceClearDraftsEventImplCopyWith(
          _$ServiceClearDraftsEventImpl value,
          $Res Function(_$ServiceClearDraftsEventImpl) then) =
      __$$ServiceClearDraftsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServiceClearDraftsEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$ServiceClearDraftsEventImpl>
    implements _$$ServiceClearDraftsEventImplCopyWith<$Res> {
  __$$ServiceClearDraftsEventImplCopyWithImpl(
      _$ServiceClearDraftsEventImpl _value,
      $Res Function(_$ServiceClearDraftsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServiceClearDraftsEventImpl implements ServiceClearDraftsEvent {
  const _$ServiceClearDraftsEventImpl();

  @override
  String toString() {
    return 'ServiceEvent.clearDrafts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceClearDraftsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ServiceModel serviceModel) create,
    required TResult Function(ServiceModel serviceModel) update,
    required TResult Function(ServiceSearchModel serviceSearchModel) search,
    required TResult Function(String value, bool submitTriggered)
        multiSurveyFormChanged,
    required TResult Function(ServiceModel service) selectService,
    required TResult Function(List<ServiceModel> serviceList) resetSelected,
    required TResult Function(ServiceModel draftService) draftService,
    required TResult Function() clearDrafts,
  }) {
    return clearDrafts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ServiceModel serviceModel)? create,
    TResult? Function(ServiceModel serviceModel)? update,
    TResult? Function(ServiceSearchModel serviceSearchModel)? search,
    TResult? Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel service)? selectService,
    TResult? Function(List<ServiceModel> serviceList)? resetSelected,
    TResult? Function(ServiceModel draftService)? draftService,
    TResult? Function()? clearDrafts,
  }) {
    return clearDrafts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ServiceModel serviceModel)? create,
    TResult Function(ServiceModel serviceModel)? update,
    TResult Function(ServiceSearchModel serviceSearchModel)? search,
    TResult Function(String value, bool submitTriggered)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel service)? selectService,
    TResult Function(List<ServiceModel> serviceList)? resetSelected,
    TResult Function(ServiceModel draftService)? draftService,
    TResult Function()? clearDrafts,
    required TResult orElse(),
  }) {
    if (clearDrafts != null) {
      return clearDrafts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceCreateEvent value) create,
    required TResult Function(ServiceUpdateEvent value) update,
    required TResult Function(ServiceSearchEvent value) search,
    required TResult Function(ServiceSurveyFormEvent value)
        multiSurveyFormChanged,
    required TResult Function(ServiceSelectionEvent value) selectService,
    required TResult Function(ServiceResetEvent value) resetSelected,
    required TResult Function(ServiceDraftEvent value) draftService,
    required TResult Function(ServiceClearDraftsEvent value) clearDrafts,
  }) {
    return clearDrafts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceCreateEvent value)? create,
    TResult? Function(ServiceUpdateEvent value)? update,
    TResult? Function(ServiceSearchEvent value)? search,
    TResult? Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult? Function(ServiceSelectionEvent value)? selectService,
    TResult? Function(ServiceResetEvent value)? resetSelected,
    TResult? Function(ServiceDraftEvent value)? draftService,
    TResult? Function(ServiceClearDraftsEvent value)? clearDrafts,
  }) {
    return clearDrafts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceCreateEvent value)? create,
    TResult Function(ServiceUpdateEvent value)? update,
    TResult Function(ServiceSearchEvent value)? search,
    TResult Function(ServiceSurveyFormEvent value)? multiSurveyFormChanged,
    TResult Function(ServiceSelectionEvent value)? selectService,
    TResult Function(ServiceResetEvent value)? resetSelected,
    TResult Function(ServiceDraftEvent value)? draftService,
    TResult Function(ServiceClearDraftsEvent value)? clearDrafts,
    required TResult orElse(),
  }) {
    if (clearDrafts != null) {
      return clearDrafts(this);
    }
    return orElse();
  }
}

abstract class ServiceClearDraftsEvent implements ServiceEvent {
  const factory ServiceClearDraftsEvent() = _$ServiceClearDraftsEventImpl;
}

/// @nodoc
mixin _$ServiceState {
  List<ServiceModel> get drafts => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ServiceModel> drafts) empty,
    required TResult Function(List<ServiceModel> drafts) isloading,
    required TResult Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)
        multiSurveyFormChanged,
    required TResult Function(
            ServiceModel serviceList,
            ServiceModel? selectedService,
            bool loading,
            bool isEditing,
            List<ServiceModel> drafts)
        serviceCreate,
    required TResult Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)
        serviceSearch,
    required TResult Function(List<ServiceModel> drafts) serviceDraft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ServiceModel> drafts)? empty,
    TResult? Function(List<ServiceModel> drafts)? isloading,
    TResult? Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing, List<ServiceModel> drafts)?
        serviceCreate,
    TResult? Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)?
        serviceSearch,
    TResult? Function(List<ServiceModel> drafts)? serviceDraft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ServiceModel> drafts)? empty,
    TResult Function(List<ServiceModel> drafts)? isloading,
    TResult Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing, List<ServiceModel> drafts)?
        serviceCreate,
    TResult Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)?
        serviceSearch,
    TResult Function(List<ServiceModel> drafts)? serviceDraft,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceEmptyState value) empty,
    required TResult Function(ServiceIsloadingState value) isloading,
    required TResult Function(ServiceMultiSurveyFormChangedState value)
        multiSurveyFormChanged,
    required TResult Function(ServiceCreateState value) serviceCreate,
    required TResult Function(ServiceSearchState value) serviceSearch,
    required TResult Function(ServiceDraftState value) serviceDraft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEmptyState value)? empty,
    TResult? Function(ServiceIsloadingState value)? isloading,
    TResult? Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult? Function(ServiceCreateState value)? serviceCreate,
    TResult? Function(ServiceSearchState value)? serviceSearch,
    TResult? Function(ServiceDraftState value)? serviceDraft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEmptyState value)? empty,
    TResult Function(ServiceIsloadingState value)? isloading,
    TResult Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult Function(ServiceCreateState value)? serviceCreate,
    TResult Function(ServiceSearchState value)? serviceSearch,
    TResult Function(ServiceDraftState value)? serviceDraft,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceStateCopyWith<ServiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceStateCopyWith<$Res> {
  factory $ServiceStateCopyWith(
          ServiceState value, $Res Function(ServiceState) then) =
      _$ServiceStateCopyWithImpl<$Res, ServiceState>;
  @useResult
  $Res call({List<ServiceModel> drafts});
}

/// @nodoc
class _$ServiceStateCopyWithImpl<$Res, $Val extends ServiceState>
    implements $ServiceStateCopyWith<$Res> {
  _$ServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drafts = null,
  }) {
    return _then(_value.copyWith(
      drafts: null == drafts
          ? _value.drafts
          : drafts // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceEmptyStateImplCopyWith<$Res>
    implements $ServiceStateCopyWith<$Res> {
  factory _$$ServiceEmptyStateImplCopyWith(_$ServiceEmptyStateImpl value,
          $Res Function(_$ServiceEmptyStateImpl) then) =
      __$$ServiceEmptyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ServiceModel> drafts});
}

/// @nodoc
class __$$ServiceEmptyStateImplCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceEmptyStateImpl>
    implements _$$ServiceEmptyStateImplCopyWith<$Res> {
  __$$ServiceEmptyStateImplCopyWithImpl(_$ServiceEmptyStateImpl _value,
      $Res Function(_$ServiceEmptyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drafts = null,
  }) {
    return _then(_$ServiceEmptyStateImpl(
      drafts: null == drafts
          ? _value._drafts
          : drafts // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
    ));
  }
}

/// @nodoc

class _$ServiceEmptyStateImpl implements ServiceEmptyState {
  const _$ServiceEmptyStateImpl({final List<ServiceModel> drafts = const []})
      : _drafts = drafts;

  final List<ServiceModel> _drafts;
  @override
  @JsonKey()
  List<ServiceModel> get drafts {
    if (_drafts is EqualUnmodifiableListView) return _drafts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drafts);
  }

  @override
  String toString() {
    return 'ServiceState.empty(drafts: $drafts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceEmptyStateImpl &&
            const DeepCollectionEquality().equals(other._drafts, _drafts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_drafts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceEmptyStateImplCopyWith<_$ServiceEmptyStateImpl> get copyWith =>
      __$$ServiceEmptyStateImplCopyWithImpl<_$ServiceEmptyStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ServiceModel> drafts) empty,
    required TResult Function(List<ServiceModel> drafts) isloading,
    required TResult Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)
        multiSurveyFormChanged,
    required TResult Function(
            ServiceModel serviceList,
            ServiceModel? selectedService,
            bool loading,
            bool isEditing,
            List<ServiceModel> drafts)
        serviceCreate,
    required TResult Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)
        serviceSearch,
    required TResult Function(List<ServiceModel> drafts) serviceDraft,
  }) {
    return empty(drafts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ServiceModel> drafts)? empty,
    TResult? Function(List<ServiceModel> drafts)? isloading,
    TResult? Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing, List<ServiceModel> drafts)?
        serviceCreate,
    TResult? Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)?
        serviceSearch,
    TResult? Function(List<ServiceModel> drafts)? serviceDraft,
  }) {
    return empty?.call(drafts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ServiceModel> drafts)? empty,
    TResult Function(List<ServiceModel> drafts)? isloading,
    TResult Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing, List<ServiceModel> drafts)?
        serviceCreate,
    TResult Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)?
        serviceSearch,
    TResult Function(List<ServiceModel> drafts)? serviceDraft,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(drafts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceEmptyState value) empty,
    required TResult Function(ServiceIsloadingState value) isloading,
    required TResult Function(ServiceMultiSurveyFormChangedState value)
        multiSurveyFormChanged,
    required TResult Function(ServiceCreateState value) serviceCreate,
    required TResult Function(ServiceSearchState value) serviceSearch,
    required TResult Function(ServiceDraftState value) serviceDraft,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEmptyState value)? empty,
    TResult? Function(ServiceIsloadingState value)? isloading,
    TResult? Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult? Function(ServiceCreateState value)? serviceCreate,
    TResult? Function(ServiceSearchState value)? serviceSearch,
    TResult? Function(ServiceDraftState value)? serviceDraft,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEmptyState value)? empty,
    TResult Function(ServiceIsloadingState value)? isloading,
    TResult Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult Function(ServiceCreateState value)? serviceCreate,
    TResult Function(ServiceSearchState value)? serviceSearch,
    TResult Function(ServiceDraftState value)? serviceDraft,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class ServiceEmptyState implements ServiceState {
  const factory ServiceEmptyState({final List<ServiceModel> drafts}) =
      _$ServiceEmptyStateImpl;

  @override
  List<ServiceModel> get drafts;
  @override
  @JsonKey(ignore: true)
  _$$ServiceEmptyStateImplCopyWith<_$ServiceEmptyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceIsloadingStateImplCopyWith<$Res>
    implements $ServiceStateCopyWith<$Res> {
  factory _$$ServiceIsloadingStateImplCopyWith(
          _$ServiceIsloadingStateImpl value,
          $Res Function(_$ServiceIsloadingStateImpl) then) =
      __$$ServiceIsloadingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ServiceModel> drafts});
}

/// @nodoc
class __$$ServiceIsloadingStateImplCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceIsloadingStateImpl>
    implements _$$ServiceIsloadingStateImplCopyWith<$Res> {
  __$$ServiceIsloadingStateImplCopyWithImpl(_$ServiceIsloadingStateImpl _value,
      $Res Function(_$ServiceIsloadingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drafts = null,
  }) {
    return _then(_$ServiceIsloadingStateImpl(
      drafts: null == drafts
          ? _value._drafts
          : drafts // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
    ));
  }
}

/// @nodoc

class _$ServiceIsloadingStateImpl implements ServiceIsloadingState {
  const _$ServiceIsloadingStateImpl(
      {final List<ServiceModel> drafts = const []})
      : _drafts = drafts;

  final List<ServiceModel> _drafts;
  @override
  @JsonKey()
  List<ServiceModel> get drafts {
    if (_drafts is EqualUnmodifiableListView) return _drafts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drafts);
  }

  @override
  String toString() {
    return 'ServiceState.isloading(drafts: $drafts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceIsloadingStateImpl &&
            const DeepCollectionEquality().equals(other._drafts, _drafts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_drafts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceIsloadingStateImplCopyWith<_$ServiceIsloadingStateImpl>
      get copyWith => __$$ServiceIsloadingStateImplCopyWithImpl<
          _$ServiceIsloadingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ServiceModel> drafts) empty,
    required TResult Function(List<ServiceModel> drafts) isloading,
    required TResult Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)
        multiSurveyFormChanged,
    required TResult Function(
            ServiceModel serviceList,
            ServiceModel? selectedService,
            bool loading,
            bool isEditing,
            List<ServiceModel> drafts)
        serviceCreate,
    required TResult Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)
        serviceSearch,
    required TResult Function(List<ServiceModel> drafts) serviceDraft,
  }) {
    return isloading(drafts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ServiceModel> drafts)? empty,
    TResult? Function(List<ServiceModel> drafts)? isloading,
    TResult? Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing, List<ServiceModel> drafts)?
        serviceCreate,
    TResult? Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)?
        serviceSearch,
    TResult? Function(List<ServiceModel> drafts)? serviceDraft,
  }) {
    return isloading?.call(drafts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ServiceModel> drafts)? empty,
    TResult Function(List<ServiceModel> drafts)? isloading,
    TResult Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing, List<ServiceModel> drafts)?
        serviceCreate,
    TResult Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)?
        serviceSearch,
    TResult Function(List<ServiceModel> drafts)? serviceDraft,
    required TResult orElse(),
  }) {
    if (isloading != null) {
      return isloading(drafts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceEmptyState value) empty,
    required TResult Function(ServiceIsloadingState value) isloading,
    required TResult Function(ServiceMultiSurveyFormChangedState value)
        multiSurveyFormChanged,
    required TResult Function(ServiceCreateState value) serviceCreate,
    required TResult Function(ServiceSearchState value) serviceSearch,
    required TResult Function(ServiceDraftState value) serviceDraft,
  }) {
    return isloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEmptyState value)? empty,
    TResult? Function(ServiceIsloadingState value)? isloading,
    TResult? Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult? Function(ServiceCreateState value)? serviceCreate,
    TResult? Function(ServiceSearchState value)? serviceSearch,
    TResult? Function(ServiceDraftState value)? serviceDraft,
  }) {
    return isloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEmptyState value)? empty,
    TResult Function(ServiceIsloadingState value)? isloading,
    TResult Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult Function(ServiceCreateState value)? serviceCreate,
    TResult Function(ServiceSearchState value)? serviceSearch,
    TResult Function(ServiceDraftState value)? serviceDraft,
    required TResult orElse(),
  }) {
    if (isloading != null) {
      return isloading(this);
    }
    return orElse();
  }
}

abstract class ServiceIsloadingState implements ServiceState {
  const factory ServiceIsloadingState({final List<ServiceModel> drafts}) =
      _$ServiceIsloadingStateImpl;

  @override
  List<ServiceModel> get drafts;
  @override
  @JsonKey(ignore: true)
  _$$ServiceIsloadingStateImplCopyWith<_$ServiceIsloadingStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceMultiSurveyFormChangedStateImplCopyWith<$Res>
    implements $ServiceStateCopyWith<$Res> {
  factory _$$ServiceMultiSurveyFormChangedStateImplCopyWith(
          _$ServiceMultiSurveyFormChangedStateImpl value,
          $Res Function(_$ServiceMultiSurveyFormChangedStateImpl) then) =
      __$$ServiceMultiSurveyFormChangedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, bool submitTriggered, List<ServiceModel> drafts});
}

/// @nodoc
class __$$ServiceMultiSurveyFormChangedStateImplCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res,
        _$ServiceMultiSurveyFormChangedStateImpl>
    implements _$$ServiceMultiSurveyFormChangedStateImplCopyWith<$Res> {
  __$$ServiceMultiSurveyFormChangedStateImplCopyWithImpl(
      _$ServiceMultiSurveyFormChangedStateImpl _value,
      $Res Function(_$ServiceMultiSurveyFormChangedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? submitTriggered = null,
    Object? drafts = null,
  }) {
    return _then(_$ServiceMultiSurveyFormChangedStateImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      submitTriggered: null == submitTriggered
          ? _value.submitTriggered
          : submitTriggered // ignore: cast_nullable_to_non_nullable
              as bool,
      drafts: null == drafts
          ? _value._drafts
          : drafts // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
    ));
  }
}

/// @nodoc

class _$ServiceMultiSurveyFormChangedStateImpl
    implements ServiceMultiSurveyFormChangedState {
  const _$ServiceMultiSurveyFormChangedStateImpl(
      {this.value = '',
      this.submitTriggered = false,
      final List<ServiceModel> drafts = const []})
      : _drafts = drafts;

  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final bool submitTriggered;
  final List<ServiceModel> _drafts;
  @override
  @JsonKey()
  List<ServiceModel> get drafts {
    if (_drafts is EqualUnmodifiableListView) return _drafts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drafts);
  }

  @override
  String toString() {
    return 'ServiceState.multiSurveyFormChanged(value: $value, submitTriggered: $submitTriggered, drafts: $drafts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceMultiSurveyFormChangedStateImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.submitTriggered, submitTriggered) ||
                other.submitTriggered == submitTriggered) &&
            const DeepCollectionEquality().equals(other._drafts, _drafts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, submitTriggered,
      const DeepCollectionEquality().hash(_drafts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceMultiSurveyFormChangedStateImplCopyWith<
          _$ServiceMultiSurveyFormChangedStateImpl>
      get copyWith => __$$ServiceMultiSurveyFormChangedStateImplCopyWithImpl<
          _$ServiceMultiSurveyFormChangedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ServiceModel> drafts) empty,
    required TResult Function(List<ServiceModel> drafts) isloading,
    required TResult Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)
        multiSurveyFormChanged,
    required TResult Function(
            ServiceModel serviceList,
            ServiceModel? selectedService,
            bool loading,
            bool isEditing,
            List<ServiceModel> drafts)
        serviceCreate,
    required TResult Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)
        serviceSearch,
    required TResult Function(List<ServiceModel> drafts) serviceDraft,
  }) {
    return multiSurveyFormChanged(value, submitTriggered, drafts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ServiceModel> drafts)? empty,
    TResult? Function(List<ServiceModel> drafts)? isloading,
    TResult? Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing, List<ServiceModel> drafts)?
        serviceCreate,
    TResult? Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)?
        serviceSearch,
    TResult? Function(List<ServiceModel> drafts)? serviceDraft,
  }) {
    return multiSurveyFormChanged?.call(value, submitTriggered, drafts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ServiceModel> drafts)? empty,
    TResult Function(List<ServiceModel> drafts)? isloading,
    TResult Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing, List<ServiceModel> drafts)?
        serviceCreate,
    TResult Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)?
        serviceSearch,
    TResult Function(List<ServiceModel> drafts)? serviceDraft,
    required TResult orElse(),
  }) {
    if (multiSurveyFormChanged != null) {
      return multiSurveyFormChanged(value, submitTriggered, drafts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceEmptyState value) empty,
    required TResult Function(ServiceIsloadingState value) isloading,
    required TResult Function(ServiceMultiSurveyFormChangedState value)
        multiSurveyFormChanged,
    required TResult Function(ServiceCreateState value) serviceCreate,
    required TResult Function(ServiceSearchState value) serviceSearch,
    required TResult Function(ServiceDraftState value) serviceDraft,
  }) {
    return multiSurveyFormChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEmptyState value)? empty,
    TResult? Function(ServiceIsloadingState value)? isloading,
    TResult? Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult? Function(ServiceCreateState value)? serviceCreate,
    TResult? Function(ServiceSearchState value)? serviceSearch,
    TResult? Function(ServiceDraftState value)? serviceDraft,
  }) {
    return multiSurveyFormChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEmptyState value)? empty,
    TResult Function(ServiceIsloadingState value)? isloading,
    TResult Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult Function(ServiceCreateState value)? serviceCreate,
    TResult Function(ServiceSearchState value)? serviceSearch,
    TResult Function(ServiceDraftState value)? serviceDraft,
    required TResult orElse(),
  }) {
    if (multiSurveyFormChanged != null) {
      return multiSurveyFormChanged(this);
    }
    return orElse();
  }
}

abstract class ServiceMultiSurveyFormChangedState implements ServiceState {
  const factory ServiceMultiSurveyFormChangedState(
          {final String value,
          final bool submitTriggered,
          final List<ServiceModel> drafts}) =
      _$ServiceMultiSurveyFormChangedStateImpl;

  String get value;
  bool get submitTriggered;
  @override
  List<ServiceModel> get drafts;
  @override
  @JsonKey(ignore: true)
  _$$ServiceMultiSurveyFormChangedStateImplCopyWith<
          _$ServiceMultiSurveyFormChangedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceCreateStateImplCopyWith<$Res>
    implements $ServiceStateCopyWith<$Res> {
  factory _$$ServiceCreateStateImplCopyWith(_$ServiceCreateStateImpl value,
          $Res Function(_$ServiceCreateStateImpl) then) =
      __$$ServiceCreateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ServiceModel serviceList,
      ServiceModel? selectedService,
      bool loading,
      bool isEditing,
      List<ServiceModel> drafts});
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
    Object? drafts = null,
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
      drafts: null == drafts
          ? _value._drafts
          : drafts // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
    ));
  }
}

/// @nodoc

class _$ServiceCreateStateImpl implements ServiceCreateState {
  const _$ServiceCreateStateImpl(
      {required this.serviceList,
      this.selectedService,
      this.loading = false,
      this.isEditing = false,
      final List<ServiceModel> drafts = const []})
      : _drafts = drafts;

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
  final List<ServiceModel> _drafts;
  @override
  @JsonKey()
  List<ServiceModel> get drafts {
    if (_drafts is EqualUnmodifiableListView) return _drafts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drafts);
  }

  @override
  String toString() {
    return 'ServiceState.serviceCreate(serviceList: $serviceList, selectedService: $selectedService, loading: $loading, isEditing: $isEditing, drafts: $drafts)';
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
                other.isEditing == isEditing) &&
            const DeepCollectionEquality().equals(other._drafts, _drafts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceList, selectedService,
      loading, isEditing, const DeepCollectionEquality().hash(_drafts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceCreateStateImplCopyWith<_$ServiceCreateStateImpl> get copyWith =>
      __$$ServiceCreateStateImplCopyWithImpl<_$ServiceCreateStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ServiceModel> drafts) empty,
    required TResult Function(List<ServiceModel> drafts) isloading,
    required TResult Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)
        multiSurveyFormChanged,
    required TResult Function(
            ServiceModel serviceList,
            ServiceModel? selectedService,
            bool loading,
            bool isEditing,
            List<ServiceModel> drafts)
        serviceCreate,
    required TResult Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)
        serviceSearch,
    required TResult Function(List<ServiceModel> drafts) serviceDraft,
  }) {
    return serviceCreate(
        serviceList, selectedService, loading, isEditing, drafts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ServiceModel> drafts)? empty,
    TResult? Function(List<ServiceModel> drafts)? isloading,
    TResult? Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing, List<ServiceModel> drafts)?
        serviceCreate,
    TResult? Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)?
        serviceSearch,
    TResult? Function(List<ServiceModel> drafts)? serviceDraft,
  }) {
    return serviceCreate?.call(
        serviceList, selectedService, loading, isEditing, drafts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ServiceModel> drafts)? empty,
    TResult Function(List<ServiceModel> drafts)? isloading,
    TResult Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing, List<ServiceModel> drafts)?
        serviceCreate,
    TResult Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)?
        serviceSearch,
    TResult Function(List<ServiceModel> drafts)? serviceDraft,
    required TResult orElse(),
  }) {
    if (serviceCreate != null) {
      return serviceCreate(
          serviceList, selectedService, loading, isEditing, drafts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceEmptyState value) empty,
    required TResult Function(ServiceIsloadingState value) isloading,
    required TResult Function(ServiceMultiSurveyFormChangedState value)
        multiSurveyFormChanged,
    required TResult Function(ServiceCreateState value) serviceCreate,
    required TResult Function(ServiceSearchState value) serviceSearch,
    required TResult Function(ServiceDraftState value) serviceDraft,
  }) {
    return serviceCreate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEmptyState value)? empty,
    TResult? Function(ServiceIsloadingState value)? isloading,
    TResult? Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult? Function(ServiceCreateState value)? serviceCreate,
    TResult? Function(ServiceSearchState value)? serviceSearch,
    TResult? Function(ServiceDraftState value)? serviceDraft,
  }) {
    return serviceCreate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEmptyState value)? empty,
    TResult Function(ServiceIsloadingState value)? isloading,
    TResult Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult Function(ServiceCreateState value)? serviceCreate,
    TResult Function(ServiceSearchState value)? serviceSearch,
    TResult Function(ServiceDraftState value)? serviceDraft,
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
      final bool isEditing,
      final List<ServiceModel> drafts}) = _$ServiceCreateStateImpl;

  ServiceModel get serviceList;
  ServiceModel? get selectedService;
  bool get loading;
  bool get isEditing;
  @override
  List<ServiceModel> get drafts;
  @override
  @JsonKey(ignore: true)
  _$$ServiceCreateStateImplCopyWith<_$ServiceCreateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceSearchStateImplCopyWith<$Res>
    implements $ServiceStateCopyWith<$Res> {
  factory _$$ServiceSearchStateImplCopyWith(_$ServiceSearchStateImpl value,
          $Res Function(_$ServiceSearchStateImpl) then) =
      __$$ServiceSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ServiceModel> serviceList,
      ServiceModel? selectedService,
      bool loading,
      List<ServiceModel> drafts});
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
    Object? drafts = null,
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
      drafts: null == drafts
          ? _value._drafts
          : drafts // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
    ));
  }
}

/// @nodoc

class _$ServiceSearchStateImpl implements ServiceSearchState {
  const _$ServiceSearchStateImpl(
      {required final List<ServiceModel> serviceList,
      this.selectedService,
      this.loading = false,
      final List<ServiceModel> drafts = const []})
      : _serviceList = serviceList,
        _drafts = drafts;

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
  final List<ServiceModel> _drafts;
  @override
  @JsonKey()
  List<ServiceModel> get drafts {
    if (_drafts is EqualUnmodifiableListView) return _drafts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drafts);
  }

  @override
  String toString() {
    return 'ServiceState.serviceSearch(serviceList: $serviceList, selectedService: $selectedService, loading: $loading, drafts: $drafts)';
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
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._drafts, _drafts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_serviceList),
      selectedService,
      loading,
      const DeepCollectionEquality().hash(_drafts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceSearchStateImplCopyWith<_$ServiceSearchStateImpl> get copyWith =>
      __$$ServiceSearchStateImplCopyWithImpl<_$ServiceSearchStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ServiceModel> drafts) empty,
    required TResult Function(List<ServiceModel> drafts) isloading,
    required TResult Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)
        multiSurveyFormChanged,
    required TResult Function(
            ServiceModel serviceList,
            ServiceModel? selectedService,
            bool loading,
            bool isEditing,
            List<ServiceModel> drafts)
        serviceCreate,
    required TResult Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)
        serviceSearch,
    required TResult Function(List<ServiceModel> drafts) serviceDraft,
  }) {
    return serviceSearch(serviceList, selectedService, loading, drafts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ServiceModel> drafts)? empty,
    TResult? Function(List<ServiceModel> drafts)? isloading,
    TResult? Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing, List<ServiceModel> drafts)?
        serviceCreate,
    TResult? Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)?
        serviceSearch,
    TResult? Function(List<ServiceModel> drafts)? serviceDraft,
  }) {
    return serviceSearch?.call(serviceList, selectedService, loading, drafts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ServiceModel> drafts)? empty,
    TResult Function(List<ServiceModel> drafts)? isloading,
    TResult Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing, List<ServiceModel> drafts)?
        serviceCreate,
    TResult Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)?
        serviceSearch,
    TResult Function(List<ServiceModel> drafts)? serviceDraft,
    required TResult orElse(),
  }) {
    if (serviceSearch != null) {
      return serviceSearch(serviceList, selectedService, loading, drafts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceEmptyState value) empty,
    required TResult Function(ServiceIsloadingState value) isloading,
    required TResult Function(ServiceMultiSurveyFormChangedState value)
        multiSurveyFormChanged,
    required TResult Function(ServiceCreateState value) serviceCreate,
    required TResult Function(ServiceSearchState value) serviceSearch,
    required TResult Function(ServiceDraftState value) serviceDraft,
  }) {
    return serviceSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEmptyState value)? empty,
    TResult? Function(ServiceIsloadingState value)? isloading,
    TResult? Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult? Function(ServiceCreateState value)? serviceCreate,
    TResult? Function(ServiceSearchState value)? serviceSearch,
    TResult? Function(ServiceDraftState value)? serviceDraft,
  }) {
    return serviceSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEmptyState value)? empty,
    TResult Function(ServiceIsloadingState value)? isloading,
    TResult Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult Function(ServiceCreateState value)? serviceCreate,
    TResult Function(ServiceSearchState value)? serviceSearch,
    TResult Function(ServiceDraftState value)? serviceDraft,
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
      final bool loading,
      final List<ServiceModel> drafts}) = _$ServiceSearchStateImpl;

  List<ServiceModel> get serviceList;
  ServiceModel? get selectedService;
  bool get loading;
  @override
  List<ServiceModel> get drafts;
  @override
  @JsonKey(ignore: true)
  _$$ServiceSearchStateImplCopyWith<_$ServiceSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceDraftStateImplCopyWith<$Res>
    implements $ServiceStateCopyWith<$Res> {
  factory _$$ServiceDraftStateImplCopyWith(_$ServiceDraftStateImpl value,
          $Res Function(_$ServiceDraftStateImpl) then) =
      __$$ServiceDraftStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ServiceModel> drafts});
}

/// @nodoc
class __$$ServiceDraftStateImplCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceDraftStateImpl>
    implements _$$ServiceDraftStateImplCopyWith<$Res> {
  __$$ServiceDraftStateImplCopyWithImpl(_$ServiceDraftStateImpl _value,
      $Res Function(_$ServiceDraftStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drafts = null,
  }) {
    return _then(_$ServiceDraftStateImpl(
      drafts: null == drafts
          ? _value._drafts
          : drafts // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
    ));
  }
}

/// @nodoc

class _$ServiceDraftStateImpl implements ServiceDraftState {
  const _$ServiceDraftStateImpl({required final List<ServiceModel> drafts})
      : _drafts = drafts;

  final List<ServiceModel> _drafts;
  @override
  List<ServiceModel> get drafts {
    if (_drafts is EqualUnmodifiableListView) return _drafts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drafts);
  }

  @override
  String toString() {
    return 'ServiceState.serviceDraft(drafts: $drafts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceDraftStateImpl &&
            const DeepCollectionEquality().equals(other._drafts, _drafts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_drafts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceDraftStateImplCopyWith<_$ServiceDraftStateImpl> get copyWith =>
      __$$ServiceDraftStateImplCopyWithImpl<_$ServiceDraftStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ServiceModel> drafts) empty,
    required TResult Function(List<ServiceModel> drafts) isloading,
    required TResult Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)
        multiSurveyFormChanged,
    required TResult Function(
            ServiceModel serviceList,
            ServiceModel? selectedService,
            bool loading,
            bool isEditing,
            List<ServiceModel> drafts)
        serviceCreate,
    required TResult Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)
        serviceSearch,
    required TResult Function(List<ServiceModel> drafts) serviceDraft,
  }) {
    return serviceDraft(drafts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ServiceModel> drafts)? empty,
    TResult? Function(List<ServiceModel> drafts)? isloading,
    TResult? Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)?
        multiSurveyFormChanged,
    TResult? Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing, List<ServiceModel> drafts)?
        serviceCreate,
    TResult? Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)?
        serviceSearch,
    TResult? Function(List<ServiceModel> drafts)? serviceDraft,
  }) {
    return serviceDraft?.call(drafts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ServiceModel> drafts)? empty,
    TResult Function(List<ServiceModel> drafts)? isloading,
    TResult Function(
            String value, bool submitTriggered, List<ServiceModel> drafts)?
        multiSurveyFormChanged,
    TResult Function(ServiceModel serviceList, ServiceModel? selectedService,
            bool loading, bool isEditing, List<ServiceModel> drafts)?
        serviceCreate,
    TResult Function(
            List<ServiceModel> serviceList,
            ServiceModel? selectedService,
            bool loading,
            List<ServiceModel> drafts)?
        serviceSearch,
    TResult Function(List<ServiceModel> drafts)? serviceDraft,
    required TResult orElse(),
  }) {
    if (serviceDraft != null) {
      return serviceDraft(drafts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceEmptyState value) empty,
    required TResult Function(ServiceIsloadingState value) isloading,
    required TResult Function(ServiceMultiSurveyFormChangedState value)
        multiSurveyFormChanged,
    required TResult Function(ServiceCreateState value) serviceCreate,
    required TResult Function(ServiceSearchState value) serviceSearch,
    required TResult Function(ServiceDraftState value) serviceDraft,
  }) {
    return serviceDraft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServiceEmptyState value)? empty,
    TResult? Function(ServiceIsloadingState value)? isloading,
    TResult? Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult? Function(ServiceCreateState value)? serviceCreate,
    TResult? Function(ServiceSearchState value)? serviceSearch,
    TResult? Function(ServiceDraftState value)? serviceDraft,
  }) {
    return serviceDraft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceEmptyState value)? empty,
    TResult Function(ServiceIsloadingState value)? isloading,
    TResult Function(ServiceMultiSurveyFormChangedState value)?
        multiSurveyFormChanged,
    TResult Function(ServiceCreateState value)? serviceCreate,
    TResult Function(ServiceSearchState value)? serviceSearch,
    TResult Function(ServiceDraftState value)? serviceDraft,
    required TResult orElse(),
  }) {
    if (serviceDraft != null) {
      return serviceDraft(this);
    }
    return orElse();
  }
}

abstract class ServiceDraftState implements ServiceState {
  const factory ServiceDraftState({required final List<ServiceModel> drafts}) =
      _$ServiceDraftStateImpl;

  @override
  List<ServiceModel> get drafts;
  @override
  @JsonKey(ignore: true)
  _$$ServiceDraftStateImplCopyWith<_$ServiceDraftStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

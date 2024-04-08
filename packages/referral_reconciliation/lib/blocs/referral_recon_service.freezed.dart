// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_recon_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReferralReconServiceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReferralReconServiceModel serviceModel) create,
    required TResult Function(
            ReferralReconServiceSearchModel serviceSearchModel)
        search,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ReferralReconServiceModel service) selectService,
    required TResult Function(List<ReferralReconServiceModel> serviceList)
        resetSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceModel serviceModel)? create,
    TResult? Function(ReferralReconServiceSearchModel serviceSearchModel)?
        search,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ReferralReconServiceModel service)? selectService,
    TResult? Function(List<ReferralReconServiceModel> serviceList)?
        resetSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReferralReconServiceModel serviceModel)? create,
    TResult Function(ReferralReconServiceSearchModel serviceSearchModel)?
        search,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ReferralReconServiceModel service)? selectService,
    TResult Function(List<ReferralReconServiceModel> serviceList)?
        resetSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReferralReconServiceCreateEvent value) create,
    required TResult Function(ReferralReconServiceSearchEvent value) search,
    required TResult Function(ReferralReconServiceChecklistEvent value)
        multichecklistChanged,
    required TResult Function(ReferralReconServiceSelectionEvent value)
        selectService,
    required TResult Function(ReferralReconServiceResetEvent value)
        resetSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceCreateEvent value)? create,
    TResult? Function(ReferralReconServiceSearchEvent value)? search,
    TResult? Function(ReferralReconServiceChecklistEvent value)?
        multichecklistChanged,
    TResult? Function(ReferralReconServiceSelectionEvent value)? selectService,
    TResult? Function(ReferralReconServiceResetEvent value)? resetSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceCreateEvent value)? create,
    TResult Function(ReferralReconServiceSearchEvent value)? search,
    TResult Function(ReferralReconServiceChecklistEvent value)?
        multichecklistChanged,
    TResult Function(ReferralReconServiceSelectionEvent value)? selectService,
    TResult Function(ReferralReconServiceResetEvent value)? resetSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralReconServiceEventCopyWith<$Res> {
  factory $ReferralReconServiceEventCopyWith(ReferralReconServiceEvent value,
          $Res Function(ReferralReconServiceEvent) then) =
      _$ReferralReconServiceEventCopyWithImpl<$Res, ReferralReconServiceEvent>;
}

/// @nodoc
class _$ReferralReconServiceEventCopyWithImpl<$Res,
        $Val extends ReferralReconServiceEvent>
    implements $ReferralReconServiceEventCopyWith<$Res> {
  _$ReferralReconServiceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReferralReconServiceCreateEventImplCopyWith<$Res> {
  factory _$$ReferralReconServiceCreateEventImplCopyWith(
          _$ReferralReconServiceCreateEventImpl value,
          $Res Function(_$ReferralReconServiceCreateEventImpl) then) =
      __$$ReferralReconServiceCreateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReferralReconServiceModel serviceModel});
}

/// @nodoc
class __$$ReferralReconServiceCreateEventImplCopyWithImpl<$Res>
    extends _$ReferralReconServiceEventCopyWithImpl<$Res,
        _$ReferralReconServiceCreateEventImpl>
    implements _$$ReferralReconServiceCreateEventImplCopyWith<$Res> {
  __$$ReferralReconServiceCreateEventImplCopyWithImpl(
      _$ReferralReconServiceCreateEventImpl _value,
      $Res Function(_$ReferralReconServiceCreateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceModel = null,
  }) {
    return _then(_$ReferralReconServiceCreateEventImpl(
      serviceModel: null == serviceModel
          ? _value.serviceModel
          : serviceModel // ignore: cast_nullable_to_non_nullable
              as ReferralReconServiceModel,
    ));
  }
}

/// @nodoc

class _$ReferralReconServiceCreateEventImpl
    implements ReferralReconServiceCreateEvent {
  const _$ReferralReconServiceCreateEventImpl({required this.serviceModel});

  @override
  final ReferralReconServiceModel serviceModel;

  @override
  String toString() {
    return 'ReferralReconServiceEvent.create(serviceModel: $serviceModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReconServiceCreateEventImpl &&
            (identical(other.serviceModel, serviceModel) ||
                other.serviceModel == serviceModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralReconServiceCreateEventImplCopyWith<
          _$ReferralReconServiceCreateEventImpl>
      get copyWith => __$$ReferralReconServiceCreateEventImplCopyWithImpl<
          _$ReferralReconServiceCreateEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReferralReconServiceModel serviceModel) create,
    required TResult Function(
            ReferralReconServiceSearchModel serviceSearchModel)
        search,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ReferralReconServiceModel service) selectService,
    required TResult Function(List<ReferralReconServiceModel> serviceList)
        resetSelected,
  }) {
    return create(serviceModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceModel serviceModel)? create,
    TResult? Function(ReferralReconServiceSearchModel serviceSearchModel)?
        search,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ReferralReconServiceModel service)? selectService,
    TResult? Function(List<ReferralReconServiceModel> serviceList)?
        resetSelected,
  }) {
    return create?.call(serviceModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReferralReconServiceModel serviceModel)? create,
    TResult Function(ReferralReconServiceSearchModel serviceSearchModel)?
        search,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ReferralReconServiceModel service)? selectService,
    TResult Function(List<ReferralReconServiceModel> serviceList)?
        resetSelected,
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
    required TResult Function(ReferralReconServiceCreateEvent value) create,
    required TResult Function(ReferralReconServiceSearchEvent value) search,
    required TResult Function(ReferralReconServiceChecklistEvent value)
        multichecklistChanged,
    required TResult Function(ReferralReconServiceSelectionEvent value)
        selectService,
    required TResult Function(ReferralReconServiceResetEvent value)
        resetSelected,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceCreateEvent value)? create,
    TResult? Function(ReferralReconServiceSearchEvent value)? search,
    TResult? Function(ReferralReconServiceChecklistEvent value)?
        multichecklistChanged,
    TResult? Function(ReferralReconServiceSelectionEvent value)? selectService,
    TResult? Function(ReferralReconServiceResetEvent value)? resetSelected,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceCreateEvent value)? create,
    TResult Function(ReferralReconServiceSearchEvent value)? search,
    TResult Function(ReferralReconServiceChecklistEvent value)?
        multichecklistChanged,
    TResult Function(ReferralReconServiceSelectionEvent value)? selectService,
    TResult Function(ReferralReconServiceResetEvent value)? resetSelected,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class ReferralReconServiceCreateEvent
    implements ReferralReconServiceEvent {
  const factory ReferralReconServiceCreateEvent(
          {required final ReferralReconServiceModel serviceModel}) =
      _$ReferralReconServiceCreateEventImpl;

  ReferralReconServiceModel get serviceModel;
  @JsonKey(ignore: true)
  _$$ReferralReconServiceCreateEventImplCopyWith<
          _$ReferralReconServiceCreateEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReferralReconServiceSearchEventImplCopyWith<$Res> {
  factory _$$ReferralReconServiceSearchEventImplCopyWith(
          _$ReferralReconServiceSearchEventImpl value,
          $Res Function(_$ReferralReconServiceSearchEventImpl) then) =
      __$$ReferralReconServiceSearchEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReferralReconServiceSearchModel serviceSearchModel});
}

/// @nodoc
class __$$ReferralReconServiceSearchEventImplCopyWithImpl<$Res>
    extends _$ReferralReconServiceEventCopyWithImpl<$Res,
        _$ReferralReconServiceSearchEventImpl>
    implements _$$ReferralReconServiceSearchEventImplCopyWith<$Res> {
  __$$ReferralReconServiceSearchEventImplCopyWithImpl(
      _$ReferralReconServiceSearchEventImpl _value,
      $Res Function(_$ReferralReconServiceSearchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceSearchModel = null,
  }) {
    return _then(_$ReferralReconServiceSearchEventImpl(
      serviceSearchModel: null == serviceSearchModel
          ? _value.serviceSearchModel
          : serviceSearchModel // ignore: cast_nullable_to_non_nullable
              as ReferralReconServiceSearchModel,
    ));
  }
}

/// @nodoc

class _$ReferralReconServiceSearchEventImpl
    implements ReferralReconServiceSearchEvent {
  const _$ReferralReconServiceSearchEventImpl(
      {required this.serviceSearchModel});

  @override
  final ReferralReconServiceSearchModel serviceSearchModel;

  @override
  String toString() {
    return 'ReferralReconServiceEvent.search(serviceSearchModel: $serviceSearchModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReconServiceSearchEventImpl &&
            (identical(other.serviceSearchModel, serviceSearchModel) ||
                other.serviceSearchModel == serviceSearchModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceSearchModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralReconServiceSearchEventImplCopyWith<
          _$ReferralReconServiceSearchEventImpl>
      get copyWith => __$$ReferralReconServiceSearchEventImplCopyWithImpl<
          _$ReferralReconServiceSearchEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReferralReconServiceModel serviceModel) create,
    required TResult Function(
            ReferralReconServiceSearchModel serviceSearchModel)
        search,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ReferralReconServiceModel service) selectService,
    required TResult Function(List<ReferralReconServiceModel> serviceList)
        resetSelected,
  }) {
    return search(serviceSearchModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceModel serviceModel)? create,
    TResult? Function(ReferralReconServiceSearchModel serviceSearchModel)?
        search,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ReferralReconServiceModel service)? selectService,
    TResult? Function(List<ReferralReconServiceModel> serviceList)?
        resetSelected,
  }) {
    return search?.call(serviceSearchModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReferralReconServiceModel serviceModel)? create,
    TResult Function(ReferralReconServiceSearchModel serviceSearchModel)?
        search,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ReferralReconServiceModel service)? selectService,
    TResult Function(List<ReferralReconServiceModel> serviceList)?
        resetSelected,
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
    required TResult Function(ReferralReconServiceCreateEvent value) create,
    required TResult Function(ReferralReconServiceSearchEvent value) search,
    required TResult Function(ReferralReconServiceChecklistEvent value)
        multichecklistChanged,
    required TResult Function(ReferralReconServiceSelectionEvent value)
        selectService,
    required TResult Function(ReferralReconServiceResetEvent value)
        resetSelected,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceCreateEvent value)? create,
    TResult? Function(ReferralReconServiceSearchEvent value)? search,
    TResult? Function(ReferralReconServiceChecklistEvent value)?
        multichecklistChanged,
    TResult? Function(ReferralReconServiceSelectionEvent value)? selectService,
    TResult? Function(ReferralReconServiceResetEvent value)? resetSelected,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceCreateEvent value)? create,
    TResult Function(ReferralReconServiceSearchEvent value)? search,
    TResult Function(ReferralReconServiceChecklistEvent value)?
        multichecklistChanged,
    TResult Function(ReferralReconServiceSelectionEvent value)? selectService,
    TResult Function(ReferralReconServiceResetEvent value)? resetSelected,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class ReferralReconServiceSearchEvent
    implements ReferralReconServiceEvent {
  const factory ReferralReconServiceSearchEvent(
          {required final ReferralReconServiceSearchModel serviceSearchModel}) =
      _$ReferralReconServiceSearchEventImpl;

  ReferralReconServiceSearchModel get serviceSearchModel;
  @JsonKey(ignore: true)
  _$$ReferralReconServiceSearchEventImplCopyWith<
          _$ReferralReconServiceSearchEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReferralReconServiceChecklistEventImplCopyWith<$Res> {
  factory _$$ReferralReconServiceChecklistEventImplCopyWith(
          _$ReferralReconServiceChecklistEventImpl value,
          $Res Function(_$ReferralReconServiceChecklistEventImpl) then) =
      __$$ReferralReconServiceChecklistEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value, bool submitTriggered});
}

/// @nodoc
class __$$ReferralReconServiceChecklistEventImplCopyWithImpl<$Res>
    extends _$ReferralReconServiceEventCopyWithImpl<$Res,
        _$ReferralReconServiceChecklistEventImpl>
    implements _$$ReferralReconServiceChecklistEventImplCopyWith<$Res> {
  __$$ReferralReconServiceChecklistEventImplCopyWithImpl(
      _$ReferralReconServiceChecklistEventImpl _value,
      $Res Function(_$ReferralReconServiceChecklistEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? submitTriggered = null,
  }) {
    return _then(_$ReferralReconServiceChecklistEventImpl(
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

class _$ReferralReconServiceChecklistEventImpl
    implements ReferralReconServiceChecklistEvent {
  const _$ReferralReconServiceChecklistEventImpl(
      {required this.value, required this.submitTriggered});

  @override
  final String value;
  @override
  final bool submitTriggered;

  @override
  String toString() {
    return 'ReferralReconServiceEvent.multichecklistChanged(value: $value, submitTriggered: $submitTriggered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReconServiceChecklistEventImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.submitTriggered, submitTriggered) ||
                other.submitTriggered == submitTriggered));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, submitTriggered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralReconServiceChecklistEventImplCopyWith<
          _$ReferralReconServiceChecklistEventImpl>
      get copyWith => __$$ReferralReconServiceChecklistEventImplCopyWithImpl<
          _$ReferralReconServiceChecklistEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReferralReconServiceModel serviceModel) create,
    required TResult Function(
            ReferralReconServiceSearchModel serviceSearchModel)
        search,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ReferralReconServiceModel service) selectService,
    required TResult Function(List<ReferralReconServiceModel> serviceList)
        resetSelected,
  }) {
    return multichecklistChanged(value, submitTriggered);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceModel serviceModel)? create,
    TResult? Function(ReferralReconServiceSearchModel serviceSearchModel)?
        search,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ReferralReconServiceModel service)? selectService,
    TResult? Function(List<ReferralReconServiceModel> serviceList)?
        resetSelected,
  }) {
    return multichecklistChanged?.call(value, submitTriggered);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReferralReconServiceModel serviceModel)? create,
    TResult Function(ReferralReconServiceSearchModel serviceSearchModel)?
        search,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ReferralReconServiceModel service)? selectService,
    TResult Function(List<ReferralReconServiceModel> serviceList)?
        resetSelected,
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
    required TResult Function(ReferralReconServiceCreateEvent value) create,
    required TResult Function(ReferralReconServiceSearchEvent value) search,
    required TResult Function(ReferralReconServiceChecklistEvent value)
        multichecklistChanged,
    required TResult Function(ReferralReconServiceSelectionEvent value)
        selectService,
    required TResult Function(ReferralReconServiceResetEvent value)
        resetSelected,
  }) {
    return multichecklistChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceCreateEvent value)? create,
    TResult? Function(ReferralReconServiceSearchEvent value)? search,
    TResult? Function(ReferralReconServiceChecklistEvent value)?
        multichecklistChanged,
    TResult? Function(ReferralReconServiceSelectionEvent value)? selectService,
    TResult? Function(ReferralReconServiceResetEvent value)? resetSelected,
  }) {
    return multichecklistChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceCreateEvent value)? create,
    TResult Function(ReferralReconServiceSearchEvent value)? search,
    TResult Function(ReferralReconServiceChecklistEvent value)?
        multichecklistChanged,
    TResult Function(ReferralReconServiceSelectionEvent value)? selectService,
    TResult Function(ReferralReconServiceResetEvent value)? resetSelected,
    required TResult orElse(),
  }) {
    if (multichecklistChanged != null) {
      return multichecklistChanged(this);
    }
    return orElse();
  }
}

abstract class ReferralReconServiceChecklistEvent
    implements ReferralReconServiceEvent {
  const factory ReferralReconServiceChecklistEvent(
          {required final String value, required final bool submitTriggered}) =
      _$ReferralReconServiceChecklistEventImpl;

  String get value;
  bool get submitTriggered;
  @JsonKey(ignore: true)
  _$$ReferralReconServiceChecklistEventImplCopyWith<
          _$ReferralReconServiceChecklistEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReferralReconServiceSelectionEventImplCopyWith<$Res> {
  factory _$$ReferralReconServiceSelectionEventImplCopyWith(
          _$ReferralReconServiceSelectionEventImpl value,
          $Res Function(_$ReferralReconServiceSelectionEventImpl) then) =
      __$$ReferralReconServiceSelectionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReferralReconServiceModel service});
}

/// @nodoc
class __$$ReferralReconServiceSelectionEventImplCopyWithImpl<$Res>
    extends _$ReferralReconServiceEventCopyWithImpl<$Res,
        _$ReferralReconServiceSelectionEventImpl>
    implements _$$ReferralReconServiceSelectionEventImplCopyWith<$Res> {
  __$$ReferralReconServiceSelectionEventImplCopyWithImpl(
      _$ReferralReconServiceSelectionEventImpl _value,
      $Res Function(_$ReferralReconServiceSelectionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
  }) {
    return _then(_$ReferralReconServiceSelectionEventImpl(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ReferralReconServiceModel,
    ));
  }
}

/// @nodoc

class _$ReferralReconServiceSelectionEventImpl
    implements ReferralReconServiceSelectionEvent {
  const _$ReferralReconServiceSelectionEventImpl({required this.service});

  @override
  final ReferralReconServiceModel service;

  @override
  String toString() {
    return 'ReferralReconServiceEvent.selectService(service: $service)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReconServiceSelectionEventImpl &&
            (identical(other.service, service) || other.service == service));
  }

  @override
  int get hashCode => Object.hash(runtimeType, service);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralReconServiceSelectionEventImplCopyWith<
          _$ReferralReconServiceSelectionEventImpl>
      get copyWith => __$$ReferralReconServiceSelectionEventImplCopyWithImpl<
          _$ReferralReconServiceSelectionEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReferralReconServiceModel serviceModel) create,
    required TResult Function(
            ReferralReconServiceSearchModel serviceSearchModel)
        search,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ReferralReconServiceModel service) selectService,
    required TResult Function(List<ReferralReconServiceModel> serviceList)
        resetSelected,
  }) {
    return selectService(service);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceModel serviceModel)? create,
    TResult? Function(ReferralReconServiceSearchModel serviceSearchModel)?
        search,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ReferralReconServiceModel service)? selectService,
    TResult? Function(List<ReferralReconServiceModel> serviceList)?
        resetSelected,
  }) {
    return selectService?.call(service);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReferralReconServiceModel serviceModel)? create,
    TResult Function(ReferralReconServiceSearchModel serviceSearchModel)?
        search,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ReferralReconServiceModel service)? selectService,
    TResult Function(List<ReferralReconServiceModel> serviceList)?
        resetSelected,
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
    required TResult Function(ReferralReconServiceCreateEvent value) create,
    required TResult Function(ReferralReconServiceSearchEvent value) search,
    required TResult Function(ReferralReconServiceChecklistEvent value)
        multichecklistChanged,
    required TResult Function(ReferralReconServiceSelectionEvent value)
        selectService,
    required TResult Function(ReferralReconServiceResetEvent value)
        resetSelected,
  }) {
    return selectService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceCreateEvent value)? create,
    TResult? Function(ReferralReconServiceSearchEvent value)? search,
    TResult? Function(ReferralReconServiceChecklistEvent value)?
        multichecklistChanged,
    TResult? Function(ReferralReconServiceSelectionEvent value)? selectService,
    TResult? Function(ReferralReconServiceResetEvent value)? resetSelected,
  }) {
    return selectService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceCreateEvent value)? create,
    TResult Function(ReferralReconServiceSearchEvent value)? search,
    TResult Function(ReferralReconServiceChecklistEvent value)?
        multichecklistChanged,
    TResult Function(ReferralReconServiceSelectionEvent value)? selectService,
    TResult Function(ReferralReconServiceResetEvent value)? resetSelected,
    required TResult orElse(),
  }) {
    if (selectService != null) {
      return selectService(this);
    }
    return orElse();
  }
}

abstract class ReferralReconServiceSelectionEvent
    implements ReferralReconServiceEvent {
  const factory ReferralReconServiceSelectionEvent(
          {required final ReferralReconServiceModel service}) =
      _$ReferralReconServiceSelectionEventImpl;

  ReferralReconServiceModel get service;
  @JsonKey(ignore: true)
  _$$ReferralReconServiceSelectionEventImplCopyWith<
          _$ReferralReconServiceSelectionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReferralReconServiceResetEventImplCopyWith<$Res> {
  factory _$$ReferralReconServiceResetEventImplCopyWith(
          _$ReferralReconServiceResetEventImpl value,
          $Res Function(_$ReferralReconServiceResetEventImpl) then) =
      __$$ReferralReconServiceResetEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ReferralReconServiceModel> serviceList});
}

/// @nodoc
class __$$ReferralReconServiceResetEventImplCopyWithImpl<$Res>
    extends _$ReferralReconServiceEventCopyWithImpl<$Res,
        _$ReferralReconServiceResetEventImpl>
    implements _$$ReferralReconServiceResetEventImplCopyWith<$Res> {
  __$$ReferralReconServiceResetEventImplCopyWithImpl(
      _$ReferralReconServiceResetEventImpl _value,
      $Res Function(_$ReferralReconServiceResetEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceList = null,
  }) {
    return _then(_$ReferralReconServiceResetEventImpl(
      serviceList: null == serviceList
          ? _value._serviceList
          : serviceList // ignore: cast_nullable_to_non_nullable
              as List<ReferralReconServiceModel>,
    ));
  }
}

/// @nodoc

class _$ReferralReconServiceResetEventImpl
    implements ReferralReconServiceResetEvent {
  const _$ReferralReconServiceResetEventImpl(
      {required final List<ReferralReconServiceModel> serviceList})
      : _serviceList = serviceList;

  final List<ReferralReconServiceModel> _serviceList;
  @override
  List<ReferralReconServiceModel> get serviceList {
    if (_serviceList is EqualUnmodifiableListView) return _serviceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceList);
  }

  @override
  String toString() {
    return 'ReferralReconServiceEvent.resetSelected(serviceList: $serviceList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReconServiceResetEventImpl &&
            const DeepCollectionEquality()
                .equals(other._serviceList, _serviceList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_serviceList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralReconServiceResetEventImplCopyWith<
          _$ReferralReconServiceResetEventImpl>
      get copyWith => __$$ReferralReconServiceResetEventImplCopyWithImpl<
          _$ReferralReconServiceResetEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReferralReconServiceModel serviceModel) create,
    required TResult Function(
            ReferralReconServiceSearchModel serviceSearchModel)
        search,
    required TResult Function(String value, bool submitTriggered)
        multichecklistChanged,
    required TResult Function(ReferralReconServiceModel service) selectService,
    required TResult Function(List<ReferralReconServiceModel> serviceList)
        resetSelected,
  }) {
    return resetSelected(serviceList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceModel serviceModel)? create,
    TResult? Function(ReferralReconServiceSearchModel serviceSearchModel)?
        search,
    TResult? Function(String value, bool submitTriggered)?
        multichecklistChanged,
    TResult? Function(ReferralReconServiceModel service)? selectService,
    TResult? Function(List<ReferralReconServiceModel> serviceList)?
        resetSelected,
  }) {
    return resetSelected?.call(serviceList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReferralReconServiceModel serviceModel)? create,
    TResult Function(ReferralReconServiceSearchModel serviceSearchModel)?
        search,
    TResult Function(String value, bool submitTriggered)? multichecklistChanged,
    TResult Function(ReferralReconServiceModel service)? selectService,
    TResult Function(List<ReferralReconServiceModel> serviceList)?
        resetSelected,
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
    required TResult Function(ReferralReconServiceCreateEvent value) create,
    required TResult Function(ReferralReconServiceSearchEvent value) search,
    required TResult Function(ReferralReconServiceChecklistEvent value)
        multichecklistChanged,
    required TResult Function(ReferralReconServiceSelectionEvent value)
        selectService,
    required TResult Function(ReferralReconServiceResetEvent value)
        resetSelected,
  }) {
    return resetSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceCreateEvent value)? create,
    TResult? Function(ReferralReconServiceSearchEvent value)? search,
    TResult? Function(ReferralReconServiceChecklistEvent value)?
        multichecklistChanged,
    TResult? Function(ReferralReconServiceSelectionEvent value)? selectService,
    TResult? Function(ReferralReconServiceResetEvent value)? resetSelected,
  }) {
    return resetSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceCreateEvent value)? create,
    TResult Function(ReferralReconServiceSearchEvent value)? search,
    TResult Function(ReferralReconServiceChecklistEvent value)?
        multichecklistChanged,
    TResult Function(ReferralReconServiceSelectionEvent value)? selectService,
    TResult Function(ReferralReconServiceResetEvent value)? resetSelected,
    required TResult orElse(),
  }) {
    if (resetSelected != null) {
      return resetSelected(this);
    }
    return orElse();
  }
}

abstract class ReferralReconServiceResetEvent
    implements ReferralReconServiceEvent {
  const factory ReferralReconServiceResetEvent(
          {required final List<ReferralReconServiceModel> serviceList}) =
      _$ReferralReconServiceResetEventImpl;

  List<ReferralReconServiceModel> get serviceList;
  @JsonKey(ignore: true)
  _$$ReferralReconServiceResetEventImplCopyWith<
          _$ReferralReconServiceResetEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReferralReconServiceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isLoading,
    required TResult Function(String value, bool submitTriggered)
        multiCheckListChanged,
    required TResult Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)
        serviceCreate,
    required TResult Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)
        serviceSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isLoading,
    TResult? Function(String value, bool submitTriggered)?
        multiCheckListChanged,
    TResult? Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)?
        serviceCreate,
    TResult? Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)?
        serviceSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isLoading,
    TResult Function(String value, bool submitTriggered)? multiCheckListChanged,
    TResult Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)?
        serviceCreate,
    TResult Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)?
        serviceSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReferralReconServiceEmptyState value) empty,
    required TResult Function(ReferralReconServiceIsloadingState value)
        isLoading,
    required TResult Function(
            ReferralReconServiceMultichecklistChangedState value)
        multiCheckListChanged,
    required TResult Function(ReferralReconServiceCreateState value)
        serviceCreate,
    required TResult Function(ReferralReconServiceSearchState value)
        serviceSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceEmptyState value)? empty,
    TResult? Function(ReferralReconServiceIsloadingState value)? isLoading,
    TResult? Function(ReferralReconServiceMultichecklistChangedState value)?
        multiCheckListChanged,
    TResult? Function(ReferralReconServiceCreateState value)? serviceCreate,
    TResult? Function(ReferralReconServiceSearchState value)? serviceSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceEmptyState value)? empty,
    TResult Function(ReferralReconServiceIsloadingState value)? isLoading,
    TResult Function(ReferralReconServiceMultichecklistChangedState value)?
        multiCheckListChanged,
    TResult Function(ReferralReconServiceCreateState value)? serviceCreate,
    TResult Function(ReferralReconServiceSearchState value)? serviceSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralReconServiceStateCopyWith<$Res> {
  factory $ReferralReconServiceStateCopyWith(ReferralReconServiceState value,
          $Res Function(ReferralReconServiceState) then) =
      _$ReferralReconServiceStateCopyWithImpl<$Res, ReferralReconServiceState>;
}

/// @nodoc
class _$ReferralReconServiceStateCopyWithImpl<$Res,
        $Val extends ReferralReconServiceState>
    implements $ReferralReconServiceStateCopyWith<$Res> {
  _$ReferralReconServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReferralReconServiceEmptyStateImplCopyWith<$Res> {
  factory _$$ReferralReconServiceEmptyStateImplCopyWith(
          _$ReferralReconServiceEmptyStateImpl value,
          $Res Function(_$ReferralReconServiceEmptyStateImpl) then) =
      __$$ReferralReconServiceEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReferralReconServiceEmptyStateImplCopyWithImpl<$Res>
    extends _$ReferralReconServiceStateCopyWithImpl<$Res,
        _$ReferralReconServiceEmptyStateImpl>
    implements _$$ReferralReconServiceEmptyStateImplCopyWith<$Res> {
  __$$ReferralReconServiceEmptyStateImplCopyWithImpl(
      _$ReferralReconServiceEmptyStateImpl _value,
      $Res Function(_$ReferralReconServiceEmptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReferralReconServiceEmptyStateImpl
    implements ReferralReconServiceEmptyState {
  const _$ReferralReconServiceEmptyStateImpl();

  @override
  String toString() {
    return 'ReferralReconServiceState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReconServiceEmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isLoading,
    required TResult Function(String value, bool submitTriggered)
        multiCheckListChanged,
    required TResult Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)
        serviceCreate,
    required TResult Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)
        serviceSearch,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isLoading,
    TResult? Function(String value, bool submitTriggered)?
        multiCheckListChanged,
    TResult? Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)?
        serviceCreate,
    TResult? Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)?
        serviceSearch,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isLoading,
    TResult Function(String value, bool submitTriggered)? multiCheckListChanged,
    TResult Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)?
        serviceCreate,
    TResult Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)?
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
    required TResult Function(ReferralReconServiceEmptyState value) empty,
    required TResult Function(ReferralReconServiceIsloadingState value)
        isLoading,
    required TResult Function(
            ReferralReconServiceMultichecklistChangedState value)
        multiCheckListChanged,
    required TResult Function(ReferralReconServiceCreateState value)
        serviceCreate,
    required TResult Function(ReferralReconServiceSearchState value)
        serviceSearch,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceEmptyState value)? empty,
    TResult? Function(ReferralReconServiceIsloadingState value)? isLoading,
    TResult? Function(ReferralReconServiceMultichecklistChangedState value)?
        multiCheckListChanged,
    TResult? Function(ReferralReconServiceCreateState value)? serviceCreate,
    TResult? Function(ReferralReconServiceSearchState value)? serviceSearch,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceEmptyState value)? empty,
    TResult Function(ReferralReconServiceIsloadingState value)? isLoading,
    TResult Function(ReferralReconServiceMultichecklistChangedState value)?
        multiCheckListChanged,
    TResult Function(ReferralReconServiceCreateState value)? serviceCreate,
    TResult Function(ReferralReconServiceSearchState value)? serviceSearch,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class ReferralReconServiceEmptyState
    implements ReferralReconServiceState {
  const factory ReferralReconServiceEmptyState() =
      _$ReferralReconServiceEmptyStateImpl;
}

/// @nodoc
abstract class _$$ReferralReconServiceIsloadingStateImplCopyWith<$Res> {
  factory _$$ReferralReconServiceIsloadingStateImplCopyWith(
          _$ReferralReconServiceIsloadingStateImpl value,
          $Res Function(_$ReferralReconServiceIsloadingStateImpl) then) =
      __$$ReferralReconServiceIsloadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReferralReconServiceIsloadingStateImplCopyWithImpl<$Res>
    extends _$ReferralReconServiceStateCopyWithImpl<$Res,
        _$ReferralReconServiceIsloadingStateImpl>
    implements _$$ReferralReconServiceIsloadingStateImplCopyWith<$Res> {
  __$$ReferralReconServiceIsloadingStateImplCopyWithImpl(
      _$ReferralReconServiceIsloadingStateImpl _value,
      $Res Function(_$ReferralReconServiceIsloadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReferralReconServiceIsloadingStateImpl
    implements ReferralReconServiceIsloadingState {
  const _$ReferralReconServiceIsloadingStateImpl();

  @override
  String toString() {
    return 'ReferralReconServiceState.isLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReconServiceIsloadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isLoading,
    required TResult Function(String value, bool submitTriggered)
        multiCheckListChanged,
    required TResult Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)
        serviceCreate,
    required TResult Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)
        serviceSearch,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isLoading,
    TResult? Function(String value, bool submitTriggered)?
        multiCheckListChanged,
    TResult? Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)?
        serviceCreate,
    TResult? Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)?
        serviceSearch,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isLoading,
    TResult Function(String value, bool submitTriggered)? multiCheckListChanged,
    TResult Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)?
        serviceCreate,
    TResult Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)?
        serviceSearch,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReferralReconServiceEmptyState value) empty,
    required TResult Function(ReferralReconServiceIsloadingState value)
        isLoading,
    required TResult Function(
            ReferralReconServiceMultichecklistChangedState value)
        multiCheckListChanged,
    required TResult Function(ReferralReconServiceCreateState value)
        serviceCreate,
    required TResult Function(ReferralReconServiceSearchState value)
        serviceSearch,
  }) {
    return isLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceEmptyState value)? empty,
    TResult? Function(ReferralReconServiceIsloadingState value)? isLoading,
    TResult? Function(ReferralReconServiceMultichecklistChangedState value)?
        multiCheckListChanged,
    TResult? Function(ReferralReconServiceCreateState value)? serviceCreate,
    TResult? Function(ReferralReconServiceSearchState value)? serviceSearch,
  }) {
    return isLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceEmptyState value)? empty,
    TResult Function(ReferralReconServiceIsloadingState value)? isLoading,
    TResult Function(ReferralReconServiceMultichecklistChangedState value)?
        multiCheckListChanged,
    TResult Function(ReferralReconServiceCreateState value)? serviceCreate,
    TResult Function(ReferralReconServiceSearchState value)? serviceSearch,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(this);
    }
    return orElse();
  }
}

abstract class ReferralReconServiceIsloadingState
    implements ReferralReconServiceState {
  const factory ReferralReconServiceIsloadingState() =
      _$ReferralReconServiceIsloadingStateImpl;
}

/// @nodoc
abstract class _$$ReferralReconServiceMultichecklistChangedStateImplCopyWith<
    $Res> {
  factory _$$ReferralReconServiceMultichecklistChangedStateImplCopyWith(
          _$ReferralReconServiceMultichecklistChangedStateImpl value,
          $Res Function(_$ReferralReconServiceMultichecklistChangedStateImpl)
              then) =
      __$$ReferralReconServiceMultichecklistChangedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value, bool submitTriggered});
}

/// @nodoc
class __$$ReferralReconServiceMultichecklistChangedStateImplCopyWithImpl<$Res>
    extends _$ReferralReconServiceStateCopyWithImpl<$Res,
        _$ReferralReconServiceMultichecklistChangedStateImpl>
    implements
        _$$ReferralReconServiceMultichecklistChangedStateImplCopyWith<$Res> {
  __$$ReferralReconServiceMultichecklistChangedStateImplCopyWithImpl(
      _$ReferralReconServiceMultichecklistChangedStateImpl _value,
      $Res Function(_$ReferralReconServiceMultichecklistChangedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? submitTriggered = null,
  }) {
    return _then(_$ReferralReconServiceMultichecklistChangedStateImpl(
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

class _$ReferralReconServiceMultichecklistChangedStateImpl
    implements ReferralReconServiceMultichecklistChangedState {
  const _$ReferralReconServiceMultichecklistChangedStateImpl(
      {this.value = '', this.submitTriggered = false});

  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final bool submitTriggered;

  @override
  String toString() {
    return 'ReferralReconServiceState.multiCheckListChanged(value: $value, submitTriggered: $submitTriggered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReconServiceMultichecklistChangedStateImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.submitTriggered, submitTriggered) ||
                other.submitTriggered == submitTriggered));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, submitTriggered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralReconServiceMultichecklistChangedStateImplCopyWith<
          _$ReferralReconServiceMultichecklistChangedStateImpl>
      get copyWith =>
          __$$ReferralReconServiceMultichecklistChangedStateImplCopyWithImpl<
                  _$ReferralReconServiceMultichecklistChangedStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isLoading,
    required TResult Function(String value, bool submitTriggered)
        multiCheckListChanged,
    required TResult Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)
        serviceCreate,
    required TResult Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)
        serviceSearch,
  }) {
    return multiCheckListChanged(value, submitTriggered);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isLoading,
    TResult? Function(String value, bool submitTriggered)?
        multiCheckListChanged,
    TResult? Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)?
        serviceCreate,
    TResult? Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)?
        serviceSearch,
  }) {
    return multiCheckListChanged?.call(value, submitTriggered);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isLoading,
    TResult Function(String value, bool submitTriggered)? multiCheckListChanged,
    TResult Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)?
        serviceCreate,
    TResult Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)?
        serviceSearch,
    required TResult orElse(),
  }) {
    if (multiCheckListChanged != null) {
      return multiCheckListChanged(value, submitTriggered);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReferralReconServiceEmptyState value) empty,
    required TResult Function(ReferralReconServiceIsloadingState value)
        isLoading,
    required TResult Function(
            ReferralReconServiceMultichecklistChangedState value)
        multiCheckListChanged,
    required TResult Function(ReferralReconServiceCreateState value)
        serviceCreate,
    required TResult Function(ReferralReconServiceSearchState value)
        serviceSearch,
  }) {
    return multiCheckListChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceEmptyState value)? empty,
    TResult? Function(ReferralReconServiceIsloadingState value)? isLoading,
    TResult? Function(ReferralReconServiceMultichecklistChangedState value)?
        multiCheckListChanged,
    TResult? Function(ReferralReconServiceCreateState value)? serviceCreate,
    TResult? Function(ReferralReconServiceSearchState value)? serviceSearch,
  }) {
    return multiCheckListChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceEmptyState value)? empty,
    TResult Function(ReferralReconServiceIsloadingState value)? isLoading,
    TResult Function(ReferralReconServiceMultichecklistChangedState value)?
        multiCheckListChanged,
    TResult Function(ReferralReconServiceCreateState value)? serviceCreate,
    TResult Function(ReferralReconServiceSearchState value)? serviceSearch,
    required TResult orElse(),
  }) {
    if (multiCheckListChanged != null) {
      return multiCheckListChanged(this);
    }
    return orElse();
  }
}

abstract class ReferralReconServiceMultichecklistChangedState
    implements ReferralReconServiceState {
  const factory ReferralReconServiceMultichecklistChangedState(
          {final String value, final bool submitTriggered}) =
      _$ReferralReconServiceMultichecklistChangedStateImpl;

  String get value;
  bool get submitTriggered;
  @JsonKey(ignore: true)
  _$$ReferralReconServiceMultichecklistChangedStateImplCopyWith<
          _$ReferralReconServiceMultichecklistChangedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReferralReconServiceCreateStateImplCopyWith<$Res> {
  factory _$$ReferralReconServiceCreateStateImplCopyWith(
          _$ReferralReconServiceCreateStateImpl value,
          $Res Function(_$ReferralReconServiceCreateStateImpl) then) =
      __$$ReferralReconServiceCreateStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ReferralReconServiceModel serviceList,
      ReferralReconServiceModel? selectedService,
      bool loading,
      bool isEditing});
}

/// @nodoc
class __$$ReferralReconServiceCreateStateImplCopyWithImpl<$Res>
    extends _$ReferralReconServiceStateCopyWithImpl<$Res,
        _$ReferralReconServiceCreateStateImpl>
    implements _$$ReferralReconServiceCreateStateImplCopyWith<$Res> {
  __$$ReferralReconServiceCreateStateImplCopyWithImpl(
      _$ReferralReconServiceCreateStateImpl _value,
      $Res Function(_$ReferralReconServiceCreateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceList = null,
    Object? selectedService = freezed,
    Object? loading = null,
    Object? isEditing = null,
  }) {
    return _then(_$ReferralReconServiceCreateStateImpl(
      serviceList: null == serviceList
          ? _value.serviceList
          : serviceList // ignore: cast_nullable_to_non_nullable
              as ReferralReconServiceModel,
      selectedService: freezed == selectedService
          ? _value.selectedService
          : selectedService // ignore: cast_nullable_to_non_nullable
              as ReferralReconServiceModel?,
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

class _$ReferralReconServiceCreateStateImpl
    implements ReferralReconServiceCreateState {
  const _$ReferralReconServiceCreateStateImpl(
      {required this.serviceList,
      this.selectedService,
      this.loading = false,
      this.isEditing = false});

  @override
  final ReferralReconServiceModel serviceList;
  @override
  final ReferralReconServiceModel? selectedService;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isEditing;

  @override
  String toString() {
    return 'ReferralReconServiceState.serviceCreate(serviceList: $serviceList, selectedService: $selectedService, loading: $loading, isEditing: $isEditing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReconServiceCreateStateImpl &&
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
  _$$ReferralReconServiceCreateStateImplCopyWith<
          _$ReferralReconServiceCreateStateImpl>
      get copyWith => __$$ReferralReconServiceCreateStateImplCopyWithImpl<
          _$ReferralReconServiceCreateStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isLoading,
    required TResult Function(String value, bool submitTriggered)
        multiCheckListChanged,
    required TResult Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)
        serviceCreate,
    required TResult Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)
        serviceSearch,
  }) {
    return serviceCreate(serviceList, selectedService, loading, isEditing);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isLoading,
    TResult? Function(String value, bool submitTriggered)?
        multiCheckListChanged,
    TResult? Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)?
        serviceCreate,
    TResult? Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)?
        serviceSearch,
  }) {
    return serviceCreate?.call(
        serviceList, selectedService, loading, isEditing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isLoading,
    TResult Function(String value, bool submitTriggered)? multiCheckListChanged,
    TResult Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)?
        serviceCreate,
    TResult Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)?
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
    required TResult Function(ReferralReconServiceEmptyState value) empty,
    required TResult Function(ReferralReconServiceIsloadingState value)
        isLoading,
    required TResult Function(
            ReferralReconServiceMultichecklistChangedState value)
        multiCheckListChanged,
    required TResult Function(ReferralReconServiceCreateState value)
        serviceCreate,
    required TResult Function(ReferralReconServiceSearchState value)
        serviceSearch,
  }) {
    return serviceCreate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceEmptyState value)? empty,
    TResult? Function(ReferralReconServiceIsloadingState value)? isLoading,
    TResult? Function(ReferralReconServiceMultichecklistChangedState value)?
        multiCheckListChanged,
    TResult? Function(ReferralReconServiceCreateState value)? serviceCreate,
    TResult? Function(ReferralReconServiceSearchState value)? serviceSearch,
  }) {
    return serviceCreate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceEmptyState value)? empty,
    TResult Function(ReferralReconServiceIsloadingState value)? isLoading,
    TResult Function(ReferralReconServiceMultichecklistChangedState value)?
        multiCheckListChanged,
    TResult Function(ReferralReconServiceCreateState value)? serviceCreate,
    TResult Function(ReferralReconServiceSearchState value)? serviceSearch,
    required TResult orElse(),
  }) {
    if (serviceCreate != null) {
      return serviceCreate(this);
    }
    return orElse();
  }
}

abstract class ReferralReconServiceCreateState
    implements ReferralReconServiceState {
  const factory ReferralReconServiceCreateState(
      {required final ReferralReconServiceModel serviceList,
      final ReferralReconServiceModel? selectedService,
      final bool loading,
      final bool isEditing}) = _$ReferralReconServiceCreateStateImpl;

  ReferralReconServiceModel get serviceList;
  ReferralReconServiceModel? get selectedService;
  bool get loading;
  bool get isEditing;
  @JsonKey(ignore: true)
  _$$ReferralReconServiceCreateStateImplCopyWith<
          _$ReferralReconServiceCreateStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReferralReconServiceSearchStateImplCopyWith<$Res> {
  factory _$$ReferralReconServiceSearchStateImplCopyWith(
          _$ReferralReconServiceSearchStateImpl value,
          $Res Function(_$ReferralReconServiceSearchStateImpl) then) =
      __$$ReferralReconServiceSearchStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ReferralReconServiceModel> serviceList,
      ReferralReconServiceModel? selectedService,
      bool loading});
}

/// @nodoc
class __$$ReferralReconServiceSearchStateImplCopyWithImpl<$Res>
    extends _$ReferralReconServiceStateCopyWithImpl<$Res,
        _$ReferralReconServiceSearchStateImpl>
    implements _$$ReferralReconServiceSearchStateImplCopyWith<$Res> {
  __$$ReferralReconServiceSearchStateImplCopyWithImpl(
      _$ReferralReconServiceSearchStateImpl _value,
      $Res Function(_$ReferralReconServiceSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceList = null,
    Object? selectedService = freezed,
    Object? loading = null,
  }) {
    return _then(_$ReferralReconServiceSearchStateImpl(
      serviceList: null == serviceList
          ? _value._serviceList
          : serviceList // ignore: cast_nullable_to_non_nullable
              as List<ReferralReconServiceModel>,
      selectedService: freezed == selectedService
          ? _value.selectedService
          : selectedService // ignore: cast_nullable_to_non_nullable
              as ReferralReconServiceModel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReferralReconServiceSearchStateImpl
    implements ReferralReconServiceSearchState {
  const _$ReferralReconServiceSearchStateImpl(
      {required final List<ReferralReconServiceModel> serviceList,
      this.selectedService,
      this.loading = false})
      : _serviceList = serviceList;

  final List<ReferralReconServiceModel> _serviceList;
  @override
  List<ReferralReconServiceModel> get serviceList {
    if (_serviceList is EqualUnmodifiableListView) return _serviceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceList);
  }

  @override
  final ReferralReconServiceModel? selectedService;
  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'ReferralReconServiceState.serviceSearch(serviceList: $serviceList, selectedService: $selectedService, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReconServiceSearchStateImpl &&
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
  _$$ReferralReconServiceSearchStateImplCopyWith<
          _$ReferralReconServiceSearchStateImpl>
      get copyWith => __$$ReferralReconServiceSearchStateImplCopyWithImpl<
          _$ReferralReconServiceSearchStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() isLoading,
    required TResult Function(String value, bool submitTriggered)
        multiCheckListChanged,
    required TResult Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)
        serviceCreate,
    required TResult Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)
        serviceSearch,
  }) {
    return serviceSearch(serviceList, selectedService, loading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? isLoading,
    TResult? Function(String value, bool submitTriggered)?
        multiCheckListChanged,
    TResult? Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)?
        serviceCreate,
    TResult? Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)?
        serviceSearch,
  }) {
    return serviceSearch?.call(serviceList, selectedService, loading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? isLoading,
    TResult Function(String value, bool submitTriggered)? multiCheckListChanged,
    TResult Function(
            ReferralReconServiceModel serviceList,
            ReferralReconServiceModel? selectedService,
            bool loading,
            bool isEditing)?
        serviceCreate,
    TResult Function(List<ReferralReconServiceModel> serviceList,
            ReferralReconServiceModel? selectedService, bool loading)?
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
    required TResult Function(ReferralReconServiceEmptyState value) empty,
    required TResult Function(ReferralReconServiceIsloadingState value)
        isLoading,
    required TResult Function(
            ReferralReconServiceMultichecklistChangedState value)
        multiCheckListChanged,
    required TResult Function(ReferralReconServiceCreateState value)
        serviceCreate,
    required TResult Function(ReferralReconServiceSearchState value)
        serviceSearch,
  }) {
    return serviceSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceEmptyState value)? empty,
    TResult? Function(ReferralReconServiceIsloadingState value)? isLoading,
    TResult? Function(ReferralReconServiceMultichecklistChangedState value)?
        multiCheckListChanged,
    TResult? Function(ReferralReconServiceCreateState value)? serviceCreate,
    TResult? Function(ReferralReconServiceSearchState value)? serviceSearch,
  }) {
    return serviceSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceEmptyState value)? empty,
    TResult Function(ReferralReconServiceIsloadingState value)? isLoading,
    TResult Function(ReferralReconServiceMultichecklistChangedState value)?
        multiCheckListChanged,
    TResult Function(ReferralReconServiceCreateState value)? serviceCreate,
    TResult Function(ReferralReconServiceSearchState value)? serviceSearch,
    required TResult orElse(),
  }) {
    if (serviceSearch != null) {
      return serviceSearch(this);
    }
    return orElse();
  }
}

abstract class ReferralReconServiceSearchState
    implements ReferralReconServiceState {
  const factory ReferralReconServiceSearchState(
      {required final List<ReferralReconServiceModel> serviceList,
      final ReferralReconServiceModel? selectedService,
      final bool loading}) = _$ReferralReconServiceSearchStateImpl;

  List<ReferralReconServiceModel> get serviceList;
  ReferralReconServiceModel? get selectedService;
  bool get loading;
  @JsonKey(ignore: true)
  _$$ReferralReconServiceSearchStateImplCopyWith<
          _$ReferralReconServiceSearchStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

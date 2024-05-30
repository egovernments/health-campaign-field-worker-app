// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_recon_service_definition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReferralReconServiceDefinitionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String serviceDefinitionCode)
        selectServiceDefinition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String serviceDefinitionCode)? selectServiceDefinition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String serviceDefinitionCode)? selectServiceDefinition,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReferralReconServiceDefinitionFetchEvent value)
        fetch,
    required TResult Function(
            ReferralReconServiceDefinitionSelectionEvent value)
        selectServiceDefinition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceDefinitionFetchEvent value)? fetch,
    TResult? Function(ReferralReconServiceDefinitionSelectionEvent value)?
        selectServiceDefinition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceDefinitionFetchEvent value)? fetch,
    TResult Function(ReferralReconServiceDefinitionSelectionEvent value)?
        selectServiceDefinition,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralReconServiceDefinitionEventCopyWith<$Res> {
  factory $ReferralReconServiceDefinitionEventCopyWith(
          ReferralReconServiceDefinitionEvent value,
          $Res Function(ReferralReconServiceDefinitionEvent) then) =
      _$ReferralReconServiceDefinitionEventCopyWithImpl<$Res,
          ReferralReconServiceDefinitionEvent>;
}

/// @nodoc
class _$ReferralReconServiceDefinitionEventCopyWithImpl<$Res,
        $Val extends ReferralReconServiceDefinitionEvent>
    implements $ReferralReconServiceDefinitionEventCopyWith<$Res> {
  _$ReferralReconServiceDefinitionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReferralReconServiceDefinitionFetchEventImplCopyWith<$Res> {
  factory _$$ReferralReconServiceDefinitionFetchEventImplCopyWith(
          _$ReferralReconServiceDefinitionFetchEventImpl value,
          $Res Function(_$ReferralReconServiceDefinitionFetchEventImpl) then) =
      __$$ReferralReconServiceDefinitionFetchEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReferralReconServiceDefinitionFetchEventImplCopyWithImpl<$Res>
    extends _$ReferralReconServiceDefinitionEventCopyWithImpl<$Res,
        _$ReferralReconServiceDefinitionFetchEventImpl>
    implements _$$ReferralReconServiceDefinitionFetchEventImplCopyWith<$Res> {
  __$$ReferralReconServiceDefinitionFetchEventImplCopyWithImpl(
      _$ReferralReconServiceDefinitionFetchEventImpl _value,
      $Res Function(_$ReferralReconServiceDefinitionFetchEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReferralReconServiceDefinitionFetchEventImpl
    implements ReferralReconServiceDefinitionFetchEvent {
  const _$ReferralReconServiceDefinitionFetchEventImpl();

  @override
  String toString() {
    return 'ReferralReconServiceDefinitionEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReconServiceDefinitionFetchEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String serviceDefinitionCode)
        selectServiceDefinition,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String serviceDefinitionCode)? selectServiceDefinition,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String serviceDefinitionCode)? selectServiceDefinition,
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
    required TResult Function(ReferralReconServiceDefinitionFetchEvent value)
        fetch,
    required TResult Function(
            ReferralReconServiceDefinitionSelectionEvent value)
        selectServiceDefinition,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceDefinitionFetchEvent value)? fetch,
    TResult? Function(ReferralReconServiceDefinitionSelectionEvent value)?
        selectServiceDefinition,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceDefinitionFetchEvent value)? fetch,
    TResult Function(ReferralReconServiceDefinitionSelectionEvent value)?
        selectServiceDefinition,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class ReferralReconServiceDefinitionFetchEvent
    implements ReferralReconServiceDefinitionEvent {
  const factory ReferralReconServiceDefinitionFetchEvent() =
      _$ReferralReconServiceDefinitionFetchEventImpl;
}

/// @nodoc
abstract class _$$ReferralReconServiceDefinitionSelectionEventImplCopyWith<
    $Res> {
  factory _$$ReferralReconServiceDefinitionSelectionEventImplCopyWith(
          _$ReferralReconServiceDefinitionSelectionEventImpl value,
          $Res Function(_$ReferralReconServiceDefinitionSelectionEventImpl)
              then) =
      __$$ReferralReconServiceDefinitionSelectionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serviceDefinitionCode});
}

/// @nodoc
class __$$ReferralReconServiceDefinitionSelectionEventImplCopyWithImpl<$Res>
    extends _$ReferralReconServiceDefinitionEventCopyWithImpl<$Res,
        _$ReferralReconServiceDefinitionSelectionEventImpl>
    implements
        _$$ReferralReconServiceDefinitionSelectionEventImplCopyWith<$Res> {
  __$$ReferralReconServiceDefinitionSelectionEventImplCopyWithImpl(
      _$ReferralReconServiceDefinitionSelectionEventImpl _value,
      $Res Function(_$ReferralReconServiceDefinitionSelectionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceDefinitionCode = null,
  }) {
    return _then(_$ReferralReconServiceDefinitionSelectionEventImpl(
      serviceDefinitionCode: null == serviceDefinitionCode
          ? _value.serviceDefinitionCode
          : serviceDefinitionCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReferralReconServiceDefinitionSelectionEventImpl
    implements ReferralReconServiceDefinitionSelectionEvent {
  const _$ReferralReconServiceDefinitionSelectionEventImpl(
      {required this.serviceDefinitionCode});

  @override
  final String serviceDefinitionCode;

  @override
  String toString() {
    return 'ReferralReconServiceDefinitionEvent.selectServiceDefinition(serviceDefinitionCode: $serviceDefinitionCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReconServiceDefinitionSelectionEventImpl &&
            (identical(other.serviceDefinitionCode, serviceDefinitionCode) ||
                other.serviceDefinitionCode == serviceDefinitionCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceDefinitionCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralReconServiceDefinitionSelectionEventImplCopyWith<
          _$ReferralReconServiceDefinitionSelectionEventImpl>
      get copyWith =>
          __$$ReferralReconServiceDefinitionSelectionEventImplCopyWithImpl<
                  _$ReferralReconServiceDefinitionSelectionEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String serviceDefinitionCode)
        selectServiceDefinition,
  }) {
    return selectServiceDefinition(serviceDefinitionCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String serviceDefinitionCode)? selectServiceDefinition,
  }) {
    return selectServiceDefinition?.call(serviceDefinitionCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String serviceDefinitionCode)? selectServiceDefinition,
    required TResult orElse(),
  }) {
    if (selectServiceDefinition != null) {
      return selectServiceDefinition(serviceDefinitionCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReferralReconServiceDefinitionFetchEvent value)
        fetch,
    required TResult Function(
            ReferralReconServiceDefinitionSelectionEvent value)
        selectServiceDefinition,
  }) {
    return selectServiceDefinition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceDefinitionFetchEvent value)? fetch,
    TResult? Function(ReferralReconServiceDefinitionSelectionEvent value)?
        selectServiceDefinition,
  }) {
    return selectServiceDefinition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceDefinitionFetchEvent value)? fetch,
    TResult Function(ReferralReconServiceDefinitionSelectionEvent value)?
        selectServiceDefinition,
    required TResult orElse(),
  }) {
    if (selectServiceDefinition != null) {
      return selectServiceDefinition(this);
    }
    return orElse();
  }
}

abstract class ReferralReconServiceDefinitionSelectionEvent
    implements ReferralReconServiceDefinitionEvent {
  const factory ReferralReconServiceDefinitionSelectionEvent(
          {required final String serviceDefinitionCode}) =
      _$ReferralReconServiceDefinitionSelectionEventImpl;

  String get serviceDefinitionCode;
  @JsonKey(ignore: true)
  _$$ReferralReconServiceDefinitionSelectionEventImplCopyWith<
          _$ReferralReconServiceDefinitionSelectionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReferralReconServiceDefinitionState {
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
    required TResult Function(ReferralReconServiceDefinitionEmptyState value)
        empty,
    required TResult Function(
            ReferralReconServiceDefinitionIsloadingState value)
        isloading,
    required TResult Function(
            ReferralReconServiceDefinitionServiceFetchedState value)
        serviceDefinitionFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceDefinitionEmptyState value)? empty,
    TResult? Function(ReferralReconServiceDefinitionIsloadingState value)?
        isloading,
    TResult? Function(ReferralReconServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceDefinitionEmptyState value)? empty,
    TResult Function(ReferralReconServiceDefinitionIsloadingState value)?
        isloading,
    TResult Function(ReferralReconServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralReconServiceDefinitionStateCopyWith<$Res> {
  factory $ReferralReconServiceDefinitionStateCopyWith(
          ReferralReconServiceDefinitionState value,
          $Res Function(ReferralReconServiceDefinitionState) then) =
      _$ReferralReconServiceDefinitionStateCopyWithImpl<$Res,
          ReferralReconServiceDefinitionState>;
}

/// @nodoc
class _$ReferralReconServiceDefinitionStateCopyWithImpl<$Res,
        $Val extends ReferralReconServiceDefinitionState>
    implements $ReferralReconServiceDefinitionStateCopyWith<$Res> {
  _$ReferralReconServiceDefinitionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReferralReconServiceDefinitionEmptyStateImplCopyWith<$Res> {
  factory _$$ReferralReconServiceDefinitionEmptyStateImplCopyWith(
          _$ReferralReconServiceDefinitionEmptyStateImpl value,
          $Res Function(_$ReferralReconServiceDefinitionEmptyStateImpl) then) =
      __$$ReferralReconServiceDefinitionEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReferralReconServiceDefinitionEmptyStateImplCopyWithImpl<$Res>
    extends _$ReferralReconServiceDefinitionStateCopyWithImpl<$Res,
        _$ReferralReconServiceDefinitionEmptyStateImpl>
    implements _$$ReferralReconServiceDefinitionEmptyStateImplCopyWith<$Res> {
  __$$ReferralReconServiceDefinitionEmptyStateImplCopyWithImpl(
      _$ReferralReconServiceDefinitionEmptyStateImpl _value,
      $Res Function(_$ReferralReconServiceDefinitionEmptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReferralReconServiceDefinitionEmptyStateImpl
    implements ReferralReconServiceDefinitionEmptyState {
  const _$ReferralReconServiceDefinitionEmptyStateImpl();

  @override
  String toString() {
    return 'ReferralReconServiceDefinitionState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReconServiceDefinitionEmptyStateImpl);
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
    required TResult Function(ReferralReconServiceDefinitionEmptyState value)
        empty,
    required TResult Function(
            ReferralReconServiceDefinitionIsloadingState value)
        isloading,
    required TResult Function(
            ReferralReconServiceDefinitionServiceFetchedState value)
        serviceDefinitionFetch,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceDefinitionEmptyState value)? empty,
    TResult? Function(ReferralReconServiceDefinitionIsloadingState value)?
        isloading,
    TResult? Function(ReferralReconServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceDefinitionEmptyState value)? empty,
    TResult Function(ReferralReconServiceDefinitionIsloadingState value)?
        isloading,
    TResult Function(ReferralReconServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class ReferralReconServiceDefinitionEmptyState
    implements ReferralReconServiceDefinitionState {
  const factory ReferralReconServiceDefinitionEmptyState() =
      _$ReferralReconServiceDefinitionEmptyStateImpl;
}

/// @nodoc
abstract class _$$ReferralReconServiceDefinitionIsloadingStateImplCopyWith<
    $Res> {
  factory _$$ReferralReconServiceDefinitionIsloadingStateImplCopyWith(
          _$ReferralReconServiceDefinitionIsloadingStateImpl value,
          $Res Function(_$ReferralReconServiceDefinitionIsloadingStateImpl)
              then) =
      __$$ReferralReconServiceDefinitionIsloadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReferralReconServiceDefinitionIsloadingStateImplCopyWithImpl<$Res>
    extends _$ReferralReconServiceDefinitionStateCopyWithImpl<$Res,
        _$ReferralReconServiceDefinitionIsloadingStateImpl>
    implements
        _$$ReferralReconServiceDefinitionIsloadingStateImplCopyWith<$Res> {
  __$$ReferralReconServiceDefinitionIsloadingStateImplCopyWithImpl(
      _$ReferralReconServiceDefinitionIsloadingStateImpl _value,
      $Res Function(_$ReferralReconServiceDefinitionIsloadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReferralReconServiceDefinitionIsloadingStateImpl
    implements ReferralReconServiceDefinitionIsloadingState {
  const _$ReferralReconServiceDefinitionIsloadingStateImpl();

  @override
  String toString() {
    return 'ReferralReconServiceDefinitionState.isloading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReconServiceDefinitionIsloadingStateImpl);
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
    required TResult Function(ReferralReconServiceDefinitionEmptyState value)
        empty,
    required TResult Function(
            ReferralReconServiceDefinitionIsloadingState value)
        isloading,
    required TResult Function(
            ReferralReconServiceDefinitionServiceFetchedState value)
        serviceDefinitionFetch,
  }) {
    return isloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceDefinitionEmptyState value)? empty,
    TResult? Function(ReferralReconServiceDefinitionIsloadingState value)?
        isloading,
    TResult? Function(ReferralReconServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
  }) {
    return isloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceDefinitionEmptyState value)? empty,
    TResult Function(ReferralReconServiceDefinitionIsloadingState value)?
        isloading,
    TResult Function(ReferralReconServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
    required TResult orElse(),
  }) {
    if (isloading != null) {
      return isloading(this);
    }
    return orElse();
  }
}

abstract class ReferralReconServiceDefinitionIsloadingState
    implements ReferralReconServiceDefinitionState {
  const factory ReferralReconServiceDefinitionIsloadingState() =
      _$ReferralReconServiceDefinitionIsloadingStateImpl;
}

/// @nodoc
abstract class _$$ReferralReconServiceDefinitionServiceFetchedStateImplCopyWith<
    $Res> {
  factory _$$ReferralReconServiceDefinitionServiceFetchedStateImplCopyWith(
          _$ReferralReconServiceDefinitionServiceFetchedStateImpl value,
          $Res Function(_$ReferralReconServiceDefinitionServiceFetchedStateImpl)
              then) =
      __$$ReferralReconServiceDefinitionServiceFetchedStateImplCopyWithImpl<
          $Res>;
  @useResult
  $Res call(
      {List<ServiceDefinitionModel> serviceDefinitionList,
      ServiceDefinitionModel? selectedServiceDefinition});
}

/// @nodoc
class __$$ReferralReconServiceDefinitionServiceFetchedStateImplCopyWithImpl<
        $Res>
    extends _$ReferralReconServiceDefinitionStateCopyWithImpl<$Res,
        _$ReferralReconServiceDefinitionServiceFetchedStateImpl>
    implements
        _$$ReferralReconServiceDefinitionServiceFetchedStateImplCopyWith<$Res> {
  __$$ReferralReconServiceDefinitionServiceFetchedStateImplCopyWithImpl(
      _$ReferralReconServiceDefinitionServiceFetchedStateImpl _value,
      $Res Function(_$ReferralReconServiceDefinitionServiceFetchedStateImpl)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceDefinitionList = null,
    Object? selectedServiceDefinition = freezed,
  }) {
    return _then(_$ReferralReconServiceDefinitionServiceFetchedStateImpl(
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

class _$ReferralReconServiceDefinitionServiceFetchedStateImpl
    implements ReferralReconServiceDefinitionServiceFetchedState {
  const _$ReferralReconServiceDefinitionServiceFetchedStateImpl(
      {required final List<ServiceDefinitionModel> serviceDefinitionList,
      this.selectedServiceDefinition})
      : _serviceDefinitionList = serviceDefinitionList;

  final List<ServiceDefinitionModel> _serviceDefinitionList;
  @override
  List<ServiceDefinitionModel> get serviceDefinitionList {
    if (_serviceDefinitionList is EqualUnmodifiableListView)
      return _serviceDefinitionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceDefinitionList);
  }

  @override
  final ServiceDefinitionModel? selectedServiceDefinition;

  @override
  String toString() {
    return 'ReferralReconServiceDefinitionState.serviceDefinitionFetch(serviceDefinitionList: $serviceDefinitionList, selectedServiceDefinition: $selectedServiceDefinition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralReconServiceDefinitionServiceFetchedStateImpl &&
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
  _$$ReferralReconServiceDefinitionServiceFetchedStateImplCopyWith<
          _$ReferralReconServiceDefinitionServiceFetchedStateImpl>
      get copyWith =>
          __$$ReferralReconServiceDefinitionServiceFetchedStateImplCopyWithImpl<
                  _$ReferralReconServiceDefinitionServiceFetchedStateImpl>(
              this, _$identity);

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
    required TResult Function(ReferralReconServiceDefinitionEmptyState value)
        empty,
    required TResult Function(
            ReferralReconServiceDefinitionIsloadingState value)
        isloading,
    required TResult Function(
            ReferralReconServiceDefinitionServiceFetchedState value)
        serviceDefinitionFetch,
  }) {
    return serviceDefinitionFetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReferralReconServiceDefinitionEmptyState value)? empty,
    TResult? Function(ReferralReconServiceDefinitionIsloadingState value)?
        isloading,
    TResult? Function(ReferralReconServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
  }) {
    return serviceDefinitionFetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReferralReconServiceDefinitionEmptyState value)? empty,
    TResult Function(ReferralReconServiceDefinitionIsloadingState value)?
        isloading,
    TResult Function(ReferralReconServiceDefinitionServiceFetchedState value)?
        serviceDefinitionFetch,
    required TResult orElse(),
  }) {
    if (serviceDefinitionFetch != null) {
      return serviceDefinitionFetch(this);
    }
    return orElse();
  }
}

abstract class ReferralReconServiceDefinitionServiceFetchedState
    implements ReferralReconServiceDefinitionState {
  const factory ReferralReconServiceDefinitionServiceFetchedState(
          {required final List<ServiceDefinitionModel> serviceDefinitionList,
          final ServiceDefinitionModel? selectedServiceDefinition}) =
      _$ReferralReconServiceDefinitionServiceFetchedStateImpl;

  List<ServiceDefinitionModel> get serviceDefinitionList;
  ServiceDefinitionModel? get selectedServiceDefinition;
  @JsonKey(ignore: true)
  _$$ReferralReconServiceDefinitionServiceFetchedStateImplCopyWith<
          _$ReferralReconServiceDefinitionServiceFetchedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'household_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HouseholdLocationEvent {
  AddressModel get adressmodel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddressModel adressmodel) onSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddressModel adressmodel)? onSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddressModel adressmodel)? onSubmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HouseholdLocationSubmitEvent value) onSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HouseholdLocationSubmitEvent value)? onSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HouseholdLocationSubmitEvent value)? onSubmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HouseholdLocationEventCopyWith<HouseholdLocationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdLocationEventCopyWith<$Res> {
  factory $HouseholdLocationEventCopyWith(HouseholdLocationEvent value,
          $Res Function(HouseholdLocationEvent) then) =
      _$HouseholdLocationEventCopyWithImpl<$Res, HouseholdLocationEvent>;
  @useResult
  $Res call({AddressModel adressmodel});
}

/// @nodoc
class _$HouseholdLocationEventCopyWithImpl<$Res,
        $Val extends HouseholdLocationEvent>
    implements $HouseholdLocationEventCopyWith<$Res> {
  _$HouseholdLocationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adressmodel = null,
  }) {
    return _then(_value.copyWith(
      adressmodel: null == adressmodel
          ? _value.adressmodel
          : adressmodel // ignore: cast_nullable_to_non_nullable
              as AddressModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HouseholdLocationSubmitEventImplCopyWith<$Res>
    implements $HouseholdLocationEventCopyWith<$Res> {
  factory _$$HouseholdLocationSubmitEventImplCopyWith(
          _$HouseholdLocationSubmitEventImpl value,
          $Res Function(_$HouseholdLocationSubmitEventImpl) then) =
      __$$HouseholdLocationSubmitEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AddressModel adressmodel});
}

/// @nodoc
class __$$HouseholdLocationSubmitEventImplCopyWithImpl<$Res>
    extends _$HouseholdLocationEventCopyWithImpl<$Res,
        _$HouseholdLocationSubmitEventImpl>
    implements _$$HouseholdLocationSubmitEventImplCopyWith<$Res> {
  __$$HouseholdLocationSubmitEventImplCopyWithImpl(
      _$HouseholdLocationSubmitEventImpl _value,
      $Res Function(_$HouseholdLocationSubmitEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adressmodel = null,
  }) {
    return _then(_$HouseholdLocationSubmitEventImpl(
      adressmodel: null == adressmodel
          ? _value.adressmodel
          : adressmodel // ignore: cast_nullable_to_non_nullable
              as AddressModel,
    ));
  }
}

/// @nodoc

class _$HouseholdLocationSubmitEventImpl
    implements HouseholdLocationSubmitEvent {
  const _$HouseholdLocationSubmitEventImpl({required this.adressmodel});

  @override
  final AddressModel adressmodel;

  @override
  String toString() {
    return 'HouseholdLocationEvent.onSubmit(adressmodel: $adressmodel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdLocationSubmitEventImpl &&
            (identical(other.adressmodel, adressmodel) ||
                other.adressmodel == adressmodel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, adressmodel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdLocationSubmitEventImplCopyWith<
          _$HouseholdLocationSubmitEventImpl>
      get copyWith => __$$HouseholdLocationSubmitEventImplCopyWithImpl<
          _$HouseholdLocationSubmitEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddressModel adressmodel) onSubmit,
  }) {
    return onSubmit(adressmodel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddressModel adressmodel)? onSubmit,
  }) {
    return onSubmit?.call(adressmodel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddressModel adressmodel)? onSubmit,
    required TResult orElse(),
  }) {
    if (onSubmit != null) {
      return onSubmit(adressmodel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HouseholdLocationSubmitEvent value) onSubmit,
  }) {
    return onSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HouseholdLocationSubmitEvent value)? onSubmit,
  }) {
    return onSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HouseholdLocationSubmitEvent value)? onSubmit,
    required TResult orElse(),
  }) {
    if (onSubmit != null) {
      return onSubmit(this);
    }
    return orElse();
  }
}

abstract class HouseholdLocationSubmitEvent implements HouseholdLocationEvent {
  const factory HouseholdLocationSubmitEvent(
          {required final AddressModel adressmodel}) =
      _$HouseholdLocationSubmitEventImpl;

  @override
  AddressModel get adressmodel;
  @override
  @JsonKey(ignore: true)
  _$$HouseholdLocationSubmitEventImplCopyWith<
          _$HouseholdLocationSubmitEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HouseholdLocationState {
  bool get loading => throw _privateConstructorUsedError;
  bool get isEditModeEnabled => throw _privateConstructorUsedError;
  AddressModel? get addressModel => throw _privateConstructorUsedError;
  AddressSearchModel? get addressRequestModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HouseholdLocationStateCopyWith<HouseholdLocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdLocationStateCopyWith<$Res> {
  factory $HouseholdLocationStateCopyWith(HouseholdLocationState value,
          $Res Function(HouseholdLocationState) then) =
      _$HouseholdLocationStateCopyWithImpl<$Res, HouseholdLocationState>;
  @useResult
  $Res call(
      {bool loading,
      bool isEditModeEnabled,
      AddressModel? addressModel,
      AddressSearchModel? addressRequestModel});
}

/// @nodoc
class _$HouseholdLocationStateCopyWithImpl<$Res,
        $Val extends HouseholdLocationState>
    implements $HouseholdLocationStateCopyWith<$Res> {
  _$HouseholdLocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditModeEnabled = null,
    Object? addressModel = freezed,
    Object? addressRequestModel = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditModeEnabled: null == isEditModeEnabled
          ? _value.isEditModeEnabled
          : isEditModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      addressModel: freezed == addressModel
          ? _value.addressModel
          : addressModel // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      addressRequestModel: freezed == addressRequestModel
          ? _value.addressRequestModel
          : addressRequestModel // ignore: cast_nullable_to_non_nullable
              as AddressSearchModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HouseholdLocationStateImplCopyWith<$Res>
    implements $HouseholdLocationStateCopyWith<$Res> {
  factory _$$HouseholdLocationStateImplCopyWith(
          _$HouseholdLocationStateImpl value,
          $Res Function(_$HouseholdLocationStateImpl) then) =
      __$$HouseholdLocationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool isEditModeEnabled,
      AddressModel? addressModel,
      AddressSearchModel? addressRequestModel});
}

/// @nodoc
class __$$HouseholdLocationStateImplCopyWithImpl<$Res>
    extends _$HouseholdLocationStateCopyWithImpl<$Res,
        _$HouseholdLocationStateImpl>
    implements _$$HouseholdLocationStateImplCopyWith<$Res> {
  __$$HouseholdLocationStateImplCopyWithImpl(
      _$HouseholdLocationStateImpl _value,
      $Res Function(_$HouseholdLocationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditModeEnabled = null,
    Object? addressModel = freezed,
    Object? addressRequestModel = freezed,
  }) {
    return _then(_$HouseholdLocationStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditModeEnabled: null == isEditModeEnabled
          ? _value.isEditModeEnabled
          : isEditModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      addressModel: freezed == addressModel
          ? _value.addressModel
          : addressModel // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      addressRequestModel: freezed == addressRequestModel
          ? _value.addressRequestModel
          : addressRequestModel // ignore: cast_nullable_to_non_nullable
              as AddressSearchModel?,
    ));
  }
}

/// @nodoc

class _$HouseholdLocationStateImpl extends _HouseholdLocationState {
  const _$HouseholdLocationStateImpl(
      {this.loading = false,
      this.isEditModeEnabled = true,
      this.addressModel,
      this.addressRequestModel})
      : super._();

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isEditModeEnabled;
  @override
  final AddressModel? addressModel;
  @override
  final AddressSearchModel? addressRequestModel;

  @override
  String toString() {
    return 'HouseholdLocationState(loading: $loading, isEditModeEnabled: $isEditModeEnabled, addressModel: $addressModel, addressRequestModel: $addressRequestModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdLocationStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isEditModeEnabled, isEditModeEnabled) ||
                other.isEditModeEnabled == isEditModeEnabled) &&
            (identical(other.addressModel, addressModel) ||
                other.addressModel == addressModel) &&
            (identical(other.addressRequestModel, addressRequestModel) ||
                other.addressRequestModel == addressRequestModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, isEditModeEnabled,
      addressModel, addressRequestModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdLocationStateImplCopyWith<_$HouseholdLocationStateImpl>
      get copyWith => __$$HouseholdLocationStateImplCopyWithImpl<
          _$HouseholdLocationStateImpl>(this, _$identity);
}

abstract class _HouseholdLocationState extends HouseholdLocationState {
  const factory _HouseholdLocationState(
          {final bool loading,
          final bool isEditModeEnabled,
          final AddressModel? addressModel,
          final AddressSearchModel? addressRequestModel}) =
      _$HouseholdLocationStateImpl;
  const _HouseholdLocationState._() : super._();

  @override
  bool get loading;
  @override
  bool get isEditModeEnabled;
  @override
  AddressModel? get addressModel;
  @override
  AddressSearchModel? get addressRequestModel;
  @override
  @JsonKey(ignore: true)
  _$$HouseholdLocationStateImplCopyWith<_$HouseholdLocationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

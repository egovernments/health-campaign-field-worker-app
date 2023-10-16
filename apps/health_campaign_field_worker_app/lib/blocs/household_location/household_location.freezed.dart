// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'household_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$HouseholdLocationSubmitEventCopyWith<$Res>
    implements $HouseholdLocationEventCopyWith<$Res> {
  factory _$$HouseholdLocationSubmitEventCopyWith(
          _$HouseholdLocationSubmitEvent value,
          $Res Function(_$HouseholdLocationSubmitEvent) then) =
      __$$HouseholdLocationSubmitEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AddressModel adressmodel});
}

/// @nodoc
class __$$HouseholdLocationSubmitEventCopyWithImpl<$Res>
    extends _$HouseholdLocationEventCopyWithImpl<$Res,
        _$HouseholdLocationSubmitEvent>
    implements _$$HouseholdLocationSubmitEventCopyWith<$Res> {
  __$$HouseholdLocationSubmitEventCopyWithImpl(
      _$HouseholdLocationSubmitEvent _value,
      $Res Function(_$HouseholdLocationSubmitEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adressmodel = null,
  }) {
    return _then(_$HouseholdLocationSubmitEvent(
      adressmodel: null == adressmodel
          ? _value.adressmodel
          : adressmodel // ignore: cast_nullable_to_non_nullable
              as AddressModel,
    ));
  }
}

/// @nodoc

class _$HouseholdLocationSubmitEvent implements HouseholdLocationSubmitEvent {
  const _$HouseholdLocationSubmitEvent({required this.adressmodel});

  @override
  final AddressModel adressmodel;

  @override
  String toString() {
    return 'HouseholdLocationEvent.onSubmit(adressmodel: $adressmodel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdLocationSubmitEvent &&
            (identical(other.adressmodel, adressmodel) ||
                other.adressmodel == adressmodel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, adressmodel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdLocationSubmitEventCopyWith<_$HouseholdLocationSubmitEvent>
      get copyWith => __$$HouseholdLocationSubmitEventCopyWithImpl<
          _$HouseholdLocationSubmitEvent>(this, _$identity);

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
      _$HouseholdLocationSubmitEvent;

  @override
  AddressModel get adressmodel;
  @override
  @JsonKey(ignore: true)
  _$$HouseholdLocationSubmitEventCopyWith<_$HouseholdLocationSubmitEvent>
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
abstract class _$$_HouseholdLocationStateCopyWith<$Res>
    implements $HouseholdLocationStateCopyWith<$Res> {
  factory _$$_HouseholdLocationStateCopyWith(_$_HouseholdLocationState value,
          $Res Function(_$_HouseholdLocationState) then) =
      __$$_HouseholdLocationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool isEditModeEnabled,
      AddressModel? addressModel,
      AddressSearchModel? addressRequestModel});
}

/// @nodoc
class __$$_HouseholdLocationStateCopyWithImpl<$Res>
    extends _$HouseholdLocationStateCopyWithImpl<$Res,
        _$_HouseholdLocationState>
    implements _$$_HouseholdLocationStateCopyWith<$Res> {
  __$$_HouseholdLocationStateCopyWithImpl(_$_HouseholdLocationState _value,
      $Res Function(_$_HouseholdLocationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditModeEnabled = null,
    Object? addressModel = freezed,
    Object? addressRequestModel = freezed,
  }) {
    return _then(_$_HouseholdLocationState(
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

class _$_HouseholdLocationState extends _HouseholdLocationState {
  const _$_HouseholdLocationState(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HouseholdLocationState &&
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
  _$$_HouseholdLocationStateCopyWith<_$_HouseholdLocationState> get copyWith =>
      __$$_HouseholdLocationStateCopyWithImpl<_$_HouseholdLocationState>(
          this, _$identity);
}

abstract class _HouseholdLocationState extends HouseholdLocationState {
  const factory _HouseholdLocationState(
          {final bool loading,
          final bool isEditModeEnabled,
          final AddressModel? addressModel,
          final AddressSearchModel? addressRequestModel}) =
      _$_HouseholdLocationState;
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
  _$$_HouseholdLocationStateCopyWith<_$_HouseholdLocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

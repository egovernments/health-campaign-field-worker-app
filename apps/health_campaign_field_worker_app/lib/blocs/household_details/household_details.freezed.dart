// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'household_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HouseholdDetailsEvent {
  HouseholdModel get householdModel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HouseholdModel householdModel) onSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HouseholdModel householdModel)? onSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HouseholdModel householdModel)? onSubmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HouseholdDetailsSubmitEvent value) onSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HouseholdDetailsSubmitEvent value)? onSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HouseholdDetailsSubmitEvent value)? onSubmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HouseholdDetailsEventCopyWith<HouseholdDetailsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdDetailsEventCopyWith<$Res> {
  factory $HouseholdDetailsEventCopyWith(HouseholdDetailsEvent value,
          $Res Function(HouseholdDetailsEvent) then) =
      _$HouseholdDetailsEventCopyWithImpl<$Res, HouseholdDetailsEvent>;
  @useResult
  $Res call({HouseholdModel householdModel});
}

/// @nodoc
class _$HouseholdDetailsEventCopyWithImpl<$Res,
        $Val extends HouseholdDetailsEvent>
    implements $HouseholdDetailsEventCopyWith<$Res> {
  _$HouseholdDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? householdModel = null,
  }) {
    return _then(_value.copyWith(
      householdModel: null == householdModel
          ? _value.householdModel
          : householdModel // ignore: cast_nullable_to_non_nullable
              as HouseholdModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HouseholdDetailsSubmitEventCopyWith<$Res>
    implements $HouseholdDetailsEventCopyWith<$Res> {
  factory _$$HouseholdDetailsSubmitEventCopyWith(
          _$HouseholdDetailsSubmitEvent value,
          $Res Function(_$HouseholdDetailsSubmitEvent) then) =
      __$$HouseholdDetailsSubmitEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HouseholdModel householdModel});
}

/// @nodoc
class __$$HouseholdDetailsSubmitEventCopyWithImpl<$Res>
    extends _$HouseholdDetailsEventCopyWithImpl<$Res,
        _$HouseholdDetailsSubmitEvent>
    implements _$$HouseholdDetailsSubmitEventCopyWith<$Res> {
  __$$HouseholdDetailsSubmitEventCopyWithImpl(
      _$HouseholdDetailsSubmitEvent _value,
      $Res Function(_$HouseholdDetailsSubmitEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? householdModel = null,
  }) {
    return _then(_$HouseholdDetailsSubmitEvent(
      householdModel: null == householdModel
          ? _value.householdModel
          : householdModel // ignore: cast_nullable_to_non_nullable
              as HouseholdModel,
    ));
  }
}

/// @nodoc

class _$HouseholdDetailsSubmitEvent implements HouseholdDetailsSubmitEvent {
  const _$HouseholdDetailsSubmitEvent({required this.householdModel});

  @override
  final HouseholdModel householdModel;

  @override
  String toString() {
    return 'HouseholdDetailsEvent.onSubmit(householdModel: $householdModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdDetailsSubmitEvent &&
            (identical(other.householdModel, householdModel) ||
                other.householdModel == householdModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, householdModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdDetailsSubmitEventCopyWith<_$HouseholdDetailsSubmitEvent>
      get copyWith => __$$HouseholdDetailsSubmitEventCopyWithImpl<
          _$HouseholdDetailsSubmitEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HouseholdModel householdModel) onSubmit,
  }) {
    return onSubmit(householdModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HouseholdModel householdModel)? onSubmit,
  }) {
    return onSubmit?.call(householdModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HouseholdModel householdModel)? onSubmit,
    required TResult orElse(),
  }) {
    if (onSubmit != null) {
      return onSubmit(householdModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HouseholdDetailsSubmitEvent value) onSubmit,
  }) {
    return onSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HouseholdDetailsSubmitEvent value)? onSubmit,
  }) {
    return onSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HouseholdDetailsSubmitEvent value)? onSubmit,
    required TResult orElse(),
  }) {
    if (onSubmit != null) {
      return onSubmit(this);
    }
    return orElse();
  }
}

abstract class HouseholdDetailsSubmitEvent implements HouseholdDetailsEvent {
  const factory HouseholdDetailsSubmitEvent(
          {required final HouseholdModel householdModel}) =
      _$HouseholdDetailsSubmitEvent;

  @override
  HouseholdModel get householdModel;
  @override
  @JsonKey(ignore: true)
  _$$HouseholdDetailsSubmitEventCopyWith<_$HouseholdDetailsSubmitEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HouseholdDetailsState {
  bool get loading => throw _privateConstructorUsedError;
  bool get isEditModeEnabled => throw _privateConstructorUsedError;
  HouseholdModel? get householdModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HouseholdDetailsStateCopyWith<HouseholdDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdDetailsStateCopyWith<$Res> {
  factory $HouseholdDetailsStateCopyWith(HouseholdDetailsState value,
          $Res Function(HouseholdDetailsState) then) =
      _$HouseholdDetailsStateCopyWithImpl<$Res, HouseholdDetailsState>;
  @useResult
  $Res call(
      {bool loading, bool isEditModeEnabled, HouseholdModel? householdModel});
}

/// @nodoc
class _$HouseholdDetailsStateCopyWithImpl<$Res,
        $Val extends HouseholdDetailsState>
    implements $HouseholdDetailsStateCopyWith<$Res> {
  _$HouseholdDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditModeEnabled = null,
    Object? householdModel = freezed,
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
      householdModel: freezed == householdModel
          ? _value.householdModel
          : householdModel // ignore: cast_nullable_to_non_nullable
              as HouseholdModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HouseholdDetailsStateCopyWith<$Res>
    implements $HouseholdDetailsStateCopyWith<$Res> {
  factory _$$_HouseholdDetailsStateCopyWith(_$_HouseholdDetailsState value,
          $Res Function(_$_HouseholdDetailsState) then) =
      __$$_HouseholdDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading, bool isEditModeEnabled, HouseholdModel? householdModel});
}

/// @nodoc
class __$$_HouseholdDetailsStateCopyWithImpl<$Res>
    extends _$HouseholdDetailsStateCopyWithImpl<$Res, _$_HouseholdDetailsState>
    implements _$$_HouseholdDetailsStateCopyWith<$Res> {
  __$$_HouseholdDetailsStateCopyWithImpl(_$_HouseholdDetailsState _value,
      $Res Function(_$_HouseholdDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditModeEnabled = null,
    Object? householdModel = freezed,
  }) {
    return _then(_$_HouseholdDetailsState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditModeEnabled: null == isEditModeEnabled
          ? _value.isEditModeEnabled
          : isEditModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      householdModel: freezed == householdModel
          ? _value.householdModel
          : householdModel // ignore: cast_nullable_to_non_nullable
              as HouseholdModel?,
    ));
  }
}

/// @nodoc

class _$_HouseholdDetailsState extends _HouseholdDetailsState {
  const _$_HouseholdDetailsState(
      {this.loading = false,
      this.isEditModeEnabled = true,
      this.householdModel})
      : super._();

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isEditModeEnabled;
  @override
  final HouseholdModel? householdModel;

  @override
  String toString() {
    return 'HouseholdDetailsState(loading: $loading, isEditModeEnabled: $isEditModeEnabled, householdModel: $householdModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HouseholdDetailsState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isEditModeEnabled, isEditModeEnabled) ||
                other.isEditModeEnabled == isEditModeEnabled) &&
            (identical(other.householdModel, householdModel) ||
                other.householdModel == householdModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, loading, isEditModeEnabled, householdModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HouseholdDetailsStateCopyWith<_$_HouseholdDetailsState> get copyWith =>
      __$$_HouseholdDetailsStateCopyWithImpl<_$_HouseholdDetailsState>(
          this, _$identity);
}

abstract class _HouseholdDetailsState extends HouseholdDetailsState {
  const factory _HouseholdDetailsState(
      {final bool loading,
      final bool isEditModeEnabled,
      final HouseholdModel? householdModel}) = _$_HouseholdDetailsState;
  const _HouseholdDetailsState._() : super._();

  @override
  bool get loading;
  @override
  bool get isEditModeEnabled;
  @override
  HouseholdModel? get householdModel;
  @override
  @JsonKey(ignore: true)
  _$$_HouseholdDetailsStateCopyWith<_$_HouseholdDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

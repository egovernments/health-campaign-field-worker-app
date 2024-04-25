// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'household_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$HouseholdDetailsSubmitEventImplCopyWith<$Res>
    implements $HouseholdDetailsEventCopyWith<$Res> {
  factory _$$HouseholdDetailsSubmitEventImplCopyWith(
          _$HouseholdDetailsSubmitEventImpl value,
          $Res Function(_$HouseholdDetailsSubmitEventImpl) then) =
      __$$HouseholdDetailsSubmitEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HouseholdModel householdModel});
}

/// @nodoc
class __$$HouseholdDetailsSubmitEventImplCopyWithImpl<$Res>
    extends _$HouseholdDetailsEventCopyWithImpl<$Res,
        _$HouseholdDetailsSubmitEventImpl>
    implements _$$HouseholdDetailsSubmitEventImplCopyWith<$Res> {
  __$$HouseholdDetailsSubmitEventImplCopyWithImpl(
      _$HouseholdDetailsSubmitEventImpl _value,
      $Res Function(_$HouseholdDetailsSubmitEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? householdModel = null,
  }) {
    return _then(_$HouseholdDetailsSubmitEventImpl(
      householdModel: null == householdModel
          ? _value.householdModel
          : householdModel // ignore: cast_nullable_to_non_nullable
              as HouseholdModel,
    ));
  }
}

/// @nodoc

class _$HouseholdDetailsSubmitEventImpl implements HouseholdDetailsSubmitEvent {
  const _$HouseholdDetailsSubmitEventImpl({required this.householdModel});

  @override
  final HouseholdModel householdModel;

  @override
  String toString() {
    return 'HouseholdDetailsEvent.onSubmit(householdModel: $householdModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdDetailsSubmitEventImpl &&
            (identical(other.householdModel, householdModel) ||
                other.householdModel == householdModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, householdModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdDetailsSubmitEventImplCopyWith<_$HouseholdDetailsSubmitEventImpl>
      get copyWith => __$$HouseholdDetailsSubmitEventImplCopyWithImpl<
          _$HouseholdDetailsSubmitEventImpl>(this, _$identity);

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
      _$HouseholdDetailsSubmitEventImpl;

  @override
  HouseholdModel get householdModel;
  @override
  @JsonKey(ignore: true)
  _$$HouseholdDetailsSubmitEventImplCopyWith<_$HouseholdDetailsSubmitEventImpl>
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
abstract class _$$HouseholdDetailsStateImplCopyWith<$Res>
    implements $HouseholdDetailsStateCopyWith<$Res> {
  factory _$$HouseholdDetailsStateImplCopyWith(
          _$HouseholdDetailsStateImpl value,
          $Res Function(_$HouseholdDetailsStateImpl) then) =
      __$$HouseholdDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading, bool isEditModeEnabled, HouseholdModel? householdModel});
}

/// @nodoc
class __$$HouseholdDetailsStateImplCopyWithImpl<$Res>
    extends _$HouseholdDetailsStateCopyWithImpl<$Res,
        _$HouseholdDetailsStateImpl>
    implements _$$HouseholdDetailsStateImplCopyWith<$Res> {
  __$$HouseholdDetailsStateImplCopyWithImpl(_$HouseholdDetailsStateImpl _value,
      $Res Function(_$HouseholdDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditModeEnabled = null,
    Object? householdModel = freezed,
  }) {
    return _then(_$HouseholdDetailsStateImpl(
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

class _$HouseholdDetailsStateImpl extends _HouseholdDetailsState {
  const _$HouseholdDetailsStateImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdDetailsStateImpl &&
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
  _$$HouseholdDetailsStateImplCopyWith<_$HouseholdDetailsStateImpl>
      get copyWith => __$$HouseholdDetailsStateImplCopyWithImpl<
          _$HouseholdDetailsStateImpl>(this, _$identity);
}

abstract class _HouseholdDetailsState extends HouseholdDetailsState {
  const factory _HouseholdDetailsState(
      {final bool loading,
      final bool isEditModeEnabled,
      final HouseholdModel? householdModel}) = _$HouseholdDetailsStateImpl;
  const _HouseholdDetailsState._() : super._();

  @override
  bool get loading;
  @override
  bool get isEditModeEnabled;
  @override
  HouseholdModel? get householdModel;
  @override
  @JsonKey(ignore: true)
  _$$HouseholdDetailsStateImplCopyWith<_$HouseholdDetailsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

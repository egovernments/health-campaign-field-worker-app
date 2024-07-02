// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomEvent {
  HouseholdModel get houseHoldModel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HouseholdModel houseHoldModel) newEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HouseholdModel houseHoldModel)? newEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HouseholdModel houseHoldModel)? newEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewEvent value) newEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewEvent value)? newEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewEvent value)? newEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomEventCopyWith<CustomEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomEventCopyWith<$Res> {
  factory $CustomEventCopyWith(
          CustomEvent value, $Res Function(CustomEvent) then) =
      _$CustomEventCopyWithImpl<$Res, CustomEvent>;
  @useResult
  $Res call({HouseholdModel houseHoldModel});
}

/// @nodoc
class _$CustomEventCopyWithImpl<$Res, $Val extends CustomEvent>
    implements $CustomEventCopyWith<$Res> {
  _$CustomEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? houseHoldModel = null,
  }) {
    return _then(_value.copyWith(
      houseHoldModel: null == houseHoldModel
          ? _value.houseHoldModel
          : houseHoldModel // ignore: cast_nullable_to_non_nullable
              as HouseholdModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewEventImplCopyWith<$Res>
    implements $CustomEventCopyWith<$Res> {
  factory _$$NewEventImplCopyWith(
          _$NewEventImpl value, $Res Function(_$NewEventImpl) then) =
      __$$NewEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HouseholdModel houseHoldModel});
}

/// @nodoc
class __$$NewEventImplCopyWithImpl<$Res>
    extends _$CustomEventCopyWithImpl<$Res, _$NewEventImpl>
    implements _$$NewEventImplCopyWith<$Res> {
  __$$NewEventImplCopyWithImpl(
      _$NewEventImpl _value, $Res Function(_$NewEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? houseHoldModel = null,
  }) {
    return _then(_$NewEventImpl(
      houseHoldModel: null == houseHoldModel
          ? _value.houseHoldModel
          : houseHoldModel // ignore: cast_nullable_to_non_nullable
              as HouseholdModel,
    ));
  }
}

/// @nodoc

class _$NewEventImpl extends _NewEvent {
  const _$NewEventImpl({required this.houseHoldModel}) : super._();

  @override
  final HouseholdModel houseHoldModel;

  @override
  String toString() {
    return 'CustomEvent.newEvent(houseHoldModel: $houseHoldModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewEventImpl &&
            (identical(other.houseHoldModel, houseHoldModel) ||
                other.houseHoldModel == houseHoldModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, houseHoldModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewEventImplCopyWith<_$NewEventImpl> get copyWith =>
      __$$NewEventImplCopyWithImpl<_$NewEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HouseholdModel houseHoldModel) newEvent,
  }) {
    return newEvent(houseHoldModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HouseholdModel houseHoldModel)? newEvent,
  }) {
    return newEvent?.call(houseHoldModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HouseholdModel houseHoldModel)? newEvent,
    required TResult orElse(),
  }) {
    if (newEvent != null) {
      return newEvent(houseHoldModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewEvent value) newEvent,
  }) {
    return newEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewEvent value)? newEvent,
  }) {
    return newEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewEvent value)? newEvent,
    required TResult orElse(),
  }) {
    if (newEvent != null) {
      return newEvent(this);
    }
    return orElse();
  }
}

abstract class _NewEvent extends CustomEvent {
  const factory _NewEvent({required final HouseholdModel houseHoldModel}) =
      _$NewEventImpl;
  const _NewEvent._() : super._();

  @override
  HouseholdModel get houseHoldModel;
  @override
  @JsonKey(ignore: true)
  _$$NewEventImplCopyWith<_$NewEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomBeneficiaryRegistrationState {
  HouseholdModel get houseHoldModel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HouseholdModel houseHoldModel) newState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HouseholdModel houseHoldModel)? newState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HouseholdModel houseHoldModel)? newState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewState value) newState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewState value)? newState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewState value)? newState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomBeneficiaryRegistrationStateCopyWith<
          CustomBeneficiaryRegistrationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomBeneficiaryRegistrationStateCopyWith<$Res> {
  factory $CustomBeneficiaryRegistrationStateCopyWith(
          CustomBeneficiaryRegistrationState value,
          $Res Function(CustomBeneficiaryRegistrationState) then) =
      _$CustomBeneficiaryRegistrationStateCopyWithImpl<$Res,
          CustomBeneficiaryRegistrationState>;
  @useResult
  $Res call({HouseholdModel houseHoldModel});
}

/// @nodoc
class _$CustomBeneficiaryRegistrationStateCopyWithImpl<$Res,
        $Val extends CustomBeneficiaryRegistrationState>
    implements $CustomBeneficiaryRegistrationStateCopyWith<$Res> {
  _$CustomBeneficiaryRegistrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? houseHoldModel = null,
  }) {
    return _then(_value.copyWith(
      houseHoldModel: null == houseHoldModel
          ? _value.houseHoldModel
          : houseHoldModel // ignore: cast_nullable_to_non_nullable
              as HouseholdModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewStateImplCopyWith<$Res>
    implements $CustomBeneficiaryRegistrationStateCopyWith<$Res> {
  factory _$$NewStateImplCopyWith(
          _$NewStateImpl value, $Res Function(_$NewStateImpl) then) =
      __$$NewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HouseholdModel houseHoldModel});
}

/// @nodoc
class __$$NewStateImplCopyWithImpl<$Res>
    extends _$CustomBeneficiaryRegistrationStateCopyWithImpl<$Res,
        _$NewStateImpl> implements _$$NewStateImplCopyWith<$Res> {
  __$$NewStateImplCopyWithImpl(
      _$NewStateImpl _value, $Res Function(_$NewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? houseHoldModel = null,
  }) {
    return _then(_$NewStateImpl(
      houseHoldModel: null == houseHoldModel
          ? _value.houseHoldModel
          : houseHoldModel // ignore: cast_nullable_to_non_nullable
              as HouseholdModel,
    ));
  }
}

/// @nodoc

class _$NewStateImpl extends _NewState {
  const _$NewStateImpl({required this.houseHoldModel}) : super._();

  @override
  final HouseholdModel houseHoldModel;

  @override
  String toString() {
    return 'CustomBeneficiaryRegistrationState.newState(houseHoldModel: $houseHoldModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewStateImpl &&
            (identical(other.houseHoldModel, houseHoldModel) ||
                other.houseHoldModel == houseHoldModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, houseHoldModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewStateImplCopyWith<_$NewStateImpl> get copyWith =>
      __$$NewStateImplCopyWithImpl<_$NewStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HouseholdModel houseHoldModel) newState,
  }) {
    return newState(houseHoldModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HouseholdModel houseHoldModel)? newState,
  }) {
    return newState?.call(houseHoldModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HouseholdModel houseHoldModel)? newState,
    required TResult orElse(),
  }) {
    if (newState != null) {
      return newState(houseHoldModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewState value) newState,
  }) {
    return newState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewState value)? newState,
  }) {
    return newState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewState value)? newState,
    required TResult orElse(),
  }) {
    if (newState != null) {
      return newState(this);
    }
    return orElse();
  }
}

abstract class _NewState extends CustomBeneficiaryRegistrationState {
  const factory _NewState({required final HouseholdModel houseHoldModel}) =
      _$NewStateImpl;
  const _NewState._() : super._();

  @override
  HouseholdModel get houseHoldModel;
  @override
  @JsonKey(ignore: true)
  _$$NewStateImplCopyWith<_$NewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

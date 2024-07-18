// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'closed_household.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClosedHouseholdEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserActionModel userAction, bool isEditing)
        handleSubmit,
    required TResult Function(UserActionModel summary) handleSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserActionModel userAction, bool isEditing)? handleSubmit,
    TResult? Function(UserActionModel summary)? handleSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserActionModel userAction, bool isEditing)? handleSubmit,
    TResult Function(UserActionModel summary)? handleSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClosedHouseholdSubmitEvent value) handleSubmit,
    required TResult Function(ClosedHouseholdSummaryEvent value) handleSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClosedHouseholdSubmitEvent value)? handleSubmit,
    TResult? Function(ClosedHouseholdSummaryEvent value)? handleSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClosedHouseholdSubmitEvent value)? handleSubmit,
    TResult Function(ClosedHouseholdSummaryEvent value)? handleSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosedHouseholdEventCopyWith<$Res> {
  factory $ClosedHouseholdEventCopyWith(ClosedHouseholdEvent value,
          $Res Function(ClosedHouseholdEvent) then) =
      _$ClosedHouseholdEventCopyWithImpl<$Res, ClosedHouseholdEvent>;
}

/// @nodoc
class _$ClosedHouseholdEventCopyWithImpl<$Res,
        $Val extends ClosedHouseholdEvent>
    implements $ClosedHouseholdEventCopyWith<$Res> {
  _$ClosedHouseholdEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ClosedHouseholdSubmitEventImplCopyWith<$Res> {
  factory _$$ClosedHouseholdSubmitEventImplCopyWith(
          _$ClosedHouseholdSubmitEventImpl value,
          $Res Function(_$ClosedHouseholdSubmitEventImpl) then) =
      __$$ClosedHouseholdSubmitEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserActionModel userAction, bool isEditing});
}

/// @nodoc
class __$$ClosedHouseholdSubmitEventImplCopyWithImpl<$Res>
    extends _$ClosedHouseholdEventCopyWithImpl<$Res,
        _$ClosedHouseholdSubmitEventImpl>
    implements _$$ClosedHouseholdSubmitEventImplCopyWith<$Res> {
  __$$ClosedHouseholdSubmitEventImplCopyWithImpl(
      _$ClosedHouseholdSubmitEventImpl _value,
      $Res Function(_$ClosedHouseholdSubmitEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAction = null,
    Object? isEditing = null,
  }) {
    return _then(_$ClosedHouseholdSubmitEventImpl(
      null == userAction
          ? _value.userAction
          : userAction // ignore: cast_nullable_to_non_nullable
              as UserActionModel,
      null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ClosedHouseholdSubmitEventImpl implements ClosedHouseholdSubmitEvent {
  const _$ClosedHouseholdSubmitEventImpl(this.userAction, this.isEditing);

  @override
  final UserActionModel userAction;
  @override
  final bool isEditing;

  @override
  String toString() {
    return 'ClosedHouseholdEvent.handleSubmit(userAction: $userAction, isEditing: $isEditing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosedHouseholdSubmitEventImpl &&
            (identical(other.userAction, userAction) ||
                other.userAction == userAction) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userAction, isEditing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosedHouseholdSubmitEventImplCopyWith<_$ClosedHouseholdSubmitEventImpl>
      get copyWith => __$$ClosedHouseholdSubmitEventImplCopyWithImpl<
          _$ClosedHouseholdSubmitEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserActionModel userAction, bool isEditing)
        handleSubmit,
    required TResult Function(UserActionModel summary) handleSummary,
  }) {
    return handleSubmit(userAction, isEditing);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserActionModel userAction, bool isEditing)? handleSubmit,
    TResult? Function(UserActionModel summary)? handleSummary,
  }) {
    return handleSubmit?.call(userAction, isEditing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserActionModel userAction, bool isEditing)? handleSubmit,
    TResult Function(UserActionModel summary)? handleSummary,
    required TResult orElse(),
  }) {
    if (handleSubmit != null) {
      return handleSubmit(userAction, isEditing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClosedHouseholdSubmitEvent value) handleSubmit,
    required TResult Function(ClosedHouseholdSummaryEvent value) handleSummary,
  }) {
    return handleSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClosedHouseholdSubmitEvent value)? handleSubmit,
    TResult? Function(ClosedHouseholdSummaryEvent value)? handleSummary,
  }) {
    return handleSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClosedHouseholdSubmitEvent value)? handleSubmit,
    TResult Function(ClosedHouseholdSummaryEvent value)? handleSummary,
    required TResult orElse(),
  }) {
    if (handleSubmit != null) {
      return handleSubmit(this);
    }
    return orElse();
  }
}

abstract class ClosedHouseholdSubmitEvent implements ClosedHouseholdEvent {
  const factory ClosedHouseholdSubmitEvent(
          final UserActionModel userAction, final bool isEditing) =
      _$ClosedHouseholdSubmitEventImpl;

  UserActionModel get userAction;
  bool get isEditing;
  @JsonKey(ignore: true)
  _$$ClosedHouseholdSubmitEventImplCopyWith<_$ClosedHouseholdSubmitEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClosedHouseholdSummaryEventImplCopyWith<$Res> {
  factory _$$ClosedHouseholdSummaryEventImplCopyWith(
          _$ClosedHouseholdSummaryEventImpl value,
          $Res Function(_$ClosedHouseholdSummaryEventImpl) then) =
      __$$ClosedHouseholdSummaryEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserActionModel summary});
}

/// @nodoc
class __$$ClosedHouseholdSummaryEventImplCopyWithImpl<$Res>
    extends _$ClosedHouseholdEventCopyWithImpl<$Res,
        _$ClosedHouseholdSummaryEventImpl>
    implements _$$ClosedHouseholdSummaryEventImplCopyWith<$Res> {
  __$$ClosedHouseholdSummaryEventImplCopyWithImpl(
      _$ClosedHouseholdSummaryEventImpl _value,
      $Res Function(_$ClosedHouseholdSummaryEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
  }) {
    return _then(_$ClosedHouseholdSummaryEventImpl(
      null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as UserActionModel,
    ));
  }
}

/// @nodoc

class _$ClosedHouseholdSummaryEventImpl implements ClosedHouseholdSummaryEvent {
  const _$ClosedHouseholdSummaryEventImpl(this.summary);

  @override
  final UserActionModel summary;

  @override
  String toString() {
    return 'ClosedHouseholdEvent.handleSummary(summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosedHouseholdSummaryEventImpl &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, summary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosedHouseholdSummaryEventImplCopyWith<_$ClosedHouseholdSummaryEventImpl>
      get copyWith => __$$ClosedHouseholdSummaryEventImplCopyWithImpl<
          _$ClosedHouseholdSummaryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserActionModel userAction, bool isEditing)
        handleSubmit,
    required TResult Function(UserActionModel summary) handleSummary,
  }) {
    return handleSummary(summary);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserActionModel userAction, bool isEditing)? handleSubmit,
    TResult? Function(UserActionModel summary)? handleSummary,
  }) {
    return handleSummary?.call(summary);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserActionModel userAction, bool isEditing)? handleSubmit,
    TResult Function(UserActionModel summary)? handleSummary,
    required TResult orElse(),
  }) {
    if (handleSummary != null) {
      return handleSummary(summary);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClosedHouseholdSubmitEvent value) handleSubmit,
    required TResult Function(ClosedHouseholdSummaryEvent value) handleSummary,
  }) {
    return handleSummary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClosedHouseholdSubmitEvent value)? handleSubmit,
    TResult? Function(ClosedHouseholdSummaryEvent value)? handleSummary,
  }) {
    return handleSummary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClosedHouseholdSubmitEvent value)? handleSubmit,
    TResult Function(ClosedHouseholdSummaryEvent value)? handleSummary,
    required TResult orElse(),
  }) {
    if (handleSummary != null) {
      return handleSummary(this);
    }
    return orElse();
  }
}

abstract class ClosedHouseholdSummaryEvent implements ClosedHouseholdEvent {
  const factory ClosedHouseholdSummaryEvent(final UserActionModel summary) =
      _$ClosedHouseholdSummaryEventImpl;

  UserActionModel get summary;
  @JsonKey(ignore: true)
  _$$ClosedHouseholdSummaryEventImplCopyWith<_$ClosedHouseholdSummaryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ClosedHouseholdState {
  bool get loading => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  List<UserActionModel>? get userActions => throw _privateConstructorUsedError;
  UserActionModel? get summary => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClosedHouseholdStateCopyWith<ClosedHouseholdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosedHouseholdStateCopyWith<$Res> {
  factory $ClosedHouseholdStateCopyWith(ClosedHouseholdState value,
          $Res Function(ClosedHouseholdState) then) =
      _$ClosedHouseholdStateCopyWithImpl<$Res, ClosedHouseholdState>;
  @useResult
  $Res call(
      {bool loading,
      bool isEditing,
      List<UserActionModel>? userActions,
      UserActionModel? summary});
}

/// @nodoc
class _$ClosedHouseholdStateCopyWithImpl<$Res,
        $Val extends ClosedHouseholdState>
    implements $ClosedHouseholdStateCopyWith<$Res> {
  _$ClosedHouseholdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditing = null,
    Object? userActions = freezed,
    Object? summary = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      userActions: freezed == userActions
          ? _value.userActions
          : userActions // ignore: cast_nullable_to_non_nullable
              as List<UserActionModel>?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as UserActionModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClosedHouseholdStateImplCopyWith<$Res>
    implements $ClosedHouseholdStateCopyWith<$Res> {
  factory _$$ClosedHouseholdStateImplCopyWith(_$ClosedHouseholdStateImpl value,
          $Res Function(_$ClosedHouseholdStateImpl) then) =
      __$$ClosedHouseholdStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool isEditing,
      List<UserActionModel>? userActions,
      UserActionModel? summary});
}

/// @nodoc
class __$$ClosedHouseholdStateImplCopyWithImpl<$Res>
    extends _$ClosedHouseholdStateCopyWithImpl<$Res, _$ClosedHouseholdStateImpl>
    implements _$$ClosedHouseholdStateImplCopyWith<$Res> {
  __$$ClosedHouseholdStateImplCopyWithImpl(_$ClosedHouseholdStateImpl _value,
      $Res Function(_$ClosedHouseholdStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditing = null,
    Object? userActions = freezed,
    Object? summary = freezed,
  }) {
    return _then(_$ClosedHouseholdStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      userActions: freezed == userActions
          ? _value._userActions
          : userActions // ignore: cast_nullable_to_non_nullable
              as List<UserActionModel>?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as UserActionModel?,
    ));
  }
}

/// @nodoc

class _$ClosedHouseholdStateImpl implements _ClosedHouseholdState {
  const _$ClosedHouseholdStateImpl(
      {this.loading = false,
      this.isEditing = false,
      final List<UserActionModel>? userActions,
      this.summary})
      : _userActions = userActions;

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isEditing;
  final List<UserActionModel>? _userActions;
  @override
  List<UserActionModel>? get userActions {
    final value = _userActions;
    if (value == null) return null;
    if (_userActions is EqualUnmodifiableListView) return _userActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserActionModel? summary;

  @override
  String toString() {
    return 'ClosedHouseholdState(loading: $loading, isEditing: $isEditing, userActions: $userActions, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosedHouseholdStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            const DeepCollectionEquality()
                .equals(other._userActions, _userActions) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, isEditing,
      const DeepCollectionEquality().hash(_userActions), summary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosedHouseholdStateImplCopyWith<_$ClosedHouseholdStateImpl>
      get copyWith =>
          __$$ClosedHouseholdStateImplCopyWithImpl<_$ClosedHouseholdStateImpl>(
              this, _$identity);
}

abstract class _ClosedHouseholdState implements ClosedHouseholdState {
  const factory _ClosedHouseholdState(
      {final bool loading,
      final bool isEditing,
      final List<UserActionModel>? userActions,
      final UserActionModel? summary}) = _$ClosedHouseholdStateImpl;

  @override
  bool get loading;
  @override
  bool get isEditing;
  @override
  List<UserActionModel>? get userActions;
  @override
  UserActionModel? get summary;
  @override
  @JsonKey(ignore: true)
  _$$ClosedHouseholdStateImplCopyWith<_$ClosedHouseholdStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

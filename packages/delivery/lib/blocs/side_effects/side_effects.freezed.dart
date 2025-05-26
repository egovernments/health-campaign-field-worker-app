// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'side_effects.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SideEffectsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SideEffectModel sideEffect, bool isEditing)
        handleSubmit,
    required TResult Function(SideEffectSearchModel sideEffectSearch)
        handleSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SideEffectModel sideEffect, bool isEditing)? handleSubmit,
    TResult? Function(SideEffectSearchModel sideEffectSearch)? handleSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SideEffectModel sideEffect, bool isEditing)? handleSubmit,
    TResult Function(SideEffectSearchModel sideEffectSearch)? handleSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SideEffectsSubmitEvent value) handleSubmit,
    required TResult Function(SideEffectsSearchEvent value) handleSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SideEffectsSubmitEvent value)? handleSubmit,
    TResult? Function(SideEffectsSearchEvent value)? handleSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SideEffectsSubmitEvent value)? handleSubmit,
    TResult Function(SideEffectsSearchEvent value)? handleSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SideEffectsEventCopyWith<$Res> {
  factory $SideEffectsEventCopyWith(
          SideEffectsEvent value, $Res Function(SideEffectsEvent) then) =
      _$SideEffectsEventCopyWithImpl<$Res, SideEffectsEvent>;
}

/// @nodoc
class _$SideEffectsEventCopyWithImpl<$Res, $Val extends SideEffectsEvent>
    implements $SideEffectsEventCopyWith<$Res> {
  _$SideEffectsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SideEffectsSubmitEventImplCopyWith<$Res> {
  factory _$$SideEffectsSubmitEventImplCopyWith(
          _$SideEffectsSubmitEventImpl value,
          $Res Function(_$SideEffectsSubmitEventImpl) then) =
      __$$SideEffectsSubmitEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SideEffectModel sideEffect, bool isEditing});
}

/// @nodoc
class __$$SideEffectsSubmitEventImplCopyWithImpl<$Res>
    extends _$SideEffectsEventCopyWithImpl<$Res, _$SideEffectsSubmitEventImpl>
    implements _$$SideEffectsSubmitEventImplCopyWith<$Res> {
  __$$SideEffectsSubmitEventImplCopyWithImpl(
      _$SideEffectsSubmitEventImpl _value,
      $Res Function(_$SideEffectsSubmitEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sideEffect = null,
    Object? isEditing = null,
  }) {
    return _then(_$SideEffectsSubmitEventImpl(
      null == sideEffect
          ? _value.sideEffect
          : sideEffect // ignore: cast_nullable_to_non_nullable
              as SideEffectModel,
      null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SideEffectsSubmitEventImpl implements SideEffectsSubmitEvent {
  const _$SideEffectsSubmitEventImpl(this.sideEffect, this.isEditing);

  @override
  final SideEffectModel sideEffect;
  @override
  final bool isEditing;

  @override
  String toString() {
    return 'SideEffectsEvent.handleSubmit(sideEffect: $sideEffect, isEditing: $isEditing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SideEffectsSubmitEventImpl &&
            (identical(other.sideEffect, sideEffect) ||
                other.sideEffect == sideEffect) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sideEffect, isEditing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SideEffectsSubmitEventImplCopyWith<_$SideEffectsSubmitEventImpl>
      get copyWith => __$$SideEffectsSubmitEventImplCopyWithImpl<
          _$SideEffectsSubmitEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SideEffectModel sideEffect, bool isEditing)
        handleSubmit,
    required TResult Function(SideEffectSearchModel sideEffectSearch)
        handleSearch,
  }) {
    return handleSubmit(sideEffect, isEditing);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SideEffectModel sideEffect, bool isEditing)? handleSubmit,
    TResult? Function(SideEffectSearchModel sideEffectSearch)? handleSearch,
  }) {
    return handleSubmit?.call(sideEffect, isEditing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SideEffectModel sideEffect, bool isEditing)? handleSubmit,
    TResult Function(SideEffectSearchModel sideEffectSearch)? handleSearch,
    required TResult orElse(),
  }) {
    if (handleSubmit != null) {
      return handleSubmit(sideEffect, isEditing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SideEffectsSubmitEvent value) handleSubmit,
    required TResult Function(SideEffectsSearchEvent value) handleSearch,
  }) {
    return handleSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SideEffectsSubmitEvent value)? handleSubmit,
    TResult? Function(SideEffectsSearchEvent value)? handleSearch,
  }) {
    return handleSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SideEffectsSubmitEvent value)? handleSubmit,
    TResult Function(SideEffectsSearchEvent value)? handleSearch,
    required TResult orElse(),
  }) {
    if (handleSubmit != null) {
      return handleSubmit(this);
    }
    return orElse();
  }
}

abstract class SideEffectsSubmitEvent implements SideEffectsEvent {
  const factory SideEffectsSubmitEvent(
          final SideEffectModel sideEffect, final bool isEditing) =
      _$SideEffectsSubmitEventImpl;

  SideEffectModel get sideEffect;
  bool get isEditing;
  @JsonKey(ignore: true)
  _$$SideEffectsSubmitEventImplCopyWith<_$SideEffectsSubmitEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SideEffectsSearchEventImplCopyWith<$Res> {
  factory _$$SideEffectsSearchEventImplCopyWith(
          _$SideEffectsSearchEventImpl value,
          $Res Function(_$SideEffectsSearchEventImpl) then) =
      __$$SideEffectsSearchEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SideEffectSearchModel sideEffectSearch});
}

/// @nodoc
class __$$SideEffectsSearchEventImplCopyWithImpl<$Res>
    extends _$SideEffectsEventCopyWithImpl<$Res, _$SideEffectsSearchEventImpl>
    implements _$$SideEffectsSearchEventImplCopyWith<$Res> {
  __$$SideEffectsSearchEventImplCopyWithImpl(
      _$SideEffectsSearchEventImpl _value,
      $Res Function(_$SideEffectsSearchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sideEffectSearch = null,
  }) {
    return _then(_$SideEffectsSearchEventImpl(
      null == sideEffectSearch
          ? _value.sideEffectSearch
          : sideEffectSearch // ignore: cast_nullable_to_non_nullable
              as SideEffectSearchModel,
    ));
  }
}

/// @nodoc

class _$SideEffectsSearchEventImpl implements SideEffectsSearchEvent {
  const _$SideEffectsSearchEventImpl(this.sideEffectSearch);

  @override
  final SideEffectSearchModel sideEffectSearch;

  @override
  String toString() {
    return 'SideEffectsEvent.handleSearch(sideEffectSearch: $sideEffectSearch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SideEffectsSearchEventImpl &&
            (identical(other.sideEffectSearch, sideEffectSearch) ||
                other.sideEffectSearch == sideEffectSearch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sideEffectSearch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SideEffectsSearchEventImplCopyWith<_$SideEffectsSearchEventImpl>
      get copyWith => __$$SideEffectsSearchEventImplCopyWithImpl<
          _$SideEffectsSearchEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SideEffectModel sideEffect, bool isEditing)
        handleSubmit,
    required TResult Function(SideEffectSearchModel sideEffectSearch)
        handleSearch,
  }) {
    return handleSearch(sideEffectSearch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SideEffectModel sideEffect, bool isEditing)? handleSubmit,
    TResult? Function(SideEffectSearchModel sideEffectSearch)? handleSearch,
  }) {
    return handleSearch?.call(sideEffectSearch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SideEffectModel sideEffect, bool isEditing)? handleSubmit,
    TResult Function(SideEffectSearchModel sideEffectSearch)? handleSearch,
    required TResult orElse(),
  }) {
    if (handleSearch != null) {
      return handleSearch(sideEffectSearch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SideEffectsSubmitEvent value) handleSubmit,
    required TResult Function(SideEffectsSearchEvent value) handleSearch,
  }) {
    return handleSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SideEffectsSubmitEvent value)? handleSubmit,
    TResult? Function(SideEffectsSearchEvent value)? handleSearch,
  }) {
    return handleSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SideEffectsSubmitEvent value)? handleSubmit,
    TResult Function(SideEffectsSearchEvent value)? handleSearch,
    required TResult orElse(),
  }) {
    if (handleSearch != null) {
      return handleSearch(this);
    }
    return orElse();
  }
}

abstract class SideEffectsSearchEvent implements SideEffectsEvent {
  const factory SideEffectsSearchEvent(
          final SideEffectSearchModel sideEffectSearch) =
      _$SideEffectsSearchEventImpl;

  SideEffectSearchModel get sideEffectSearch;
  @JsonKey(ignore: true)
  _$$SideEffectsSearchEventImplCopyWith<_$SideEffectsSearchEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SideEffectsState {
  bool get loading => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  List<SideEffectModel>? get sideEffects => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SideEffectsStateCopyWith<SideEffectsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SideEffectsStateCopyWith<$Res> {
  factory $SideEffectsStateCopyWith(
          SideEffectsState value, $Res Function(SideEffectsState) then) =
      _$SideEffectsStateCopyWithImpl<$Res, SideEffectsState>;
  @useResult
  $Res call({bool loading, bool isEditing, List<SideEffectModel>? sideEffects});
}

/// @nodoc
class _$SideEffectsStateCopyWithImpl<$Res, $Val extends SideEffectsState>
    implements $SideEffectsStateCopyWith<$Res> {
  _$SideEffectsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditing = null,
    Object? sideEffects = freezed,
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
      sideEffects: freezed == sideEffects
          ? _value.sideEffects
          : sideEffects // ignore: cast_nullable_to_non_nullable
              as List<SideEffectModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SideEffectsStateImplCopyWith<$Res>
    implements $SideEffectsStateCopyWith<$Res> {
  factory _$$SideEffectsStateImplCopyWith(_$SideEffectsStateImpl value,
          $Res Function(_$SideEffectsStateImpl) then) =
      __$$SideEffectsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, bool isEditing, List<SideEffectModel>? sideEffects});
}

/// @nodoc
class __$$SideEffectsStateImplCopyWithImpl<$Res>
    extends _$SideEffectsStateCopyWithImpl<$Res, _$SideEffectsStateImpl>
    implements _$$SideEffectsStateImplCopyWith<$Res> {
  __$$SideEffectsStateImplCopyWithImpl(_$SideEffectsStateImpl _value,
      $Res Function(_$SideEffectsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditing = null,
    Object? sideEffects = freezed,
  }) {
    return _then(_$SideEffectsStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      sideEffects: freezed == sideEffects
          ? _value._sideEffects
          : sideEffects // ignore: cast_nullable_to_non_nullable
              as List<SideEffectModel>?,
    ));
  }
}

/// @nodoc

class _$SideEffectsStateImpl implements _SideEffectsState {
  const _$SideEffectsStateImpl(
      {this.loading = false,
      this.isEditing = false,
      final List<SideEffectModel>? sideEffects})
      : _sideEffects = sideEffects;

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isEditing;
  final List<SideEffectModel>? _sideEffects;
  @override
  List<SideEffectModel>? get sideEffects {
    final value = _sideEffects;
    if (value == null) return null;
    if (_sideEffects is EqualUnmodifiableListView) return _sideEffects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SideEffectsState(loading: $loading, isEditing: $isEditing, sideEffects: $sideEffects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SideEffectsStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            const DeepCollectionEquality()
                .equals(other._sideEffects, _sideEffects));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, isEditing,
      const DeepCollectionEquality().hash(_sideEffects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SideEffectsStateImplCopyWith<_$SideEffectsStateImpl> get copyWith =>
      __$$SideEffectsStateImplCopyWithImpl<_$SideEffectsStateImpl>(
          this, _$identity);
}

abstract class _SideEffectsState implements SideEffectsState {
  const factory _SideEffectsState(
      {final bool loading,
      final bool isEditing,
      final List<SideEffectModel>? sideEffects}) = _$SideEffectsStateImpl;

  @override
  bool get loading;
  @override
  bool get isEditing;
  @override
  List<SideEffectModel>? get sideEffects;
  @override
  @JsonKey(ignore: true)
  _$$SideEffectsStateImplCopyWith<_$SideEffectsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

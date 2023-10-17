// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'side_effects.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$SideEffectsSubmitEventCopyWith<$Res> {
  factory _$$SideEffectsSubmitEventCopyWith(_$SideEffectsSubmitEvent value,
          $Res Function(_$SideEffectsSubmitEvent) then) =
      __$$SideEffectsSubmitEventCopyWithImpl<$Res>;
  @useResult
  $Res call({SideEffectModel sideEffect, bool isEditing});
}

/// @nodoc
class __$$SideEffectsSubmitEventCopyWithImpl<$Res>
    extends _$SideEffectsEventCopyWithImpl<$Res, _$SideEffectsSubmitEvent>
    implements _$$SideEffectsSubmitEventCopyWith<$Res> {
  __$$SideEffectsSubmitEventCopyWithImpl(_$SideEffectsSubmitEvent _value,
      $Res Function(_$SideEffectsSubmitEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sideEffect = null,
    Object? isEditing = null,
  }) {
    return _then(_$SideEffectsSubmitEvent(
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

class _$SideEffectsSubmitEvent implements SideEffectsSubmitEvent {
  const _$SideEffectsSubmitEvent(this.sideEffect, this.isEditing);

  @override
  final SideEffectModel sideEffect;
  @override
  final bool isEditing;

  @override
  String toString() {
    return 'SideEffectsEvent.handleSubmit(sideEffect: $sideEffect, isEditing: $isEditing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SideEffectsSubmitEvent &&
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
  _$$SideEffectsSubmitEventCopyWith<_$SideEffectsSubmitEvent> get copyWith =>
      __$$SideEffectsSubmitEventCopyWithImpl<_$SideEffectsSubmitEvent>(
          this, _$identity);

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
      _$SideEffectsSubmitEvent;

  SideEffectModel get sideEffect;
  bool get isEditing;
  @JsonKey(ignore: true)
  _$$SideEffectsSubmitEventCopyWith<_$SideEffectsSubmitEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SideEffectsSearchEventCopyWith<$Res> {
  factory _$$SideEffectsSearchEventCopyWith(_$SideEffectsSearchEvent value,
          $Res Function(_$SideEffectsSearchEvent) then) =
      __$$SideEffectsSearchEventCopyWithImpl<$Res>;
  @useResult
  $Res call({SideEffectSearchModel sideEffectSearch});
}

/// @nodoc
class __$$SideEffectsSearchEventCopyWithImpl<$Res>
    extends _$SideEffectsEventCopyWithImpl<$Res, _$SideEffectsSearchEvent>
    implements _$$SideEffectsSearchEventCopyWith<$Res> {
  __$$SideEffectsSearchEventCopyWithImpl(_$SideEffectsSearchEvent _value,
      $Res Function(_$SideEffectsSearchEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sideEffectSearch = null,
  }) {
    return _then(_$SideEffectsSearchEvent(
      null == sideEffectSearch
          ? _value.sideEffectSearch
          : sideEffectSearch // ignore: cast_nullable_to_non_nullable
              as SideEffectSearchModel,
    ));
  }
}

/// @nodoc

class _$SideEffectsSearchEvent implements SideEffectsSearchEvent {
  const _$SideEffectsSearchEvent(this.sideEffectSearch);

  @override
  final SideEffectSearchModel sideEffectSearch;

  @override
  String toString() {
    return 'SideEffectsEvent.handleSearch(sideEffectSearch: $sideEffectSearch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SideEffectsSearchEvent &&
            (identical(other.sideEffectSearch, sideEffectSearch) ||
                other.sideEffectSearch == sideEffectSearch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sideEffectSearch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SideEffectsSearchEventCopyWith<_$SideEffectsSearchEvent> get copyWith =>
      __$$SideEffectsSearchEventCopyWithImpl<_$SideEffectsSearchEvent>(
          this, _$identity);

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
      final SideEffectSearchModel sideEffectSearch) = _$SideEffectsSearchEvent;

  SideEffectSearchModel get sideEffectSearch;
  @JsonKey(ignore: true)
  _$$SideEffectsSearchEventCopyWith<_$SideEffectsSearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
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
abstract class _$$_SideEffectsStateCopyWith<$Res>
    implements $SideEffectsStateCopyWith<$Res> {
  factory _$$_SideEffectsStateCopyWith(
          _$_SideEffectsState value, $Res Function(_$_SideEffectsState) then) =
      __$$_SideEffectsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, bool isEditing, List<SideEffectModel>? sideEffects});
}

/// @nodoc
class __$$_SideEffectsStateCopyWithImpl<$Res>
    extends _$SideEffectsStateCopyWithImpl<$Res, _$_SideEffectsState>
    implements _$$_SideEffectsStateCopyWith<$Res> {
  __$$_SideEffectsStateCopyWithImpl(
      _$_SideEffectsState _value, $Res Function(_$_SideEffectsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditing = null,
    Object? sideEffects = freezed,
  }) {
    return _then(_$_SideEffectsState(
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

class _$_SideEffectsState implements _SideEffectsState {
  const _$_SideEffectsState(
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
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SideEffectsState(loading: $loading, isEditing: $isEditing, sideEffects: $sideEffects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SideEffectsState &&
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
  _$$_SideEffectsStateCopyWith<_$_SideEffectsState> get copyWith =>
      __$$_SideEffectsStateCopyWithImpl<_$_SideEffectsState>(this, _$identity);
}

abstract class _SideEffectsState implements SideEffectsState {
  const factory _SideEffectsState(
      {final bool loading,
      final bool isEditing,
      final List<SideEffectModel>? sideEffects}) = _$_SideEffectsState;

  @override
  bool get loading;
  @override
  bool get isEditing;
  @override
  List<SideEffectModel>? get sideEffects;
  @override
  @JsonKey(ignore: true)
  _$$_SideEffectsStateCopyWith<_$_SideEffectsState> get copyWith =>
      throw _privateConstructorUsedError;
}

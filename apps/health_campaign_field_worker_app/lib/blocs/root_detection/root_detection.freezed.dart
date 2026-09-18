// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'root_detection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RootDetectionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RootDetectionLoadedEvent value) onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RootDetectionLoadedEvent value)? onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RootDetectionLoadedEvent value)? onLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootDetectionEventCopyWith<$Res> {
  factory $RootDetectionEventCopyWith(
          RootDetectionEvent value, $Res Function(RootDetectionEvent) then) =
      _$RootDetectionEventCopyWithImpl<$Res, RootDetectionEvent>;
}

/// @nodoc
class _$RootDetectionEventCopyWithImpl<$Res, $Val extends RootDetectionEvent>
    implements $RootDetectionEventCopyWith<$Res> {
  _$RootDetectionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RootDetectionLoadedEventImplCopyWith<$Res> {
  factory _$$RootDetectionLoadedEventImplCopyWith(
          _$RootDetectionLoadedEventImpl value,
          $Res Function(_$RootDetectionLoadedEventImpl) then) =
      __$$RootDetectionLoadedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RootDetectionLoadedEventImplCopyWithImpl<$Res>
    extends _$RootDetectionEventCopyWithImpl<$Res,
        _$RootDetectionLoadedEventImpl>
    implements _$$RootDetectionLoadedEventImplCopyWith<$Res> {
  __$$RootDetectionLoadedEventImplCopyWithImpl(
      _$RootDetectionLoadedEventImpl _value,
      $Res Function(_$RootDetectionLoadedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RootDetectionLoadedEventImpl
    with DiagnosticableTreeMixin
    implements RootDetectionLoadedEvent {
  const _$RootDetectionLoadedEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RootDetectionEvent.onLoaded()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'RootDetectionEvent.onLoaded'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RootDetectionLoadedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoaded,
  }) {
    return onLoaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoaded,
  }) {
    return onLoaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoaded,
    required TResult orElse(),
  }) {
    if (onLoaded != null) {
      return onLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RootDetectionLoadedEvent value) onLoaded,
  }) {
    return onLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RootDetectionLoadedEvent value)? onLoaded,
  }) {
    return onLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RootDetectionLoadedEvent value)? onLoaded,
    required TResult orElse(),
  }) {
    if (onLoaded != null) {
      return onLoaded(this);
    }
    return orElse();
  }
}

abstract class RootDetectionLoadedEvent implements RootDetectionEvent {
  const factory RootDetectionLoadedEvent() = _$RootDetectionLoadedEventImpl;
}

/// @nodoc
mixin _$RootDetectionState {
  bool? get isRooted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RootDetectionStateCopyWith<RootDetectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootDetectionStateCopyWith<$Res> {
  factory $RootDetectionStateCopyWith(
          RootDetectionState value, $Res Function(RootDetectionState) then) =
      _$RootDetectionStateCopyWithImpl<$Res, RootDetectionState>;
  @useResult
  $Res call({bool? isRooted});
}

/// @nodoc
class _$RootDetectionStateCopyWithImpl<$Res, $Val extends RootDetectionState>
    implements $RootDetectionStateCopyWith<$Res> {
  _$RootDetectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRooted = freezed,
  }) {
    return _then(_value.copyWith(
      isRooted: freezed == isRooted
          ? _value.isRooted
          : isRooted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RootDetectionStateImplCopyWith<$Res>
    implements $RootDetectionStateCopyWith<$Res> {
  factory _$$RootDetectionStateImplCopyWith(_$RootDetectionStateImpl value,
          $Res Function(_$RootDetectionStateImpl) then) =
      __$$RootDetectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isRooted});
}

/// @nodoc
class __$$RootDetectionStateImplCopyWithImpl<$Res>
    extends _$RootDetectionStateCopyWithImpl<$Res, _$RootDetectionStateImpl>
    implements _$$RootDetectionStateImplCopyWith<$Res> {
  __$$RootDetectionStateImplCopyWithImpl(_$RootDetectionStateImpl _value,
      $Res Function(_$RootDetectionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRooted = freezed,
  }) {
    return _then(_$RootDetectionStateImpl(
      isRooted: freezed == isRooted
          ? _value.isRooted
          : isRooted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$RootDetectionStateImpl
    with DiagnosticableTreeMixin
    implements _RootDetectionState {
  const _$RootDetectionStateImpl({this.isRooted});

  @override
  final bool? isRooted;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RootDetectionState(isRooted: $isRooted)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RootDetectionState'))
      ..add(DiagnosticsProperty('isRooted', isRooted));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RootDetectionStateImpl &&
            (identical(other.isRooted, isRooted) ||
                other.isRooted == isRooted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRooted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RootDetectionStateImplCopyWith<_$RootDetectionStateImpl> get copyWith =>
      __$$RootDetectionStateImplCopyWithImpl<_$RootDetectionStateImpl>(
          this, _$identity);
}

abstract class _RootDetectionState implements RootDetectionState {
  const factory _RootDetectionState({final bool? isRooted}) =
      _$RootDetectionStateImpl;

  @override
  bool? get isRooted;
  @override
  @JsonKey(ignore: true)
  _$$RootDetectionStateImplCopyWith<_$RootDetectionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boundary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BoundaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(String code, int boundaryNum) search,
    required TResult Function(String label, BoundaryModel selectedBoundary)
        select,
    required TResult Function(String code) findBoundary,
    required TResult Function() submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String code, int boundaryNum)? search,
    TResult? Function(String label, BoundaryModel selectedBoundary)? select,
    TResult? Function(String code)? findBoundary,
    TResult? Function()? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String code, int boundaryNum)? search,
    TResult Function(String label, BoundaryModel selectedBoundary)? select,
    TResult Function(String code)? findBoundary,
    TResult Function()? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoundaryResetEvent value) reset,
    required TResult Function(BoundarySearchEvent value) search,
    required TResult Function(BoundarySelectEvent value) select,
    required TResult Function(BoundaryFindEvent value) findBoundary,
    required TResult Function(BoundarySubmitEvent value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BoundaryResetEvent value)? reset,
    TResult? Function(BoundarySearchEvent value)? search,
    TResult? Function(BoundarySelectEvent value)? select,
    TResult? Function(BoundaryFindEvent value)? findBoundary,
    TResult? Function(BoundarySubmitEvent value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoundaryResetEvent value)? reset,
    TResult Function(BoundarySearchEvent value)? search,
    TResult Function(BoundarySelectEvent value)? select,
    TResult Function(BoundaryFindEvent value)? findBoundary,
    TResult Function(BoundarySubmitEvent value)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoundaryEventCopyWith<$Res> {
  factory $BoundaryEventCopyWith(
          BoundaryEvent value, $Res Function(BoundaryEvent) then) =
      _$BoundaryEventCopyWithImpl<$Res, BoundaryEvent>;
}

/// @nodoc
class _$BoundaryEventCopyWithImpl<$Res, $Val extends BoundaryEvent>
    implements $BoundaryEventCopyWith<$Res> {
  _$BoundaryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BoundaryResetEventImplCopyWith<$Res> {
  factory _$$BoundaryResetEventImplCopyWith(_$BoundaryResetEventImpl value,
          $Res Function(_$BoundaryResetEventImpl) then) =
      __$$BoundaryResetEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BoundaryResetEventImplCopyWithImpl<$Res>
    extends _$BoundaryEventCopyWithImpl<$Res, _$BoundaryResetEventImpl>
    implements _$$BoundaryResetEventImplCopyWith<$Res> {
  __$$BoundaryResetEventImplCopyWithImpl(_$BoundaryResetEventImpl _value,
      $Res Function(_$BoundaryResetEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BoundaryResetEventImpl implements BoundaryResetEvent {
  const _$BoundaryResetEventImpl();

  @override
  String toString() {
    return 'BoundaryEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BoundaryResetEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(String code, int boundaryNum) search,
    required TResult Function(String label, BoundaryModel selectedBoundary)
        select,
    required TResult Function(String code) findBoundary,
    required TResult Function() submit,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String code, int boundaryNum)? search,
    TResult? Function(String label, BoundaryModel selectedBoundary)? select,
    TResult? Function(String code)? findBoundary,
    TResult? Function()? submit,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String code, int boundaryNum)? search,
    TResult Function(String label, BoundaryModel selectedBoundary)? select,
    TResult Function(String code)? findBoundary,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoundaryResetEvent value) reset,
    required TResult Function(BoundarySearchEvent value) search,
    required TResult Function(BoundarySelectEvent value) select,
    required TResult Function(BoundaryFindEvent value) findBoundary,
    required TResult Function(BoundarySubmitEvent value) submit,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BoundaryResetEvent value)? reset,
    TResult? Function(BoundarySearchEvent value)? search,
    TResult? Function(BoundarySelectEvent value)? select,
    TResult? Function(BoundaryFindEvent value)? findBoundary,
    TResult? Function(BoundarySubmitEvent value)? submit,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoundaryResetEvent value)? reset,
    TResult Function(BoundarySearchEvent value)? search,
    TResult Function(BoundarySelectEvent value)? select,
    TResult Function(BoundaryFindEvent value)? findBoundary,
    TResult Function(BoundarySubmitEvent value)? submit,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class BoundaryResetEvent implements BoundaryEvent {
  const factory BoundaryResetEvent() = _$BoundaryResetEventImpl;
}

/// @nodoc
abstract class _$$BoundarySearchEventImplCopyWith<$Res> {
  factory _$$BoundarySearchEventImplCopyWith(_$BoundarySearchEventImpl value,
          $Res Function(_$BoundarySearchEventImpl) then) =
      __$$BoundarySearchEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code, int boundaryNum});
}

/// @nodoc
class __$$BoundarySearchEventImplCopyWithImpl<$Res>
    extends _$BoundaryEventCopyWithImpl<$Res, _$BoundarySearchEventImpl>
    implements _$$BoundarySearchEventImplCopyWith<$Res> {
  __$$BoundarySearchEventImplCopyWithImpl(_$BoundarySearchEventImpl _value,
      $Res Function(_$BoundarySearchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? boundaryNum = null,
  }) {
    return _then(_$BoundarySearchEventImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      boundaryNum: null == boundaryNum
          ? _value.boundaryNum
          : boundaryNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BoundarySearchEventImpl implements BoundarySearchEvent {
  const _$BoundarySearchEventImpl(
      {required this.code, required this.boundaryNum});

  @override
  final String code;
  @override
  final int boundaryNum;

  @override
  String toString() {
    return 'BoundaryEvent.search(code: $code, boundaryNum: $boundaryNum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoundarySearchEventImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.boundaryNum, boundaryNum) ||
                other.boundaryNum == boundaryNum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, boundaryNum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoundarySearchEventImplCopyWith<_$BoundarySearchEventImpl> get copyWith =>
      __$$BoundarySearchEventImplCopyWithImpl<_$BoundarySearchEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(String code, int boundaryNum) search,
    required TResult Function(String label, BoundaryModel selectedBoundary)
        select,
    required TResult Function(String code) findBoundary,
    required TResult Function() submit,
  }) {
    return search(code, boundaryNum);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String code, int boundaryNum)? search,
    TResult? Function(String label, BoundaryModel selectedBoundary)? select,
    TResult? Function(String code)? findBoundary,
    TResult? Function()? submit,
  }) {
    return search?.call(code, boundaryNum);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String code, int boundaryNum)? search,
    TResult Function(String label, BoundaryModel selectedBoundary)? select,
    TResult Function(String code)? findBoundary,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(code, boundaryNum);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoundaryResetEvent value) reset,
    required TResult Function(BoundarySearchEvent value) search,
    required TResult Function(BoundarySelectEvent value) select,
    required TResult Function(BoundaryFindEvent value) findBoundary,
    required TResult Function(BoundarySubmitEvent value) submit,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BoundaryResetEvent value)? reset,
    TResult? Function(BoundarySearchEvent value)? search,
    TResult? Function(BoundarySelectEvent value)? select,
    TResult? Function(BoundaryFindEvent value)? findBoundary,
    TResult? Function(BoundarySubmitEvent value)? submit,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoundaryResetEvent value)? reset,
    TResult Function(BoundarySearchEvent value)? search,
    TResult Function(BoundarySelectEvent value)? select,
    TResult Function(BoundaryFindEvent value)? findBoundary,
    TResult Function(BoundarySubmitEvent value)? submit,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class BoundarySearchEvent implements BoundaryEvent {
  const factory BoundarySearchEvent(
      {required final String code,
      required final int boundaryNum}) = _$BoundarySearchEventImpl;

  String get code;
  int get boundaryNum;
  @JsonKey(ignore: true)
  _$$BoundarySearchEventImplCopyWith<_$BoundarySearchEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BoundarySelectEventImplCopyWith<$Res> {
  factory _$$BoundarySelectEventImplCopyWith(_$BoundarySelectEventImpl value,
          $Res Function(_$BoundarySelectEventImpl) then) =
      __$$BoundarySelectEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String label, BoundaryModel selectedBoundary});
}

/// @nodoc
class __$$BoundarySelectEventImplCopyWithImpl<$Res>
    extends _$BoundaryEventCopyWithImpl<$Res, _$BoundarySelectEventImpl>
    implements _$$BoundarySelectEventImplCopyWith<$Res> {
  __$$BoundarySelectEventImplCopyWithImpl(_$BoundarySelectEventImpl _value,
      $Res Function(_$BoundarySelectEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? selectedBoundary = null,
  }) {
    return _then(_$BoundarySelectEventImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      selectedBoundary: null == selectedBoundary
          ? _value.selectedBoundary
          : selectedBoundary // ignore: cast_nullable_to_non_nullable
              as BoundaryModel,
    ));
  }
}

/// @nodoc

class _$BoundarySelectEventImpl implements BoundarySelectEvent {
  const _$BoundarySelectEventImpl(
      {required this.label, required this.selectedBoundary});

  @override
  final String label;
  @override
  final BoundaryModel selectedBoundary;

  @override
  String toString() {
    return 'BoundaryEvent.select(label: $label, selectedBoundary: $selectedBoundary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoundarySelectEventImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.selectedBoundary, selectedBoundary) ||
                other.selectedBoundary == selectedBoundary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, selectedBoundary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoundarySelectEventImplCopyWith<_$BoundarySelectEventImpl> get copyWith =>
      __$$BoundarySelectEventImplCopyWithImpl<_$BoundarySelectEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(String code, int boundaryNum) search,
    required TResult Function(String label, BoundaryModel selectedBoundary)
        select,
    required TResult Function(String code) findBoundary,
    required TResult Function() submit,
  }) {
    return select(label, selectedBoundary);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String code, int boundaryNum)? search,
    TResult? Function(String label, BoundaryModel selectedBoundary)? select,
    TResult? Function(String code)? findBoundary,
    TResult? Function()? submit,
  }) {
    return select?.call(label, selectedBoundary);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String code, int boundaryNum)? search,
    TResult Function(String label, BoundaryModel selectedBoundary)? select,
    TResult Function(String code)? findBoundary,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(label, selectedBoundary);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoundaryResetEvent value) reset,
    required TResult Function(BoundarySearchEvent value) search,
    required TResult Function(BoundarySelectEvent value) select,
    required TResult Function(BoundaryFindEvent value) findBoundary,
    required TResult Function(BoundarySubmitEvent value) submit,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BoundaryResetEvent value)? reset,
    TResult? Function(BoundarySearchEvent value)? search,
    TResult? Function(BoundarySelectEvent value)? select,
    TResult? Function(BoundaryFindEvent value)? findBoundary,
    TResult? Function(BoundarySubmitEvent value)? submit,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoundaryResetEvent value)? reset,
    TResult Function(BoundarySearchEvent value)? search,
    TResult Function(BoundarySelectEvent value)? select,
    TResult Function(BoundaryFindEvent value)? findBoundary,
    TResult Function(BoundarySubmitEvent value)? submit,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }
}

abstract class BoundarySelectEvent implements BoundaryEvent {
  const factory BoundarySelectEvent(
          {required final String label,
          required final BoundaryModel selectedBoundary}) =
      _$BoundarySelectEventImpl;

  String get label;
  BoundaryModel get selectedBoundary;
  @JsonKey(ignore: true)
  _$$BoundarySelectEventImplCopyWith<_$BoundarySelectEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BoundaryFindEventImplCopyWith<$Res> {
  factory _$$BoundaryFindEventImplCopyWith(_$BoundaryFindEventImpl value,
          $Res Function(_$BoundaryFindEventImpl) then) =
      __$$BoundaryFindEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$BoundaryFindEventImplCopyWithImpl<$Res>
    extends _$BoundaryEventCopyWithImpl<$Res, _$BoundaryFindEventImpl>
    implements _$$BoundaryFindEventImplCopyWith<$Res> {
  __$$BoundaryFindEventImplCopyWithImpl(_$BoundaryFindEventImpl _value,
      $Res Function(_$BoundaryFindEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$BoundaryFindEventImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BoundaryFindEventImpl implements BoundaryFindEvent {
  const _$BoundaryFindEventImpl({required this.code});

  @override
  final String code;

  @override
  String toString() {
    return 'BoundaryEvent.findBoundary(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoundaryFindEventImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoundaryFindEventImplCopyWith<_$BoundaryFindEventImpl> get copyWith =>
      __$$BoundaryFindEventImplCopyWithImpl<_$BoundaryFindEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(String code, int boundaryNum) search,
    required TResult Function(String label, BoundaryModel selectedBoundary)
        select,
    required TResult Function(String code) findBoundary,
    required TResult Function() submit,
  }) {
    return findBoundary(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String code, int boundaryNum)? search,
    TResult? Function(String label, BoundaryModel selectedBoundary)? select,
    TResult? Function(String code)? findBoundary,
    TResult? Function()? submit,
  }) {
    return findBoundary?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String code, int boundaryNum)? search,
    TResult Function(String label, BoundaryModel selectedBoundary)? select,
    TResult Function(String code)? findBoundary,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (findBoundary != null) {
      return findBoundary(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoundaryResetEvent value) reset,
    required TResult Function(BoundarySearchEvent value) search,
    required TResult Function(BoundarySelectEvent value) select,
    required TResult Function(BoundaryFindEvent value) findBoundary,
    required TResult Function(BoundarySubmitEvent value) submit,
  }) {
    return findBoundary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BoundaryResetEvent value)? reset,
    TResult? Function(BoundarySearchEvent value)? search,
    TResult? Function(BoundarySelectEvent value)? select,
    TResult? Function(BoundaryFindEvent value)? findBoundary,
    TResult? Function(BoundarySubmitEvent value)? submit,
  }) {
    return findBoundary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoundaryResetEvent value)? reset,
    TResult Function(BoundarySearchEvent value)? search,
    TResult Function(BoundarySelectEvent value)? select,
    TResult Function(BoundaryFindEvent value)? findBoundary,
    TResult Function(BoundarySubmitEvent value)? submit,
    required TResult orElse(),
  }) {
    if (findBoundary != null) {
      return findBoundary(this);
    }
    return orElse();
  }
}

abstract class BoundaryFindEvent implements BoundaryEvent {
  const factory BoundaryFindEvent({required final String code}) =
      _$BoundaryFindEventImpl;

  String get code;
  @JsonKey(ignore: true)
  _$$BoundaryFindEventImplCopyWith<_$BoundaryFindEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BoundarySubmitEventImplCopyWith<$Res> {
  factory _$$BoundarySubmitEventImplCopyWith(_$BoundarySubmitEventImpl value,
          $Res Function(_$BoundarySubmitEventImpl) then) =
      __$$BoundarySubmitEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BoundarySubmitEventImplCopyWithImpl<$Res>
    extends _$BoundaryEventCopyWithImpl<$Res, _$BoundarySubmitEventImpl>
    implements _$$BoundarySubmitEventImplCopyWith<$Res> {
  __$$BoundarySubmitEventImplCopyWithImpl(_$BoundarySubmitEventImpl _value,
      $Res Function(_$BoundarySubmitEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BoundarySubmitEventImpl implements BoundarySubmitEvent {
  const _$BoundarySubmitEventImpl();

  @override
  String toString() {
    return 'BoundaryEvent.submit()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoundarySubmitEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(String code, int boundaryNum) search,
    required TResult Function(String label, BoundaryModel selectedBoundary)
        select,
    required TResult Function(String code) findBoundary,
    required TResult Function() submit,
  }) {
    return submit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String code, int boundaryNum)? search,
    TResult? Function(String label, BoundaryModel selectedBoundary)? select,
    TResult? Function(String code)? findBoundary,
    TResult? Function()? submit,
  }) {
    return submit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String code, int boundaryNum)? search,
    TResult Function(String label, BoundaryModel selectedBoundary)? select,
    TResult Function(String code)? findBoundary,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoundaryResetEvent value) reset,
    required TResult Function(BoundarySearchEvent value) search,
    required TResult Function(BoundarySelectEvent value) select,
    required TResult Function(BoundaryFindEvent value) findBoundary,
    required TResult Function(BoundarySubmitEvent value) submit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BoundaryResetEvent value)? reset,
    TResult? Function(BoundarySearchEvent value)? search,
    TResult? Function(BoundarySelectEvent value)? select,
    TResult? Function(BoundaryFindEvent value)? findBoundary,
    TResult? Function(BoundarySubmitEvent value)? submit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoundaryResetEvent value)? reset,
    TResult Function(BoundarySearchEvent value)? search,
    TResult Function(BoundarySelectEvent value)? select,
    TResult Function(BoundaryFindEvent value)? findBoundary,
    TResult Function(BoundarySubmitEvent value)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class BoundarySubmitEvent implements BoundaryEvent {
  const factory BoundarySubmitEvent() = _$BoundarySubmitEventImpl;
}

/// @nodoc
mixin _$BoundaryState {
  bool get loading => throw _privateConstructorUsedError;
  List<BoundaryModel> get boundaryList => throw _privateConstructorUsedError;
  List<BoundaryModel> get projectBoundaryList =>
      throw _privateConstructorUsedError;
  Map<String, BoundaryModel?> get selectedBoundaryMap =>
      throw _privateConstructorUsedError;
  bool get hasSubmitted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoundaryStateCopyWith<BoundaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoundaryStateCopyWith<$Res> {
  factory $BoundaryStateCopyWith(
          BoundaryState value, $Res Function(BoundaryState) then) =
      _$BoundaryStateCopyWithImpl<$Res, BoundaryState>;
  @useResult
  $Res call(
      {bool loading,
      List<BoundaryModel> boundaryList,
      List<BoundaryModel> projectBoundaryList,
      Map<String, BoundaryModel?> selectedBoundaryMap,
      bool hasSubmitted});
}

/// @nodoc
class _$BoundaryStateCopyWithImpl<$Res, $Val extends BoundaryState>
    implements $BoundaryStateCopyWith<$Res> {
  _$BoundaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? boundaryList = null,
    Object? projectBoundaryList = null,
    Object? selectedBoundaryMap = null,
    Object? hasSubmitted = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      boundaryList: null == boundaryList
          ? _value.boundaryList
          : boundaryList // ignore: cast_nullable_to_non_nullable
              as List<BoundaryModel>,
      projectBoundaryList: null == projectBoundaryList
          ? _value.projectBoundaryList
          : projectBoundaryList // ignore: cast_nullable_to_non_nullable
              as List<BoundaryModel>,
      selectedBoundaryMap: null == selectedBoundaryMap
          ? _value.selectedBoundaryMap
          : selectedBoundaryMap // ignore: cast_nullable_to_non_nullable
              as Map<String, BoundaryModel?>,
      hasSubmitted: null == hasSubmitted
          ? _value.hasSubmitted
          : hasSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoundaryStateImplCopyWith<$Res>
    implements $BoundaryStateCopyWith<$Res> {
  factory _$$BoundaryStateImplCopyWith(
          _$BoundaryStateImpl value, $Res Function(_$BoundaryStateImpl) then) =
      __$$BoundaryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      List<BoundaryModel> boundaryList,
      List<BoundaryModel> projectBoundaryList,
      Map<String, BoundaryModel?> selectedBoundaryMap,
      bool hasSubmitted});
}

/// @nodoc
class __$$BoundaryStateImplCopyWithImpl<$Res>
    extends _$BoundaryStateCopyWithImpl<$Res, _$BoundaryStateImpl>
    implements _$$BoundaryStateImplCopyWith<$Res> {
  __$$BoundaryStateImplCopyWithImpl(
      _$BoundaryStateImpl _value, $Res Function(_$BoundaryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? boundaryList = null,
    Object? projectBoundaryList = null,
    Object? selectedBoundaryMap = null,
    Object? hasSubmitted = null,
  }) {
    return _then(_$BoundaryStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      boundaryList: null == boundaryList
          ? _value._boundaryList
          : boundaryList // ignore: cast_nullable_to_non_nullable
              as List<BoundaryModel>,
      projectBoundaryList: null == projectBoundaryList
          ? _value._projectBoundaryList
          : projectBoundaryList // ignore: cast_nullable_to_non_nullable
              as List<BoundaryModel>,
      selectedBoundaryMap: null == selectedBoundaryMap
          ? _value._selectedBoundaryMap
          : selectedBoundaryMap // ignore: cast_nullable_to_non_nullable
              as Map<String, BoundaryModel?>,
      hasSubmitted: null == hasSubmitted
          ? _value.hasSubmitted
          : hasSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BoundaryStateImpl extends _BoundaryState {
  const _$BoundaryStateImpl(
      {this.loading = false,
      final List<BoundaryModel> boundaryList = const [],
      final List<BoundaryModel> projectBoundaryList = const [],
      final Map<String, BoundaryModel?> selectedBoundaryMap = const {},
      this.hasSubmitted = false})
      : _boundaryList = boundaryList,
        _projectBoundaryList = projectBoundaryList,
        _selectedBoundaryMap = selectedBoundaryMap,
        super._();

  @override
  @JsonKey()
  final bool loading;
  final List<BoundaryModel> _boundaryList;
  @override
  @JsonKey()
  List<BoundaryModel> get boundaryList {
    if (_boundaryList is EqualUnmodifiableListView) return _boundaryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boundaryList);
  }

  final List<BoundaryModel> _projectBoundaryList;
  @override
  @JsonKey()
  List<BoundaryModel> get projectBoundaryList {
    if (_projectBoundaryList is EqualUnmodifiableListView)
      return _projectBoundaryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectBoundaryList);
  }

  final Map<String, BoundaryModel?> _selectedBoundaryMap;
  @override
  @JsonKey()
  Map<String, BoundaryModel?> get selectedBoundaryMap {
    if (_selectedBoundaryMap is EqualUnmodifiableMapView)
      return _selectedBoundaryMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedBoundaryMap);
  }

  @override
  @JsonKey()
  final bool hasSubmitted;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoundaryStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._boundaryList, _boundaryList) &&
            const DeepCollectionEquality()
                .equals(other._projectBoundaryList, _projectBoundaryList) &&
            const DeepCollectionEquality()
                .equals(other._selectedBoundaryMap, _selectedBoundaryMap) &&
            (identical(other.hasSubmitted, hasSubmitted) ||
                other.hasSubmitted == hasSubmitted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(_boundaryList),
      const DeepCollectionEquality().hash(_projectBoundaryList),
      const DeepCollectionEquality().hash(_selectedBoundaryMap),
      hasSubmitted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoundaryStateImplCopyWith<_$BoundaryStateImpl> get copyWith =>
      __$$BoundaryStateImplCopyWithImpl<_$BoundaryStateImpl>(this, _$identity);
}

abstract class _BoundaryState extends BoundaryState {
  const factory _BoundaryState(
      {final bool loading,
      final List<BoundaryModel> boundaryList,
      final List<BoundaryModel> projectBoundaryList,
      final Map<String, BoundaryModel?> selectedBoundaryMap,
      final bool hasSubmitted}) = _$BoundaryStateImpl;
  const _BoundaryState._() : super._();

  @override
  bool get loading;
  @override
  List<BoundaryModel> get boundaryList;
  @override
  List<BoundaryModel> get projectBoundaryList;
  @override
  Map<String, BoundaryModel?> get selectedBoundaryMap;
  @override
  bool get hasSubmitted;
  @override
  @JsonKey(ignore: true)
  _$$BoundaryStateImplCopyWith<_$BoundaryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

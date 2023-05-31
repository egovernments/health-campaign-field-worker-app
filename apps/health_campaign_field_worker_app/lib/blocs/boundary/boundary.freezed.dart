// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'boundary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BoundaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(String code) search,
    required TResult Function(String label, BoundaryModel selectedBoundary)
        select,
    required TResult Function() submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String code)? search,
    TResult? Function(String label, BoundaryModel selectedBoundary)? select,
    TResult? Function()? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String code)? search,
    TResult Function(String label, BoundaryModel selectedBoundary)? select,
    TResult Function()? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoundaryResetEvent value) reset,
    required TResult Function(BoundarySearchEvent value) search,
    required TResult Function(BoundarySelectEvent value) select,
    required TResult Function(BoundarySubmitEvent value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BoundaryResetEvent value)? reset,
    TResult? Function(BoundarySearchEvent value)? search,
    TResult? Function(BoundarySelectEvent value)? select,
    TResult? Function(BoundarySubmitEvent value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoundaryResetEvent value)? reset,
    TResult Function(BoundarySearchEvent value)? search,
    TResult Function(BoundarySelectEvent value)? select,
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
abstract class _$$BoundaryResetEventCopyWith<$Res> {
  factory _$$BoundaryResetEventCopyWith(_$BoundaryResetEvent value,
          $Res Function(_$BoundaryResetEvent) then) =
      __$$BoundaryResetEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BoundaryResetEventCopyWithImpl<$Res>
    extends _$BoundaryEventCopyWithImpl<$Res, _$BoundaryResetEvent>
    implements _$$BoundaryResetEventCopyWith<$Res> {
  __$$BoundaryResetEventCopyWithImpl(
      _$BoundaryResetEvent _value, $Res Function(_$BoundaryResetEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BoundaryResetEvent implements BoundaryResetEvent {
  const _$BoundaryResetEvent();

  @override
  String toString() {
    return 'BoundaryEvent.reset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BoundaryResetEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(String code) search,
    required TResult Function(String label, BoundaryModel selectedBoundary)
        select,
    required TResult Function() submit,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String code)? search,
    TResult? Function(String label, BoundaryModel selectedBoundary)? select,
    TResult? Function()? submit,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String code)? search,
    TResult Function(String label, BoundaryModel selectedBoundary)? select,
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
  const factory BoundaryResetEvent() = _$BoundaryResetEvent;
}

/// @nodoc
abstract class _$$BoundarySearchEventCopyWith<$Res> {
  factory _$$BoundarySearchEventCopyWith(_$BoundarySearchEvent value,
          $Res Function(_$BoundarySearchEvent) then) =
      __$$BoundarySearchEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$BoundarySearchEventCopyWithImpl<$Res>
    extends _$BoundaryEventCopyWithImpl<$Res, _$BoundarySearchEvent>
    implements _$$BoundarySearchEventCopyWith<$Res> {
  __$$BoundarySearchEventCopyWithImpl(
      _$BoundarySearchEvent _value, $Res Function(_$BoundarySearchEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$BoundarySearchEvent(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BoundarySearchEvent implements BoundarySearchEvent {
  const _$BoundarySearchEvent({required this.code});

  @override
  final String code;

  @override
  String toString() {
    return 'BoundaryEvent.search(code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoundarySearchEvent &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoundarySearchEventCopyWith<_$BoundarySearchEvent> get copyWith =>
      __$$BoundarySearchEventCopyWithImpl<_$BoundarySearchEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(String code) search,
    required TResult Function(String label, BoundaryModel selectedBoundary)
        select,
    required TResult Function() submit,
  }) {
    return search(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String code)? search,
    TResult? Function(String label, BoundaryModel selectedBoundary)? select,
    TResult? Function()? submit,
  }) {
    return search?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String code)? search,
    TResult Function(String label, BoundaryModel selectedBoundary)? select,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoundaryResetEvent value) reset,
    required TResult Function(BoundarySearchEvent value) search,
    required TResult Function(BoundarySelectEvent value) select,
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
  const factory BoundarySearchEvent({required final String code}) =
      _$BoundarySearchEvent;

  String get code;
  @JsonKey(ignore: true)
  _$$BoundarySearchEventCopyWith<_$BoundarySearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BoundarySelectEventCopyWith<$Res> {
  factory _$$BoundarySelectEventCopyWith(_$BoundarySelectEvent value,
          $Res Function(_$BoundarySelectEvent) then) =
      __$$BoundarySelectEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String label, BoundaryModel selectedBoundary});
}

/// @nodoc
class __$$BoundarySelectEventCopyWithImpl<$Res>
    extends _$BoundaryEventCopyWithImpl<$Res, _$BoundarySelectEvent>
    implements _$$BoundarySelectEventCopyWith<$Res> {
  __$$BoundarySelectEventCopyWithImpl(
      _$BoundarySelectEvent _value, $Res Function(_$BoundarySelectEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? selectedBoundary = null,
  }) {
    return _then(_$BoundarySelectEvent(
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

class _$BoundarySelectEvent implements BoundarySelectEvent {
  const _$BoundarySelectEvent(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoundarySelectEvent &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.selectedBoundary, selectedBoundary) ||
                other.selectedBoundary == selectedBoundary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, selectedBoundary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoundarySelectEventCopyWith<_$BoundarySelectEvent> get copyWith =>
      __$$BoundarySelectEventCopyWithImpl<_$BoundarySelectEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(String code) search,
    required TResult Function(String label, BoundaryModel selectedBoundary)
        select,
    required TResult Function() submit,
  }) {
    return select(label, selectedBoundary);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String code)? search,
    TResult? Function(String label, BoundaryModel selectedBoundary)? select,
    TResult? Function()? submit,
  }) {
    return select?.call(label, selectedBoundary);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String code)? search,
    TResult Function(String label, BoundaryModel selectedBoundary)? select,
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
      required final BoundaryModel selectedBoundary}) = _$BoundarySelectEvent;

  String get label;
  BoundaryModel get selectedBoundary;
  @JsonKey(ignore: true)
  _$$BoundarySelectEventCopyWith<_$BoundarySelectEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BoundarySubmitEventCopyWith<$Res> {
  factory _$$BoundarySubmitEventCopyWith(_$BoundarySubmitEvent value,
          $Res Function(_$BoundarySubmitEvent) then) =
      __$$BoundarySubmitEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BoundarySubmitEventCopyWithImpl<$Res>
    extends _$BoundaryEventCopyWithImpl<$Res, _$BoundarySubmitEvent>
    implements _$$BoundarySubmitEventCopyWith<$Res> {
  __$$BoundarySubmitEventCopyWithImpl(
      _$BoundarySubmitEvent _value, $Res Function(_$BoundarySubmitEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BoundarySubmitEvent implements BoundarySubmitEvent {
  const _$BoundarySubmitEvent();

  @override
  String toString() {
    return 'BoundaryEvent.submit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BoundarySubmitEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(String code) search,
    required TResult Function(String label, BoundaryModel selectedBoundary)
        select,
    required TResult Function() submit,
  }) {
    return submit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String code)? search,
    TResult? Function(String label, BoundaryModel selectedBoundary)? select,
    TResult? Function()? submit,
  }) {
    return submit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String code)? search,
    TResult Function(String label, BoundaryModel selectedBoundary)? select,
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
  const factory BoundarySubmitEvent() = _$BoundarySubmitEvent;
}

/// @nodoc
mixin _$BoundaryState {
  bool get loading => throw _privateConstructorUsedError;
  List<BoundaryModel> get boundaryList => throw _privateConstructorUsedError;
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
abstract class _$$_BoundaryStateCopyWith<$Res>
    implements $BoundaryStateCopyWith<$Res> {
  factory _$$_BoundaryStateCopyWith(
          _$_BoundaryState value, $Res Function(_$_BoundaryState) then) =
      __$$_BoundaryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      List<BoundaryModel> boundaryList,
      Map<String, BoundaryModel?> selectedBoundaryMap,
      bool hasSubmitted});
}

/// @nodoc
class __$$_BoundaryStateCopyWithImpl<$Res>
    extends _$BoundaryStateCopyWithImpl<$Res, _$_BoundaryState>
    implements _$$_BoundaryStateCopyWith<$Res> {
  __$$_BoundaryStateCopyWithImpl(
      _$_BoundaryState _value, $Res Function(_$_BoundaryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? boundaryList = null,
    Object? selectedBoundaryMap = null,
    Object? hasSubmitted = null,
  }) {
    return _then(_$_BoundaryState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      boundaryList: null == boundaryList
          ? _value._boundaryList
          : boundaryList // ignore: cast_nullable_to_non_nullable
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

class _$_BoundaryState extends _BoundaryState {
  const _$_BoundaryState(
      {this.loading = false,
      final List<BoundaryModel> boundaryList = const [],
      final Map<String, BoundaryModel?> selectedBoundaryMap = const {},
      this.hasSubmitted = false})
      : _boundaryList = boundaryList,
        _selectedBoundaryMap = selectedBoundaryMap,
        super._();

  @override
  @JsonKey()
  final bool loading;
  final List<BoundaryModel> _boundaryList;
  @override
  @JsonKey()
  List<BoundaryModel> get boundaryList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boundaryList);
  }

  final Map<String, BoundaryModel?> _selectedBoundaryMap;
  @override
  @JsonKey()
  Map<String, BoundaryModel?> get selectedBoundaryMap {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedBoundaryMap);
  }

  @override
  @JsonKey()
  final bool hasSubmitted;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BoundaryState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._boundaryList, _boundaryList) &&
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
      const DeepCollectionEquality().hash(_selectedBoundaryMap),
      hasSubmitted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BoundaryStateCopyWith<_$_BoundaryState> get copyWith =>
      __$$_BoundaryStateCopyWithImpl<_$_BoundaryState>(this, _$identity);
}

abstract class _BoundaryState extends BoundaryState {
  const factory _BoundaryState(
      {final bool loading,
      final List<BoundaryModel> boundaryList,
      final Map<String, BoundaryModel?> selectedBoundaryMap,
      final bool hasSubmitted}) = _$_BoundaryState;
  const _BoundaryState._() : super._();

  @override
  bool get loading;
  @override
  List<BoundaryModel> get boundaryList;
  @override
  Map<String, BoundaryModel?> get selectedBoundaryMap;
  @override
  bool get hasSubmitted;
  @override
  @JsonKey(ignore: true)
  _$$_BoundaryStateCopyWith<_$_BoundaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

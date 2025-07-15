// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DigitScannerEvent {
  List<GS1Barcode> get barCode => throw _privateConstructorUsedError;
  List<String> get qrCode => throw _privateConstructorUsedError;
  String get manualCode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<GS1Barcode> barCode, List<String> qrCode, String manualCode)
        handleScanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<GS1Barcode> barCode, List<String> qrCode, String manualCode)?
        handleScanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<GS1Barcode> barCode, List<String> qrCode, String manualCode)?
        handleScanner,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DigitScannerScanEvent value) handleScanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DigitScannerScanEvent value)? handleScanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DigitScannerScanEvent value)? handleScanner,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DigitScannerEventCopyWith<DigitScannerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DigitScannerEventCopyWith<$Res> {
  factory $DigitScannerEventCopyWith(
          DigitScannerEvent value, $Res Function(DigitScannerEvent) then) =
      _$DigitScannerEventCopyWithImpl<$Res, DigitScannerEvent>;
  @useResult
  $Res call({List<GS1Barcode> barCode, List<String> qrCode, String manualCode});
}

/// @nodoc
class _$DigitScannerEventCopyWithImpl<$Res, $Val extends DigitScannerEvent>
    implements $DigitScannerEventCopyWith<$Res> {
  _$DigitScannerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barCode = null,
    Object? qrCode = null,
    Object? manualCode = null,
  }) {
    return _then(_value.copyWith(
      barCode: null == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as List<String>,
      manualCode: null == manualCode
          ? _value.manualCode
          : manualCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DigitScannerScanEventImplCopyWith<$Res>
    implements $DigitScannerEventCopyWith<$Res> {
  factory _$$DigitScannerScanEventImplCopyWith(
          _$DigitScannerScanEventImpl value,
          $Res Function(_$DigitScannerScanEventImpl) then) =
      __$$DigitScannerScanEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GS1Barcode> barCode, List<String> qrCode, String manualCode});
}

/// @nodoc
class __$$DigitScannerScanEventImplCopyWithImpl<$Res>
    extends _$DigitScannerEventCopyWithImpl<$Res, _$DigitScannerScanEventImpl>
    implements _$$DigitScannerScanEventImplCopyWith<$Res> {
  __$$DigitScannerScanEventImplCopyWithImpl(_$DigitScannerScanEventImpl _value,
      $Res Function(_$DigitScannerScanEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barCode = null,
    Object? qrCode = null,
    Object? manualCode = null,
  }) {
    return _then(_$DigitScannerScanEventImpl(
      barCode: null == barCode
          ? _value._barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      qrCode: null == qrCode
          ? _value._qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as List<String>,
      manualCode: null == manualCode
          ? _value.manualCode
          : manualCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DigitScannerScanEventImpl implements DigitScannerScanEvent {
  const _$DigitScannerScanEventImpl(
      {final List<GS1Barcode> barCode = const [],
      final List<String> qrCode = const [],
      this.manualCode = ''})
      : _barCode = barCode,
        _qrCode = qrCode;

  final List<GS1Barcode> _barCode;
  @override
  @JsonKey()
  List<GS1Barcode> get barCode {
    if (_barCode is EqualUnmodifiableListView) return _barCode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_barCode);
  }

  final List<String> _qrCode;
  @override
  @JsonKey()
  List<String> get qrCode {
    if (_qrCode is EqualUnmodifiableListView) return _qrCode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_qrCode);
  }

  @override
  @JsonKey()
  final String manualCode;

  @override
  String toString() {
    return 'DigitScannerEvent.handleScanner(barCode: $barCode, qrCode: $qrCode, manualCode: $manualCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DigitScannerScanEventImpl &&
            const DeepCollectionEquality().equals(other._barCode, _barCode) &&
            const DeepCollectionEquality().equals(other._qrCode, _qrCode) &&
            (identical(other.manualCode, manualCode) ||
                other.manualCode == manualCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_barCode),
      const DeepCollectionEquality().hash(_qrCode),
      manualCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DigitScannerScanEventImplCopyWith<_$DigitScannerScanEventImpl>
      get copyWith => __$$DigitScannerScanEventImplCopyWithImpl<
          _$DigitScannerScanEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<GS1Barcode> barCode, List<String> qrCode, String manualCode)
        handleScanner,
  }) {
    return handleScanner(barCode, qrCode, manualCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<GS1Barcode> barCode, List<String> qrCode, String manualCode)?
        handleScanner,
  }) {
    return handleScanner?.call(barCode, qrCode, manualCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<GS1Barcode> barCode, List<String> qrCode, String manualCode)?
        handleScanner,
    required TResult orElse(),
  }) {
    if (handleScanner != null) {
      return handleScanner(barCode, qrCode, manualCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DigitScannerScanEvent value) handleScanner,
  }) {
    return handleScanner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DigitScannerScanEvent value)? handleScanner,
  }) {
    return handleScanner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DigitScannerScanEvent value)? handleScanner,
    required TResult orElse(),
  }) {
    if (handleScanner != null) {
      return handleScanner(this);
    }
    return orElse();
  }
}

abstract class DigitScannerScanEvent implements DigitScannerEvent {
  const factory DigitScannerScanEvent(
      {final List<GS1Barcode> barCode,
      final List<String> qrCode,
      final String manualCode}) = _$DigitScannerScanEventImpl;

  @override
  List<GS1Barcode> get barCode;
  @override
  List<String> get qrCode;
  @override
  String get manualCode;
  @override
  @JsonKey(ignore: true)
  _$$DigitScannerScanEventImplCopyWith<_$DigitScannerScanEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DigitScannerState {
  List<GS1Barcode> get barCodes => throw _privateConstructorUsedError;
  List<String> get qrCodes => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get duplicate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DigitScannerStateCopyWith<DigitScannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DigitScannerStateCopyWith<$Res> {
  factory $DigitScannerStateCopyWith(
          DigitScannerState value, $Res Function(DigitScannerState) then) =
      _$DigitScannerStateCopyWithImpl<$Res, DigitScannerState>;
  @useResult
  $Res call(
      {List<GS1Barcode> barCodes,
      List<String> qrCodes,
      bool loading,
      bool duplicate});
}

/// @nodoc
class _$DigitScannerStateCopyWithImpl<$Res, $Val extends DigitScannerState>
    implements $DigitScannerStateCopyWith<$Res> {
  _$DigitScannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barCodes = null,
    Object? qrCodes = null,
    Object? loading = null,
    Object? duplicate = null,
  }) {
    return _then(_value.copyWith(
      barCodes: null == barCodes
          ? _value.barCodes
          : barCodes // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      qrCodes: null == qrCodes
          ? _value.qrCodes
          : qrCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      duplicate: null == duplicate
          ? _value.duplicate
          : duplicate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DigitScannerStateImplCopyWith<$Res>
    implements $DigitScannerStateCopyWith<$Res> {
  factory _$$DigitScannerStateImplCopyWith(_$DigitScannerStateImpl value,
          $Res Function(_$DigitScannerStateImpl) then) =
      __$$DigitScannerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GS1Barcode> barCodes,
      List<String> qrCodes,
      bool loading,
      bool duplicate});
}

/// @nodoc
class __$$DigitScannerStateImplCopyWithImpl<$Res>
    extends _$DigitScannerStateCopyWithImpl<$Res, _$DigitScannerStateImpl>
    implements _$$DigitScannerStateImplCopyWith<$Res> {
  __$$DigitScannerStateImplCopyWithImpl(_$DigitScannerStateImpl _value,
      $Res Function(_$DigitScannerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barCodes = null,
    Object? qrCodes = null,
    Object? loading = null,
    Object? duplicate = null,
  }) {
    return _then(_$DigitScannerStateImpl(
      barCodes: null == barCodes
          ? _value._barCodes
          : barCodes // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      qrCodes: null == qrCodes
          ? _value._qrCodes
          : qrCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      duplicate: null == duplicate
          ? _value.duplicate
          : duplicate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DigitScannerStateImpl implements _DigitScannerState {
  const _$DigitScannerStateImpl(
      {final List<GS1Barcode> barCodes = const [],
      final List<String> qrCodes = const [],
      this.loading = false,
      this.duplicate = false})
      : _barCodes = barCodes,
        _qrCodes = qrCodes;

  final List<GS1Barcode> _barCodes;
  @override
  @JsonKey()
  List<GS1Barcode> get barCodes {
    if (_barCodes is EqualUnmodifiableListView) return _barCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_barCodes);
  }

  final List<String> _qrCodes;
  @override
  @JsonKey()
  List<String> get qrCodes {
    if (_qrCodes is EqualUnmodifiableListView) return _qrCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_qrCodes);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool duplicate;

  @override
  String toString() {
    return 'DigitScannerState(barCodes: $barCodes, qrCodes: $qrCodes, loading: $loading, duplicate: $duplicate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DigitScannerStateImpl &&
            const DeepCollectionEquality().equals(other._barCodes, _barCodes) &&
            const DeepCollectionEquality().equals(other._qrCodes, _qrCodes) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.duplicate, duplicate) ||
                other.duplicate == duplicate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_barCodes),
      const DeepCollectionEquality().hash(_qrCodes),
      loading,
      duplicate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DigitScannerStateImplCopyWith<_$DigitScannerStateImpl> get copyWith =>
      __$$DigitScannerStateImplCopyWithImpl<_$DigitScannerStateImpl>(
          this, _$identity);
}

abstract class _DigitScannerState implements DigitScannerState {
  const factory _DigitScannerState(
      {final List<GS1Barcode> barCodes,
      final List<String> qrCodes,
      final bool loading,
      final bool duplicate}) = _$DigitScannerStateImpl;

  @override
  List<GS1Barcode> get barCodes;
  @override
  List<String> get qrCodes;
  @override
  bool get loading;
  @override
  bool get duplicate;
  @override
  @JsonKey(ignore: true)
  _$$DigitScannerStateImplCopyWith<_$DigitScannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scanner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScannerEvent {
  List<GS1Barcode> get barcode => throw _privateConstructorUsedError;
  List<String> get qrcode => throw _privateConstructorUsedError;
  bool get isReferral => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<GS1Barcode> barcode, List<String> qrcode, bool isReferral)
        handleScanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<GS1Barcode> barcode, List<String> qrcode, bool isReferral)?
        handleScanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<GS1Barcode> barcode, List<String> qrcode, bool isReferral)?
        handleScanner,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScannerScanEvent value) handleScanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScannerScanEvent value)? handleScanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScannerScanEvent value)? handleScanner,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScannerEventCopyWith<ScannerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScannerEventCopyWith<$Res> {
  factory $ScannerEventCopyWith(
          ScannerEvent value, $Res Function(ScannerEvent) then) =
      _$ScannerEventCopyWithImpl<$Res, ScannerEvent>;
  @useResult
  $Res call({List<GS1Barcode> barcode, List<String> qrcode, bool isReferral});
}

/// @nodoc
class _$ScannerEventCopyWithImpl<$Res, $Val extends ScannerEvent>
    implements $ScannerEventCopyWith<$Res> {
  _$ScannerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? qrcode = null,
    Object? isReferral = null,
  }) {
    return _then(_value.copyWith(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      qrcode: null == qrcode
          ? _value.qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isReferral: null == isReferral
          ? _value.isReferral
          : isReferral // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScannerScanEventCopyWith<$Res>
    implements $ScannerEventCopyWith<$Res> {
  factory _$$ScannerScanEventCopyWith(
          _$ScannerScanEvent value, $Res Function(_$ScannerScanEvent) then) =
      __$$ScannerScanEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GS1Barcode> barcode, List<String> qrcode, bool isReferral});
}

/// @nodoc
class __$$ScannerScanEventCopyWithImpl<$Res>
    extends _$ScannerEventCopyWithImpl<$Res, _$ScannerScanEvent>
    implements _$$ScannerScanEventCopyWith<$Res> {
  __$$ScannerScanEventCopyWithImpl(
      _$ScannerScanEvent _value, $Res Function(_$ScannerScanEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? qrcode = null,
    Object? isReferral = null,
  }) {
    return _then(_$ScannerScanEvent(
      null == barcode
          ? _value._barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      null == qrcode
          ? _value._qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isReferral: null == isReferral
          ? _value.isReferral
          : isReferral // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ScannerScanEvent implements ScannerScanEvent {
  const _$ScannerScanEvent(
      final List<GS1Barcode> barcode, final List<String> qrcode,
      {this.isReferral = false})
      : _barcode = barcode,
        _qrcode = qrcode;

  final List<GS1Barcode> _barcode;
  @override
  List<GS1Barcode> get barcode {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_barcode);
  }

  final List<String> _qrcode;
  @override
  List<String> get qrcode {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_qrcode);
  }

  @override
  @JsonKey()
  final bool isReferral;

  @override
  String toString() {
    return 'ScannerEvent.handleScanner(barcode: $barcode, qrcode: $qrcode, isReferral: $isReferral)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScannerScanEvent &&
            const DeepCollectionEquality().equals(other._barcode, _barcode) &&
            const DeepCollectionEquality().equals(other._qrcode, _qrcode) &&
            (identical(other.isReferral, isReferral) ||
                other.isReferral == isReferral));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_barcode),
      const DeepCollectionEquality().hash(_qrcode),
      isReferral);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScannerScanEventCopyWith<_$ScannerScanEvent> get copyWith =>
      __$$ScannerScanEventCopyWithImpl<_$ScannerScanEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<GS1Barcode> barcode, List<String> qrcode, bool isReferral)
        handleScanner,
  }) {
    return handleScanner(barcode, qrcode, isReferral);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<GS1Barcode> barcode, List<String> qrcode, bool isReferral)?
        handleScanner,
  }) {
    return handleScanner?.call(barcode, qrcode, isReferral);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<GS1Barcode> barcode, List<String> qrcode, bool isReferral)?
        handleScanner,
    required TResult orElse(),
  }) {
    if (handleScanner != null) {
      return handleScanner(barcode, qrcode, isReferral);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScannerScanEvent value) handleScanner,
  }) {
    return handleScanner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScannerScanEvent value)? handleScanner,
  }) {
    return handleScanner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScannerScanEvent value)? handleScanner,
    required TResult orElse(),
  }) {
    if (handleScanner != null) {
      return handleScanner(this);
    }
    return orElse();
  }
}

abstract class ScannerScanEvent implements ScannerEvent {
  const factory ScannerScanEvent(
      final List<GS1Barcode> barcode, final List<String> qrcode,
      {final bool isReferral}) = _$ScannerScanEvent;

  @override
  List<GS1Barcode> get barcode;
  @override
  List<String> get qrcode;
  @override
  bool get isReferral;
  @override
  @JsonKey(ignore: true)
  _$$ScannerScanEventCopyWith<_$ScannerScanEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScannerState {
  List<GS1Barcode> get barcodes => throw _privateConstructorUsedError;
  List<String> get qrcodes => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get duplicate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScannerStateCopyWith<ScannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScannerStateCopyWith<$Res> {
  factory $ScannerStateCopyWith(
          ScannerState value, $Res Function(ScannerState) then) =
      _$ScannerStateCopyWithImpl<$Res, ScannerState>;
  @useResult
  $Res call(
      {List<GS1Barcode> barcodes,
      List<String> qrcodes,
      bool loading,
      bool duplicate});
}

/// @nodoc
class _$ScannerStateCopyWithImpl<$Res, $Val extends ScannerState>
    implements $ScannerStateCopyWith<$Res> {
  _$ScannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcodes = null,
    Object? qrcodes = null,
    Object? loading = null,
    Object? duplicate = null,
  }) {
    return _then(_value.copyWith(
      barcodes: null == barcodes
          ? _value.barcodes
          : barcodes // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      qrcodes: null == qrcodes
          ? _value.qrcodes
          : qrcodes // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ScannerStateCopyWith<$Res>
    implements $ScannerStateCopyWith<$Res> {
  factory _$$_ScannerStateCopyWith(
          _$_ScannerState value, $Res Function(_$_ScannerState) then) =
      __$$_ScannerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GS1Barcode> barcodes,
      List<String> qrcodes,
      bool loading,
      bool duplicate});
}

/// @nodoc
class __$$_ScannerStateCopyWithImpl<$Res>
    extends _$ScannerStateCopyWithImpl<$Res, _$_ScannerState>
    implements _$$_ScannerStateCopyWith<$Res> {
  __$$_ScannerStateCopyWithImpl(
      _$_ScannerState _value, $Res Function(_$_ScannerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcodes = null,
    Object? qrcodes = null,
    Object? loading = null,
    Object? duplicate = null,
  }) {
    return _then(_$_ScannerState(
      barcodes: null == barcodes
          ? _value._barcodes
          : barcodes // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      qrcodes: null == qrcodes
          ? _value._qrcodes
          : qrcodes // ignore: cast_nullable_to_non_nullable
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

class _$_ScannerState implements _ScannerState {
  const _$_ScannerState(
      {final List<GS1Barcode> barcodes = const [],
      final List<String> qrcodes = const [],
      this.loading = false,
      this.duplicate = false})
      : _barcodes = barcodes,
        _qrcodes = qrcodes;

  final List<GS1Barcode> _barcodes;
  @override
  @JsonKey()
  List<GS1Barcode> get barcodes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_barcodes);
  }

  final List<String> _qrcodes;
  @override
  @JsonKey()
  List<String> get qrcodes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_qrcodes);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool duplicate;

  @override
  String toString() {
    return 'ScannerState(barcodes: $barcodes, qrcodes: $qrcodes, loading: $loading, duplicate: $duplicate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScannerState &&
            const DeepCollectionEquality().equals(other._barcodes, _barcodes) &&
            const DeepCollectionEquality().equals(other._qrcodes, _qrcodes) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.duplicate, duplicate) ||
                other.duplicate == duplicate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_barcodes),
      const DeepCollectionEquality().hash(_qrcodes),
      loading,
      duplicate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScannerStateCopyWith<_$_ScannerState> get copyWith =>
      __$$_ScannerStateCopyWithImpl<_$_ScannerState>(this, _$identity);
}

abstract class _ScannerState implements ScannerState {
  const factory _ScannerState(
      {final List<GS1Barcode> barcodes,
      final List<String> qrcodes,
      final bool loading,
      final bool duplicate}) = _$_ScannerState;

  @override
  List<GS1Barcode> get barcodes;
  @override
  List<String> get qrcodes;
  @override
  bool get loading;
  @override
  bool get duplicate;
  @override
  @JsonKey(ignore: true)
  _$$_ScannerStateCopyWith<_$_ScannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

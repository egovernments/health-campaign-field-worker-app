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
  bool? get isGS1 => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  String? get regex => throw _privateConstructorUsedError;
  bool get overwrite => throw _privateConstructorUsedError;

  /// 👇 new: optional messages map. Keys you can use:
  /// 'scanLimit', 'pattern', 'duplicate', 'invalidGS1', 'scannerFailed'
  Map<String, String>? get messages => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<GS1Barcode> barCode,
            List<String> qrCode,
            String manualCode,
            bool? isGS1,
            int? quantity,
            String? regex,
            bool overwrite,
            Map<String, String>? messages)
        handleScanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<GS1Barcode> barCode,
            List<String> qrCode,
            String manualCode,
            bool? isGS1,
            int? quantity,
            String? regex,
            bool overwrite,
            Map<String, String>? messages)?
        handleScanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<GS1Barcode> barCode,
            List<String> qrCode,
            String manualCode,
            bool? isGS1,
            int? quantity,
            String? regex,
            bool overwrite,
            Map<String, String>? messages)?
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
  $Res call(
      {List<GS1Barcode> barCode,
      List<String> qrCode,
      String manualCode,
      bool? isGS1,
      int? quantity,
      String? regex,
      bool overwrite,
      Map<String, String>? messages});
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
    Object? isGS1 = freezed,
    Object? quantity = freezed,
    Object? regex = freezed,
    Object? overwrite = null,
    Object? messages = freezed,
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
      isGS1: freezed == isGS1
          ? _value.isGS1
          : isGS1 // ignore: cast_nullable_to_non_nullable
              as bool?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      regex: freezed == regex
          ? _value.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as String?,
      overwrite: null == overwrite
          ? _value.overwrite
          : overwrite // ignore: cast_nullable_to_non_nullable
              as bool,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
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
  $Res call(
      {List<GS1Barcode> barCode,
      List<String> qrCode,
      String manualCode,
      bool? isGS1,
      int? quantity,
      String? regex,
      bool overwrite,
      Map<String, String>? messages});
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
    Object? isGS1 = freezed,
    Object? quantity = freezed,
    Object? regex = freezed,
    Object? overwrite = null,
    Object? messages = freezed,
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
      isGS1: freezed == isGS1
          ? _value.isGS1
          : isGS1 // ignore: cast_nullable_to_non_nullable
              as bool?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      regex: freezed == regex
          ? _value.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as String?,
      overwrite: null == overwrite
          ? _value.overwrite
          : overwrite // ignore: cast_nullable_to_non_nullable
              as bool,
      messages: freezed == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc

class _$DigitScannerScanEventImpl implements DigitScannerScanEvent {
  const _$DigitScannerScanEventImpl(
      {final List<GS1Barcode> barCode = const [],
      final List<String> qrCode = const [],
      this.manualCode = '',
      this.isGS1,
      this.quantity,
      this.regex,
      this.overwrite = false,
      final Map<String, String>? messages})
      : _barCode = barCode,
        _qrCode = qrCode,
        _messages = messages;

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
  final bool? isGS1;
  @override
  final int? quantity;
  @override
  final String? regex;
  @override
  @JsonKey()
  final bool overwrite;

  /// 👇 new: optional messages map. Keys you can use:
  /// 'scanLimit', 'pattern', 'duplicate', 'invalidGS1', 'scannerFailed'
  final Map<String, String>? _messages;

  /// 👇 new: optional messages map. Keys you can use:
  /// 'scanLimit', 'pattern', 'duplicate', 'invalidGS1', 'scannerFailed'
  @override
  Map<String, String>? get messages {
    final value = _messages;
    if (value == null) return null;
    if (_messages is EqualUnmodifiableMapView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DigitScannerEvent.handleScanner(barCode: $barCode, qrCode: $qrCode, manualCode: $manualCode, isGS1: $isGS1, quantity: $quantity, regex: $regex, overwrite: $overwrite, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DigitScannerScanEventImpl &&
            const DeepCollectionEquality().equals(other._barCode, _barCode) &&
            const DeepCollectionEquality().equals(other._qrCode, _qrCode) &&
            (identical(other.manualCode, manualCode) ||
                other.manualCode == manualCode) &&
            (identical(other.isGS1, isGS1) || other.isGS1 == isGS1) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.regex, regex) || other.regex == regex) &&
            (identical(other.overwrite, overwrite) ||
                other.overwrite == overwrite) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_barCode),
      const DeepCollectionEquality().hash(_qrCode),
      manualCode,
      isGS1,
      quantity,
      regex,
      overwrite,
      const DeepCollectionEquality().hash(_messages));

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
            List<GS1Barcode> barCode,
            List<String> qrCode,
            String manualCode,
            bool? isGS1,
            int? quantity,
            String? regex,
            bool overwrite,
            Map<String, String>? messages)
        handleScanner,
  }) {
    return handleScanner(barCode, qrCode, manualCode, isGS1, quantity, regex,
        overwrite, messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<GS1Barcode> barCode,
            List<String> qrCode,
            String manualCode,
            bool? isGS1,
            int? quantity,
            String? regex,
            bool overwrite,
            Map<String, String>? messages)?
        handleScanner,
  }) {
    return handleScanner?.call(barCode, qrCode, manualCode, isGS1, quantity,
        regex, overwrite, messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<GS1Barcode> barCode,
            List<String> qrCode,
            String manualCode,
            bool? isGS1,
            int? quantity,
            String? regex,
            bool overwrite,
            Map<String, String>? messages)?
        handleScanner,
    required TResult orElse(),
  }) {
    if (handleScanner != null) {
      return handleScanner(barCode, qrCode, manualCode, isGS1, quantity, regex,
          overwrite, messages);
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
      final String manualCode,
      final bool? isGS1,
      final int? quantity,
      final String? regex,
      final bool overwrite,
      final Map<String, String>? messages}) = _$DigitScannerScanEventImpl;

  @override
  List<GS1Barcode> get barCode;
  @override
  List<String> get qrCode;
  @override
  String get manualCode;
  @override
  bool? get isGS1;
  @override
  int? get quantity;
  @override
  String? get regex;
  @override
  bool get overwrite;
  @override

  /// 👇 new: optional messages map. Keys you can use:
  /// 'scanLimit', 'pattern', 'duplicate', 'invalidGS1', 'scannerFailed'
  Map<String, String>? get messages;
  @override
  @JsonKey(ignore: true)
  _$$DigitScannerScanEventImplCopyWith<_$DigitScannerScanEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DigitScannerState {
  List<GS1Barcode> get barCodes => throw _privateConstructorUsedError;
  List<String> get qrCodes => throw _privateConstructorUsedError;
  bool get isGS1 => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String? get regex => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get duplicate => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// 👇 new: carry custom messages
  Map<String, String> get messages => throw _privateConstructorUsedError;

  /// increments on every error emit
  int get errorSeq => throw _privateConstructorUsedError;

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
      bool isGS1,
      int quantity,
      String? regex,
      bool loading,
      bool duplicate,
      String? error,
      Map<String, String> messages,
      int errorSeq});
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
    Object? isGS1 = null,
    Object? quantity = null,
    Object? regex = freezed,
    Object? loading = null,
    Object? duplicate = null,
    Object? error = freezed,
    Object? messages = null,
    Object? errorSeq = null,
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
      isGS1: null == isGS1
          ? _value.isGS1
          : isGS1 // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      regex: freezed == regex
          ? _value.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as String?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      duplicate: null == duplicate
          ? _value.duplicate
          : duplicate // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      errorSeq: null == errorSeq
          ? _value.errorSeq
          : errorSeq // ignore: cast_nullable_to_non_nullable
              as int,
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
      bool isGS1,
      int quantity,
      String? regex,
      bool loading,
      bool duplicate,
      String? error,
      Map<String, String> messages,
      int errorSeq});
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
    Object? isGS1 = null,
    Object? quantity = null,
    Object? regex = freezed,
    Object? loading = null,
    Object? duplicate = null,
    Object? error = freezed,
    Object? messages = null,
    Object? errorSeq = null,
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
      isGS1: null == isGS1
          ? _value.isGS1
          : isGS1 // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      regex: freezed == regex
          ? _value.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as String?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      duplicate: null == duplicate
          ? _value.duplicate
          : duplicate // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      errorSeq: null == errorSeq
          ? _value.errorSeq
          : errorSeq // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DigitScannerStateImpl implements _DigitScannerState {
  const _$DigitScannerStateImpl(
      {final List<GS1Barcode> barCodes = const [],
      final List<String> qrCodes = const [],
      this.isGS1 = false,
      this.quantity = 1,
      this.regex,
      this.loading = false,
      this.duplicate = false,
      this.error,
      final Map<String, String> messages = const {},
      this.errorSeq = 0})
      : _barCodes = barCodes,
        _qrCodes = qrCodes,
        _messages = messages;

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
  final bool isGS1;
  @override
  @JsonKey()
  final int quantity;
  @override
  final String? regex;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool duplicate;
  @override
  final String? error;

  /// 👇 new: carry custom messages
  final Map<String, String> _messages;

  /// 👇 new: carry custom messages
  @override
  @JsonKey()
  Map<String, String> get messages {
    if (_messages is EqualUnmodifiableMapView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_messages);
  }

  /// increments on every error emit
  @override
  @JsonKey()
  final int errorSeq;

  @override
  String toString() {
    return 'DigitScannerState(barCodes: $barCodes, qrCodes: $qrCodes, isGS1: $isGS1, quantity: $quantity, regex: $regex, loading: $loading, duplicate: $duplicate, error: $error, messages: $messages, errorSeq: $errorSeq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DigitScannerStateImpl &&
            const DeepCollectionEquality().equals(other._barCodes, _barCodes) &&
            const DeepCollectionEquality().equals(other._qrCodes, _qrCodes) &&
            (identical(other.isGS1, isGS1) || other.isGS1 == isGS1) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.regex, regex) || other.regex == regex) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.duplicate, duplicate) ||
                other.duplicate == duplicate) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.errorSeq, errorSeq) ||
                other.errorSeq == errorSeq));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_barCodes),
      const DeepCollectionEquality().hash(_qrCodes),
      isGS1,
      quantity,
      regex,
      loading,
      duplicate,
      error,
      const DeepCollectionEquality().hash(_messages),
      errorSeq);

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
      final bool isGS1,
      final int quantity,
      final String? regex,
      final bool loading,
      final bool duplicate,
      final String? error,
      final Map<String, String> messages,
      final int errorSeq}) = _$DigitScannerStateImpl;

  @override
  List<GS1Barcode> get barCodes;
  @override
  List<String> get qrCodes;
  @override
  bool get isGS1;
  @override
  int get quantity;
  @override
  String? get regex;
  @override
  bool get loading;
  @override
  bool get duplicate;
  @override
  String? get error;
  @override

  /// 👇 new: carry custom messages
  Map<String, String> get messages;
  @override

  /// increments on every error emit
  int get errorSeq;
  @override
  @JsonKey(ignore: true)
  _$$DigitScannerStateImplCopyWith<_$DigitScannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DigitScannerEvent {
  List<GS1Barcode> get barCode;
  List<String> get qrCode;
  String get manualCode;
  String? get regex;
  String? get patternMessage;

  /// Identifier for which scanner field initiated this scan.
  /// Used to prevent multiple scanner fields from reacting to the same state change.
  /// Defaults to 'default' for backward compatibility with existing flows.
  String get scannerId;

  /// Create a copy of DigitScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DigitScannerEventCopyWith<DigitScannerEvent> get copyWith =>
      _$DigitScannerEventCopyWithImpl<DigitScannerEvent>(
          this as DigitScannerEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DigitScannerEvent &&
            const DeepCollectionEquality().equals(other.barCode, barCode) &&
            const DeepCollectionEquality().equals(other.qrCode, qrCode) &&
            (identical(other.manualCode, manualCode) ||
                other.manualCode == manualCode) &&
            (identical(other.regex, regex) || other.regex == regex) &&
            (identical(other.patternMessage, patternMessage) ||
                other.patternMessage == patternMessage) &&
            (identical(other.scannerId, scannerId) ||
                other.scannerId == scannerId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(barCode),
      const DeepCollectionEquality().hash(qrCode),
      manualCode,
      regex,
      patternMessage,
      scannerId);

  @override
  String toString() {
    return 'DigitScannerEvent(barCode: $barCode, qrCode: $qrCode, manualCode: $manualCode, regex: $regex, patternMessage: $patternMessage, scannerId: $scannerId)';
  }
}

/// @nodoc
abstract mixin class $DigitScannerEventCopyWith<$Res> {
  factory $DigitScannerEventCopyWith(
          DigitScannerEvent value, $Res Function(DigitScannerEvent) _then) =
      _$DigitScannerEventCopyWithImpl;
  @useResult
  $Res call(
      {List<GS1Barcode> barCode,
      List<String> qrCode,
      String manualCode,
      String? regex,
      String? patternMessage,
      String scannerId});
}

/// @nodoc
class _$DigitScannerEventCopyWithImpl<$Res>
    implements $DigitScannerEventCopyWith<$Res> {
  _$DigitScannerEventCopyWithImpl(this._self, this._then);

  final DigitScannerEvent _self;
  final $Res Function(DigitScannerEvent) _then;

  /// Create a copy of DigitScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barCode = null,
    Object? qrCode = null,
    Object? manualCode = null,
    Object? regex = freezed,
    Object? patternMessage = freezed,
    Object? scannerId = null,
  }) {
    return _then(_self.copyWith(
      barCode: null == barCode
          ? _self.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      qrCode: null == qrCode
          ? _self.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as List<String>,
      manualCode: null == manualCode
          ? _self.manualCode
          : manualCode // ignore: cast_nullable_to_non_nullable
              as String,
      regex: freezed == regex
          ? _self.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as String?,
      patternMessage: freezed == patternMessage
          ? _self.patternMessage
          : patternMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      scannerId: null == scannerId
          ? _self.scannerId
          : scannerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [DigitScannerEvent].
extension DigitScannerEventPatterns on DigitScannerEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DigitScannerScanEvent value)? handleScanner,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DigitScannerScanEvent() when handleScanner != null:
        return handleScanner(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DigitScannerScanEvent value) handleScanner,
  }) {
    final _that = this;
    switch (_that) {
      case DigitScannerScanEvent():
        return handleScanner(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DigitScannerScanEvent value)? handleScanner,
  }) {
    final _that = this;
    switch (_that) {
      case DigitScannerScanEvent() when handleScanner != null:
        return handleScanner(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<GS1Barcode> barCode,
            List<String> qrCode,
            String manualCode,
            String? regex,
            String? patternMessage,
            String scannerId)?
        handleScanner,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DigitScannerScanEvent() when handleScanner != null:
        return handleScanner(_that.barCode, _that.qrCode, _that.manualCode,
            _that.regex, _that.patternMessage, _that.scannerId);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<GS1Barcode> barCode,
            List<String> qrCode,
            String manualCode,
            String? regex,
            String? patternMessage,
            String scannerId)
        handleScanner,
  }) {
    final _that = this;
    switch (_that) {
      case DigitScannerScanEvent():
        return handleScanner(_that.barCode, _that.qrCode, _that.manualCode,
            _that.regex, _that.patternMessage, _that.scannerId);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<GS1Barcode> barCode,
            List<String> qrCode,
            String manualCode,
            String? regex,
            String? patternMessage,
            String scannerId)?
        handleScanner,
  }) {
    final _that = this;
    switch (_that) {
      case DigitScannerScanEvent() when handleScanner != null:
        return handleScanner(_that.barCode, _that.qrCode, _that.manualCode,
            _that.regex, _that.patternMessage, _that.scannerId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class DigitScannerScanEvent implements DigitScannerEvent {
  const DigitScannerScanEvent(
      {final List<GS1Barcode> barCode = const [],
      final List<String> qrCode = const [],
      this.manualCode = '',
      this.regex,
      this.patternMessage,
      this.scannerId = 'default'})
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
  final String? regex;
  @override
  final String? patternMessage;

  /// Identifier for which scanner field initiated this scan.
  /// Used to prevent multiple scanner fields from reacting to the same state change.
  /// Defaults to 'default' for backward compatibility with existing flows.
  @override
  @JsonKey()
  final String scannerId;

  /// Create a copy of DigitScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DigitScannerScanEventCopyWith<DigitScannerScanEvent> get copyWith =>
      _$DigitScannerScanEventCopyWithImpl<DigitScannerScanEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DigitScannerScanEvent &&
            const DeepCollectionEquality().equals(other._barCode, _barCode) &&
            const DeepCollectionEquality().equals(other._qrCode, _qrCode) &&
            (identical(other.manualCode, manualCode) ||
                other.manualCode == manualCode) &&
            (identical(other.regex, regex) || other.regex == regex) &&
            (identical(other.patternMessage, patternMessage) ||
                other.patternMessage == patternMessage) &&
            (identical(other.scannerId, scannerId) ||
                other.scannerId == scannerId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_barCode),
      const DeepCollectionEquality().hash(_qrCode),
      manualCode,
      regex,
      patternMessage,
      scannerId);

  @override
  String toString() {
    return 'DigitScannerEvent.handleScanner(barCode: $barCode, qrCode: $qrCode, manualCode: $manualCode, regex: $regex, patternMessage: $patternMessage, scannerId: $scannerId)';
  }
}

/// @nodoc
abstract mixin class $DigitScannerScanEventCopyWith<$Res>
    implements $DigitScannerEventCopyWith<$Res> {
  factory $DigitScannerScanEventCopyWith(DigitScannerScanEvent value,
          $Res Function(DigitScannerScanEvent) _then) =
      _$DigitScannerScanEventCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<GS1Barcode> barCode,
      List<String> qrCode,
      String manualCode,
      String? regex,
      String? patternMessage,
      String scannerId});
}

/// @nodoc
class _$DigitScannerScanEventCopyWithImpl<$Res>
    implements $DigitScannerScanEventCopyWith<$Res> {
  _$DigitScannerScanEventCopyWithImpl(this._self, this._then);

  final DigitScannerScanEvent _self;
  final $Res Function(DigitScannerScanEvent) _then;

  /// Create a copy of DigitScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? barCode = null,
    Object? qrCode = null,
    Object? manualCode = null,
    Object? regex = freezed,
    Object? patternMessage = freezed,
    Object? scannerId = null,
  }) {
    return _then(DigitScannerScanEvent(
      barCode: null == barCode
          ? _self._barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      qrCode: null == qrCode
          ? _self._qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as List<String>,
      manualCode: null == manualCode
          ? _self.manualCode
          : manualCode // ignore: cast_nullable_to_non_nullable
              as String,
      regex: freezed == regex
          ? _self.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as String?,
      patternMessage: freezed == patternMessage
          ? _self.patternMessage
          : patternMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      scannerId: null == scannerId
          ? _self.scannerId
          : scannerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$DigitScannerState {
  List<GS1Barcode> get barCodes;
  List<String> get qrCodes;
  bool get loading;
  bool get duplicate;
  String? get error;

  /// Identifier for which scanner field this state belongs to.
  /// Used to filter state changes for specific scanner fields.
  /// Defaults to 'default' for backward compatibility.
  String get scannerId;

  /// Create a copy of DigitScannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DigitScannerStateCopyWith<DigitScannerState> get copyWith =>
      _$DigitScannerStateCopyWithImpl<DigitScannerState>(
          this as DigitScannerState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DigitScannerState &&
            const DeepCollectionEquality().equals(other.barCodes, barCodes) &&
            const DeepCollectionEquality().equals(other.qrCodes, qrCodes) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.duplicate, duplicate) ||
                other.duplicate == duplicate) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.scannerId, scannerId) ||
                other.scannerId == scannerId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(barCodes),
      const DeepCollectionEquality().hash(qrCodes),
      loading,
      duplicate,
      error,
      scannerId);

  @override
  String toString() {
    return 'DigitScannerState(barCodes: $barCodes, qrCodes: $qrCodes, loading: $loading, duplicate: $duplicate, error: $error, scannerId: $scannerId)';
  }
}

/// @nodoc
abstract mixin class $DigitScannerStateCopyWith<$Res> {
  factory $DigitScannerStateCopyWith(
          DigitScannerState value, $Res Function(DigitScannerState) _then) =
      _$DigitScannerStateCopyWithImpl;
  @useResult
  $Res call(
      {List<GS1Barcode> barCodes,
      List<String> qrCodes,
      bool loading,
      bool duplicate,
      String? error,
      String scannerId});
}

/// @nodoc
class _$DigitScannerStateCopyWithImpl<$Res>
    implements $DigitScannerStateCopyWith<$Res> {
  _$DigitScannerStateCopyWithImpl(this._self, this._then);

  final DigitScannerState _self;
  final $Res Function(DigitScannerState) _then;

  /// Create a copy of DigitScannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barCodes = null,
    Object? qrCodes = null,
    Object? loading = null,
    Object? duplicate = null,
    Object? error = freezed,
    Object? scannerId = null,
  }) {
    return _then(_self.copyWith(
      barCodes: null == barCodes
          ? _self.barCodes
          : barCodes // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      qrCodes: null == qrCodes
          ? _self.qrCodes
          : qrCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      duplicate: null == duplicate
          ? _self.duplicate
          : duplicate // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      scannerId: null == scannerId
          ? _self.scannerId
          : scannerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [DigitScannerState].
extension DigitScannerStatePatterns on DigitScannerState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DigitScannerState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DigitScannerState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DigitScannerState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DigitScannerState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DigitScannerState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DigitScannerState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<GS1Barcode> barCodes, List<String> qrCodes,
            bool loading, bool duplicate, String? error, String scannerId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DigitScannerState() when $default != null:
        return $default(_that.barCodes, _that.qrCodes, _that.loading,
            _that.duplicate, _that.error, _that.scannerId);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<GS1Barcode> barCodes, List<String> qrCodes,
            bool loading, bool duplicate, String? error, String scannerId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DigitScannerState():
        return $default(_that.barCodes, _that.qrCodes, _that.loading,
            _that.duplicate, _that.error, _that.scannerId);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<GS1Barcode> barCodes, List<String> qrCodes,
            bool loading, bool duplicate, String? error, String scannerId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DigitScannerState() when $default != null:
        return $default(_that.barCodes, _that.qrCodes, _that.loading,
            _that.duplicate, _that.error, _that.scannerId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DigitScannerState implements DigitScannerState {
  const _DigitScannerState(
      {final List<GS1Barcode> barCodes = const [],
      final List<String> qrCodes = const [],
      this.loading = false,
      this.duplicate = false,
      this.error,
      this.scannerId = 'default'})
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
  final String? error;

  /// Identifier for which scanner field this state belongs to.
  /// Used to filter state changes for specific scanner fields.
  /// Defaults to 'default' for backward compatibility.
  @override
  @JsonKey()
  final String scannerId;

  /// Create a copy of DigitScannerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DigitScannerStateCopyWith<_DigitScannerState> get copyWith =>
      __$DigitScannerStateCopyWithImpl<_DigitScannerState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DigitScannerState &&
            const DeepCollectionEquality().equals(other._barCodes, _barCodes) &&
            const DeepCollectionEquality().equals(other._qrCodes, _qrCodes) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.duplicate, duplicate) ||
                other.duplicate == duplicate) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.scannerId, scannerId) ||
                other.scannerId == scannerId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_barCodes),
      const DeepCollectionEquality().hash(_qrCodes),
      loading,
      duplicate,
      error,
      scannerId);

  @override
  String toString() {
    return 'DigitScannerState(barCodes: $barCodes, qrCodes: $qrCodes, loading: $loading, duplicate: $duplicate, error: $error, scannerId: $scannerId)';
  }
}

/// @nodoc
abstract mixin class _$DigitScannerStateCopyWith<$Res>
    implements $DigitScannerStateCopyWith<$Res> {
  factory _$DigitScannerStateCopyWith(
          _DigitScannerState value, $Res Function(_DigitScannerState) _then) =
      __$DigitScannerStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<GS1Barcode> barCodes,
      List<String> qrCodes,
      bool loading,
      bool duplicate,
      String? error,
      String scannerId});
}

/// @nodoc
class __$DigitScannerStateCopyWithImpl<$Res>
    implements _$DigitScannerStateCopyWith<$Res> {
  __$DigitScannerStateCopyWithImpl(this._self, this._then);

  final _DigitScannerState _self;
  final $Res Function(_DigitScannerState) _then;

  /// Create a copy of DigitScannerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? barCodes = null,
    Object? qrCodes = null,
    Object? loading = null,
    Object? duplicate = null,
    Object? error = freezed,
    Object? scannerId = null,
  }) {
    return _then(_DigitScannerState(
      barCodes: null == barCodes
          ? _self._barCodes
          : barCodes // ignore: cast_nullable_to_non_nullable
              as List<GS1Barcode>,
      qrCodes: null == qrCodes
          ? _self._qrCodes
          : qrCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      duplicate: null == duplicate
          ? _self.duplicate
          : duplicate // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      scannerId: null == scannerId
          ? _self.scannerId
          : scannerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

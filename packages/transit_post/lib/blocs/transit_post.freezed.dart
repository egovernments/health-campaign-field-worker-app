// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transit_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransitPostEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TransitPostEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TransitPostEvent()';
  }
}

/// @nodoc
class $TransitPostEventCopyWith<$Res> {
  $TransitPostEventCopyWith(
      TransitPostEvent _, $Res Function(TransitPostEvent) __);
}

/// Adds pattern-matching-related methods to [TransitPostEvent].
extension TransitPostEventPatterns on TransitPostEvent {
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
    TResult Function(TransitPostSelectionEvent value)? handleSelection,
    TResult Function(TransitPostDeliveryEvent value)? handleDelivery,
    TResult Function(TransitPostDeliveryCountEvent value)? handleDeliveryCount,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TransitPostSelectionEvent() when handleSelection != null:
        return handleSelection(_that);
      case TransitPostDeliveryEvent() when handleDelivery != null:
        return handleDelivery(_that);
      case TransitPostDeliveryCountEvent() when handleDeliveryCount != null:
        return handleDeliveryCount(_that);
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
    required TResult Function(TransitPostSelectionEvent value) handleSelection,
    required TResult Function(TransitPostDeliveryEvent value) handleDelivery,
    required TResult Function(TransitPostDeliveryCountEvent value)
        handleDeliveryCount,
  }) {
    final _that = this;
    switch (_that) {
      case TransitPostSelectionEvent():
        return handleSelection(_that);
      case TransitPostDeliveryEvent():
        return handleDelivery(_that);
      case TransitPostDeliveryCountEvent():
        return handleDeliveryCount(_that);
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
    TResult? Function(TransitPostSelectionEvent value)? handleSelection,
    TResult? Function(TransitPostDeliveryEvent value)? handleDelivery,
    TResult? Function(TransitPostDeliveryCountEvent value)? handleDeliveryCount,
  }) {
    final _that = this;
    switch (_that) {
      case TransitPostSelectionEvent() when handleSelection != null:
        return handleSelection(_that);
      case TransitPostDeliveryEvent() when handleDelivery != null:
        return handleDelivery(_that);
      case TransitPostDeliveryCountEvent() when handleDeliveryCount != null:
        return handleDeliveryCount(_that);
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
    TResult Function(double latitude, double longitude, double locationAccuracy,
            String? transitPostType, String? transitPostName)?
        handleSelection,
    TResult Function(double latitude, double longitude, double locationAccuracy,
            String? scannedResource, int? curCount, int? totalCount)?
        handleDelivery,
    TResult Function(int curCount, int totalCount)? handleDeliveryCount,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TransitPostSelectionEvent() when handleSelection != null:
        return handleSelection(
            _that.latitude,
            _that.longitude,
            _that.locationAccuracy,
            _that.transitPostType,
            _that.transitPostName);
      case TransitPostDeliveryEvent() when handleDelivery != null:
        return handleDelivery(
            _that.latitude,
            _that.longitude,
            _that.locationAccuracy,
            _that.scannedResource,
            _that.curCount,
            _that.totalCount);
      case TransitPostDeliveryCountEvent() when handleDeliveryCount != null:
        return handleDeliveryCount(_that.curCount, _that.totalCount);
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
            double latitude,
            double longitude,
            double locationAccuracy,
            String? transitPostType,
            String? transitPostName)
        handleSelection,
    required TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            int? curCount,
            int? totalCount)
        handleDelivery,
    required TResult Function(int curCount, int totalCount) handleDeliveryCount,
  }) {
    final _that = this;
    switch (_that) {
      case TransitPostSelectionEvent():
        return handleSelection(
            _that.latitude,
            _that.longitude,
            _that.locationAccuracy,
            _that.transitPostType,
            _that.transitPostName);
      case TransitPostDeliveryEvent():
        return handleDelivery(
            _that.latitude,
            _that.longitude,
            _that.locationAccuracy,
            _that.scannedResource,
            _that.curCount,
            _that.totalCount);
      case TransitPostDeliveryCountEvent():
        return handleDeliveryCount(_that.curCount, _that.totalCount);
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
            double latitude,
            double longitude,
            double locationAccuracy,
            String? transitPostType,
            String? transitPostName)?
        handleSelection,
    TResult? Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            int? curCount,
            int? totalCount)?
        handleDelivery,
    TResult? Function(int curCount, int totalCount)? handleDeliveryCount,
  }) {
    final _that = this;
    switch (_that) {
      case TransitPostSelectionEvent() when handleSelection != null:
        return handleSelection(
            _that.latitude,
            _that.longitude,
            _that.locationAccuracy,
            _that.transitPostType,
            _that.transitPostName);
      case TransitPostDeliveryEvent() when handleDelivery != null:
        return handleDelivery(
            _that.latitude,
            _that.longitude,
            _that.locationAccuracy,
            _that.scannedResource,
            _that.curCount,
            _that.totalCount);
      case TransitPostDeliveryCountEvent() when handleDeliveryCount != null:
        return handleDeliveryCount(_that.curCount, _that.totalCount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class TransitPostSelectionEvent implements TransitPostEvent {
  const TransitPostSelectionEvent(
      {this.latitude = 0,
      this.longitude = 0,
      this.locationAccuracy = 0,
      this.transitPostType,
      this.transitPostName});

  @JsonKey()
  final double latitude;
  @JsonKey()
  final double longitude;
  @JsonKey()
  final double locationAccuracy;
  final String? transitPostType;
  final String? transitPostName;

  /// Create a copy of TransitPostEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransitPostSelectionEventCopyWith<TransitPostSelectionEvent> get copyWith =>
      _$TransitPostSelectionEventCopyWithImpl<TransitPostSelectionEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransitPostSelectionEvent &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationAccuracy, locationAccuracy) ||
                other.locationAccuracy == locationAccuracy) &&
            (identical(other.transitPostType, transitPostType) ||
                other.transitPostType == transitPostType) &&
            (identical(other.transitPostName, transitPostName) ||
                other.transitPostName == transitPostName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude,
      locationAccuracy, transitPostType, transitPostName);

  @override
  String toString() {
    return 'TransitPostEvent.handleSelection(latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, transitPostType: $transitPostType, transitPostName: $transitPostName)';
  }
}

/// @nodoc
abstract mixin class $TransitPostSelectionEventCopyWith<$Res>
    implements $TransitPostEventCopyWith<$Res> {
  factory $TransitPostSelectionEventCopyWith(TransitPostSelectionEvent value,
          $Res Function(TransitPostSelectionEvent) _then) =
      _$TransitPostSelectionEventCopyWithImpl;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double locationAccuracy,
      String? transitPostType,
      String? transitPostName});
}

/// @nodoc
class _$TransitPostSelectionEventCopyWithImpl<$Res>
    implements $TransitPostSelectionEventCopyWith<$Res> {
  _$TransitPostSelectionEventCopyWithImpl(this._self, this._then);

  final TransitPostSelectionEvent _self;
  final $Res Function(TransitPostSelectionEvent) _then;

  /// Create a copy of TransitPostEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? transitPostType = freezed,
    Object? transitPostName = freezed,
  }) {
    return _then(TransitPostSelectionEvent(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      locationAccuracy: null == locationAccuracy
          ? _self.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      transitPostType: freezed == transitPostType
          ? _self.transitPostType
          : transitPostType // ignore: cast_nullable_to_non_nullable
              as String?,
      transitPostName: freezed == transitPostName
          ? _self.transitPostName
          : transitPostName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class TransitPostDeliveryEvent implements TransitPostEvent {
  const TransitPostDeliveryEvent(
      {this.latitude = 0,
      this.longitude = 0,
      this.locationAccuracy = 0,
      this.scannedResource,
      this.curCount,
      this.totalCount});

  @JsonKey()
  final double latitude;
  @JsonKey()
  final double longitude;
  @JsonKey()
  final double locationAccuracy;
  final String? scannedResource;
  final int? curCount;
  final int? totalCount;

  /// Create a copy of TransitPostEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransitPostDeliveryEventCopyWith<TransitPostDeliveryEvent> get copyWith =>
      _$TransitPostDeliveryEventCopyWithImpl<TransitPostDeliveryEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransitPostDeliveryEvent &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationAccuracy, locationAccuracy) ||
                other.locationAccuracy == locationAccuracy) &&
            (identical(other.scannedResource, scannedResource) ||
                other.scannedResource == scannedResource) &&
            (identical(other.curCount, curCount) ||
                other.curCount == curCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude,
      locationAccuracy, scannedResource, curCount, totalCount);

  @override
  String toString() {
    return 'TransitPostEvent.handleDelivery(latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, scannedResource: $scannedResource, curCount: $curCount, totalCount: $totalCount)';
  }
}

/// @nodoc
abstract mixin class $TransitPostDeliveryEventCopyWith<$Res>
    implements $TransitPostEventCopyWith<$Res> {
  factory $TransitPostDeliveryEventCopyWith(TransitPostDeliveryEvent value,
          $Res Function(TransitPostDeliveryEvent) _then) =
      _$TransitPostDeliveryEventCopyWithImpl;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double locationAccuracy,
      String? scannedResource,
      int? curCount,
      int? totalCount});
}

/// @nodoc
class _$TransitPostDeliveryEventCopyWithImpl<$Res>
    implements $TransitPostDeliveryEventCopyWith<$Res> {
  _$TransitPostDeliveryEventCopyWithImpl(this._self, this._then);

  final TransitPostDeliveryEvent _self;
  final $Res Function(TransitPostDeliveryEvent) _then;

  /// Create a copy of TransitPostEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? scannedResource = freezed,
    Object? curCount = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(TransitPostDeliveryEvent(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      locationAccuracy: null == locationAccuracy
          ? _self.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      scannedResource: freezed == scannedResource
          ? _self.scannedResource
          : scannedResource // ignore: cast_nullable_to_non_nullable
              as String?,
      curCount: freezed == curCount
          ? _self.curCount
          : curCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class TransitPostDeliveryCountEvent implements TransitPostEvent {
  const TransitPostDeliveryCountEvent({this.curCount = 0, this.totalCount = 0});

  @JsonKey()
  final int curCount;
  @JsonKey()
  final int totalCount;

  /// Create a copy of TransitPostEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransitPostDeliveryCountEventCopyWith<TransitPostDeliveryCountEvent>
      get copyWith => _$TransitPostDeliveryCountEventCopyWithImpl<
          TransitPostDeliveryCountEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransitPostDeliveryCountEvent &&
            (identical(other.curCount, curCount) ||
                other.curCount == curCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, curCount, totalCount);

  @override
  String toString() {
    return 'TransitPostEvent.handleDeliveryCount(curCount: $curCount, totalCount: $totalCount)';
  }
}

/// @nodoc
abstract mixin class $TransitPostDeliveryCountEventCopyWith<$Res>
    implements $TransitPostEventCopyWith<$Res> {
  factory $TransitPostDeliveryCountEventCopyWith(
          TransitPostDeliveryCountEvent value,
          $Res Function(TransitPostDeliveryCountEvent) _then) =
      _$TransitPostDeliveryCountEventCopyWithImpl;
  @useResult
  $Res call({int curCount, int totalCount});
}

/// @nodoc
class _$TransitPostDeliveryCountEventCopyWithImpl<$Res>
    implements $TransitPostDeliveryCountEventCopyWith<$Res> {
  _$TransitPostDeliveryCountEventCopyWithImpl(this._self, this._then);

  final TransitPostDeliveryCountEvent _self;
  final $Res Function(TransitPostDeliveryCountEvent) _then;

  /// Create a copy of TransitPostEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? curCount = null,
    Object? totalCount = null,
  }) {
    return _then(TransitPostDeliveryCountEvent(
      curCount: null == curCount
          ? _self.curCount
          : curCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$TransitPostState {
  dynamic get loading;
  double get latitude;
  double get longitude;
  double get locationAccuracy;
  String? get transitPostType;
  String? get transitPostName;
  int? get curCount;
  int? get totalCount;

  /// Create a copy of TransitPostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransitPostStateCopyWith<TransitPostState> get copyWith =>
      _$TransitPostStateCopyWithImpl<TransitPostState>(
          this as TransitPostState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransitPostState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationAccuracy, locationAccuracy) ||
                other.locationAccuracy == locationAccuracy) &&
            (identical(other.transitPostType, transitPostType) ||
                other.transitPostType == transitPostType) &&
            (identical(other.transitPostName, transitPostName) ||
                other.transitPostName == transitPostName) &&
            (identical(other.curCount, curCount) ||
                other.curCount == curCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      latitude,
      longitude,
      locationAccuracy,
      transitPostType,
      transitPostName,
      curCount,
      totalCount);

  @override
  String toString() {
    return 'TransitPostState(loading: $loading, latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, transitPostType: $transitPostType, transitPostName: $transitPostName, curCount: $curCount, totalCount: $totalCount)';
  }
}

/// @nodoc
abstract mixin class $TransitPostStateCopyWith<$Res> {
  factory $TransitPostStateCopyWith(
          TransitPostState value, $Res Function(TransitPostState) _then) =
      _$TransitPostStateCopyWithImpl;
  @useResult
  $Res call(
      {dynamic loading,
      double latitude,
      double longitude,
      double locationAccuracy,
      String? transitPostType,
      String? transitPostName,
      int? curCount,
      int? totalCount});
}

/// @nodoc
class _$TransitPostStateCopyWithImpl<$Res>
    implements $TransitPostStateCopyWith<$Res> {
  _$TransitPostStateCopyWithImpl(this._self, this._then);

  final TransitPostState _self;
  final $Res Function(TransitPostState) _then;

  /// Create a copy of TransitPostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? transitPostType = freezed,
    Object? transitPostName = freezed,
    Object? curCount = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_self.copyWith(
      loading: freezed == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      locationAccuracy: null == locationAccuracy
          ? _self.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      transitPostType: freezed == transitPostType
          ? _self.transitPostType
          : transitPostType // ignore: cast_nullable_to_non_nullable
              as String?,
      transitPostName: freezed == transitPostName
          ? _self.transitPostName
          : transitPostName // ignore: cast_nullable_to_non_nullable
              as String?,
      curCount: freezed == curCount
          ? _self.curCount
          : curCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TransitPostState].
extension TransitPostStatePatterns on TransitPostState {
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
    TResult Function(_TransitPostState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TransitPostState() when $default != null:
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
    TResult Function(_TransitPostState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransitPostState():
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
    TResult? Function(_TransitPostState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransitPostState() when $default != null:
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
    TResult Function(
            dynamic loading,
            double latitude,
            double longitude,
            double locationAccuracy,
            String? transitPostType,
            String? transitPostName,
            int? curCount,
            int? totalCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TransitPostState() when $default != null:
        return $default(
            _that.loading,
            _that.latitude,
            _that.longitude,
            _that.locationAccuracy,
            _that.transitPostType,
            _that.transitPostName,
            _that.curCount,
            _that.totalCount);
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
    TResult Function(
            dynamic loading,
            double latitude,
            double longitude,
            double locationAccuracy,
            String? transitPostType,
            String? transitPostName,
            int? curCount,
            int? totalCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransitPostState():
        return $default(
            _that.loading,
            _that.latitude,
            _that.longitude,
            _that.locationAccuracy,
            _that.transitPostType,
            _that.transitPostName,
            _that.curCount,
            _that.totalCount);
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
    TResult? Function(
            dynamic loading,
            double latitude,
            double longitude,
            double locationAccuracy,
            String? transitPostType,
            String? transitPostName,
            int? curCount,
            int? totalCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransitPostState() when $default != null:
        return $default(
            _that.loading,
            _that.latitude,
            _that.longitude,
            _that.locationAccuracy,
            _that.transitPostType,
            _that.transitPostName,
            _that.curCount,
            _that.totalCount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TransitPostState implements TransitPostState {
  const _TransitPostState(
      {this.loading = false,
      this.latitude = 0,
      this.longitude = 0,
      this.locationAccuracy = 0,
      this.transitPostType,
      this.transitPostName,
      this.curCount,
      this.totalCount});

  @override
  @JsonKey()
  final dynamic loading;
  @override
  @JsonKey()
  final double latitude;
  @override
  @JsonKey()
  final double longitude;
  @override
  @JsonKey()
  final double locationAccuracy;
  @override
  final String? transitPostType;
  @override
  final String? transitPostName;
  @override
  final int? curCount;
  @override
  final int? totalCount;

  /// Create a copy of TransitPostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TransitPostStateCopyWith<_TransitPostState> get copyWith =>
      __$TransitPostStateCopyWithImpl<_TransitPostState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransitPostState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationAccuracy, locationAccuracy) ||
                other.locationAccuracy == locationAccuracy) &&
            (identical(other.transitPostType, transitPostType) ||
                other.transitPostType == transitPostType) &&
            (identical(other.transitPostName, transitPostName) ||
                other.transitPostName == transitPostName) &&
            (identical(other.curCount, curCount) ||
                other.curCount == curCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      latitude,
      longitude,
      locationAccuracy,
      transitPostType,
      transitPostName,
      curCount,
      totalCount);

  @override
  String toString() {
    return 'TransitPostState(loading: $loading, latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, transitPostType: $transitPostType, transitPostName: $transitPostName, curCount: $curCount, totalCount: $totalCount)';
  }
}

/// @nodoc
abstract mixin class _$TransitPostStateCopyWith<$Res>
    implements $TransitPostStateCopyWith<$Res> {
  factory _$TransitPostStateCopyWith(
          _TransitPostState value, $Res Function(_TransitPostState) _then) =
      __$TransitPostStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {dynamic loading,
      double latitude,
      double longitude,
      double locationAccuracy,
      String? transitPostType,
      String? transitPostName,
      int? curCount,
      int? totalCount});
}

/// @nodoc
class __$TransitPostStateCopyWithImpl<$Res>
    implements _$TransitPostStateCopyWith<$Res> {
  __$TransitPostStateCopyWithImpl(this._self, this._then);

  final _TransitPostState _self;
  final $Res Function(_TransitPostState) _then;

  /// Create a copy of TransitPostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loading = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? transitPostType = freezed,
    Object? transitPostName = freezed,
    Object? curCount = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_TransitPostState(
      loading: freezed == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      locationAccuracy: null == locationAccuracy
          ? _self.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      transitPostType: freezed == transitPostType
          ? _self.transitPostType
          : transitPostType // ignore: cast_nullable_to_non_nullable
              as String?,
      transitPostName: freezed == transitPostName
          ? _self.transitPostName
          : transitPostName // ignore: cast_nullable_to_non_nullable
              as String?,
      curCount: freezed == curCount
          ? _self.curCount
          : curCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transit_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransitPostEvent {
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransitPostSelectionEvent value) handleSelection,
    required TResult Function(TransitPostDeliveryEvent value) handleDelivery,
    required TResult Function(TransitPostDeliveryCountEvent value)
        handleDeliveryCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransitPostSelectionEvent value)? handleSelection,
    TResult? Function(TransitPostDeliveryEvent value)? handleDelivery,
    TResult? Function(TransitPostDeliveryCountEvent value)? handleDeliveryCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransitPostSelectionEvent value)? handleSelection,
    TResult Function(TransitPostDeliveryEvent value)? handleDelivery,
    TResult Function(TransitPostDeliveryCountEvent value)? handleDeliveryCount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransitPostEventCopyWith<$Res> {
  factory $TransitPostEventCopyWith(
          TransitPostEvent value, $Res Function(TransitPostEvent) then) =
      _$TransitPostEventCopyWithImpl<$Res, TransitPostEvent>;
}

/// @nodoc
class _$TransitPostEventCopyWithImpl<$Res, $Val extends TransitPostEvent>
    implements $TransitPostEventCopyWith<$Res> {
  _$TransitPostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TransitPostSelectionEventImplCopyWith<$Res> {
  factory _$$TransitPostSelectionEventImplCopyWith(
          _$TransitPostSelectionEventImpl value,
          $Res Function(_$TransitPostSelectionEventImpl) then) =
      __$$TransitPostSelectionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double locationAccuracy,
      String? transitPostType,
      String? transitPostName});
}

/// @nodoc
class __$$TransitPostSelectionEventImplCopyWithImpl<$Res>
    extends _$TransitPostEventCopyWithImpl<$Res,
        _$TransitPostSelectionEventImpl>
    implements _$$TransitPostSelectionEventImplCopyWith<$Res> {
  __$$TransitPostSelectionEventImplCopyWithImpl(
      _$TransitPostSelectionEventImpl _value,
      $Res Function(_$TransitPostSelectionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? transitPostType = freezed,
    Object? transitPostName = freezed,
  }) {
    return _then(_$TransitPostSelectionEventImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      locationAccuracy: null == locationAccuracy
          ? _value.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      transitPostType: freezed == transitPostType
          ? _value.transitPostType
          : transitPostType // ignore: cast_nullable_to_non_nullable
              as String?,
      transitPostName: freezed == transitPostName
          ? _value.transitPostName
          : transitPostName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TransitPostSelectionEventImpl implements TransitPostSelectionEvent {
  const _$TransitPostSelectionEventImpl(
      {this.latitude = 0,
      this.longitude = 0,
      this.locationAccuracy = 0,
      this.transitPostType,
      this.transitPostName});

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
  String toString() {
    return 'TransitPostEvent.handleSelection(latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, transitPostType: $transitPostType, transitPostName: $transitPostName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransitPostSelectionEventImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransitPostSelectionEventImplCopyWith<_$TransitPostSelectionEventImpl>
      get copyWith => __$$TransitPostSelectionEventImplCopyWithImpl<
          _$TransitPostSelectionEventImpl>(this, _$identity);

  @override
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
    return handleSelection(latitude, longitude, locationAccuracy,
        transitPostType, transitPostName);
  }

  @override
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
    return handleSelection?.call(latitude, longitude, locationAccuracy,
        transitPostType, transitPostName);
  }

  @override
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
    if (handleSelection != null) {
      return handleSelection(latitude, longitude, locationAccuracy,
          transitPostType, transitPostName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransitPostSelectionEvent value) handleSelection,
    required TResult Function(TransitPostDeliveryEvent value) handleDelivery,
    required TResult Function(TransitPostDeliveryCountEvent value)
        handleDeliveryCount,
  }) {
    return handleSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransitPostSelectionEvent value)? handleSelection,
    TResult? Function(TransitPostDeliveryEvent value)? handleDelivery,
    TResult? Function(TransitPostDeliveryCountEvent value)? handleDeliveryCount,
  }) {
    return handleSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransitPostSelectionEvent value)? handleSelection,
    TResult Function(TransitPostDeliveryEvent value)? handleDelivery,
    TResult Function(TransitPostDeliveryCountEvent value)? handleDeliveryCount,
    required TResult orElse(),
  }) {
    if (handleSelection != null) {
      return handleSelection(this);
    }
    return orElse();
  }
}

abstract class TransitPostSelectionEvent implements TransitPostEvent {
  const factory TransitPostSelectionEvent(
      {final double latitude,
      final double longitude,
      final double locationAccuracy,
      final String? transitPostType,
      final String? transitPostName}) = _$TransitPostSelectionEventImpl;

  double get latitude;
  double get longitude;
  double get locationAccuracy;
  String? get transitPostType;
  String? get transitPostName;
  @JsonKey(ignore: true)
  _$$TransitPostSelectionEventImplCopyWith<_$TransitPostSelectionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransitPostDeliveryEventImplCopyWith<$Res> {
  factory _$$TransitPostDeliveryEventImplCopyWith(
          _$TransitPostDeliveryEventImpl value,
          $Res Function(_$TransitPostDeliveryEventImpl) then) =
      __$$TransitPostDeliveryEventImplCopyWithImpl<$Res>;
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
class __$$TransitPostDeliveryEventImplCopyWithImpl<$Res>
    extends _$TransitPostEventCopyWithImpl<$Res, _$TransitPostDeliveryEventImpl>
    implements _$$TransitPostDeliveryEventImplCopyWith<$Res> {
  __$$TransitPostDeliveryEventImplCopyWithImpl(
      _$TransitPostDeliveryEventImpl _value,
      $Res Function(_$TransitPostDeliveryEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? scannedResource = freezed,
    Object? curCount = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$TransitPostDeliveryEventImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      locationAccuracy: null == locationAccuracy
          ? _value.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      scannedResource: freezed == scannedResource
          ? _value.scannedResource
          : scannedResource // ignore: cast_nullable_to_non_nullable
              as String?,
      curCount: freezed == curCount
          ? _value.curCount
          : curCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$TransitPostDeliveryEventImpl implements TransitPostDeliveryEvent {
  const _$TransitPostDeliveryEventImpl(
      {this.latitude = 0,
      this.longitude = 0,
      this.locationAccuracy = 0,
      this.scannedResource,
      this.curCount,
      this.totalCount});

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
  final String? scannedResource;
  @override
  final int? curCount;
  @override
  final int? totalCount;

  @override
  String toString() {
    return 'TransitPostEvent.handleDelivery(latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, scannedResource: $scannedResource, curCount: $curCount, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransitPostDeliveryEventImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransitPostDeliveryEventImplCopyWith<_$TransitPostDeliveryEventImpl>
      get copyWith => __$$TransitPostDeliveryEventImplCopyWithImpl<
          _$TransitPostDeliveryEventImpl>(this, _$identity);

  @override
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
    return handleDelivery(latitude, longitude, locationAccuracy,
        scannedResource, curCount, totalCount);
  }

  @override
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
    return handleDelivery?.call(latitude, longitude, locationAccuracy,
        scannedResource, curCount, totalCount);
  }

  @override
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
    if (handleDelivery != null) {
      return handleDelivery(latitude, longitude, locationAccuracy,
          scannedResource, curCount, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransitPostSelectionEvent value) handleSelection,
    required TResult Function(TransitPostDeliveryEvent value) handleDelivery,
    required TResult Function(TransitPostDeliveryCountEvent value)
        handleDeliveryCount,
  }) {
    return handleDelivery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransitPostSelectionEvent value)? handleSelection,
    TResult? Function(TransitPostDeliveryEvent value)? handleDelivery,
    TResult? Function(TransitPostDeliveryCountEvent value)? handleDeliveryCount,
  }) {
    return handleDelivery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransitPostSelectionEvent value)? handleSelection,
    TResult Function(TransitPostDeliveryEvent value)? handleDelivery,
    TResult Function(TransitPostDeliveryCountEvent value)? handleDeliveryCount,
    required TResult orElse(),
  }) {
    if (handleDelivery != null) {
      return handleDelivery(this);
    }
    return orElse();
  }
}

abstract class TransitPostDeliveryEvent implements TransitPostEvent {
  const factory TransitPostDeliveryEvent(
      {final double latitude,
      final double longitude,
      final double locationAccuracy,
      final String? scannedResource,
      final int? curCount,
      final int? totalCount}) = _$TransitPostDeliveryEventImpl;

  double get latitude;
  double get longitude;
  double get locationAccuracy;
  String? get scannedResource;
  int? get curCount;
  int? get totalCount;
  @JsonKey(ignore: true)
  _$$TransitPostDeliveryEventImplCopyWith<_$TransitPostDeliveryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransitPostDeliveryCountEventImplCopyWith<$Res> {
  factory _$$TransitPostDeliveryCountEventImplCopyWith(
          _$TransitPostDeliveryCountEventImpl value,
          $Res Function(_$TransitPostDeliveryCountEventImpl) then) =
      __$$TransitPostDeliveryCountEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int curCount, int totalCount});
}

/// @nodoc
class __$$TransitPostDeliveryCountEventImplCopyWithImpl<$Res>
    extends _$TransitPostEventCopyWithImpl<$Res,
        _$TransitPostDeliveryCountEventImpl>
    implements _$$TransitPostDeliveryCountEventImplCopyWith<$Res> {
  __$$TransitPostDeliveryCountEventImplCopyWithImpl(
      _$TransitPostDeliveryCountEventImpl _value,
      $Res Function(_$TransitPostDeliveryCountEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curCount = null,
    Object? totalCount = null,
  }) {
    return _then(_$TransitPostDeliveryCountEventImpl(
      curCount: null == curCount
          ? _value.curCount
          : curCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TransitPostDeliveryCountEventImpl
    implements TransitPostDeliveryCountEvent {
  const _$TransitPostDeliveryCountEventImpl(
      {this.curCount = 0, this.totalCount = 0});

  @override
  @JsonKey()
  final int curCount;
  @override
  @JsonKey()
  final int totalCount;

  @override
  String toString() {
    return 'TransitPostEvent.handleDeliveryCount(curCount: $curCount, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransitPostDeliveryCountEventImpl &&
            (identical(other.curCount, curCount) ||
                other.curCount == curCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, curCount, totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransitPostDeliveryCountEventImplCopyWith<
          _$TransitPostDeliveryCountEventImpl>
      get copyWith => __$$TransitPostDeliveryCountEventImplCopyWithImpl<
          _$TransitPostDeliveryCountEventImpl>(this, _$identity);

  @override
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
    return handleDeliveryCount(curCount, totalCount);
  }

  @override
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
    return handleDeliveryCount?.call(curCount, totalCount);
  }

  @override
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
    if (handleDeliveryCount != null) {
      return handleDeliveryCount(curCount, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransitPostSelectionEvent value) handleSelection,
    required TResult Function(TransitPostDeliveryEvent value) handleDelivery,
    required TResult Function(TransitPostDeliveryCountEvent value)
        handleDeliveryCount,
  }) {
    return handleDeliveryCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransitPostSelectionEvent value)? handleSelection,
    TResult? Function(TransitPostDeliveryEvent value)? handleDelivery,
    TResult? Function(TransitPostDeliveryCountEvent value)? handleDeliveryCount,
  }) {
    return handleDeliveryCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransitPostSelectionEvent value)? handleSelection,
    TResult Function(TransitPostDeliveryEvent value)? handleDelivery,
    TResult Function(TransitPostDeliveryCountEvent value)? handleDeliveryCount,
    required TResult orElse(),
  }) {
    if (handleDeliveryCount != null) {
      return handleDeliveryCount(this);
    }
    return orElse();
  }
}

abstract class TransitPostDeliveryCountEvent implements TransitPostEvent {
  const factory TransitPostDeliveryCountEvent(
      {final int curCount,
      final int totalCount}) = _$TransitPostDeliveryCountEventImpl;

  int get curCount;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$TransitPostDeliveryCountEventImplCopyWith<
          _$TransitPostDeliveryCountEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransitPostState {
  dynamic get loading => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get locationAccuracy => throw _privateConstructorUsedError;
  String? get transitPostType => throw _privateConstructorUsedError;
  String? get transitPostName => throw _privateConstructorUsedError;
  int? get curCount => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransitPostStateCopyWith<TransitPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransitPostStateCopyWith<$Res> {
  factory $TransitPostStateCopyWith(
          TransitPostState value, $Res Function(TransitPostState) then) =
      _$TransitPostStateCopyWithImpl<$Res, TransitPostState>;
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
class _$TransitPostStateCopyWithImpl<$Res, $Val extends TransitPostState>
    implements $TransitPostStateCopyWith<$Res> {
  _$TransitPostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      loading: freezed == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      locationAccuracy: null == locationAccuracy
          ? _value.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      transitPostType: freezed == transitPostType
          ? _value.transitPostType
          : transitPostType // ignore: cast_nullable_to_non_nullable
              as String?,
      transitPostName: freezed == transitPostName
          ? _value.transitPostName
          : transitPostName // ignore: cast_nullable_to_non_nullable
              as String?,
      curCount: freezed == curCount
          ? _value.curCount
          : curCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransitPostStateImplCopyWith<$Res>
    implements $TransitPostStateCopyWith<$Res> {
  factory _$$TransitPostStateImplCopyWith(_$TransitPostStateImpl value,
          $Res Function(_$TransitPostStateImpl) then) =
      __$$TransitPostStateImplCopyWithImpl<$Res>;
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
class __$$TransitPostStateImplCopyWithImpl<$Res>
    extends _$TransitPostStateCopyWithImpl<$Res, _$TransitPostStateImpl>
    implements _$$TransitPostStateImplCopyWith<$Res> {
  __$$TransitPostStateImplCopyWithImpl(_$TransitPostStateImpl _value,
      $Res Function(_$TransitPostStateImpl) _then)
      : super(_value, _then);

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
    return _then(_$TransitPostStateImpl(
      loading: freezed == loading ? _value.loading! : loading,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      locationAccuracy: null == locationAccuracy
          ? _value.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      transitPostType: freezed == transitPostType
          ? _value.transitPostType
          : transitPostType // ignore: cast_nullable_to_non_nullable
              as String?,
      transitPostName: freezed == transitPostName
          ? _value.transitPostName
          : transitPostName // ignore: cast_nullable_to_non_nullable
              as String?,
      curCount: freezed == curCount
          ? _value.curCount
          : curCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$TransitPostStateImpl implements _TransitPostState {
  const _$TransitPostStateImpl(
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

  @override
  String toString() {
    return 'TransitPostState(loading: $loading, latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, transitPostType: $transitPostType, transitPostName: $transitPostName, curCount: $curCount, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransitPostStateImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransitPostStateImplCopyWith<_$TransitPostStateImpl> get copyWith =>
      __$$TransitPostStateImplCopyWithImpl<_$TransitPostStateImpl>(
          this, _$identity);
}

abstract class _TransitPostState implements TransitPostState {
  const factory _TransitPostState(
      {final dynamic loading,
      final double latitude,
      final double longitude,
      final double locationAccuracy,
      final String? transitPostType,
      final String? transitPostName,
      final int? curCount,
      final int? totalCount}) = _$TransitPostStateImpl;

  @override
  dynamic get loading;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get locationAccuracy;
  @override
  String? get transitPostType;
  @override
  String? get transitPostName;
  @override
  int? get curCount;
  @override
  int? get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$TransitPostStateImplCopyWith<_$TransitPostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

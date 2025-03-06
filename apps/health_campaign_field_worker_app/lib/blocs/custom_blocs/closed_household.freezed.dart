// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'closed_household.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClosedHouseholdEvent {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get locationAccuracy => throw _privateConstructorUsedError;
  String? get householdHeadName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? reason,
            double latitude,
            double longitude,
            double locationAccuracy,
            String? householdHeadName,
            String? tag,
            BuildContext? context)
        handleSubmit,
    required TResult Function(double latitude, double longitude,
            double locationAccuracy, String? householdHeadName)
        handleSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? reason,
            double latitude,
            double longitude,
            double locationAccuracy,
            String? householdHeadName,
            String? tag,
            BuildContext? context)?
        handleSubmit,
    TResult? Function(double latitude, double longitude,
            double locationAccuracy, String? householdHeadName)?
        handleSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? reason,
            double latitude,
            double longitude,
            double locationAccuracy,
            String? householdHeadName,
            String? tag,
            BuildContext? context)?
        handleSubmit,
    TResult Function(double latitude, double longitude, double locationAccuracy,
            String? householdHeadName)?
        handleSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClosedHouseholdSubmitEvent value) handleSubmit,
    required TResult Function(ClosedHouseholdSummaryEvent value) handleSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClosedHouseholdSubmitEvent value)? handleSubmit,
    TResult? Function(ClosedHouseholdSummaryEvent value)? handleSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClosedHouseholdSubmitEvent value)? handleSubmit,
    TResult Function(ClosedHouseholdSummaryEvent value)? handleSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClosedHouseholdEventCopyWith<ClosedHouseholdEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosedHouseholdEventCopyWith<$Res> {
  factory $ClosedHouseholdEventCopyWith(ClosedHouseholdEvent value,
          $Res Function(ClosedHouseholdEvent) then) =
      _$ClosedHouseholdEventCopyWithImpl<$Res, ClosedHouseholdEvent>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double locationAccuracy,
      String? householdHeadName});
}

/// @nodoc
class _$ClosedHouseholdEventCopyWithImpl<$Res,
        $Val extends ClosedHouseholdEvent>
    implements $ClosedHouseholdEventCopyWith<$Res> {
  _$ClosedHouseholdEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? householdHeadName = freezed,
  }) {
    return _then(_value.copyWith(
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
      householdHeadName: freezed == householdHeadName
          ? _value.householdHeadName
          : householdHeadName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClosedHouseholdSubmitEventImplCopyWith<$Res>
    implements $ClosedHouseholdEventCopyWith<$Res> {
  factory _$$ClosedHouseholdSubmitEventImplCopyWith(
          _$ClosedHouseholdSubmitEventImpl value,
          $Res Function(_$ClosedHouseholdSubmitEventImpl) then) =
      __$$ClosedHouseholdSubmitEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? reason,
      double latitude,
      double longitude,
      double locationAccuracy,
      String? householdHeadName,
      String? tag,
      BuildContext? context});
}

/// @nodoc
class __$$ClosedHouseholdSubmitEventImplCopyWithImpl<$Res>
    extends _$ClosedHouseholdEventCopyWithImpl<$Res,
        _$ClosedHouseholdSubmitEventImpl>
    implements _$$ClosedHouseholdSubmitEventImplCopyWith<$Res> {
  __$$ClosedHouseholdSubmitEventImplCopyWithImpl(
      _$ClosedHouseholdSubmitEventImpl _value,
      $Res Function(_$ClosedHouseholdSubmitEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? householdHeadName = freezed,
    Object? tag = freezed,
    Object? context = freezed,
  }) {
    return _then(_$ClosedHouseholdSubmitEventImpl(
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
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
      householdHeadName: freezed == householdHeadName
          ? _value.householdHeadName
          : householdHeadName // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext?,
    ));
  }
}

/// @nodoc

class _$ClosedHouseholdSubmitEventImpl implements ClosedHouseholdSubmitEvent {
  const _$ClosedHouseholdSubmitEventImpl(
      {this.reason,
      this.latitude = 0,
      this.longitude = 0,
      this.locationAccuracy = 0,
      this.householdHeadName,
      this.tag,
      this.context});

  @override
  final String? reason;
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
  final String? householdHeadName;
  @override
  final String? tag;
  @override
  final BuildContext? context;

  @override
  String toString() {
    return 'ClosedHouseholdEvent.handleSubmit(reason: $reason, latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, householdHeadName: $householdHeadName, tag: $tag, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosedHouseholdSubmitEventImpl &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationAccuracy, locationAccuracy) ||
                other.locationAccuracy == locationAccuracy) &&
            (identical(other.householdHeadName, householdHeadName) ||
                other.householdHeadName == householdHeadName) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason, latitude, longitude,
      locationAccuracy, householdHeadName, tag, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosedHouseholdSubmitEventImplCopyWith<_$ClosedHouseholdSubmitEventImpl>
      get copyWith => __$$ClosedHouseholdSubmitEventImplCopyWithImpl<
          _$ClosedHouseholdSubmitEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? reason,
            double latitude,
            double longitude,
            double locationAccuracy,
            String? householdHeadName,
            String? tag,
            BuildContext? context)
        handleSubmit,
    required TResult Function(double latitude, double longitude,
            double locationAccuracy, String? householdHeadName)
        handleSummary,
  }) {
    return handleSubmit(reason, latitude, longitude, locationAccuracy,
        householdHeadName, tag, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? reason,
            double latitude,
            double longitude,
            double locationAccuracy,
            String? householdHeadName,
            String? tag,
            BuildContext? context)?
        handleSubmit,
    TResult? Function(double latitude, double longitude,
            double locationAccuracy, String? householdHeadName)?
        handleSummary,
  }) {
    return handleSubmit?.call(reason, latitude, longitude, locationAccuracy,
        householdHeadName, tag, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? reason,
            double latitude,
            double longitude,
            double locationAccuracy,
            String? householdHeadName,
            String? tag,
            BuildContext? context)?
        handleSubmit,
    TResult Function(double latitude, double longitude, double locationAccuracy,
            String? householdHeadName)?
        handleSummary,
    required TResult orElse(),
  }) {
    if (handleSubmit != null) {
      return handleSubmit(reason, latitude, longitude, locationAccuracy,
          householdHeadName, tag, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClosedHouseholdSubmitEvent value) handleSubmit,
    required TResult Function(ClosedHouseholdSummaryEvent value) handleSummary,
  }) {
    return handleSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClosedHouseholdSubmitEvent value)? handleSubmit,
    TResult? Function(ClosedHouseholdSummaryEvent value)? handleSummary,
  }) {
    return handleSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClosedHouseholdSubmitEvent value)? handleSubmit,
    TResult Function(ClosedHouseholdSummaryEvent value)? handleSummary,
    required TResult orElse(),
  }) {
    if (handleSubmit != null) {
      return handleSubmit(this);
    }
    return orElse();
  }
}

abstract class ClosedHouseholdSubmitEvent implements ClosedHouseholdEvent {
  const factory ClosedHouseholdSubmitEvent(
      {final String? reason,
      final double latitude,
      final double longitude,
      final double locationAccuracy,
      final String? householdHeadName,
      final String? tag,
      final BuildContext? context}) = _$ClosedHouseholdSubmitEventImpl;

  String? get reason;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get locationAccuracy;
  @override
  String? get householdHeadName;
  String? get tag;
  BuildContext? get context;
  @override
  @JsonKey(ignore: true)
  _$$ClosedHouseholdSubmitEventImplCopyWith<_$ClosedHouseholdSubmitEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClosedHouseholdSummaryEventImplCopyWith<$Res>
    implements $ClosedHouseholdEventCopyWith<$Res> {
  factory _$$ClosedHouseholdSummaryEventImplCopyWith(
          _$ClosedHouseholdSummaryEventImpl value,
          $Res Function(_$ClosedHouseholdSummaryEventImpl) then) =
      __$$ClosedHouseholdSummaryEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double locationAccuracy,
      String? householdHeadName});
}

/// @nodoc
class __$$ClosedHouseholdSummaryEventImplCopyWithImpl<$Res>
    extends _$ClosedHouseholdEventCopyWithImpl<$Res,
        _$ClosedHouseholdSummaryEventImpl>
    implements _$$ClosedHouseholdSummaryEventImplCopyWith<$Res> {
  __$$ClosedHouseholdSummaryEventImplCopyWithImpl(
      _$ClosedHouseholdSummaryEventImpl _value,
      $Res Function(_$ClosedHouseholdSummaryEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? householdHeadName = freezed,
  }) {
    return _then(_$ClosedHouseholdSummaryEventImpl(
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
      householdHeadName: freezed == householdHeadName
          ? _value.householdHeadName
          : householdHeadName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ClosedHouseholdSummaryEventImpl implements ClosedHouseholdSummaryEvent {
  const _$ClosedHouseholdSummaryEventImpl(
      {this.latitude = 0,
      this.longitude = 0,
      this.locationAccuracy = 0,
      this.householdHeadName});

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
  final String? householdHeadName;

  @override
  String toString() {
    return 'ClosedHouseholdEvent.handleSummary(latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, householdHeadName: $householdHeadName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosedHouseholdSummaryEventImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationAccuracy, locationAccuracy) ||
                other.locationAccuracy == locationAccuracy) &&
            (identical(other.householdHeadName, householdHeadName) ||
                other.householdHeadName == householdHeadName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, latitude, longitude, locationAccuracy, householdHeadName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosedHouseholdSummaryEventImplCopyWith<_$ClosedHouseholdSummaryEventImpl>
      get copyWith => __$$ClosedHouseholdSummaryEventImplCopyWithImpl<
          _$ClosedHouseholdSummaryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? reason,
            double latitude,
            double longitude,
            double locationAccuracy,
            String? householdHeadName,
            String? tag,
            BuildContext? context)
        handleSubmit,
    required TResult Function(double latitude, double longitude,
            double locationAccuracy, String? householdHeadName)
        handleSummary,
  }) {
    return handleSummary(
        latitude, longitude, locationAccuracy, householdHeadName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? reason,
            double latitude,
            double longitude,
            double locationAccuracy,
            String? householdHeadName,
            String? tag,
            BuildContext? context)?
        handleSubmit,
    TResult? Function(double latitude, double longitude,
            double locationAccuracy, String? householdHeadName)?
        handleSummary,
  }) {
    return handleSummary?.call(
        latitude, longitude, locationAccuracy, householdHeadName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? reason,
            double latitude,
            double longitude,
            double locationAccuracy,
            String? householdHeadName,
            String? tag,
            BuildContext? context)?
        handleSubmit,
    TResult Function(double latitude, double longitude, double locationAccuracy,
            String? householdHeadName)?
        handleSummary,
    required TResult orElse(),
  }) {
    if (handleSummary != null) {
      return handleSummary(
          latitude, longitude, locationAccuracy, householdHeadName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClosedHouseholdSubmitEvent value) handleSubmit,
    required TResult Function(ClosedHouseholdSummaryEvent value) handleSummary,
  }) {
    return handleSummary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClosedHouseholdSubmitEvent value)? handleSubmit,
    TResult? Function(ClosedHouseholdSummaryEvent value)? handleSummary,
  }) {
    return handleSummary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClosedHouseholdSubmitEvent value)? handleSubmit,
    TResult Function(ClosedHouseholdSummaryEvent value)? handleSummary,
    required TResult orElse(),
  }) {
    if (handleSummary != null) {
      return handleSummary(this);
    }
    return orElse();
  }
}

abstract class ClosedHouseholdSummaryEvent implements ClosedHouseholdEvent {
  const factory ClosedHouseholdSummaryEvent(
      {final double latitude,
      final double longitude,
      final double locationAccuracy,
      final String? householdHeadName}) = _$ClosedHouseholdSummaryEventImpl;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get locationAccuracy;
  @override
  String? get householdHeadName;
  @override
  @JsonKey(ignore: true)
  _$$ClosedHouseholdSummaryEventImplCopyWith<_$ClosedHouseholdSummaryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ClosedHouseholdState {
  bool get loading => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get locationAccuracy => throw _privateConstructorUsedError;
  String? get householdHeadName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClosedHouseholdStateCopyWith<ClosedHouseholdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosedHouseholdStateCopyWith<$Res> {
  factory $ClosedHouseholdStateCopyWith(ClosedHouseholdState value,
          $Res Function(ClosedHouseholdState) then) =
      _$ClosedHouseholdStateCopyWithImpl<$Res, ClosedHouseholdState>;
  @useResult
  $Res call(
      {bool loading,
      bool isEditing,
      double latitude,
      double longitude,
      double locationAccuracy,
      String? householdHeadName});
}

/// @nodoc
class _$ClosedHouseholdStateCopyWithImpl<$Res,
        $Val extends ClosedHouseholdState>
    implements $ClosedHouseholdStateCopyWith<$Res> {
  _$ClosedHouseholdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditing = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? householdHeadName = freezed,
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
      householdHeadName: freezed == householdHeadName
          ? _value.householdHeadName
          : householdHeadName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClosedHouseholdStateImplCopyWith<$Res>
    implements $ClosedHouseholdStateCopyWith<$Res> {
  factory _$$ClosedHouseholdStateImplCopyWith(_$ClosedHouseholdStateImpl value,
          $Res Function(_$ClosedHouseholdStateImpl) then) =
      __$$ClosedHouseholdStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool isEditing,
      double latitude,
      double longitude,
      double locationAccuracy,
      String? householdHeadName});
}

/// @nodoc
class __$$ClosedHouseholdStateImplCopyWithImpl<$Res>
    extends _$ClosedHouseholdStateCopyWithImpl<$Res, _$ClosedHouseholdStateImpl>
    implements _$$ClosedHouseholdStateImplCopyWith<$Res> {
  __$$ClosedHouseholdStateImplCopyWithImpl(_$ClosedHouseholdStateImpl _value,
      $Res Function(_$ClosedHouseholdStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isEditing = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? householdHeadName = freezed,
  }) {
    return _then(_$ClosedHouseholdStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
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
      householdHeadName: freezed == householdHeadName
          ? _value.householdHeadName
          : householdHeadName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ClosedHouseholdStateImpl implements _ClosedHouseholdState {
  const _$ClosedHouseholdStateImpl(
      {this.loading = false,
      this.isEditing = false,
      this.latitude = 0,
      this.longitude = 0,
      this.locationAccuracy = 0,
      this.householdHeadName});

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isEditing;
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
  final String? householdHeadName;

  @override
  String toString() {
    return 'ClosedHouseholdState(loading: $loading, isEditing: $isEditing, latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, householdHeadName: $householdHeadName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosedHouseholdStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationAccuracy, locationAccuracy) ||
                other.locationAccuracy == locationAccuracy) &&
            (identical(other.householdHeadName, householdHeadName) ||
                other.householdHeadName == householdHeadName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, isEditing, latitude,
      longitude, locationAccuracy, householdHeadName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosedHouseholdStateImplCopyWith<_$ClosedHouseholdStateImpl>
      get copyWith =>
          __$$ClosedHouseholdStateImplCopyWithImpl<_$ClosedHouseholdStateImpl>(
              this, _$identity);
}

abstract class _ClosedHouseholdState implements ClosedHouseholdState {
  const factory _ClosedHouseholdState(
      {final bool loading,
      final bool isEditing,
      final double latitude,
      final double longitude,
      final double locationAccuracy,
      final String? householdHeadName}) = _$ClosedHouseholdStateImpl;

  @override
  bool get loading;
  @override
  bool get isEditing;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get locationAccuracy;
  @override
  String? get householdHeadName;
  @override
  @JsonKey(ignore: true)
  _$$ClosedHouseholdStateImplCopyWith<_$ClosedHouseholdStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

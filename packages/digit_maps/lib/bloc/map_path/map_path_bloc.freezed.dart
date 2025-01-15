// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_path_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MapPathEvent _$MapPathEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'addPoints':
      return MapAddPointsEvent.fromJson(json);
    case 'getDirections':
      return MapGetDirectionsEvent.fromJson(json);
    case 'deletePaht':
      return MapDeletePathEvent.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'MapPathEvent',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$MapPathEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CoordinatePair coordinatePair) addPoints,
    required TResult Function(CoordinatePair coordinatePair) getDirections,
    required TResult Function(int index) deletePaht,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CoordinatePair coordinatePair)? addPoints,
    TResult? Function(CoordinatePair coordinatePair)? getDirections,
    TResult? Function(int index)? deletePaht,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CoordinatePair coordinatePair)? addPoints,
    TResult Function(CoordinatePair coordinatePair)? getDirections,
    TResult Function(int index)? deletePaht,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapAddPointsEvent value) addPoints,
    required TResult Function(MapGetDirectionsEvent value) getDirections,
    required TResult Function(MapDeletePathEvent value) deletePaht,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapAddPointsEvent value)? addPoints,
    TResult? Function(MapGetDirectionsEvent value)? getDirections,
    TResult? Function(MapDeletePathEvent value)? deletePaht,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapAddPointsEvent value)? addPoints,
    TResult Function(MapGetDirectionsEvent value)? getDirections,
    TResult Function(MapDeletePathEvent value)? deletePaht,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapPathEventCopyWith<$Res> {
  factory $MapPathEventCopyWith(
          MapPathEvent value, $Res Function(MapPathEvent) then) =
      _$MapPathEventCopyWithImpl<$Res, MapPathEvent>;
}

/// @nodoc
class _$MapPathEventCopyWithImpl<$Res, $Val extends MapPathEvent>
    implements $MapPathEventCopyWith<$Res> {
  _$MapPathEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MapAddPointsEventImplCopyWith<$Res> {
  factory _$$MapAddPointsEventImplCopyWith(_$MapAddPointsEventImpl value,
          $Res Function(_$MapAddPointsEventImpl) then) =
      __$$MapAddPointsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CoordinatePair coordinatePair});

  $CoordinatePairCopyWith<$Res> get coordinatePair;
}

/// @nodoc
class __$$MapAddPointsEventImplCopyWithImpl<$Res>
    extends _$MapPathEventCopyWithImpl<$Res, _$MapAddPointsEventImpl>
    implements _$$MapAddPointsEventImplCopyWith<$Res> {
  __$$MapAddPointsEventImplCopyWithImpl(_$MapAddPointsEventImpl _value,
      $Res Function(_$MapAddPointsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinatePair = null,
  }) {
    return _then(_$MapAddPointsEventImpl(
      coordinatePair: null == coordinatePair
          ? _value.coordinatePair
          : coordinatePair // ignore: cast_nullable_to_non_nullable
              as CoordinatePair,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CoordinatePairCopyWith<$Res> get coordinatePair {
    return $CoordinatePairCopyWith<$Res>(_value.coordinatePair, (value) {
      return _then(_value.copyWith(coordinatePair: value));
    });
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MapAddPointsEventImpl implements MapAddPointsEvent {
  const _$MapAddPointsEventImpl(
      {required this.coordinatePair, final String? $type})
      : $type = $type ?? 'addPoints';

  factory _$MapAddPointsEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapAddPointsEventImplFromJson(json);

  @override
  final CoordinatePair coordinatePair;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MapPathEvent.addPoints(coordinatePair: $coordinatePair)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapAddPointsEventImpl &&
            (identical(other.coordinatePair, coordinatePair) ||
                other.coordinatePair == coordinatePair));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, coordinatePair);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapAddPointsEventImplCopyWith<_$MapAddPointsEventImpl> get copyWith =>
      __$$MapAddPointsEventImplCopyWithImpl<_$MapAddPointsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CoordinatePair coordinatePair) addPoints,
    required TResult Function(CoordinatePair coordinatePair) getDirections,
    required TResult Function(int index) deletePaht,
  }) {
    return addPoints(coordinatePair);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CoordinatePair coordinatePair)? addPoints,
    TResult? Function(CoordinatePair coordinatePair)? getDirections,
    TResult? Function(int index)? deletePaht,
  }) {
    return addPoints?.call(coordinatePair);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CoordinatePair coordinatePair)? addPoints,
    TResult Function(CoordinatePair coordinatePair)? getDirections,
    TResult Function(int index)? deletePaht,
    required TResult orElse(),
  }) {
    if (addPoints != null) {
      return addPoints(coordinatePair);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapAddPointsEvent value) addPoints,
    required TResult Function(MapGetDirectionsEvent value) getDirections,
    required TResult Function(MapDeletePathEvent value) deletePaht,
  }) {
    return addPoints(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapAddPointsEvent value)? addPoints,
    TResult? Function(MapGetDirectionsEvent value)? getDirections,
    TResult? Function(MapDeletePathEvent value)? deletePaht,
  }) {
    return addPoints?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapAddPointsEvent value)? addPoints,
    TResult Function(MapGetDirectionsEvent value)? getDirections,
    TResult Function(MapDeletePathEvent value)? deletePaht,
    required TResult orElse(),
  }) {
    if (addPoints != null) {
      return addPoints(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MapAddPointsEventImplToJson(
      this,
    );
  }
}

abstract class MapAddPointsEvent implements MapPathEvent {
  const factory MapAddPointsEvent(
      {required final CoordinatePair coordinatePair}) = _$MapAddPointsEventImpl;

  factory MapAddPointsEvent.fromJson(Map<String, dynamic> json) =
      _$MapAddPointsEventImpl.fromJson;

  CoordinatePair get coordinatePair;
  @JsonKey(ignore: true)
  _$$MapAddPointsEventImplCopyWith<_$MapAddPointsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MapGetDirectionsEventImplCopyWith<$Res> {
  factory _$$MapGetDirectionsEventImplCopyWith(
          _$MapGetDirectionsEventImpl value,
          $Res Function(_$MapGetDirectionsEventImpl) then) =
      __$$MapGetDirectionsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CoordinatePair coordinatePair});

  $CoordinatePairCopyWith<$Res> get coordinatePair;
}

/// @nodoc
class __$$MapGetDirectionsEventImplCopyWithImpl<$Res>
    extends _$MapPathEventCopyWithImpl<$Res, _$MapGetDirectionsEventImpl>
    implements _$$MapGetDirectionsEventImplCopyWith<$Res> {
  __$$MapGetDirectionsEventImplCopyWithImpl(_$MapGetDirectionsEventImpl _value,
      $Res Function(_$MapGetDirectionsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinatePair = null,
  }) {
    return _then(_$MapGetDirectionsEventImpl(
      coordinatePair: null == coordinatePair
          ? _value.coordinatePair
          : coordinatePair // ignore: cast_nullable_to_non_nullable
              as CoordinatePair,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CoordinatePairCopyWith<$Res> get coordinatePair {
    return $CoordinatePairCopyWith<$Res>(_value.coordinatePair, (value) {
      return _then(_value.copyWith(coordinatePair: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$MapGetDirectionsEventImpl implements MapGetDirectionsEvent {
  const _$MapGetDirectionsEventImpl(
      {required this.coordinatePair, final String? $type})
      : $type = $type ?? 'getDirections';

  factory _$MapGetDirectionsEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapGetDirectionsEventImplFromJson(json);

  @override
  final CoordinatePair coordinatePair;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MapPathEvent.getDirections(coordinatePair: $coordinatePair)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapGetDirectionsEventImpl &&
            (identical(other.coordinatePair, coordinatePair) ||
                other.coordinatePair == coordinatePair));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, coordinatePair);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapGetDirectionsEventImplCopyWith<_$MapGetDirectionsEventImpl>
      get copyWith => __$$MapGetDirectionsEventImplCopyWithImpl<
          _$MapGetDirectionsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CoordinatePair coordinatePair) addPoints,
    required TResult Function(CoordinatePair coordinatePair) getDirections,
    required TResult Function(int index) deletePaht,
  }) {
    return getDirections(coordinatePair);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CoordinatePair coordinatePair)? addPoints,
    TResult? Function(CoordinatePair coordinatePair)? getDirections,
    TResult? Function(int index)? deletePaht,
  }) {
    return getDirections?.call(coordinatePair);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CoordinatePair coordinatePair)? addPoints,
    TResult Function(CoordinatePair coordinatePair)? getDirections,
    TResult Function(int index)? deletePaht,
    required TResult orElse(),
  }) {
    if (getDirections != null) {
      return getDirections(coordinatePair);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapAddPointsEvent value) addPoints,
    required TResult Function(MapGetDirectionsEvent value) getDirections,
    required TResult Function(MapDeletePathEvent value) deletePaht,
  }) {
    return getDirections(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapAddPointsEvent value)? addPoints,
    TResult? Function(MapGetDirectionsEvent value)? getDirections,
    TResult? Function(MapDeletePathEvent value)? deletePaht,
  }) {
    return getDirections?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapAddPointsEvent value)? addPoints,
    TResult Function(MapGetDirectionsEvent value)? getDirections,
    TResult Function(MapDeletePathEvent value)? deletePaht,
    required TResult orElse(),
  }) {
    if (getDirections != null) {
      return getDirections(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MapGetDirectionsEventImplToJson(
      this,
    );
  }
}

abstract class MapGetDirectionsEvent implements MapPathEvent {
  const factory MapGetDirectionsEvent(
          {required final CoordinatePair coordinatePair}) =
      _$MapGetDirectionsEventImpl;

  factory MapGetDirectionsEvent.fromJson(Map<String, dynamic> json) =
      _$MapGetDirectionsEventImpl.fromJson;

  CoordinatePair get coordinatePair;
  @JsonKey(ignore: true)
  _$$MapGetDirectionsEventImplCopyWith<_$MapGetDirectionsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MapDeletePathEventImplCopyWith<$Res> {
  factory _$$MapDeletePathEventImplCopyWith(_$MapDeletePathEventImpl value,
          $Res Function(_$MapDeletePathEventImpl) then) =
      __$$MapDeletePathEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$MapDeletePathEventImplCopyWithImpl<$Res>
    extends _$MapPathEventCopyWithImpl<$Res, _$MapDeletePathEventImpl>
    implements _$$MapDeletePathEventImplCopyWith<$Res> {
  __$$MapDeletePathEventImplCopyWithImpl(_$MapDeletePathEventImpl _value,
      $Res Function(_$MapDeletePathEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$MapDeletePathEventImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MapDeletePathEventImpl implements MapDeletePathEvent {
  const _$MapDeletePathEventImpl({required this.index, final String? $type})
      : $type = $type ?? 'deletePaht';

  factory _$MapDeletePathEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapDeletePathEventImplFromJson(json);

  @override
  final int index;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MapPathEvent.deletePaht(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapDeletePathEventImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapDeletePathEventImplCopyWith<_$MapDeletePathEventImpl> get copyWith =>
      __$$MapDeletePathEventImplCopyWithImpl<_$MapDeletePathEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CoordinatePair coordinatePair) addPoints,
    required TResult Function(CoordinatePair coordinatePair) getDirections,
    required TResult Function(int index) deletePaht,
  }) {
    return deletePaht(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CoordinatePair coordinatePair)? addPoints,
    TResult? Function(CoordinatePair coordinatePair)? getDirections,
    TResult? Function(int index)? deletePaht,
  }) {
    return deletePaht?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CoordinatePair coordinatePair)? addPoints,
    TResult Function(CoordinatePair coordinatePair)? getDirections,
    TResult Function(int index)? deletePaht,
    required TResult orElse(),
  }) {
    if (deletePaht != null) {
      return deletePaht(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapAddPointsEvent value) addPoints,
    required TResult Function(MapGetDirectionsEvent value) getDirections,
    required TResult Function(MapDeletePathEvent value) deletePaht,
  }) {
    return deletePaht(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapAddPointsEvent value)? addPoints,
    TResult? Function(MapGetDirectionsEvent value)? getDirections,
    TResult? Function(MapDeletePathEvent value)? deletePaht,
  }) {
    return deletePaht?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapAddPointsEvent value)? addPoints,
    TResult Function(MapGetDirectionsEvent value)? getDirections,
    TResult Function(MapDeletePathEvent value)? deletePaht,
    required TResult orElse(),
  }) {
    if (deletePaht != null) {
      return deletePaht(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MapDeletePathEventImplToJson(
      this,
    );
  }
}

abstract class MapDeletePathEvent implements MapPathEvent {
  const factory MapDeletePathEvent({required final int index}) =
      _$MapDeletePathEventImpl;

  factory MapDeletePathEvent.fromJson(Map<String, dynamic> json) =
      _$MapDeletePathEventImpl.fromJson;

  int get index;
  @JsonKey(ignore: true)
  _$$MapDeletePathEventImplCopyWith<_$MapDeletePathEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MapPathState _$MapPathStateFromJson(Map<String, dynamic> json) {
  return _MapPathState.fromJson(json);
}

/// @nodoc
mixin _$MapPathState {
  List<CoordinatePair> get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapPathStateCopyWith<MapPathState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapPathStateCopyWith<$Res> {
  factory $MapPathStateCopyWith(
          MapPathState value, $Res Function(MapPathState) then) =
      _$MapPathStateCopyWithImpl<$Res, MapPathState>;
  @useResult
  $Res call({List<CoordinatePair> coordinates});
}

/// @nodoc
class _$MapPathStateCopyWithImpl<$Res, $Val extends MapPathState>
    implements $MapPathStateCopyWith<$Res> {
  _$MapPathStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = null,
  }) {
    return _then(_value.copyWith(
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<CoordinatePair>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapPathStateImplCopyWith<$Res>
    implements $MapPathStateCopyWith<$Res> {
  factory _$$MapPathStateImplCopyWith(
          _$MapPathStateImpl value, $Res Function(_$MapPathStateImpl) then) =
      __$$MapPathStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CoordinatePair> coordinates});
}

/// @nodoc
class __$$MapPathStateImplCopyWithImpl<$Res>
    extends _$MapPathStateCopyWithImpl<$Res, _$MapPathStateImpl>
    implements _$$MapPathStateImplCopyWith<$Res> {
  __$$MapPathStateImplCopyWithImpl(
      _$MapPathStateImpl _value, $Res Function(_$MapPathStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = null,
  }) {
    return _then(_$MapPathStateImpl(
      coordinates: null == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<CoordinatePair>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MapPathStateImpl implements _MapPathState {
  const _$MapPathStateImpl({final List<CoordinatePair> coordinates = const []})
      : _coordinates = coordinates;

  factory _$MapPathStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapPathStateImplFromJson(json);

  final List<CoordinatePair> _coordinates;
  @override
  @JsonKey()
  List<CoordinatePair> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  String toString() {
    return 'MapPathState(coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapPathStateImpl &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_coordinates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapPathStateImplCopyWith<_$MapPathStateImpl> get copyWith =>
      __$$MapPathStateImplCopyWithImpl<_$MapPathStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapPathStateImplToJson(
      this,
    );
  }
}

abstract class _MapPathState implements MapPathState {
  const factory _MapPathState({final List<CoordinatePair> coordinates}) =
      _$MapPathStateImpl;

  factory _MapPathState.fromJson(Map<String, dynamic> json) =
      _$MapPathStateImpl.fromJson;

  @override
  List<CoordinatePair> get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$MapPathStateImplCopyWith<_$MapPathStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MapCoordinates _$MapCoordinatesFromJson(Map<String, dynamic> json) {
  return _MapCoordinates.fromJson(json);
}

/// @nodoc
mixin _$MapCoordinates {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapCoordinatesCopyWith<MapCoordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapCoordinatesCopyWith<$Res> {
  factory $MapCoordinatesCopyWith(
          MapCoordinates value, $Res Function(MapCoordinates) then) =
      _$MapCoordinatesCopyWithImpl<$Res, MapCoordinates>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$MapCoordinatesCopyWithImpl<$Res, $Val extends MapCoordinates>
    implements $MapCoordinatesCopyWith<$Res> {
  _$MapCoordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapCoordinatesImplCopyWith<$Res>
    implements $MapCoordinatesCopyWith<$Res> {
  factory _$$MapCoordinatesImplCopyWith(_$MapCoordinatesImpl value,
          $Res Function(_$MapCoordinatesImpl) then) =
      __$$MapCoordinatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$MapCoordinatesImplCopyWithImpl<$Res>
    extends _$MapCoordinatesCopyWithImpl<$Res, _$MapCoordinatesImpl>
    implements _$$MapCoordinatesImplCopyWith<$Res> {
  __$$MapCoordinatesImplCopyWithImpl(
      _$MapCoordinatesImpl _value, $Res Function(_$MapCoordinatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$MapCoordinatesImpl(
      null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MapCoordinatesImpl implements _MapCoordinates {
  const _$MapCoordinatesImpl(this.lat, this.lng);

  factory _$MapCoordinatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapCoordinatesImplFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'MapCoordinates(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapCoordinatesImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapCoordinatesImplCopyWith<_$MapCoordinatesImpl> get copyWith =>
      __$$MapCoordinatesImplCopyWithImpl<_$MapCoordinatesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapCoordinatesImplToJson(
      this,
    );
  }
}

abstract class _MapCoordinates implements MapCoordinates {
  const factory _MapCoordinates(final double lat, final double lng) =
      _$MapCoordinatesImpl;

  factory _MapCoordinates.fromJson(Map<String, dynamic> json) =
      _$MapCoordinatesImpl.fromJson;

  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$$MapCoordinatesImplCopyWith<_$MapCoordinatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CoordinatePair _$CoordinatePairFromJson(Map<String, dynamic> json) {
  return _CoordinatePair.fromJson(json);
}

/// @nodoc
mixin _$CoordinatePair {
  MapCoordinates get source => throw _privateConstructorUsedError;
  MapCoordinates get destination => throw _privateConstructorUsedError;
  GeoJsonModel? get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoordinatePairCopyWith<CoordinatePair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinatePairCopyWith<$Res> {
  factory $CoordinatePairCopyWith(
          CoordinatePair value, $Res Function(CoordinatePair) then) =
      _$CoordinatePairCopyWithImpl<$Res, CoordinatePair>;
  @useResult
  $Res call(
      {MapCoordinates source, MapCoordinates destination, GeoJsonModel? path});

  $MapCoordinatesCopyWith<$Res> get source;
  $MapCoordinatesCopyWith<$Res> get destination;
  $GeoJsonModelCopyWith<$Res>? get path;
}

/// @nodoc
class _$CoordinatePairCopyWithImpl<$Res, $Val extends CoordinatePair>
    implements $CoordinatePairCopyWith<$Res> {
  _$CoordinatePairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? path = freezed,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as MapCoordinates,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as MapCoordinates,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as GeoJsonModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MapCoordinatesCopyWith<$Res> get source {
    return $MapCoordinatesCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MapCoordinatesCopyWith<$Res> get destination {
    return $MapCoordinatesCopyWith<$Res>(_value.destination, (value) {
      return _then(_value.copyWith(destination: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoJsonModelCopyWith<$Res>? get path {
    if (_value.path == null) {
      return null;
    }

    return $GeoJsonModelCopyWith<$Res>(_value.path!, (value) {
      return _then(_value.copyWith(path: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CoordinatePairImplCopyWith<$Res>
    implements $CoordinatePairCopyWith<$Res> {
  factory _$$CoordinatePairImplCopyWith(_$CoordinatePairImpl value,
          $Res Function(_$CoordinatePairImpl) then) =
      __$$CoordinatePairImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MapCoordinates source, MapCoordinates destination, GeoJsonModel? path});

  @override
  $MapCoordinatesCopyWith<$Res> get source;
  @override
  $MapCoordinatesCopyWith<$Res> get destination;
  @override
  $GeoJsonModelCopyWith<$Res>? get path;
}

/// @nodoc
class __$$CoordinatePairImplCopyWithImpl<$Res>
    extends _$CoordinatePairCopyWithImpl<$Res, _$CoordinatePairImpl>
    implements _$$CoordinatePairImplCopyWith<$Res> {
  __$$CoordinatePairImplCopyWithImpl(
      _$CoordinatePairImpl _value, $Res Function(_$CoordinatePairImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? path = freezed,
  }) {
    return _then(_$CoordinatePairImpl(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as MapCoordinates,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as MapCoordinates,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as GeoJsonModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CoordinatePairImpl implements _CoordinatePair {
  const _$CoordinatePairImpl(
      {required this.source, required this.destination, this.path});

  factory _$CoordinatePairImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoordinatePairImplFromJson(json);

  @override
  final MapCoordinates source;
  @override
  final MapCoordinates destination;
  @override
  final GeoJsonModel? path;

  @override
  String toString() {
    return 'CoordinatePair(source: $source, destination: $destination, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordinatePairImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, source, destination, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordinatePairImplCopyWith<_$CoordinatePairImpl> get copyWith =>
      __$$CoordinatePairImplCopyWithImpl<_$CoordinatePairImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoordinatePairImplToJson(
      this,
    );
  }
}

abstract class _CoordinatePair implements CoordinatePair {
  const factory _CoordinatePair(
      {required final MapCoordinates source,
      required final MapCoordinates destination,
      final GeoJsonModel? path}) = _$CoordinatePairImpl;

  factory _CoordinatePair.fromJson(Map<String, dynamic> json) =
      _$CoordinatePairImpl.fromJson;

  @override
  MapCoordinates get source;
  @override
  MapCoordinates get destination;
  @override
  GeoJsonModel? get path;
  @override
  @JsonKey(ignore: true)
  _$$CoordinatePairImplCopyWith<_$CoordinatePairImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

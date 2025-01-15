// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geoJson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeoJsonModel _$GeoJsonModelFromJson(Map<String, dynamic> json) {
  return _GeoJsonModel.fromJson(json);
}

/// @nodoc
mixin _$GeoJsonModel {
  String get type => throw _privateConstructorUsedError;
  List<GeoJsonFeatures> get features => throw _privateConstructorUsedError;
  List<num> get bbox => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoJsonModelCopyWith<GeoJsonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoJsonModelCopyWith<$Res> {
  factory $GeoJsonModelCopyWith(
          GeoJsonModel value, $Res Function(GeoJsonModel) then) =
      _$GeoJsonModelCopyWithImpl<$Res, GeoJsonModel>;
  @useResult
  $Res call({String type, List<GeoJsonFeatures> features, List<num> bbox});
}

/// @nodoc
class _$GeoJsonModelCopyWithImpl<$Res, $Val extends GeoJsonModel>
    implements $GeoJsonModelCopyWith<$Res> {
  _$GeoJsonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? features = null,
    Object? bbox = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<GeoJsonFeatures>,
      bbox: null == bbox
          ? _value.bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as List<num>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoJsonModelImplCopyWith<$Res>
    implements $GeoJsonModelCopyWith<$Res> {
  factory _$$GeoJsonModelImplCopyWith(
          _$GeoJsonModelImpl value, $Res Function(_$GeoJsonModelImpl) then) =
      __$$GeoJsonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, List<GeoJsonFeatures> features, List<num> bbox});
}

/// @nodoc
class __$$GeoJsonModelImplCopyWithImpl<$Res>
    extends _$GeoJsonModelCopyWithImpl<$Res, _$GeoJsonModelImpl>
    implements _$$GeoJsonModelImplCopyWith<$Res> {
  __$$GeoJsonModelImplCopyWithImpl(
      _$GeoJsonModelImpl _value, $Res Function(_$GeoJsonModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? features = null,
    Object? bbox = null,
  }) {
    return _then(_$GeoJsonModelImpl(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<GeoJsonFeatures>,
      null == bbox
          ? _value._bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as List<num>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GeoJsonModelImpl implements _GeoJsonModel {
  const _$GeoJsonModelImpl(
      this.type, final List<GeoJsonFeatures> features, final List<num> bbox)
      : _features = features,
        _bbox = bbox;

  factory _$GeoJsonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoJsonModelImplFromJson(json);

  @override
  final String type;
  final List<GeoJsonFeatures> _features;
  @override
  List<GeoJsonFeatures> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  final List<num> _bbox;
  @override
  List<num> get bbox {
    if (_bbox is EqualUnmodifiableListView) return _bbox;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bbox);
  }

  @override
  String toString() {
    return 'GeoJsonModel(type: $type, features: $features, bbox: $bbox)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoJsonModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            const DeepCollectionEquality().equals(other._bbox, _bbox));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_features),
      const DeepCollectionEquality().hash(_bbox));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoJsonModelImplCopyWith<_$GeoJsonModelImpl> get copyWith =>
      __$$GeoJsonModelImplCopyWithImpl<_$GeoJsonModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoJsonModelImplToJson(
      this,
    );
  }
}

abstract class _GeoJsonModel implements GeoJsonModel {
  const factory _GeoJsonModel(
      final String type,
      final List<GeoJsonFeatures> features,
      final List<num> bbox) = _$GeoJsonModelImpl;

  factory _GeoJsonModel.fromJson(Map<String, dynamic> json) =
      _$GeoJsonModelImpl.fromJson;

  @override
  String get type;
  @override
  List<GeoJsonFeatures> get features;
  @override
  List<num> get bbox;
  @override
  @JsonKey(ignore: true)
  _$$GeoJsonModelImplCopyWith<_$GeoJsonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoJsonFeatures _$GeoJsonFeaturesFromJson(Map<String, dynamic> json) {
  return _GeoJsonFeatures.fromJson(json);
}

/// @nodoc
mixin _$GeoJsonFeatures {
  List<num> get bbox => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  GeoJsonProperties get properties => throw _privateConstructorUsedError;
  GeoJsonCoordinates get geometry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoJsonFeaturesCopyWith<GeoJsonFeatures> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoJsonFeaturesCopyWith<$Res> {
  factory $GeoJsonFeaturesCopyWith(
          GeoJsonFeatures value, $Res Function(GeoJsonFeatures) then) =
      _$GeoJsonFeaturesCopyWithImpl<$Res, GeoJsonFeatures>;
  @useResult
  $Res call(
      {List<num> bbox,
      String type,
      GeoJsonProperties properties,
      GeoJsonCoordinates geometry});

  $GeoJsonPropertiesCopyWith<$Res> get properties;
  $GeoJsonCoordinatesCopyWith<$Res> get geometry;
}

/// @nodoc
class _$GeoJsonFeaturesCopyWithImpl<$Res, $Val extends GeoJsonFeatures>
    implements $GeoJsonFeaturesCopyWith<$Res> {
  _$GeoJsonFeaturesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bbox = null,
    Object? type = null,
    Object? properties = null,
    Object? geometry = null,
  }) {
    return _then(_value.copyWith(
      bbox: null == bbox
          ? _value.bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as List<num>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as GeoJsonProperties,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as GeoJsonCoordinates,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoJsonPropertiesCopyWith<$Res> get properties {
    return $GeoJsonPropertiesCopyWith<$Res>(_value.properties, (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoJsonCoordinatesCopyWith<$Res> get geometry {
    return $GeoJsonCoordinatesCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeoJsonFeaturesImplCopyWith<$Res>
    implements $GeoJsonFeaturesCopyWith<$Res> {
  factory _$$GeoJsonFeaturesImplCopyWith(_$GeoJsonFeaturesImpl value,
          $Res Function(_$GeoJsonFeaturesImpl) then) =
      __$$GeoJsonFeaturesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<num> bbox,
      String type,
      GeoJsonProperties properties,
      GeoJsonCoordinates geometry});

  @override
  $GeoJsonPropertiesCopyWith<$Res> get properties;
  @override
  $GeoJsonCoordinatesCopyWith<$Res> get geometry;
}

/// @nodoc
class __$$GeoJsonFeaturesImplCopyWithImpl<$Res>
    extends _$GeoJsonFeaturesCopyWithImpl<$Res, _$GeoJsonFeaturesImpl>
    implements _$$GeoJsonFeaturesImplCopyWith<$Res> {
  __$$GeoJsonFeaturesImplCopyWithImpl(
      _$GeoJsonFeaturesImpl _value, $Res Function(_$GeoJsonFeaturesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bbox = null,
    Object? type = null,
    Object? properties = null,
    Object? geometry = null,
  }) {
    return _then(_$GeoJsonFeaturesImpl(
      null == bbox
          ? _value._bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as List<num>,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as GeoJsonProperties,
      null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as GeoJsonCoordinates,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoJsonFeaturesImpl implements _GeoJsonFeatures {
  const _$GeoJsonFeaturesImpl(
      final List<num> bbox, this.type, this.properties, this.geometry)
      : _bbox = bbox;

  factory _$GeoJsonFeaturesImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoJsonFeaturesImplFromJson(json);

  final List<num> _bbox;
  @override
  List<num> get bbox {
    if (_bbox is EqualUnmodifiableListView) return _bbox;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bbox);
  }

  @override
  final String type;
  @override
  final GeoJsonProperties properties;
  @override
  final GeoJsonCoordinates geometry;

  @override
  String toString() {
    return 'GeoJsonFeatures(bbox: $bbox, type: $type, properties: $properties, geometry: $geometry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoJsonFeaturesImpl &&
            const DeepCollectionEquality().equals(other._bbox, _bbox) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.properties, properties) ||
                other.properties == properties) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_bbox), type, properties, geometry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoJsonFeaturesImplCopyWith<_$GeoJsonFeaturesImpl> get copyWith =>
      __$$GeoJsonFeaturesImplCopyWithImpl<_$GeoJsonFeaturesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoJsonFeaturesImplToJson(
      this,
    );
  }
}

abstract class _GeoJsonFeatures implements GeoJsonFeatures {
  const factory _GeoJsonFeatures(
      final List<num> bbox,
      final String type,
      final GeoJsonProperties properties,
      final GeoJsonCoordinates geometry) = _$GeoJsonFeaturesImpl;

  factory _GeoJsonFeatures.fromJson(Map<String, dynamic> json) =
      _$GeoJsonFeaturesImpl.fromJson;

  @override
  List<num> get bbox;
  @override
  String get type;
  @override
  GeoJsonProperties get properties;
  @override
  GeoJsonCoordinates get geometry;
  @override
  @JsonKey(ignore: true)
  _$$GeoJsonFeaturesImplCopyWith<_$GeoJsonFeaturesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoJsonProperties _$GeoJsonPropertiesFromJson(Map<String, dynamic> json) {
  return _GeoJsonProperties.fromJson(json);
}

/// @nodoc
mixin _$GeoJsonProperties {
  List<GeoJsonSegment> get segments => throw _privateConstructorUsedError;
  GeoJsonSummary get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'way_points')
  List<num> get wayPoints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoJsonPropertiesCopyWith<GeoJsonProperties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoJsonPropertiesCopyWith<$Res> {
  factory $GeoJsonPropertiesCopyWith(
          GeoJsonProperties value, $Res Function(GeoJsonProperties) then) =
      _$GeoJsonPropertiesCopyWithImpl<$Res, GeoJsonProperties>;
  @useResult
  $Res call(
      {List<GeoJsonSegment> segments,
      GeoJsonSummary summary,
      @JsonKey(name: 'way_points') List<num> wayPoints});

  $GeoJsonSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class _$GeoJsonPropertiesCopyWithImpl<$Res, $Val extends GeoJsonProperties>
    implements $GeoJsonPropertiesCopyWith<$Res> {
  _$GeoJsonPropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? segments = null,
    Object? summary = null,
    Object? wayPoints = null,
  }) {
    return _then(_value.copyWith(
      segments: null == segments
          ? _value.segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<GeoJsonSegment>,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as GeoJsonSummary,
      wayPoints: null == wayPoints
          ? _value.wayPoints
          : wayPoints // ignore: cast_nullable_to_non_nullable
              as List<num>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoJsonSummaryCopyWith<$Res> get summary {
    return $GeoJsonSummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeoJsonPropertiesImplCopyWith<$Res>
    implements $GeoJsonPropertiesCopyWith<$Res> {
  factory _$$GeoJsonPropertiesImplCopyWith(_$GeoJsonPropertiesImpl value,
          $Res Function(_$GeoJsonPropertiesImpl) then) =
      __$$GeoJsonPropertiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GeoJsonSegment> segments,
      GeoJsonSummary summary,
      @JsonKey(name: 'way_points') List<num> wayPoints});

  @override
  $GeoJsonSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$$GeoJsonPropertiesImplCopyWithImpl<$Res>
    extends _$GeoJsonPropertiesCopyWithImpl<$Res, _$GeoJsonPropertiesImpl>
    implements _$$GeoJsonPropertiesImplCopyWith<$Res> {
  __$$GeoJsonPropertiesImplCopyWithImpl(_$GeoJsonPropertiesImpl _value,
      $Res Function(_$GeoJsonPropertiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? segments = null,
    Object? summary = null,
    Object? wayPoints = null,
  }) {
    return _then(_$GeoJsonPropertiesImpl(
      null == segments
          ? _value._segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<GeoJsonSegment>,
      null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as GeoJsonSummary,
      null == wayPoints
          ? _value._wayPoints
          : wayPoints // ignore: cast_nullable_to_non_nullable
              as List<num>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoJsonPropertiesImpl implements _GeoJsonProperties {
  const _$GeoJsonPropertiesImpl(final List<GeoJsonSegment> segments,
      this.summary, @JsonKey(name: 'way_points') final List<num> wayPoints)
      : _segments = segments,
        _wayPoints = wayPoints;

  factory _$GeoJsonPropertiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoJsonPropertiesImplFromJson(json);

  final List<GeoJsonSegment> _segments;
  @override
  List<GeoJsonSegment> get segments {
    if (_segments is EqualUnmodifiableListView) return _segments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_segments);
  }

  @override
  final GeoJsonSummary summary;
  final List<num> _wayPoints;
  @override
  @JsonKey(name: 'way_points')
  List<num> get wayPoints {
    if (_wayPoints is EqualUnmodifiableListView) return _wayPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wayPoints);
  }

  @override
  String toString() {
    return 'GeoJsonProperties(segments: $segments, summary: $summary, wayPoints: $wayPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoJsonPropertiesImpl &&
            const DeepCollectionEquality().equals(other._segments, _segments) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality()
                .equals(other._wayPoints, _wayPoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_segments),
      summary,
      const DeepCollectionEquality().hash(_wayPoints));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoJsonPropertiesImplCopyWith<_$GeoJsonPropertiesImpl> get copyWith =>
      __$$GeoJsonPropertiesImplCopyWithImpl<_$GeoJsonPropertiesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoJsonPropertiesImplToJson(
      this,
    );
  }
}

abstract class _GeoJsonProperties implements GeoJsonProperties {
  const factory _GeoJsonProperties(
          final List<GeoJsonSegment> segments,
          final GeoJsonSummary summary,
          @JsonKey(name: 'way_points') final List<num> wayPoints) =
      _$GeoJsonPropertiesImpl;

  factory _GeoJsonProperties.fromJson(Map<String, dynamic> json) =
      _$GeoJsonPropertiesImpl.fromJson;

  @override
  List<GeoJsonSegment> get segments;
  @override
  GeoJsonSummary get summary;
  @override
  @JsonKey(name: 'way_points')
  List<num> get wayPoints;
  @override
  @JsonKey(ignore: true)
  _$$GeoJsonPropertiesImplCopyWith<_$GeoJsonPropertiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoJsonSegment _$GeoJsonSegmentFromJson(Map<String, dynamic> json) {
  return _GeoJsonSegment.fromJson(json);
}

/// @nodoc
mixin _$GeoJsonSegment {
  num get distance => throw _privateConstructorUsedError;
  num get duration => throw _privateConstructorUsedError;
  List<GeoJsonSteps> get steps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoJsonSegmentCopyWith<GeoJsonSegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoJsonSegmentCopyWith<$Res> {
  factory $GeoJsonSegmentCopyWith(
          GeoJsonSegment value, $Res Function(GeoJsonSegment) then) =
      _$GeoJsonSegmentCopyWithImpl<$Res, GeoJsonSegment>;
  @useResult
  $Res call({num distance, num duration, List<GeoJsonSteps> steps});
}

/// @nodoc
class _$GeoJsonSegmentCopyWithImpl<$Res, $Val extends GeoJsonSegment>
    implements $GeoJsonSegmentCopyWith<$Res> {
  _$GeoJsonSegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? duration = null,
    Object? steps = null,
  }) {
    return _then(_value.copyWith(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as num,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as num,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<GeoJsonSteps>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoJsonSegmentImplCopyWith<$Res>
    implements $GeoJsonSegmentCopyWith<$Res> {
  factory _$$GeoJsonSegmentImplCopyWith(_$GeoJsonSegmentImpl value,
          $Res Function(_$GeoJsonSegmentImpl) then) =
      __$$GeoJsonSegmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num distance, num duration, List<GeoJsonSteps> steps});
}

/// @nodoc
class __$$GeoJsonSegmentImplCopyWithImpl<$Res>
    extends _$GeoJsonSegmentCopyWithImpl<$Res, _$GeoJsonSegmentImpl>
    implements _$$GeoJsonSegmentImplCopyWith<$Res> {
  __$$GeoJsonSegmentImplCopyWithImpl(
      _$GeoJsonSegmentImpl _value, $Res Function(_$GeoJsonSegmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? duration = null,
    Object? steps = null,
  }) {
    return _then(_$GeoJsonSegmentImpl(
      null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as num,
      null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as num,
      null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<GeoJsonSteps>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoJsonSegmentImpl implements _GeoJsonSegment {
  const _$GeoJsonSegmentImpl(
      this.distance, this.duration, final List<GeoJsonSteps> steps)
      : _steps = steps;

  factory _$GeoJsonSegmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoJsonSegmentImplFromJson(json);

  @override
  final num distance;
  @override
  final num duration;
  final List<GeoJsonSteps> _steps;
  @override
  List<GeoJsonSteps> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  String toString() {
    return 'GeoJsonSegment(distance: $distance, duration: $duration, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoJsonSegmentImpl &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, distance, duration,
      const DeepCollectionEquality().hash(_steps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoJsonSegmentImplCopyWith<_$GeoJsonSegmentImpl> get copyWith =>
      __$$GeoJsonSegmentImplCopyWithImpl<_$GeoJsonSegmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoJsonSegmentImplToJson(
      this,
    );
  }
}

abstract class _GeoJsonSegment implements GeoJsonSegment {
  const factory _GeoJsonSegment(final num distance, final num duration,
      final List<GeoJsonSteps> steps) = _$GeoJsonSegmentImpl;

  factory _GeoJsonSegment.fromJson(Map<String, dynamic> json) =
      _$GeoJsonSegmentImpl.fromJson;

  @override
  num get distance;
  @override
  num get duration;
  @override
  List<GeoJsonSteps> get steps;
  @override
  @JsonKey(ignore: true)
  _$$GeoJsonSegmentImplCopyWith<_$GeoJsonSegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoJsonSummary _$GeoJsonSummaryFromJson(Map<String, dynamic> json) {
  return _GeoJsonSummary.fromJson(json);
}

/// @nodoc
mixin _$GeoJsonSummary {
  num get distance => throw _privateConstructorUsedError;
  num get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoJsonSummaryCopyWith<GeoJsonSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoJsonSummaryCopyWith<$Res> {
  factory $GeoJsonSummaryCopyWith(
          GeoJsonSummary value, $Res Function(GeoJsonSummary) then) =
      _$GeoJsonSummaryCopyWithImpl<$Res, GeoJsonSummary>;
  @useResult
  $Res call({num distance, num duration});
}

/// @nodoc
class _$GeoJsonSummaryCopyWithImpl<$Res, $Val extends GeoJsonSummary>
    implements $GeoJsonSummaryCopyWith<$Res> {
  _$GeoJsonSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as num,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoJsonSummaryImplCopyWith<$Res>
    implements $GeoJsonSummaryCopyWith<$Res> {
  factory _$$GeoJsonSummaryImplCopyWith(_$GeoJsonSummaryImpl value,
          $Res Function(_$GeoJsonSummaryImpl) then) =
      __$$GeoJsonSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num distance, num duration});
}

/// @nodoc
class __$$GeoJsonSummaryImplCopyWithImpl<$Res>
    extends _$GeoJsonSummaryCopyWithImpl<$Res, _$GeoJsonSummaryImpl>
    implements _$$GeoJsonSummaryImplCopyWith<$Res> {
  __$$GeoJsonSummaryImplCopyWithImpl(
      _$GeoJsonSummaryImpl _value, $Res Function(_$GeoJsonSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? duration = null,
  }) {
    return _then(_$GeoJsonSummaryImpl(
      null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as num,
      null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoJsonSummaryImpl implements _GeoJsonSummary {
  const _$GeoJsonSummaryImpl(this.distance, this.duration);

  factory _$GeoJsonSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoJsonSummaryImplFromJson(json);

  @override
  final num distance;
  @override
  final num duration;

  @override
  String toString() {
    return 'GeoJsonSummary(distance: $distance, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoJsonSummaryImpl &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, distance, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoJsonSummaryImplCopyWith<_$GeoJsonSummaryImpl> get copyWith =>
      __$$GeoJsonSummaryImplCopyWithImpl<_$GeoJsonSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoJsonSummaryImplToJson(
      this,
    );
  }
}

abstract class _GeoJsonSummary implements GeoJsonSummary {
  const factory _GeoJsonSummary(final num distance, final num duration) =
      _$GeoJsonSummaryImpl;

  factory _GeoJsonSummary.fromJson(Map<String, dynamic> json) =
      _$GeoJsonSummaryImpl.fromJson;

  @override
  num get distance;
  @override
  num get duration;
  @override
  @JsonKey(ignore: true)
  _$$GeoJsonSummaryImplCopyWith<_$GeoJsonSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoJsonSteps _$GeoJsonStepsFromJson(Map<String, dynamic> json) {
  return _GeoJsonSteps.fromJson(json);
}

/// @nodoc
mixin _$GeoJsonSteps {
  num get distance => throw _privateConstructorUsedError;
  num get duration => throw _privateConstructorUsedError;
  num get type => throw _privateConstructorUsedError;
  String get instruction => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'way_points')
  List<num> get wayPoints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoJsonStepsCopyWith<GeoJsonSteps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoJsonStepsCopyWith<$Res> {
  factory $GeoJsonStepsCopyWith(
          GeoJsonSteps value, $Res Function(GeoJsonSteps) then) =
      _$GeoJsonStepsCopyWithImpl<$Res, GeoJsonSteps>;
  @useResult
  $Res call(
      {num distance,
      num duration,
      num type,
      String instruction,
      String name,
      @JsonKey(name: 'way_points') List<num> wayPoints});
}

/// @nodoc
class _$GeoJsonStepsCopyWithImpl<$Res, $Val extends GeoJsonSteps>
    implements $GeoJsonStepsCopyWith<$Res> {
  _$GeoJsonStepsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? duration = null,
    Object? type = null,
    Object? instruction = null,
    Object? name = null,
    Object? wayPoints = null,
  }) {
    return _then(_value.copyWith(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as num,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as num,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as num,
      instruction: null == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      wayPoints: null == wayPoints
          ? _value.wayPoints
          : wayPoints // ignore: cast_nullable_to_non_nullable
              as List<num>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoJsonStepsImplCopyWith<$Res>
    implements $GeoJsonStepsCopyWith<$Res> {
  factory _$$GeoJsonStepsImplCopyWith(
          _$GeoJsonStepsImpl value, $Res Function(_$GeoJsonStepsImpl) then) =
      __$$GeoJsonStepsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num distance,
      num duration,
      num type,
      String instruction,
      String name,
      @JsonKey(name: 'way_points') List<num> wayPoints});
}

/// @nodoc
class __$$GeoJsonStepsImplCopyWithImpl<$Res>
    extends _$GeoJsonStepsCopyWithImpl<$Res, _$GeoJsonStepsImpl>
    implements _$$GeoJsonStepsImplCopyWith<$Res> {
  __$$GeoJsonStepsImplCopyWithImpl(
      _$GeoJsonStepsImpl _value, $Res Function(_$GeoJsonStepsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? duration = null,
    Object? type = null,
    Object? instruction = null,
    Object? name = null,
    Object? wayPoints = null,
  }) {
    return _then(_$GeoJsonStepsImpl(
      null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as num,
      null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as num,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as num,
      null == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == wayPoints
          ? _value._wayPoints
          : wayPoints // ignore: cast_nullable_to_non_nullable
              as List<num>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoJsonStepsImpl implements _GeoJsonSteps {
  const _$GeoJsonStepsImpl(
      this.distance,
      this.duration,
      this.type,
      this.instruction,
      this.name,
      @JsonKey(name: 'way_points') final List<num> wayPoints)
      : _wayPoints = wayPoints;

  factory _$GeoJsonStepsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoJsonStepsImplFromJson(json);

  @override
  final num distance;
  @override
  final num duration;
  @override
  final num type;
  @override
  final String instruction;
  @override
  final String name;
  final List<num> _wayPoints;
  @override
  @JsonKey(name: 'way_points')
  List<num> get wayPoints {
    if (_wayPoints is EqualUnmodifiableListView) return _wayPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wayPoints);
  }

  @override
  String toString() {
    return 'GeoJsonSteps(distance: $distance, duration: $duration, type: $type, instruction: $instruction, name: $name, wayPoints: $wayPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoJsonStepsImpl &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._wayPoints, _wayPoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, distance, duration, type,
      instruction, name, const DeepCollectionEquality().hash(_wayPoints));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoJsonStepsImplCopyWith<_$GeoJsonStepsImpl> get copyWith =>
      __$$GeoJsonStepsImplCopyWithImpl<_$GeoJsonStepsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoJsonStepsImplToJson(
      this,
    );
  }
}

abstract class _GeoJsonSteps implements GeoJsonSteps {
  const factory _GeoJsonSteps(
          final num distance,
          final num duration,
          final num type,
          final String instruction,
          final String name,
          @JsonKey(name: 'way_points') final List<num> wayPoints) =
      _$GeoJsonStepsImpl;

  factory _GeoJsonSteps.fromJson(Map<String, dynamic> json) =
      _$GeoJsonStepsImpl.fromJson;

  @override
  num get distance;
  @override
  num get duration;
  @override
  num get type;
  @override
  String get instruction;
  @override
  String get name;
  @override
  @JsonKey(name: 'way_points')
  List<num> get wayPoints;
  @override
  @JsonKey(ignore: true)
  _$$GeoJsonStepsImplCopyWith<_$GeoJsonStepsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoJsonCoordinates _$GeoJsonCoordinatesFromJson(Map<String, dynamic> json) {
  return _GeoJsonCoordinates.fromJson(json);
}

/// @nodoc
mixin _$GeoJsonCoordinates {
  List<List<num>> get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoJsonCoordinatesCopyWith<GeoJsonCoordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoJsonCoordinatesCopyWith<$Res> {
  factory $GeoJsonCoordinatesCopyWith(
          GeoJsonCoordinates value, $Res Function(GeoJsonCoordinates) then) =
      _$GeoJsonCoordinatesCopyWithImpl<$Res, GeoJsonCoordinates>;
  @useResult
  $Res call({List<List<num>> coordinates});
}

/// @nodoc
class _$GeoJsonCoordinatesCopyWithImpl<$Res, $Val extends GeoJsonCoordinates>
    implements $GeoJsonCoordinatesCopyWith<$Res> {
  _$GeoJsonCoordinatesCopyWithImpl(this._value, this._then);

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
              as List<List<num>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoJsonCoordinatesImplCopyWith<$Res>
    implements $GeoJsonCoordinatesCopyWith<$Res> {
  factory _$$GeoJsonCoordinatesImplCopyWith(_$GeoJsonCoordinatesImpl value,
          $Res Function(_$GeoJsonCoordinatesImpl) then) =
      __$$GeoJsonCoordinatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<List<num>> coordinates});
}

/// @nodoc
class __$$GeoJsonCoordinatesImplCopyWithImpl<$Res>
    extends _$GeoJsonCoordinatesCopyWithImpl<$Res, _$GeoJsonCoordinatesImpl>
    implements _$$GeoJsonCoordinatesImplCopyWith<$Res> {
  __$$GeoJsonCoordinatesImplCopyWithImpl(_$GeoJsonCoordinatesImpl _value,
      $Res Function(_$GeoJsonCoordinatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = null,
  }) {
    return _then(_$GeoJsonCoordinatesImpl(
      null == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<List<num>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoJsonCoordinatesImpl implements _GeoJsonCoordinates {
  const _$GeoJsonCoordinatesImpl(final List<List<num>> coordinates)
      : _coordinates = coordinates;

  factory _$GeoJsonCoordinatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoJsonCoordinatesImplFromJson(json);

  final List<List<num>> _coordinates;
  @override
  List<List<num>> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  String toString() {
    return 'GeoJsonCoordinates(coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoJsonCoordinatesImpl &&
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
  _$$GeoJsonCoordinatesImplCopyWith<_$GeoJsonCoordinatesImpl> get copyWith =>
      __$$GeoJsonCoordinatesImplCopyWithImpl<_$GeoJsonCoordinatesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoJsonCoordinatesImplToJson(
      this,
    );
  }
}

abstract class _GeoJsonCoordinates implements GeoJsonCoordinates {
  const factory _GeoJsonCoordinates(final List<List<num>> coordinates) =
      _$GeoJsonCoordinatesImpl;

  factory _GeoJsonCoordinates.fromJson(Map<String, dynamic> json) =
      _$GeoJsonCoordinatesImpl.fromJson;

  @override
  List<List<num>> get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$GeoJsonCoordinatesImplCopyWith<_$GeoJsonCoordinatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

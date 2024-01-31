// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_households.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchHouseholdsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)
        searchByHousehold,
    required TResult Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)?
        searchByHousehold,
    TResult? Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)?
        searchByHousehold,
    TResult Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchHouseholdsInitializedEvent value)
        initialize,
    required TResult Function(SearchHouseholdsByHouseholdsEvent value)
        searchByHousehold,
    required TResult Function(SearchHouseholdsSearchByHouseholdHeadEvent value)
        searchByHouseholdHead,
    required TResult Function(SearchHouseholdsByProximityEvent value)
        searchByProximity,
    required TResult Function(SearchHouseholdsByTagEvent value) searchByTag,
    required TResult Function(SearchHouseholdsClearEvent value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchHouseholdsInitializedEvent value)? initialize,
    TResult? Function(SearchHouseholdsByHouseholdsEvent value)?
        searchByHousehold,
    TResult? Function(SearchHouseholdsSearchByHouseholdHeadEvent value)?
        searchByHouseholdHead,
    TResult? Function(SearchHouseholdsByProximityEvent value)?
        searchByProximity,
    TResult? Function(SearchHouseholdsByTagEvent value)? searchByTag,
    TResult? Function(SearchHouseholdsClearEvent value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchHouseholdsInitializedEvent value)? initialize,
    TResult Function(SearchHouseholdsByHouseholdsEvent value)?
        searchByHousehold,
    TResult Function(SearchHouseholdsSearchByHouseholdHeadEvent value)?
        searchByHouseholdHead,
    TResult Function(SearchHouseholdsByProximityEvent value)? searchByProximity,
    TResult Function(SearchHouseholdsByTagEvent value)? searchByTag,
    TResult Function(SearchHouseholdsClearEvent value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchHouseholdsEventCopyWith<$Res> {
  factory $SearchHouseholdsEventCopyWith(SearchHouseholdsEvent value,
          $Res Function(SearchHouseholdsEvent) then) =
      _$SearchHouseholdsEventCopyWithImpl<$Res, SearchHouseholdsEvent>;
}

/// @nodoc
class _$SearchHouseholdsEventCopyWithImpl<$Res,
        $Val extends SearchHouseholdsEvent>
    implements $SearchHouseholdsEventCopyWith<$Res> {
  _$SearchHouseholdsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchHouseholdsInitializedEventCopyWith<$Res> {
  factory _$$SearchHouseholdsInitializedEventCopyWith(
          _$SearchHouseholdsInitializedEvent value,
          $Res Function(_$SearchHouseholdsInitializedEvent) then) =
      __$$SearchHouseholdsInitializedEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchHouseholdsInitializedEventCopyWithImpl<$Res>
    extends _$SearchHouseholdsEventCopyWithImpl<$Res,
        _$SearchHouseholdsInitializedEvent>
    implements _$$SearchHouseholdsInitializedEventCopyWith<$Res> {
  __$$SearchHouseholdsInitializedEventCopyWithImpl(
      _$SearchHouseholdsInitializedEvent _value,
      $Res Function(_$SearchHouseholdsInitializedEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchHouseholdsInitializedEvent
    implements SearchHouseholdsInitializedEvent {
  const _$SearchHouseholdsInitializedEvent();

  @override
  String toString() {
    return 'SearchHouseholdsEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHouseholdsInitializedEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)
        searchByHousehold,
    required TResult Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)?
        searchByHousehold,
    TResult? Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)?
        searchByHousehold,
    TResult Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchHouseholdsInitializedEvent value)
        initialize,
    required TResult Function(SearchHouseholdsByHouseholdsEvent value)
        searchByHousehold,
    required TResult Function(SearchHouseholdsSearchByHouseholdHeadEvent value)
        searchByHouseholdHead,
    required TResult Function(SearchHouseholdsByProximityEvent value)
        searchByProximity,
    required TResult Function(SearchHouseholdsByTagEvent value) searchByTag,
    required TResult Function(SearchHouseholdsClearEvent value) clear,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchHouseholdsInitializedEvent value)? initialize,
    TResult? Function(SearchHouseholdsByHouseholdsEvent value)?
        searchByHousehold,
    TResult? Function(SearchHouseholdsSearchByHouseholdHeadEvent value)?
        searchByHouseholdHead,
    TResult? Function(SearchHouseholdsByProximityEvent value)?
        searchByProximity,
    TResult? Function(SearchHouseholdsByTagEvent value)? searchByTag,
    TResult? Function(SearchHouseholdsClearEvent value)? clear,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchHouseholdsInitializedEvent value)? initialize,
    TResult Function(SearchHouseholdsByHouseholdsEvent value)?
        searchByHousehold,
    TResult Function(SearchHouseholdsSearchByHouseholdHeadEvent value)?
        searchByHouseholdHead,
    TResult Function(SearchHouseholdsByProximityEvent value)? searchByProximity,
    TResult Function(SearchHouseholdsByTagEvent value)? searchByTag,
    TResult Function(SearchHouseholdsClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class SearchHouseholdsInitializedEvent
    implements SearchHouseholdsEvent {
  const factory SearchHouseholdsInitializedEvent() =
      _$SearchHouseholdsInitializedEvent;
}

/// @nodoc
abstract class _$$SearchHouseholdsByHouseholdsEventCopyWith<$Res> {
  factory _$$SearchHouseholdsByHouseholdsEventCopyWith(
          _$SearchHouseholdsByHouseholdsEvent value,
          $Res Function(_$SearchHouseholdsByHouseholdsEvent) then) =
      __$$SearchHouseholdsByHouseholdsEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      double? latitude,
      double? longitude,
      double? maxRadius,
      bool isProximityEnabled,
      HouseholdModel householdModel});
}

/// @nodoc
class __$$SearchHouseholdsByHouseholdsEventCopyWithImpl<$Res>
    extends _$SearchHouseholdsEventCopyWithImpl<$Res,
        _$SearchHouseholdsByHouseholdsEvent>
    implements _$$SearchHouseholdsByHouseholdsEventCopyWith<$Res> {
  __$$SearchHouseholdsByHouseholdsEventCopyWithImpl(
      _$SearchHouseholdsByHouseholdsEvent _value,
      $Res Function(_$SearchHouseholdsByHouseholdsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? maxRadius = freezed,
    Object? isProximityEnabled = null,
    Object? householdModel = null,
  }) {
    return _then(_$SearchHouseholdsByHouseholdsEvent(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      maxRadius: freezed == maxRadius
          ? _value.maxRadius
          : maxRadius // ignore: cast_nullable_to_non_nullable
              as double?,
      isProximityEnabled: null == isProximityEnabled
          ? _value.isProximityEnabled
          : isProximityEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      householdModel: null == householdModel
          ? _value.householdModel
          : householdModel // ignore: cast_nullable_to_non_nullable
              as HouseholdModel,
    ));
  }
}

/// @nodoc

class _$SearchHouseholdsByHouseholdsEvent
    implements SearchHouseholdsByHouseholdsEvent {
  const _$SearchHouseholdsByHouseholdsEvent(
      {required this.projectId,
      this.latitude,
      this.longitude,
      this.maxRadius,
      required this.isProximityEnabled,
      required this.householdModel});

  @override
  final String projectId;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final double? maxRadius;
  @override
  final bool isProximityEnabled;
  @override
  final HouseholdModel householdModel;

  @override
  String toString() {
    return 'SearchHouseholdsEvent.searchByHousehold(projectId: $projectId, latitude: $latitude, longitude: $longitude, maxRadius: $maxRadius, isProximityEnabled: $isProximityEnabled, householdModel: $householdModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHouseholdsByHouseholdsEvent &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.maxRadius, maxRadius) ||
                other.maxRadius == maxRadius) &&
            (identical(other.isProximityEnabled, isProximityEnabled) ||
                other.isProximityEnabled == isProximityEnabled) &&
            (identical(other.householdModel, householdModel) ||
                other.householdModel == householdModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId, latitude, longitude,
      maxRadius, isProximityEnabled, householdModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchHouseholdsByHouseholdsEventCopyWith<
          _$SearchHouseholdsByHouseholdsEvent>
      get copyWith => __$$SearchHouseholdsByHouseholdsEventCopyWithImpl<
          _$SearchHouseholdsByHouseholdsEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)
        searchByHousehold,
    required TResult Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
  }) {
    return searchByHousehold(projectId, latitude, longitude, maxRadius,
        isProximityEnabled, householdModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)?
        searchByHousehold,
    TResult? Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
  }) {
    return searchByHousehold?.call(projectId, latitude, longitude, maxRadius,
        isProximityEnabled, householdModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)?
        searchByHousehold,
    TResult Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (searchByHousehold != null) {
      return searchByHousehold(projectId, latitude, longitude, maxRadius,
          isProximityEnabled, householdModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchHouseholdsInitializedEvent value)
        initialize,
    required TResult Function(SearchHouseholdsByHouseholdsEvent value)
        searchByHousehold,
    required TResult Function(SearchHouseholdsSearchByHouseholdHeadEvent value)
        searchByHouseholdHead,
    required TResult Function(SearchHouseholdsByProximityEvent value)
        searchByProximity,
    required TResult Function(SearchHouseholdsByTagEvent value) searchByTag,
    required TResult Function(SearchHouseholdsClearEvent value) clear,
  }) {
    return searchByHousehold(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchHouseholdsInitializedEvent value)? initialize,
    TResult? Function(SearchHouseholdsByHouseholdsEvent value)?
        searchByHousehold,
    TResult? Function(SearchHouseholdsSearchByHouseholdHeadEvent value)?
        searchByHouseholdHead,
    TResult? Function(SearchHouseholdsByProximityEvent value)?
        searchByProximity,
    TResult? Function(SearchHouseholdsByTagEvent value)? searchByTag,
    TResult? Function(SearchHouseholdsClearEvent value)? clear,
  }) {
    return searchByHousehold?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchHouseholdsInitializedEvent value)? initialize,
    TResult Function(SearchHouseholdsByHouseholdsEvent value)?
        searchByHousehold,
    TResult Function(SearchHouseholdsSearchByHouseholdHeadEvent value)?
        searchByHouseholdHead,
    TResult Function(SearchHouseholdsByProximityEvent value)? searchByProximity,
    TResult Function(SearchHouseholdsByTagEvent value)? searchByTag,
    TResult Function(SearchHouseholdsClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (searchByHousehold != null) {
      return searchByHousehold(this);
    }
    return orElse();
  }
}

abstract class SearchHouseholdsByHouseholdsEvent
    implements SearchHouseholdsEvent {
  const factory SearchHouseholdsByHouseholdsEvent(
          {required final String projectId,
          final double? latitude,
          final double? longitude,
          final double? maxRadius,
          required final bool isProximityEnabled,
          required final HouseholdModel householdModel}) =
      _$SearchHouseholdsByHouseholdsEvent;

  String get projectId;
  double? get latitude;
  double? get longitude;
  double? get maxRadius;
  bool get isProximityEnabled;
  HouseholdModel get householdModel;
  @JsonKey(ignore: true)
  _$$SearchHouseholdsByHouseholdsEventCopyWith<
          _$SearchHouseholdsByHouseholdsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchHouseholdsSearchByHouseholdHeadEventCopyWith<$Res> {
  factory _$$SearchHouseholdsSearchByHouseholdHeadEventCopyWith(
          _$SearchHouseholdsSearchByHouseholdHeadEvent value,
          $Res Function(_$SearchHouseholdsSearchByHouseholdHeadEvent) then) =
      __$$SearchHouseholdsSearchByHouseholdHeadEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String searchText,
      String projectId,
      bool isProximityEnabled,
      double? latitude,
      double? longitude,
      double? maxRadius});
}

/// @nodoc
class __$$SearchHouseholdsSearchByHouseholdHeadEventCopyWithImpl<$Res>
    extends _$SearchHouseholdsEventCopyWithImpl<$Res,
        _$SearchHouseholdsSearchByHouseholdHeadEvent>
    implements _$$SearchHouseholdsSearchByHouseholdHeadEventCopyWith<$Res> {
  __$$SearchHouseholdsSearchByHouseholdHeadEventCopyWithImpl(
      _$SearchHouseholdsSearchByHouseholdHeadEvent _value,
      $Res Function(_$SearchHouseholdsSearchByHouseholdHeadEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
    Object? projectId = null,
    Object? isProximityEnabled = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? maxRadius = freezed,
  }) {
    return _then(_$SearchHouseholdsSearchByHouseholdHeadEvent(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      isProximityEnabled: null == isProximityEnabled
          ? _value.isProximityEnabled
          : isProximityEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      maxRadius: freezed == maxRadius
          ? _value.maxRadius
          : maxRadius // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$SearchHouseholdsSearchByHouseholdHeadEvent
    implements SearchHouseholdsSearchByHouseholdHeadEvent {
  const _$SearchHouseholdsSearchByHouseholdHeadEvent(
      {required this.searchText,
      required this.projectId,
      required this.isProximityEnabled,
      this.latitude,
      this.longitude,
      this.maxRadius});

  @override
  final String searchText;
  @override
  final String projectId;
  @override
  final bool isProximityEnabled;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final double? maxRadius;

  @override
  String toString() {
    return 'SearchHouseholdsEvent.searchByHouseholdHead(searchText: $searchText, projectId: $projectId, isProximityEnabled: $isProximityEnabled, latitude: $latitude, longitude: $longitude, maxRadius: $maxRadius)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHouseholdsSearchByHouseholdHeadEvent &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.isProximityEnabled, isProximityEnabled) ||
                other.isProximityEnabled == isProximityEnabled) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.maxRadius, maxRadius) ||
                other.maxRadius == maxRadius));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText, projectId,
      isProximityEnabled, latitude, longitude, maxRadius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchHouseholdsSearchByHouseholdHeadEventCopyWith<
          _$SearchHouseholdsSearchByHouseholdHeadEvent>
      get copyWith =>
          __$$SearchHouseholdsSearchByHouseholdHeadEventCopyWithImpl<
              _$SearchHouseholdsSearchByHouseholdHeadEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)
        searchByHousehold,
    required TResult Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
  }) {
    return searchByHouseholdHead(searchText, projectId, isProximityEnabled,
        latitude, longitude, maxRadius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)?
        searchByHousehold,
    TResult? Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
  }) {
    return searchByHouseholdHead?.call(searchText, projectId,
        isProximityEnabled, latitude, longitude, maxRadius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)?
        searchByHousehold,
    TResult Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (searchByHouseholdHead != null) {
      return searchByHouseholdHead(searchText, projectId, isProximityEnabled,
          latitude, longitude, maxRadius);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchHouseholdsInitializedEvent value)
        initialize,
    required TResult Function(SearchHouseholdsByHouseholdsEvent value)
        searchByHousehold,
    required TResult Function(SearchHouseholdsSearchByHouseholdHeadEvent value)
        searchByHouseholdHead,
    required TResult Function(SearchHouseholdsByProximityEvent value)
        searchByProximity,
    required TResult Function(SearchHouseholdsByTagEvent value) searchByTag,
    required TResult Function(SearchHouseholdsClearEvent value) clear,
  }) {
    return searchByHouseholdHead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchHouseholdsInitializedEvent value)? initialize,
    TResult? Function(SearchHouseholdsByHouseholdsEvent value)?
        searchByHousehold,
    TResult? Function(SearchHouseholdsSearchByHouseholdHeadEvent value)?
        searchByHouseholdHead,
    TResult? Function(SearchHouseholdsByProximityEvent value)?
        searchByProximity,
    TResult? Function(SearchHouseholdsByTagEvent value)? searchByTag,
    TResult? Function(SearchHouseholdsClearEvent value)? clear,
  }) {
    return searchByHouseholdHead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchHouseholdsInitializedEvent value)? initialize,
    TResult Function(SearchHouseholdsByHouseholdsEvent value)?
        searchByHousehold,
    TResult Function(SearchHouseholdsSearchByHouseholdHeadEvent value)?
        searchByHouseholdHead,
    TResult Function(SearchHouseholdsByProximityEvent value)? searchByProximity,
    TResult Function(SearchHouseholdsByTagEvent value)? searchByTag,
    TResult Function(SearchHouseholdsClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (searchByHouseholdHead != null) {
      return searchByHouseholdHead(this);
    }
    return orElse();
  }
}

abstract class SearchHouseholdsSearchByHouseholdHeadEvent
    implements SearchHouseholdsEvent {
  const factory SearchHouseholdsSearchByHouseholdHeadEvent(
      {required final String searchText,
      required final String projectId,
      required final bool isProximityEnabled,
      final double? latitude,
      final double? longitude,
      final double? maxRadius}) = _$SearchHouseholdsSearchByHouseholdHeadEvent;

  String get searchText;
  String get projectId;
  bool get isProximityEnabled;
  double? get latitude;
  double? get longitude;
  double? get maxRadius;
  @JsonKey(ignore: true)
  _$$SearchHouseholdsSearchByHouseholdHeadEventCopyWith<
          _$SearchHouseholdsSearchByHouseholdHeadEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchHouseholdsByProximityEventCopyWith<$Res> {
  factory _$$SearchHouseholdsByProximityEventCopyWith(
          _$SearchHouseholdsByProximityEvent value,
          $Res Function(_$SearchHouseholdsByProximityEvent) then) =
      __$$SearchHouseholdsByProximityEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double latitude,
      double longititude,
      String projectId,
      double maxRadius,
      int offset,
      int limit});
}

/// @nodoc
class __$$SearchHouseholdsByProximityEventCopyWithImpl<$Res>
    extends _$SearchHouseholdsEventCopyWithImpl<$Res,
        _$SearchHouseholdsByProximityEvent>
    implements _$$SearchHouseholdsByProximityEventCopyWith<$Res> {
  __$$SearchHouseholdsByProximityEventCopyWithImpl(
      _$SearchHouseholdsByProximityEvent _value,
      $Res Function(_$SearchHouseholdsByProximityEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longititude = null,
    Object? projectId = null,
    Object? maxRadius = null,
    Object? offset = null,
    Object? limit = null,
  }) {
    return _then(_$SearchHouseholdsByProximityEvent(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longititude: null == longititude
          ? _value.longititude
          : longititude // ignore: cast_nullable_to_non_nullable
              as double,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      maxRadius: null == maxRadius
          ? _value.maxRadius
          : maxRadius // ignore: cast_nullable_to_non_nullable
              as double,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchHouseholdsByProximityEvent
    implements SearchHouseholdsByProximityEvent {
  const _$SearchHouseholdsByProximityEvent(
      {required this.latitude,
      required this.longititude,
      required this.projectId,
      required this.maxRadius,
      required this.offset,
      required this.limit});

  @override
  final double latitude;
  @override
  final double longititude;
  @override
  final String projectId;
  @override
  final double maxRadius;
  @override
  final int offset;
  @override
  final int limit;

  @override
  String toString() {
    return 'SearchHouseholdsEvent.searchByProximity(latitude: $latitude, longititude: $longititude, projectId: $projectId, maxRadius: $maxRadius, offset: $offset, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHouseholdsByProximityEvent &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longititude, longititude) ||
                other.longititude == longititude) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.maxRadius, maxRadius) ||
                other.maxRadius == maxRadius) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, latitude, longititude, projectId, maxRadius, offset, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchHouseholdsByProximityEventCopyWith<
          _$SearchHouseholdsByProximityEvent>
      get copyWith => __$$SearchHouseholdsByProximityEventCopyWithImpl<
          _$SearchHouseholdsByProximityEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)
        searchByHousehold,
    required TResult Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
  }) {
    return searchByProximity(
        latitude, longititude, projectId, maxRadius, offset, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)?
        searchByHousehold,
    TResult? Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
  }) {
    return searchByProximity?.call(
        latitude, longititude, projectId, maxRadius, offset, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)?
        searchByHousehold,
    TResult Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (searchByProximity != null) {
      return searchByProximity(
          latitude, longititude, projectId, maxRadius, offset, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchHouseholdsInitializedEvent value)
        initialize,
    required TResult Function(SearchHouseholdsByHouseholdsEvent value)
        searchByHousehold,
    required TResult Function(SearchHouseholdsSearchByHouseholdHeadEvent value)
        searchByHouseholdHead,
    required TResult Function(SearchHouseholdsByProximityEvent value)
        searchByProximity,
    required TResult Function(SearchHouseholdsByTagEvent value) searchByTag,
    required TResult Function(SearchHouseholdsClearEvent value) clear,
  }) {
    return searchByProximity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchHouseholdsInitializedEvent value)? initialize,
    TResult? Function(SearchHouseholdsByHouseholdsEvent value)?
        searchByHousehold,
    TResult? Function(SearchHouseholdsSearchByHouseholdHeadEvent value)?
        searchByHouseholdHead,
    TResult? Function(SearchHouseholdsByProximityEvent value)?
        searchByProximity,
    TResult? Function(SearchHouseholdsByTagEvent value)? searchByTag,
    TResult? Function(SearchHouseholdsClearEvent value)? clear,
  }) {
    return searchByProximity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchHouseholdsInitializedEvent value)? initialize,
    TResult Function(SearchHouseholdsByHouseholdsEvent value)?
        searchByHousehold,
    TResult Function(SearchHouseholdsSearchByHouseholdHeadEvent value)?
        searchByHouseholdHead,
    TResult Function(SearchHouseholdsByProximityEvent value)? searchByProximity,
    TResult Function(SearchHouseholdsByTagEvent value)? searchByTag,
    TResult Function(SearchHouseholdsClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (searchByProximity != null) {
      return searchByProximity(this);
    }
    return orElse();
  }
}

abstract class SearchHouseholdsByProximityEvent
    implements SearchHouseholdsEvent {
  const factory SearchHouseholdsByProximityEvent(
      {required final double latitude,
      required final double longititude,
      required final String projectId,
      required final double maxRadius,
      required final int offset,
      required final int limit}) = _$SearchHouseholdsByProximityEvent;

  double get latitude;
  double get longititude;
  String get projectId;
  double get maxRadius;
  int get offset;
  int get limit;
  @JsonKey(ignore: true)
  _$$SearchHouseholdsByProximityEventCopyWith<
          _$SearchHouseholdsByProximityEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchHouseholdsByTagEventCopyWith<$Res> {
  factory _$$SearchHouseholdsByTagEventCopyWith(
          _$SearchHouseholdsByTagEvent value,
          $Res Function(_$SearchHouseholdsByTagEvent) then) =
      __$$SearchHouseholdsByTagEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String tag, String projectId});
}

/// @nodoc
class __$$SearchHouseholdsByTagEventCopyWithImpl<$Res>
    extends _$SearchHouseholdsEventCopyWithImpl<$Res,
        _$SearchHouseholdsByTagEvent>
    implements _$$SearchHouseholdsByTagEventCopyWith<$Res> {
  __$$SearchHouseholdsByTagEventCopyWithImpl(
      _$SearchHouseholdsByTagEvent _value,
      $Res Function(_$SearchHouseholdsByTagEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? projectId = null,
  }) {
    return _then(_$SearchHouseholdsByTagEvent(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchHouseholdsByTagEvent implements SearchHouseholdsByTagEvent {
  const _$SearchHouseholdsByTagEvent(
      {required this.tag, required this.projectId});

  @override
  final String tag;
  @override
  final String projectId;

  @override
  String toString() {
    return 'SearchHouseholdsEvent.searchByTag(tag: $tag, projectId: $projectId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHouseholdsByTagEvent &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tag, projectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchHouseholdsByTagEventCopyWith<_$SearchHouseholdsByTagEvent>
      get copyWith => __$$SearchHouseholdsByTagEventCopyWithImpl<
          _$SearchHouseholdsByTagEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)
        searchByHousehold,
    required TResult Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
  }) {
    return searchByTag(tag, projectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)?
        searchByHousehold,
    TResult? Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
  }) {
    return searchByTag?.call(tag, projectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)?
        searchByHousehold,
    TResult Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (searchByTag != null) {
      return searchByTag(tag, projectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchHouseholdsInitializedEvent value)
        initialize,
    required TResult Function(SearchHouseholdsByHouseholdsEvent value)
        searchByHousehold,
    required TResult Function(SearchHouseholdsSearchByHouseholdHeadEvent value)
        searchByHouseholdHead,
    required TResult Function(SearchHouseholdsByProximityEvent value)
        searchByProximity,
    required TResult Function(SearchHouseholdsByTagEvent value) searchByTag,
    required TResult Function(SearchHouseholdsClearEvent value) clear,
  }) {
    return searchByTag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchHouseholdsInitializedEvent value)? initialize,
    TResult? Function(SearchHouseholdsByHouseholdsEvent value)?
        searchByHousehold,
    TResult? Function(SearchHouseholdsSearchByHouseholdHeadEvent value)?
        searchByHouseholdHead,
    TResult? Function(SearchHouseholdsByProximityEvent value)?
        searchByProximity,
    TResult? Function(SearchHouseholdsByTagEvent value)? searchByTag,
    TResult? Function(SearchHouseholdsClearEvent value)? clear,
  }) {
    return searchByTag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchHouseholdsInitializedEvent value)? initialize,
    TResult Function(SearchHouseholdsByHouseholdsEvent value)?
        searchByHousehold,
    TResult Function(SearchHouseholdsSearchByHouseholdHeadEvent value)?
        searchByHouseholdHead,
    TResult Function(SearchHouseholdsByProximityEvent value)? searchByProximity,
    TResult Function(SearchHouseholdsByTagEvent value)? searchByTag,
    TResult Function(SearchHouseholdsClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (searchByTag != null) {
      return searchByTag(this);
    }
    return orElse();
  }
}

abstract class SearchHouseholdsByTagEvent implements SearchHouseholdsEvent {
  const factory SearchHouseholdsByTagEvent(
      {required final String tag,
      required final String projectId}) = _$SearchHouseholdsByTagEvent;

  String get tag;
  String get projectId;
  @JsonKey(ignore: true)
  _$$SearchHouseholdsByTagEventCopyWith<_$SearchHouseholdsByTagEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchHouseholdsClearEventCopyWith<$Res> {
  factory _$$SearchHouseholdsClearEventCopyWith(
          _$SearchHouseholdsClearEvent value,
          $Res Function(_$SearchHouseholdsClearEvent) then) =
      __$$SearchHouseholdsClearEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchHouseholdsClearEventCopyWithImpl<$Res>
    extends _$SearchHouseholdsEventCopyWithImpl<$Res,
        _$SearchHouseholdsClearEvent>
    implements _$$SearchHouseholdsClearEventCopyWith<$Res> {
  __$$SearchHouseholdsClearEventCopyWithImpl(
      _$SearchHouseholdsClearEvent _value,
      $Res Function(_$SearchHouseholdsClearEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchHouseholdsClearEvent implements SearchHouseholdsClearEvent {
  const _$SearchHouseholdsClearEvent();

  @override
  String toString() {
    return 'SearchHouseholdsEvent.clear()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHouseholdsClearEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)
        searchByHousehold,
    required TResult Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)?
        searchByHousehold,
    TResult? Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            String projectId,
            double? latitude,
            double? longitude,
            double? maxRadius,
            bool isProximityEnabled,
            HouseholdModel householdModel)?
        searchByHousehold,
    TResult Function(
            String searchText,
            String projectId,
            bool isProximityEnabled,
            double? latitude,
            double? longitude,
            double? maxRadius)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchHouseholdsInitializedEvent value)
        initialize,
    required TResult Function(SearchHouseholdsByHouseholdsEvent value)
        searchByHousehold,
    required TResult Function(SearchHouseholdsSearchByHouseholdHeadEvent value)
        searchByHouseholdHead,
    required TResult Function(SearchHouseholdsByProximityEvent value)
        searchByProximity,
    required TResult Function(SearchHouseholdsByTagEvent value) searchByTag,
    required TResult Function(SearchHouseholdsClearEvent value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchHouseholdsInitializedEvent value)? initialize,
    TResult? Function(SearchHouseholdsByHouseholdsEvent value)?
        searchByHousehold,
    TResult? Function(SearchHouseholdsSearchByHouseholdHeadEvent value)?
        searchByHouseholdHead,
    TResult? Function(SearchHouseholdsByProximityEvent value)?
        searchByProximity,
    TResult? Function(SearchHouseholdsByTagEvent value)? searchByTag,
    TResult? Function(SearchHouseholdsClearEvent value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchHouseholdsInitializedEvent value)? initialize,
    TResult Function(SearchHouseholdsByHouseholdsEvent value)?
        searchByHousehold,
    TResult Function(SearchHouseholdsSearchByHouseholdHeadEvent value)?
        searchByHouseholdHead,
    TResult Function(SearchHouseholdsByProximityEvent value)? searchByProximity,
    TResult Function(SearchHouseholdsByTagEvent value)? searchByTag,
    TResult Function(SearchHouseholdsClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class SearchHouseholdsClearEvent implements SearchHouseholdsEvent {
  const factory SearchHouseholdsClearEvent() = _$SearchHouseholdsClearEvent;
}

/// @nodoc
mixin _$SearchHouseholdsState {
  bool get loading => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  List<HouseholdMemberWrapper> get householdMembers =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchHouseholdsStateCopyWith<SearchHouseholdsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchHouseholdsStateCopyWith<$Res> {
  factory $SearchHouseholdsStateCopyWith(SearchHouseholdsState value,
          $Res Function(SearchHouseholdsState) then) =
      _$SearchHouseholdsStateCopyWithImpl<$Res, SearchHouseholdsState>;
  @useResult
  $Res call(
      {bool loading,
      String? searchQuery,
      String? tag,
      List<HouseholdMemberWrapper> householdMembers});
}

/// @nodoc
class _$SearchHouseholdsStateCopyWithImpl<$Res,
        $Val extends SearchHouseholdsState>
    implements $SearchHouseholdsStateCopyWith<$Res> {
  _$SearchHouseholdsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? searchQuery = freezed,
    Object? tag = freezed,
    Object? householdMembers = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      householdMembers: null == householdMembers
          ? _value.householdMembers
          : householdMembers // ignore: cast_nullable_to_non_nullable
              as List<HouseholdMemberWrapper>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchHouseholdsStateCopyWith<$Res>
    implements $SearchHouseholdsStateCopyWith<$Res> {
  factory _$$_SearchHouseholdsStateCopyWith(_$_SearchHouseholdsState value,
          $Res Function(_$_SearchHouseholdsState) then) =
      __$$_SearchHouseholdsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      String? searchQuery,
      String? tag,
      List<HouseholdMemberWrapper> householdMembers});
}

/// @nodoc
class __$$_SearchHouseholdsStateCopyWithImpl<$Res>
    extends _$SearchHouseholdsStateCopyWithImpl<$Res, _$_SearchHouseholdsState>
    implements _$$_SearchHouseholdsStateCopyWith<$Res> {
  __$$_SearchHouseholdsStateCopyWithImpl(_$_SearchHouseholdsState _value,
      $Res Function(_$_SearchHouseholdsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? searchQuery = freezed,
    Object? tag = freezed,
    Object? householdMembers = null,
  }) {
    return _then(_$_SearchHouseholdsState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      householdMembers: null == householdMembers
          ? _value._householdMembers
          : householdMembers // ignore: cast_nullable_to_non_nullable
              as List<HouseholdMemberWrapper>,
    ));
  }
}

/// @nodoc

class _$_SearchHouseholdsState extends _SearchHouseholdsState {
  const _$_SearchHouseholdsState(
      {this.loading = false,
      this.searchQuery,
      this.tag,
      final List<HouseholdMemberWrapper> householdMembers = const []})
      : _householdMembers = householdMembers,
        super._();

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? searchQuery;
  @override
  final String? tag;
  final List<HouseholdMemberWrapper> _householdMembers;
  @override
  @JsonKey()
  List<HouseholdMemberWrapper> get householdMembers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_householdMembers);
  }

  @override
  String toString() {
    return 'SearchHouseholdsState(loading: $loading, searchQuery: $searchQuery, tag: $tag, householdMembers: $householdMembers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchHouseholdsState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            const DeepCollectionEquality()
                .equals(other._householdMembers, _householdMembers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, searchQuery, tag,
      const DeepCollectionEquality().hash(_householdMembers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchHouseholdsStateCopyWith<_$_SearchHouseholdsState> get copyWith =>
      __$$_SearchHouseholdsStateCopyWithImpl<_$_SearchHouseholdsState>(
          this, _$identity);
}

abstract class _SearchHouseholdsState extends SearchHouseholdsState {
  const factory _SearchHouseholdsState(
          {final bool loading,
          final String? searchQuery,
          final String? tag,
          final List<HouseholdMemberWrapper> householdMembers}) =
      _$_SearchHouseholdsState;
  const _SearchHouseholdsState._() : super._();

  @override
  bool get loading;
  @override
  String? get searchQuery;
  @override
  String? get tag;
  @override
  List<HouseholdMemberWrapper> get householdMembers;
  @override
  @JsonKey(ignore: true)
  _$$_SearchHouseholdsStateCopyWith<_$_SearchHouseholdsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HouseholdMemberWrapper {
  HouseholdModel get household => throw _privateConstructorUsedError;
  IndividualModel get headOfHousehold => throw _privateConstructorUsedError;
  List<IndividualModel> get members => throw _privateConstructorUsedError;
  List<ProjectBeneficiaryModel> get projectBeneficiaries =>
      throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  List<TaskModel>? get tasks => throw _privateConstructorUsedError;
  List<SideEffectModel>? get sideEffects => throw _privateConstructorUsedError;
  List<ReferralModel>? get referrals => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HouseholdMemberWrapperCopyWith<HouseholdMemberWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdMemberWrapperCopyWith<$Res> {
  factory $HouseholdMemberWrapperCopyWith(HouseholdMemberWrapper value,
          $Res Function(HouseholdMemberWrapper) then) =
      _$HouseholdMemberWrapperCopyWithImpl<$Res, HouseholdMemberWrapper>;
  @useResult
  $Res call(
      {HouseholdModel household,
      IndividualModel headOfHousehold,
      List<IndividualModel> members,
      List<ProjectBeneficiaryModel> projectBeneficiaries,
      double? distance,
      List<TaskModel>? tasks,
      List<SideEffectModel>? sideEffects,
      List<ReferralModel>? referrals});
}

/// @nodoc
class _$HouseholdMemberWrapperCopyWithImpl<$Res,
        $Val extends HouseholdMemberWrapper>
    implements $HouseholdMemberWrapperCopyWith<$Res> {
  _$HouseholdMemberWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? household = null,
    Object? headOfHousehold = null,
    Object? members = null,
    Object? projectBeneficiaries = null,
    Object? distance = freezed,
    Object? tasks = freezed,
    Object? sideEffects = freezed,
    Object? referrals = freezed,
  }) {
    return _then(_value.copyWith(
      household: null == household
          ? _value.household
          : household // ignore: cast_nullable_to_non_nullable
              as HouseholdModel,
      headOfHousehold: null == headOfHousehold
          ? _value.headOfHousehold
          : headOfHousehold // ignore: cast_nullable_to_non_nullable
              as IndividualModel,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<IndividualModel>,
      projectBeneficiaries: null == projectBeneficiaries
          ? _value.projectBeneficiaries
          : projectBeneficiaries // ignore: cast_nullable_to_non_nullable
              as List<ProjectBeneficiaryModel>,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      sideEffects: freezed == sideEffects
          ? _value.sideEffects
          : sideEffects // ignore: cast_nullable_to_non_nullable
              as List<SideEffectModel>?,
      referrals: freezed == referrals
          ? _value.referrals
          : referrals // ignore: cast_nullable_to_non_nullable
              as List<ReferralModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HouseholdMemberWrapperCopyWith<$Res>
    implements $HouseholdMemberWrapperCopyWith<$Res> {
  factory _$$_HouseholdMemberWrapperCopyWith(_$_HouseholdMemberWrapper value,
          $Res Function(_$_HouseholdMemberWrapper) then) =
      __$$_HouseholdMemberWrapperCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HouseholdModel household,
      IndividualModel headOfHousehold,
      List<IndividualModel> members,
      List<ProjectBeneficiaryModel> projectBeneficiaries,
      double? distance,
      List<TaskModel>? tasks,
      List<SideEffectModel>? sideEffects,
      List<ReferralModel>? referrals});
}

/// @nodoc
class __$$_HouseholdMemberWrapperCopyWithImpl<$Res>
    extends _$HouseholdMemberWrapperCopyWithImpl<$Res,
        _$_HouseholdMemberWrapper>
    implements _$$_HouseholdMemberWrapperCopyWith<$Res> {
  __$$_HouseholdMemberWrapperCopyWithImpl(_$_HouseholdMemberWrapper _value,
      $Res Function(_$_HouseholdMemberWrapper) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? household = null,
    Object? headOfHousehold = null,
    Object? members = null,
    Object? projectBeneficiaries = null,
    Object? distance = freezed,
    Object? tasks = freezed,
    Object? sideEffects = freezed,
    Object? referrals = freezed,
  }) {
    return _then(_$_HouseholdMemberWrapper(
      household: null == household
          ? _value.household
          : household // ignore: cast_nullable_to_non_nullable
              as HouseholdModel,
      headOfHousehold: null == headOfHousehold
          ? _value.headOfHousehold
          : headOfHousehold // ignore: cast_nullable_to_non_nullable
              as IndividualModel,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<IndividualModel>,
      projectBeneficiaries: null == projectBeneficiaries
          ? _value._projectBeneficiaries
          : projectBeneficiaries // ignore: cast_nullable_to_non_nullable
              as List<ProjectBeneficiaryModel>,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      sideEffects: freezed == sideEffects
          ? _value._sideEffects
          : sideEffects // ignore: cast_nullable_to_non_nullable
              as List<SideEffectModel>?,
      referrals: freezed == referrals
          ? _value._referrals
          : referrals // ignore: cast_nullable_to_non_nullable
              as List<ReferralModel>?,
    ));
  }
}

/// @nodoc

class _$_HouseholdMemberWrapper implements _HouseholdMemberWrapper {
  const _$_HouseholdMemberWrapper(
      {required this.household,
      required this.headOfHousehold,
      required final List<IndividualModel> members,
      required final List<ProjectBeneficiaryModel> projectBeneficiaries,
      this.distance,
      final List<TaskModel>? tasks,
      final List<SideEffectModel>? sideEffects,
      final List<ReferralModel>? referrals})
      : _members = members,
        _projectBeneficiaries = projectBeneficiaries,
        _tasks = tasks,
        _sideEffects = sideEffects,
        _referrals = referrals;

  @override
  final HouseholdModel household;
  @override
  final IndividualModel headOfHousehold;
  final List<IndividualModel> _members;
  @override
  List<IndividualModel> get members {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<ProjectBeneficiaryModel> _projectBeneficiaries;
  @override
  List<ProjectBeneficiaryModel> get projectBeneficiaries {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectBeneficiaries);
  }

  @override
  final double? distance;
  final List<TaskModel>? _tasks;
  @override
  List<TaskModel>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SideEffectModel>? _sideEffects;
  @override
  List<SideEffectModel>? get sideEffects {
    final value = _sideEffects;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ReferralModel>? _referrals;
  @override
  List<ReferralModel>? get referrals {
    final value = _referrals;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HouseholdMemberWrapper(household: $household, headOfHousehold: $headOfHousehold, members: $members, projectBeneficiaries: $projectBeneficiaries, distance: $distance, tasks: $tasks, sideEffects: $sideEffects, referrals: $referrals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HouseholdMemberWrapper &&
            (identical(other.household, household) ||
                other.household == household) &&
            (identical(other.headOfHousehold, headOfHousehold) ||
                other.headOfHousehold == headOfHousehold) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality()
                .equals(other._projectBeneficiaries, _projectBeneficiaries) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._sideEffects, _sideEffects) &&
            const DeepCollectionEquality()
                .equals(other._referrals, _referrals));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      household,
      headOfHousehold,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_projectBeneficiaries),
      distance,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_sideEffects),
      const DeepCollectionEquality().hash(_referrals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HouseholdMemberWrapperCopyWith<_$_HouseholdMemberWrapper> get copyWith =>
      __$$_HouseholdMemberWrapperCopyWithImpl<_$_HouseholdMemberWrapper>(
          this, _$identity);
}

abstract class _HouseholdMemberWrapper implements HouseholdMemberWrapper {
  const factory _HouseholdMemberWrapper(
      {required final HouseholdModel household,
      required final IndividualModel headOfHousehold,
      required final List<IndividualModel> members,
      required final List<ProjectBeneficiaryModel> projectBeneficiaries,
      final double? distance,
      final List<TaskModel>? tasks,
      final List<SideEffectModel>? sideEffects,
      final List<ReferralModel>? referrals}) = _$_HouseholdMemberWrapper;

  @override
  HouseholdModel get household;
  @override
  IndividualModel get headOfHousehold;
  @override
  List<IndividualModel> get members;
  @override
  List<ProjectBeneficiaryModel> get projectBeneficiaries;
  @override
  double? get distance;
  @override
  List<TaskModel>? get tasks;
  @override
  List<SideEffectModel>? get sideEffects;
  @override
  List<ReferralModel>? get referrals;
  @override
  @JsonKey(ignore: true)
  _$$_HouseholdMemberWrapperCopyWith<_$_HouseholdMemberWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}
